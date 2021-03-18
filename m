From: "Nikolai Kondrashov" <Nikolai.Kondrashov@redhat.com>
Subject: #KCIDB engagement report
Message-ID: <6369bcba-8103-8730-c574-6846ca578fd9@redhat.com>
Date: Thu, 18 Mar 2021 12:34:37 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
List-ID: <kernelci.groups.io>
To: kernelci@groups.io, "automated-testing@yoctoproject.org" <automated-testing@yoctoproject.org>

Hi everyone,

Below is the monthly report on KCIDB* engagement. It lists various CI systems
and their status of engagement with KCIDB, and once we get to that, will list
developer engagement.

Lines with updates are marked with "!".

Main news are KernelCI closing in on sending production data, Tuxsuite sending
to production, and GKernelCI building more architectures.

     KernelCI native
!       Improved-throughput code is in the last stages of testing, sending
!       results to "playground" right now. Will start sending production
!       data in a few days.
!       https://staging.kernelci.org:3000/?var-origin=kernelci&var-dataset=playground_kernelci04

     Red Hat CKI
         Sending production results.
         https://staging.kernelci.org:3000/?var-origin=redhat

     Google Syzbot
         Sending a subset of production results (failures only).
         https://staging.kernelci.org:3000/?var-origin=syzbot

     ARM
         Sending production results.
         Full commit hashes are currently not available, are spoofed, and don't
         match the ones reported by others. To be fixed soon.
         https://staging.kernelci.org:3000/?var-origin=arm

     Sony Fuego
         Internal design in progress.

     Gentoo GKernelCI
         Sending production results.
!       Only builds (a few architectures), no configs, no logs, and no tests
!       for now, but working on growing contributions.
         https://staging.kernelci.org:3000/?var-origin=gkernelci

     Intel 0day
         Initial conversation concluded, general interest expressed,
         no contact since.

     Linaro
!       Sending (a lot of) Tuxsuite build results to "production" KCIDB.
!       https://staging.kernelci.org:3000/?var-origin=tuxsuite

     TuxML
         Initial contact in response to a report.
         There's a plan to approach us and start work in the coming months.

     Yocto Project
         Initial contact in response to a report.
         Would like to start sending build and test results, particularly for
         older kernels. Would like to separate upstream commits from project
         patches first: https://bugzilla.yoctoproject.org/show_bug.cgi?id=14196

Please respond with corrections or suggestions of other CI systems to contact.

Nick

*KCIDB is an effort to unify Linux Kernel CI reporting, maintained by Linux
  Foundation's KernelCI project:
  https://foundation.kernelci.org/blog/2020/08/21/introducing-common-reporting/

