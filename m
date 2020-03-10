Return-Path: <spbnick@gmail.com>
Subject: Re: Common database and kcidb: what next?
References: <9e1beacd-c406-c234-479a-c2946698330c@collabora.com>
From: spbnick@gmail.com
Message-ID: <fd4315a7-f614-893d-6c76-0a2cd1b5f2bf@gmail.com>
Date: Tue, 10 Mar 2020 11:42:40 +0200
MIME-Version: 1.0
In-Reply-To: <9e1beacd-c406-c234-479a-c2946698330c@collabora.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
List-ID: <kernelci.groups.io>
To: Guillaume Tucker <guillaume.tucker@collabora.com>, kernelci@groups.io
Cc: kernelci-members@groups.io, Sasha Levin <sashal@kernel.org>

Hi Guillaume, everyone,

I'll be doing a good deal of disagreeing here, so brace yourselves :)

 > As things are starting to crystallise, it is now time to start
 > considering how to go about making this new database part of
 > KernelCI in a community-driven fashion.

We don't want things to crystallise, we're just starting. Our goals with KCIDB
is to get as many CI systems on board, find out how we can put all the testing
results together, and how we can get them to developers.

At this moment, we only have two participants: CKI and Kernel CI, we have the
basic minimum data there, but there are still discrepancies between data
availability, and we still haven't started submitting tests with common IDs,
although we got the CKI part agreed upon and arriving. Furthermore, we haven't
actually showed our reports to a single outside kernel developer, and we're
still implementing e-mail notifications and haven't sent a single one.

In short, we have barely started cooperating, and have zero real feedback.
We need to continue, bring more data from more CI systems, get our results to
developers and community, and iterate on feedback from all parties *as quickly
as possible*.

For that matter, we need to avoid integrating into any existing systems, or
coming up with grand designs, as that will slow us down. Design without
real-world involvement is worth little, and could actually cost us in wasted
effort. We need to show results quickly, show we're a worthy cause to join,
and be responsive, in order to invite and retain cooperation.

It doesn't matter much which technologies we're using now, as long as they let
us iterate fast, and show results. The outcome of this project should be as
many CI systems as possible submitting reports through a common interface, and
developers paying attention to them. Once we have that, it would mean that we
have the submission process, the schema, and report and notification logic
properly figured out.

If we have some code or infrastructure we can reuse after this, great! If not,
we shouldn't be too upset. Even though I'm trying to keep things modular,
layered, documented, and reusable, reality could be hard on them. Writing code
or even designing specific systems is not the hardest thing in software
development, it's figuring out the problem, and that's what we should be doing
here.

After this, we can fold this into Kernel CI proper, or whatever system we
want, do more design, integration, optimization, etc. We will have the time to
think the details through, because we would have achieved the main goal:
getting everyone to play together.

Regarding specific technologies we're using right now, I'm not a fan of using
Google Cloud for a public, or any long-term project, and I don't think we
should be using Grafana for the final reporting UI. However, they let us
iterate fast, and are good enough for showing results and iterating quickly.
In the end, we could be using something like a public PostgreSQL and a custom
web UI running on Kernel CI infrastructure, but first we have to make the
effort worth it.

Nick

