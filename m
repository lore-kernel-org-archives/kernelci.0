Subject: Re: next/master build: 229 builds: 13 failed, 216 passed, 63 errors, 131 warnings (next-20201130)
From: "Guillaume Tucker" <guillaume.tucker@collabora.com>
References: <5fc5476c.1c69fb81.43fd4.49d0@mx.google.com>
 <CAKwvOdnuaP6-tpsWiVzGLvNXHOsZxAgnYr+UjUArsU6RGWuLEQ@mail.gmail.com>
 <9ebc5cc1-e871-6c03-e420-549ce2c31c70@collabora.com>
Message-ID: <78e41d71-20d4-b8c4-35da-588a02bf3a8c@collabora.com>
Date: Mon, 7 Dec 2020 09:38:26 +0000
MIME-Version: 1.0
In-Reply-To: <9ebc5cc1-e871-6c03-e420-549ce2c31c70@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
List-ID: <kernelci.groups.io>
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: clang-built-linux <clang-built-linux@googlegroups.com>, Nathan Chancellor <natechancellor@gmail.com>, Kees Cook <keescook@chromium.org>, "kernelci-results@groups.io" <kernelci-results@groups.io>, kernelci@groups.io

+kernelci-results@groups.io and kernelci@groups.io

On 07/12/2020 09:36, Guillaume Tucker wrote:
> On 30/11/2020 19:41, Nick Desaulniers wrote:
>> Nice, we got our email reports back!  Looks like we have some cleanup
>> to do with arm32+lld, though I think those all might be addressed by:
>> https://www.armlinux.org.uk/developer/patches/viewpatch.php?id=3D9025/1
>>
>> Nathan's patches for orphan section warnings from lld 10 must have
>> been merged up by Kees.  Now to fix up the rest of these warnings.
>=20
> Great, thanks for confirming it's working again for you now.
>=20
> To avoid such issues in the future, it seems we should have a way
> to truncate very long emails.  That would mean striking the right
> balance between missing out some useful data in the emails and
> not having emails delivered at all due to their size.
>=20
> We should dig out the big emails that didn't get delivered and
> compare their size with this one to get an idea of the margin we
> have.  Since the number of builds is a known quantity, we could
> then define a maximum number of errors and warnings to show per
> build, with something like "[...] 1234 more warnings" and a link
> to the full results.  Do you think that could break your
> workflow?
>=20
> We should also be able to stop mentioning builds that passed
> with "PASS, 0 errors, 0 warnings, 0 section mismatches" now as
> they'll appear on the web dashboard anyway.  That's what we've
> been doing with test results for several months and it's working
> well.
>=20
> Thanks,
> Guillaume
>=20
>> On Mon, Nov 30, 2020 at 11:26 AM kernelci.org bot <bot@kernelci.org> wr=
ote:
>>>
>>> next/master build: 229 builds: 13 failed, 216 passed, 63 errors, 131 w=
arnings (next-20201130)
>>>
>>> Full Build Summary: https://kernelci.org/build/next/branch/master/kern=
el/next-20201130/
>>>
>>> Tree: next
>>> Branch: master
>>> Git Describe: next-20201130
>>> Git Commit: c6b11acc5f85b6e11d128fad8e0b7b223aa7e33f
>>> Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-ne=
xt.git
>>> Built: 7 unique architectures
>>>
>>> Build Failures Detected:
>>>
>>> arm64:
>>>     allmodconfig: (clang-10) FAIL
>>>     defconfig: (clang-10) FAIL
>>>     defconfig+CONFIG_ARM64_64K_PAGES=3Dy: (clang-10) FAIL
>>>     allmodconfig: (clang-11) FAIL
>>>     allmodconfig: (gcc-8) FAIL
>>>
>>> arm:
>>>     allmodconfig: (clang-10) FAIL
>>>     aspeed_g5_defconfig: (clang-10) FAIL
>>>     allmodconfig: (clang-11) FAIL
>>>     allmodconfig: (gcc-8) FAIL
>>>     milbeaut_m10v_defconfig: (gcc-8) FAIL
>>>     mini2440_defconfig: (gcc-8) FAIL
>>>     s3c2410_defconfig: (gcc-8) FAIL
>>>
>>> x86_64:
>>>     allmodconfig: (gcc-8) FAIL
>>>
>>> Errors and Warnings Detected:
>>>
>>> arc:
>>>
>>> arm64:
>>>     allmodconfig (gcc-8): 1 error, 1 warning
>>>     allmodconfig (clang-10): 1 error, 11 warnings
>>>     allmodconfig (clang-11): 1 error, 11 warnings
>>>     defconfig (gcc-8): 1 warning
>>>     defconfig (clang-10): 1 error, 5 warnings
>>>     defconfig (clang-11): 6 warnings
>>>     defconfig+CONFIG_ARM64_64K_PAGES=3Dy (clang-10): 1 error, 5 warnin=
gs
>>>     defconfig+CONFIG_ARM64_64K_PAGES=3Dy (gcc-8): 1 warning
>>>     defconfig+CONFIG_ARM64_64K_PAGES=3Dy (clang-11): 6 warnings
>>>     defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy (gcc-8): 1 warning
>>>     defconfig+CONFIG_RANDOMIZE_BASE=3Dy (gcc-8): 1 warning
>>>
>>> arm:
>>>     allmodconfig (clang-11): 21 errors
>>>     allmodconfig (gcc-8): 1 error
>>>     allmodconfig (clang-10): 20 errors, 19 warnings
>>>     aspeed_g5_defconfig (clang-10): 13 errors
>>>     axm55xx_defconfig (gcc-8): 1 warning
>>>     exynos_defconfig (gcc-8): 1 warning
>>>     keystone_defconfig (gcc-8): 1 warning
>>>     mini2440_defconfig (gcc-8): 1 error
>>>     mmp2_defconfig (gcc-8): 3 warnings
>>>     multi_v7_defconfig (gcc-8): 4 warnings
>>>     multi_v7_defconfig (clang-11): 5 warnings
>>>     multi_v7_defconfig (clang-10): 5 warnings
>>>     multi_v7_defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy (gcc-8): 4 warnings
>>>     multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy (gcc-8): 5 w=
arnings
>>>     multi_v7_defconfig+CONFIG_SMP=3Dn (gcc-8): 4 warnings
>>>     mvebu_v7_defconfig (gcc-8): 1 warning
>>>     omap1_defconfig (gcc-8): 2 warnings
>>>     pxa168_defconfig (gcc-8): 3 warnings
>>>     pxa910_defconfig (gcc-8): 3 warnings
>>>     s3c2410_defconfig (gcc-8): 1 error
>>>     tegra_defconfig (gcc-8): 1 warning
>>>
>>> i386:
>>>
>>> mips:
>>>     loongson3_defconfig (gcc-8): 1 warning
>>>     malta_qemu_32r6_defconfig (gcc-8): 1 warning
>>>     maltaup_xpa_defconfig (gcc-8): 1 warning
>>>     nlm_xlr_defconfig (gcc-8): 1 warning
>>>     rm200_defconfig (gcc-8): 1 warning
>>>     xway_defconfig (gcc-8): 2 warnings
>>>
>>> riscv:
>>>     defconfig+CONFIG_EFI=3Dn (clang-11): 1 warning
>>>     rv32_defconfig (gcc-8): 6 warnings
>>>
>>> x86_64:
>>>     allmodconfig (gcc-8): 1 error, 1 warning
>>>     tinyconfig (gcc-8): 1 warning
>>>     x86_64_defconfig (clang-10): 2 warnings
>>>     x86_64_defconfig (clang-11): 2 warnings
>>>
>>> Errors summary:
>>>
>>>     3    ERROR: modpost: "device_is_bound" [drivers/clk/imx/clk-imx-sc=
u.ko] undefined!
>>>     2    ld.lld: error: unknown argument '--be8'
>>>     2    ld.lld: error: init/main.o:(.rodata.str1.1): offset is outsid=
e the section
>>>     2    ld.lld: error: init/init_task.o:(.rodata.str1.1): offset is o=
utside the section
>>>     2    ld.lld: error: init/do_mounts.o:(.rodata.str1.1): offset is o=
utside the section
>>>     2    ld.lld: error: arch/arm/vfp/vfpmodule.o:(.rodata.str1.1): off=
set is outside the section
>>>     2    ld.lld: error: arch/arm/mm/mmu.o:(.rodata.str1.1): offset is =
outside the section
>>>     2    ld.lld: error: arch/arm/mm/init.o:(.rodata.str1.1): offset is=
 outside the section
>>>     2    ld.lld: error: arch/arm/mm/flush.o:(.rodata.str1.1): offset i=
s outside the section
>>>     2    ld.lld: error: arch/arm/mm/dma-mapping.o:(.rodata.str1.1): of=
fset is outside the section
>>>     2    ld.lld: error: arch/arm/mach-at91/pm.o:(.rodata.str1.1): offs=
et is outside the section
>>>     2    ld.lld: error: arch/arm/kernel/elf.o:(__ksymtab_strings): off=
set is outside the section
>>>     2    ERROR: modpost: "__field_overflow" [drivers/net/ipa/ipa.ko] u=
ndefined!
>>>     1    ld.lld: error: init/version.o:(__ksymtab_strings): offset is =
outside the section
>>>     1    ld.lld: error: init/version.o:(.rodata.str1.1): offset is out=
side the section
>>>     1    ld.lld: error: arch/arm/probes/decode-arm.o:(__ksymtab_string=
s): offset is outside the section
>>>     1    ld.lld: error: arch/arm/probes/decode-arm.o:(.rodata.str1.1):=
 offset is outside the section
