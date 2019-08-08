Return-Path: <dan.rue@linaro.org>
Date: Thu, 8 Aug 2019 08:03:22 -0500
From: "Dan Rue" <dan.rue@linaro.org>
Subject: Weekly Meeting 2019-08-06 #minutes
Message-ID: <20190808130322.je447ur4flzkisvn@xps.therub.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
List-ID: <kernelci.groups.io>
To: kernelci@groups.io

- broonie
  - arm64+BIG_ENDIAN still failing noisily
    - Can someone check if we’re sending the right rootfs to the
      devices?
      - [Matt] I’ve run the LAVA job generating script and the
        CONFIG_CPU_BIG_ENDIAN=y jobs all have the correct url to the BE
        ramdisk. I’ve also checked that the rootfs is actually big
        endian.
    - Also one v7 machine with a similar symptom
      https://kernelci.org/boot/id/5d4807f559b514d97f31b28e/
      - bug in Kevin’s scripts: unique to my lab
    - Looks like it’s the kernel, Matt has confirmed that we should be
      sending the right rootfs
      - Nick to test boots with clang kernels in qemu
      - Mark to send patch upstream disabling BE+clang builds until this
        works.
    - Should look at getting big endian booted on other hardware, having
      more labs would make life a lot easier.

- Kevin`
  - handling LAVA multinode jobs:
    https://github.com/kernelci/kernelci-backend/pull/152
    - motivation
    - backend data model [gtucker] see also
      https://baylibre.com/tpmp-power-measurement-platform/

- Matt
  - Email bugs and adding clang builds to my to-do this week
  - My lab will be offline from next week for the foreseeable future

