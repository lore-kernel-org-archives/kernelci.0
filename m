Return-Path: <Nikolai.Kondrashov@redhat.com>
Message-ID: <31ad1a88-dfaf-ea46-97cd-a277d6d108cb@redhat.com>
Date: Sat, 23 Jul 2022 14:50:33 +0300
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

Lines with updates are marked with "!".

Intel's Philip Li has reached out, asking for submission credentials and
instructions, and the 0day CI has been submitting their results to our
"playground" setup for a few days now:

https://kcidb.kernelci.org/?var-origin=0dayci&var-dataset=playground_kcidb_01

It's already looking pretty good!

I'm working on the design of known-issue handling, fleshing out smaller
details now, and looking for the fastest path to providing value.

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
!       Sending test results to our playground setup.
! 
https://kcidb.kernelci.org/?var-origin=0dayci&var-dataset=playground_kcidb_01

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

     Microsoft
!       Johnson George is investigating KCIDB.

Please respond with corrections or suggestions of other CI systems to contact.

Thank you!
Nick

*More-or-less :)

**KCIDB is an effort to unify Linux Kernel CI reporting, maintained by Linux
   Foundation's KernelCI project:
   https://foundation.kernelci.org/blog/2020/08/21/introducing-common-reporting/

