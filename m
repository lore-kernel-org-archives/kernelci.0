From: "Guillaume Tucker" <guillaume.tucker@gmail.com>
Subject: kernelci.org update - 2019-05-10
Message-ID: <e2b4e5b8-fc42-0a2b-4fac-b48f8af0e2f9@collabora.com>
Date: Fri, 10 May 2019 17:05:44 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
List-ID: <kernelci.groups.io>
To: kernelci@groups.io

Summary of changes going into production today:

kernelci-core
-------------

* add script to build and push all the KernelCI docker images

* enable clang-8 builds and tests for arm64 on linux-next/master

* fix sending boot reports to linux-next mailing list

* add 32-bit arm binutils to the clang-8 and clang-9 docker images to fix clang
  builds on arm (not enabled yet in production though)

* treat "OK (Not Supported)" results in v4l2-compliance as passing test cases
  rather than skipped

* enable email reports to the linux-media mailing list with v4l2-compliance
  results

* run "make all" again for MIPS, to fix spurious build errors for defconfigs
  that don't enable uImage.gz


kernelci-backend
----------------

* fix order of test groups in test results and in email reports

* fix build reports for multiple compilers

Best wishes,
Guillaume
