From: "Guillaume Tucker" <guillaume.tucker@gmail.com>
Subject: kernelci.org update - 2020-05-04 #minutes
Message-ID: <8bf065e3-4a27-89ca-25d4-7763f8432e23@collabora.com>
Date: Mon, 4 May 2020 14:44:12 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
List-ID: <kernelci.groups.io>
To: kernelci@groups.io, kernelci-members@groups.io

Technical Steering Committee minutes - 2020-04-28
=================================================

* QEMU command line references?
  What KernelCI logs give you:
    https://storage.kernelci.org/next/master/next-20200428/arm/multi_v7_defconfig/gcc-8/lab-baylibre/boot-qemu_arm-virt-gicv3.html#L77
  See also the Clang QEMU boot-utils:
    https://github.com/ClangBuiltLinux/boot-utils

* Syzcaller+KernelCI
  Would be a good potential extra source of test results in kernelci.org
  Also probably for Clang-built-Linux tests
    https://github.com/ClangBuiltLinux/continuous-integration

* Clang
  1752 warnings w/ Clang-10 are the PAC/BTI extensions missing support in older
  bintuils.

* KCIDB
  Only mainline notifications are sent to the maillist now
    https://groups.io/g/kernelci-results-staging/topics
  Notification generation performance fixed
  Design doc started
  Submission HOWTO started

  Revision ID generation proposal, e.g.:
    ( echo -n "https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git@c0d73a868d9b411bd2d0c8e5ff9d98bfa8563cb1"; sha256sum *.patch | while read -r hash file; do echo -n "+$hash"; done;  ) | sha256sum
  Output: eb28f86dec5a8b98a6c3c6c2778916b48e3c00923db51720099f6ee28e376735

* kernelci.org web dashboard
  * Final tweaks on frontend before production update
    https://staging.kernelci.org

  * Feedback needed to catch issues before it goes live

  * Reviewing / fixing Mongo DB indexes

* Documentation
  Feedback needed on the current kernelci-core documentation
    https://github.com/kernelci/kernelci-core/blob/master/README.md

* Email reporting
  Log fragments enabled for failed test cases in the e-mail reports on staging

* Kubernetes
  some good progress on a separate Jenkins test instance
  fixing some issues related to managing multiple clusters


Advisory Board minutes - 2020-04-29
===================================

* Refining the survey to learn about general kernel CI users
* Follow us on Twitter https://twitter.com/kernelci


Summary of changes going into production
========================================

* baseline rootfs now has dmesg.sh built-in to parse dmesg output
* drop arc and mips from Android builds
* enable the kernelci-results-staging@groups.io mailing list
* drop lab-drue as it's now permanently offline


Best wishes,
Guillaume
