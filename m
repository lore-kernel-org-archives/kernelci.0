From: "Nikolai Kondrashov" <Nikolai.Kondrashov@redhat.com>
Subject: KCIDB engagement report #kcidb
Message-ID: <1948612a-b0cb-71d5-ca5c-5231ab6bcdb7@redhat.com>
Date: Thu, 17 Dec 2020 11:54:42 +0200
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

The main news is that ARM are now sending their production data!

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
!       Sending production results to "production" KCIDB.
!       Full commit hashes are currently not available, are spoofed, and don't
!       match the ones reported by others. To be fixed soon.
!       https://staging.kernelci.org:3000/?var-origin=arm

     Sony Fuego
         Internal design in progress.

     Gentoo GKernelCI
         Prototype work has started.
         Gentoo is in a CI system transition, and progress is slow.

     Intel 0day
         Initial conversation concluded, general interest expressed,
         no contact since.

     Google OSS-Fuzz
!       Not really suited for kernel testing, although QEMU virtual device
!       fuzzing they run could be used as a kernel test.
!       Dropping Google OSS-Fuzz in the next report.

     Linaro LKFT
         Participated in KCIDB kick-off, no contact regarding reporting since.

Please respond with corrections or suggestions of other CI systems to contact.

Nick

*KCIDB is an effort to unify Linux Kernel CI reporting, maintained by Linux
  Foundation's KernelCI project:
  https://foundation.kernelci.org/blog/2020/08/21/introducing-common-reporting/

