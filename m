From: "Guillaume Tucker" <guillaume.tucker@gmail.com>
Subject: kernelci.org update - 2019-05-07
Message-ID: <4e3d9c4d-d38c-5579-2408-26c6e7c1d97d@collabora.com>
Date: Tue, 7 May 2019 11:36:34 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
List-ID: <kernelci.groups.io>
To: kernelci@groups.io

Summary of changes going into production today:

kernelci-core
-------------

* fix test configuration for x86 defconfigs, to enable more boots and tests
  with the standard x86 defconfigs

* use gcc-8 as default compiler instead of gcc-7
  (Debian Buster only provides cross-compiler toolchains for gcc-8)

* build uImage.gz kernel binaries for MIPS
  (3 MIPS defconfigs are now failing due to this)

* build Image kernel binaries for RISC-V

* several new devices are being added in lab-pengatronix, some imx6 in
  particular are already providing boot test results

* fix stretch-v4l2 rootfs by adding missing autopoint package to the build
  dependencies

* build.py is now being replaced with kci_build and functions in the
  kernelci.build module (documentation will follow shortly)


kernelci-backend
----------------

* preserve order of test cases in the database (still one known issue with the
  order of test groups)

* add validation step for the boot and test meta-data in addition to the main
  API arguments, to return an HTTP error if some unknown meta-data fields are
  present or if some mandatory ones are missing


Best wishes,
Guillaume
