MIME-Version: 1.0
From: Todd Kjos <tkjos@google.com>
Date: Fri, 29 Apr 2022 15:55:13 -0700
Message-ID: <CAHRSSEyjupT5aq2Rs_k1rBrnJx_0RTN7O=A5Up3Cy+M--c7JHg@mail.gmail.com>
Subject: many kernelci errors on Android branches
Content-Type: text/plain; charset="UTF-8"
List-ID: <kernelci.groups.io>
To: kernelci@groups.io

We've been seeing massive failures in some of our branches lately that
don't seem to correlate to changes in the kernel source.

For example, all android12-5.4 builds are flagged as failing.  The actual
builds seem to work in most cases, but they are apparently flagged as
failures because of the error in the kselftest log
<https://storage.kernelci.org/android/android12-5.4/ASB-2022-04-05_12-5.4-6-g99f7ebe8ce34/arm64/gki_defconfig/gcc-10/logs/kselftest.log>
:

#
# 2022-04-25T23:25:44.634974
#
# make KBUILD_BUILD_USER=KernelCI FORMAT=.xz ARCH=arm64 HOSTCC=gcc
CROSS_COMPILE=aarch64-linux-gnu-
CROSS_COMPILE_COMPAT=arm-linux-gnueabihf- CC="ccache
aarch64-linux-gnu-gcc" O=/tmp/kci/linux/build
-C/tmp/kci/linux/tools/testing/selftests -j4 gen_tar
#
make: Entering directory '/tmp/kci/linux/tools/testing/selftests'
make: *** No rule to make target 'gen_tar'.  Stop.
make: Leaving directory '/tmp/kci/linux/tools/testing/selftests'

This started on April 25 and the 1 change since the passing builds could
not have caused the issue (change to symbol list which isn't used for
kernelci builds).

Any suggestions on how to fix this?

-Todd
