Return-Path: <Nikolai.Kondrashov@redhat.com>
From: "Nikolai Kondrashov" <Nikolai.Kondrashov@redhat.com>
Subject: #KCIDB engagement report
Message-ID: <36616be8-52dc-6ff6-8f21-b6ab68931511@redhat.com>
Date: Mon, 23 Aug 2021 15:37:43 +0300
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
List-ID: <kernelci.groups.io>
To: kernelci@groups.io, "automated-testing@yoctoproject.org" <automated-testing@yoctoproject.org>

Hi everyone,

Below is the monthly report on KCIDB* engagement. It lists various CI systems
and their status of engagement with KCIDB, as well as developer engagement.

This is a belated report, and has no news, as I was on vacation half of the
time, and the other half was occupied with CKI Project. Now my breaks
are over, and I hope to wrap up CKI work soon, to get back to KCIDB.

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
         match the ones reported by others. To be fixed soon.
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

Nick

*KCIDB is an effort to unify Linux Kernel CI reporting, maintained by Linux
  Foundation's KernelCI project:
  https://foundation.kernelci.org/blog/2020/08/21/introducing-common-reporting/

