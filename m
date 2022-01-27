Return-Path: <Nikolai.Kondrashov@redhat.com>
Message-ID: <81a88dac-d19d-2388-03a7-d85dc1f8ea85@redhat.com>
Date: Thu, 27 Jan 2022 16:41:04 +0200
MIME-Version: 1.0
From: "Nikolai Kondrashov" <Nikolai.Kondrashov@redhat.com>
Subject: #KCIDB engagement report
Reply-To: kernelci@groups.io, Nikolai.Kondrashov@redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-ID: <kernelci.groups.io>
To: kernelci@groups.io, automated-testing@lists.yoctoproject.org

Hi everyone,

Below is the monthly* report on KCIDB** engagement. It lists various CI
systems and their status of engagement with KCIDB, as well as developer
engagement.

We have no news on CI system engagement, but we're working with our KernelCI
colleague Mark Brown on figuring out suitable notifications for him.

We've implemented sending notifications one hour after the last update for a
revision arrives, thus approximating the traditional behavior of "send report
when testing is done". Here's an example:

     https://groups.io/g/kernelci-results-staging/message/11899

However, this is still hardly useful, as there are so many failures. Thus we
again arrive at the inescapable need for masking known failures somehow.

To that end, I went over how various kernel CI systems do it, to try to find
a solution which would accommodate everyone, and wrapped that into a FOSDEM
talk:

 
https://fosdem.org/2022/schedule/event/masking_known_issues_across_six_kernel_ci_systems/

I have a few ideas I'll be presenting there, as well as a few problems, of
course, and would appreciate your feedback. I'd be glad to hear any
corrections to my summaries of how CI systems operate, too, as I had to
prepare those in a rush.

CI Engagement Status

     KernelCI native
         Sending (a lot of) production build and test results.
         https://kcidb.kernelci.org/?var-origin=kernelci

     Red Hat CKI
         Sending production results.
         https://kcidb.kernelci.org/?var-origin=redhat

     Google Syzbot
         Sending a subset of production results (failures only).
         https://kcidb.kernelci.org/?var-origin=syzbot

     ARM
         Sending production results.
         Full commit hashes are currently not available, are spoofed, and don't
         match the ones reported by others. There's ongoing switch to using a
         KernelCI instance setup, which should fix this.
         https://kcidb.kernelci.org/?var-origin=arm

     Sony Fuego
         Internal design in progress.

     Gentoo GKernelCI
         Sending production results.
         Only builds (a few architectures), no configs, no logs, and no tests
         for now, but working on growing contributions.
         https://kcidb.kernelci.org/?var-origin=gkernelci

     Intel 0day
         Initial conversation concluded, general interest expressed,
         no contact since.

     Linaro
         Sending (a lot of) Tuxsuite build results to "production" KCIDB.
         https://kcidb.kernelci.org/?var-origin=tuxsuite

     TuxML
         Initial contact in response to a report.
         There's a plan to approach us and start work in the coming months.

     Yocto Project
         Initial contact in response to a report.
         Would like to start sending build and test results, particularly for
         older kernels. Would like to separate upstream commits from project
         patches first: https://bugzilla.yoctoproject.org/show_bug.cgi?id=14196

     Huawei Compass CI
         Sent a message to Fengguang Wu, who was presenting it at LVC 2021.
         No response so far.

Please respond with corrections or suggestions of other CI systems to contact.

Thank you!
Nick

*More-or-less :)

**KCIDB is an effort to unify Linux Kernel CI reporting, maintained by Linux
   Foundation's KernelCI project:
   https://foundation.kernelci.org/blog/2020/08/21/introducing-common-reporting/

