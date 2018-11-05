MIME-Version: 1.0
From: "Kevin Hilman" <khilman@baylibre.com>
Date: Mon, 5 Nov 2018 09:18:11 -0800
Message-ID: <CAOi56cVeis2079Fe_Kn9zRf5AZcZf0rRz+z_5xYM81hB_6P6eA@mail.gmail.com>
Subject: kernelCI: kernel builds for ARCH=arc
Content-Type: text/plain; charset="UTF-8"
List-ID: <kernelci.groups.io>
To: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Cc: kernelci@groups.io

Hi Alexy,

I'm working on the kernelCI build side for ARCH=arc, and running into
some basic build issues with the compilers you pointed me to.

First, on some of the builds, we're seeing:

arch/arc/Makefile:27: *** Toolchain not configured for ARCompact builds.  Stop.

In an earlier thread, you mentioned only focusing on ARCv2 ISA.
Are some of the upstream defconfigs configured for ARCompact?  If so,
could you tell us which defconfigs we should enable?

Also, I tried the latest release from here:
https://github.com/foss-for-synopsys-dwc-arc-processors/toolchain/releases/

And specifically, I tried the 2018.09-rc1 prebuilt_glibc release, and
I'm getting a bunch of link failures at the end due to mismatch
architectures.   I get the same results with the 2018.03 release
whether I try the glibc or the uclibc release.

Below is a log from an attempt with the v4.19 kernel, but I see the
same thing with the latest mainline (v4.20-rc1).

Any suggestions on what I'm doing wrong here with the toolchain setup?

Thanks,

Kevin


root@197bf8f33695:~/linux-4.19.1# arc-linux-gcc -v
Using built-in specs.
COLLECT_GCC=arc-linux-gcc
COLLECT_LTO_WRAPPER=/usr/bin/../libexec/gcc/arc-snps-linux-gnu/8.2.1/lto-wrapper
Target: arc-snps-linux-gnu
Configured with:
/SCRATCH/arcjenkins/custom-ru20-arcgnu2/workspace/arc_gnu_toolchain_release/gcc/configure
--target=arc-snps-linux-gnu --with-cpu=hs38 --disable-multilib
--with-pkgversion='ARC HS GNU/Linux glibc toolchain 2018.09-rc1'
--with-bugurl=https://github.com/foss-for-synopsys-dwc-arc-processors/toolchain/issues
--enable-fast-install=N/A --with-endian=little --disable-werror
--enable-languages=c,c++
--prefix=/SCRATCH/arcjenkins/custom-ru20-arcgnu2/workspace/arc_gnu_toolchain_release/toolchain/../release_output/arc_gnu_2018.09-rc1_prebuilt_glibc_le_archs_linux_install
--enable-shared --without-newlib --disable-libgomp --with-gnu-as
--with-gnu-ld --with-python=no
--with-sysroot=/SCRATCH/arcjenkins/custom-ru20-arcgnu2/workspace/arc_gnu_toolchain_release/toolchain/../release_output/arc_gnu_2018.09-rc1_prebuilt_glibc_le_archs_linux_install/arc-snps-linux-gnu/sysroot
Thread model: posix
gcc version 8.2.1 20180814 (ARC HS GNU/Linux glibc toolchain 2018.09-rc1)
root@197bf8f33695:~/linux-4.19.1# ARCH=arc CROSS_COMPILE=arc-linux- make -j40
  CALL    scripts/checksyscalls.sh
  CHK     include/generated/compile.h
  GEN     .version
  CHK     include/generated/compile.h
  UPD     include/generated/compile.h
  CC      init/version.o
  AR      init/built-in.a
  AR      built-in.a
  LD      vmlinux.o