>>>     1    ld.lld: error: arch/arm/mm/proc-syms.o:(__ksymtab_strings): o=
ffset is outside the section
>>>     1    ld.lld: error: arch/arm/mm/ioremap.o:(__ksymtab_strings): off=
set is outside the section
>>>     1    ld.lld: error: arch/arm/mm/ioremap.o:(.rodata.str1.1): offset=
 is outside the section
>>>     1    ld.lld: error: arch/arm/mm/iomap.o:(__ksymtab_strings): offse=
t is outside the section
>>>     1    ld.lld: error: arch/arm/mm/iomap.o:(.rodata.str1.1): offset i=
s outside the section
>>>     1    ld.lld: error: arch/arm/mach-mmp/sram.o:(.rodata.str1.1): off=
set is outside the section
>>>     1    ld.lld: error: arch/arm/mach-mmp/common.o:(__ksymtab_strings)=
: offset is outside the section
>>>     1    ld.lld: error: arch/arm/mach-cns3xxx/pm.o:(__ksymtab_strings)=
: offset is outside the section
>>>     1    ld.lld: error: arch/arm/mach-cns3xxx/pm.o:(.rodata.str1.1): o=
ffset is outside the section
>>>     1    ld.lld: error: arch/arm/kernel/reboot.o:(.rodata.str1.1): off=
set is outside the section
>>>     1    ld.lld: error: arch/arm/kernel/process.o:(.rodata.str1.1): of=
fset is outside the section
>>>     1    ld.lld: error: arch/arm/kernel/opcodes.o:(.rodata.str1.1): of=
fset is outside the section
>>>     1    ld.lld: error: arch/arm/common/mcpm_entry.o:(.rodata.str1.1):=
 offset is outside the section
>>>     1    ld.lld: error: arch/arm/common/krait-l2-accessors.o:(__ksymta=
b_strings): offset is outside the section
>>>     1    ld.lld: error: arch/arm/common/krait-l2-accessors.o:(.rodata.=
str1.1): offset is outside the section
>>>     1    ld.lld: error: .tmp_vmlinux.kallsyms1:(.ARM.exidx+0x37414): r=
elocation R_ARM_PREL31 out of range: 2135598372 is not in [-1073741824, 107=
3741823]
>>>     1    ld.lld: error: .tmp_vmlinux.kallsyms1:(.ARM.exidx+0x37374): r=
elocation R_ARM_PREL31 out of range: 2135598532 is not in [-1073741824, 107=
3741823]
>>>     1    ld.lld: error: .tmp_vmlinux.kallsyms1:(.ARM.exidx+0x37364): r=
elocation R_ARM_PREL31 out of range: 2135598548 is not in [-1073741824, 107=
3741823]
>>>     1    ld.lld: error: .tmp_vmlinux.kallsyms1:(.ARM.exidx+0x37314): r=
elocation R_ARM_PREL31 out of range: 2135598628 is not in [-1073741824, 107=
3741823]
>>>     1    ld.lld: error: .tmp_vmlinux.kallsyms1:(.ARM.exidx+0x37304): r=
elocation R_ARM_PREL31 out of range: 2135598644 is not in [-1073741824, 107=
3741823]
>>>     1    ld.lld: error: .tmp_vmlinux.kallsyms1:(.ARM.exidx+0x372EC): r=
elocation R_ARM_PREL31 out of range: 2135598668 is not in [-1073741824, 107=
3741823]
>>>     1    ld.lld: error: .tmp_vmlinux.kallsyms1:(.ARM.exidx+0x372D4): r=
elocation R_ARM_PREL31 out of range: 2135598692 is not in [-1073741824, 107=
3741823]
>>>     1    ld.lld: error: .tmp_vmlinux.kallsyms1:(.ARM.exidx+0x372A4): r=
elocation R_ARM_PREL31 out of range: 2135598740 is not in [-1073741824, 107=
3741823]
>>>     1    ld.lld: error: .tmp_vmlinux.kallsyms1:(.ARM.exidx+0x37274): r=
elocation R_ARM_PREL31 out of range: 2135598788 is not in [-1073741824, 107=
3741823]
>>>     1    ld.lld: error: .tmp_vmlinux.kallsyms1:(.ARM.exidx+0x3726C): r=
elocation R_ARM_PREL31 out of range: 2135598796 is not in [-1073741824, 107=
3741823]
>>>     1    ld.lld: error: .tmp_vmlinux.kallsyms1:(.ARM.exidx+0x3722C): r=
elocation R_ARM_PREL31 out of range: 2135598860 is not in [-1073741824, 107=
3741823]
>>>     1    ld.lld: error: .tmp_vmlinux.kallsyms1:(.ARM.exidx+0x37214): r=
elocation R_ARM_PREL31 out of range: 2135598884 is not in [-1073741824, 107=
3741823]
>>>     1    ld.lld: error: .tmp_vmlinux.kallsyms1:(.ARM.exidx+0x34C28): r=
elocation R_ARM_PREL31 out of range: 2135543056 is not in [-1073741824, 107=
3741823]
>>>     1    arch/arm/mach-s3c/mach-mini2440.c:47:10: fatal error: linux/m=
td/nand_ecc.h: No such file or directory
>>>     1    arch/arm/mach-s3c/mach-bast.c:27:10: fatal error: linux/mtd/n=
and_ecc.h: No such file or directory
>>>     1    ERROR: modpost: "crypto_aegis128_update_simd" [crypto/aegis12=
8.ko] undefined!
>>>     1    ./arch/arm/include/asm/kasan.h:26:11: error: expected =E2=80=
=98;=E2=80=99 before =E2=80=98void=E2=80=99
>>>
>>> Warnings summary:
>>>
>>>     19   ld.lld: warning: lld uses blx instruction, no object with arc=
hitecture supporting feature detected
>>>     18   1 warning generated.
>>>     12   drivers/hwmon/pwm-fan.c:167:22: warning: unused variable =E2=
=80=98ctx=E2=80=99 [-Wunused-variable]
>>>     9    arch/arm/boot/dts/mmp2.dtsi:472.23-480.6: Warning (spi_bus_br=
idge): /soc/apb@d4000000/spi@d4037000: incorrect #size-cells for SPI bus
>>>     9    arch/arm/boot/dts/mmp2.dtsi:472.23-480.6: Warning (spi_bus_br=
idge): /soc/apb@d4000000/spi@d4037000: incorrect #address-cells for SPI bus
>>>     9    arch/arm/boot/dts/mmp2-olpc-xo-1-75.dtb: Warning (spi_bus_reg=
): Failed prerequisite 'spi_bus_bridge'
>>>     8    drivers/hwmon/pwm-fan.c:167:22: warning: unused variable 'ctx=
' [-Wunused-variable]
>>>     6    drivers/remoteproc/qcom_sysmon.c:551:11: warning: variable 'a=
cked' is used uninitialized whenever 'if' condition is false [-Wsometimes-u=
ninitialized]
>>>     6    drivers/remoteproc/qcom_sysmon.c:536:12: note: initialize the=
 variable 'acked' to silence this warning
>>>     5    lib/cpumask.c:222:17: warning: cast from pointer to integer o=
f different size [-Wpointer-to-int-cast]
>>>     2    fs/nfsd/nfs3xdr.c:299:6: warning: variable 'err' is used unin=
itialized whenever 'if' condition is false [-Wsometimes-uninitialized]
>>>     2    drivers/mtd/nand/raw/r852.c:874:24: warning: variable 'dev' i=
s uninitialized when used here [-Wuninitialized]
>>>     2    drivers/mtd/nand/raw/r852.c:847:25: note: initialize the vari=
able 'dev' to silence this warning
>>>     2    drivers/gpu/drm/ttm/ttm_pool.c:243:21: warning: =E2=80=98ttm_=
pool_type_count=E2=80=99 defined but not used [-Wunused-function]
>>>     2    aarch64-linux-gnu-strip: warning: /scratch/linux/_modules_/li=
b/modules/5.10.0-rc5-next-20201130/kernel/drivers/media/tuners/tuner-types.=
ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
>>>     2    <stdin>:830:2: warning: #warning syscall fstat64 not implemen=
ted [-Wcpp]
>>>     2    <stdin>:1511:2: warning: #warning syscall clone3 not implemen=
ted [-Wcpp]
>>>     2    <stdin>:1127:2: warning: #warning syscall fstatat64 not imple=
mented [-Wcpp]
>>>     1    {standard input}:39: Warning: macro instruction expanded into=
 multiple instructions
>>>     1    fs/nfsd/nfs3xdr.c:293:12: note: initialize the variable 'err'=
 to silence this warning
>>>     1    drivers/net/ethernet/lantiq_etop.c:281:4: warning: ignoring r=
eturn value of =E2=80=98request_irq=E2=80=99, declared with attribute warn_=
unused_result [-Wunused-result]
>>>     1    drivers/net/ethernet/lantiq_etop.c:273:4: warning: ignoring r=
eturn value of =E2=80=98request_irq=E2=80=99, declared with attribute warn_=
unused_result [-Wunused-result]
>>>     1    drivers/gpu/drm/i915/gem/i915_gem_execbuffer.o: warning: objt=
ool: eb_prefault_relocations()+0xc6: stack state mismatch: cfa1=3D7+8 cfa2=
=3D-1+0
>>>     1    drivers/gpu/drm/i915/gem/i915_gem_execbuffer.o: warning: objt=
ool: eb_prefault_relocations()+0xb8: stack state mismatch: cfa1=3D7+8 cfa2=
=3D-1+0
>>>     1    drivers/gpu/drm/i915/gem/i915_gem_execbuffer.o: warning: objt=
ool: eb_copy_relocations()+0x259: stack state mismatch: cfa1=3D7+104 cfa2=
=3D-1+0
>>>     1    drivers/gpu/drm/i915/gem/i915_gem_execbuffer.o: warning: objt=
ool: eb_copy_relocations()+0x249: stack state mismatch: cfa1=3D7+104 cfa2=
=3D-1+0
>>>     1    drivers/block/paride/bpck.c:32: warning: "PC" redefined
>>>     1    clang: warning: argument unused during compilation: '-no-pie'=
 [-Wunused-command-line-argument]
