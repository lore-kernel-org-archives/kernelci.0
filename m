Return-Path: <khilman@baylibre.com>
From: "Kevin Hilman" <khilman@baylibre.com>
Subject: Re: kci_build proposal
In-Reply-To: <20200421172848.ko5ydgus5nyp3blw@xps.therub.org>
References: <20200420163628.wmbc7f7vuvqsbdhw@xps.therub.org> <CAH1_8nBL+YSnmWyEkV336+wkq4YP=pHs1srUNxUZ_zhGxOe45Q@mail.gmail.com> <20200421172848.ko5ydgus5nyp3blw@xps.therub.org>
Date: Fri, 22 May 2020 11:22:17 -0700
Message-ID: <7himgn7rty.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
List-ID: <kernelci.groups.io>
To: kernelci@groups.io, dan.rue@linaro.org, Guillaume Tucker <guillaume.tucker@gmail.com>

"Dan Rue" <dan.rue@linaro.org> writes:

> On Tue, Apr 21, 2020 at 04:46:34PM +0100, Guillaume Tucker wrote:
>> On Mon, Apr 20, 2020 at 5:36 PM Dan Rue <dan.rue@linaro.org> wrote:

[...]

>> Basically, rather than adapting kci_build for other purposes, I'm
>> suggesting to create a generic tool that can be used by kci_build
>> as well as any other kernel CI system.
>> 
>> I don't know how to call this toolbox and where to host it, but
>> it would seem wise imho to keep it separate from KernelCI, LKFT
>> or any other CI system that would be using it.  It would probably
>> also make sense to at least keep it kernel-centric to focus on a
>> group of use-cases.  How does that sound?
>
> If there's agreement to do this together with kernelci, which I'm really
> happy about, then I propose it be something like
> github.com/kernelci/<somename>, where somename is available in the pypi
> namespace (spanner isn't).
>
> I think our requirements are largely the same. We do need to decide
> about the docker bits, and about how opinionated the tool should be.

Having spent the last few weeks getting the existing kci_build working
in k8s environment[1], I think how docker/containers fits in here is the
key thing we should agree upon.

For the initial k8s migration, I started with the requirement to use
kci_build as-is, but some of the issues Dan raised are already issues
with the k8s build e.g. non-trivial to discover which part of the build
failed (and if it's critical or not.)

I'm fully supportive rethinking/reworking this tool to be cloud-native.
I would also add we also need to be intentional about how
artifacts/results are passed between the various phases so we build
flexible piplines that fit into a variety of CI/CD pipeline tools (I'd
really like to find someone with the time explore reworking our jenkins
pipline into tekton[2])

> If there's wide agreement then we could establish such a repository and
> start iterating on a design document. I have someone available to start
> working on the actual implementation in a few weeks.
>
> There are other details to discuss, like how to deal with config (we had
> to do a bit of a workaround for it outside of kci_build), licensing,
> etc.

I propose that we we dedicate one of our tuesday weekly calls to this
topic.  Would Tues, June 2nd work?

Kevin

[1] https://github.com/kernelci/kernelci-core/pull/366/commits/4ec097537de61fa8a4f6de4fe9c1cf6b26f6ac04
[2] https://tekton.dev/
