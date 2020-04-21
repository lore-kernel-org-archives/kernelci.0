Return-Path: <dan.rue@linaro.org>
Date: Tue, 21 Apr 2020 12:28:48 -0500
From: "Dan Rue" <dan.rue@linaro.org>
Subject: Re: kci_build proposal
Message-ID: <20200421172848.ko5ydgus5nyp3blw@xps.therub.org>
References: <20200420163628.wmbc7f7vuvqsbdhw@xps.therub.org>
 <CAH1_8nBL+YSnmWyEkV336+wkq4YP=pHs1srUNxUZ_zhGxOe45Q@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAH1_8nBL+YSnmWyEkV336+wkq4YP=pHs1srUNxUZ_zhGxOe45Q@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-ID: <kernelci.groups.io>
To: Guillaume Tucker <guillaume.tucker@gmail.com>
Cc: kernelci@groups.io

On Tue, Apr 21, 2020 at 04:46:34PM +0100, Guillaume Tucker wrote:
> On Mon, Apr 20, 2020 at 5:36 PM Dan Rue <dan.rue@linaro.org> wrote:
> 
> > Hey Everyone!
> >
> 
> Nice to have you back on the mailing list :)
> 
> 
> > I've been working on a kernel building service/api that's designed to
> > perform
> > massive numbers of builds. The actual kernel build implementation reuses
> > kernelci's kci_build script.
> >
> 
> Out of interest, how do you manage the builders?
> 
> We're looking into Kubernetes now so we might find issues similar
> to those in your use-case.

We have built a custom cloud-native service to do linux kernel builds
which has a public API. It's still in limited beta mode but we have a
number of users, including LKFT, that rely on it. I think it probably
could be usable by kernelci, because the build implementation is very
similar, and it's designed for scale.

> 
> 
> > So far we have not had to modify kernelci-core's kci_build, but we're
> > approaching a point where we think we're going to have to modify it
> > fundamentally to meet our needs. I would really like to continue sharing a
> > build implementation with kernelci, but some of the changes needed are
> > architectural in nature, and so I'd like to share a brief proposal for
> > consideration:
> >
> > Standalone python-based kernel builder with the following properties:
> > - Independent python package (library and cli) that only does a local
> > kernel
> >   build
> >
> 
> Yes - see my more detailed reply further down.
> 
> 
> > - Takes as arguments things like architecture, toolchain, kernel config,
> > etc.
> > - Dockerzed toolchain environments are supported directly (e.g. it will run
> >   "docker run make")
> > - Builds are done within the context of an existing kernel tree (doing git
> >   checkout, git fetch, etc are out of scope)
> > - Artifacts go to some named or default directory path. Uploading them
> >   elsewhere is out of scope.
> > - Exception handling is built in and makes it usable as a python library
> > - Logging is built in with flexibility in mind (log to console, verbose or
> >   silent, log to file, etc.)
> > - Simple, one-line dockerized reproducers are given as a build artifact,
> > for
> >   reproducing builds locally.
> > - Partial build failure support - e.g. what if kselftest fails but the
> > rest of
> >   the build passes?
> >
> 
> Another "out of interest" question: have you modified kci_build
> already to cover kselftest?
> 
> We have an open PR for that, if you're already using something in
> production then it would be worth comparing what you've come up
> with.

No, we haven't implemented kselftest yet either. It's not easy because
of the reasons I'll get into below.

> 
> 
> > - Rigorous unit testing
> > - Implementation is modular enough to support things like a documentation
> > build
> >   and other targets in the tree such as various tools/, sparse checker,
> >   coccinelle, etc.
> >
> 
> Yes, however we need to draw the line somewhere.  I guess that
> would be, anything that can already be built from a plain kernel
> source tree.

I agree that it should be restricted to things in the kernel tree; but
that is a huge surface area that requires a certain robustness in the
builder architecture to be able to support so many different targets.

