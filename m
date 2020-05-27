Return-Path: <dan.rue@linaro.org>
Date: Wed, 27 May 2020 14:58:31 -0500
From: "Dan Rue" <dan.rue@linaro.org>
Subject: Re: kci_build proposal
Message-ID: <20200527195831.nl2ptfjlcfkh4tyb@xps.therub.org>
References: <20200420163628.wmbc7f7vuvqsbdhw@xps.therub.org>
 <CAH1_8nBL+YSnmWyEkV336+wkq4YP=pHs1srUNxUZ_zhGxOe45Q@mail.gmail.com>
 <20200421172848.ko5ydgus5nyp3blw@xps.therub.org>
 <7himgn7rty.fsf@baylibre.com>
MIME-Version: 1.0
In-Reply-To: <7himgn7rty.fsf@baylibre.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-ID: <kernelci.groups.io>
To: Kevin Hilman <khilman@baylibre.com>
Cc: kernelci@groups.io, Guillaume Tucker <guillaume.tucker@gmail.com>

On Fri, May 22, 2020 at 11:22:17AM -0700, Kevin Hilman wrote:
> "Dan Rue" <dan.rue@linaro.org> writes:
> 
> > On Tue, Apr 21, 2020 at 04:46:34PM +0100, Guillaume Tucker wrote:
> >> On Mon, Apr 20, 2020 at 5:36 PM Dan Rue <dan.rue@linaro.org> wrote:
> 
> [...]
> 
> >> Basically, rather than adapting kci_build for other purposes, I'm
> >> suggesting to create a generic tool that can be used by kci_build
> >> as well as any other kernel CI system.
> >> 
> >> I don't know how to call this toolbox and where to host it, but
> >> it would seem wise imho to keep it separate from KernelCI, LKFT
> >> or any other CI system that would be using it.  It would probably
> >> also make sense to at least keep it kernel-centric to focus on a
> >> group of use-cases.  How does that sound?
> >
> > If there's agreement to do this together with kernelci, which I'm really
> > happy about, then I propose it be something like
> > github.com/kernelci/<somename>, where somename is available in the pypi
> > namespace (spanner isn't).
> >
> > I think our requirements are largely the same. We do need to decide
> > about the docker bits, and about how opinionated the tool should be.
> 
> Having spent the last few weeks getting the existing kci_build working
> in k8s environment[1], I think how docker/containers fits in here is the
> key thing we should agree upon.
> 
> For the initial k8s migration, I started with the requirement to use
> kci_build as-is, but some of the issues Dan raised are already issues
> with the k8s build e.g. non-trivial to discover which part of the build
> failed (and if it's critical or not.)
> 
> I'm fully supportive rethinking/reworking this tool to be cloud-native.
> I would also add we also need to be intentional about how
> artifacts/results are passed between the various phases so we build
> flexible piplines that fit into a variety of CI/CD pipeline tools (I'd
> really like to find someone with the time explore reworking our jenkins
> pipline into tekton[2])

Hi Kevin!

OK, we've started to put some thoughts together on an implementation at
https://gitlab.com/Linaro/tuxmake.

Some of the details are still a bit preliminary, but we plan to start on
it soon and get the basic interface and use-cases in place.

Would the design meet your needs? If you have any feedback, we would
really appreciate it. I'm really not sure how it would fit in with k8s,
but I anticipate if it were used as a python library there would be a
lot of fine grained control of the steps.

We hope that this would be useful for kernelci and tuxbuild projects as
a library, but also for kernel engineers to be able to more easily
perform and reproduce a variety of builds locally using the cli.

> 
> > If there's wide agreement then we could establish such a repository and
> > start iterating on a design document. I have someone available to start
> > working on the actual implementation in a few weeks.
> >
> > There are other details to discuss, like how to deal with config (we had
> > to do a bit of a workaround for it outside of kci_build), licensing,
> > etc.
> 
> I propose that we we dedicate one of our tuesday weekly calls to this
> topic.  Would Tues, June 2nd work?

I can make that work,

Thanks,
Dan

> 
> Kevin
> 
> [1] https://github.com/kernelci/kernelci-core/pull/366/commits/4ec097537de61fa8a4f6de4fe9c1cf6b26f6ac04
> [2] https://tekton.dev/

-- 
Linaro LKFT
https://lkft.linaro.org
