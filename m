Return-Path: <khilman@baylibre.com>
From: "Kevin Hilman" <khilman@baylibre.com>
Subject: MIPS build failures in kernelCI
Date: Mon, 28 Jan 2019 15:44:02 +0100
Message-ID: <7hpnsgrgel.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
List-ID: <kernelci.groups.io>
To: Paul Burton <paul.burton@mips.com>
Cc: kernelci@groups.io

Hi Paul,

We're having various build failures for a handful of defconfigs with
linux-next and mainline:

Go to one of these views, and click on "Failed":
mainline: https://kernelci.org/build/mainline/branch/master/kernel/v5.0-rc4/

Some of those defconfig targets (decstation_defconfig,
jmr3927_defconfig) are failing with:

     cc1: error: '-march=r3900' requires '-mfp32'

We're trying to use standard debian compilers for all targets, and for
MIPS we're using: mips-linux-gnu-gcc (Debian 7.4.0-1) 7.4.0

The other build failures seem to be failing because there is no make
target for uImage.gz (which we set as the default target for MIPS.)

We don't currently have a good way to have different make targets for
different defconfigs.

Switching to linux-next:
 https://kernelci.org/build/next/branch/master/kernel/next-20190125/

There are a few more build failures that seem to be missig some tools:

   ./arch/mips/tools/elf-entry: Command not found

This smells like a build step missing for the uImage.gz target?

Kevin