>>>     1    arch/arm/mach-omap1/board-h2.c:347:34: warning: =E2=80=98isp1=
301_gpiod_table=E2=80=99 defined but not used [-Wunused-variable]
>>>     1    arch/arm/mach-omap1/board-ams-delta.c:462:12: warning: =E2=80=
=
=98ams_delta_camera_power=E2=80=99 defined but not used [-Wunused-function=
]
>>>     1    12: note: initialize the variable 'err' to silence this warni=
ng
>>>     1    .config:1181:warning: override: UNWINDER_GUESS changes choice=
 state
>>>
>>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>>
>>> Detailed per-defconfig build reports:
>>>
>>> ----------------------------------------------------------------------=
----------
>>> 32r2el_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches
>>>
>>> ----------------------------------------------------------------------=
----------
>>> allmodconfig (arm, clang-11) =E2=80=94 FAIL, 21 errors, 0 warnings, 0 =
section mismatches
>>>
>>> Errors:
>>>     ld.lld: error: unknown argument '--be8'
>>>     ld.lld: error: arch/arm/common/krait-l2-accessors.o:(.rodata.str1.=
1): offset is outside the section
>>>     ld.lld: error: init/version.o:(.rodata.str1.1): offset is outside =
the section
>>>     ld.lld: error: arch/arm/kernel/elf.o:(__ksymtab_strings): offset i=
s outside the section
>>>     ld.lld: error: arch/arm/vfp/vfpmodule.o:(.rodata.str1.1): offset i=
s outside the section
>>>     ld.lld: error: arch/arm/kernel/opcodes.o:(.rodata.str1.1): offset =
is outside the section
>>>     ld.lld: error: init/init_task.o:(.rodata.str1.1): offset is outsid=
e the section
>>>     ld.lld: error: arch/arm/mach-cns3xxx/pm.o:(.rodata.str1.1): offset=
 is outside the section
>>>     ld.lld: error: arch/arm/mach-at91/pm.o:(.rodata.str1.1): offset is=
 outside the section
>>>     ld.lld: error: arch/arm/kernel/reboot.o:(.rodata.str1.1): offset i=
s outside the section
>>>     ld.lld: error: arch/arm/mm/init.o:(.rodata.str1.1): offset is outs=
ide the section
>>>     ld.lld: error: init/main.o:(.rodata.str1.1): offset is outside the=
 section
>>>     ld.lld: error: arch/arm/kernel/process.o:(.rodata.str1.1): offset =
is outside the section
>>>     ld.lld: error: arch/arm/mm/iomap.o:(.rodata.str1.1): offset is out=
side the section
>>>     ld.lld: error: init/do_mounts.o:(.rodata.str1.1): offset is outsid=
e the section
>>>     ld.lld: error: arch/arm/probes/decode-arm.o:(.rodata.str1.1): offs=
et is outside the section
>>>     ld.lld: error: arch/arm/mm/ioremap.o:(.rodata.str1.1): offset is o=
utside the section
>>>     ld.lld: error: arch/arm/mm/flush.o:(.rodata.str1.1): offset is out=
side the section
>>>     ld.lld: error: arch/arm/mm/dma-mapping.o:(.rodata.str1.1): offset =
is outside the section
>>>     ld.lld: error: arch/arm/mm/proc-syms.o:(__ksymtab_strings): offset=
 is outside the section
>>>     ld.lld: error: arch/arm/mm/mmu.o:(.rodata.str1.1): offset is outsi=
de the section
>>>
>>> ----------------------------------------------------------------------=
----------
>>> allmodconfig (arm, gcc-8) =E2=80=94 FAIL, 1 error, 0 warnings, 0 secti=
on mismatches
>>>
>>> Errors:
>>>     ./arch/arm/include/asm/kasan.h:26:11: error: expected =E2=80=98;=
=E2=80=99 before =E2=80=98void=E2=80=99
>>>
>>> ----------------------------------------------------------------------=
----------
>>> allmodconfig (arm64, gcc-8) =E2=80=94 FAIL, 1 error, 1 warning, 0 sect=
ion mismatches
>>>
>>> Errors:
>>>     ERROR: modpost: "device_is_bound" [drivers/clk/imx/clk-imx-scu.ko]=
 undefined!
>>>
>>> Warnings:
>>>     drivers/hwmon/pwm-fan.c:167:22: warning: unused variable =E2=80=98=
ctx=E2=80=99 [-Wunused-variable]
>>>
>>> ----------------------------------------------------------------------=
----------
>>> allmodconfig (x86_64, gcc-8) =E2=80=94 FAIL, 1 error, 1 warning, 0 sec=
tion mismatches
>>>
>>> Errors:
>>>     ERROR: modpost: "crypto_aegis128_update_simd" [crypto/aegis128.ko]=
 undefined!
>>>
>>> Warnings:
>>>     drivers/hwmon/pwm-fan.c:167:22: warning: unused variable =E2=80=98=
ctx=E2=80=99 [-Wunused-variable]
>>>
>>> ----------------------------------------------------------------------=
----------
>>> allmodconfig (arm, clang-10) =E2=80=94 FAIL, 20 errors, 19 warnings, 0=
 section mismatches
>>>
>>> Errors:
>>>     ld.lld: error: arch/arm/common/krait-l2-accessors.o:(__ksymtab_str=
ings): offset is outside the section
>>>     ld.lld: error: unknown argument '--be8'
>>>     ld.lld: error: init/version.o:(__ksymtab_strings): offset is outsi=
de the section
>>>     ld.lld: error: arch/arm/kernel/elf.o:(__ksymtab_strings): offset i=
s outside the section
>>>     ld.lld: error: arch/arm/vfp/vfpmodule.o:(.rodata.str1.1): offset i=
s outside the section
>>>     ld.lld: error: arch/arm/probes/decode-arm.o:(__ksymtab_strings): o=
ffset is outside the section
>>>     ld.lld: error: init/init_task.o:(.rodata.str1.1): offset is outsid=
e the section
>>>     ld.lld: error: arch/arm/common/mcpm_entry.o:(.rodata.str1.1): offs=
et is outside the section
>>>     ld.lld: error: arch/arm/mach-cns3xxx/pm.o:(__ksymtab_strings): off=
set is outside the section
>>>     ld.lld: error: init/main.o:(.rodata.str1.1): offset is outside the=
 section
>>>     ld.lld: error: arch/arm/mach-at91/pm.o:(.rodata.str1.1): offset is=
 outside the section
>>>     ld.lld: error: arch/arm/mm/iomap.o:(__ksymtab_strings): offset is =
outside the section
>>>     ld.lld: error: arch/arm/mm/init.o:(.rodata.str1.1): offset is outs=
ide the section
>>>     ld.lld: error: arch/arm/mach-mmp/common.o:(__ksymtab_strings): off=
set is outside the section
>>>     ld.lld: error: init/do_mounts.o:(.rodata.str1.1): offset is outsid=
e the section
>>>     ld.lld: error: arch/arm/mm/ioremap.o:(__ksymtab_strings): offset i=
s outside the section
>>>     ld.lld: error: arch/arm/mm/dma-mapping.o:(.rodata.str1.1): offset =
is outside the section
>>>     ld.lld: error: arch/arm/mm/flush.o:(.rodata.str1.1): offset is out=
side the section
>>>     ld.lld: error: arch/arm/mach-mmp/sram.o:(.rodata.str1.1): offset i=
s outside the section
>>>     ld.lld: error: arch/arm/mm/mmu.o:(.rodata.str1.1): offset is outsi=
de the section
>>>
>>> Warnings:
>>>     ld.lld: warning: lld uses blx instruction, no object with architec=
ture supporting feature detected
>>>     ld.lld: warning: lld uses blx instruction, no object with architec=
ture supporting feature detected
>>>     ld.lld: warning: lld uses blx instruction, no object with architec=
ture supporting feature detected
>>>     ld.lld: warning: lld uses blx instruction, no object with architec=
ture supporting feature detected
>>>     ld.lld: warning: lld uses blx instruction, no object with architec=
ture supporting feature detected
>>>     ld.lld: warning: lld uses blx instruction, no object with architec=
ture supporting feature detected
>>>     ld.lld: warning: lld uses blx instruction, no object with architec=
ture supporting feature detected
>>>     ld.lld: warning: lld uses blx instruction, no object with architec=
ture supporting feature detected
>>>     ld.lld: warning: lld uses blx instruction, no object with architec=
ture supporting feature detected
>>>     ld.lld: warning: lld uses blx instruction, no object with architec=
ture supporting feature detected
>>>     ld.lld: warning: lld uses blx instruction, no object with architec=
ture supporting feature detected
>>>     ld.lld: warning: lld uses blx instruction, no object with architec=
ture supporting feature detected
>>>     ld.lld: warning: lld uses blx instruction, no object with architec=
ture supporting feature detected
>>>     ld.lld: warning: lld uses blx instruction, no object with architec=
ture supporting feature detected
>>>     ld.lld: warning: lld uses blx instruction, no object with architec=
ture supporting feature detected
>>>     ld.lld: warning: lld uses blx instruction, no object with architec=
ture supporting feature detected
>>>     ld.lld: warning: lld uses blx instruction, no object with architec=
ture supporting feature detected
>>>     ld.lld: warning: lld uses blx instruction, no object with architec=
ture supporting feature detected
>>>     ld.lld: warning: lld uses blx instruction, no object with architec=
ture supporting feature detected
>>>
>>> ----------------------------------------------------------------------=
----------
>>> allmodconfig (arm64, clang-10) =E2=80=94 FAIL, 1 error, 11 warnings, 0=
 section mismatches
