From: "Guillaume Tucker" <guillaume.tucker@collabora.com>
Subject: kernelci.org update - 2020-08-17 #minutes
Message-ID: <35cf9a79-ae79-071c-ec10-4558e377b5ff@collabora.com>
Date: Mon, 17 Aug 2020 13:47:05 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
List-ID: <kernelci.groups.io>
To: kernelci@groups.io

Technical Steering Committee minutes - 2020-08-11
=================================================

* KCIDB
  * Two KCIDB releases done and deployed:
    https://github.com/kernelci/kcidb/releases/tag/v6
    https://github.com/kernelci/kcidb/releases/tag/v7
  * Common Reporting article still needs review:
    https://docs.google.com/document/d/1uL-pi_H3HlYdYBBxNwGICC7N-CH8mGaddYzIvz8CaEY
  * Improving Kernel CI report throughput so we can push production data:
    https://github.com/kernelci/kcidb/issues/88
    Possible solution: https://github.com/kernelci/kcidb/issues/92

* 2020-Q3 plan update
  * KUnit: any news from Brendan?
    [KH] no, will re-ping this week
    -> PR now https://github.com/kernelci/kernelci-core/pull/464
  * kci_data wrap up
    -> next step: hook up with DT validation on staging
  * CIP plan for KernelCI separate instance
    -> work in progress
  * LTP work in progress (Laks)
    -> PR https://github.com/kernelci/kernelci-core/pull/468

* kselftest: can we get in staging before LPC?
  -> reviewing


Summary of changes going into production
========================================

* Fix for baseline-nfs rootfs
* ThunderX support added, present in lab-lkft
* CIP kernel branches added
* kci_* command line tweaks in preparation for settings file support
* Old boot-related code dropped from kernelci-backend

Best wishes,
Guillaume
