Return-Path: <khilman@baylibre.com>
From: "Kevin Hilman" <khilman@baylibre.com>
Subject: Re: MIPS build failures in kernelCI
In-Reply-To: <20190128223906.b73t4tympcpom5fl@pburton-laptop>
References: <7hpnsgrgel.fsf@baylibre.com> <20190128223906.b73t4tympcpom5fl@pburton-laptop>
Date: Tue, 29 Jan 2019 10:18:33 +0100
Message-ID: <7hy373q0t2.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
List-ID: <kernelci.groups.io>
To: Paul Burton <paul.burton@mips.com>
Cc: "kernelci@groups.io" <kernelci@groups.io>

Paul Burton <paul.burton@mips.com> writes:

> Hi Kevin,
>
> On Mon, Jan 28, 2019 at 03:44:02PM +0100, Kevin Hilman wrote:
>> We're having various build failures for a handful of defconfigs with
>> linux-next and mainline:
>> 
>> Go to one of these views, and click on "Failed":
>> mainline: https://kernelci.org/build/mainline/branch/master/kernel/v5.0-rc4/
>> 
>> Some of those defconfig targets (decstation_defconfig,
>> jmr3927_defconfig) are failing with:
>> 
>>      cc1: error: '-march=r3900' requires '-mfp32'
>> 
>> We're trying to use standard debian compilers for all targets, and for
>> MIPS we're using: mips-linux-gnu-gcc (Debian 7.4.0-1) 7.4.0
>
> Thanks for the report. I've just submitted a fix for that [1], and
> assuming nobody points out a problem in the next day or so I'll apply it
> to my mips-fixes branch.
>
>> The other build failures seem to be failing because there is no make
>> target for uImage.gz (which we set as the default target for MIPS.)
>> 
>> We don't currently have a good way to have different make targets for
>> different defconfigs.
>
> Would it be an option to build the 'all' target? That typically
> generates the appropriate image for the configured platform.

Yes, I'll look at switching to that.  A quick test locally suggest that
will work fine.

>> Switching to linux-next:
>>  https://kernelci.org/build/next/branch/master/kernel/next-20190125/
>> 
>> There are a few more build failures that seem to be missig some tools:
>> 
>>    ./arch/mips/tools/elf-entry: Command not found
>> 
>> This smells like a build step missing for the uImage.gz target?
>
> Hmm, I'm confused as to what happened there & haven't yet managed to
> reproduce it locally. The elf-entry tool is built as part of the
> archscripts target which ought to run for pretty much any build. I don't
> suppose it got built but failed to execute for some reason? Is there a
> way to get the full build log which should show the tool being built?

Below is a more verbose build log from today's linux-next for
loongson1b_defconfig from my debian box. It looks like I'm seeing even
more errors than the kernelCI build.

I haven't looked any deepers, but note that kernelCI builds use
KBUILD_OUTPUT (note the make O=) and sometimes when new tools are added,
they don't compile correctly when using KBUILD_OUTPUT.  That might be
the first thing to verify.

Kevin



#
# make -j42 -k ARCH=mips HOSTCC=gcc CROSS_COMPILE=mips-linux-gnu- O=build-mips loongson1b_defconfig
#
make[1]: Entering directory '/work/kernel/next/build-mips'
  HOSTCC  scripts/basic/fixdep
  GEN     Makefile
  HOSTCC  scripts/kconfig/conf.o
  HOSTCC  scripts/kconfig/confdata.o
  HOSTCC  scripts/kconfig/expr.o
  HOSTCC  scripts/kconfig/symbol.o
  HOSTCC  scripts/kconfig/preprocess.o
  LEX     scripts/kconfig/zconf.lex.c
  YACC    scripts/kconfig/zconf.tab.h
  YACC    scripts/kconfig/zconf.tab.c
  HOSTCC  scripts/kconfig/zconf.tab.o
  HOSTCC  scripts/kconfig/zconf.lex.o
  HOSTLD  scripts/kconfig/conf
#
# configuration written to .config
#
make[1]: Leaving directory '/work/kernel/next/build-mips'
#
# make -j42 -k ARCH=mips HOSTCC=gcc CROSS_COMPILE=mips-linux-gnu- O=build-mips all
#
make[1]: Entering directory '/work/kernel/next/build-mips'
  SYSTBL  arch/mips/include/generated/asm/syscall_table_32_o32.h
  SYSTBL  arch/mips/include/generated/asm/syscall_table_64_n32.h
  SYSTBL  arch/mips/include/generated/asm/syscall_table_64_o32.h
  SYSTBL  arch/mips/include/generated/asm/syscall_table_64_n64.h
  SYSHDR  arch/mips/include/generated/uapi/asm/unistd_n32.h
  SYSHDR  arch/mips/include/generated/uapi/asm/unistd_n64.h
  SYSHDR  arch/mips/include/generated/uapi/asm/unistd_o32.h
  SYSNR  arch/mips/include/generated/uapi/asm/unistd_nr_n32.h
  SYSNR  arch/mips/include/generated/uapi/asm/unistd_nr_n64.h
  SYSNR  arch/mips/include/generated/uapi/asm/unistd_nr_o32.h
  GEN     Makefile
  WRAP    arch/mips/include/generated/uapi/asm/bpf_perf_event.h
  WRAP    arch/mips/include/generated/uapi/asm/ipcbuf.h
  GENHDR  include/generated/atomic-fallback.h
  GENHDR  include/generated/atomic-instrumented.h
  GENHDR  include/generated/atomic-long.h
  WRAP    arch/mips/include/generated/asm/current.h
  WRAP    arch/mips/include/generated/asm/device.h
  WRAP    arch/mips/include/generated/asm/dma-contiguous.h
  WRAP    arch/mips/include/generated/asm/emergency-restart.h
  WRAP    arch/mips/include/generated/asm/export.h
  WRAP    arch/mips/include/generated/asm/irq_work.h
  WRAP    arch/mips/include/generated/asm/local64.h
  WRAP    arch/mips/include/generated/asm/msi.h
  WRAP    arch/mips/include/generated/asm/mm-arch-hooks.h
  WRAP    arch/mips/include/generated/asm/parport.h
  WRAP    arch/mips/include/generated/asm/mcs_spinlock.h
  WRAP    arch/mips/include/generated/asm/percpu.h
  WRAP    arch/mips/include/generated/asm/preempt.h
  WRAP    arch/mips/include/generated/asm/qrwlock.h
  WRAP    arch/mips/include/generated/asm/qspinlock.h
  WRAP    arch/mips/include/generated/asm/sections.h
  WRAP    arch/mips/include/generated/asm/segment.h
  WRAP    arch/mips/include/generated/asm/trace_clock.h
  WRAP    arch/mips/include/generated/asm/unaligned.h
  WRAP    arch/mips/include/generated/asm/user.h
  WRAP    arch/mips/include/generated/asm/word-at-a-time.h
  WRAP    arch/mips/include/generated/asm/xor.h
  UPD     include/generated/uapi/linux/version.h
  HOSTCC  arch/mips/tools/elf-entry
  HOSTCC  scripts/bin2c
  HOSTCC  scripts/kallsyms
  HOSTCC  scripts/conmakehash
  HOSTCC  scripts/sortextable
  HOSTCC  scripts/genksyms/genksyms.o
  YACC    scripts/genksyms/parse.tab.c
  LEX     scripts/genksyms/lex.lex.c
  YACC    scripts/genksyms/parse.tab.h
  UPD     include/config/kernel.release
  HOSTCC  arch/mips/boot/tools/relocs_32.o
  HOSTCC  arch/mips/boot/tools/relocs_64.o
  HOSTCC  arch/mips/boot/tools/relocs_main.o
  HOSTCC  scripts/genksyms/parse.tab.o
  HOSTCC  scripts/genksyms/lex.lex.o
  Using .. as source for kernel
Unable to open input file: No such file or directory
  UPD     include/generated/utsrelease.h
  AS      arch/mips/boot/compressed/head.o
  SHIPPED arch/mips/boot/compressed/ashldi3.c
  SHIPPED arch/mips/boot/compressed/bswapsi.c
make[2]: *** No rule to make target 'vmlinux', needed by 'arch/mips/boot/compressed/vmlinux.bin'.
  CC      arch/mips/boot/compressed/decompress.o
  HOSTCC  arch/mips/boot/compressed/calc_vmlinuz_load_addr
  CC      arch/mips/boot/compressed/string.o
