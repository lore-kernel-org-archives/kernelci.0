Return-Path: <khilman@baylibre.com>
From: "Kevin Hilman" <khilman@baylibre.com>
Subject: brief summary of testing discussions from LPC 2019
Date: Thu, 19 Sep 2019 10:15:29 +0200
Message-ID: <7h7e64aehq.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
List-ID: <kernelci.groups.io>
To: automated-testing@yoctoproject.org
Cc: kernelci@groups.io

Hello,

For those who could not be at Linux Plumbers Conference (LPC) this year,
below is a quick attempt to summarize the main discussions surrounding
automated testing for Linux that happened there.

First, there's a quick TL;DR version, then a summary of LPC, followed by
a related event from RedHat's Continuous Kernel Integration (CKI)
hackfest which followed LPC.  Links to more detailed notes from the
various sessions are also included.

I hope it's useful for those who could not attend,

Thanks,

Kevin


Quick Summary
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

  Today, we have

  - A growing number of testing & fuzzing suites.
  - A growing number of CI systems running these tests.

  Result: We're finding lots and lots of bugs

  Problem: Pace of finding bugs is faster than the pace of fixing bugs.

  Solution: Need consolidation of existing CI projects combined with
    improved kernel development processes to improve the situation.

  Due to the fragmentation of the test frameworks and test suites, and
  the multiple different CI efforts underway, we don't have consistent
  reporting and analysis tools to find, report, track and fix bugs
  efficiently.

  It's now abundantly clear that the fragmentation is part of the
  problem.  The consensus at LPC was that consolidation of the CI
  systems should be focused under the KernelCI project, which is now an
  official LF project (launching Oct 2019), and there's strong demand
  from the kernel developer community for efforts to be focused there as
  the primary, open-source solution.

  The fragmentation of kernel development process is also a problem, and
  the maintainers summit has kicked off more conversations around the
  tooling and process improvements needed by launching a new "workflows"
  mailing list for kernel developers.

  LWN has some deeper coverage of this topic in the recent
  =E2=80=9CDefragmenting the kernel development process=E2=80=9D article:
  <https://lwn.net/Articles/799134/>


LPC
=3D=3D=3D

testing & fuzzing micro-conference
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

  Detailed notes: <https://etherpad.net/p/LPC2019_Testing_and_Fuzzing>

  Overview of topics:
  <https://linuxplumbersconf.org/event/4/sessions/63/#20190910>
  - kernelCI : testing a broad variety of hardware
  - Dealing with complex test suites
  - GWP-ASAN
  - Finding uninitialized memory in the kernel
  - syszbot: updates and open problems
  - Collaboration/unification around unit testing frameworks
  - All about kselftest


Kernel Summit / Maintainers summit
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

  This year, testing and CI came up as repeated themes throughout LPC. I
  won't try to summarize those because LWN already has excellent
  coverage:

  Relevant talks

  - Reflections on kernel quality, development process and testing LPC
    abstract/slides:
    <https://linuxplumbersconf.org/event/4/contributions/554/> LWN
    coverage: Defragmenting the kernel development process:
    <https://lwn.net/Articles/799134/>

  - kselftest LWN coverage: "Dealing with automated kernel bugs":
    <https://lwn.net/Articles/799162/>

  Relevant Outcomes:

  - making it easier (via MAINTAINERS file) to find out which tests are
    relevant to which subsystems
  - new 'workflows" mailing list to discuss kernel development
    process/workflow with the goal of helping improve automated testing
    systems.
  - agreement that work towards consolidating CI efforts should be
    focused under the LF KernelCI project


CKI hackfset
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

  Earlier this year RedHat publicly announced their Continuous Kernel
  Integration (CKI) project: <https://cki-project.org/>.  After LPC,
  there was a 2 day hackfest to discuss issues CKI is working on, but
  more broadly to discuss how CKI can collaborate with the other CI
  systems.

  Agenda, attendees & detailed notes:
  <https://docs.google.com/document/d/1EIU-GEJpChfB2TLzi3ebXQqUnXQ1CQ2gyl48=
FE-dfQI/edit>

  Please read/skim the full topics and notes for more details, but below
  I'll cover what I think are the main highlights in light of the
  concerns raised during LPC/ksummit around fragmentation of CI systems.

  First, several of the active, open-source testing projects were in the
  room for discussion:

  - CKI (RedHat)
  - LKFT (Linaro)
  - KernelCI
  - Fuego
  - syzbot
  - patchwork / snowpatch

  All of the projects are very aware of the fragmentation problems
  discussed above, and while there are some important differences
  between each of the projects, there also is significant overlap and
  lots of room for collaboration and consolidation.

  These were the main areas of focus for collaboration

  - Avoiding duplicated effort
  - Ensure reports that developers / maintainers can easily act on
  - Ensuring we're running tests that maintainers care about
  - Working towards common test results output formats that ease
    automated results gathering and analytics
  - open-testing philosophy: our testing should be open-source and
    collaboration focused, just like our code
  - How to share hardware resources for testing
  - Sharing a common place for upstream test results

  The last item in that list, "Sharing common place for upstream
  results", was a repeated theme over the 2 days as we realized that it
  was a pre-requisite for much of the other work needed.  For example,
  in order to consolidate email reports and dashboards, we need to be
  working from a shared set of results.

  So, during the hackfest, a small group broke off stared to look at the
  test results output formats/schema/databases from a few of the testing
  systems (CKI, LKFT, kernelCI) and started working on consolidation
  with a short-term goal of having a combined repository with share
  results where we could start experimenting with common reporting,
  dashboards and visualization tools.

  At the end of the 2 day hackfest, there was an overall positive
  feeling that working together on consolidation is "the right thing" to
  do.

  Because the KernelCI project is becoming an official LF project, there
  was general agreement that the consolidation efforts be focused under
  that umbrella.  Note that that does *not* mean that everyone will be
  using the current kernelci.org infrastructure.  Rather, that means
  that all the involved projects (including KernelCI) will be evolving
  their work and focusing on a combined effort.
