Return-Path: <khilman@baylibre.com>
From: "Kevin Hilman" <khilman@baylibre.com>
Subject: RFC: dashboards, visualization and analytics for test results
Date: Wed, 07 Oct 2020 10:47:32 -0700
Message-ID: <7hk0w2c4i3.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
List-ID: <kernelci.groups.io>
To: automated-testing@lists.yoctoproject.org, kernelci@groups.io, 
Cc: tools@linux.kernel.org

Hello folks interested in kernel testing/automation,

The KernelCI project is starting to look at what's next for dashboards,
visualization and analytics for the various Linux focused testing
projects.

At Linux Plumbers, we launched some discussions[1] around common ways to
collect test results, logs and metadata into a public, shared dataset,
and we've already started collecting data from several different
sources.

So the next question is... how do we best use all of this data?

We're beginning to brainstorm how to visualize, analyze and learn from
this data in useful ways.

To that end, we're starting to collect a set of user stories to help us
brainstorm a new design for web based dashboard and analytics, and we'd
like to hear from you.

Below is the start of a list of user stories[2], but we want to grow
this list with your ideas, so please share them on this thread.=20

We're also very interested in talking with any big data people and data
scientists who might be willing to look at this growing set of data and
help us better plan for the future full of lots of test data.

We appreciate your ideas and feedback,

Kevin (on behalf of the KernelCI team)


[1] c.f. Unifying Test Reporting with KernelCI from the testing/fuzzing
    micro-conference:
    https://linuxplumbersconf.org/event/7/sessions/80/#20200826



[2] Example user stories

A kernel developer has sent a patch which caused a regression
   - Find the details, how to reproduce, check when it=E2=80=99s fixed

A maintainer is getting a branch ready for the next merge window
  - Compare results against mainline, ensure all tests were run correctly

An OEM or SoC vendor needs to upgrade their kernel or move to upstream
  - See all results for a particular platform on various stable releases

Regular visitors who want to know how the kernel is doing
  - Highlight new regressions, show trends for pass/fail and performance
  - Does kernel X work on my hardware?=20

Distro vendor wants to know
  - Is the latest kernel stable enough for my distro?
  - Why does this test fail on my distro kernel but not stable kernel?

Stable kernel maintainer wants to know
  - Is this kernel stable enough to release?

Kernel / subsystem maintainer wants to know
  - Is my code/subsystem being tested?  How much coverage?
  - Is the kernel size growing?  Why?  Which subsystems
  - Is boot time / test execution time increasing/decreasing?  What are th=
e historical trends?


