Subject: Re: kci_build proposal
References: <20200420163628.wmbc7f7vuvqsbdhw@xps.therub.org>
 <CAH1_8nBL+YSnmWyEkV336+wkq4YP=pHs1srUNxUZ_zhGxOe45Q@mail.gmail.com>
 <20200421172848.ko5ydgus5nyp3blw@xps.therub.org>
 <7himgn7rty.fsf@baylibre.com>
 <20200527195831.nl2ptfjlcfkh4tyb@xps.therub.org>
 <77677a1d-1862-408d-9169-c92eb4f81066@collabora.com>
 <20200528172824.rwk5lj3ybhhymwdm@xps.therub.org>
From: "Guillaume Tucker" <guillaume.tucker@collabora.com>
Message-ID: <22a9d522-4777-741d-74c9-f3f86ed3422b@collabora.com>
Date: Thu, 28 May 2020 22:03:20 +0100
MIME-Version: 1.0
In-Reply-To: <20200528172824.rwk5lj3ybhhymwdm@xps.therub.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
List-ID: <kernelci.groups.io>
To: dan.rue@linaro.org
Cc: kernelci@groups.io, Kevin Hilman <khilman@baylibre.com>

On 28/05/2020 18:28, Dan Rue wrote:
> On Thu, May 28, 2020 at 07:43:40AM +0100, Guillaume Tucker wrote:
>> On 27/05/2020 20:58, Dan Rue wrote:
>>> On Fri, May 22, 2020 at 11:22:17AM -0700, Kevin Hilman wrote:
>>>> "Dan Rue" <dan.rue@linaro.org> writes:
>>>>
>>>>> On Tue, Apr 21, 2020 at 04:46:34PM +0100, Guillaume Tucker wrote:
>>>>>> On Mon, Apr 20, 2020 at 5:36 PM Dan Rue <dan.rue@linaro.org> wrote:
>>>>
>>>> [...]
>>>>
>>>>>> Basically, rather than adapting kci_build for other purposes, I'm
>>>>>> suggesting to create a generic tool that can be used by kci_build
>>>>>> as well as any other kernel CI system.
>>>>>>
>>>>>> I don't know how to call this toolbox and where to host it, but
>>>>>> it would seem wise imho to keep it separate from KernelCI, LKFT
>>>>>> or any other CI system that would be using it.  It would probably
>>>>>> also make sense to at least keep it kernel-centric to focus on a
>>>>>> group of use-cases.  How does that sound?
>>>>>
>>>>> If there's agreement to do this together with kernelci, which I'm really
>>>>> happy about, then I propose it be something like
>>>>> github.com/kernelci/<somename>, where somename is available in the pypi
>>>>> namespace (spanner isn't).
>>>>>
>>>>> I think our requirements are largely the same. We do need to decide
>>>>> about the docker bits, and about how opinionated the tool should be.
>>>>
>>>> Having spent the last few weeks getting the existing kci_build working
>>>> in k8s environment[1], I think how docker/containers fits in here is the
>>>> key thing we should agree upon.
>>>>
>>>> For the initial k8s migration, I started with the requirement to use
>>>> kci_build as-is, but some of the issues Dan raised are already issues
>>>> with the k8s build e.g. non-trivial to discover which part of the build
>>>> failed (and if it's critical or not.)
>>>>
>>>> I'm fully supportive rethinking/reworking this tool to be cloud-native.
>>>> I would also add we also need to be intentional about how
>>>> artifacts/results are passed between the various phases so we build
>>>> flexible piplines that fit into a variety of CI/CD pipeline tools (I'd
>>>> really like to find someone with the time explore reworking our jenkins
>>>> pipline into tekton[2])
>>
>> I think that passing artifacts between build stages is really
>> part of the pipeline integration work and shouldn't be imposed by
>> the tools.  The tools however should produce intermediary data
>> and files in a way that can be integrated into various pipelines
>> with different requirements.
>>
>> It seems we can improve this in kci_build by first generating a
>> JSON file with the static meta-data before starting a kernel
>> build, then the build would add to that data, then the install
>> step would add more data again.
>>
>> See also my comment below about having the ability to build
>> individual steps, which should help with error handling.
>>
>>> Hi Kevin!
>>>
>>> OK, we've started to put some thoughts together on an implementation at
>>> https://gitlab.com/Linaro/tuxmake.
>>>
>>> Some of the details are still a bit preliminary, but we plan to start on
>>> it soon and get the basic interface and use-cases in place.
>>>
>>> Would the design meet your needs? If you have any feedback, we would
>>> really appreciate it. I'm really not sure how it would fit in with k8s,
>>> but I anticipate if it were used as a python library there would be a
>>> lot of fine grained control of the steps.
>>
>> I still strongly believe that making the tool call Docker itself
>> is going to be a big issue - it should really be the other way
>> round, or at least there should be a way to run the kernel build
>> directly with an option to wrap it inside a Docker container at
>> the user's discretion.
> 
> I'll address this further down.
> 
>>
>> It's also important to have the possibility to run each
>> individual make command separately, to create the .config, build
>> the image, build the modules, the dtbs, or other arbitrary things
>> such as kselftest.  The current kci_build implementation does too
>> much already in the build_kernel() function, I've had to hack it
>> so many times to force it to not build modules...
> 
> We agree on this point - it should be possible as a cli and as a library
> to run each build command separately.
> 
> In the tuxmake readme, we have the following proposed to handle this
> (from a cli point of view):
> 
>     tuxmake --targets kernel,selftests,htmldocs
> 
> If --targets were specified, only those targets (and any dependent
> targets) would be called. If --targets is not specified,
> kernel+modules+dtbs (as applicable) would be built by default.
> 
> Config itself is a special case which I have some ideas for, but are not
> yet described in the readme.
> 
>>
>> About k8s, yes I agree a Python library should provide the
>> required flexibility.  It shouldn't need to have any "cloud"
>> special features as it's just one use-case among many.  The key
>> thing is to provide just enough added value without turning it
>> into a complete integration.  I guess one could see the stack as
>> follows:
>>
>>
>> user
>> ------------
>> environment
>> ------------
>> tuxmake
>> ------------
>> make
>> compiler
>> kernel source code
>>
>>
>> The "environment" can be a plain shell in a terminal, or in a
>> Docker container, which may be managed by Kubernetes, which may
>> have been started by Jenkins or Tekton or anything else.  By
>> keeping the environment as a higher-level entity in the stack we
>> also keep the tool (tuxmake) generic.
> 
> Either the environment needs to be aware of the tool, or the tool needs
> to be aware of the environment. Right now, our container environments
> are not generic because they have to have support for kci_build, for
> example, built in (python, required python modules, even jenkins
> requirements are leaking in). Someone else reusing the tools would have
> to bake their own dependencies in, making the environments non-portable.

What do you mean exactly by "our container environments"?  Are
they Docker containers used by LKFT?

> Worse, I'm really trying to focus on the kernel developer use-cases, and
> reproducing a kci_build today is non-trivial - largely because it's up
> to the user to perform multiple steps to get a container running, get
> their source code into the container, get kci_build into the container,
> and rerun the kernelci build.

That's right, kci_build is currently mostly designed to get
integrated into an automated build pipeline using say, Jenkins or
Gitlab CI.  We all know that having a way to wrap that in a
Docker call would make things easier for developers - and there's
nothing really hard about it.  We could for example have a "kci"
higher-level command which would act as a shell-oriented
integration to first pull a Docker image, then run some commands
inside it.  It could have one command for each step in a typical
automated pipeline: build, test, report...

> From a correctness point of view, a container that is designed to
> provide an environment for a kernel build should *only* contain things
> that are required by the kernel build itself.

I'm sorry but I really don't get what you mean here.  If you mean
that the container should only have the dependencies to be able
to run plain build commands such as "make defconfig && make",
then how can you have any tool on top of that?  Would it need to
be merged in the upstream kernel build system to satisfy your
criteria?

The README says "Requirements: python 3.6+, docker", so you
actually want to use Docker images but _still_ require users to
install a particular version of Python outside the container, and
tuxmake not depend on any other Python module?

> I believe there's an opportunity here to provide a layer of abstraction
> that makes build environments portable, and then builds themselves more
> portable - making it easier for more developers to do more build
> combinations more easily. Right now it's a hassle that every developer
> has to solve for themselves (or just not solve it). And if a developer
> finds a build problem, it may be difficult for another developer to
> reproduce the problem if it's environmental.

Sounds great, although I'm still struggling to understand how
you're proposing to achieve that in practice.

>>> We hope that this would be useful for kernelci and tuxbuild projects as
>>> a library, but also for kernel engineers to be able to more easily
>>> perform and reproduce a variety of builds locally using the cli.
>>
>> Err, do you want to call it tuxbuild or tuxmake? ;)
> 
> tuxbuild is a commercial build service and tuxmake is an open source
> build implementation. For what it's worth, I think kernelci should
> consider using tuxbuild; it's designed to be highly scalable (thousands
> of concurrent builds) and reliable, and would solve kernelci's build
> capacity problems. LKFT has been using it in production since January
> and it has reduced our build times dramatically.

