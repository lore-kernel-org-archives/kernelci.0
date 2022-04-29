MIME-Version: 1.0
From: Todd Kjos <tkjos@google.com>
Date: Fri, 29 Apr 2022 15:22:41 -0700
Message-ID: <CAHRSSEwMoYQz2ua+PmFRcWSXJREUtrsKCFdivDJ+XdJP9Di_MQ@mail.gmail.com>
Subject: kernelci failures due to "pahole" missing
Content-Type: text/plain; charset="UTF-8"
List-ID: <kernelci.groups.io>
To: kernelci@groups.io
Cc: Connor O'Brien <connoro@google.com>, Nick Desaulniers <ndesaulniers@google.com>

We have a bunch of Android kernel test failures due to missing "pahole" in
the build environment (example android13-5.15 gki_defconfig
<https://storage.kernelci.org/android/android13-5.15/ASB-2022-04-05_13-5.15-1515-g7a68c2c45139/arm64/gki_defconfig/gcc-10/logs/kernel.log>
):


  LD      vmlinux.o
  MODPOST vmlinux.symvers
  MODINFO modules.builtin.modinfo
  GEN     modules.builtin
BTF: .tmp_vmlinux.btf: pahole (pahole) is not available
Failed to generate BTF for vmlinux
Try to disable CONFIG_DEBUG_INFO_BTF
make[1]: *** [/tmp/kci/linux/Makefile:1247: vmlinux] Error 1
make[1]: Leaving directory '/tmp/kci/linux/build'
make: *** [Makefile:237: __sub-make] Error 2
make: Leaving directory '/tmp/kci/linux'

Would it be possible to get pahole added to the build environments used to
build android kernels?

-Todd