>>>
>>> Errors:
>>>     ERROR: modpost: "device_is_bound" [drivers/clk/imx/clk-imx-scu.ko]=
 undefined!
>>>
>>> Warnings:
>>>     fs/nfsd/nfs3xdr.c:299:6: warning: variable 'err' is used uninitial=
ized whenever 'if' condition is false [-Wsometimes-uninitialized]
>>>     12: note: initialize the variable 'err' to silence this warning
>>>     1 warning generated.
>>>     drivers/remoteproc/qcom_sysmon.c:551:11: warning: variable 'acked'=
 is used uninitialized whenever 'if' condition is false [-Wsometimes-uninit=
ialized]
>>>     drivers/remoteproc/qcom_sysmon.c:536:12: note: initialize the vari=
able 'acked' to silence this warning
>>>     1 warning generated.
>>>     drivers/mtd/nand/raw/r852.c:874:24: warning: variable 'dev' is uni=
nitialized when used here [-Wuninitialized]
>>>     drivers/mtd/nand/raw/r852.c:847:25: note: initialize the variable =
'dev' to silence this warning
>>>     1 warning generated.
>>>     drivers/hwmon/pwm-fan.c:167:22: warning: unused variable 'ctx' [-W=
unused-variable]
>>>     1 warning generated.
>>>
>>> ----------------------------------------------------------------------=
----------
>>> allmodconfig (arm64, clang-11) =E2=80=94 FAIL, 1 error, 11 warnings, 0=
 section mismatches
>>>
>>> Errors:
>>>     ERROR: modpost: "device_is_bound" [drivers/clk/imx/clk-imx-scu.ko]=
 undefined!