OK, makes more sense now that I've read this:

  https://pypi.org/project/tuxbuild/

About using it in KernelCI, for sure there are lots of things we
could do to improve our build efficiency.  Being tied to a
particular service is probably not going to play out well though,
unless it's only an option when deploying instances (i.e. same as
we use Jenkins and now Kubernetes but don't require them etc...).

So assuming KernelCI could depend on tuxmake, and one possible
way to run it was via tuxbuild, then that might work.

Otherwise, importing tuxmake into kci_build would in theory be
fine as long as tuxmake does cover our use-case in practice.

>> I wonder if tuxmake would sound more like a lower-lavel "make"
>> tool, such as Ninja or Meson.  So tuxbuild is probably a bit
>> clearer in that it's about facilitating builds (i.e. above
>> the "make" layer in the stack...).
>>
>> You suggested to have a project under github.com/kernelci, which
>> I believe probably makes more sense if we want KernelCI to
>> provide a common set of tools for others to reuse (not being
>> biased at all here).  Or, we can do what I was trying to suggest
>> in my previous email and have a new "namespace" for these tools
>> that don't need to be associated with KernelCI, or LKFT or
>> anything else.
> 
> I don't think a new namespace is necessary. At this point, it's a Linaro
> project so I've put it there. We can re-assess as necessary but I don't
> think the location of the git repo is a critical factor at this point,
> nor is it necessarily permanent.

