Return-Path: <Nikolai.Kondrashov@redhat.com>
Message-ID: <68c0745f-6cc8-447e-143c-409216d69cae@redhat.com>
Date: Fri, 22 Apr 2022 17:06:19 +0300
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

The main news is Microsoft has started work on sending reports from their
in-house Penguinator system to KCIDB.

Daniel Stone has requested the ability to browse the test tree in KCIDB
dashboards, which I considered for a while as well. He'd like to be able
to browse graphics suite results across various builds and revisions.

However, I'll have to do that only after I'm done with the current task:
improving our use of BigQuery, so we don't have to pay so much for our
queries.

After both of these I'll return to working on known issue handling/masking.

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

!   Microsoft
!       I provided Liz Zhang with instructions and credentials for submitting
!       Penguinator data to KCIDB.

Please respond with corrections or suggestions of other CI systems to contact.

Thank you!
Nick

*More-or-less :)

**KCIDB is an effort to unify Linux Kernel CI reporting, maintained by Linux
   Foundation's KernelCI project:
   https://foundation.kernelci.org/blog/2020/08/21/introducing-common-reporting/