>>>
>>> Warnings:
>>>     fs/nfsd/nfs3xdr.c:299:6: warning: variable 'err' is used uninitial=
ized whenever 'if' condition is false [-Wsometimes-uninitialized]
>>>     fs/nfsd/nfs3xdr.c:293:12: note: initialize the variable 'err' to s=
ilence this warning
>>>     1 warning generated.
>>>     drivers/remoteproc/qcom_sysmon.c:551:11: warning: variable 'acked'=
 is used uninitialized whenever 'if' condition is false [-Wsometimes-uninit=
ialized]
>>>     drivers/remoteproc/qcom_sysmon.c:536:12: note: initialize the vari=
able 'acked' to silence this warning
>>>     1 warning generated.
>>>     drivers/mtd/nand/raw/r852.c:874:24: warning: variable 'dev' is uni=
nitialized when used here [-Wuninitialized]
>>>     drivers/mtd/nand/raw/r852.c:847:25: note: initialize the variable =
'dev' to silence this warning
>>>     1 warning generated.
>>>     drivers/hwmon/pwm-fan.c:167:22: warning: unused variable 'ctx' [-W=
unused-variable]
>>>     1 warning generated.
>>>
>>> ----------------------------------------------------------------------=
----------
>>> allnoconfig (arm, clang-11) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches
>>>
>>> ----------------------------------------------------------------------=
----------
>>> allnoconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches
>>>
>>> ----------------------------------------------------------------------=
----------
>>> allnoconfig (x86_64, clang-11) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches
>>>
>>> ----------------------------------------------------------------------=
----------
>>> allnoconfig (arm, clang-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches
>>>
>>> ----------------------------------------------------------------------=
----------
>>> allnoconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches
>>>
>>> ----------------------------------------------------------------------=
----------
>>> allnoconfig (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches
>>>
>>> ----------------------------------------------------------------------=
----------
>>> allnoconfig (x86_64, clang-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches
>>>
>>> ----------------------------------------------------------------------=
----------
>>> allnoconfig (riscv, clang-11) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches
>>>
>>> ----------------------------------------------------------------------=
----------
>>> allnoconfig (arm64, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches
>>>
>>> ----------------------------------------------------------------------=
----------
>>> allnoconfig (arm64, clang-11) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches
>>>
>>> ----------------------------------------------------------------------=
----------
>>> allnoconfig (riscv, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches
>>>
>>> ----------------------------------------------------------------------=
----------
>>> allnoconfig (i386, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches
>>>
>>> ----------------------------------------------------------------------=
----------
>>> allnoconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches
>>>
>>> ----------------------------------------------------------------------=
----------
>>> allnoconfig (arm64, clang-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches
>>>
>>> ----------------------------------------------------------------------=
----------
>>> am200epdkit_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warning=
s, 0 section mismatches
>>>
>>> ----------------------------------------------------------------------=
----------
>>> ar7_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches
>>>
>>> ----------------------------------------------------------------------=
----------
>>> aspeed_g4_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings,=
 0 section mismatches
>>>
>>> ----------------------------------------------------------------------=
----------
>>> aspeed_g5_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings,=
 0 section mismatches
>>>
>>> ----------------------------------------------------------------------=
----------
>>> aspeed_g5_defconfig (arm, clang-11) =E2=80=94 PASS, 0 errors, 0 warnin=
gs, 0 section mismatches
>>>
>>> ----------------------------------------------------------------------=
----------
>>> aspeed_g5_defconfig (arm, clang-10) =E2=80=94 FAIL, 13 errors, 0 warni=
ngs, 0 section mismatches
>>>
>>> Errors:
>>>     ld.lld: error: .tmp_vmlinux.kallsyms1:(.ARM.exidx+0x34C28): reloca=
tion R_ARM_PREL31 out of range: 2135543056 is not in [-1073741824, 10737418=
23]
>>>     ld.lld: error: .tmp_vmlinux.kallsyms1:(.ARM.exidx+0x37214): reloca=
tion R_ARM_PREL31 out of range: 2135598884 is not in [-1073741824, 10737418=
23]
>>>     ld.lld: error: .tmp_vmlinux.kallsyms1:(.ARM.exidx+0x3722C): reloca=
tion R_ARM_PREL31 out of range: 2135598860 is not in [-1073741824, 10737418=
23]
>>>     ld.lld: error: .tmp_vmlinux.kallsyms1:(.ARM.exidx+0x3726C): reloca=
tion R_ARM_PREL31 out of range: 2135598796 is not in [-1073741824, 10737418=
23]
>>>     ld.lld: error: .tmp_vmlinux.kallsyms1:(.ARM.exidx+0x37274): reloca=
tion R_ARM_PREL31 out of range: 2135598788 is not in [-1073741824, 10737418=
23]
>>>     ld.lld: error: .tmp_vmlinux.kallsyms1:(.ARM.exidx+0x372A4): reloca=
tion R_ARM_PREL31 out of range: 2135598740 is not in [-1073741824, 10737418=
23]
>>>     ld.lld: error: .tmp_vmlinux.kallsyms1:(.ARM.exidx+0x372D4): reloca=
tion R_ARM_PREL31 out of range: 2135598692 is not in [-1073741824, 10737418=
23]
>>>     ld.lld: error: .tmp_vmlinux.kallsyms1:(.ARM.exidx+0x372EC): reloca=
tion R_ARM_PREL31 out of range: 2135598668 is not in [-1073741824, 10737418=
23]
>>>     ld.lld: error: .tmp_vmlinux.kallsyms1:(.ARM.exidx+0x37304): reloca=
tion R_ARM_PREL31 out of range: 2135598644 is not in [-1073741824, 10737418=
23]
>>>     ld.lld: error: .tmp_vmlinux.kallsyms1:(.ARM.exidx+0x37314): reloca=
tion R_ARM_PREL31 out of range: 2135598628 is not in [-1073741824, 10737418=
23]
>>>     ld.lld: error: .tmp_vmlinux.kallsyms1:(.ARM.exidx+0x37364): reloca=
tion R_ARM_PREL31 out of range: 2135598548 is not in [-1073741824, 10737418=
23]
>>>     ld.lld: error: .tmp_vmlinux.kallsyms1:(.ARM.exidx+0x37374): reloca=
tion R_ARM_PREL31 out of range: 2135598532 is not in [-1073741824, 10737418=
23]
>>>     ld.lld: error: .tmp_vmlinux.kallsyms1:(.ARM.exidx+0x37414): reloca=
tion R_ARM_PREL31 out of range: 2135598372 is not in [-1073741824, 10737418=
23]
>>>
>>> ----------------------------------------------------------------------=
----------
>>> assabet_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches
>>>
>>> ----------------------------------------------------------------------=
----------
>>> at91_dt_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches
>>>
>>> ----------------------------------------------------------------------=
----------
>>> ath25_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches
>>>
>>> ----------------------------------------------------------------------=
----------
>>> ath79_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches
>>>
>>> ----------------------------------------------------------------------=
----------
>>> axm55xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 =
section mismatches
>>>
>>> Warnings:
>>>     lib/cpumask.c:222:17: warning: cast from pointer to integer of dif=
ferent size [-Wpointer-to-int-cast]
>>>
>>> ----------------------------------------------------------------------=
----------
>>> axs103_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches
>>>
>>> ----------------------------------------------------------------------=
----------
>>> axs103_smp_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings=
, 0 section mismatches
>>>
>>> ----------------------------------------------------------------------=
----------
>>> badge4_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches
>>>
>>> ----------------------------------------------------------------------=
----------
>>> bcm2835_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches
>>>
>>> ----------------------------------------------------------------------=
----------
>>> bcm47xx_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, =
0 section mismatches
>>>
>>> ----------------------------------------------------------------------=
----------
>>> bcm63xx_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, =
0 section mismatches
>>>
>>> ----------------------------------------------------------------------=
----------
>>> bigsur_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches
>>>
>>> ----------------------------------------------------------------------=
----------
>>> bmips_be_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings,=
 0 section mismatches
>>>
>>> ----------------------------------------------------------------------=
----------
>>> bmips_stb_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings=
, 0 section mismatches
>>>
>>> ----------------------------------------------------------------------=
----------
>>> capcella_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings,=
 0 section mismatches
>>>
>>> ----------------------------------------------------------------------=
----------
>>> cavium_octeon_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warn=
ings, 0 section mismatches
>>>
>>> ----------------------------------------------------------------------=
----------
>>> cerfcube_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, =
0 section mismatches
>>>
>>> ----------------------------------------------------------------------=
----------
>>> ci20_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches
>>>
>>> ----------------------------------------------------------------------=
----------
>>> clps711x_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, =
0 section mismatches
>>>
>>> ----------------------------------------------------------------------=
----------
>>> cm_x300_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches
>>>
>>> ----------------------------------------------------------------------=
----------
>>> cns3420vb_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings,=
 0 section mismatches
>>>
>>> ----------------------------------------------------------------------=
----------
>>> cobalt_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches
>>>
>>> ----------------------------------------------------------------------=
----------
>>> colibri_pxa270_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warn=
ings, 0 section mismatches
>>>
>>> ----------------------------------------------------------------------=
----------
>>> colibri_pxa300_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warn=
ings, 0 section mismatches
>>>
>>> ----------------------------------------------------------------------=
----------
>>> collie_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches
>>>
>>> ----------------------------------------------------------------------=
----------
>>> corgi_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches
>>>
>>> ----------------------------------------------------------------------=
----------
>>> cu1000-neo_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warning=
s, 0 section mismatches
>>>
>>> ----------------------------------------------------------------------=
----------
>>> cu1830-neo_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warning=
s, 0 section mismatches
>>>
>>> ----------------------------------------------------------------------=
----------
>>> davinci_all_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warning=
s, 0 section mismatches
>>>
>>> ----------------------------------------------------------------------=
----------
>>> db1xxx_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches
>>>
>>> ----------------------------------------------------------------------=
----------
>>> decstation_64_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warn=
ings, 0 section mismatches
>>>
>>> ----------------------------------------------------------------------=
----------
>>> decstation_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warning=
s, 0 section mismatches
>>>
>>> ----------------------------------------------------------------------=
----------
>>> decstation_r4k_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 war=
nings, 0 section mismatches
>>>
>>> ----------------------------------------------------------------------=
----------
>>> defconfig (arm64, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sectio=
n mismatches
>>>
>>> Warnings:
>>>     drivers/hwmon/pwm-fan.c:167:22: warning: unused variable =E2=80=98=
ctx=E2=80=99 [-Wunused-variable]
>>>
>>> ----------------------------------------------------------------------=
----------
>>> defconfig (riscv, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches
>>>
>>> ----------------------------------------------------------------------=
----------
>>> defconfig (arm64, clang-10) =E2=80=94 FAIL, 1 error, 5 warnings, 0 sec=
tion mismatches
>>>
>>> Errors:
>>>     ERROR: modpost: "__field_overflow" [drivers/net/ipa/ipa.ko] undefi=
ned!
>>>
>>> Warnings:
>>>     drivers/hwmon/pwm-fan.c:167:22: warning: unused variable 'ctx' [-W=
unused-variable]
>>>     1 warning generated.
>>>     drivers/remoteproc/qcom_sysmon.c:551:11: warning: variable 'acked'=
 is used uninitialized whenever 'if' condition is false [-Wsometimes-uninit=
ialized]
>>>     drivers/remoteproc/qcom_sysmon.c:536:12: note: initialize the vari=
able 'acked' to silence this warning
>>>     1 warning generated.
>>>
>>> ----------------------------------------------------------------------=
----------
>>> defconfig (arm64, clang-11) =E2=80=94 PASS, 0 errors, 6 warnings, 0 se=
ction mismatches
>>>
>>> Warnings:
>>>     drivers/hwmon/pwm-fan.c:167:22: warning: unused variable 'ctx' [-W=
unused-variable]
>>>     1 warning generated.
>>>     drivers/remoteproc/qcom_sysmon.c:551:11: warning: variable 'acked'=
 is used uninitialized whenever 'if' condition is false [-Wsometimes-uninit=
ialized]
>>>     drivers/remoteproc/qcom_sysmon.c:536:12: note: initialize the vari=
able 'acked' to silence this warning
>>>     1 warning generated.
>>>     aarch64-linux-gnu-strip: warning: /scratch/linux/_modules_/lib/mod=
ules/5.10.0-rc5-next-20201130/kernel/drivers/media/tuners/tuner-types.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
>>>
>>> ----------------------------------------------------------------------=
----------
>>> defconfig+CONFIG_ARM64_64K_PAGES=3Dy (arm64, clang-10) =E2=80=94 FAIL,=
 1 error, 5 warnings, 0 section mismatches
>>>
>>> Errors:
>>>     ERROR: modpost: "__field_overflow" [drivers/net/ipa/ipa.ko] undefi=
ned!
>>>
>>> Warnings:
>>>     drivers/hwmon/pwm-fan.c:167:22: warning: unused variable 'ctx' [-W=
unused-variable]
>>>     1 warning generated.
>>>     drivers/remoteproc/qcom_sysmon.c:551:11: warning: variable 'acked'=
 is used uninitialized whenever 'if' condition is false [-Wsometimes-uninit=
ialized]
>>>     drivers/remoteproc/qcom_sysmon.c:536:12: note: initialize the vari=
able 'acked' to silence this warning
>>>     1 warning generated.
>>>
>>> ----------------------------------------------------------------------=
----------
>>> defconfig+CONFIG_ARM64_64K_PAGES=3Dy (arm64, gcc-8) =E2=80=94 PASS, 0 =
errors, 1 warning, 0 section mismatches
>>>
>>> Warnings:
>>>     drivers/hwmon/pwm-fan.c:167:22: warning: unused variable =E2=80=98=
ctx=E2=80=99 [-Wunused-variable]
>>>
>>> ----------------------------------------------------------------------=
----------
>>> defconfig+CONFIG_ARM64_64K_PAGES=3Dy (arm64, clang-11) =E2=80=94 PASS,=
 0 errors, 6 warnings, 0 section mismatches
>>>
>>> Warnings:
>>>     drivers/hwmon/pwm-fan.c:167:22: warning: unused variable 'ctx' [-W=
unused-variable]
>>>     1 warning generated.
>>>     drivers/remoteproc/qcom_sysmon.c:551:11: warning: variable 'acked'=
 is used uninitialized whenever 'if' condition is false [-Wsometimes-uninit=
ialized]
>>>     drivers/remoteproc/qcom_sysmon.c:536:12: note: initialize the vari=
able 'acked' to silence this warning
>>>     1 warning generated.
>>>     aarch64-linux-gnu-strip: warning: /scratch/linux/_modules_/lib/mod=
ules/5.10.0-rc5-next-20201130/kernel/drivers/media/tuners/tuner-types.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
>>>
>>> ----------------------------------------------------------------------=
----------
>>> defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy (arm64, gcc-8) =E2=80=94 PASS, 0 e=
rrors, 1 warning, 0 section mismatches
>>>
>>> Warnings:
>>>     drivers/hwmon/pwm-fan.c:167:22: warning: unused variable =E2=80=98=
ctx=E2=80=99 [-Wunused-variable]
>>>
>>> ----------------------------------------------------------------------=
----------
>>> defconfig+CONFIG_EFI=3Dn (riscv, clang-11) =E2=80=94 PASS, 0 errors, 1=
 warning, 0 section mismatches
>>>
>>> Warnings:
>>>     clang: warning: argument unused during compilation: '-no-pie' [-Wu=
nused-command-line-argument]
>>>
>>> ----------------------------------------------------------------------=
----------
>>> defconfig+CONFIG_RANDOMIZE_BASE=3Dy (arm64, gcc-8) =E2=80=94 PASS, 0 e=
rrors, 1 warning, 0 section mismatches
>>>
>>> Warnings:
>>>     drivers/hwmon/pwm-fan.c:167:22: warning: unused variable =E2=80=98=
ctx=E2=80=99 [-Wunused-variable]
>>>
>>> ----------------------------------------------------------------------=
----------
>>> dove_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches
>>>
>>> ----------------------------------------------------------------------=
----------
>>> e55_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches
>>>
>>> ----------------------------------------------------------------------=
----------
>>> efm32_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches
>>>
>>> ----------------------------------------------------------------------=
----------
>>> ep93xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches
>>>
>>> ----------------------------------------------------------------------=
----------
>>> eseries_pxa_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warning=
s, 0 section mismatches
>>>
>>> ----------------------------------------------------------------------=
----------
>>> exynos_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 s=
ection mismatches
>>>
>>> Warnings:
>>>     drivers/hwmon/pwm-fan.c:167:22: warning: unused variable =E2=80=98=
ctx=E2=80=99 [-Wunused-variable]
>>>
>>> ----------------------------------------------------------------------=
----------
>>> ezx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches
>>>
>>> ----------------------------------------------------------------------=
----------
>>> footbridge_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings=
, 0 section mismatches
>>>
>>> ----------------------------------------------------------------------=
----------
>>> fuloong2e_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings=
, 0 section mismatches
>>>
>>> ----------------------------------------------------------------------=
----------
>>> gcw0_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches
>>>
>>> ----------------------------------------------------------------------=
----------
>>> gemini_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches
>>>
>>> ----------------------------------------------------------------------=
----------
>>> gpr_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches
>>>
>>> ----------------------------------------------------------------------=
----------
>>> h3600_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches
>>>
>>> ----------------------------------------------------------------------=
----------
>>> h5000_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches
>>>
>>> ----------------------------------------------------------------------=
----------
>>> hackkit_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches
>>>
>>> ----------------------------------------------------------------------=
----------
>>> haps_hs_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches
>>>
>>> ----------------------------------------------------------------------=
----------
>>> haps_hs_smp_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 0 warning=
s, 0 section mismatches
>>>
>>> ----------------------------------------------------------------------=
----------
>>> hisi_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches
>>>
>>> ----------------------------------------------------------------------=
----------
>>> hsdk_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches
>>>
>>> ----------------------------------------------------------------------=
----------
>>> i386_defconfig (i386, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches
>>>
>>> ----------------------------------------------------------------------=
----------
>>> imote2_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches
>>>
>>> ----------------------------------------------------------------------=
----------
>>> imx_v4_v5_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings,=
 0 section mismatches
>>>
>>> ----------------------------------------------------------------------=
----------
>>> imx_v6_v7_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings,=
 0 section mismatches
>>>
>>> ----------------------------------------------------------------------=
----------
>>> integrator_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings=
, 0 section mismatches
>>>
>>> ----------------------------------------------------------------------=
----------
>>> iop32x_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches
>>>
>>> ----------------------------------------------------------------------=
----------
>>> ip22_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches
>>>
>>> ----------------------------------------------------------------------=
----------
>>> ip27_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches
>>>
>>> ----------------------------------------------------------------------=
----------
>>> ip28_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches
>>>
>>> ----------------------------------------------------------------------=
----------
>>> ip32_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches
>>>
>>> ----------------------------------------------------------------------=
----------
>>> ixp4xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches
>>>
>>> ----------------------------------------------------------------------=
----------
>>> jazz_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches
>>>
>>> ----------------------------------------------------------------------=
----------
>>> jmr3927_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, =
0 section mismatches
>>>
>>> ----------------------------------------------------------------------=
----------
>>> jornada720_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings=
, 0 section mismatches
>>>
>>> ----------------------------------------------------------------------=
----------
>>> keystone_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0=
 section mismatches
>>>
>>> Warnings:
>>>     lib/cpumask.c:222:17: warning: cast from pointer to integer of dif=
ferent size [-Wpointer-to-int-cast]
>>>
>>> ----------------------------------------------------------------------=
----------
>>> lart_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches
>>>
>>> ----------------------------------------------------------------------=
----------
>>> lemote2f_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings,=
 0 section mismatches
>>>
>>> ----------------------------------------------------------------------=
----------
>>> loongson1b_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warning=
s, 0 section mismatches
>>>
>>> ----------------------------------------------------------------------=
----------
>>> loongson1c_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warning=
s, 0 section mismatches
>>>
>>> ----------------------------------------------------------------------=
----------
>>> loongson3_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning,=
 0 section mismatches
>>>
>>> Warnings:
>>>     drivers/gpu/drm/ttm/ttm_pool.c:243:21: warning: =E2=80=98ttm_pool_=
type_count=E2=80=99 defined but not used [-Wunused-function]
>>>
>>> ----------------------------------------------------------------------=
----------
>>> lpc18xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches
>>>
>>> ----------------------------------------------------------------------=
----------
>>> lpc32xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches
>>>
>>> ----------------------------------------------------------------------=
----------
>>> lpd270_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches
>>>
>>> ----------------------------------------------------------------------=
----------
>>> lubbock_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches
>>>
>>> ----------------------------------------------------------------------=
----------
>>> magician_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, =
0 section mismatches
>>>
>>> ----------------------------------------------------------------------=
----------
>>> mainstone_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings,=
 0 section mismatches
>>>
>>> ----------------------------------------------------------------------=
----------
>>> malta_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches
>>>
>>> ----------------------------------------------------------------------=
----------
>>> malta_kvm_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings=
, 0 section mismatches
>>>
>>> ----------------------------------------------------------------------=
----------
>>> malta_kvm_guest_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 wa=
rnings, 0 section mismatches
>>>
>>> ----------------------------------------------------------------------=
----------
>>> malta_qemu_32r6_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 wa=
rning, 0 section mismatches
>>>
>>> Warnings:
>>>     {standard input}:39: Warning: macro instruction expanded into mult=
iple instructions
>>>
>>> ----------------------------------------------------------------------=
----------
>>> maltaaprp_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings=
, 0 section mismatches
>>>
>>> ----------------------------------------------------------------------=
----------
>>> maltasmvp_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings=
, 0 section mismatches
>>>
>>> ----------------------------------------------------------------------=
----------
>>> maltasmvp_eva_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warn=
ings, 0 section mismatches
>>>
>>> ----------------------------------------------------------------------=
----------
>>> maltaup_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, =
0 section mismatches
>>>
>>> ----------------------------------------------------------------------=
----------
>>> maltaup_xpa_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warnin=
g, 0 section mismatches
>>>
>>> Warnings:
>>>     lib/cpumask.c:222:17: warning: cast from pointer to integer of dif=
ferent size [-Wpointer-to-int-cast]
>>>
>>> ----------------------------------------------------------------------=
----------
>>> milbeaut_m10v_defconfig (arm, gcc-8) =E2=80=94 FAIL, 0 errors, 0 warni=
ngs, 0 section mismatches
>>>
>>> ----------------------------------------------------------------------=
----------
>>> mini2440_defconfig (arm, gcc-8) =E2=80=94 FAIL, 1 error, 0 warnings, 0=
 section mismatches
>>>
>>> Errors:
>>>     arch/arm/mach-s3c/mach-mini2440.c:47:10: fatal error: linux/mtd/na=
nd_ecc.h: No such file or directory
>>>
>>> ----------------------------------------------------------------------=
----------
>>> mmp2_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 se=
ction mismatches
>>>
>>> Warnings:
>>>     arch/arm/boot/dts/mmp2.dtsi:472.23-480.6: Warning (spi_bus_bridge)=
: /soc/apb@d4000000/spi@d4037000: incorrect #address-cells for SPI bus
>>>     arch/arm/boot/dts/mmp2.dtsi:472.23-480.6: Warning (spi_bus_bridge)=
: /soc/apb@d4000000/spi@d4037000: incorrect #size-cells for SPI bus
>>>     arch/arm/boot/dts/mmp2-olpc-xo-1-75.dtb: Warning (spi_bus_reg): Fa=
iled prerequisite 'spi_bus_bridge'
>>>
>>> ----------------------------------------------------------------------=
----------
>>> moxart_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches
>>>
>>> ----------------------------------------------------------------------=
----------
>>> mpc30x_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches
>>>
>>> ----------------------------------------------------------------------=
----------
>>> mps2_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches
>>>
>>> ----------------------------------------------------------------------=
----------
>>> mtx1_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches
>>>
>>> ----------------------------------------------------------------------=
----------
>>> multi_v4t_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings,=
 0 section mismatches
>>>
>>> ----------------------------------------------------------------------=
----------
>>> multi_v5_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, =
0 section mismatches
>>>
>>> ----------------------------------------------------------------------=
----------
>>> multi_v5_defconfig (arm, clang-10) =E2=80=94 PASS, 0 errors, 0 warning=
s, 0 section mismatches
>>>
>>> ----------------------------------------------------------------------=
----------
>>> multi_v5_defconfig (arm, clang-11) =E2=80=94 PASS, 0 errors, 0 warning=
s, 0 section mismatches
>>>
>>> ----------------------------------------------------------------------=
----------
>>> multi_v7_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, =
0 section mismatches
>>>
>>> Warnings:
>>>     drivers/hwmon/pwm-fan.c:167:22: warning: unused variable =E2=80=98=
ctx=E2=80=99 [-Wunused-variable]
>>>     arch/arm/boot/dts/mmp2.dtsi:472.23-480.6: Warning (spi_bus_bridge)=
: /soc/apb@d4000000/spi@d4037000: incorrect #address-cells for SPI bus
>>>     arch/arm/boot/dts/mmp2.dtsi:472.23-480.6: Warning (spi_bus_bridge)=
: /soc/apb@d4000000/spi@d4037000: incorrect #size-cells for SPI bus
>>>     arch/arm/boot/dts/mmp2-olpc-xo-1-75.dtb: Warning (spi_bus_reg): Fa=
iled prerequisite 'spi_bus_bridge'
>>>
>>> ----------------------------------------------------------------------=
----------
>>> multi_v7_defconfig (arm, clang-11) =E2=80=94 PASS, 0 errors, 5 warning=
s, 0 section mismatches
>>>
>>> Warnings:
>>>     drivers/hwmon/pwm-fan.c:167:22: warning: unused variable 'ctx' [-W=
unused-variable]
>>>     1 warning generated.
>>>     arch/arm/boot/dts/mmp2.dtsi:472.23-480.6: Warning (spi_bus_bridge)=
: /soc/apb@d4000000/spi@d4037000: incorrect #address-cells for SPI bus
>>>     arch/arm/boot/dts/mmp2.dtsi:472.23-480.6: Warning (spi_bus_bridge)=
: /soc/apb@d4000000/spi@d4037000: incorrect #size-cells for SPI bus
>>>     arch/arm/boot/dts/mmp2-olpc-xo-1-75.dtb: Warning (spi_bus_reg): Fa=
iled prerequisite 'spi_bus_bridge'
>>>
>>> ----------------------------------------------------------------------=
----------
>>> multi_v7_defconfig (arm, clang-10) =E2=80=94 PASS, 0 errors, 5 warning=
s, 0 section mismatches
>>>
>>> Warnings:
>>>     drivers/hwmon/pwm-fan.c:167:22: warning: unused variable 'ctx' [-W=
unused-variable]
>>>     1 warning generated.
>>>     arch/arm/boot/dts/mmp2.dtsi:472.23-480.6: Warning (spi_bus_bridge)=
: /soc/apb@d4000000/spi@d4037000: incorrect #address-cells for SPI bus
>>>     arch/arm/boot/dts/mmp2.dtsi:472.23-480.6: Warning (spi_bus_bridge)=
: /soc/apb@d4000000/spi@d4037000: incorrect #size-cells for SPI bus
>>>     arch/arm/boot/dts/mmp2-olpc-xo-1-75.dtb: Warning (spi_bus_reg): Fa=
iled prerequisite 'spi_bus_bridge'
>>>
>>> ----------------------------------------------------------------------=
----------
>>> multi_v7_defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy (arm, gcc-8) =E2=80=94 PA=
SS, 0 errors, 4 warnings, 0 section mismatches
>>>
>>> Warnings:
>>>     drivers/hwmon/pwm-fan.c:167:22: warning: unused variable =E2=80=98=
ctx=E2=80=99 [-Wunused-variable]
>>>     arch/arm/boot/dts/mmp2.dtsi:472.23-480.6: Warning (spi_bus_bridge)=
: /soc/apb@d4000000/spi@d4037000: incorrect #address-cells for SPI bus
>>>     arch/arm/boot/dts/mmp2.dtsi:472.23-480.6: Warning (spi_bus_bridge)=
: /soc/apb@d4000000/spi@d4037000: incorrect #size-cells for SPI bus
>>>     arch/arm/boot/dts/mmp2-olpc-xo-1-75.dtb: Warning (spi_bus_reg): Fa=
iled prerequisite 'spi_bus_bridge'
>>>
>>> ----------------------------------------------------------------------=
----------
>>> multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy (arm, gcc-8) =E2=
=
=80=94 PASS, 0 errors, 5 warnings, 0 section mismatches
>>>
>>> Warnings:
>>>     lib/cpumask.c:222:17: warning: cast from pointer to integer of dif=
ferent size [-Wpointer-to-int-cast]
>>>     drivers/hwmon/pwm-fan.c:167:22: warning: unused variable =E2=80=98=
ctx=E2=80=99 [-Wunused-variable]
>>>     arch/arm/boot/dts/mmp2.dtsi:472.23-480.6: Warning (spi_bus_bridge)=
: /soc/apb@d4000000/spi@d4037000: incorrect #address-cells for SPI bus
>>>     arch/arm/boot/dts/mmp2.dtsi:472.23-480.6: Warning (spi_bus_bridge)=
: /soc/apb@d4000000/spi@d4037000: incorrect #size-cells for SPI bus
>>>     arch/arm/boot/dts/mmp2-olpc-xo-1-75.dtb: Warning (spi_bus_reg): Fa=
iled prerequisite 'spi_bus_bridge'
>>>
>>> ----------------------------------------------------------------------=
----------
>>> multi_v7_defconfig+CONFIG_SMP=3Dn (arm, gcc-8) =E2=80=94 PASS, 0 error=
s, 4 warnings, 0 section mismatches
>>>
>>> Warnings:
>>>     drivers/hwmon/pwm-fan.c:167:22: warning: unused variable =E2=80=98=
ctx=E2=80=99 [-Wunused-variable]
>>>     arch/arm/boot/dts/mmp2.dtsi:472.23-480.6: Warning (spi_bus_bridge)=
: /soc/apb@d4000000/spi@d4037000: incorrect #address-cells for SPI bus
>>>     arch/arm/boot/dts/mmp2.dtsi:472.23-480.6: Warning (spi_bus_bridge)=
: /soc/apb@d4000000/spi@d4037000: incorrect #size-cells for SPI bus
>>>     arch/arm/boot/dts/mmp2-olpc-xo-1-75.dtb: Warning (spi_bus_reg): Fa=
iled prerequisite 'spi_bus_bridge'
>>>
>>> ----------------------------------------------------------------------=
----------
>>> mv78xx0_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches
>>>
>>> ----------------------------------------------------------------------=
----------
>>> mvebu_v5_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, =
0 section mismatches
>>>
>>> ----------------------------------------------------------------------=
----------
>>> mvebu_v7_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0=
 section mismatches
>>>
>>> Warnings:
>>>     drivers/hwmon/pwm-fan.c:167:22: warning: unused variable =E2=80=98=
ctx=E2=80=99 [-Wunused-variable]
>>>
>>> ----------------------------------------------------------------------=
----------
>>> mxs_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches
>>>
>>> ----------------------------------------------------------------------=
----------
>>> neponset_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, =
0 section mismatches
>>>
>>> ----------------------------------------------------------------------=
----------
>>> netwinder_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings,=
 0 section mismatches
>>>
>>> ----------------------------------------------------------------------=
----------
>>> nhk8815_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches
>>>
>>> ----------------------------------------------------------------------=
----------
>>> nlm_xlp_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, =
0 section mismatches
>>>
>>> ----------------------------------------------------------------------=
----------
>>> nlm_xlr_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0=
 section mismatches
>>>
>>> Warnings:
>>>     lib/cpumask.c:222:17: warning: cast from pointer to integer of dif=
ferent size [-Wpointer-to-int-cast]
>>>
>>> ----------------------------------------------------------------------=
----------
>>> nommu_k210_defconfig (riscv, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnin=
gs, 0 section mismatches
>>>
>>> ----------------------------------------------------------------------=
----------
>>> nommu_virt_defconfig (riscv, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnin=
gs, 0 section mismatches
>>>
>>> ----------------------------------------------------------------------=
----------
>>> nsimosci_hs_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 0 warning=
s, 0 section mismatches
>>>
>>> ----------------------------------------------------------------------=
----------
>>> nsimosci_hs_smp_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 0 war=
nings, 0 section mismatches
>>>
>>> ----------------------------------------------------------------------=
----------
>>> omap1_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 s=
ection mismatches
>>>
>>> Warnings:
>>>     arch/arm/mach-omap1/board-h2.c:347:34: warning: =E2=80=98isp1301_g=
piod_table=E2=80=99 defined but not used [-Wunused-variable]
>>>     arch/arm/mach-omap1/board-ams-delta.c:462:12: warning: =E2=80=98am=
s_delta_camera_power=E2=80=99 defined but not used [-Wunused-function]
>>>
>>> ----------------------------------------------------------------------=
----------
>>> omap2plus_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings,=
 0 section mismatches
>>>
>>> ----------------------------------------------------------------------=
----------
>>> omega2p_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, =
0 section mismatches
>>>
>>> ----------------------------------------------------------------------=
----------
>>> orion5x_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches
>>>
>>> ----------------------------------------------------------------------=
----------
>>> oxnas_v6_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, =
0 section mismatches
>>>
>>> ----------------------------------------------------------------------=
----------
>>> palmz72_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches
>>>
>>> ----------------------------------------------------------------------=
----------
>>> pcm027_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches
>>>
>>> ----------------------------------------------------------------------=
----------
>>> pic32mzda_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings=
, 0 section mismatches
>>>
>>> ----------------------------------------------------------------------=
----------
>>> pistachio_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings=
, 0 section mismatches
>>>
>>> ----------------------------------------------------------------------=
----------
>>> pleb_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches
>>>
>>> ----------------------------------------------------------------------=
----------
>>> prima2_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches
>>>
>>> ----------------------------------------------------------------------=
----------
>>> pxa168_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 =
section mismatches
>>>
>>> Warnings:
>>>     arch/arm/boot/dts/mmp2.dtsi:472.23-480.6: Warning (spi_bus_bridge)=
: /soc/apb@d4000000/spi@d4037000: incorrect #address-cells for SPI bus
>>>     arch/arm/boot/dts/mmp2.dtsi:472.23-480.6: Warning (spi_bus_bridge)=
: /soc/apb@d4000000/spi@d4037000: incorrect #size-cells for SPI bus
>>>     arch/arm/boot/dts/mmp2-olpc-xo-1-75.dtb: Warning (spi_bus_reg): Fa=
iled prerequisite 'spi_bus_bridge'
>>>
>>> ----------------------------------------------------------------------=
----------
>>> pxa255-idp_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings=
, 0 section mismatches
>>>
>>> ----------------------------------------------------------------------=
----------
>>> pxa3xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches
>>>
>>> ----------------------------------------------------------------------=
----------
>>> pxa910_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 =
section mismatches
>>>
>>> Warnings:
>>>     arch/arm/boot/dts/mmp2.dtsi:472.23-480.6: Warning (spi_bus_bridge)=
: /soc/apb@d4000000/spi@d4037000: incorrect #address-cells for SPI bus
>>>     arch/arm/boot/dts/mmp2.dtsi:472.23-480.6: Warning (spi_bus_bridge)=
: /soc/apb@d4000000/spi@d4037000: incorrect #size-cells for SPI bus
>>>     arch/arm/boot/dts/mmp2-olpc-xo-1-75.dtb: Warning (spi_bus_reg): Fa=
iled prerequisite 'spi_bus_bridge'
>>>
>>> ----------------------------------------------------------------------=
----------
>>> pxa_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches
>>>
>>> ----------------------------------------------------------------------=
----------
>>> qcom_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches
>>>
>>> ----------------------------------------------------------------------=
----------
>>> qi_lb60_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, =
0 section mismatches
>>>
>>> ----------------------------------------------------------------------=
----------
>>> rb532_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches
>>>
>>> ----------------------------------------------------------------------=
----------
>>> rbtx49xx_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings,=
 0 section mismatches
>>>
>>> ----------------------------------------------------------------------=
----------
>>> realview_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, =
0 section mismatches
>>>
>>> ----------------------------------------------------------------------=
----------
>>> rm200_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 s=
ection mismatches
>>>
>>> Warnings:
>>>     drivers/block/paride/bpck.c:32: warning: "PC" redefined
>>>
>>> ----------------------------------------------------------------------=
----------
>>> rpc_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches
>>>
>>> ----------------------------------------------------------------------=
----------
>>> rs90_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches
>>>
>>> ----------------------------------------------------------------------=
----------
>>> rt305x_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches
>>>
>>> ----------------------------------------------------------------------=
----------
>>> rv32_defconfig (riscv, gcc-8) =E2=80=94 PASS, 0 errors, 6 warnings, 0 =
section mismatches
>>>
>>> Warnings:
>>>     <stdin>:830:2: warning: #warning syscall fstat64 not implemented [=
-Wcpp]
>>>     <stdin>:1127:2: warning: #warning syscall fstatat64 not implemente=
d [-Wcpp]
>>>     <stdin>:1511:2: warning: #warning syscall clone3 not implemented [=
-Wcpp]
>>>     <stdin>:830:2: warning: #warning syscall fstat64 not implemented [=
-Wcpp]
>>>     <stdin>:1127:2: warning: #warning syscall fstatat64 not implemente=
d [-Wcpp]
>>>     <stdin>:1511:2: warning: #warning syscall clone3 not implemented [=
-Wcpp]
>>>
>>> ----------------------------------------------------------------------=
----------
>>> s3c2410_defconfig (arm, gcc-8) =E2=80=94 FAIL, 1 error, 0 warnings, 0 =
section mismatches
>>>
>>> Errors:
>>>     arch/arm/mach-s3c/mach-bast.c:27:10: fatal error: linux/mtd/nand_e=
cc.h: No such file or directory
>>>
>>> ----------------------------------------------------------------------=
----------
>>> s3c6400_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches
>>>
>>> ----------------------------------------------------------------------=
----------
>>> s5pv210_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches
>>>
>>> ----------------------------------------------------------------------=
----------
>>> sama5_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches
>>>
>>> ----------------------------------------------------------------------=
----------
>>> sb1250_swarm_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warni=
ngs, 0 section mismatches
>>>
>>> ----------------------------------------------------------------------=
----------
>>> shannon_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches
>>>
>>> ----------------------------------------------------------------------=
----------
>>> shmobile_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, =
0 section mismatches
>>>
>>> ----------------------------------------------------------------------=
----------
>>> simpad_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches
>>>
>>> ----------------------------------------------------------------------=
----------
>>> socfpga_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches
>>>
>>> ----------------------------------------------------------------------=
----------
>>> spear13xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings,=
 0 section mismatches
>>>
>>> ----------------------------------------------------------------------=
----------
>>> spear3xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, =
0 section mismatches
>>>
>>> ----------------------------------------------------------------------=
----------
>>> spear6xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, =
0 section mismatches
>>>
>>> ----------------------------------------------------------------------=
----------
>>> spitz_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches
>>>
>>> ----------------------------------------------------------------------=
----------
>>> stm32_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches
>>>
>>> ----------------------------------------------------------------------=
----------
>>> sunxi_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches
>>>
>>> ----------------------------------------------------------------------=
----------
>>> tango4_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches
>>>
>>> ----------------------------------------------------------------------=
----------
>>> tb0219_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches
>>>
>>> ----------------------------------------------------------------------=
----------
>>> tb0226_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches
>>>
>>> ----------------------------------------------------------------------=
----------
>>> tb0287_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches
>>>
>>> ----------------------------------------------------------------------=
----------
>>> tct_hammer_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings=
, 0 section mismatches
>>>
>>> ----------------------------------------------------------------------=
----------
>>> tegra_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 se=
ction mismatches
>>>
>>> Warnings:
>>>     drivers/gpu/drm/ttm/ttm_pool.c:243:21: warning: =E2=80=98ttm_pool_=
type_count=E2=80=99 defined but not used [-Wunused-function]
>>>
>>> ----------------------------------------------------------------------=
----------
>>> tinyconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches
>>>
>>> ----------------------------------------------------------------------=
----------
>>> tinyconfig (arm64, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches
>>>
>>> ----------------------------------------------------------------------=
----------
>>> tinyconfig (i386, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches
>>>
>>> ----------------------------------------------------------------------=
----------
>>> tinyconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches
>>>
>>> ----------------------------------------------------------------------=
----------
>>> tinyconfig (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches
>>>
>>> Warnings:
>>>     .config:1181:warning: override: UNWINDER_GUESS changes choice stat=
e
>>>
>>> ----------------------------------------------------------------------=
----------
>>> tinyconfig (riscv, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches
>>>
>>> ----------------------------------------------------------------------=
----------
>>> tinyconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches
>>>
>>> ----------------------------------------------------------------------=
----------
>>> trizeps4_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, =
0 section mismatches
>>>
>>> ----------------------------------------------------------------------=
----------
>>> u300_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches
>>>
>>> ----------------------------------------------------------------------=
----------
>>> u8500_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches
>>>
>>> ----------------------------------------------------------------------=
----------
>>> vdk_hs38_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, =
0 section mismatches
>>>
>>> ----------------------------------------------------------------------=
----------
>>> vdk_hs38_smp_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnin=
gs, 0 section mismatches
>>>
>>> ----------------------------------------------------------------------=
----------
>>> versatile_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings,=
 0 section mismatches
>>>
>>> ----------------------------------------------------------------------=
----------
>>> vexpress_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, =
0 section mismatches
>>>
>>> ----------------------------------------------------------------------=
----------
>>> vf610m4_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches
>>>
>>> ----------------------------------------------------------------------=
----------
>>> viper_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches
>>>
>>> ----------------------------------------------------------------------=
----------
>>> vocore2_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, =
0 section mismatches
>>>
>>> ----------------------------------------------------------------------=
----------
>>> vt8500_v6_v7_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnin=
gs, 0 section mismatches
>>>
>>> ----------------------------------------------------------------------=
----------
>>> workpad_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, =
0 section mismatches
>>>
>>> ----------------------------------------------------------------------=
----------
>>> x86_64_defconfig (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings,=
 0 section mismatches
>>>
>>> ----------------------------------------------------------------------=
----------
>>> x86_64_defconfig (x86_64, clang-10) =E2=80=94 PASS, 0 errors, 2 warnin=
gs, 0 section mismatches
>>>
>>> Warnings:
>>>     drivers/gpu/drm/i915/gem/i915_gem_execbuffer.o: warning: objtool: =
eb_prefault_relocations()+0xc6: stack state mismatch: cfa1=3D7+8 cfa2=3D-1+=
0
>>>     drivers/gpu/drm/i915/gem/i915_gem_execbuffer.o: warning: objtool: =
eb_copy_relocations()+0x249: stack state mismatch: cfa1=3D7+104 cfa2=3D-1+0
>>>
>>> ----------------------------------------------------------------------=
----------
>>> x86_64_defconfig (x86_64, clang-11) =E2=80=94 PASS, 0 errors, 2 warnin=
gs, 0 section mismatches
>>>
>>> Warnings:
>>>     drivers/gpu/drm/i915/gem/i915_gem_execbuffer.o: warning: objtool: =
eb_prefault_relocations()+0xb8: stack state mismatch: cfa1=3D7+8 cfa2=3D-1+=
0
>>>     drivers/gpu/drm/i915/gem/i915_gem_execbuffer.o: warning: objtool: =
eb_copy_relocations()+0x259: stack state mismatch: cfa1=3D7+104 cfa2=3D-1+0
>>>
>>> ----------------------------------------------------------------------=
----------
>>> x86_64_defconfig+kvm_guest (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 0=
 warnings, 0 section mismatches
>>>
>>> ----------------------------------------------------------------------=
----------
>>> xcep_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches
>>>
>>> ----------------------------------------------------------------------=
----------
>>> xway_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 s=
ection mismatches
>>>
>>> Warnings:
>>>     drivers/net/ethernet/lantiq_etop.c:273:4: warning: ignoring return=
 value of =E2=80=98request_irq=E2=80=99, declared with attribute warn_unuse=
d_result [-Wunused-result]
>>>     drivers/net/ethernet/lantiq_etop.c:281:4: warning: ignoring return=
 value of =E2=80=98request_irq=E2=80=99, declared with attribute warn_unuse=
d_result [-Wunused-result]
>>>
>>> ----------------------------------------------------------------------=
----------
>>> zeus_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches
>>>
>>> ----------------------------------------------------------------------=
----------
>>> zx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches
>>>
>>> ---
>>> For more info write to <info@kernelci.org>
>>>
>>> --
>>> You received this message because you are subscribed to the Google Gro=
ups "Clang Built Linux" group.
>>> To unsubscribe from this group and stop receiving emails from it, send=
 an email to clang-built-linux+unsubscribe@googlegroups.com.
>>> To view this discussion on the web visit https://groups.google.com/d/m=
sgid/clang-built-linux/5fc5476c.1c69fb81.43fd4.49d0%40mx.google.com.
>>
>>
>>
>=20

