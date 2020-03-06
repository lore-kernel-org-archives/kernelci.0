From: "Guillaume Tucker" <guillaume.tucker@gmail.com>
Subject: Common database and kcidb: what next?
Message-ID: <9e1beacd-c406-c234-479a-c2946698330c@collabora.com>
Date: Fri, 6 Mar 2020 17:43:49 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
List-ID: <kernelci.groups.io>
To: kernelci@groups.io
Cc: kernelci-members@groups.io, Nikolai Kondrashov <spbnick@gmail.com>, Sasha Levin <sashal@kernel.org>

You may not have noticed yet but there is an ongoing effort to
have a common database where test results for the upstream
Linux kernel can all converge.  The initial steps towards this
goal have taken the form of a proof-of-concept project called
kcidb[1].  Nikolai has been making fast progress on this over
the past few months and I would like to thank him on behalf of
the KernelCI TSC for all his efforts so far.

As things are starting to crystallise, it is now time to start
considering how to go about making this new database part of
KernelCI in a community-driven fashion.  There are several ways
to do so, and making key design decisions now is essential in
order to be able to plan things in the medium and longer term.

I propose to take a look at what kernelci.org currently has to
offer, the lessons we have learnt so far from the kcidb project
and the mission statement[2] as defined by the advisory board
of members.  This should provide us with the basis we need to
plan our way forward in alignment with the kernel community.

Your feedback is needed at every step, so please do not
hesitate to reply and discuss any aspect of it.


What does kernelci.org currently have to offer?
-----------------------------------------------

The well known parts are:

* a distributed architecture with labs running around the world

* a very diverse pool of hardware across many CPU architectures

* many upstream-oriented kernel branches being built and tested

* no single organisation in charge to provide a neutral ground
  oriented towards the upstream Linux kernel

* automated tracking of test regressions and bisections

* email reports and custom-tailored web dashboard

* public-facing web API to submit and query test results

* a well established ecosystem of labs, contributors and users

* portable tools[3] that can be reused in any test environment


Things currently being worked on include:

* a growing test coverage to end the era of doing purely boot
  testing (KUnit, kselftest, LTP...)

* improved web dashboard to show detailed test results rather
  than plain boots

* more effective email reports as a result


* What lessons have we learnt from kcidb so far?
------------------------------------------------

Defining a schema for a common database is a patchwork of
compromises.  Each system doing upstream Linux kernel testing
has a slightly different approach, and a balance needs to be
struck between simplifying the data and causing extra
translations for the submitters.  We seem to have started to
converge on something that works for the existing kernelci.org
results and Red Hat's CKI.  We need to remain flexible enough
to refine things and be able to include other sources of data
as the project grows.

Still, we are essentially now very close to be able to start
storing production data in the common database.  This is why we
are also at a turning point where we have to start thinking
beyond the proof-of-concept, to agree on how we want to design
things going forward.  If we neglect this step, we may well end
up with a new system completely unrelated to kernelci.org
except by name.  While it may be a great new design if done on
purpose, if this happened by accident it would most likely be a
failure.

For example, kcidb is currently based on Google BigQuery, which
is fine for a proof-of-concept but we know that being tied to a
cloud provider has major drawbacks.  In particular, we lose the
ability to run an autonomous KernelCI instance.  It is this
kind of design decisions that we need to make now so we can
move on to the next stage with enough confidence.


* What are the options going forward?
-------------------------------------

The main thing we need now is engagement in the decision
process from the KernelCI community.  For this, we need to
collect feedback and ideas.  There are many experienced people
who care about KernelCI, this is the chance to make a system
designed by the community and for the community.

To get started, here are a few key topics that I would like to
shed some light upon:

1. Converting the kernelci-backend web API as an abstraction
   layer for submitting results

   Anyone can set up a kernelci-backend instance, but it is
   currently tied to Mongo DB.  It wouldn't be difficult to
   make it also work with other database engines since it has
   abstract data models and already uses hooks to submit to
   BigQuery.

2. Keeping core functions in kernelci-core

   While kcidb has explored a few things around submitting data
   and triggering email reports, the kernelci-core project is
   about providing portable tools to run each KernelCI step.
   As such, it would seem like the canonical place to provide
   any new tools of this kind.

3. Comparative study of web dashboard solutions

   The current kernelci.org web dashboard was designed
   especially for showing kernel test results.  It wasn't well
   maintained for several years but we are now improving it to
   show test results.  As such, it is still a very good
   candidate.  However, there are many other possible
   solutions, and we may create a combination of several tools
   to address different needs.  Previous attempts at using
   SQUAD and ElasticStack did not give satisfactory results or
   were aborted.  The attention has now moved towards Grafana,
   we don't know yet what the outcome will be.  It seems
   worthwhile listing all these tools as well as other web
   frameworks and libraries to compare them, and define what
   the requirements are in terms of users (developers,
   maintainers, OEMs...).  Based on that we would be able to
   spend our energy with reduced risks of missing the goals.


Sorry for the very long email...  It seemed like the best way
to get everyone on the same page.  Please take the time you
need to digest it, we are not (yet) in a state of emergency.
As KernelCI is going through a transformative phase it is
important for all of us to see the bigger picture and make
conscious decisions as much as possible.  Thank you!

Best wishes,
Guillaume


[1] https://github.com/kernelci/kcidb

[2] "To ensure the quality, stability and long-term maintenance
     of the Linux kernel by maintaining an open ecosystem
     around test automation practices and principles."

[3] https://github.com/kernelci/kernelci-core
