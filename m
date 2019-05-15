Return-Path: <dan.rue@linaro.org>
Date: Wed, 15 May 2019 15:33:34 -0500
From: "Dan Rue" <dan.rue@linaro.org>
Subject: Re: A common place for CI results?
Message-ID: <20190515203334.lbhpqpdyulqztr5c@xps.therub.org>
References: <299272045.11819252.1554465036421.JavaMail.zimbra@redhat.com>
 <457016061.11846096.1554475313006.JavaMail.zimbra@redhat.com>
 <ECADFF3FD767C149AD96A924E7EA6EAF977191AE@USCULXMSG01.am.sony.com>
MIME-Version: 1.0
In-Reply-To: <ECADFF3FD767C149AD96A924E7EA6EAF977191AE@USCULXMSG01.am.sony.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-ID: <kernelci.groups.io>
To: kernelci@groups.io, Tim.Bird@sony.com
Cc: vkabatov@redhat.com, automated-testing@yoctoproject.org, info@kernelci.org

On Tue, May 14, 2019 at 11:01:35PM +0000, Tim.Bird@sony.com wrote:
> 
> 
> > -----Original Message-----
> > From: Veronika Kabatova
> > 
> > Hi,
> > 
> > as we know from this list, there's plenty CI systems doing some testing on
> > the
> > upstream kernels (and maybe some others we don't know about).
> > 
> > It would be great if there was a single common place where all the CI systems
> > can put their results. This would make it much easier for the kernel
> > maintainers and developers to see testing status since they only need to
> > check one place instead of having a list of sites/mailing lists where each CI
> > posts their contributions.
> > 
> > 
> > A few weeks ago, with some people we've been talking about kernelci.org
> > being
> > in a good place to act as the central upstream kernel CI piece that most
> > maintainers already know about. So I'm wondering if it would be possible for
> > kernelci to also act as an aggregator of all results? There's already an API
> > for publishing a report [0] so it shouldn't be too hard to adjust it to
> > handle and show more information. I also found the beta version for test
> > results [1] so actually, most of the needed functionality seems to be already
> > there. Since there will be multiple CI systems, the source and contact point
> > for the contributor (so maintainers know whom to ask about results if
> > needed)
> > would likely be the only missing essential data point.
> > 
> > 
> > The common place for results would also make it easier for new CI systems
> > to
> > get involved with upstream. There are likely other companies out there
> > running
> > some tests on kernel internally but don't publish the results anywhere. Only
> > adding some API calls into their code (with the data they are allowed to
> > publish) would make it very simple for them to start contributing. If we want
> > to make them interested, the starting point needs to be trivial. Different
> > companies have different setups and policies and they might not be able to
> > fulfill arbitrary requirements so they opt to not get involved at all, which
> > is a shame because their results can be useful. After the initial "onboarding"
> > step they might be willing to contribute more and more too.
> > 
> > 
> > Please let me know if the idea makes sense or if something similar is already
> > in plans. I'd be happy to contribute to the effort because I believe it would
> > make everyone's life easier and we'd all benefit from it (and maybe
> > someone
> > else from my team would be willing to help out too if needed).
> 
> I never responded to this, 

yea, you did. ;)

> but this sounds like a really good idea to me. I don't care much which
> backend we aggregate to, but it would be good as a community to start
> using one service to start with.  It would help to find issues with
> the API, or the results schema, if multiple people started using it.
> 
> I know that people using Fuego are sending data to their own instances
> of KernelCI.  But I don't know what the issues are for sending this
> data to a shared KernelCI service.
> 
> I would be interested in hooking up my lab to send Fuego results to
> KernelCI.  This would be a good exercise.  I'm not sure what the next
> steps would be, but maybe we could discuss this on the next automated
> testing conference call.

OK here's my idea.

I don't personally think kernelci (or LKFT) are set up to aggregate
results currently. We have too many assumptions about where tests are
coming from, how things are built, etc. In other words, dealing with
noisy data is going to be non-trivial in any existing project.

I would propose aggregating data into something like google's BigQuery.
This has a few benefits:
- Non-opinionated place to hold structured data
- Allows many downstream use-cases
- Managed hosting, and data is publicly available
- Storage is sponsored by google as a part of
  https://cloud.google.com/bigquery/public-data/
- First 1TB of query per 'project' is free, and users pay for more
  queries than that

With storage taken care of, how do we get the data in?

First, we'll need some canonical data structure defined. I would
approach defining the canonical structure in conjunction with the first
few projects that are interested in contributing their results. Each
project will have an ETL pipeline which will extract the test results
from a given project (such as kernelci, lkft, etc), translate it into
the canonical data structure, and load it into the google bigquery
dataset at a regular interval or in real-time. The translation layer is
where things like test names are handled.

The things this leaves me wanting are:
- raw data storage. It would be nice if raw data were stored somewhere
  permanent in some intermediary place so that later implementations
  could happen, and for data that doesn't fit into whatever structure we
  end up with.
- time, to actually try it and find the gaps. This is just an idea I've
  been thinking about. Anyone with experience here that can help flesh
  this out?

Dan

-- 
Linaro - Kernel Validation
