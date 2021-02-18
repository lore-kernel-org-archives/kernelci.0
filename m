From: "Nikolai Kondrashov" <Nikolai.Kondrashov@redhat.com>
Subject: #KCIDB engagement report
Message-ID: <7c0891ce-7aab-7999-fd15-6b893822537f@redhat.com>
Date: Thu, 18 Feb 2021 12:47:56 +0200
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

The main news is that Gentoo GKernelCI is now sending data to "production",
Linaro Tuxsuite is sending data to "playground" and is almost ready for
"production", and TuxML and Yocto Project have expressed their interest
in joining.

     KernelCI native
         Sending staging results.
         Transitioning to production results is at 75%
         (KCIDB support done, backend work in progress).
         https://staging.kernelci.org:3000/?var-origin=kernelci

     Red Hat CKI
         Sending production results.
         https://staging.kernelci.org:3000/?var-origin=redhat

     Google Syzbot
         Sending a subset of production results (failures only).
         https://staging.kernelci.org:3000/?var-origin=syzbot

     ARM
         Sending production results to "production" KCIDB.
         Full commit hashes are currently not available, are spoofed, and don't
         match the ones reported by others. To be fixed soon.
         https://staging.kernelci.org:3000/?var-origin=arm

     Sony Fuego
         Internal design in progress.

!   Gentoo GKernelCI
!       Sending production results to "production" KCIDB.
!       Distro patches are nicely separated from upstream commits.
!       Only x86_64 builds, no configs, no logs, and no tests for now, but
!       working on growing contributions.
!       https://staging.kernelci.org:3000/d/home/home?var-origin=gkernelci

     Intel 0day
         Initial conversation concluded, general interest expressed,
         no contact since.

!   Linaro
!       Preliminary Tuxsuite (https://tuxsuite.com/) build results are flowing
!       into "playground" KCIDB. Almost ready for "production".
!       https://staging.kernelci.org:3000/d/home/home?var-origin=tuxsuite&var-dataset=playground_kernelci04

!   TuxML
!       Initial contact in response to the last report.
!       There's a plan to approach us and start work in the coming months.

!   Yocto Project
!       Initial contact in response to the last report.
!       Would like to start sending build and test results, particularly for
!       older kernels. Would like to separate upstream commits from project
!       patches first: https://bugzilla.yoctoproject.org/show_bug.cgi?id=14196

Please respond with corrections or suggestions of other CI systems to contact.

Nick

*KCIDB is an effort to unify Linux Kernel CI reporting, maintained by Linux
  Foundation's KernelCI project:
  https://foundation.kernelci.org/blog/2020/08/21/introducing-common-reporting/

