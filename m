From: "Nikolai Kondrashov" <Nikolai.Kondrashov@redhat.com>
Subject: KCIDB engagement report
Message-ID: <ff9bd354-bb93-772e-a637-afbc3869bcdd@redhat.com>
Date: Thu, 19 Nov 2020 15:23:34 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
List-ID: <kernelci.groups.io>
To: kernelci@groups.io, "automated-testing@yoctoproject.org" <automated-testing@yoctoproject.org>

Hi everyone,

Below is the first report on KCIDB* engagement, to be sent out monthly in the
future. It lists various CI systems and their status of engagement with KCIDB,
and once we get to that, will list developer engagement.

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
     Automatic reporting in development.
     Sending test reports to playground.
     https://staging.kernelci.org:3000/?var-origin=arm&var-dataset=playground_kernelci04

Sony Fuego
     Internal design in progress.

Gentoo GKernelCI
     Prototype work has started.
     Gentoo is in a CI system transition, and progress is slow.

Intel 0day
     Initial conversation concluded, general interest expressed,
     no contact since.

Google OSS-Fuzz
     Initial interest expressed.
     Guillaume, could you refresh me on what was discussed and with whom?

Linaro LKFT
     Participated in KCIDB kick-off, no contact regarding reporting since.

Please respond with corrections or suggestions of other CI systems to contact.

Nick

*KCIDB is an effort to unify Linux Kernel CI reporting, maintained by Linux
  Foundation's KernelCI project:
  https://foundation.kernelci.org/blog/2020/08/21/introducing-common-reporting/

