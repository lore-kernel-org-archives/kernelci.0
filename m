Date: Wed, 10 Apr 2019 13:47:26 -0400 (EDT)
From: Veronika Kabatova <vkabatov@redhat.com>
Message-ID: <792428822.13097227.1554918446625.JavaMail.zimbra@redhat.com>
In-Reply-To: <CABXOdTcv1tJvzx=1nRJxR0pct5iCH4V34gow1-AjXZ9NbyPWFw@mail.gmail.com>
References: <299272045.11819252.1554465036421.JavaMail.zimbra@redhat.com> <457016061.11846096.1554475313006.JavaMail.zimbra@redhat.com> <ECADFF3FD767C149AD96A924E7EA6EAF976C1720@USCULXMSG01.am.sony.com> <CABXOdTcv1tJvzx=1nRJxR0pct5iCH4V34gow1-AjXZ9NbyPWFw@mail.gmail.com>
Subject: Re: A common place for CI results?
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
List-ID: <kernelci.groups.io>
To: Guenter Roeck <groeck@google.com>, Timothy Bird <Tim.Bird@sony.com>
Cc: kernelci@groups.io, automated-testing@yoctoproject.org, info@kernelci.org


----- Original Message -----
> From: "Guenter Roeck" <groeck@google.com>
> To: kernelci@groups.io, "Timothy Bird" <Tim.Bird@sony.com>
> Cc: vkabatov@redhat.com, automated-testing@yoctoproject.org, info@kernelci.org
> Sent: Tuesday, April 9, 2019 3:41:24 PM
> Subject: Re: A common place for CI results?
> 
> On Mon, Apr 8, 2019 at 10:48 PM <Tim.Bird@sony.com> wrote:
> >
> > > -----Original Message-----
> > > From: Veronika Kabatova
> > ...
> > > as we know from this list, there's plenty CI systems doing some testing
> > > on
> > > the
> > > upstream kernels (and maybe some others we don't know about).
> > >
> > > It would be great if there was a single common place where all the CI
> > > systems
> > > can put their results. This would make it much easier for the kernel
> > > maintainers and developers to see testing status since they only need to
> > > check one place instead of having a list of sites/mailing lists where
> > > each CI
> > > posts their contributions.
> >
> > We've had discussions about this, and decided there are a few issues.
> > Some of these you identify below.
> >
> > >
> > > A few weeks ago, with some people we've been talking about kernelci.org
> > > being
> > > in a good place to act as the central upstream kernel CI piece that most
> > > maintainers already know about. So I'm wondering if it would be possible
> > > for
> > > kernelci to also act as an aggregator of all results?
> >
> > Right now, the kernelCI central server is (to my knowledge) maintained
> > by Kevin Hilman, on his own dime.  That may be changing with the Linux
> > Foundation possibly creating a testing project to provide support for this.
> > But in any event, at the scale we're talking about (with lots of test
> > frameworks
> > and potentially thousands of boards and hundreds of thousands of test
> > run results arriving daily), hosting this is costly.  So there's a question
> > of
> > who pays for this.
> >
> 
> In theory that would be the Linux Foundation as part of the KernelCI
> project. Unfortunately, while companies and people do show interest in
> KernelCI, there seems to be little interest in actually joining the
> project. My understanding is that the Linux Foundation will only make
> it official if/when there are five members. Currently there are three,
> Google being one of them. Any company interested in the project may
> possibly want to consider joining it. When doing so, you'l have
> influence setting its direction, and that may include hosting test
> results other than those from KernelCI itself.
> 

Is there any page with details on how to join and what are the requirements
on us that I can pass along to management to get an official statement?

We are definitely interested in more involvement with upstream, both kernel
and different CI systems, as we have a common goal. If we can help each other
out and build a central CI system for upstream kernels that people can rely
on, we want to be a part of this effort. We have started our own interaction
with upstream (see my intro email on this list) but as all CI systems face
the same challenges it only makes sense to join the forces.

> Guenter
> 
> > > There's already an API
> > > for publishing a report [0] so it shouldn't be too hard to adjust it to
> > > handle and show more information. I also found the beta version for test
> > > results [1] so actually, most of the needed functionality seems to be
> > > already
> > > there. Since there will be multiple CI systems, the source and contact
> > > point
> > > for the contributor (so maintainers know whom to ask about results if
> > > needed)
> > > would likely be the only missing essential data point.
> >
> > One of the things on our action item list is to have discussions about a
> > common results format.
> > See https://elinux.org/ATS_2018_Minutes (towards the end right before
> > "Decisions from the summit")
> > I think this addresses the issue of what information is needed for a
> > universal results format.
> > I think we should definitely add a 'contributor' field to a common
> > definition, for the
> > reasons you mention.
> >
> > Some other issues, are making it so that different test frameworks emit the
> > same testcase
> > names when they run the same test.  For example, in Fuego there is a
> > testcase called
> > Functional.LTP.syscalls.abort07.  It's not required, but it seems like it
> > would be valuable
> > if CKI, Linaro, Fuego and others decided on a canonical name for this
> > particular testcase,
> > so they were the same in each run result.
> >

Good point. CKI only reports full testsuite names as results (so it would be
"LTP lite") and then we have a short log with subtests and results, and a
longer log with details. But for CI systems that report each subtest
separately, having a common name (with maybe "LTP" as an aggregated result)
would definitely be beneficial and easier to parse by both humans and
automation.

> > I took an action item from our meetings at Linaro last week to look at this
> > issue
> > (testcase name harmonization).
> >
> > >
> > > The common place for results would also make it easier for new CI systems
> > > to
> > > get involved with upstream. There are likely other companies out there
> > > running
> > > some tests on kernel internally but don't publish the results anywhere.
> >
> > > Only
> > > adding some API calls into their code (with the data they are allowed to
> > > publish) would make it very simple for them to start contributing. If we
> > > want
> > > to make them interested, the starting point needs to be trivial.
> > > Different
> > > companies have different setups and policies and they might not be able
> > > to
> > > fulfill arbitrary requirements so they opt to not get involved at all,
> > > which
> > > is a shame because their results can be useful. After the initial
> > > "onboarding"
> > > step they might be willing to contribute more and more too.
> > >
> > Indeed.  Probably most groups don't publish their test results, even
> > when they are using open source tests.  There are lots of reasons for this
> > (including there not being a place to publish them, as you mention).
> > It would be good to also address the other reasons that testing entities
> > don't publish, and try to remove as many obstacles (or to try to encourage
> > as much as possible) publishing of test results.
> >

Absolutely agreed.

> > > Please let me know if the idea makes sense or if something similar is
> > > already
> > > in plans. I'd be happy to contribute to the effort because I believe it
> > > would
> > > make everyone's life easier and we'd all benefit from it (and maybe
> > > someone
> > > else from my team would be willing to help out too if needed).
> >
> > I think it makes a lot of sense, and we'd like to take steps to make that
> > possible.
> >
> > The aspect of this that  I plan to work on myself is testcase name
> > harmonization.
> > That's one aspect of standardizing a common or universal results format.
> > But I've already got a lot of things I'm working on.  If someone else wants
> > to
> > volunteer to work on this, or head up a workgroup to work on this, let me
> > know.
> >

Totally understand your situation, too much work and too little time :) I can
try to put an idea together and post it here for feedback to help out. Do you
have any data points or previous discussions to link? It would be great to
have something to build upon instead of posting a brain dump that won't work
for already known issues (that aren't known by me).



Veronika

> > Regards,
> >  -- Tim
> >
> >
> > 
> >
> 