For example, let's take kselftest's case (PR #339) - it gets the job
done, but if it fails the whole build fails. That's probably correct in
a strict sense, but what if you are building 10 additional targets - do
you really want the whole build to fail if any one fails? In reality, we
need to be able to deal with a failure in one part of the tree without
blocking testing of the rest of the tree.

e.g. recently -next was broken for syzkaller and lkft, but for different
reasons. In LKFT's case, it was merely because the perf build failed,
and caused the entire kernel build to fail. As a result, we had a
multi-week gap in data and once perf was fixed, we had a backlog of
problems to deal with.

Different targets also have different build-time requirements. Things
like the documentation build could have a specific container because of
its specific requirements, rather than putting all requirements for
every target into every build container.

> 
> 
> > - Support for kernel fragement files or urls in addition to supporting
> >   individual kernel config arguments
> >
> > Use Case Examples:
> > - Install using pip, build using the cli interface
> >   - "pip install --user kernel-builder; cd linux; kernel-builder --arch
> > arm64 --toolchain clang-9"
> > - Run using a published docker container. This example would need
> > permission to
> >   launch additional docker containers to perform the build steps.
> >   - "docker run kernel-builder --arch arm64 --toolchain clang-9"
> > - Install using pip, and use it from python as a library
> >   - "import kernel-builder"
> >
> > In the example above, "kernel-builder" is a placeholder for whatever the
> > name
> > would be.
> >
> > The artifacts produced would be similar to the set of artifacts kci_build
> > produces today, with the addition of a build reproducer script and probably
> > some differences in metadata files.
> >
> > Docker support would be optional (you could use a locally installed
> > toolchain),
> > but allows for arbitrary toolchains to be available and perfect
> > reproducibility.
> >
> 
> I agree that we need to have a way to fully reproduce builds and
> that includes having control over the environment, typically a
> Docker image.  However, I'm a bit skeptical about making the tool
> call Docker rather than have a wrapper to call it.  I think it's
> more a matter of hierarchy in the stack, I see it as:
> 
>   docker -> kernel-builder -> make -> gcc
> 
> Say, what if someone wanted to use another environment than
> Docker?  Rather than make it an optional feature, I think it may
> be better to keep it one level higher if we can still generate
> reproducers like you're suggesting.

Aye. This is what caused me to end up here in the first place.

What we did is we wrapped kci_build like the following:

kci_build_wrapper -> docker -> kci_build -> make -> gcc.

Because there's "docker" in between our python wrapper and the kci_build
implementation, the interface is subprocess() rather than python. And,
the containers need python and any other kci_build run-time requirements
installed, even if they're not needed to build the kernel.

One consequence of this is it's really hard for example to tell if a
kernel build failed or if the defconfig failed to build, because they're
both done in kci_build build_kernel. The wrapper just sees a bad exit
code from kci_build and has to try to figure out what went wrong.

So why not move the wrapper into the container then? Then the containers
would also need any additional run-time requirements of the wrapper,
which also have nothing to do with building kernels. I don't think it's
correct to install e.g. boto3 into a linux kernel toolchain container,
and it makes the containers themselves non-portable.

If the containers' responsibility were to only contain the things
necessary to perform the kernel build, then their implementation,
hosting, etc could be shared.

Another problem is user runtime when trying to reproduce builds. You
have to either publish linux kernel toolchain containers with the
"kernel-builder" inside it, or you have to explain to users how to
mount/copy it in, or you have to do reproducers without kernel-builder
(which makes it a much harder problem). If kernel-builder is inside, now
you have a container versioning problem because both the toolchain
version and the kernel-builder version matter; which is to say, they
should be separate containers each with their own versioning.

Finally, I'll say that it's possible but not easy to reuse kci_build as
it is today - in part because it leaves docker as an exercise for the
user. Getting it into a container, getting the python paths correct, and
dealing with the yaml files are barriers to entry for casual users.

So, the options for keeping kernel-builder unaware of docker are all
suboptimal. Trust me, I would have much preferred a workaround to what
I'm proposing here.

> 
> 
> > It's hard to change kci_build to be anything like this because it's tightly
> > coupled with the kernelci-core repo, and kernelci itself. The design above
> > also
> > fundamentally changes how the builder interfaces with docker, such that it
> > becomes supported directly rather than something that's implemented
> > outside the
> > scope of the builder.
> >
> > It's important that docker is supported directly because it makes the
> > reproducible build use-case a one-liner, it solves the problem of having
> > to get
> > python and the builder into the build containers, and it allows for more
> > granular control of the build.
> >
> > So, thoughts? How close or how far is this from the roadmap for kci_build
> > as it
> > stands today? We are likely to start working on this soon, and would really
> > like to work together on it if possible.
> >
> 
> Above all, thanks for the detailed proposal and for collaborating
> on a common kernel build utility to share with KernelCI.  What
> you're suggesting makes a lot of sense to me, and it's broadly in
> line with where kernelci-core is going.
> 
> The initial goal of kernelci-core was to decouple the KernelCI
> steps from Jenkins or any other execution environment.  It has
> succeeded in this respect as it's now possible to do everything
> on the command line or in other systems such as Gitlab CI, and
> you've been able to reuse kci_build too.  I think it is important
> that we keep a central repository with the KernelCI specific
> orchestration logic and tools to handle configuration.  That
> should become a proper "kernelci" Python package at some point,
> when the repository has completed its transition.
> 
> Now, this kernelci package should ideally be a very thin layer to
> just link components together and create pipeline steps.  What I
> think we should have next is a toolbox of low-level stand-alone
> packages that specialise in only one task, and I believe this is
> where it would meet your use-case.  For example, I started
> working on the "scalpel" tool last year to do bisections with the
> aim of making it independent of KernelCI.  Now I guess we need
> another tool to do kernel builds following the same approach,
> maybe call it "spanner" or something constructive like that :)
> 
> That way, we may even keep kci_build with its current cli but
> rather than have all the build steps in kernelci/build.py it
> would be importing a common module (say, toolbox.spanner for the
> sake of the argument) and your build service would be doing that
> too.  Or there would also be some command line tool provided with
> the package to run a build directly.