On 3/6/20 7:43 PM, Guillaume Tucker wrote:
 > You may not have noticed yet but there is an ongoing effort to
 > have a common database where test results for the upstream
 > Linux kernel can all converge.  The initial steps towards this
 > goal have taken the form of a proof-of-concept project called
 > kcidb[1].  Nikolai has been making fast progress on this over
 > the past few months and I would like to thank him on behalf of
 > the KernelCI TSC for all his efforts so far.
 >
 > As things are starting to crystallise, it is now time to start
 > considering how to go about making this new database part of
 > KernelCI in a community-driven fashion.  There are several ways
 > to do so, and making key design decisions now is essential in
 > order to be able to plan things in the medium and longer term.
 >
 > I propose to take a look at what kernelci.org currently has to
 > offer, the lessons we have learnt so far from the kcidb project
 > and the mission statement[2] as defined by the advisory board
 > of members.  This should provide us with the basis we need to
 > plan our way forward in alignment with the kernel community.
 >
 > Your feedback is needed at every step, so please do not
 > hesitate to reply and discuss any aspect of it.
 >
 >
 > What does kernelci.org currently have to offer?
 > -----------------------------------------------
 >
 > The well known parts are:
 >
 > * a distributed architecture with labs running around the world
 >
 > * a very diverse pool of hardware across many CPU architectures
 >
 > * many upstream-oriented kernel branches being built and tested
 >
 > * no single organisation in charge to provide a neutral ground
 >    oriented towards the upstream Linux kernel
 >
 > * automated tracking of test regressions and bisections
 >
 > * email reports and custom-tailored web dashboard
 >
 > * public-facing web API to submit and query test results
 >
 > * a well established ecosystem of labs, contributors and users
 >
 > * portable tools[3] that can be reused in any test environment
 >
 >
 > Things currently being worked on include:
 >
 > * a growing test coverage to end the era of doing purely boot
 >    testing (KUnit, kselftest, LTP...)
 >
 > * improved web dashboard to show detailed test results rather
 >    than plain boots
 >
 > * more effective email reports as a result
 >
 >
 > * What lessons have we learnt from kcidb so far?
 > ------------------------------------------------
 >
 > Defining a schema for a common database is a patchwork of
 > compromises.  Each system doing upstream Linux kernel testing
 > has a slightly different approach, and a balance needs to be
 > struck between simplifying the data and causing extra
 > translations for the submitters.  We seem to have started to
 > converge on something that works for the existing kernelci.org
 > results and Red Hat's CKI.  We need to remain flexible enough
 > to refine things and be able to include other sources of data
 > as the project grows.
 >
 > Still, we are essentially now very close to be able to start
 > storing production data in the common database.  This is why we
 > are also at a turning point where we have to start thinking
 > beyond the proof-of-concept, to agree on how we want to design
 > things going forward.  If we neglect this step, we may well end
 > up with a new system completely unrelated to kernelci.org
 > except by name.  While it may be a great new design if done on
 > purpose, if this happened by accident it would most likely be a
 > failure.
 >
 > For example, kcidb is currently based on Google BigQuery, which
 > is fine for a proof-of-concept but we know that being tied to a
 > cloud provider has major drawbacks.  In particular, we lose the
 > ability to run an autonomous KernelCI instance.  It is this
 > kind of design decisions that we need to make now so we can
 > move on to the next stage with enough confidence.
 >
 >
 > * What are the options going forward?
 > -------------------------------------
 >
 > The main thing we need now is engagement in the decision
 > process from the KernelCI community.  For this, we need to
 > collect feedback and ideas.  There are many experienced people
 > who care about KernelCI, this is the chance to make a system
 > designed by the community and for the community.
 >
 > To get started, here are a few key topics that I would like to
 > shed some light upon:
 >
 > 1. Converting the kernelci-backend web API as an abstraction
 >     layer for submitting results
 >
 >     Anyone can set up a kernelci-backend instance, but it is
 >     currently tied to Mongo DB.  It wouldn't be difficult to
 >     make it also work with other database engines since it has
 >     abstract data models and already uses hooks to submit to
 >     BigQuery.
 >
 > 2. Keeping core functions in kernelci-core
 >
 >     While kcidb has explored a few things around submitting data
 >     and triggering email reports, the kernelci-core project is
 >     about providing portable tools to run each KernelCI step.
 >     As such, it would seem like the canonical place to provide
 >     any new tools of this kind.
 >
 > 3. Comparative study of web dashboard solutions
 >
 >     The current kernelci.org web dashboard was designed
 >     especially for showing kernel test results.  It wasn't well
 >     maintained for several years but we are now improving it to
 >     show test results.  As such, it is still a very good
 >     candidate.  However, there are many other possible
 >     solutions, and we may create a combination of several tools
 >     to address different needs.  Previous attempts at using
 >     SQUAD and ElasticStack did not give satisfactory results or
 >     were aborted.  The attention has now moved towards Grafana,
 >     we don't know yet what the outcome will be.  It seems
 >     worthwhile listing all these tools as well as other web
 >     frameworks and libraries to compare them, and define what
 >     the requirements are in terms of users (developers,
 >     maintainers, OEMs...).  Based on that we would be able to
 >     spend our energy with reduced risks of missing the goals.
 >
 >
 > Sorry for the very long email...  It seemed like the best way
 > to get everyone on the same page.  Please take the time you
 > need to digest it, we are not (yet) in a state of emergency.
 > As KernelCI is going through a transformative phase it is
 > important for all of us to see the bigger picture and make
 > conscious decisions as much as possible.  Thank you!
 >
 > Best wishes,
 > Guillaume
 >
 >
 > [1] https://github.com/kernelci/kcidb
 >
 > [2] "To ensure the quality, stability and long-term maintenance
 >       of the Linux kernel by maintaining an open ecosystem
 >       around test automation practices and principles."
 >
 > [3] https://github.com/kernelci/kernelci-core
 >