Right, sorry I was missing some background about tuxbuild.

The git URL obviously has very little significance, but the
organisation which has the destiny of the tool in its hands does.
If it's under /linaro, it's a Linaro tool, and obviously it will
at least appear to be designed for the very specific use-case
that is tuxbuild and LKFT:

  https://gitlab.com/Linaro/lkft/ci-scripts/-/blob/master/branch-gitlab-ci.yml#L52

>>>>> If there's wide agreement then we could establish such a repository and
>>>>> start iterating on a design document. I have someone available to start
>>>>> working on the actual implementation in a few weeks.
>>>>>
>>>>> There are other details to discuss, like how to deal with config (we had
>>>>> to do a bit of a workaround for it outside of kci_build), licensing,
>>>>> etc.

To clarify one thing, have you completely stopped using kci_build
with LKFT?

>>>> I propose that we we dedicate one of our tuesday weekly calls to this
>>>> topic.  Would Tues, June 2nd work?
>>>
>>> I can make that work,
>>
>> Well, the main topic for that meeting is going to be to review
>> the KernelCI plans for the next 3 months.  You're welcome to join
>> in any case, and if we don't spend too much time on the plan we
>> may have time to discuss that.  However, maybe we could aim for
>> the 9th instead?
> 
> I'm unavailable on the 9th and the 16th of June. Just ping me on irc
> if it ends up on the agenda.

OK let's catch up again by Monday at the latest.

Thanks,
Guillaume

>>>> [1] https://github.com/kernelci/kernelci-core/pull/366/commits/4ec097537de61fa8a4f6de4fe9c1cf6b26f6ac04
>>>> [2] https://tekton.dev/