I agree with most of that - kci_build stays as is but eventually uses
some external build library rather than most of what's in build.py
today.

I'm not sure what you mean about the notion of a "toolbox"? I would make
the kernel build implementation totally independent of any other tools,
rather than trying to co-locate them in the same python package/git repo
(if that's what you meant).

> 
> Basically, rather than adapting kci_build for other purposes, I'm
> suggesting to create a generic tool that can be used by kci_build
> as well as any other kernel CI system.
> 
> I don't know how to call this toolbox and where to host it, but
> it would seem wise imho to keep it separate from KernelCI, LKFT
> or any other CI system that would be using it.  It would probably
> also make sense to at least keep it kernel-centric to focus on a
> group of use-cases.  How does that sound?

If there's agreement to do this together with kernelci, which I'm really
happy about, then I propose it be something like
github.com/kernelci/<somename>, where somename is available in the pypi
namespace (spanner isn't).

I think our requirements are largely the same. We do need to decide
about the docker bits, and about how opinionated the tool should be.

If there's wide agreement then we could establish such a repository and
start iterating on a design document. I have someone available to start
working on the actual implementation in a few weeks.

There are other details to discuss, like how to deal with config (we had
to do a bit of a workaround for it outside of kci_build), licensing,
etc.

> 
> If you agree with this approach, the next steps would be to find
> the least common denominator between the use-cases that we
> already know about, which I guess are KernelCI and LKFT.  I think
> it's largely doable, with probably some compromises on all parts
> and some built-in flexibility to make this a truly generic tool.
> The details of how to build each artifact, how to use containers,
> and the format of the meta-data are probably areas where we may
> need some custom code to do slightly different things.  But this
> is like any software library, and it can be done iteratively.

Yea - the nice thing is that if it's usable as a library or a cli, it's
easy to wrap and transform things like metadata into different use-cases
to maintain backward compatibility.

> 
> Best wishes,
> Guillaume

-- 
Linaro LKFT
https://lkft.linaro.org
