Subject: Re: [Automated-testing] RFC: dashboards, visualization and analytics for test results
References: <7hk0w2c4i3.fsf@baylibre.com>
From: "Nikolai Kondrashov" <Nikolai.Kondrashov@redhat.com>
Message-ID: <959233f0-bf18-af43-bed3-f19f8dbc6540@redhat.com>
Date: Thu, 10 Dec 2020 12:38:20 +0200
MIME-Version: 1.0
In-Reply-To: <7hk0w2c4i3.fsf@baylibre.com>
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
List-ID: <kernelci.groups.io>
To: Kevin Hilman <khilman@baylibre.com>, automated-testing@lists.yoctoproject.org, kernelci@groups.io
Cc: tools@linux.kernel.org

Hello everyone,

On 10/7/20 8:47 PM, Kevin Hilman wrote:
 > We're beginning to brainstorm how to visualize, analyze and learn from
 > this data in useful ways.
 >
 > To that end, we're starting to collect a set of user stories to help us
 > brainstorm a new design for web based dashboard and analytics, and we'd
 > like to hear from you.
 >
 > Below is the start of a list of user stories[2], but we want to grow
 > this list with your ideas, so please share them on this thread.

I'd like to hijack this thread with a somewhat different, but relevant topic,
if I may: how to send notifications on test results arriving to KCIDB from
various CI systems.

I've thrown together a little document listing some of the user stories for
such a system, as well as a KCIDB-specific algorithm overview:

     https://docs.google.com/document/d/1rYaxfeb5-NND_ef4TkEv0ka7bGhEWc7mCPhRRNihVK8/

If you have any user stories of your own, or any ideas regarding result
notifications whatsoever, please don't hesitate to drop by and leave a
comment!

This will help us make sure we build something closer to what everyone needs.

Thank you.
Nick

On 10/7/20 8:47 PM, Kevin Hilman wrote:
 > Hello folks interested in kernel testing/automation,
 >
 > The KernelCI project is starting to look at what's next for dashboards,
 > visualization and analytics for the various Linux focused testing
 > projects.
 >
 > At Linux Plumbers, we launched some discussions[1] around common ways to
 > collect test results, logs and metadata into a public, shared dataset,
 > and we've already started collecting data from several different
 > sources.
 >
 > So the next question is... how do we best use all of this data?
 >
 > We're beginning to brainstorm how to visualize, analyze and learn from
 > this data in useful ways.
 >
 > To that end, we're starting to collect a set of user stories to help us
 > brainstorm a new design for web based dashboard and analytics, and we'd
 > like to hear from you.
 >
 > Below is the start of a list of user stories[2], but we want to grow
 > this list with your ideas, so please share them on this thread.
 >
 > We're also very interested in talking with any big data people and data
 > scientists who might be willing to look at this growing set of data and
 > help us better plan for the future full of lots of test data.
 >
 > We appreciate your ideas and feedback,
 >
 > Kevin (on behalf of the KernelCI team)
 >
 >
 > [1] c.f. Unifying Test Reporting with KernelCI from the testing/fuzzing
 >      micro-conference:
 >      https://linuxplumbersconf.org/event/7/sessions/80/#20200826
 >
 >
 >
 > [2] Example user stories
 >
 > A kernel developer has sent a patch which caused a regression
 >     - Find the details, how to reproduce, check when it’s fixed
 >
 > A maintainer is getting a branch ready for the next merge window
 >    - Compare results against mainline, ensure all tests were run correctly
 >
 > An OEM or SoC vendor needs to upgrade their kernel or move to upstream
 >    - See all results for a particular platform on various stable releases
 >
 > Regular visitors who want to know how the kernel is doing
 >    - Highlight new regressions, show trends for pass/fail and performance
 >    - Does kernel X work on my hardware?
 >
 > Distro vendor wants to know
 >    - Is the latest kernel stable enough for my distro?
 >    - Why does this test fail on my distro kernel but not stable kernel?
 >
 > Stable kernel maintainer wants to know
 >    - Is this kernel stable enough to release?
 >
 > Kernel / subsystem maintainer wants to know
 >    - Is my code/subsystem being tested?  How much coverage?
 >    - Is the kernel size growing?  Why?  Which subsystems
 >    - Is boot time / test execution time increasing/decreasing?  What are the historical trends?
 >
 >
 >
 >
 > 
 >

