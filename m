From: "Nikolai Kondrashov" <Nikolai.Kondrashov@redhat.com>
Subject: KCIDB engagement report #kcidb
Message-ID: <ef0cf85a-1bb3-c3eb-7193-da39d7d8152f@redhat.com>
Date: Thu, 21 Jan 2021 12:07:02 +0200
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

The main news is that Gentoo GKernelCI have started sending their preliminary
data to our "playground" setup. Linaro have also started work on sending
tuxmake build results, but no reports have arrived yet.

     KernelCI native
         Sending staging results.
         Transitioning to production results is at 50%
         (KCIDB support done, backend work started).
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
!       Preliminary data (revisions and builds) have started flowing into
!       "playground" KCIDB. No timestamps yet.
!       https://staging.kernelci.org:3000/d/home/home?var-origin=gkernelci&var-dataset=playground_kernelci04

     Intel 0day
         Initial conversation concluded, general interest expressed,
         no contact since.

!   Linaro
!       Work has started on sending tuxmake build results
!       (a part of https://tuxsuite.com/). No reports have arrived yet.

Please respond with corrections or suggestions of other CI systems to contact.

Nick

*KCIDB is an effort to unify Linux Kernel CI reporting, maintained by Linux
  Foundation's KernelCI project:
  https://foundation.kernelci.org/blog/2020/08/21/introducing-common-reporting/