../arch/mips/boot/compressed/head.S: Assembler messages:
../arch/mips/boot/compressed/head.S:47: Error: invalid operands `li $26,'
../scripts/Makefile.build:367: recipe for target 'arch/mips/boot/compressed/head.o' failed
make[2]: *** [arch/mips/boot/compressed/head.o] Error 1
  CC      arch/mips/boot/compressed/dummy.o
  CC      arch/mips/boot/compressed/ashldi3.o
  CC      arch/mips/boot/compressed/bswapsi.o
  HOSTLD  arch/mips/boot/tools/relocs
/bin/sh: scripts/genksyms/genksyms: No such file or directory
/bin/sh: scripts/genksyms/genksyms: No such file or directory
arch/mips/boot/compressed/ashldi3.c:20:0: fatal error: when writing output to : Broken pipe
 
 
compilation terminated.
arch/mips/boot/compressed/bswapsi.c:4:0: fatal error: when writing output to : Broken pipe
 
 
compilation terminated.
../scripts/Makefile.build:276: recipe for target 'arch/mips/boot/compressed/ashldi3.o' failed
make[2]: *** [arch/mips/boot/compressed/ashldi3.o] Error 127
make[2]: *** Deleting file 'arch/mips/boot/compressed/ashldi3.o'
../scripts/Makefile.build:276: recipe for target 'arch/mips/boot/compressed/bswapsi.o' failed
make[2]: *** [arch/mips/boot/compressed/bswapsi.o] Error 127
make[2]: *** Deleting file 'arch/mips/boot/compressed/bswapsi.o'
  HOSTLD  scripts/genksyms/genksyms
make[2]: Target 'vmlinuz' not remade because of errors.
arch/mips/Makefile:395: recipe for target 'vmlinuz' failed
make[1]: *** [vmlinuz] Error 2
  HOSTCC  scripts/mod/mk_elfconfig
  CC      scripts/mod/devicetable-offsets.s
  CC      scripts/mod/empty.o
  MKELF   scripts/mod/elfconfig.h
  HOSTCC  scripts/mod/modpost.o
  HOSTCC  scripts/mod/sumversion.o
  UPD     scripts/mod/devicetable-offsets.h
  HOSTCC  scripts/mod/file2alias.o
  HOSTLD  scripts/mod/modpost
  CC      kernel/bounds.s
  UPD     include/generated/timeconst.h
  UPD     include/generated/bounds.h
  CC      arch/mips/kernel/asm-offsets.s
In file included from ../arch/mips/include/asm/addrspace.h:13:0,
                 from ../arch/mips/include/asm/barrier.h:11,
                 from ../include/linux/compiler.h:254,
                 from ../include/linux/kernel.h:10,
                 from ../include/linux/list.h:9,
                 from ../include/linux/preempt.h:11,
                 from ../include/linux/spinlock.h:51,
                 from ../include/linux/seqlock.h:36,
                 from ../include/linux/time.h:6,
                 from ../include/linux/compat.h:10,
                 from ../arch/mips/kernel/asm-offsets.c:12:
../arch/mips/include/asm/page.h: In function '___pa':
../arch/mips/include/asm/mach-generic/spaces.h:95:23: error: 'CAC_BASE' undeclared (first use in this function)
 #define PAGE_OFFSET  (CAC_BASE + PHYS_OFFSET)
                       ^
../arch/mips/include/asm/page.h:196:13: note: in expansion of macro 'PAGE_OFFSET'
  return x - PAGE_OFFSET + PHYS_OFFSET;
             ^~~~~~~~~~~
../arch/mips/include/asm/mach-generic/spaces.h:95:23: note: each undeclared identifier is reported only once for each function it appears in
 #define PAGE_OFFSET  (CAC_BASE + PHYS_OFFSET)
                       ^
../arch/mips/include/asm/page.h:196:13: note: in expansion of macro 'PAGE_OFFSET'
  return x - PAGE_OFFSET + PHYS_OFFSET;
             ^~~~~~~~~~~
../arch/mips/include/asm/io.h: In function 'phys_to_virt':
../arch/mips/include/asm/mach-generic/spaces.h:95:23: error: 'CAC_BASE' undeclared (first use in this function)
 #define PAGE_OFFSET  (CAC_BASE + PHYS_OFFSET)
                       ^
../arch/mips/include/asm/io.h:139:28: note: in expansion of macro 'PAGE_OFFSET'
  return (void *)(address + PAGE_OFFSET - PHYS_OFFSET);
                            ^~~~~~~~~~~
In file included from ../arch/mips/include/asm/page.h:200:0,
                 from ../include/linux/mmzone.h:21,
                 from ../include/linux/gfp.h:6,
                 from ../include/linux/slab.h:15,
                 from ../include/linux/crypto.h:24,
                 from ../include/crypto/hash.h:16,
                 from ../include/linux/uio.h:14,
                 from ../include/linux/socket.h:8,
                 from ../include/linux/compat.h:15,
                 from ../arch/mips/kernel/asm-offsets.c:12:
../arch/mips/include/asm/io.h: In function '__ioremap_mode':
../arch/mips/include/asm/io.h:184:6: error: 'cpu_has_64bit_addresses' undeclared (first use in this function)
  if (cpu_has_64bit_addresses) {
      ^~~~~~~~~~~~~~~~~~~~~~~
../arch/mips/include/asm/io.h:185:14: error: 'UNCAC_BASE' undeclared (first use in this function)
   u64 base = UNCAC_BASE;
              ^~~~~~~~~~
../arch/mips/include/asm/io.h:192:17: error: 'IO_BASE' undeclared (first use in this function)
    base = (u64) IO_BASE;
                 ^~~~~~~
../arch/mips/include/asm/io.h: In function 'iounmap':
../arch/mips/include/asm/io.h:316:6: error: 'cpu_has_64bit_addresses' undeclared (first use in this function)
  if (cpu_has_64bit_addresses ||
      ^~~~~~~~~~~~~~~~~~~~~~~
../arch/mips/include/asm/io.h: In function '__raw_writeb':
../arch/mips/include/asm/io.h:350:11: error: 'cpu_has_64bits' undeclared (first use in this function)
  else if (cpu_has_64bits) {     \
           ^
../arch/mips/include/asm/io.h:456:1: note: in expansion of macro '__BUILD_MEMORY_SINGLE'
 __BUILD_MEMORY_SINGLE(bus, bwlq, type, 1, relax, 1)
 ^~~~~~~~~~~~~~~~~~~~~
../arch/mips/include/asm/io.h:460:1: note: in expansion of macro '__BUILD_MEMORY_PFX'
 __BUILD_MEMORY_PFX(__raw_, bwlq, type, 0)    \
 ^~~~~~~~~~~~~~~~~~
../arch/mips/include/asm/io.h:465:1: note: in expansion of macro 'BUILDIO_MEM'
 BUILDIO_MEM(b, u8)
 ^~~~~~~~~~~
../arch/mips/include/asm/io.h: In function '__raw_readb':
../arch/mips/include/asm/io.h:385:11: error: 'cpu_has_64bits' undeclared (first use in this function)
  else if (cpu_has_64bits) {     \
           ^
../arch/mips/include/asm/io.h:456:1: note: in expansion of macro '__BUILD_MEMORY_SINGLE'
 __BUILD_MEMORY_SINGLE(bus, bwlq, type, 1, relax, 1)
 ^~~~~~~~~~~~~~~~~~~~~
../arch/mips/include/asm/io.h:460:1: note: in expansion of macro '__BUILD_MEMORY_PFX'
 __BUILD_MEMORY_PFX(__raw_, bwlq, type, 0)    \
 ^~~~~~~~~~~~~~~~~~
../arch/mips/include/asm/io.h:465:1: note: in expansion of macro 'BUILDIO_MEM'
 BUILDIO_MEM(b, u8)
 ^~~~~~~~~~~
../arch/mips/include/asm/io.h: In function '__relaxed_writeb':
../arch/mips/include/asm/io.h:350:11: error: 'cpu_has_64bits' undeclared (first use in this function)
  else if (cpu_has_64bits) {     \
           ^
../arch/mips/include/asm/io.h:456:1: note: in expansion of macro '__BUILD_MEMORY_SINGLE'
 __BUILD_MEMORY_SINGLE(bus, bwlq, type, 1, relax, 1)
 ^~~~~~~~~~~~~~~~~~~~~
../arch/mips/include/asm/io.h:461:1: note: in expansion of macro '__BUILD_MEMORY_PFX'
 __BUILD_MEMORY_PFX(__relaxed_, bwlq, type, 1)    \
 ^~~~~~~~~~~~~~~~~~
../arch/mips/include/asm/io.h:465:1: note: in expansion of macro 'BUILDIO_MEM'
 BUILDIO_MEM(b, u8)
 ^~~~~~~~~~~
../arch/mips/include/asm/io.h: In function '__relaxed_readb':
../arch/mips/include/asm/io.h:385:11: error: 'cpu_has_64bits' undeclared (first use in this function)
  else if (cpu_has_64bits) {     \
           ^
../arch/mips/include/asm/io.h:456:1: note: in expansion of macro '__BUILD_MEMORY_SINGLE'
 __BUILD_MEMORY_SINGLE(bus, bwlq, type, 1, relax, 1)
 ^~~~~~~~~~~~~~~~~~~~~
../arch/mips/include/asm/io.h:461:1: note: in expansion of macro '__BUILD_MEMORY_PFX'
 __BUILD_MEMORY_PFX(__relaxed_, bwlq, type, 1)    \
 ^~~~~~~~~~~~~~~~~~
../arch/mips/include/asm/io.h:465:1: note: in expansion of macro 'BUILDIO_MEM'
 BUILDIO_MEM(b, u8)
 ^~~~~~~~~~~
../arch/mips/include/asm/io.h: In function '__mem_writeb':
../arch/mips/include/asm/io.h:350:11: error: 'cpu_has_64bits' undeclared (first use in this function)
  else if (cpu_has_64bits) {     \
           ^
../arch/mips/include/asm/io.h:456:1: note: in expansion of macro '__BUILD_MEMORY_SINGLE'
 __BUILD_MEMORY_SINGLE(bus, bwlq, type, 1, relax, 1)
 ^~~~~~~~~~~~~~~~~~~~~
../arch/mips/include/asm/io.h:462:1: note: in expansion of macro '__BUILD_MEMORY_PFX'
 __BUILD_MEMORY_PFX(__mem_, bwlq, type, 0)    \
 ^~~~~~~~~~~~~~~~~~
../arch/mips/include/asm/io.h:465:1: note: in expansion of macro 'BUILDIO_MEM'
 BUILDIO_MEM(b, u8)
 ^~~~~~~~~~~
../arch/mips/include/asm/io.h: In function '__mem_readb':
../arch/mips/include/asm/io.h:385:11: error: 'cpu_has_64bits' undeclared (first use in this function)
  else if (cpu_has_64bits) {     \
           ^
../arch/mips/include/asm/io.h:456:1: note: in expansion of macro '__BUILD_MEMORY_SINGLE'
 __BUILD_MEMORY_SINGLE(bus, bwlq, type, 1, relax, 1)
 ^~~~~~~~~~~~~~~~~~~~~
../arch/mips/include/asm/io.h:462:1: note: in expansion of macro '__BUILD_MEMORY_PFX'
 __BUILD_MEMORY_PFX(__mem_, bwlq, type, 0)    \
 ^~~~~~~~~~~~~~~~~~
../arch/mips/include/asm/io.h:465:1: note: in expansion of macro 'BUILDIO_MEM'
 BUILDIO_MEM(b, u8)
 ^~~~~~~~~~~
../arch/mips/include/asm/io.h: In function 'writeb':
../arch/mips/include/asm/io.h:350:11: error: 'cpu_has_64bits' undeclared (first use in this function)
  else if (cpu_has_64bits) {     \
           ^
../arch/mips/include/asm/io.h:456:1: note: in expansion of macro '__BUILD_MEMORY_SINGLE'
 __BUILD_MEMORY_SINGLE(bus, bwlq, type, 1, relax, 1)
 ^~~~~~~~~~~~~~~~~~~~~
../arch/mips/include/asm/io.h:463:1: note: in expansion of macro '__BUILD_MEMORY_PFX'
 __BUILD_MEMORY_PFX(, bwlq, type, 0)
 ^~~~~~~~~~~~~~~~~~
../arch/mips/include/asm/io.h:465:1: note: in expansion of macro 'BUILDIO_MEM'
 BUILDIO_MEM(b, u8)
 ^~~~~~~~~~~
../arch/mips/include/asm/io.h: In function 'readb':
../arch/mips/include/asm/io.h:385:11: error: 'cpu_has_64bits' undeclared (first use in this function)
  else if (cpu_has_64bits) {     \
           ^
../arch/mips/include/asm/io.h:456:1: note: in expansion of macro '__BUILD_MEMORY_SINGLE'
 __BUILD_MEMORY_SINGLE(bus, bwlq, type, 1, relax, 1)
 ^~~~~~~~~~~~~~~~~~~~~
../arch/mips/include/asm/io.h:463:1: note: in expansion of macro '__BUILD_MEMORY_PFX'
 __BUILD_MEMORY_PFX(, bwlq, type, 0)
 ^~~~~~~~~~~~~~~~~~
../arch/mips/include/asm/io.h:465:1: note: in expansion of macro 'BUILDIO_MEM'
 BUILDIO_MEM(b, u8)
 ^~~~~~~~~~~
../arch/mips/include/asm/io.h: In function '__raw_writew':
../arch/mips/include/asm/io.h:350:11: error: 'cpu_has_64bits' undeclared (first use in this function)
  else if (cpu_has_64bits) {     \
           ^
../arch/mips/include/asm/io.h:456:1: note: in expansion of macro '__BUILD_MEMORY_SINGLE'
 __BUILD_MEMORY_SINGLE(bus, bwlq, type, 1, relax, 1)
 ^~~~~~~~~~~~~~~~~~~~~
../arch/mips/include/asm/io.h:460:1: note: in expansion of macro '__BUILD_MEMORY_PFX'
 __BUILD_MEMORY_PFX(__raw_, bwlq, type, 0)    \
 ^~~~~~~~~~~~~~~~~~
../arch/mips/include/asm/io.h:466:1: note: in expansion of macro 'BUILDIO_MEM'
 BUILDIO_MEM(w, u16)
 ^~~~~~~~~~~
../arch/mips/include/asm/io.h: In function '__raw_readw':
../arch/mips/include/asm/io.h:385:11: error: 'cpu_has_64bits' undeclared (first use in this function)
  else if (cpu_has_64bits) {     \
           ^
../arch/mips/include/asm/io.h:456:1: note: in expansion of macro '__BUILD_MEMORY_SINGLE'
 __BUILD_MEMORY_SINGLE(bus, bwlq, type, 1, relax, 1)
 ^~~~~~~~~~~~~~~~~~~~~
../arch/mips/include/asm/io.h:460:1: note: in expansion of macro '__BUILD_MEMORY_PFX'
 __BUILD_MEMORY_PFX(__raw_, bwlq, type, 0)    \
 ^~~~~~~~~~~~~~~~~~
../arch/mips/include/asm/io.h:466:1: note: in expansion of macro 'BUILDIO_MEM'
 BUILDIO_MEM(w, u16)
 ^~~~~~~~~~~
../arch/mips/include/asm/io.h: In function '__relaxed_writew':
../arch/mips/include/asm/io.h:350:11: error: 'cpu_has_64bits' undeclared (first use in this function)
  else if (cpu_has_64bits) {     \
           ^
../arch/mips/include/asm/io.h:456:1: note: in expansion of macro '__BUILD_MEMORY_SINGLE'
 __BUILD_MEMORY_SINGLE(bus, bwlq, type, 1, relax, 1)
 ^~~~~~~~~~~~~~~~~~~~~
../arch/mips/include/asm/io.h:461:1: note: in expansion of macro '__BUILD_MEMORY_PFX'
 __BUILD_MEMORY_PFX(__relaxed_, bwlq, type, 1)    \
 ^~~~~~~~~~~~~~~~~~
../arch/mips/include/asm/io.h:466:1: note: in expansion of macro 'BUILDIO_MEM'
 BUILDIO_MEM(w, u16)
 ^~~~~~~~~~~
../arch/mips/include/asm/io.h: In function '__relaxed_readw':
../arch/mips/include/asm/io.h:385:11: error: 'cpu_has_64bits' undeclared (first use in this function)
  else if (cpu_has_64bits) {     \
           ^
../arch/mips/include/asm/io.h:456:1: note: in expansion of macro '__BUILD_MEMORY_SINGLE'
 __BUILD_MEMORY_SINGLE(bus, bwlq, type, 1, relax, 1)
 ^~~~~~~~~~~~~~~~~~~~~
../arch/mips/include/asm/io.h:461:1: note: in expansion of macro '__BUILD_MEMORY_PFX'
 __BUILD_MEMORY_PFX(__relaxed_, bwlq, type, 1)    \
 ^~~~~~~~~~~~~~~~~~
../arch/mips/include/asm/io.h:466:1: note: in expansion of macro 'BUILDIO_MEM'
 BUILDIO_MEM(w, u16)
 ^~~~~~~~~~~
../arch/mips/include/asm/io.h: In function '__mem_writew':
../arch/mips/include/asm/io.h:350:11: error: 'cpu_has_64bits' undeclared (first use in this function)
  else if (cpu_has_64bits) {     \
           ^
../arch/mips/include/asm/io.h:456:1: note: in expansion of macro '__BUILD_MEMORY_SINGLE'
 __BUILD_MEMORY_SINGLE(bus, bwlq, type, 1, relax, 1)
 ^~~~~~~~~~~~~~~~~~~~~
../arch/mips/include/asm/io.h:462:1: note: in expansion of macro '__BUILD_MEMORY_PFX'
 __BUILD_MEMORY_PFX(__mem_, bwlq, type, 0)    \
 ^~~~~~~~~~~~~~~~~~
../arch/mips/include/asm/io.h:466:1: note: in expansion of macro 'BUILDIO_MEM'
 BUILDIO_MEM(w, u16)
 ^~~~~~~~~~~
../arch/mips/include/asm/io.h: In function '__mem_readw':
../arch/mips/include/asm/io.h:385:11: error: 'cpu_has_64bits' undeclared (first use in this function)
  else if (cpu_has_64bits) {     \
           ^
../arch/mips/include/asm/io.h:456:1: note: in expansion of macro '__BUILD_MEMORY_SINGLE'
 __BUILD_MEMORY_SINGLE(bus, bwlq, type, 1, relax, 1)
 ^~~~~~~~~~~~~~~~~~~~~
../arch/mips/include/asm/io.h:462:1: note: in expansion of macro '__BUILD_MEMORY_PFX'
 __BUILD_MEMORY_PFX(__mem_, bwlq, type, 0)    \
 ^~~~~~~~~~~~~~~~~~
../arch/mips/include/asm/io.h:466:1: note: in expansion of macro 'BUILDIO_MEM'
 BUILDIO_MEM(w, u16)
 ^~~~~~~~~~~
../arch/mips/include/asm/io.h: In function 'writew':
../arch/mips/include/asm/io.h:350:11: error: 'cpu_has_64bits' undeclared (first use in this function)
  else if (cpu_has_64bits) {     \
           ^
../arch/mips/include/asm/io.h:456:1: note: in expansion of macro '__BUILD_MEMORY_SINGLE'
 __BUILD_MEMORY_SINGLE(bus, bwlq, type, 1, relax, 1)
 ^~~~~~~~~~~~~~~~~~~~~
../arch/mips/include/asm/io.h:463:1: note: in expansion of macro '__BUILD_MEMORY_PFX'
 __BUILD_MEMORY_PFX(, bwlq, type, 0)
 ^~~~~~~~~~~~~~~~~~
../arch/mips/include/asm/io.h:466:1: note: in expansion of macro 'BUILDIO_MEM'
 BUILDIO_MEM(w, u16)
 ^~~~~~~~~~~
../arch/mips/include/asm/io.h: In function 'readw':
../arch/mips/include/asm/io.h:385:11: error: 'cpu_has_64bits' undeclared (first use in this function)
  else if (cpu_has_64bits) {     \
           ^
../arch/mips/include/asm/io.h:456:1: note: in expansion of macro '__BUILD_MEMORY_SINGLE'
 __BUILD_MEMORY_SINGLE(bus, bwlq, type, 1, relax, 1)
 ^~~~~~~~~~~~~~~~~~~~~
../arch/mips/include/asm/io.h:463:1: note: in expansion of macro '__BUILD_MEMORY_PFX'
 __BUILD_MEMORY_PFX(, bwlq, type, 0)
 ^~~~~~~~~~~~~~~~~~
../arch/mips/include/asm/io.h:466:1: note: in expansion of macro 'BUILDIO_MEM'
 BUILDIO_MEM(w, u16)
 ^~~~~~~~~~~
../arch/mips/include/asm/io.h: In function '__raw_writel':
../arch/mips/include/asm/io.h:350:11: error: 'cpu_has_64bits' undeclared (first use in this function)
  else if (cpu_has_64bits) {     \
           ^
../arch/mips/include/asm/io.h:456:1: note: in expansion of macro '__BUILD_MEMORY_SINGLE'
 __BUILD_MEMORY_SINGLE(bus, bwlq, type, 1, relax, 1)
 ^~~~~~~~~~~~~~~~~~~~~
../arch/mips/include/asm/io.h:460:1: note: in expansion of macro '__BUILD_MEMORY_PFX'
 __BUILD_MEMORY_PFX(__raw_, bwlq, type, 0)    \
 ^~~~~~~~~~~~~~~~~~
../arch/mips/include/asm/io.h:467:1: note: in expansion of macro 'BUILDIO_MEM'
 BUILDIO_MEM(l, u32)
 ^~~~~~~~~~~
../arch/mips/include/asm/io.h: In function '__raw_readl':
../arch/mips/include/asm/io.h:385:11: error: 'cpu_has_64bits' undeclared (first use in this function)
  else if (cpu_has_64bits) {     \
           ^
../arch/mips/include/asm/io.h:456:1: note: in expansion of macro '__BUILD_MEMORY_SINGLE'
 __BUILD_MEMORY_SINGLE(bus, bwlq, type, 1, relax, 1)
 ^~~~~~~~~~~~~~~~~~~~~
../arch/mips/include/asm/io.h:460:1: note: in expansion of macro '__BUILD_MEMORY_PFX'
 __BUILD_MEMORY_PFX(__raw_, bwlq, type, 0)    \
 ^~~~~~~~~~~~~~~~~~
../arch/mips/include/asm/io.h:467:1: note: in expansion of macro 'BUILDIO_MEM'
 BUILDIO_MEM(l, u32)
 ^~~~~~~~~~~
../arch/mips/include/asm/io.h: In function '__relaxed_writel':
../arch/mips/include/asm/io.h:350:11: error: 'cpu_has_64bits' undeclared (first use in this function)
  else if (cpu_has_64bits) {     \
           ^
../arch/mips/include/asm/io.h:456:1: note: in expansion of macro '__BUILD_MEMORY_SINGLE'
 __BUILD_MEMORY_SINGLE(bus, bwlq, type, 1, relax, 1)
 ^~~~~~~~~~~~~~~~~~~~~
../arch/mips/include/asm/io.h:461:1: note: in expansion of macro '__BUILD_MEMORY_PFX'
 __BUILD_MEMORY_PFX(__relaxed_, bwlq, type, 1)    \
 ^~~~~~~~~~~~~~~~~~
../arch/mips/include/asm/io.h:467:1: note: in expansion of macro 'BUILDIO_MEM'
 BUILDIO_MEM(l, u32)
 ^~~~~~~~~~~
../arch/mips/include/asm/io.h: In function '__relaxed_readl':
../arch/mips/include/asm/io.h:385:11: error: 'cpu_has_64bits' undeclared (first use in this function)
  else if (cpu_has_64bits) {     \
           ^
../arch/mips/include/asm/io.h:456:1: note: in expansion of macro '__BUILD_MEMORY_SINGLE'
 __BUILD_MEMORY_SINGLE(bus, bwlq, type, 1, relax, 1)
 ^~~~~~~~~~~~~~~~~~~~~
../arch/mips/include/asm/io.h:461:1: note: in expansion of macro '__BUILD_MEMORY_PFX'
 __BUILD_MEMORY_PFX(__relaxed_, bwlq, type, 1)    \
 ^~~~~~~~~~~~~~~~~~
../arch/mips/include/asm/io.h:467:1: note: in expansion of macro 'BUILDIO_MEM'
 BUILDIO_MEM(l, u32)
 ^~~~~~~~~~~
../arch/mips/include/asm/io.h: In function '__mem_writel':
../arch/mips/include/asm/io.h:350:11: error: 'cpu_has_64bits' undeclared (first use in this function)
  else if (cpu_has_64bits) {     \
           ^
../arch/mips/include/asm/io.h:456:1: note: in expansion of macro '__BUILD_MEMORY_SINGLE'
 __BUILD_MEMORY_SINGLE(bus, bwlq, type, 1, relax, 1)
 ^~~~~~~~~~~~~~~~~~~~~
../arch/mips/include/asm/io.h:462:1: note: in expansion of macro '__BUILD_MEMORY_PFX'
 __BUILD_MEMORY_PFX(__mem_, bwlq, type, 0)    \
 ^~~~~~~~~~~~~~~~~~
../arch/mips/include/asm/io.h:467:1: note: in expansion of macro 'BUILDIO_MEM'
 BUILDIO_MEM(l, u32)
 ^~~~~~~~~~~
../arch/mips/include/asm/io.h: In function '__mem_readl':
../arch/mips/include/asm/io.h:385:11: error: 'cpu_has_64bits' undeclared (first use in this function)
  else if (cpu_has_64bits) {     \
           ^
../arch/mips/include/asm/io.h:456:1: note: in expansion of macro '__BUILD_MEMORY_SINGLE'
 __BUILD_MEMORY_SINGLE(bus, bwlq, type, 1, relax, 1)
 ^~~~~~~~~~~~~~~~~~~~~
../arch/mips/include/asm/io.h:462:1: note: in expansion of macro '__BUILD_MEMORY_PFX'
 __BUILD_MEMORY_PFX(__mem_, bwlq, type, 0)    \
 ^~~~~~~~~~~~~~~~~~
../arch/mips/include/asm/io.h:467:1: note: in expansion of macro 'BUILDIO_MEM'
 BUILDIO_MEM(l, u32)
 ^~~~~~~~~~~
../arch/mips/include/asm/io.h: In function 'writel':
../arch/mips/include/asm/io.h:350:11: error: 'cpu_has_64bits' undeclared (first use in this function)
  else if (cpu_has_64bits) {     \
           ^
../arch/mips/include/asm/io.h:456:1: note: in expansion of macro '__BUILD_MEMORY_SINGLE'
 __BUILD_MEMORY_SINGLE(bus, bwlq, type, 1, relax, 1)
 ^~~~~~~~~~~~~~~~~~~~~
../arch/mips/include/asm/io.h:463:1: note: in expansion of macro '__BUILD_MEMORY_PFX'
 __BUILD_MEMORY_PFX(, bwlq, type, 0)
 ^~~~~~~~~~~~~~~~~~
../arch/mips/include/asm/io.h:467:1: note: in expansion of macro 'BUILDIO_MEM'
 BUILDIO_MEM(l, u32)
 ^~~~~~~~~~~
../arch/mips/include/asm/io.h: In function 'readl':
../arch/mips/include/asm/io.h:385:11: error: 'cpu_has_64bits' undeclared (first use in this function)
  else if (cpu_has_64bits) {     \
           ^
../arch/mips/include/asm/io.h:456:1: note: in expansion of macro '__BUILD_MEMORY_SINGLE'
 __BUILD_MEMORY_SINGLE(bus, bwlq, type, 1, relax, 1)
 ^~~~~~~~~~~~~~~~~~~~~
../arch/mips/include/asm/io.h:463:1: note: in expansion of macro '__BUILD_MEMORY_PFX'
 __BUILD_MEMORY_PFX(, bwlq, type, 0)
 ^~~~~~~~~~~~~~~~~~
../arch/mips/include/asm/io.h:467:1: note: in expansion of macro 'BUILDIO_MEM'
 BUILDIO_MEM(l, u32)
 ^~~~~~~~~~~
../arch/mips/include/asm/io.h: In function '__raw_writeq':
../arch/mips/include/asm/io.h:350:11: error: 'cpu_has_64bits' undeclared (first use in this function)
  else if (cpu_has_64bits) {     \
           ^
../arch/mips/include/asm/io.h:456:1: note: in expansion of macro '__BUILD_MEMORY_SINGLE'
 __BUILD_MEMORY_SINGLE(bus, bwlq, type, 1, relax, 1)
 ^~~~~~~~~~~~~~~~~~~~~
../arch/mips/include/asm/io.h:460:1: note: in expansion of macro '__BUILD_MEMORY_PFX'
 __BUILD_MEMORY_PFX(__raw_, bwlq, type, 0)    \
 ^~~~~~~~~~~~~~~~~~
../arch/mips/include/asm/io.h:468:1: note: in expansion of macro 'BUILDIO_MEM'
 BUILDIO_MEM(q, u64)
 ^~~~~~~~~~~
../arch/mips/include/asm/io.h: In function '__raw_readq':
../arch/mips/include/asm/io.h:385:11: error: 'cpu_has_64bits' undeclared (first use in this function)
  else if (cpu_has_64bits) {     \
           ^
../arch/mips/include/asm/io.h:456:1: note: in expansion of macro '__BUILD_MEMORY_SINGLE'
 __BUILD_MEMORY_SINGLE(bus, bwlq, type, 1, relax, 1)
 ^~~~~~~~~~~~~~~~~~~~~
../arch/mips/include/asm/io.h:460:1: note: in expansion of macro '__BUILD_MEMORY_PFX'
 __BUILD_MEMORY_PFX(__raw_, bwlq, type, 0)    \
 ^~~~~~~~~~~~~~~~~~
../arch/mips/include/asm/io.h:468:1: note: in expansion of macro 'BUILDIO_MEM'
 BUILDIO_MEM(q, u64)
 ^~~~~~~~~~~
../arch/mips/include/asm/io.h: In function '__relaxed_writeq':
../arch/mips/include/asm/io.h:350:11: error: 'cpu_has_64bits' undeclared (first use in this function)
  else if (cpu_has_64bits) {     \
           ^
../arch/mips/include/asm/io.h:456:1: note: in expansion of macro '__BUILD_MEMORY_SINGLE'
 __BUILD_MEMORY_SINGLE(bus, bwlq, type, 1, relax, 1)
 ^~~~~~~~~~~~~~~~~~~~~
../arch/mips/include/asm/io.h:461:1: note: in expansion of macro '__BUILD_MEMORY_PFX'
 __BUILD_MEMORY_PFX(__relaxed_, bwlq, type, 1)    \
 ^~~~~~~~~~~~~~~~~~
../arch/mips/include/asm/io.h:468:1: note: in expansion of macro 'BUILDIO_MEM'
 BUILDIO_MEM(q, u64)
 ^~~~~~~~~~~
../arch/mips/include/asm/io.h: In function '__relaxed_readq':
../arch/mips/include/asm/io.h:385:11: error: 'cpu_has_64bits' undeclared (first use in this function)
  else if (cpu_has_64bits) {     \
           ^
../arch/mips/include/asm/io.h:456:1: note: in expansion of macro '__BUILD_MEMORY_SINGLE'
 __BUILD_MEMORY_SINGLE(bus, bwlq, type, 1, relax, 1)
 ^~~~~~~~~~~~~~~~~~~~~
../arch/mips/include/asm/io.h:461:1: note: in expansion of macro '__BUILD_MEMORY_PFX'
 __BUILD_MEMORY_PFX(__relaxed_, bwlq, type, 1)    \
 ^~~~~~~~~~~~~~~~~~
../arch/mips/include/asm/io.h:468:1: note: in expansion of macro 'BUILDIO_MEM'
 BUILDIO_MEM(q, u64)
 ^~~~~~~~~~~
../arch/mips/include/asm/io.h: In function '__mem_writeq':
../arch/mips/include/asm/io.h:350:11: error: 'cpu_has_64bits' undeclared (first use in this function)
  else if (cpu_has_64bits) {     \
           ^
../arch/mips/include/asm/io.h:456:1: note: in expansion of macro '__BUILD_MEMORY_SINGLE'
 __BUILD_MEMORY_SINGLE(bus, bwlq, type, 1, relax, 1)
 ^~~~~~~~~~~~~~~~~~~~~
../arch/mips/include/asm/io.h:462:1: note: in expansion of macro '__BUILD_MEMORY_PFX'
 __BUILD_MEMORY_PFX(__mem_, bwlq, type, 0)    \
 ^~~~~~~~~~~~~~~~~~
../arch/mips/include/asm/io.h:468:1: note: in expansion of macro 'BUILDIO_MEM'
 BUILDIO_MEM(q, u64)
 ^~~~~~~~~~~
../arch/mips/include/asm/io.h: In function '__mem_readq':
../arch/mips/include/asm/io.h:385:11: error: 'cpu_has_64bits' undeclared (first use in this function)
  else if (cpu_has_64bits) {     \
           ^
../arch/mips/include/asm/io.h:456:1: note: in expansion of macro '__BUILD_MEMORY_SINGLE'
 __BUILD_MEMORY_SINGLE(bus, bwlq, type, 1, relax, 1)
 ^~~~~~~~~~~~~~~~~~~~~
../arch/mips/include/asm/io.h:462:1: note: in expansion of macro '__BUILD_MEMORY_PFX'
 __BUILD_MEMORY_PFX(__mem_, bwlq, type, 0)    \
 ^~~~~~~~~~~~~~~~~~
../arch/mips/include/asm/io.h:468:1: note: in expansion of macro 'BUILDIO_MEM'
 BUILDIO_MEM(q, u64)
 ^~~~~~~~~~~
../arch/mips/include/asm/io.h: In function 'writeq':
../arch/mips/include/asm/io.h:350:11: error: 'cpu_has_64bits' undeclared (first use in this function)
  else if (cpu_has_64bits) {     \
           ^
../arch/mips/include/asm/io.h:456:1: note: in expansion of macro '__BUILD_MEMORY_SINGLE'
 __BUILD_MEMORY_SINGLE(bus, bwlq, type, 1, relax, 1)
 ^~~~~~~~~~~~~~~~~~~~~
../arch/mips/include/asm/io.h:463:1: note: in expansion of macro '__BUILD_MEMORY_PFX'
 __BUILD_MEMORY_PFX(, bwlq, type, 0)
 ^~~~~~~~~~~~~~~~~~
../arch/mips/include/asm/io.h:468:1: note: in expansion of macro 'BUILDIO_MEM'
 BUILDIO_MEM(q, u64)
 ^~~~~~~~~~~
../arch/mips/include/asm/io.h: In function 'readq':
../arch/mips/include/asm/io.h:385:11: error: 'cpu_has_64bits' undeclared (first use in this function)
  else if (cpu_has_64bits) {     \
           ^
../arch/mips/include/asm/io.h:456:1: note: in expansion of macro '__BUILD_MEMORY_SINGLE'
 __BUILD_MEMORY_SINGLE(bus, bwlq, type, 1, relax, 1)
 ^~~~~~~~~~~~~~~~~~~~~
../arch/mips/include/asm/io.h:463:1: note: in expansion of macro '__BUILD_MEMORY_PFX'
 __BUILD_MEMORY_PFX(, bwlq, type, 0)
 ^~~~~~~~~~~~~~~~~~
../arch/mips/include/asm/io.h:468:1: note: in expansion of macro 'BUILDIO_MEM'
 BUILDIO_MEM(q, u64)
 ^~~~~~~~~~~
../arch/mips/include/asm/io.h: In function '____raw_writeq':
../arch/mips/include/asm/io.h:350:11: error: 'cpu_has_64bits' undeclared (first use in this function)
  else if (cpu_has_64bits) {     \
           ^
../arch/mips/include/asm/io.h:487:1: note: in expansion of macro '__BUILD_MEMORY_SINGLE'
 __BUILD_MEMORY_SINGLE(____raw_, bwlq, type, 1, 0, 0)
 ^~~~~~~~~~~~~~~~~~~~~
../arch/mips/include/asm/io.h:489:1: note: in expansion of macro '__BUILDIO'
 __BUILDIO(q, u64)
 ^~~~~~~~~
../arch/mips/include/asm/io.h: In function '____raw_readq':
../arch/mips/include/asm/io.h:385:11: error: 'cpu_has_64bits' undeclared (first use in this function)
  else if (cpu_has_64bits) {     \
           ^
../arch/mips/include/asm/io.h:487:1: note: in expansion of macro '__BUILD_MEMORY_SINGLE'
 __BUILD_MEMORY_SINGLE(____raw_, bwlq, type, 1, 0, 0)
 ^~~~~~~~~~~~~~~~~~~~~
../arch/mips/include/asm/io.h:489:1: note: in expansion of macro '__BUILDIO'
 __BUILDIO(q, u64)
 ^~~~~~~~~
In file included from ../include/linux/thread_info.h:38:0,
                 from ../include/asm-generic/preempt.h:5,
                 from ./arch/mips/include/generated/asm/preempt.h:1,
                 from ../include/linux/preempt.h:78,
                 from ../include/linux/spinlock.h:51,
                 from ../include/linux/seqlock.h:36,
                 from ../include/linux/time.h:6,
                 from ../include/linux/compat.h:10,
                 from ../arch/mips/kernel/asm-offsets.c:12:
../include/linux/sched.h: At top level:
../arch/mips/include/asm/thread_info.h:82:35: error: 'THREAD_SIZE_ORDER' undeclared here (not in a function)
 #define THREAD_SIZE (PAGE_SIZE << THREAD_SIZE_ORDER)
                                   ^
../include/linux/sched.h:1590:22: note: in expansion of macro 'THREAD_SIZE'
  unsigned long stack[THREAD_SIZE/sizeof(long)];
                      ^~~~~~~~~~~
In file included from ../include/linux/uaccess.h:11:0,
                 from ../include/linux/crypto.h:26,
                 from ../include/crypto/hash.h:16,
                 from ../include/linux/uio.h:14,
                 from ../include/linux/socket.h:8,
                 from ../include/linux/compat.h:15,
                 from ../arch/mips/kernel/asm-offsets.c:12:
../arch/mips/include/asm/uaccess.h: In function 'raw_copy_from_user':
../arch/mips/include/asm/uaccess.h:533:2: error: expected ':' or ')' before '__UA_ADDU'
  __UA_ADDU "\t$1, %1, %2\n\t"     \
  ^
../arch/mips/include/asm/uaccess.h:562:2: note: in expansion of macro '__invoke_copy_from'
  __invoke_copy_from(__copy_user, to, from, n)
  ^~~~~~~~~~~~~~~~~~
../arch/mips/include/asm/uaccess.h:618:10: note: in expansion of macro '__invoke_copy_from_kernel'
   return __invoke_copy_from_kernel(to, from, n);
          ^~~~~~~~~~~~~~~~~~~~~~~~~
../arch/mips/include/asm/uaccess.h:533:2: error: expected ':' or ')' before '__UA_ADDU'
  __UA_ADDU "\t$1, %1, %2\n\t"     \
  ^
../arch/mips/include/asm/uaccess.h:572:2: note: in expansion of macro '__invoke_copy_from'
  __invoke_copy_from(__copy_user, to, from, n)
  ^~~~~~~~~~~~~~~~~~
../arch/mips/include/asm/uaccess.h:620:10: note: in expansion of macro '__invoke_copy_from_user'
   return __invoke_copy_from_user(to, from, n);
          ^~~~~~~~~~~~~~~~~~~~~~~
../arch/mips/include/asm/uaccess.h: In function 'raw_copy_in_user':
../arch/mips/include/asm/uaccess.h:533:2: error: expected ':' or ')' before '__UA_ADDU'
  __UA_ADDU "\t$1, %1, %2\n\t"     \
  ^
../arch/mips/include/asm/uaccess.h:568:2: note: in expansion of macro '__invoke_copy_from'
  __invoke_copy_from(__copy_user, to, from, n)
  ^~~~~~~~~~~~~~~~~~
../arch/mips/include/asm/uaccess.h:630:10: note: in expansion of macro '___invoke_copy_in_kernel'
   return ___invoke_copy_in_kernel(to, from, n);
          ^~~~~~~~~~~~~~~~~~~~~~~~
../arch/mips/include/asm/uaccess.h:533:2: error: expected ':' or ')' before '__UA_ADDU'
  __UA_ADDU "\t$1, %1, %2\n\t"     \
  ^
../arch/mips/include/asm/uaccess.h:578:2: note: in expansion of macro '__invoke_copy_from'
  __invoke_copy_from(__copy_user, to, from, n)
  ^~~~~~~~~~~~~~~~~~
../arch/mips/include/asm/uaccess.h:632:10: note: in expansion of macro '___invoke_copy_in_user'
   return ___invoke_copy_in_user(to, from, n);
          ^~~~~~~~~~~~~~~~~~~~~~
../arch/mips/include/asm/uaccess.h: In function '__clear_user':
../arch/mips/include/asm/uaccess.h:658:42: error: expected string literal before '__UA_t0'
 #define bzero_clobbers "$4", "$5", "$6", __UA_t0, __UA_t1, "$31"
                                          ^
../arch/mips/include/asm/uaccess.h:670:6: note: in expansion of macro 'bzero_clobbers'
    : bzero_clobbers);
      ^~~~~~~~~~~~~~
../arch/mips/include/asm/uaccess.h:658:42: error: expected string literal before '__UA_t0'
 #define bzero_clobbers "$4", "$5", "$6", __UA_t0, __UA_t1, "$31"
                                          ^
../arch/mips/include/asm/uaccess.h:681:6: note: in expansion of macro 'bzero_clobbers'
    : bzero_clobbers);
      ^~~~~~~~~~~~~~
../arch/mips/include/asm/uaccess.h: In function 'strncpy_from_user':
../arch/mips/include/asm/uaccess.h:731:36: error: expected string literal before '__UA_t0'
    : "$2", "$3", "$4", "$5", "$6", __UA_t0, "$31", "memory");
                                    ^~~~~~~
../arch/mips/include/asm/uaccess.h:742:36: error: expected string literal before '__UA_t0'
    : "$2", "$3", "$4", "$5", "$6", __UA_t0, "$31", "memory");
                                    ^~~~~~~
../arch/mips/include/asm/uaccess.h: In function 'strnlen_user':
../arch/mips/include/asm/uaccess.h:777:24: error: expected string literal before '__UA_t0'
    : "$2", "$4", "$5", __UA_t0, "$31");
                        ^~~~~~~
../arch/mips/include/asm/uaccess.h:786:24: error: expected string literal before '__UA_t0'
    : "$2", "$4", "$5", __UA_t0, "$31");
                        ^~~~~~~
In file included from ../include/linux/mm.h:99:0,
                 from ../arch/mips/kernel/asm-offsets.c:15:
../arch/mips/include/asm/pgtable.h: In function 'set_pte_at':
../arch/mips/include/asm/pgtable.h:276:29: error: implicit declaration of function 'pte_pfn' [-Werror=implicit-function-declaration]
  if (pte_present(*ptep) && (pte_pfn(*ptep) == pte_pfn(pteval)))
                             ^~~~~~~
../arch/mips/include/asm/pgtable.h: At top level:
../arch/mips/include/asm/pgtable.h:509:25: error: unknown type name 'pmd_t'
  unsigned long address, pmd_t *pmdp)
                         ^~~~~
In file included from ../arch/mips/include/asm/pgtable.h:666:0,
                 from ../include/linux/mm.h:99,
                 from ../arch/mips/kernel/asm-offsets.c:15:
../include/asm-generic/pgtable.h:16:2: error: #error CONFIG_PGTABLE_LEVELS is not consistent with __PAGETABLE_{P4D,PUD,PMD}_FOLDED
 #error CONFIG_PGTABLE_LEVELS is not consistent with __PAGETABLE_{P4D,PUD,PMD}_FOLDED
  ^~~~~
../include/asm-generic/pgtable.h:45:29: error: unknown type name 'pmd_t'
      unsigned long address, pmd_t *pmdp,
                             ^~~~~
../include/asm-generic/pgtable.h:46:6: error: unknown type name 'pmd_t'
      pmd_t entry, int dirty)
      ^~~~~
../include/asm-generic/pgtable.h:52:29: error: unknown type name 'pud_t'
      unsigned long address, pud_t *pudp,
                             ^~~~~
../include/asm-generic/pgtable.h:53:6: error: unknown type name 'pud_t'
      pud_t entry, int dirty)
      ^~~~~
../include/asm-generic/pgtable.h:93:10: error: unknown type name 'pmd_t'
          pmd_t *pmdp)
          ^~~~~
../include/asm-generic/pgtable.h:116:30: error: unknown type name 'pmd_t'
       unsigned long address, pmd_t *pmdp)
                              ^~~~~
../include/asm-generic/pgtable.h:212:8: error: unknown type name 'pmd_t'
 extern pmd_t pmdp_huge_clear_flush(struct vm_area_struct *vma,
        ^~~~~
../include/asm-generic/pgtable.h:214:10: error: unknown type name 'pmd_t'
          pmd_t *pmdp);
          ^~~~~
../include/asm-generic/pgtable.h:215:8: error: unknown type name 'pud_t'
 extern pud_t pudp_huge_clear_flush(struct vm_area_struct *vma,
        ^~~~~
../include/asm-generic/pgtable.h:217:10: error: unknown type name 'pud_t'
          pud_t *pudp);
          ^~~~~
../include/asm-generic/pgtable.h:263:34: error: unknown type name 'pmd_t'
           unsigned long address, pmd_t *pmdp)
                                  ^~~~~
../include/asm-generic/pgtable.h:280:34: error: unknown type name 'pud_t'
           unsigned long address, pud_t *pudp)
                                  ^~~~~
../include/asm-generic/pgtable.h:292:15: error: unknown type name 'pmd_t'
 static inline pmd_t pmdp_collapse_flush(struct vm_area_struct *vma,
               ^~~~~
../include/asm-generic/pgtable.h:294:6: error: unknown type name 'pmd_t'
      pmd_t *pmdp)
      ^~~~~
../include/asm-generic/pgtable.h:304:62: error: unknown type name 'pmd_t'
 extern void pgtable_trans_huge_deposit(struct mm_struct *mm, pmd_t *pmdp,
                                                              ^~~~~
../include/asm-generic/pgtable.h:309:68: error: unknown type name 'pmd_t'
 extern pgtable_t pgtable_trans_huge_withdraw(struct mm_struct *mm, pmd_t *pmdp);
                                                                    ^~~~~
../include/asm-generic/pgtable.h:328:8: error: unknown type name 'pmd_t'
 extern pmd_t pmdp_invalidate(struct vm_area_struct *vma, unsigned long address,
        ^~~~~
../include/asm-generic/pgtable.h:329:8: error: unknown type name 'pmd_t'
        pmd_t *pmdp);
        ^~~~~
../include/asm-generic/pgtable.h:378:28: error: unknown type name 'pmd_t'
 static inline int pmd_same(pmd_t pmd_a, pmd_t pmd_b)
                            ^~~~~
../include/asm-generic/pgtable.h:378:41: error: unknown type name 'pmd_t'
 static inline int pmd_same(pmd_t pmd_a, pmd_t pmd_b)
                                         ^~~~~
../include/asm-generic/pgtable.h:383:28: error: unknown type name 'pud_t'
 static inline int pud_same(pud_t pud_a, pud_t pud_b)
                            ^~~~~
../include/asm-generic/pgtable.h:383:41: error: unknown type name 'pud_t'
 static inline int pud_same(pud_t pud_a, pud_t pud_b)
                                         ^~~~~
../include/asm-generic/pgtable.h:390:28: error: unknown type name 'p4d_t'
 static inline int p4d_same(p4d_t p4d_a, p4d_t p4d_b)
                            ^~~~~
../include/asm-generic/pgtable.h:390:41: error: unknown type name 'p4d_t'
 static inline int p4d_same(p4d_t p4d_a, p4d_t p4d_b)
                                         ^~~~~
../include/asm-generic/pgtable.h:561:20: error: unknown type name 'p4d_t'
 void p4d_clear_bad(p4d_t *);
                    ^~~~~
../include/asm-generic/pgtable.h:562:20: error: unknown type name 'pud_t'
 void pud_clear_bad(pud_t *);
                    ^~~~~
../include/asm-generic/pgtable.h:563:20: error: unknown type name 'pmd_t'
 void pmd_clear_bad(pmd_t *);
                    ^~~~~
../include/asm-generic/pgtable.h: In function 'pgd_none_or_clear_bad':
../include/asm-generic/pgtable.h:567:6: error: implicit declaration of function 'pgd_none' [-Werror=implicit-function-declaration]
  if (pgd_none(*pgd))
      ^~~~~~~~
In file included from ../include/linux/kernel.h:10:0,
                 from ../include/linux/list.h:9,
                 from ../include/linux/preempt.h:11,
                 from ../include/linux/spinlock.h:51,
                 from ../include/linux/seqlock.h:36,
                 from ../include/linux/time.h:6,
                 from ../include/linux/compat.h:10,
                 from ../arch/mips/kernel/asm-offsets.c:12:
../include/asm-generic/pgtable.h:569:15: error: implicit declaration of function 'pgd_bad' [-Werror=implicit-function-declaration]
  if (unlikely(pgd_bad(*pgd))) {
               ^
../include/linux/compiler.h:77:42: note: in definition of macro 'unlikely'
 # define unlikely(x) __builtin_expect(!!(x), 0)
                                          ^
In file included from ../arch/mips/include/asm/pgtable.h:666:0,
                 from ../include/linux/mm.h:99,
                 from ../arch/mips/kernel/asm-offsets.c:15:
../include/asm-generic/pgtable.h: At top level:
../include/asm-generic/pgtable.h:576:41: error: unknown type name 'p4d_t'
 static inline int p4d_none_or_clear_bad(p4d_t *p4d)
                                         ^~~~~
../include/asm-generic/pgtable.h:587:41: error: unknown type name 'pud_t'
 static inline int pud_none_or_clear_bad(pud_t *pud)
                                         ^~~~~
../include/asm-generic/pgtable.h:598:41: error: unknown type name 'pmd_t'
 static inline int pmd_none_or_clear_bad(pmd_t *pmd)
                                         ^~~~~
../include/asm-generic/pgtable.h:738:34: error: unknown type name 'pmd_t'
 static inline int pmd_soft_dirty(pmd_t pmd)
                                  ^~~~~
../include/asm-generic/pgtable.h:748:15: error: unknown type name 'pmd_t'
 static inline pmd_t pmd_mksoft_dirty(pmd_t pmd)
               ^~~~~
../include/asm-generic/pgtable.h:748:38: error: unknown type name 'pmd_t'
 static inline pmd_t pmd_mksoft_dirty(pmd_t pmd)
                                      ^~~~~
../include/asm-generic/pgtable.h:758:15: error: unknown type name 'pmd_t'
 static inline pmd_t pmd_clear_soft_dirty(pmd_t pmd)
               ^~~~~
../include/asm-generic/pgtable.h:758:42: error: unknown type name 'pmd_t'
 static inline pmd_t pmd_clear_soft_dirty(pmd_t pmd)
                                          ^~~~~
../include/asm-generic/pgtable.h:778:15: error: unknown type name 'pmd_t'
 static inline pmd_t pmd_swp_mksoft_dirty(pmd_t pmd)
               ^~~~~
../include/asm-generic/pgtable.h:778:42: error: unknown type name 'pmd_t'
 static inline pmd_t pmd_swp_mksoft_dirty(pmd_t pmd)
                                          ^~~~~
../include/asm-generic/pgtable.h:783:38: error: unknown type name 'pmd_t'
 static inline int pmd_swp_soft_dirty(pmd_t pmd)
                                      ^~~~~
../include/asm-generic/pgtable.h:788:15: error: unknown type name 'pmd_t'
 static inline pmd_t pmd_swp_clear_soft_dirty(pmd_t pmd)
               ^~~~~
../include/asm-generic/pgtable.h:788:46: error: unknown type name 'pmd_t'
 static inline pmd_t pmd_swp_clear_soft_dirty(pmd_t pmd)
                                              ^~~~~
../include/asm-generic/pgtable.h:885:34: error: unknown type name 'pmd_t'
 static inline int pmd_trans_huge(pmd_t pmd)
                                  ^~~~~
../include/asm-generic/pgtable.h:890:29: error: unknown type name 'pmd_t'
 static inline int pmd_write(pmd_t pmd)
                             ^~~~~
../include/asm-generic/pgtable.h:899:29: error: unknown type name 'pud_t'
 static inline int pud_write(pud_t pud)
                             ^~~~~
../include/asm-generic/pgtable.h:909:34: error: unknown type name 'pud_t'
 static inline int pud_trans_huge(pud_t pud)
                                  ^~~~~
../include/asm-generic/pgtable.h:916:15: error: unknown type name 'pmd_t'
 static inline pmd_t pmd_read_atomic(pmd_t *pmdp)
               ^~~~~
../include/asm-generic/pgtable.h:916:37: error: unknown type name 'pmd_t'
 static inline pmd_t pmd_read_atomic(pmd_t *pmdp)
                                     ^~~~~
../include/asm-generic/pgtable.h:951:55: error: unknown type name 'pmd_t'
 static inline int pmd_none_or_trans_huge_or_clear_bad(pmd_t *pmd)
                                                       ^~~~~
../include/asm-generic/pgtable.h:1009:38: error: unknown type name 'pmd_t'
 static inline int pmd_trans_unstable(pmd_t *pmd)
                                      ^~~~~
../include/asm-generic/pgtable.h:1032:32: error: unknown type name 'pmd_t'
 static inline int pmd_protnone(pmd_t pmd)
                                ^~~~~
../include/asm-generic/pgtable.h:1064:32: error: unknown type name 'p4d_t'
 static inline int p4d_set_huge(p4d_t *p4d, phys_addr_t addr, pgprot_t prot)
                                ^~~~~
../include/asm-generic/pgtable.h:1068:32: error: unknown type name 'pud_t'
 static inline int pud_set_huge(pud_t *pud, phys_addr_t addr, pgprot_t prot)
                                ^~~~~
../include/asm-generic/pgtable.h:1072:32: error: unknown type name 'pmd_t'
 static inline int pmd_set_huge(pmd_t *pmd, phys_addr_t addr, pgprot_t prot)
                                ^~~~~
../include/asm-generic/pgtable.h:1076:34: error: unknown type name 'p4d_t'
 static inline int p4d_clear_huge(p4d_t *p4d)
                                  ^~~~~
../include/asm-generic/pgtable.h:1080:34: error: unknown type name 'pud_t'
 static inline int pud_clear_huge(pud_t *pud)
                                  ^~~~~
../include/asm-generic/pgtable.h:1084:34: error: unknown type name 'pmd_t'
 static inline int pmd_clear_huge(pmd_t *pmd)
                                  ^~~~~
../include/asm-generic/pgtable.h:1088:37: error: unknown type name 'p4d_t'
 static inline int p4d_free_pud_page(p4d_t *p4d, unsigned long addr)
                                     ^~~~~
../include/asm-generic/pgtable.h:1092:37: error: unknown type name 'pud_t'
 static inline int pud_free_pmd_page(pud_t *pud, unsigned long addr)
                                     ^~~~~
../include/asm-generic/pgtable.h:1096:37: error: unknown type name 'pmd_t'
 static inline int pmd_free_pte_page(pmd_t *pmd, unsigned long addr)
                                     ^~~~~
In file included from ../arch/mips/kernel/asm-offsets.c:15:0:
../include/linux/mm.h:412:2: error: unknown type name 'pmd_t'
  pmd_t *pmd;   /* Pointer to pmd entry matching
  ^~~~~
../include/linux/mm.h:414:2: error: unknown type name 'pud_t'
  pud_t *pud;   /* Pointer to pud entry matching
  ^~~~~
../include/linux/mm.h:543:30: error: unknown type name 'pmd_t'
 static inline int pmd_devmap(pmd_t pmd)
                              ^~~~~
../include/linux/mm.h:547:30: error: unknown type name 'pud_t'
 static inline int pud_devmap(pud_t pud)
                              ^~~~~
In file included from ../include/linux/mm.h:562:0,
                 from ../arch/mips/kernel/asm-offsets.c:15:
../include/linux/huge_mm.h:12:5: error: unknown type name 'pmd_t'
     pmd_t *dst_pmd, pmd_t *src_pmd, unsigned long addr,
     ^~~~~
../include/linux/huge_mm.h:12:21: error: unknown type name 'pmd_t'
     pmd_t *dst_pmd, pmd_t *src_pmd, unsigned long addr,
                     ^~~~~
../include/linux/huge_mm.h:14:57: error: unknown type name 'pmd_t'
 extern void huge_pmd_set_accessed(struct vm_fault *vmf, pmd_t orig_pmd);
                                                         ^~~~~
../include/linux/huge_mm.h:16:5: error: unknown type name 'pud_t'
     pud_t *dst_pud, pud_t *src_pud, unsigned long addr,
     ^~~~~
../include/linux/huge_mm.h:16:21: error: unknown type name 'pud_t'
     pud_t *dst_pud, pud_t *src_pud, unsigned long addr,
                     ^~~~~
../include/linux/huge_mm.h:22:64: error: unknown type name 'pud_t'
 static inline void huge_pud_set_accessed(struct vm_fault *vmf, pud_t orig_pud)
                                                                ^~~~~
../include/linux/huge_mm.h:27:61: error: unknown type name 'pmd_t'
 extern vm_fault_t do_huge_pmd_wp_page(struct vm_fault *vmf, pmd_t orig_pmd);
                                                             ^~~~~
../include/linux/huge_mm.h:30:8: error: unknown type name 'pmd_t'
        pmd_t *pmd,
        ^~~~~
../include/linux/huge_mm.h:34:4: error: unknown type name 'pmd_t'
    pmd_t *pmd, unsigned long addr, unsigned long next);
    ^~~~~
../include/linux/huge_mm.h:37:4: error: unknown type name 'pmd_t'
    pmd_t *pmd, unsigned long addr);
    ^~~~~
../include/linux/huge_mm.h:40:4: error: unknown type name 'pud_t'
    pud_t *pud, unsigned long addr);
    ^~~~~
../include/linux/huge_mm.h:41:57: error: unknown type name 'pmd_t'
 extern int mincore_huge_pmd(struct vm_area_struct *vma, pmd_t *pmd,
                                                         ^~~~~
../include/linux/huge_mm.h:46:5: error: unknown type name 'pmd_t'
     pmd_t *old_pmd, pmd_t *new_pmd);
     ^~~~~
../include/linux/huge_mm.h:46:21: error: unknown type name 'pmd_t'
     pmd_t *old_pmd, pmd_t *new_pmd);
                     ^~~~~
../include/linux/huge_mm.h:47:56: error: unknown type name 'pmd_t'
 extern int change_huge_pmd(struct vm_area_struct *vma, pmd_t *pmd,
                                                        ^~~~~
../include/linux/huge_mm.h:51:4: error: unknown type name 'pmd_t'
    pmd_t *pmd, pfn_t pfn, bool write);
    ^~~~~
../include/linux/huge_mm.h:53:4: error: unknown type name 'pud_t'
    pud_t *pud, pfn_t pfn, bool write);
    ^~~~~
../include/linux/huge_mm.h:301:65: error: unknown type name 'pmd_t'
 static inline void __split_huge_pmd(struct vm_area_struct *vma, pmd_t *pmd,
                                                                 ^~~~~
../include/linux/huge_mm.h:321:31: error: unknown type name 'pmd_t'
 static inline int is_swap_pmd(pmd_t pmd)
                               ^~~~~
../include/linux/huge_mm.h:325:47: error: unknown type name 'pmd_t'
 static inline spinlock_t *pmd_trans_huge_lock(pmd_t *pmd,
                                               ^~~~~
../include/linux/huge_mm.h:330:47: error: unknown type name 'pud_t'
 static inline spinlock_t *pud_trans_huge_lock(pud_t *pud,
                                               ^~~~~
../include/linux/huge_mm.h:337:3: error: unknown type name 'pmd_t'
   pmd_t orig_pmd)
   ^~~~~
../include/linux/huge_mm.h:347:37: error: unknown type name 'pud_t'
 static inline bool is_huge_zero_pud(pud_t pud)
                                     ^~~~~
../include/linux/huge_mm.h:358:22: error: unknown type name 'pmd_t'
  unsigned long addr, pmd_t *pmd, int flags, struct dev_pagemap **pgmap)
                      ^~~~~
../include/linux/huge_mm.h:364:22: error: unknown type name 'pud_t'
  unsigned long addr, pud_t *pud, int flags, struct dev_pagemap **pgmap)
                      ^~~~~
In file included from ../arch/mips/kernel/asm-offsets.c:15:0:
../include/linux/mm.h: In function 'is_vmalloc_addr':
../include/linux/mm.h:623:17: error: 'VMALLOC_START' undeclared (first use in this function)
  return addr >= VMALLOC_START && addr < VMALLOC_END;
                 ^~~~~~~~~~~~~
../include/linux/mm.h:623:41: error: 'VMALLOC_END' undeclared (first use in this function)
  return addr >= VMALLOC_START && addr < VMALLOC_END;
                                         ^~~~~~~~~~~
In file included from ../arch/mips/include/asm/addrspace.h:13:0,
                 from ../arch/mips/include/asm/barrier.h:11,
                 from ../include/linux/compiler.h:254,
                 from ../include/linux/kernel.h:10,
                 from ../include/linux/list.h:9,
                 from ../include/linux/preempt.h:11,
                 from ../include/linux/spinlock.h:51,
                 from ../include/linux/seqlock.h:36,
                 from ../include/linux/time.h:6,
                 from ../include/linux/compat.h:10,
                 from ../arch/mips/kernel/asm-offsets.c:12:
../include/linux/mm.h: In function 'lowmem_page_address':
../arch/mips/include/asm/mach-generic/spaces.h:95:23: error: 'CAC_BASE' undeclared (first use in this function)
 #define PAGE_OFFSET  (CAC_BASE + PHYS_OFFSET)
                       ^
../arch/mips/include/asm/page.h:199:49: note: in expansion of macro 'PAGE_OFFSET'
 #define __va(x)  ((void *)((unsigned long)(x) + PAGE_OFFSET - PHYS_OFFSET))
                                                 ^~~~~~~~~~~
../include/linux/mm.h:107:25: note: in expansion of macro '__va'
 #define page_to_virt(x) __va(PFN_PHYS(page_to_pfn(x)))
                         ^~~~
../include/linux/mm.h:1277:9: note: in expansion of macro 'page_to_virt'
  return page_to_virt(page);
         ^~~~~~~~~~~~
In file included from ../arch/mips/kernel/asm-offsets.c:15:0:
../include/linux/mm.h: At top level:
../include/linux/mm.h:1401:5: error: unknown type name 'pmd_t'
     pmd_t pmd);
     ^~~~~
../include/linux/mm.h:1435:19: error: unknown type name 'pud_t'
  int (*pud_entry)(pud_t *pud, unsigned long addr,
                   ^~~~~
../include/linux/mm.h:1437:19: error: unknown type name 'pmd_t'
  int (*pmd_entry)(pmd_t *pmd, unsigned long addr,
                   ^~~~~
../include/linux/mm.h:1464:21: error: unknown type name 'pmd_t'
      pte_t **ptepp, pmd_t **pmdpp, spinlock_t **ptlp);
                     ^~~~~
../include/linux/mm.h:1798:39: error: unknown type name 'p4d_t'
 int __pud_alloc(struct mm_struct *mm, p4d_t *p4d, unsigned long address);
                                       ^~~~~
../include/linux/mm.h: In function 'mm_inc_nr_puds':
../include/linux/mm.h:1804:18: error: 'PTRS_PER_PUD' undeclared (first use in this function)
  atomic_long_add(PTRS_PER_PUD * sizeof(pud_t), &mm->pgtables_bytes);
                  ^~~~~~~~~~~~
../include/linux/mm.h:1804:40: error: 'pud_t' undeclared (first use in this function)
  atomic_long_add(PTRS_PER_PUD * sizeof(pud_t), &mm->pgtables_bytes);
                                        ^~~~~
../include/linux/mm.h: In function 'mm_dec_nr_puds':
../include/linux/mm.h:1811:18: error: 'PTRS_PER_PUD' undeclared (first use in this function)
  atomic_long_sub(PTRS_PER_PUD * sizeof(pud_t), &mm->pgtables_bytes);
                  ^~~~~~~~~~~~
../include/linux/mm.h:1811:40: error: 'pud_t' undeclared (first use in this function)
  atomic_long_sub(PTRS_PER_PUD * sizeof(pud_t), &mm->pgtables_bytes);
                                        ^~~~~
../include/linux/mm.h: At top level:
../include/linux/mm.h:1826:39: error: unknown type name 'pud_t'
 int __pmd_alloc(struct mm_struct *mm, pud_t *pud, unsigned long address);
                                       ^~~~~
../include/linux/mm.h: In function 'mm_inc_nr_pmds':
../include/linux/mm.h:1832:18: error: 'PTRS_PER_PMD' undeclared (first use in this function)
  atomic_long_add(PTRS_PER_PMD * sizeof(pmd_t), &mm->pgtables_bytes);
                  ^~~~~~~~~~~~
../include/linux/mm.h:1832:40: error: 'pmd_t' undeclared (first use in this function)
  atomic_long_add(PTRS_PER_PMD * sizeof(pmd_t), &mm->pgtables_bytes);
                                        ^~~~~
../include/linux/mm.h: In function 'mm_dec_nr_pmds':
../include/linux/mm.h:1839:18: error: 'PTRS_PER_PMD' undeclared (first use in this function)
  atomic_long_sub(PTRS_PER_PMD * sizeof(pmd_t), &mm->pgtables_bytes);
                  ^~~~~~~~~~~~
../include/linux/mm.h:1839:40: error: 'pmd_t' undeclared (first use in this function)
  atomic_long_sub(PTRS_PER_PMD * sizeof(pmd_t), &mm->pgtables_bytes);
                                        ^~~~~
../include/linux/mm.h: In function 'mm_inc_nr_ptes':
../include/linux/mm.h:1856:18: error: 'PTRS_PER_PTE' undeclared (first use in this function)
  atomic_long_add(PTRS_PER_PTE * sizeof(pte_t), &mm->pgtables_bytes);
                  ^~~~~~~~~~~~
../include/linux/mm.h: In function 'mm_dec_nr_ptes':
../include/linux/mm.h:1861:18: error: 'PTRS_PER_PTE' undeclared (first use in this function)
  atomic_long_sub(PTRS_PER_PTE * sizeof(pte_t), &mm->pgtables_bytes);
                  ^~~~~~~~~~~~
../include/linux/mm.h: At top level:
../include/linux/mm.h:1875:39: error: unknown type name 'pmd_t'
 int __pte_alloc(struct mm_struct *mm, pmd_t *pmd);
                                       ^~~~~
../include/linux/mm.h:1876:24: error: unknown type name 'pmd_t'
 int __pte_alloc_kernel(pmd_t *pmd);
                        ^~~~~
../include/linux/mm.h:1885:15: error: unknown type name 'p4d_t'
 static inline p4d_t *p4d_alloc(struct mm_struct *mm, pgd_t *pgd,
               ^~~~~
../include/linux/mm.h: In function 'p4d_alloc':
../include/linux/mm.h:1889:10: error: implicit declaration of function 'p4d_offset' [-Werror=implicit-function-declaration]
   NULL : p4d_offset(pgd, address);
          ^~~~~~~~~~
../include/linux/mm.h:1889:8: warning: pointer/integer type mismatch in conditional expression
   NULL : p4d_offset(pgd, address);
        ^
../include/linux/mm.h: At top level:
../include/linux/mm.h:1892:15: error: unknown type name 'pud_t'
 static inline pud_t *pud_alloc(struct mm_struct *mm, p4d_t *p4d,
               ^~~~~
../include/linux/mm.h:1892:54: error: unknown type name 'p4d_t'
 static inline pud_t *pud_alloc(struct mm_struct *mm, p4d_t *p4d,
                                                      ^~~~~
../include/linux/mm.h:1900:15: error: unknown type name 'pmd_t'
 static inline pmd_t *pmd_alloc(struct mm_struct *mm, pud_t *pud, unsigned long address)
               ^~~~~
../include/linux/mm.h:1900:54: error: unknown type name 'pud_t'
 static inline pmd_t *pmd_alloc(struct mm_struct *mm, pud_t *pud, unsigned long address)
                                                      ^~~~~
../include/linux/mm.h:1962:61: error: unknown type name 'pmd_t'
 static inline spinlock_t *pte_lockptr(struct mm_struct *mm, pmd_t *pmd)
                                                             ^~~~~
../include/linux/mm.h:2053:61: error: unknown type name 'pmd_t'
 static inline spinlock_t *pmd_lockptr(struct mm_struct *mm, pmd_t *pmd)
                                                             ^~~~~
../include/linux/mm.h:2065:58: error: unknown type name 'pmd_t'
 static inline spinlock_t *pmd_lock(struct mm_struct *mm, pmd_t *pmd)
                                                          ^~~~~
../include/linux/mm.h:2078:61: error: unknown type name 'pud_t'
 static inline spinlock_t *pud_lockptr(struct mm_struct *mm, pud_t *pud)
                                                             ^~~~~
../include/linux/mm.h:2083:58: error: unknown type name 'pud_t'
 static inline spinlock_t *pud_lock(struct mm_struct *mm, pud_t *pud)
                                                          ^~~~~
In file included from ../arch/mips/kernel/asm-offsets.c:15:0:
../include/linux/mm.h:2713:1: error: unknown type name 'p4d_t'
 p4d_t *vmemmap_p4d_populate(pgd_t *pgd, unsigned long addr, int node);
 ^~~~~
../include/linux/mm.h:2714:1: error: unknown type name 'pud_t'
 pud_t *vmemmap_pud_populate(p4d_t *p4d, unsigned long addr, int node);
 ^~~~~
../include/linux/mm.h:2714:29: error: unknown type name 'p4d_t'
 pud_t *vmemmap_pud_populate(p4d_t *p4d, unsigned long addr, int node);
                             ^~~~~
../include/linux/mm.h:2715:1: error: unknown type name 'pmd_t'
 pmd_t *vmemmap_pmd_populate(pud_t *pud, unsigned long addr, int node);
 ^~~~~
../include/linux/mm.h:2715:29: error: unknown type name 'pud_t'
 pmd_t *vmemmap_pmd_populate(pud_t *pud, unsigned long addr, int node);
                             ^~~~~
../include/linux/mm.h:2716:29: error: unknown type name 'pmd_t'
 pte_t *vmemmap_pte_populate(pmd_t *pmd, unsigned long addr, int node);
                             ^~~~~
In file included from ../arch/mips/kernel/asm-offsets.c:16:0:
../arch/mips/kernel/asm-offsets.c: In function 'output_mm_defines':
../arch/mips/kernel/asm-offsets.c:192:29: error: 'pmd_t' undeclared (first use in this function)
  DEFINE(_PMD_T_SIZE, sizeof(pmd_t));
                             ^
../include/linux/kbuild.h:6:62: note: in definition of macro 'DEFINE'
  asm volatile("\n.ascii \"->" #sym " %0 " #val "\"" : : "i" (val))
                                                              ^~~
../arch/mips/kernel/asm-offsets.c:201:21: error: 'PGD_ORDER' undeclared (first use in this function)
  DEFINE(_PGD_ORDER, PGD_ORDER);
                     ^
../include/linux/kbuild.h:6:62: note: in definition of macro 'DEFINE'
  asm volatile("\n.ascii \"->" #sym " %0 " #val "\"" : : "i" (val))
                                                              ^~~
../arch/mips/kernel/asm-offsets.c:203:21: error: 'PMD_ORDER' undeclared (first use in this function)
  DEFINE(_PMD_ORDER, PMD_ORDER);
                     ^
../include/linux/kbuild.h:6:62: note: in definition of macro 'DEFINE'
  asm volatile("\n.ascii \"->" #sym " %0 " #val "\"" : : "i" (val))
                                                              ^~~
../arch/mips/kernel/asm-offsets.c:205:21: error: 'PTE_ORDER' undeclared (first use in this function)
  DEFINE(_PTE_ORDER, PTE_ORDER);
                     ^
../include/linux/kbuild.h:6:62: note: in definition of macro 'DEFINE'
  asm volatile("\n.ascii \"->" #sym " %0 " #val "\"" : : "i" (val))
                                                              ^~~
../arch/mips/kernel/asm-offsets.c:207:21: error: 'PMD_SHIFT' undeclared (first use in this function)
  DEFINE(_PMD_SHIFT, PMD_SHIFT);
                     ^
../include/linux/kbuild.h:6:62: note: in definition of macro 'DEFINE'
  asm volatile("\n.ascii \"->" #sym " %0 " #val "\"" : : "i" (val))
                                                              ^~~
../arch/mips/kernel/asm-offsets.c:208:23: error: 'PGDIR_SHIFT' undeclared (first use in this function)
  DEFINE(_PGDIR_SHIFT, PGDIR_SHIFT);
                       ^
../include/linux/kbuild.h:6:62: note: in definition of macro 'DEFINE'
  asm volatile("\n.ascii \"->" #sym " %0 " #val "\"" : : "i" (val))
                                                              ^~~
../arch/mips/kernel/asm-offsets.c:210:24: error: 'PTRS_PER_PGD' undeclared (first use in this function)
  DEFINE(_PTRS_PER_PGD, PTRS_PER_PGD);
                        ^
../include/linux/kbuild.h:6:62: note: in definition of macro 'DEFINE'
  asm volatile("\n.ascii \"->" #sym " %0 " #val "\"" : : "i" (val))
                                                              ^~~
../arch/mips/kernel/asm-offsets.c:211:24: error: 'PTRS_PER_PMD' undeclared (first use in this function)
  DEFINE(_PTRS_PER_PMD, PTRS_PER_PMD);
                        ^
../include/linux/kbuild.h:6:62: note: in definition of macro 'DEFINE'
  asm volatile("\n.ascii \"->" #sym " %0 " #val "\"" : : "i" (val))
                                                              ^~~
../arch/mips/kernel/asm-offsets.c:212:24: error: 'PTRS_PER_PTE' undeclared (first use in this function)
  DEFINE(_PTRS_PER_PTE, PTRS_PER_PTE);
                        ^
../include/linux/kbuild.h:6:62: note: in definition of macro 'DEFINE'
  asm volatile("\n.ascii \"->" #sym " %0 " #val "\"" : : "i" (val))
                                                              ^~~
cc1: some warnings being treated as errors
../scripts/Makefile.build:110: recipe for target 'arch/mips/kernel/asm-offsets.s' failed
make[2]: *** [arch/mips/kernel/asm-offsets.s] Error 1
make[2]: Target '__build' not remade because of errors.
/work/kernel/next/Makefile:1087: recipe for target 'prepare0' failed
make[1]: *** [prepare0] Error 2
make[1]: Target 'all' not remade because of errors.
make[1]: Leaving directory '/work/kernel/next/build-mips'
Makefile:152: recipe for target 'sub-make' failed
make: *** [sub-make] Error 2
make: Target 'all' not remade because of errors.