arc-linux-ld: error: vmlinux.o: unable to merge ISA extension
attributes code-density
arc-linux-ld: failed to merge target specific data of file
/usr/bin/../arc-snps-linux-gnu/sysroot/usr/lib/libgcc.a(_muldi3.o)
arc-linux-ld: error: attempting to link
/usr/bin/../arc-snps-linux-gnu/sysroot/usr/lib/libgcc.a(_udivsi3.o)
with a binary vmlinux.o of different architecture
arc-linux-ld: failed to merge target specific data of file
/usr/bin/../arc-snps-linux-gnu/sysroot/usr/lib/libgcc.a(_udivsi3.o)
arc-linux-ld: error: attempting to link
/usr/bin/../arc-snps-linux-gnu/sysroot/usr/lib/libgcc.a(_divsi3.o)
with a binary vmlinux.o of different architecture
arc-linux-ld: failed to merge target specific data of file
/usr/bin/../arc-snps-linux-gnu/sysroot/usr/lib/libgcc.a(_divsi3.o)
arc-linux-ld: error: attempting to link
/usr/bin/../arc-snps-linux-gnu/sysroot/usr/lib/libgcc.a(_umodsi3.o)
with a binary vmlinux.o of different architecture
arc-linux-ld: failed to merge target specific data of file
/usr/bin/../arc-snps-linux-gnu/sysroot/usr/lib/libgcc.a(_umodsi3.o)
arc-linux-ld: error: attempting to link
/usr/bin/../arc-snps-linux-gnu/sysroot/usr/lib/libgcc.a(_modsi3.o)
with a binary vmlinux.o of different architecture
arc-linux-ld: failed to merge target specific data of file
/usr/bin/../arc-snps-linux-gnu/sysroot/usr/lib/libgcc.a(_modsi3.o)
arc-linux-ld: error: attempting to link
/usr/bin/../arc-snps-linux-gnu/sysroot/usr/lib/libgcc.a(_divmod_tools.o)
with a binary vmlinux.o of different architecture
arc-linux-ld: failed to merge target specific data of file
/usr/bin/../arc-snps-linux-gnu/sysroot/usr/lib/libgcc.a(_divmod_tools.o)
arc-linux-ld: error: attempting to link
/usr/bin/../arc-snps-linux-gnu/sysroot/usr/lib/libgcc.a(_lshrdi3.o)
with a binary vmlinux.o of different architecture
arc-linux-ld: failed to merge target specific data of file
/usr/bin/../arc-snps-linux-gnu/sysroot/usr/lib/libgcc.a(_lshrdi3.o)
arc-linux-ld: error: attempting to link
/usr/bin/../arc-snps-linux-gnu/sysroot/usr/lib/libgcc.a(_ashldi3.o)
with a binary vmlinux.o of different architecture
arc-linux-ld: failed to merge target specific data of file
/usr/bin/../arc-snps-linux-gnu/sysroot/usr/lib/libgcc.a(_ashldi3.o)
arc-linux-ld: error: attempting to link
/usr/bin/../arc-snps-linux-gnu/sysroot/usr/lib/libgcc.a(_ashrdi3.o)
with a binary vmlinux.o of different architecture
arc-linux-ld: failed to merge target specific data of file
/usr/bin/../arc-snps-linux-gnu/sysroot/usr/lib/libgcc.a(_ashrdi3.o)
arc-linux-ld: error: attempting to link
/usr/bin/../arc-snps-linux-gnu/sysroot/usr/lib/libgcc.a(_cmpdi2.o)
with a binary vmlinux.o of different architecture
arc-linux-ld: failed to merge target specific data of file
/usr/bin/../arc-snps-linux-gnu/sysroot/usr/lib/libgcc.a(_cmpdi2.o)
arc-linux-ld: error: attempting to link
/usr/bin/../arc-snps-linux-gnu/sysroot/usr/lib/libgcc.a(_ucmpdi2.o)
with a binary vmlinux.o of different architecture
arc-linux-ld: failed to merge target specific data of file
/usr/bin/../arc-snps-linux-gnu/sysroot/usr/lib/libgcc.a(_ucmpdi2.o)
arc-linux-ld: error: attempting to link
/usr/bin/../arc-snps-linux-gnu/sysroot/usr/lib/libgcc.a(_udivdi3.o)
with a binary vmlinux.o of different architecture
arc-linux-ld: failed to merge target specific data of file
/usr/bin/../arc-snps-linux-gnu/sysroot/usr/lib/libgcc.a(_udivdi3.o)
arc-linux-ld: error: attempting to link
/usr/bin/../arc-snps-linux-gnu/sysroot/usr/lib/libgcc.a(fp-bit.o) with
a binary vmlinux.o of different architecture
arc-linux-ld: failed to merge target specific data of file
/usr/bin/../arc-snps-linux-gnu/sysroot/usr/lib/libgcc.a(fp-bit.o)
arc-linux-ld: error: attempting to link
/usr/bin/../arc-snps-linux-gnu/sysroot/usr/lib/libgcc.a(dp-bit.o) with
a binary vmlinux.o of different architecture
arc-linux-ld: failed to merge target specific data of file
/usr/bin/../arc-snps-linux-gnu/sysroot/usr/lib/libgcc.a(dp-bit.o)
arc-linux-ld: error: attempting to link
/usr/bin/../arc-snps-linux-gnu/sysroot/usr/lib/libgcc.a(_mulsi3.o)
with a binary vmlinux.o of different architecture
arc-linux-ld: failed to merge target specific data of file
/usr/bin/../arc-snps-linux-gnu/sysroot/usr/lib/libgcc.a(_mulsi3.o)
arc-linux-ld: error: attempting to link
/usr/bin/../arc-snps-linux-gnu/sysroot/usr/lib/libgcc.a(_umulsidi3.o)
with a binary vmlinux.o of different architecture
arc-linux-ld: failed to merge target specific data of file
/usr/bin/../arc-snps-linux-gnu/sysroot/usr/lib/libgcc.a(_umulsidi3.o)
make: *** [Makefile:1032: vmlinux] Error 1
