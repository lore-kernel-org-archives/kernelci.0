MIME-Version: 1.0
References: <5e57d0a2.1c69fb81.b44cf.2a50@mx.google.com> <CAKwvOdnVh0xSrrQ=RkRSYOVHYD0-i+=E=Rsg6JjdG9=4r7BN+w@mail.gmail.com>
In-Reply-To: <CAKwvOdnVh0xSrrQ=RkRSYOVHYD0-i+=E=Rsg6JjdG9=4r7BN+w@mail.gmail.com>
From: "Guillaume Tucker" <guillaume.tucker@gmail.com>
Date: Thu, 27 Feb 2020 20:37:26 +0000
Message-ID: <CAH1_8nCA5JcZPLFuzm2mof9XES8etXRhLkwUbMsFLfBuU1n7vw@mail.gmail.com>
Subject: Re: next/master build: 219 builds: 84 failed, 135 passed, 101 errors, 267 warnings (next-20200227)
Content-Type: multipart/alternative; boundary="0000000000000f4d3e059f94b10b"
List-ID: <kernelci.groups.io>
To: kernelci@groups.io, Nick Desaulniers <ndesaulniers@google.com>
Cc: clang-built-linux <clang-built-linux@googlegroups.com>, "kernelci.org bot" <bot@kernelci.org>

--0000000000000f4d3e059f94b10b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 27, 2020 at 7:21 PM Nick Desaulniers via Groups.Io
<ndesaulniers=3Dgoogle.com@groups.io> wrote:

> + KernelCI
>
> So it looks like this is the latest report we received. Any thoughts
> on why clang-8 is being used in the report after
> https://github.com/kernelci/kernelci-core/pull/325 was merged 2 days
> ago?  Is the deployment not continuous (ie. still has to be pushed to
> production)?
>

That's right, production is not updated continuously.  Some
changes have to go hand-in-hand with the kernelci-backend
instance, some changes need Docker images to be rebuilt...
Typically production gets updated once a week, I'm planning to do
this tomorrow.

Guillaume


> On Thu, Feb 27, 2020 at 6:22 AM kernelci.org bot <bot@kernelci.org> wrot=
e:
> >
> > next/master build: 219 builds: 84 failed, 135 passed, 101 errors, 267
> warnings (next-20200227)
> >
> > Full Build Summary:
> https://kernelci.org/build/next/branch/master/kernel/next-20200227/
> >
> > Tree: next
> > Branch: master
> > Git Describe: next-20200227
> > Git Commit: 10569a280f259f696c0b32fc1d45866d2fd33f53
> > Git URL: git://
> git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
> > Built: 7 unique architectures
> >
> > Build Failures Detected:
> >
> > arc:
> >     allnoconfig: (gcc-8) FAIL
> >     axs103_defconfig: (gcc-8) FAIL
> >     axs103_smp_defconfig: (gcc-8) FAIL
> >     haps_hs_defconfig: (gcc-8) FAIL
> >     haps_hs_smp_defconfig: (gcc-8) FAIL
> >     haps_hs_smp_defconfig+kselftest: (gcc-8) FAIL
> >     hsdk_defconfig: (gcc-8) FAIL
> >     nsimosci_hs_defconfig: (gcc-8) FAIL
> >     nsimosci_hs_smp_defconfig: (gcc-8) FAIL
> >     tinyconfig: (gcc-8) FAIL
> >     vdk_hs38_defconfig: (gcc-8) FAIL
> >     vdk_hs38_smp_defconfig: (gcc-8) FAIL
> >
> > arm:
> >     cm_x300_defconfig: (gcc-8) FAIL
> >     em_x270_defconfig: (gcc-8) FAIL
> >     eseries_pxa_defconfig: (gcc-8) FAIL
> >     pxa_defconfig: (gcc-8) FAIL
> >
> > mips:
> >     32r2el_defconfig: (gcc-8) FAIL
> >     32r2el_defconfig+kselftest: (gcc-8) FAIL
> >     allnoconfig: (gcc-8) FAIL
> >     ar7_defconfig: (gcc-8) FAIL
> >     ath25_defconfig: (gcc-8) FAIL
> >     ath79_defconfig: (gcc-8) FAIL
> >     bcm47xx_defconfig: (gcc-8) FAIL
> >     bcm63xx_defconfig: (gcc-8) FAIL
> >     bigsur_defconfig: (gcc-8) FAIL
> >     bmips_be_defconfig: (gcc-8) FAIL
> >     bmips_stb_defconfig: (gcc-8) FAIL
> >     capcella_defconfig: (gcc-8) FAIL
> >     cavium_octeon_defconfig: (gcc-8) FAIL
> >     ci20_defconfig: (gcc-8) FAIL
> >     cobalt_defconfig: (gcc-8) FAIL
> >     cu1000-neo_defconfig: (gcc-8) FAIL
> >     db1xxx_defconfig: (gcc-8) FAIL
> >     decstation_64_defconfig: (gcc-8) FAIL
> >     decstation_defconfig: (gcc-8) FAIL
> >     decstation_r4k_defconfig: (gcc-8) FAIL
> >     e55_defconfig: (gcc-8) FAIL
> >     fuloong2e_defconfig: (gcc-8) FAIL
> >     gcw0_defconfig: (gcc-8) FAIL
> >     gpr_defconfig: (gcc-8) FAIL
> >     ip22_defconfig: (gcc-8) FAIL
> >     ip27_defconfig: (gcc-8) FAIL
> >     ip28_defconfig: (gcc-8) FAIL
> >     ip32_defconfig: (gcc-8) FAIL
> >     jazz_defconfig: (gcc-8) FAIL
> >     jmr3927_defconfig: (gcc-8) FAIL
> >     lasat_defconfig: (gcc-8) FAIL
> >     lemote2f_defconfig: (gcc-8) FAIL
> >     loongson1b_defconfig: (gcc-8) FAIL
> >     loongson1c_defconfig: (gcc-8) FAIL
> >     loongson3_defconfig: (gcc-8) FAIL
> >     malta_defconfig: (gcc-8) FAIL
> >     malta_kvm_defconfig: (gcc-8) FAIL
> >     malta_kvm_guest_defconfig: (gcc-8) FAIL
> >     malta_qemu_32r6_defconfig: (gcc-8) FAIL
> >     maltaaprp_defconfig: (gcc-8) FAIL
> >     maltasmvp_defconfig: (gcc-8) FAIL
> >     maltasmvp_eva_defconfig: (gcc-8) FAIL
> >     maltaup_defconfig: (gcc-8) FAIL
> >     maltaup_xpa_defconfig: (gcc-8) FAIL
> >     markeins_defconfig: (gcc-8) FAIL
> >     mips_paravirt_defconfig: (gcc-8) FAIL
> >     mpc30x_defconfig: (gcc-8) FAIL
> >     msp71xx_defconfig: (gcc-8) FAIL
> >     mtx1_defconfig: (gcc-8) FAIL
> >     nlm_xlp_defconfig: (gcc-8) FAIL
> >     nlm_xlr_defconfig: (gcc-8) FAIL
> >     omega2p_defconfig: (gcc-8) FAIL
> >     pic32mzda_defconfig: (gcc-8) FAIL
> >     pistachio_defconfig: (gcc-8) FAIL
> >     pnx8335_stb225_defconfig: (gcc-8) FAIL
> >     qi_lb60_defconfig: (gcc-8) FAIL
> >     rb532_defconfig: (gcc-8) FAIL
> >     rbtx49xx_defconfig: (gcc-8) FAIL
> >     rm200_defconfig: (gcc-8) FAIL
> >     rt305x_defconfig: (gcc-8) FAIL
> >     sb1250_swarm_defconfig: (gcc-8) FAIL
> >     tb0219_defconfig: (gcc-8) FAIL
> >     tb0226_defconfig: (gcc-8) FAIL
> >     tb0287_defconfig: (gcc-8) FAIL
> >     tinyconfig: (gcc-8) FAIL
> >     vocore2_defconfig: (gcc-8) FAIL
> >     workpad_defconfig: (gcc-8) FAIL
> >     xway_defconfig: (gcc-8) FAIL
> >
> > Errors and Warnings Detected:
> >
> > arc:
> >     allnoconfig (gcc-8): 1 error, 1 warning
> >     axs103_defconfig (gcc-8): 1 error, 1 warning
> >     axs103_smp_defconfig (gcc-8): 1 error, 1 warning
> >     haps_hs_defconfig (gcc-8): 1 error, 1 warning
> >     haps_hs_smp_defconfig (gcc-8): 1 error, 1 warning
> >     haps_hs_smp_defconfig (gcc-8): 1 error, 1 warning
> >     hsdk_defconfig (gcc-8): 1 error, 1 warning
> >     nsimosci_hs_defconfig (gcc-8): 1 error, 1 warning
> >     nsimosci_hs_smp_defconfig (gcc-8): 1 error, 1 warning
> >     tinyconfig (gcc-8): 1 error, 1 warning
> >     vdk_hs38_defconfig (gcc-8): 1 error, 1 warning
> >     vdk_hs38_smp_defconfig (gcc-8): 1 error, 1 warning
> >
> > arm64:
> >     allmodconfig (clang-8): 81 warnings
> >     defconfig (clang-8): 18 warnings
> >     defconfig (gcc-8): 1 warning
> >     defconfig (gcc-8): 1 warning
> >     defconfig (gcc-8): 1 warning
> >     defconfig (gcc-8): 1 warning
> >
> > arm:
> >     allmodconfig (gcc-8): 21 warnings
> >     aspeed_g4_defconfig (gcc-8): 4 warnings
> >     aspeed_g5_defconfig (gcc-8): 4 warnings
> >     cm_x300_defconfig (gcc-8): 1 error, 2 warnings
> >     em_x270_defconfig (gcc-8): 1 error, 2 warnings
> >     eseries_pxa_defconfig (gcc-8): 14 errors, 12 warnings
> >     multi_v5_defconfig (gcc-8): 4 warnings
> >     multi_v7_defconfig (gcc-8): 4 warnings
> >     multi_v7_defconfig (gcc-8): 4 warnings
> >     multi_v7_defconfig (gcc-8): 4 warnings
> >     multi_v7_defconfig (gcc-8): 4 warnings
> >     multi_v7_defconfig (gcc-8): 5 warnings
> >     pxa_defconfig (gcc-8): 3 errors, 6 warnings
> >
> > i386:
> >
> > mips:
> >     32r2el_defconfig (gcc-8): 1 error, 1 warning
> >     32r2el_defconfig (gcc-8): 1 error, 1 warning
> >     allnoconfig (gcc-8): 1 error, 1 warning
> >     ar7_defconfig (gcc-8): 1 error, 1 warning
> >     ath25_defconfig (gcc-8): 1 error, 1 warning
> >     ath79_defconfig (gcc-8): 1 error, 1 warning
> >     bcm47xx_defconfig (gcc-8): 1 error, 1 warning
> >     bcm63xx_defconfig (gcc-8): 1 error, 1 warning
> >     bigsur_defconfig (gcc-8): 1 error, 1 warning
> >     bmips_be_defconfig (gcc-8): 1 error, 1 warning
> >     bmips_stb_defconfig (gcc-8): 1 error, 1 warning
> >     capcella_defconfig (gcc-8): 1 error, 1 warning
> >     cavium_octeon_defconfig (gcc-8): 1 error, 1 warning
> >     ci20_defconfig (gcc-8): 1 error, 1 warning
> >     cobalt_defconfig (gcc-8): 1 error, 1 warning
> >     cu1000-neo_defconfig (gcc-8): 1 error, 1 warning
> >     db1xxx_defconfig (gcc-8): 1 error, 1 warning
> >     decstation_64_defconfig (gcc-8): 1 error, 1 warning
> >     decstation_defconfig (gcc-8): 1 error, 1 warning
> >     decstation_r4k_defconfig (gcc-8): 1 error, 1 warning
> >     e55_defconfig (gcc-8): 1 error, 1 warning
> >     fuloong2e_defconfig (gcc-8): 1 error, 1 warning
> >     gcw0_defconfig (gcc-8): 1 error, 1 warning
> >     gpr_defconfig (gcc-8): 1 error, 1 warning
> >     ip22_defconfig (gcc-8): 1 error, 1 warning
> >     ip27_defconfig (gcc-8): 3 errors, 2 warnings
> >     ip28_defconfig (gcc-8): 1 error, 1 warning
> >     ip32_defconfig (gcc-8): 1 error, 1 warning
> >     jazz_defconfig (gcc-8): 1 error, 1 warning
> >     jmr3927_defconfig (gcc-8): 1 error, 1 warning
> >     lasat_defconfig (gcc-8): 1 error, 1 warning
> >     lemote2f_defconfig (gcc-8): 1 error, 1 warning
> >     loongson1b_defconfig (gcc-8): 1 error, 1 warning
> >     loongson1c_defconfig (gcc-8): 1 error, 1 warning
> >     loongson3_defconfig (gcc-8): 1 error, 1 warning
> >     malta_defconfig (gcc-8): 1 error, 1 warning
> >     malta_kvm_defconfig (gcc-8): 1 error, 1 warning
> >     malta_kvm_guest_defconfig (gcc-8): 1 error, 1 warning
> >     malta_qemu_32r6_defconfig (gcc-8): 1 error, 1 warning
> >     maltaaprp_defconfig (gcc-8): 1 error, 1 warning
> >     maltasmvp_defconfig (gcc-8): 1 error, 1 warning
> >     maltasmvp_eva_defconfig (gcc-8): 1 error, 1 warning
> >     maltaup_defconfig (gcc-8): 1 error, 1 warning
> >     maltaup_xpa_defconfig (gcc-8): 1 error, 1 warning
> >     markeins_defconfig (gcc-8): 1 error, 1 warning
> >     mips_paravirt_defconfig (gcc-8): 1 error, 1 warning
> >     mpc30x_defconfig (gcc-8): 1 error, 1 warning
> >     msp71xx_defconfig (gcc-8): 1 error, 1 warning
> >     mtx1_defconfig (gcc-8): 1 error, 1 warning
> >     nlm_xlp_defconfig (gcc-8): 1 error, 1 warning
> >     nlm_xlr_defconfig (gcc-8): 1 error, 1 warning
> >     omega2p_defconfig (gcc-8): 1 error, 1 warning
> >     pic32mzda_defconfig (gcc-8): 1 error, 1 warning
> >     pistachio_defconfig (gcc-8): 1 error, 1 warning
> >     pnx8335_stb225_defconfig (gcc-8): 1 error, 1 warning
> >     qi_lb60_defconfig (gcc-8): 1 error, 1 warning
> >     rb532_defconfig (gcc-8): 1 error, 1 warning
> >     rbtx49xx_defconfig (gcc-8): 1 error, 1 warning
> >     rm200_defconfig (gcc-8): 1 error, 1 warning
> >     rt305x_defconfig (gcc-8): 1 error, 1 warning
> >     sb1250_swarm_defconfig (gcc-8): 1 error, 1 warning
> >     tb0219_defconfig (gcc-8): 1 error, 1 warning
> >     tb0226_defconfig (gcc-8): 1 error, 1 warning
> >     tb0287_defconfig (gcc-8): 1 error, 1 warning
> >     tinyconfig (gcc-8): 1 error, 1 warning
> >     vocore2_defconfig (gcc-8): 1 error, 1 warning
> >     workpad_defconfig (gcc-8): 1 error, 1 warning
> >     xway_defconfig (gcc-8): 1 error, 1 warning
> >
> > riscv:
> >     rv32_defconfig (gcc-8): 6 warnings
> >
> > x86_64:
> >     tinyconfig (gcc-8): 1 warning
> >
> > Errors summary:
> >
> >     80   mm/memory.c:1523:41: error: implicit declaration of function
> =E2=80=98pte_index=E2=80=99; did you mean =E2=80=98page_index=E2=80=99?
> [-Werror=3Dimplicit-function-declaration]
> >     3    ERROR: "snd_ac97_reset" [sound/soc/codecs/snd-soc-wm9712.ko]
> undefined!
> >     2    arch/mips/include/asm/sn/addrs.h:58:44: error: left shift cou=
nt
> >=3D width of type [-Werror=3Dshift-count-overflow]
> >     1    sound/soc/codecs/wm9712.c:94:3: error: =E2=80=98const struct
> regmap_config=E2=80=99 has no member named =E2=80=98num_reg_defaults=E2=
=80=99
> >     1    sound/soc/codecs/wm9712.c:93:3: error: =E2=80=98const struct
> regmap_config=E2=80=99 has no member named =E2=80=98reg_defaults=E2=80=
=99
> >     1    sound/soc/codecs/wm9712.c:91:3: error: =E2=80=98const struct
> regmap_config=E2=80=99 has no member named =E2=80=98volatile_reg=E2=80=
=99
> >     1    sound/soc/codecs/wm9712.c:89:3: error: =E2=80=98const struct
> regmap_config=E2=80=99 has no member named =E2=80=98cache_type=E2=80=99
> >     1    sound/soc/codecs/wm9712.c:88:3: error: =E2=80=98const struct
> regmap_config=E2=80=99 has no member named =E2=80=98max_register=E2=80=
=99
> >     1    sound/soc/codecs/wm9712.c:87:3: error: =E2=80=98const struct
> regmap_config=E2=80=99 has no member named =E2=80=98val_bits=E2=80=99
> >     1    sound/soc/codecs/wm9712.c:86:3: error: =E2=80=98const struct
> regmap_config=E2=80=99 has no member named =E2=80=98reg_stride=E2=80=99
> >     1    sound/soc/codecs/wm9712.c:85:3: error: =E2=80=98const struct
> regmap_config=E2=80=99 has no member named =E2=80=98reg_bits=E2=80=99
> >     1    sound/soc/codecs/wm9712.c:84:35: error: storage size of
> =E2=80=98wm9712_regmap_config=E2=80=99 isn=E2=80=99t known
> >     1    sound/soc/codecs/wm9712.c:84:21: error: variable
> =E2=80=98wm9712_regmap_config=E2=80=99 has initializer but incomplete ty=
pe
> >     1    sound/soc/codecs/wm9712.c:80:10: error: implicit declaration =
of
> function =E2=80=98regmap_ac97_default_volatile=E2=80=99
> [-Werror=3Dimplicit-function-declaration]
> >     1    sound/soc/codecs/wm9712.c:675:3: error: implicit declaration =
of
> function =E2=80=98snd_soc_component_exit_regmap=E2=80=99; did you mean
> =E2=80=98snd_soc_component_trigger=E2=80=99? [-Werror=3Dimplicit-functio=
n-declaration]
> >     1    sound/soc/codecs/wm9712.c:662:2: error: implicit declaration =
of
> function =E2=80=98snd_soc_component_init_regmap=E2=80=99; did you mean
> =E2=80=98snd_soc_component_trigger=E2=80=99? [-Werror=3Dimplicit-functio=
n-declaration]
> >     1    sound/soc/codecs/wm9712.c:653:12: error: implicit declaration
> of function =E2=80=98regmap_init_ac97=E2=80=99; did you mean =E2=80=98me=
mmap_init_zone=E2=80=99?
> [-Werror=3Dimplicit-function-declaration]
> >     1    ERROR: "snd_ac97_reset" [sound/soc/codecs/snd-soc-wm9713.ko]
> undefined!
> >     1    ERROR: "snd_ac97_reset" [sound/soc/codecs/snd-soc-wm9705.ko]
> undefined!
> >
> > Warnings summary:
> >
> >     81   cc1: some warnings being treated as errors
> >     36   1 warning generated.
> >     14   drivers/net/ethernet/mellanox/mlx5/core/diag/rsc_dump.h:4:9:
> warning: '__MLX5_RSC_DUMP_H' is used as a header guard here, followed by
> #define of a different macro [-Wheader-guard]
> >     9    drivers/net/phy/mdio-cavium.h:113:48: warning: cast to pointe=
r
> from integer of different size [-Wint-to-pointer-cast]
> >     9    arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts:523.3-30:
> Warning (i2c_bus_reg): /ahb/apb/bus@1e78a000/i2c-bus@380/ipmb0@10:reg:
> I2C address must be less than 10-bits, got "0x40000010"
> >     9
> arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts:521.11-525.4: Warnin=
g
> (i2c_bus_reg): /ahb/apb/bus@1e78a000/i2c-bus@380/ipmb0@10: I2C bus unit
> address format error, expected "40000010"
> >     9    arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts:437.3-30:
> Warning (i2c_bus_reg): /ahb/apb/bus@1e78a000/i2c-bus@140/ipmb0@10:reg:
> I2C address must be less than 10-bits, got "0x40000010"
> >     9
> arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts:435.11-439.4: Warnin=
g
> (i2c_bus_reg): /ahb/apb/bus@1e78a000/i2c-bus@140/ipmb0@10: I2C bus unit
> address format error, expected "40000010"
> >     8    WARNING: unmet direct dependencies detected for SND_SOC_WM971=
2
> >     6    2 warnings generated.
> >     4    kernel/sched/fair.c:1524:20: warning: =E2=80=98test_idle_core=
s=E2=80=99
> declared =E2=80=98static=E2=80=99 but never defined [-Wunused-function]
> >     4    drivers/net/phy/mdio-cavium.h:114:37: warning: cast to pointe=
r
> from integer of different size [-Wint-to-pointer-cast]
> >     2    fs/btrfs/backref.c:394:30: warning: suggest braces around
> initialization of subobject [-Wmissing-braces]
> >     2    drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c:722:36: warning: sugge=
st
> braces around initialization of subobject [-Wmissing-braces]
> >     2
> drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_link_dp.c:2692:80:
> warning: suggest braces around initialization of subobject
> [-Wmissing-braces]
> >     2    WARNING: unmet direct dependencies detected for SND_SOC_WM971=
3
> >     2    WARNING: unmet direct dependencies detected for SND_SOC_WM970=
5
> >     2    <stdin>:830:2: warning: #warning syscall fstat64 not
> implemented [-Wcpp]
> >     2    <stdin>:1511:2: warning: #warning syscall clone3 not
> implemented [-Wcpp]
> >     2    <stdin>:1127:2: warning: #warning syscall fstatat64 not
> implemented [-Wcpp]
> >     2    3 warnings generated.
> >     1    sound/soc/codecs/wm9712.c:93:18: warning: excess elements in
> struct initializer
> >     1    sound/soc/codecs/wm9712.c:91:18: warning: excess elements in
> struct initializer
> >     1    sound/soc/codecs/wm9712.c:89:16: warning: excess elements in
> struct initializer
> >     1    sound/soc/codecs/wm9712.c:88:18: warning: excess elements in
> struct initializer
> >     1    sound/soc/codecs/wm9712.c:87:14: warning: excess elements in
> struct initializer
> >     1    sound/soc/codecs/wm9712.c:86:16: warning: excess elements in
> struct initializer
> >     1    sound/soc/codecs/wm9712.c:85:14: warning: excess elements in
> struct initializer
> >     1    sound/soc/codecs/wm9712.c:653:10: warning: assignment to
> =E2=80=98struct regmap *=E2=80=99 from =E2=80=98int=E2=80=99 makes point=
er from integer without a cast
> [-Wint-conversion]
> >     1    net/sched/cls_flower.c:331:1: warning: the frame size of 1032
> bytes is larger than 1024 bytes [-Wframe-larger-than=3D]
> >     1    net/nfc/hci/llc_shdlc.c:687:34: warning: variable 'connect_wq=
'
> is uninitialized when used within its own initialization [-Wuninitialize=
d]
> >     1    net/nfc/hci/command.c:59:34: warning: variable 'ew_wq' is
> uninitialized when used within its own initialization [-Wuninitialized]
> >     1    mm/shmem.c:2745:35: warning: variable 'shmem_falloc_waitq' is
> uninitialized when used within its own initialization [-Wuninitialized]
> >     1    include/linux/kernel.h:47:25: warning: excess elements in
> struct initializer
> >     1    fs/proc/proc_sysctl.c:705:35: warning: variable 'wq' is
> uninitialized when used within its own initialization [-Wuninitialized]
> >     1    fs/proc/base.c:1985:35: warning: variable 'wq' is uninitializ=
ed
> when used within its own initialization [-Wuninitialized]
> >     1    fs/nfs/dir.c:464:34: warning: variable 'wq' is uninitialized
> when used within its own initialization [-Wuninitialized]
> >     1    fs/nfs/dir.c:1638:34: warning: variable 'wq' is uninitialized
> when used within its own initialization [-Wuninitialized]
> >     1    fs/namei.c:3213:34: warning: variable 'wq' is uninitialized
> when used within its own initialization [-Wuninitialized]
> >     1    fs/namei.c:1736:34: warning: variable 'wq' is uninitialized
> when used within its own initialization [-Wuninitialized]
> >     1    fs/fuse/readdir.c:161:34: warning: variable 'wq' is
> uninitialized when used within its own initialization [-Wuninitialized]
> >     1    fs/cifs/readdir.c:84:34: warning: variable 'wq' is
> uninitialized when used within its own initialization [-Wuninitialized]
> >     1    fs/afs/dir_silly.c:205:34: warning: variable 'wq' is
> uninitialized when used within its own initialization [-Wuninitialized]
> >     1    drivers/soc/fsl/dpio/qbman-portal.c:870:14: warning: cast fro=
m
> pointer to integer of different size [-Wpointer-to-int-cast]
> >     1    drivers/scsi/lpfc/lpfc_sli.c:11910:34: warning: variable
> 'done_q' is uninitialized when used within its own initialization
> [-Wuninitialized]
> >     1    drivers/scsi/lpfc/lpfc_scsi.c:4728:34: warning: variable
> 'waitq' is uninitialized when used within its own initialization
> [-Wuninitialized]
> >     1    drivers/scsi/bfa/bfad_im.c:378:34: warning: variable 'wq' is
> uninitialized when used within its own initialization [-Wuninitialized]
> >     1    drivers/scsi/bfa/bfad_im.c:301:34: warning: variable 'wq' is
> uninitialized when used within its own initialization [-Wuninitialized]
> >     1    drivers/net/wireless/ath/ath11k/debugfs_sta.c:185:7: warning:
> variable 'rate_idx' is used uninitialized whenever 'if' condition is fal=
se
> [-Wsometimes-uninitialized]
> >     1    drivers/net/wireless/ath/ath11k/debugfs_sta.c:184:13: warning=
:
> variable 'rate_idx' is used uninitialized whenever 'if' condition is fal=
se
> [-Wsometimes-uninitialized]
> >     1    drivers/net/wireless/ath/ath11k/debugfs_sta.c:175:7: warning:
> variable 'rate_idx' is used uninitialized whenever 'if' condition is fal=
se
> [-Wsometimes-uninitialized]
> >     1    drivers/net/wireless/ath/ath11k/debugfs_sta.c:139:13: note:
> initialize the variable 'rate_idx' to silence this warning
> >     1    drivers/net/usb/lan78xx.c:2659:34: warning: variable
> 'unlink_wakeup' is uninitialized when used within its own initialization
> [-Wuninitialized]
> >     1    drivers/net/phy/mdio-octeon.c:48:3: warning: cast from pointe=
r
> to integer of different size [-Wpointer-to-int-cast]
> >     1    drivers/net/ethernet/amazon/ena/ena_netdev.c:310:38: warning:
> suggest braces around initialization of subobject [-Wmissing-braces]
> >     1    drivers/misc/mic/vop/vop_vringh.c:399:34: warning: variable
> 'wake' is uninitialized when used within its own initialization
> [-Wuninitialized]
> >     1    drivers/misc/mic/vop/vop_vringh.c:155:34: warning: variable
> 'wake' is uninitialized when used within its own initialization
> [-Wuninitialized]
> >     1    drivers/hwtracing/coresight/coresight-cti-sysfs.c:948:11:
> warning: address of array 'grp->sig_types' will always evaluate to 'true=
'
> [-Wpointer-bool-conversion]
> >     1    drivers/gpu/host1x/syncpt.c:208:34: warning: variable 'wq' is
> uninitialized when used within its own initialization [-Wuninitialized]
> >     1    drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dmub_psr.c:147:5=
6:
> warning: address of 'pipe_ctx->stream_res' will always evaluate to 'true=
'
> [-Wpointer-bool-conversion]
> >     1    drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dmub_psr.c:147:3=
1:
> warning: address of 'pipe_ctx->plane_res' will always evaluate to 'true'
> [-Wpointer-bool-conversion]
> >     1
> drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_link_dp.c:2690:53:
> warning: suggest braces around initialization of subobject
> [-Wmissing-braces]
> >     1
> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table2.c:342:53:
> warning: suggest braces around initialization of subobject
> [-Wmissing-braces]
> >     1
> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table2.c:116:62:
> warning: suggest braces around initialization of subobject
> [-Wmissing-braces]
> >     1
> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/bios_parser2.c:297:41:
> warning: suggest braces around initialization of subobject
> [-Wmissing-braces]
> >     1
> drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:8558:43:
> warning: suggest braces around initialization of subobject
> [-Wmissing-braces]
> >     1    drivers/bluetooth/bluecard_cs.c:282:36: warning: variable 'wq=
'
> is uninitialized when used within its own initialization [-Wuninitialize=
d]
> >     1    drivers/android/binderfs.c:657:41: warning: suggest braces
> around initialization of subobject [-Wmissing-braces]
> >     1    cc1: all warnings being treated as errors
> >     1    /tmp/ccgeLqJj.s:18191: Warning: using r15 results in
> unpredictable behaviour
> >     1    /tmp/ccgeLqJj.s:18119: Warning: using r15 results in
> unpredictable behaviour
> >     1    .config:1167:warning: override: UNWINDER_GUESS changes choice
> state
> >
> >
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
> >
> > Detailed per-defconfig build reports:
> >
> >
> ------------------------------------------------------------------------=
--------
> > 32r2el_defconfig (mips, gcc-8) =E2=80=94 FAIL, 1 error, 1 warning, 0 s=
ection
> mismatches
> >
> > Errors:
> >     mm/memory.c:1523:41: error: implicit declaration of function
> =E2=80=98pte_index=E2=80=99; did you mean =E2=80=98page_index=E2=80=99?
> [-Werror=3Dimplicit-function-declaration]
> >
> > Warnings:
> >     cc1: some warnings being treated as errors
> >
> >
> ------------------------------------------------------------------------=
--------
> > 32r2el_defconfig+kselftest (mips, gcc-8) =E2=80=94 FAIL, 1 error, 1 wa=
rning, 0
> section mismatches
> >
> > Errors:
> >     mm/memory.c:1523:41: error: implicit declaration of function
> =E2=80=98pte_index=E2=80=99; did you mean =E2=80=98page_index=E2=80=99?
> [-Werror=3Dimplicit-function-declaration]
> >
> > Warnings:
> >     cc1: some warnings being treated as errors
> >
> >
> ------------------------------------------------------------------------=
--------
> > allmodconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 21 warnings, 0 sec=
tion
> mismatches
> >
> > Warnings:
> >     /tmp/ccgeLqJj.s:18119: Warning: using r15 results in unpredictable
> behaviour
> >     /tmp/ccgeLqJj.s:18191: Warning: using r15 results in unpredictable
> behaviour
> >     drivers/net/phy/mdio-cavium.h:114:37: warning: cast to pointer fro=
m
> integer of different size [-Wint-to-pointer-cast]
> >     drivers/net/phy/mdio-cavium.h:113:48: warning: cast to pointer fro=
m
> integer of different size [-Wint-to-pointer-cast]
> >     drivers/net/phy/mdio-cavium.h:113:48: warning: cast to pointer fro=
m
> integer of different size [-Wint-to-pointer-cast]
> >     drivers/net/phy/mdio-cavium.h:113:48: warning: cast to pointer fro=
m
> integer of different size [-Wint-to-pointer-cast]
> >     drivers/net/phy/mdio-cavium.h:114:37: warning: cast to pointer fro=
m
> integer of different size [-Wint-to-pointer-cast]
> >     drivers/net/phy/mdio-cavium.h:113:48: warning: cast to pointer fro=
m
> integer of different size [-Wint-to-pointer-cast]
> >     drivers/net/phy/mdio-cavium.h:114:37: warning: cast to pointer fro=
m
> integer of different size [-Wint-to-pointer-cast]
> >     drivers/net/phy/mdio-cavium.h:113:48: warning: cast to pointer fro=
m
> integer of different size [-Wint-to-pointer-cast]
> >     drivers/net/phy/mdio-cavium.h:113:48: warning: cast to pointer fro=
m
> integer of different size [-Wint-to-pointer-cast]
> >     drivers/net/phy/mdio-cavium.h:114:37: warning: cast to pointer fro=
m
> integer of different size [-Wint-to-pointer-cast]
> >     drivers/net/phy/mdio-octeon.c:48:3: warning: cast from pointer to
> integer of different size [-Wpointer-to-int-cast]
> >     drivers/net/phy/mdio-cavium.h:113:48: warning: cast to pointer fro=
m
> integer of different size [-Wint-to-pointer-cast]
> >     drivers/net/phy/mdio-cavium.h:113:48: warning: cast to pointer fro=
m
> integer of different size [-Wint-to-pointer-cast]
> >     drivers/net/phy/mdio-cavium.h:113:48: warning: cast to pointer fro=
m
> integer of different size [-Wint-to-pointer-cast]
> >     drivers/soc/fsl/dpio/qbman-portal.c:870:14: warning: cast from
> pointer to integer of different size [-Wpointer-to-int-cast]
> >     arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts:435.11-439.4:
> Warning (i2c_bus_reg): /ahb/apb/bus@1e78a000/i2c-bus@140/ipmb0@10: I2C
> bus unit address format error, expected "40000010"
> >     arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts:437.3-30:
> Warning (i2c_bus_reg): /ahb/apb/bus@1e78a000/i2c-bus@140/ipmb0@10:reg:
> I2C address must be less than 10-bits, got "0x40000010"
> >     arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts:521.11-525.4:
> Warning (i2c_bus_reg): /ahb/apb/bus@1e78a000/i2c-bus@380/ipmb0@10: I2C
> bus unit address format error, expected "40000010"
> >     arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts:523.3-30:
> Warning (i2c_bus_reg): /ahb/apb/bus@1e78a000/i2c-bus@380/ipmb0@10:reg:
> I2C address must be less than 10-bits, got "0x40000010"
> >
> >
> ------------------------------------------------------------------------=
--------
> > allmodconfig (arm64, clang-8) =E2=80=94 PASS, 0 errors, 81 warnings, 0=
 section
> mismatches
> >
> > Warnings:
> >     fs/proc/base.c:1985:35: warning: variable 'wq' is uninitialized wh=
en
> used within its own initialization [-Wuninitialized]
> >     1 warning generated.
> >     mm/shmem.c:2745:35: warning: variable 'shmem_falloc_waitq' is
> uninitialized when used within its own initialization [-Wuninitialized]
> >     1 warning generated.
> >     fs/proc/proc_sysctl.c:705:35: warning: variable 'wq' is
> uninitialized when used within its own initialization [-Wuninitialized]
> >     1 warning generated.
> >     fs/namei.c:1736:34: warning: variable 'wq' is uninitialized when
> used within its own initialization [-Wuninitialized]
> >     fs/namei.c:3213:34: warning: variable 'wq' is uninitialized when
> used within its own initialization [-Wuninitialized]
> >     2 warnings generated.
> >     drivers/android/binderfs.c:657:41: warning: suggest braces around
> initialization of subobject [-Wmissing-braces]
> >     1 warning generated.
> >     drivers/hwtracing/coresight/coresight-cti-sysfs.c:948:11: warning:
> address of array 'grp->sig_types' will always evaluate to 'true'
> [-Wpointer-bool-conversion]
> >     1 warning generated.
> >     fs/afs/dir_silly.c:205:34: warning: variable 'wq' is uninitialized
> when used within its own initialization [-Wuninitialized]
> >     1 warning generated.
> >     drivers/bluetooth/bluecard_cs.c:282:36: warning: variable 'wq' is
> uninitialized when used within its own initialization [-Wuninitialized]
> >     1 warning generated.
> >     fs/cifs/readdir.c:84:34: warning: variable 'wq' is uninitialized
> when used within its own initialization [-Wuninitialized]
> >     1 warning generated.
> >     drivers/gpu/host1x/syncpt.c:208:34: warning: variable 'wq' is
> uninitialized when used within its own initialization [-Wuninitialized]
> >     1 warning generated.
> >     net/nfc/hci/command.c:59:34: warning: variable 'ew_wq' is
> uninitialized when used within its own initialization [-Wuninitialized]
> >     1 warning generated.
> >     fs/btrfs/backref.c:394:30: warning: suggest braces around
> initialization of subobject [-Wmissing-braces]
> >     1 warning generated.
> >     net/nfc/hci/llc_shdlc.c:687:34: warning: variable 'connect_wq' is
> uninitialized when used within its own initialization [-Wuninitialized]
> >     1 warning generated.
> >     fs/fuse/readdir.c:161:34: warning: variable 'wq' is uninitialized
> when used within its own initialization [-Wuninitialized]
> >     1 warning generated.
> >     fs/nfs/dir.c:464:34: warning: variable 'wq' is uninitialized when
> used within its own initialization [-Wuninitialized]
> >     fs/nfs/dir.c:1638:34: warning: variable 'wq' is uninitialized when
> used within its own initialization [-Wuninitialized]
> >     2 warnings generated.
> >     drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c:722:36: warning: suggest
> braces around initialization of subobject [-Wmissing-braces]
> >     1 warning generated.
> >     drivers/misc/mic/vop/vop_vringh.c:155:34: warning: variable 'wake'
> is uninitialized when used within its own initialization [-Wuninitialize=
d]
> >     drivers/misc/mic/vop/vop_vringh.c:399:34: warning: variable 'wake'
> is uninitialized when used within its own initialization [-Wuninitialize=
d]
> >     2 warnings generated.
> >     drivers/net/ethernet/amazon/ena/ena_netdev.c:310:38: warning:
> suggest braces around initialization of subobject [-Wmissing-braces]
> >     1 warning generated.
> >     drivers/net/usb/lan78xx.c:2659:34: warning: variable 'unlink_wakeu=
p'
> is uninitialized when used within its own initialization [-Wuninitialize=
d]
> >     1 warning generated.
> >     drivers/net/wireless/ath/ath11k/debugfs_sta.c:185:7: warning:
> variable 'rate_idx' is used uninitialized whenever 'if' condition is fal=
se
> [-Wsometimes-uninitialized]
> >     drivers/net/wireless/ath/ath11k/debugfs_sta.c:184:13: warning:
> variable 'rate_idx' is used uninitialized whenever 'if' condition is fal=
se
> [-Wsometimes-uninitialized]
> >     drivers/net/wireless/ath/ath11k/debugfs_sta.c:175:7: warning:
> variable 'rate_idx' is used uninitialized whenever 'if' condition is fal=
se
> [-Wsometimes-uninitialized]
> >     drivers/net/wireless/ath/ath11k/debugfs_sta.c:139:13: note:
> initialize the variable 'rate_idx' to silence this warning
> >     3 warnings generated.
> >     drivers/scsi/bfa/bfad_im.c:301:34: warning: variable 'wq' is
> uninitialized when used within its own initialization [-Wuninitialized]
> >     drivers/scsi/bfa/bfad_im.c:378:34: warning: variable 'wq' is
> uninitialized when used within its own initialization [-Wuninitialized]
> >     2 warnings generated.
> >     drivers/net/ethernet/mellanox/mlx5/core/diag/rsc_dump.h:4:9:
> warning: '__MLX5_RSC_DUMP_H' is used as a header guard here, followed by
> #define of a different macro [-Wheader-guard]
> >     1 warning generated.
> >     drivers/scsi/lpfc/lpfc_sli.c:11910:34: warning: variable 'done_q' =
is
> uninitialized when used within its own initialization [-Wuninitialized]
> >     1 warning generated.
> >     drivers/scsi/lpfc/lpfc_scsi.c:4728:34: warning: variable 'waitq' i=
s
> uninitialized when used within its own initialization [-Wuninitialized]
> >     1 warning generated.
> >     drivers/net/ethernet/mellanox/mlx5/core/diag/rsc_dump.h:4:9:
> warning: '__MLX5_RSC_DUMP_H' is used as a header guard here, followed by
> #define of a different macro [-Wheader-guard]
> >     1 warning generated.
> >     drivers/net/ethernet/mellanox/mlx5/core/diag/rsc_dump.h:4:9:
> warning: '__MLX5_RSC_DUMP_H' is used as a header guard here, followed by
> #define of a different macro [-Wheader-guard]
> >     1 warning generated.
> >     drivers/net/ethernet/mellanox/mlx5/core/diag/rsc_dump.h:4:9:
> warning: '__MLX5_RSC_DUMP_H' is used as a header guard here, followed by
> #define of a different macro [-Wheader-guard]
> >     1 warning generated.
> >     drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:8558:4=
3:
> warning: suggest braces around initialization of subobject
> [-Wmissing-braces]
> >     1 warning generated.
> >     drivers/net/ethernet/mellanox/mlx5/core/diag/rsc_dump.h:4:9:
> warning: '__MLX5_RSC_DUMP_H' is used as a header guard here, followed by
> #define of a different macro [-Wheader-guard]
> >     1 warning generated.
> >     drivers/net/ethernet/mellanox/mlx5/core/diag/rsc_dump.h:4:9:
> warning: '__MLX5_RSC_DUMP_H' is used as a header guard here, followed by
> #define of a different macro [-Wheader-guard]
> >     1 warning generated.
> >     drivers/net/ethernet/mellanox/mlx5/core/diag/rsc_dump.h:4:9:
> warning: '__MLX5_RSC_DUMP_H' is used as a header guard here, followed by
> #define of a different macro [-Wheader-guard]
> >     1 warning generated.
> >
>  drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table2.c:116:62:
> warning: suggest braces around initialization of subobject
> [-Wmissing-braces]
> >
>  drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table2.c:342:53:
> warning: suggest braces around initialization of subobject
> [-Wmissing-braces]
> >     2 warnings generated.
> >     drivers/gpu/drm/amd/amdgpu/../display/dc/bios/bios_parser2.c:297:4=
1:
> warning: suggest braces around initialization of subobject
> [-Wmissing-braces]
> >     1 warning generated.
> >     drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dmub_psr.c:147:31:
> warning: address of 'pipe_ctx->plane_res' will always evaluate to 'true'
> [-Wpointer-bool-conversion]
> >     drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dmub_psr.c:147:56:
> warning: address of 'pipe_ctx->stream_res' will always evaluate to 'true=
'
> [-Wpointer-bool-conversion]
> >     2 warnings generated.
> >     drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_link_dp.c:2690:53=
:
> warning: suggest braces around initialization of subobject
> [-Wmissing-braces]
> >     drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_link_dp.c:2692:80=
:
> warning: suggest braces around initialization of subobject
> [-Wmissing-braces]
> >     drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_link_dp.c:2692:80=
:
> warning: suggest braces around initialization of subobject
> [-Wmissing-braces]
> >     3 warnings generated.
> >
> >
> ------------------------------------------------------------------------=
--------
> > allmodconfig (arm64, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction
> mismatches
> >
> >
> ------------------------------------------------------------------------=
--------
> > allmodconfig (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection
> mismatches
> >
> >
> ------------------------------------------------------------------------=
--------
> > allnoconfig (riscv, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion
> mismatches
> >
> >
> ------------------------------------------------------------------------=
--------
> > allnoconfig (arm64, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion
> mismatches
> >
> >
> ------------------------------------------------------------------------=
--------
> > allnoconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on
> mismatches
> >
> >
> ------------------------------------------------------------------------=
--------
> > allnoconfig (arc, gcc-8) =E2=80=94 FAIL, 1 error, 1 warning, 0 section=
 mismatches
> >
> > Errors:
> >     mm/memory.c:1523:41: error: implicit declaration of function
> =E2=80=98pte_index=E2=80=99; did you mean =E2=80=98page_index=E2=80=99?
> [-Werror=3Dimplicit-function-declaration]
> >
> > Warnings:
> >     cc1: some warnings being treated as errors
> >
> >
> ------------------------------------------------------------------------=
--------
> > allnoconfig (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction
> mismatches
> >
> >
> ------------------------------------------------------------------------=
--------
> > allnoconfig (mips, gcc-8) =E2=80=94 FAIL, 1 error, 1 warning, 0 sectio=
n
> mismatches
> >
> > Errors:
> >     mm/memory.c:1523:41: error: implicit declaration of function
> =E2=80=98pte_index=E2=80=99; did you mean =E2=80=98page_index=E2=80=99?
> [-Werror=3Dimplicit-function-declaration]
> >
> > Warnings:
> >     cc1: some warnings being treated as errors
> >
> >
> ------------------------------------------------------------------------=
--------
> > allnoconfig (i386, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion
> mismatches
> >
> >
> ------------------------------------------------------------------------=
--------
> > allnoconfig (arm64, clang-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection
> mismatches
> >
> >
> ------------------------------------------------------------------------=
--------
> > am200epdkit_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warning=
s, 0
> section mismatches
> >
> >
> ------------------------------------------------------------------------=
--------
> > ar7_defconfig (mips, gcc-8) =E2=80=94 FAIL, 1 error, 1 warning, 0 sect=
ion
> mismatches
> >
> > Errors:
> >     mm/memory.c:1523:41: error: implicit declaration of function
> =E2=80=98pte_index=E2=80=99; did you mean =E2=80=98page_index=E2=80=99?
> [-Werror=3Dimplicit-function-declaration]
> >
> > Warnings:
> >     cc1: some warnings being treated as errors
> >
> >
> ------------------------------------------------------------------------=
--------
> > aspeed_g4_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings,=
 0 section
> mismatches
> >
> > Warnings:
> >     arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts:435.11-439.4:
> Warning (i2c_bus_reg): /ahb/apb/bus@1e78a000/i2c-bus@140/ipmb0@10: I2C
> bus unit address format error, expected "40000010"
> >     arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts:437.3-30:
> Warning (i2c_bus_reg): /ahb/apb/bus@1e78a000/i2c-bus@140/ipmb0@10:reg:
> I2C address must be less than 10-bits, got "0x40000010"
> >     arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts:521.11-525.4:
> Warning (i2c_bus_reg): /ahb/apb/bus@1e78a000/i2c-bus@380/ipmb0@10: I2C
> bus unit address format error, expected "40000010"
> >     arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts:523.3-30:
> Warning (i2c_bus_reg): /ahb/apb/bus@1e78a000/i2c-bus@380/ipmb0@10:reg:
> I2C address must be less than 10-bits, got "0x40000010"
> >
> >
> ------------------------------------------------------------------------=
--------
> > aspeed_g5_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings,=
 0 section
> mismatches
> >
> > Warnings:
> >     arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts:435.11-439.4:
> Warning (i2c_bus_reg): /ahb/apb/bus@1e78a000/i2c-bus@140/ipmb0@10: I2C
> bus unit address format error, expected "40000010"
> >     arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts:437.3-30:
> Warning (i2c_bus_reg): /ahb/apb/bus@1e78a000/i2c-bus@140/ipmb0@10:reg:
> I2C address must be less than 10-bits, got "0x40000010"
> >     arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts:521.11-525.4:
> Warning (i2c_bus_reg): /ahb/apb/bus@1e78a000/i2c-bus@380/ipmb0@10: I2C
> bus unit address format error, expected "40000010"
> >     arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts:523.3-30:
> Warning (i2c_bus_reg): /ahb/apb/bus@1e78a000/i2c-bus@380/ipmb0@10:reg:
> I2C address must be less than 10-bits, got "0x40000010"
> >
> >
> ------------------------------------------------------------------------=
--------
> > assabet_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section
> mismatches
> >
> >
> ------------------------------------------------------------------------=
--------
> > at91_dt_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section
> mismatches
> >
> >
> ------------------------------------------------------------------------=
--------
> > ath25_defconfig (mips, gcc-8) =E2=80=94 FAIL, 1 error, 1 warning, 0 se=
ction
> mismatches
> >
> > Errors:
> >     mm/memory.c:1523:41: error: implicit declaration of function
> =E2=80=98pte_index=E2=80=99; did you mean =E2=80=98page_index=E2=80=99?
> [-Werror=3Dimplicit-function-declaration]
> >
> > Warnings:
> >     cc1: some warnings being treated as errors
> >
> >
> ------------------------------------------------------------------------=
--------
> > ath79_defconfig (mips, gcc-8) =E2=80=94 FAIL, 1 error, 1 warning, 0 se=
ction
> mismatches
> >
> > Errors:
> >     mm/memory.c:1523:41: error: implicit declaration of function
> =E2=80=98pte_index=E2=80=99; did you mean =E2=80=98page_index=E2=80=99?
> [-Werror=3Dimplicit-function-declaration]
> >
> > Warnings:
> >     cc1: some warnings being treated as errors
> >
> >
> ------------------------------------------------------------------------=
--------
> > axm55xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section
> mismatches
> >
> >
> ------------------------------------------------------------------------=
--------
> > axs103_defconfig (arc, gcc-8) =E2=80=94 FAIL, 1 error, 1 warning, 0 se=
ction
> mismatches
> >
> > Errors:
> >     mm/memory.c:1523:41: error: implicit declaration of function
> =E2=80=98pte_index=E2=80=99; did you mean =E2=80=98page_index=E2=80=99?
> [-Werror=3Dimplicit-function-declaration]
> >
> > Warnings:
> >     cc1: some warnings being treated as errors
> >
> >
> ------------------------------------------------------------------------=
--------
> > axs103_smp_defconfig (arc, gcc-8) =E2=80=94 FAIL, 1 error, 1 warning, =
0 section
> mismatches
> >
> > Errors:
> >     mm/memory.c:1523:41: error: implicit declaration of function
> =E2=80=98pte_index=E2=80=99; did you mean =E2=80=98page_index=E2=80=99?
> [-Werror=3Dimplicit-function-declaration]
> >
> > Warnings:
> >     cc1: some warnings being treated as errors
> >
> >
> ------------------------------------------------------------------------=
--------
> > badge4_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section
> mismatches
> >
> >
> ------------------------------------------------------------------------=
--------
> > bcm2835_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section
> mismatches
> >
> >
> ------------------------------------------------------------------------=
--------
> > bcm47xx_defconfig (mips, gcc-8) =E2=80=94 FAIL, 1 error, 1 warning, 0 =
section
> mismatches
> >
> > Errors:
> >     mm/memory.c:1523:41: error: implicit declaration of function
> =E2=80=98pte_index=E2=80=99; did you mean =E2=80=98page_index=E2=80=99?
> [-Werror=3Dimplicit-function-declaration]
> >
> > Warnings:
> >     cc1: some warnings being treated as errors
> >
> >
> ------------------------------------------------------------------------=
--------
> > bcm63xx_defconfig (mips, gcc-8) =E2=80=94 FAIL, 1 error, 1 warning, 0 =
section
> mismatches
> >
> > Errors:
> >     mm/memory.c:1523:41: error: implicit declaration of function
> =E2=80=98pte_index=E2=80=99; did you mean =E2=80=98page_index=E2=80=99?
> [-Werror=3Dimplicit-function-declaration]
> >
> > Warnings:
> >     cc1: some warnings being treated as errors
> >
> >
> ------------------------------------------------------------------------=
--------
> > bigsur_defconfig (mips, gcc-8) =E2=80=94 FAIL, 1 error, 1 warning, 0 s=
ection
> mismatches
> >
> > Errors:
> >     mm/memory.c:1523:41: error: implicit declaration of function
> =E2=80=98pte_index=E2=80=99; did you mean =E2=80=98page_index=E2=80=99?
> [-Werror=3Dimplicit-function-declaration]
> >
> > Warnings:
> >     cc1: some warnings being treated as errors
> >
> >
> ------------------------------------------------------------------------=
--------
> > bmips_be_defconfig (mips, gcc-8) =E2=80=94 FAIL, 1 error, 1 warning, 0=
 section
> mismatches
> >
> > Errors:
> >     mm/memory.c:1523:41: error: implicit declaration of function
> =E2=80=98pte_index=E2=80=99; did you mean =E2=80=98page_index=E2=80=99?
> [-Werror=3Dimplicit-function-declaration]
> >
> > Warnings:
> >     cc1: some warnings being treated as errors
> >
> >
> ------------------------------------------------------------------------=
--------
> > bmips_stb_defconfig (mips, gcc-8) =E2=80=94 FAIL, 1 error, 1 warning, =
0 section
> mismatches
> >
> > Errors:
> >     mm/memory.c:1523:41: error: implicit declaration of function
> =E2=80=98pte_index=E2=80=99; did you mean =E2=80=98page_index=E2=80=99?
> [-Werror=3Dimplicit-function-declaration]
> >
> > Warnings:
> >     cc1: some warnings being treated as errors
> >
> >
> ------------------------------------------------------------------------=
--------
> > capcella_defconfig (mips, gcc-8) =E2=80=94 FAIL, 1 error, 1 warning, 0=
 section
> mismatches
> >
> > Errors:
> >     mm/memory.c:1523:41: error: implicit declaration of function
> =E2=80=98pte_index=E2=80=99; did you mean =E2=80=98page_index=E2=80=99?
> [-Werror=3Dimplicit-function-declaration]
> >
> > Warnings:
> >     cc1: some warnings being treated as errors
> >
> >
> ------------------------------------------------------------------------=
--------
> > cavium_octeon_defconfig (mips, gcc-8) =E2=80=94 FAIL, 1 error, 1 warni=
ng, 0
> section mismatches
> >
> > Errors:
> >     mm/memory.c:1523:41: error: implicit declaration of function
> =E2=80=98pte_index=E2=80=99; did you mean =E2=80=98page_index=E2=80=99?
> [-Werror=3Dimplicit-function-declaration]
> >
> > Warnings:
> >     cc1: some warnings being treated as errors
> >
> >
> ------------------------------------------------------------------------=
--------
> > cerfcube_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, =
0 section
> mismatches
> >
> >
> ------------------------------------------------------------------------=
--------
> > ci20_defconfig (mips, gcc-8) =E2=80=94 FAIL, 1 error, 1 warning, 0 sec=
tion
> mismatches
> >
> > Errors:
> >     mm/memory.c:1523:41: error: implicit declaration of function
> =E2=80=98pte_index=E2=80=99; did you mean =E2=80=98page_index=E2=80=99?
> [-Werror=3Dimplicit-function-declaration]
> >
> > Warnings:
> >     cc1: some warnings being treated as errors
> >
> >
> ------------------------------------------------------------------------=
--------
> > clps711x_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, =
0 section
> mismatches
> >
> >
> ------------------------------------------------------------------------=
--------
> > cm_x2xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section
> mismatches
> >
> >
> ------------------------------------------------------------------------=
--------
> > cm_x300_defconfig (arm, gcc-8) =E2=80=94 FAIL, 1 error, 2 warnings, 0 =
section
> mismatches
> >
> > Errors:
> >     ERROR: "snd_ac97_reset" [sound/soc/codecs/snd-soc-wm9712.ko]
> undefined!
> >
> > Warnings:
> >     WARNING: unmet direct dependencies detected for SND_SOC_WM9712
> >     WARNING: unmet direct dependencies detected for SND_SOC_WM9712
> >
> >
> ------------------------------------------------------------------------=
--------
> > cns3420vb_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings,=
 0 section
> mismatches
> >
> >
> ------------------------------------------------------------------------=
--------
> > cobalt_defconfig (mips, gcc-8) =E2=80=94 FAIL, 1 error, 1 warning, 0 s=
ection
> mismatches
> >
> > Errors:
> >     mm/memory.c:1523:41: error: implicit declaration of function
> =E2=80=98pte_index=E2=80=99; did you mean =E2=80=98page_index=E2=80=99?
> [-Werror=3Dimplicit-function-declaration]
> >
> > Warnings:
> >     cc1: some warnings being treated as errors
> >
> >
> ------------------------------------------------------------------------=
--------
> > colibri_pxa270_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warn=
ings, 0
> section mismatches
> >
> >
> ------------------------------------------------------------------------=
--------
> > colibri_pxa300_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warn=
ings, 0
> section mismatches
> >
> >
> ------------------------------------------------------------------------=
--------
> > collie_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section
> mismatches
> >
> >
> ------------------------------------------------------------------------=
--------
> > corgi_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection
> mismatches
> >
> >
> ------------------------------------------------------------------------=
--------
> > cu1000-neo_defconfig (mips, gcc-8) =E2=80=94 FAIL, 1 error, 1 warning,=
 0 section
> mismatches
> >
> > Errors:
> >     mm/memory.c:1523:41: error: implicit declaration of function
> =E2=80=98pte_index=E2=80=99; did you mean =E2=80=98page_index=E2=80=99?
> [-Werror=3Dimplicit-function-declaration]
> >
> > Warnings:
> >     cc1: some warnings being treated as errors
> >
> >
> ------------------------------------------------------------------------=
--------
> > davinci_all_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warning=
s, 0
> section mismatches
> >
> >
> ------------------------------------------------------------------------=
--------
> > db1xxx_defconfig (mips, gcc-8) =E2=80=94 FAIL, 1 error, 1 warning, 0 s=
ection
> mismatches
> >
> > Errors:
> >     mm/memory.c:1523:41: error: implicit declaration of function
> =E2=80=98pte_index=E2=80=99; did you mean =E2=80=98page_index=E2=80=99?
> [-Werror=3Dimplicit-function-declaration]
> >
> > Warnings:
> >     cc1: some warnings being treated as errors
> >
> >
> ------------------------------------------------------------------------=
--------
> > decstation_64_defconfig (mips, gcc-8) =E2=80=94 FAIL, 1 error, 1 warni=
ng, 0
> section mismatches
> >
> > Errors:
> >     mm/memory.c:1523:41: error: implicit declaration of function
> =E2=80=98pte_index=E2=80=99; did you mean =E2=80=98page_index=E2=80=99?
> [-Werror=3Dimplicit-function-declaration]
> >
> > Warnings:
> >     cc1: some warnings being treated as errors
> >
> >
> ------------------------------------------------------------------------=
--------
> > decstation_defconfig (mips, gcc-8) =E2=80=94 FAIL, 1 error, 1 warning,=
 0 section
> mismatches
> >
> > Errors:
> >     mm/memory.c:1523:41: error: implicit declaration of function
> =E2=80=98pte_index=E2=80=99; did you mean =E2=80=98page_index=E2=80=99?
> [-Werror=3Dimplicit-function-declaration]
> >
> > Warnings:
> >     cc1: some warnings being treated as errors
> >
> >
> ------------------------------------------------------------------------=
--------
> > decstation_r4k_defconfig (mips, gcc-8) =E2=80=94 FAIL, 1 error, 1 warn=
ing, 0
> section mismatches
> >
> > Errors:
> >     mm/memory.c:1523:41: error: implicit declaration of function
> =E2=80=98pte_index=E2=80=99; did you mean =E2=80=98page_index=E2=80=99?
> [-Werror=3Dimplicit-function-declaration]
> >
> > Warnings:
> >     cc1: some warnings being treated as errors
> >
> >
> ------------------------------------------------------------------------=
--------
> > defconfig (arm64, clang-8) =E2=80=94 PASS, 0 errors, 18 warnings, 0 se=
ction
> mismatches
> >
> > Warnings:
> >     fs/btrfs/backref.c:394:30: warning: suggest braces around
> initialization of subobject [-Wmissing-braces]
> >     1 warning generated.
> >     drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c:722:36: warning: suggest
> braces around initialization of subobject [-Wmissing-braces]
> >     1 warning generated.
> >     drivers/net/ethernet/mellanox/mlx5/core/diag/rsc_dump.h:4:9:
> warning: '__MLX5_RSC_DUMP_H' is used as a header guard here, followed by
> #define of a different macro [-Wheader-guard]
> >     1 warning generated.
> >     drivers/net/ethernet/mellanox/mlx5/core/diag/rsc_dump.h:4:9:
> warning: '__MLX5_RSC_DUMP_H' is used as a header guard here, followed by
> #define of a different macro [-Wheader-guard]
> >     1 warning generated.
> >     drivers/net/ethernet/mellanox/mlx5/core/diag/rsc_dump.h:4:9:
> warning: '__MLX5_RSC_DUMP_H' is used as a header guard here, followed by
> #define of a different macro [-Wheader-guard]
> >     1 warning generated.
> >     drivers/net/ethernet/mellanox/mlx5/core/diag/rsc_dump.h:4:9:
> warning: '__MLX5_RSC_DUMP_H' is used as a header guard here, followed by
> #define of a different macro [-Wheader-guard]
> >     1 warning generated.
> >     drivers/net/ethernet/mellanox/mlx5/core/diag/rsc_dump.h:4:9:
> warning: '__MLX5_RSC_DUMP_H' is used as a header guard here, followed by
> #define of a different macro [-Wheader-guard]
> >     1 warning generated.
> >     drivers/net/ethernet/mellanox/mlx5/core/diag/rsc_dump.h:4:9:
> warning: '__MLX5_RSC_DUMP_H' is used as a header guard here, followed by
> #define of a different macro [-Wheader-guard]
> >     1 warning generated.
> >     drivers/net/ethernet/mellanox/mlx5/core/diag/rsc_dump.h:4:9:
> warning: '__MLX5_RSC_DUMP_H' is used as a header guard here, followed by
> #define of a different macro [-Wheader-guard]
> >     1 warning generated.
> >
> >
> ------------------------------------------------------------------------=
--------
> > defconfig (riscv, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on
> mismatches
> >
> >
> ------------------------------------------------------------------------=
--------
> > defconfig (arm64, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sectio=
n
> mismatches
> >
> > Warnings:
> >     kernel/sched/fair.c:1524:20: warning: =E2=80=98test_idle_cores=E2=
=80=99 declared
> =E2=80=98static=E2=80=99 but never defined [-Wunused-function]
> >
> >
> ------------------------------------------------------------------------=
--------
> > defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy (arm64, gcc-8) =E2=80=94 PASS, 0 e=
rrors, 1
> warning, 0 section mismatches
> >
> > Warnings:
> >     kernel/sched/fair.c:1524:20: warning: =E2=80=98test_idle_cores=E2=
=80=99 declared
> =E2=80=98static=E2=80=99 but never defined [-Wunused-function]
> >
> >
> ------------------------------------------------------------------------=
--------
> > defconfig+CONFIG_RANDOMIZE_BASE=3Dy (arm64, gcc-8) =E2=80=94 PASS, 0 e=
rrors, 1
> warning, 0 section mismatches
> >
> > Warnings:
> >     kernel/sched/fair.c:1524:20: warning: =E2=80=98test_idle_cores=E2=
=80=99 declared
> =E2=80=98static=E2=80=99 but never defined [-Wunused-function]
> >
> >
> ------------------------------------------------------------------------=
--------
> > defconfig+kselftest (riscv, gcc-8) =E2=80=94 PASS, 0 errors, 0 warning=
s, 0
> section mismatches
> >
> >
> ------------------------------------------------------------------------=
--------
> > defconfig+kselftest (arm64, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning=
, 0
> section mismatches
> >
> > Warnings:
> >     kernel/sched/fair.c:1524:20: warning: =E2=80=98test_idle_cores=E2=
=80=99 declared
> =E2=80=98static=E2=80=99 but never defined [-Wunused-function]
> >
> >
> ------------------------------------------------------------------------=
--------
> > dove_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction
> mismatches
> >
> >
> ------------------------------------------------------------------------=
--------
> > e55_defconfig (mips, gcc-8) =E2=80=94 FAIL, 1 error, 1 warning, 0 sect=
ion
> mismatches
> >
> > Errors:
> >     mm/memory.c:1523:41: error: implicit declaration of function
> =E2=80=98pte_index=E2=80=99; did you mean =E2=80=98page_index=E2=80=99?
> [-Werror=3Dimplicit-function-declaration]
> >
> > Warnings:
> >     cc1: some warnings being treated as errors
> >
> >
> ------------------------------------------------------------------------=
--------
> > ebsa110_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section
> mismatches
> >
> >
> ------------------------------------------------------------------------=
--------
> > efm32_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection
> mismatches
> >
> >
> ------------------------------------------------------------------------=
--------
> > em_x270_defconfig (arm, gcc-8) =E2=80=94 FAIL, 1 error, 2 warnings, 0 =
section
> mismatches
> >
> > Errors:
> >     ERROR: "snd_ac97_reset" [sound/soc/codecs/snd-soc-wm9712.ko]
> undefined!
> >
> > Warnings:
> >     WARNING: unmet direct dependencies detected for SND_SOC_WM9712
> >     WARNING: unmet direct dependencies detected for SND_SOC_WM9712
> >
> >
> ------------------------------------------------------------------------=
--------
> > ep93xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section
> mismatches
> >
> >
> ------------------------------------------------------------------------=
--------
> > eseries_pxa_defconfig (arm, gcc-8) =E2=80=94 FAIL, 14 errors, 12 warni=
ngs, 0
> section mismatches
> >
> > Errors:
> >     sound/soc/codecs/wm9712.c:80:10: error: implicit declaration of
> function =E2=80=98regmap_ac97_default_volatile=E2=80=99
> [-Werror=3Dimplicit-function-declaration]
> >     sound/soc/codecs/wm9712.c:84:21: error: variable
> =E2=80=98wm9712_regmap_config=E2=80=99 has initializer but incomplete ty=
pe
> >     sound/soc/codecs/wm9712.c:85:3: error: =E2=80=98const struct regma=
p_config=E2=80=99
> has no member named =E2=80=98reg_bits=E2=80=99
> >     sound/soc/codecs/wm9712.c:86:3: error: =E2=80=98const struct regma=
p_config=E2=80=99
> has no member named =E2=80=98reg_stride=E2=80=99
> >     sound/soc/codecs/wm9712.c:87:3: error: =E2=80=98const struct regma=
p_config=E2=80=99
> has no member named =E2=80=98val_bits=E2=80=99
> >     sound/soc/codecs/wm9712.c:88:3: error: =E2=80=98const struct regma=
p_config=E2=80=99
> has no member named =E2=80=98max_register=E2=80=99
> >     sound/soc/codecs/wm9712.c:89:3: error: =E2=80=98const struct regma=
p_config=E2=80=99
> has no member named =E2=80=98cache_type=E2=80=99
> >     sound/soc/codecs/wm9712.c:91:3: error: =E2=80=98const struct regma=
p_config=E2=80=99
> has no member named =E2=80=98volatile_reg=E2=80=99
> >     sound/soc/codecs/wm9712.c:93:3: error: =E2=80=98const struct regma=
p_config=E2=80=99
> has no member named =E2=80=98reg_defaults=E2=80=99
> >     sound/soc/codecs/wm9712.c:94:3: error: =E2=80=98const struct regma=
p_config=E2=80=99
> has no member named =E2=80=98num_reg_defaults=E2=80=99
> >     sound/soc/codecs/wm9712.c:653:12: error: implicit declaration of
> function =E2=80=98regmap_init_ac97=E2=80=99; did you mean =E2=80=98memma=
p_init_zone=E2=80=99?
> [-Werror=3Dimplicit-function-declaration]
> >     sound/soc/codecs/wm9712.c:662:2: error: implicit declaration of
> function =E2=80=98snd_soc_component_init_regmap=E2=80=99; did you mean
> =E2=80=98snd_soc_component_trigger=E2=80=99? [-Werror=3Dimplicit-functio=
n-declaration]
> >     sound/soc/codecs/wm9712.c:675:3: error: implicit declaration of
> function =E2=80=98snd_soc_component_exit_regmap=E2=80=99; did you mean
> =E2=80=98snd_soc_component_trigger=E2=80=99? [-Werror=3Dimplicit-functio=
n-declaration]
> >     sound/soc/codecs/wm9712.c:84:35: error: storage size of
> =E2=80=98wm9712_regmap_config=E2=80=99 isn=E2=80=99t known
> >
> > Warnings:
> >     WARNING: unmet direct dependencies detected for SND_SOC_WM9712
> >     WARNING: unmet direct dependencies detected for SND_SOC_WM9712
> >     sound/soc/codecs/wm9712.c:85:14: warning: excess elements in struc=
t
> initializer
> >     sound/soc/codecs/wm9712.c:86:16: warning: excess elements in struc=
t
> initializer
> >     sound/soc/codecs/wm9712.c:87:14: warning: excess elements in struc=
t
> initializer
> >     sound/soc/codecs/wm9712.c:88:18: warning: excess elements in struc=
t
> initializer
> >     sound/soc/codecs/wm9712.c:89:16: warning: excess elements in struc=
t
> initializer
> >     sound/soc/codecs/wm9712.c:91:18: warning: excess elements in struc=
t
> initializer
> >     sound/soc/codecs/wm9712.c:93:18: warning: excess elements in struc=
t
> initializer
> >     include/linux/kernel.h:47:25: warning: excess elements in struct
> initializer
> >     sound/soc/codecs/wm9712.c:653:10: warning: assignment to =E2=80=98=
struct
> regmap *=E2=80=99 from =E2=80=98int=E2=80=99 makes pointer from integer =
without a cast
> [-Wint-conversion]
> >     cc1: some warnings being treated as errors
> >
> >
> ------------------------------------------------------------------------=
--------
> > exynos_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section
> mismatches
> >
> >
> ------------------------------------------------------------------------=
--------
> > ezx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion
> mismatches
> >
> >
> ------------------------------------------------------------------------=
--------
> > footbridge_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings=
, 0
> section mismatches
> >
> >
> ------------------------------------------------------------------------=
--------
> > fuloong2e_defconfig (mips, gcc-8) =E2=80=94 FAIL, 1 error, 1 warning, =
0 section
> mismatches
> >
> > Errors:
> >     mm/memory.c:1523:41: error: implicit declaration of function
> =E2=80=98pte_index=E2=80=99; did you mean =E2=80=98page_index=E2=80=99?
> [-Werror=3Dimplicit-function-declaration]
> >
> > Warnings:
> >     cc1: some warnings being treated as errors
> >
> >
> ------------------------------------------------------------------------=
--------
> > gcw0_defconfig (mips, gcc-8) =E2=80=94 FAIL, 1 error, 1 warning, 0 sec=
tion
> mismatches
> >
> > Errors:
> >     mm/memory.c:1523:41: error: implicit declaration of function
> =E2=80=98pte_index=E2=80=99; did you mean =E2=80=98page_index=E2=80=99?
> [-Werror=3Dimplicit-function-declaration]
> >
> > Warnings:
> >     cc1: some warnings being treated as errors
> >
> >
> ------------------------------------------------------------------------=
--------
> > gemini_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section
> mismatches
> >
> >
> ------------------------------------------------------------------------=
--------
> > gpr_defconfig (mips, gcc-8) =E2=80=94 FAIL, 1 error, 1 warning, 0 sect=
ion
> mismatches
> >
> > Errors:
> >     mm/memory.c:1523:41: error: implicit declaration of function
> =E2=80=98pte_index=E2=80=99; did you mean =E2=80=98page_index=E2=80=99?
> [-Werror=3Dimplicit-function-declaration]
> >
> > Warnings:
> >     cc1: some warnings being treated as errors
> >
> >
> ------------------------------------------------------------------------=
--------
> > h3600_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection
> mismatches
> >
> >
> ------------------------------------------------------------------------=
--------
> > h5000_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection
> mismatches
> >
> >
> ------------------------------------------------------------------------=
--------
> > hackkit_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section
> mismatches
> >
> >
> ------------------------------------------------------------------------=
--------
> > haps_hs_defconfig (arc, gcc-8) =E2=80=94 FAIL, 1 error, 1 warning, 0 s=
ection
> mismatches
> >
> > Errors:
> >     mm/memory.c:1523:41: error: implicit declaration of function
> =E2=80=98pte_index=E2=80=99; did you mean =E2=80=98page_index=E2=80=99?
> [-Werror=3Dimplicit-function-declaration]
> >
> > Warnings:
> >     cc1: some warnings being treated as errors
> >
> >
> ------------------------------------------------------------------------=
--------
> > haps_hs_smp_defconfig (arc, gcc-8) =E2=80=94 FAIL, 1 error, 1 warning,=
 0 section
> mismatches
> >
> > Errors:
> >     mm/memory.c:1523:41: error: implicit declaration of function
> =E2=80=98pte_index=E2=80=99; did you mean =E2=80=98page_index=E2=80=99?
> [-Werror=3Dimplicit-function-declaration]
> >
> > Warnings:
> >     cc1: some warnings being treated as errors
> >
> >
> ------------------------------------------------------------------------=
--------
> > haps_hs_smp_defconfig+kselftest (arc, gcc-8) =E2=80=94 FAIL, 1 error, =
1 warning,
> 0 section mismatches
> >
> > Errors:
> >     mm/memory.c:1523:41: error: implicit declaration of function
> =E2=80=98pte_index=E2=80=99; did you mean =E2=80=98page_index=E2=80=99?
> [-Werror=3Dimplicit-function-declaration]
> >
> > Warnings:
> >     cc1: some warnings being treated as errors
> >
> >
> ------------------------------------------------------------------------=
--------
> > hisi_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction
> mismatches
> >
> >
> ------------------------------------------------------------------------=
--------
> > hsdk_defconfig (arc, gcc-8) =E2=80=94 FAIL, 1 error, 1 warning, 0 sect=
ion
> mismatches
> >
> > Errors:
> >     mm/memory.c:1523:41: error: implicit declaration of function
> =E2=80=98pte_index=E2=80=99; did you mean =E2=80=98page_index=E2=80=99?
> [-Werror=3Dimplicit-function-declaration]
> >
> > Warnings:
> >     cc1: some warnings being treated as errors
> >
> >
> ------------------------------------------------------------------------=
--------
> > i386_defconfig (i386, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection
> mismatches
> >
> >
> ------------------------------------------------------------------------=
--------
> > i386_defconfig+kselftest (i386, gcc-8) =E2=80=94 PASS, 0 errors, 0 war=
nings, 0
> section mismatches
> >
> >
> ------------------------------------------------------------------------=
--------
> > imote2_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section
> mismatches
> >
> >
> ------------------------------------------------------------------------=
--------
> > imx_v4_v5_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings,=
 0 section
> mismatches
> >
> >
> ------------------------------------------------------------------------=
--------
> > imx_v6_v7_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings,=
 0 section
> mismatches
> >
> >
> ------------------------------------------------------------------------=
--------
> > integrator_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings=
, 0
> section mismatches
> >
> >
> ------------------------------------------------------------------------=
--------
> > iop32x_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section
> mismatches
> >
> >
> ------------------------------------------------------------------------=
--------
> > ip22_defconfig (mips, gcc-8) =E2=80=94 FAIL, 1 error, 1 warning, 0 sec=
tion
> mismatches
> >
> > Errors:
> >     mm/memory.c:1523:41: error: implicit declaration of function
> =E2=80=98pte_index=E2=80=99; did you mean =E2=80=98page_index=E2=80=99?
> [-Werror=3Dimplicit-function-declaration]
> >
> > Warnings:
> >     cc1: some warnings being treated as errors
> >
> >
> ------------------------------------------------------------------------=
--------
> > ip27_defconfig (mips, gcc-8) =E2=80=94 FAIL, 3 errors, 2 warnings, 0 s=
ection
> mismatches
> >
> > Errors:
> >     arch/mips/include/asm/sn/addrs.h:58:44: error: left shift count >=
=3D
> width of type [-Werror=3Dshift-count-overflow]
> >     arch/mips/include/asm/sn/addrs.h:58:44: error: left shift count >=
=3D
> width of type [-Werror=3Dshift-count-overflow]
> >     mm/memory.c:1523:41: error: implicit declaration of function
> =E2=80=98pte_index=E2=80=99; did you mean =E2=80=98page_index=E2=80=99?
> [-Werror=3Dimplicit-function-declaration]
> >
> > Warnings:
> >     cc1: all warnings being treated as errors
> >     cc1: some warnings being treated as errors
> >
> >
> ------------------------------------------------------------------------=
--------
> > ip28_defconfig (mips, gcc-8) =E2=80=94 FAIL, 1 error, 1 warning, 0 sec=
tion
> mismatches
> >
> > Errors:
> >     mm/memory.c:1523:41: error: implicit declaration of function
> =E2=80=98pte_index=E2=80=99; did you mean =E2=80=98page_index=E2=80=99?
> [-Werror=3Dimplicit-function-declaration]
> >
> > Warnings:
> >     cc1: some warnings being treated as errors
> >
> >
> ------------------------------------------------------------------------=
--------
> > ip32_defconfig (mips, gcc-8) =E2=80=94 FAIL, 1 error, 1 warning, 0 sec=
tion
> mismatches
> >
> > Errors:
> >     mm/memory.c:1523:41: error: implicit declaration of function
> =E2=80=98pte_index=E2=80=99; did you mean =E2=80=98page_index=E2=80=99?
> [-Werror=3Dimplicit-function-declaration]
> >
> > Warnings:
> >     cc1: some warnings being treated as errors
> >
> >
> ------------------------------------------------------------------------=
--------
> > ixp4xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section
> mismatches
> >
> >
> ------------------------------------------------------------------------=
--------
> > jazz_defconfig (mips, gcc-8) =E2=80=94 FAIL, 1 error, 1 warning, 0 sec=
tion
> mismatches
> >
> > Errors:
> >     mm/memory.c:1523:41: error: implicit declaration of function
> =E2=80=98pte_index=E2=80=99; did you mean =E2=80=98page_index=E2=80=99?
> [-Werror=3Dimplicit-function-declaration]
> >
> > Warnings:
> >     cc1: some warnings being treated as errors
> >
> >
> ------------------------------------------------------------------------=
--------
> > jmr3927_defconfig (mips, gcc-8) =E2=80=94 FAIL, 1 error, 1 warning, 0 =
section
> mismatches
> >
> > Errors:
> >     mm/memory.c:1523:41: error: implicit declaration of function
> =E2=80=98pte_index=E2=80=99; did you mean =E2=80=98page_index=E2=80=99?
> [-Werror=3Dimplicit-function-declaration]
> >
> > Warnings:
> >     cc1: some warnings being treated as errors
> >
> >
> ------------------------------------------------------------------------=
--------
> > jornada720_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings=
, 0
> section mismatches
> >
> >
> ------------------------------------------------------------------------=
--------
> > keystone_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, =
0 section
> mismatches
> >
> >
> ------------------------------------------------------------------------=
--------
> > lart_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction
> mismatches
> >
> >
> ------------------------------------------------------------------------=
--------
> > lasat_defconfig (mips, gcc-8) =E2=80=94 FAIL, 1 error, 1 warning, 0 se=
ction
> mismatches
> >
> > Errors:
> >     mm/memory.c:1523:41: error: implicit declaration of function
> =E2=80=98pte_index=E2=80=99; did you mean =E2=80=98page_index=E2=80=99?
> [-Werror=3Dimplicit-function-declaration]
> >
> > Warnings:
> >     cc1: some warnings being treated as errors
> >
> >
> ------------------------------------------------------------------------=
--------
> > lemote2f_defconfig (mips, gcc-8) =E2=80=94 FAIL, 1 error, 1 warning, 0=
 section
> mismatches
> >
> > Errors:
> >     mm/memory.c:1523:41: error: implicit declaration of function
> =E2=80=98pte_index=E2=80=99; did you mean =E2=80=98page_index=E2=80=99?
> [-Werror=3Dimplicit-function-declaration]
> >
> > Warnings:
> >     cc1: some warnings being treated as errors
> >
> >
> ------------------------------------------------------------------------=
--------
> > loongson1b_defconfig (mips, gcc-8) =E2=80=94 FAIL, 1 error, 1 warning,=
 0 section
> mismatches
> >
> > Errors:
> >     mm/memory.c:1523:41: error: implicit declaration of function
> =E2=80=98pte_index=E2=80=99; did you mean =E2=80=98page_index=E2=80=99?
> [-Werror=3Dimplicit-function-declaration]
> >
> > Warnings:
> >     cc1: some warnings being treated as errors
> >
> >
> ------------------------------------------------------------------------=
--------
> > loongson1c_defconfig (mips, gcc-8) =E2=80=94 FAIL, 1 error, 1 warning,=
 0 section
> mismatches
> >
> > Errors:
> >     mm/memory.c:1523:41: error: implicit declaration of function
> =E2=80=98pte_index=E2=80=99; did you mean =E2=80=98page_index=E2=80=99?
> [-Werror=3Dimplicit-function-declaration]
> >
> > Warnings:
> >     cc1: some warnings being treated as errors
> >
> >
> ------------------------------------------------------------------------=
--------
> > loongson3_defconfig (mips, gcc-8) =E2=80=94 FAIL, 1 error, 1 warning, =
0 section
> mismatches
> >
> > Errors:
> >     mm/memory.c:1523:41: error: implicit declaration of function
> =E2=80=98pte_index=E2=80=99; did you mean =E2=80=98page_index=E2=80=99?
> [-Werror=3Dimplicit-function-declaration]
> >
> > Warnings:
> >     cc1: some warnings being treated as errors
> >
> >
> ------------------------------------------------------------------------=
--------
> > lpc18xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section
> mismatches
> >
> >
> ------------------------------------------------------------------------=
--------
> > lpc32xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section
> mismatches
> >
> >
> ------------------------------------------------------------------------=
--------
> > lpd270_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section
> mismatches
> >
> >
> ------------------------------------------------------------------------=
--------
> > lubbock_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section
> mismatches
> >
> >
> ------------------------------------------------------------------------=
--------
> > magician_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, =
0 section
> mismatches
> >
> >
> ------------------------------------------------------------------------=
--------
> > mainstone_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings,=
 0 section
> mismatches
> >
> >
> ------------------------------------------------------------------------=
--------
> > malta_defconfig (mips, gcc-8) =E2=80=94 FAIL, 1 error, 1 warning, 0 se=
ction
> mismatches
> >
> > Errors:
> >     mm/memory.c:1523:41: error: implicit declaration of function
> =E2=80=98pte_index=E2=80=99; did you mean =E2=80=98page_index=E2=80=99?
> [-Werror=3Dimplicit-function-declaration]
> >
> > Warnings:
> >     cc1: some warnings being treated as errors
> >
> >
> ------------------------------------------------------------------------=
--------
> > malta_kvm_defconfig (mips, gcc-8) =E2=80=94 FAIL, 1 error, 1 warning, =
0 section
> mismatches
> >
> > Errors:
> >     mm/memory.c:1523:41: error: implicit declaration of function
> =E2=80=98pte_index=E2=80=99; did you mean =E2=80=98page_index=E2=80=99?
> [-Werror=3Dimplicit-function-declaration]
> >
> > Warnings:
> >     cc1: some warnings being treated as errors
> >
> >
> ------------------------------------------------------------------------=
--------
> > malta_kvm_guest_defconfig (mips, gcc-8) =E2=80=94 FAIL, 1 error, 1 war=
ning, 0
> section mismatches
> >
> > Errors:
> >     mm/memory.c:1523:41: error: implicit declaration of function
> =E2=80=98pte_index=E2=80=99; did you mean =E2=80=98page_index=E2=80=99?
> [-Werror=3Dimplicit-function-declaration]
> >
> > Warnings:
> >     cc1: some warnings being treated as errors
> >
> >
> ------------------------------------------------------------------------=
--------
> > malta_qemu_32r6_defconfig (mips, gcc-8) =E2=80=94 FAIL, 1 error, 1 war=
ning, 0
> section mismatches
> >
> > Errors:
> >     mm/memory.c:1523:41: error: implicit declaration of function
> =E2=80=98pte_index=E2=80=99; did you mean =E2=80=98page_index=E2=80=99?
> [-Werror=3Dimplicit-function-declaration]
> >
> > Warnings:
> >     cc1: some warnings being treated as errors
> >
> >
> ------------------------------------------------------------------------=
--------
> > maltaaprp_defconfig (mips, gcc-8) =E2=80=94 FAIL, 1 error, 1 warning, =
0 section
> mismatches
> >
> > Errors:
> >     mm/memory.c:1523:41: error: implicit declaration of function
> =E2=80=98pte_index=E2=80=99; did you mean =E2=80=98page_index=E2=80=99?
> [-Werror=3Dimplicit-function-declaration]
> >
> > Warnings:
> >     cc1: some warnings being treated as errors
> >
> >
> ------------------------------------------------------------------------=
--------
> > maltasmvp_defconfig (mips, gcc-8) =E2=80=94 FAIL, 1 error, 1 warning, =
0 section
> mismatches
> >
> > Errors:
> >     mm/memory.c:1523:41: error: implicit declaration of function
> =E2=80=98pte_index=E2=80=99; did you mean =E2=80=98page_index=E2=80=99?
> [-Werror=3Dimplicit-function-declaration]
> >
> > Warnings:
> >     cc1: some warnings being treated as errors
> >
> >
> ------------------------------------------------------------------------=
--------
> > maltasmvp_eva_defconfig (mips, gcc-8) =E2=80=94 FAIL, 1 error, 1 warni=
ng, 0
> section mismatches
> >
> > Errors:
> >     mm/memory.c:1523:41: error: implicit declaration of function
> =E2=80=98pte_index=E2=80=99; did you mean =E2=80=98page_index=E2=80=99?
> [-Werror=3Dimplicit-function-declaration]
> >
> > Warnings:
> >     cc1: some warnings being treated as errors
> >
> >
> ------------------------------------------------------------------------=
--------
> > maltaup_defconfig (mips, gcc-8) =E2=80=94 FAIL, 1 error, 1 warning, 0 =
section
> mismatches
> >
> > Errors:
> >     mm/memory.c:1523:41: error: implicit declaration of function
> =E2=80=98pte_index=E2=80=99; did you mean =E2=80=98page_index=E2=80=99?
> [-Werror=3Dimplicit-function-declaration]
> >
> > Warnings:
> >     cc1: some warnings being treated as errors
> >
> >
> ------------------------------------------------------------------------=
--------
> > maltaup_xpa_defconfig (mips, gcc-8) =E2=80=94 FAIL, 1 error, 1 warning=
, 0
> section mismatches
> >
> > Errors:
> >     mm/memory.c:1523:41: error: implicit declaration of function
> =E2=80=98pte_index=E2=80=99; did you mean =E2=80=98page_index=E2=80=99?
> [-Werror=3Dimplicit-function-declaration]
> >
> > Warnings:
> >     cc1: some warnings being treated as errors
> >
> >
> ------------------------------------------------------------------------=
--------
> > markeins_defconfig (mips, gcc-8) =E2=80=94 FAIL, 1 error, 1 warning, 0=
 section
> mismatches
> >
> > Errors:
> >     mm/memory.c:1523:41: error: implicit declaration of function
> =E2=80=98pte_index=E2=80=99; did you mean =E2=80=98page_index=E2=80=99?
> [-Werror=3Dimplicit-function-declaration]
> >
> > Warnings:
> >     cc1: some warnings being treated as errors
> >
> >
> ------------------------------------------------------------------------=
--------
> > milbeaut_m10v_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warni=
ngs, 0
> section mismatches
> >
> >
> ------------------------------------------------------------------------=
--------
> > mini2440_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, =
0 section
> mismatches
> >
> >
> ------------------------------------------------------------------------=
--------
> > mips_paravirt_defconfig (mips, gcc-8) =E2=80=94 FAIL, 1 error, 1 warni=
ng, 0
> section mismatches
> >
> > Errors:
> >     mm/memory.c:1523:41: error: implicit declaration of function
> =E2=80=98pte_index=E2=80=99; did you mean =E2=80=98page_index=E2=80=99?
> [-Werror=3Dimplicit-function-declaration]
> >
> > Warnings:
> >     cc1: some warnings being treated as errors
> >
> >
> ------------------------------------------------------------------------=
--------
> > mmp2_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction
> mismatches
> >
> >
> ------------------------------------------------------------------------=
--------
> > moxart_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section
> mismatches
> >
> >
> ------------------------------------------------------------------------=
--------
> > mpc30x_defconfig (mips, gcc-8) =E2=80=94 FAIL, 1 error, 1 warning, 0 s=
ection
> mismatches
> >
> > Errors:
> >     mm/memory.c:1523:41: error: implicit declaration of function
> =E2=80=98pte_index=E2=80=99; did you mean =E2=80=98page_index=E2=80=99?
> [-Werror=3Dimplicit-function-declaration]
> >
> > Warnings:
> >     cc1: some warnings being treated as errors
> >
> >
> ------------------------------------------------------------------------=
--------
> > mps2_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction
> mismatches
> >
> >
> ------------------------------------------------------------------------=
--------
> > msp71xx_defconfig (mips, gcc-8) =E2=80=94 FAIL, 1 error, 1 warning, 0 =
section
> mismatches
> >
> > Errors:
> >     mm/memory.c:1523:41: error: implicit declaration of function
> =E2=80=98pte_index=E2=80=99; did you mean =E2=80=98page_index=E2=80=99?
> [-Werror=3Dimplicit-function-declaration]
> >
> > Warnings:
> >     cc1: some warnings being treated as errors
> >
> >
> ------------------------------------------------------------------------=
--------
> > mtx1_defconfig (mips, gcc-8) =E2=80=94 FAIL, 1 error, 1 warning, 0 sec=
tion
> mismatches
> >
> > Errors:
> >     mm/memory.c:1523:41: error: implicit declaration of function
> =E2=80=98pte_index=E2=80=99; did you mean =E2=80=98page_index=E2=80=99?
> [-Werror=3Dimplicit-function-declaration]
> >
> > Warnings:
> >     cc1: some warnings being treated as errors
> >
> >
> ------------------------------------------------------------------------=
--------
> > multi_v4t_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings,=
 0 section
> mismatches
> >
> >
> ------------------------------------------------------------------------=
--------
> > multi_v5_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, =
0 section
> mismatches
> >
> > Warnings:
> >     arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts:435.11-439.4:
> Warning (i2c_bus_reg): /ahb/apb/bus@1e78a000/i2c-bus@140/ipmb0@10: I2C
> bus unit address format error, expected "40000010"
> >     arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts:437.3-30:
> Warning (i2c_bus_reg): /ahb/apb/bus@1e78a000/i2c-bus@140/ipmb0@10:reg:
> I2C address must be less than 10-bits, got "0x40000010"
> >     arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts:521.11-525.4:
> Warning (i2c_bus_reg): /ahb/apb/bus@1e78a000/i2c-bus@380/ipmb0@10: I2C
> bus unit address format error, expected "40000010"
> >     arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts:523.3-30:
> Warning (i2c_bus_reg): /ahb/apb/bus@1e78a000/i2c-bus@380/ipmb0@10:reg:
> I2C address must be less than 10-bits, got "0x40000010"
> >
> >
> ------------------------------------------------------------------------=
--------
> > multi_v7_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, =
0 section
> mismatches
> >
> > Warnings:
> >     arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts:435.11-439.4:
> Warning (i2c_bus_reg): /ahb/apb/bus@1e78a000/i2c-bus@140/ipmb0@10: I2C
> bus unit address format error, expected "40000010"
> >     arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts:437.3-30:
> Warning (i2c_bus_reg): /ahb/apb/bus@1e78a000/i2c-bus@140/ipmb0@10:reg:
> I2C address must be less than 10-bits, got "0x40000010"
> >     arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts:521.11-525.4:
> Warning (i2c_bus_reg): /ahb/apb/bus@1e78a000/i2c-bus@380/ipmb0@10: I2C
> bus unit address format error, expected "40000010"
> >     arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts:523.3-30:
> Warning (i2c_bus_reg): /ahb/apb/bus@1e78a000/i2c-bus@380/ipmb0@10:reg:
> I2C address must be less than 10-bits, got "0x40000010"
> >
> >
> ------------------------------------------------------------------------=
--------
> > multi_v7_defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy (arm, gcc-8) =E2=80=94 PA=
SS, 0
> errors, 4 warnings, 0 section mismatches
> >
> > Warnings:
> >     arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts:435.11-439.4:
> Warning (i2c_bus_reg): /ahb/apb/bus@1e78a000/i2c-bus@140/ipmb0@10: I2C
> bus unit address format error, expected "40000010"
> >     arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts:437.3-30:
> Warning (i2c_bus_reg): /ahb/apb/bus@1e78a000/i2c-bus@140/ipmb0@10:reg:
> I2C address must be less than 10-bits, got "0x40000010"
> >     arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts:521.11-525.4:
> Warning (i2c_bus_reg): /ahb/apb/bus@1e78a000/i2c-bus@380/ipmb0@10: I2C
> bus unit address format error, expected "40000010"
> >     arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts:523.3-30:
> Warning (i2c_bus_reg): /ahb/apb/bus@1e78a000/i2c-bus@380/ipmb0@10:reg:
> I2C address must be less than 10-bits, got "0x40000010"
> >
> >
> ------------------------------------------------------------------------=
--------
> > multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy (arm, gcc-8) =E2=
=
=80=94 PASS, 0
> errors, 4 warnings, 0 section mismatches
> >
> > Warnings:
> >     arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts:435.11-439.4:
> Warning (i2c_bus_reg): /ahb/apb/bus@1e78a000/i2c-bus@140/ipmb0@10: I2C
> bus unit address format error, expected "40000010"
> >     arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts:437.3-30:
> Warning (i2c_bus_reg): /ahb/apb/bus@1e78a000/i2c-bus@140/ipmb0@10:reg:
> I2C address must be less than 10-bits, got "0x40000010"
> >     arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts:521.11-525.4:
> Warning (i2c_bus_reg): /ahb/apb/bus@1e78a000/i2c-bus@380/ipmb0@10: I2C
> bus unit address format error, expected "40000010"
> >     arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts:523.3-30:
> Warning (i2c_bus_reg): /ahb/apb/bus@1e78a000/i2c-bus@380/ipmb0@10:reg:
> I2C address must be less than 10-bits, got "0x40000010"
> >
> >
> ------------------------------------------------------------------------=
--------
> > multi_v7_defconfig+CONFIG_SMP=3Dn (arm, gcc-8) =E2=80=94 PASS, 0 error=
s, 4
> warnings, 0 section mismatches
> >
> > Warnings:
> >     arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts:435.11-439.4:
> Warning (i2c_bus_reg): /ahb/apb/bus@1e78a000/i2c-bus@140/ipmb0@10: I2C
> bus unit address format error, expected "40000010"
> >     arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts:437.3-30:
> Warning (i2c_bus_reg): /ahb/apb/bus@1e78a000/i2c-bus@140/ipmb0@10:reg:
> I2C address must be less than 10-bits, got "0x40000010"
> >     arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts:521.11-525.4:
> Warning (i2c_bus_reg): /ahb/apb/bus@1e78a000/i2c-bus@380/ipmb0@10: I2C
> bus unit address format error, expected "40000010"
> >     arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts:523.3-30:
> Warning (i2c_bus_reg): /ahb/apb/bus@1e78a000/i2c-bus@380/ipmb0@10:reg:
> I2C address must be less than 10-bits, got "0x40000010"
> >
> >
> ------------------------------------------------------------------------=
--------
> > multi_v7_defconfig+kselftest (arm, gcc-8) =E2=80=94 PASS, 0 errors, 5 =
warnings,
> 0 section mismatches
> >
> > Warnings:
> >     net/sched/cls_flower.c:331:1: warning: the frame size of 1032 byte=
s
> is larger than 1024 bytes [-Wframe-larger-than=3D]
> >     arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts:435.11-439.4:
> Warning (i2c_bus_reg): /ahb/apb/bus@1e78a000/i2c-bus@140/ipmb0@10: I2C
> bus unit address format error, expected "40000010"
> >     arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts:437.3-30:
> Warning (i2c_bus_reg): /ahb/apb/bus@1e78a000/i2c-bus@140/ipmb0@10:reg:
> I2C address must be less than 10-bits, got "0x40000010"
> >     arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts:521.11-525.4:
> Warning (i2c_bus_reg): /ahb/apb/bus@1e78a000/i2c-bus@380/ipmb0@10: I2C
> bus unit address format error, expected "40000010"
> >     arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts:523.3-30:
> Warning (i2c_bus_reg): /ahb/apb/bus@1e78a000/i2c-bus@380/ipmb0@10:reg:
> I2C address must be less than 10-bits, got "0x40000010"
> >
> >
> ------------------------------------------------------------------------=
--------
> > mv78xx0_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section
> mismatches
> >
> >
> ------------------------------------------------------------------------=
--------
> > mvebu_v5_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, =
0 section
> mismatches
> >
> >
> ------------------------------------------------------------------------=
--------
> > mvebu_v7_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, =
0 section
> mismatches
> >
> >
> ------------------------------------------------------------------------=
--------
> > mxs_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion
> mismatches
> >
> >
> ------------------------------------------------------------------------=
--------
> > neponset_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, =
0 section
> mismatches
> >
> >
> ------------------------------------------------------------------------=
--------
> > netwinder_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings,=
 0 section
> mismatches
> >
> >
> ------------------------------------------------------------------------=
--------
> > nhk8815_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section
> mismatches
> >
> >
> ------------------------------------------------------------------------=
--------
> > nlm_xlp_defconfig (mips, gcc-8) =E2=80=94 FAIL, 1 error, 1 warning, 0 =
section
> mismatches
> >
> > Errors:
> >     mm/memory.c:1523:41: error: implicit declaration of function
> =E2=80=98pte_index=E2=80=99; did you mean =E2=80=98page_index=E2=80=99?
> [-Werror=3Dimplicit-function-declaration]
> >
> > Warnings:
> >     cc1: some warnings being treated as errors
> >
> >
> ------------------------------------------------------------------------=
--------
> > nlm_xlr_defconfig (mips, gcc-8) =E2=80=94 FAIL, 1 error, 1 warning, 0 =
section
> mismatches
> >
> > Errors:
> >     mm/memory.c:1523:41: error: implicit declaration of function
> =E2=80=98pte_index=E2=80=99; did you mean =E2=80=98page_index=E2=80=99?
> [-Werror=3Dimplicit-function-declaration]
> >
> > Warnings:
> >     cc1: some warnings being treated as errors
> >
> >
> ------------------------------------------------------------------------=
--------
> > nommu_virt_defconfig (riscv, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnin=
gs, 0
> section mismatches
> >
> >
> ------------------------------------------------------------------------=
--------
> > nsimosci_hs_defconfig (arc, gcc-8) =E2=80=94 FAIL, 1 error, 1 warning,=
 0 section
> mismatches
> >
> > Errors:
> >     mm/memory.c:1523:41: error: implicit declaration of function
> =E2=80=98pte_index=E2=80=99; did you mean =E2=80=98page_index=E2=80=99?
> [-Werror=3Dimplicit-function-declaration]
> >
> > Warnings:
> >     cc1: some warnings being treated as errors
> >
> >
> ------------------------------------------------------------------------=
--------
> > nsimosci_hs_smp_defconfig (arc, gcc-8) =E2=80=94 FAIL, 1 error, 1 warn=
ing, 0
> section mismatches
> >
> > Errors:
> >     mm/memory.c:1523:41: error: implicit declaration of function
> =E2=80=98pte_index=E2=80=99; did you mean =E2=80=98page_index=E2=80=99?
> [-Werror=3Dimplicit-function-declaration]
> >
> > Warnings:
> >     cc1: some warnings being treated as errors
> >
> >
> ------------------------------------------------------------------------=
--------
> > omap1_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection
> mismatches
> >
> >
> ------------------------------------------------------------------------=
--------
> > omap2plus_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings,=
 0 section
> mismatches
> >
> >
> ------------------------------------------------------------------------=
--------
> > omega2p_defconfig (mips, gcc-8) =E2=80=94 FAIL, 1 error, 1 warning, 0 =
section
> mismatches
> >
> > Errors:
> >     mm/memory.c:1523:41: error: implicit declaration of function
> =E2=80=98pte_index=E2=80=99; did you mean =E2=80=98page_index=E2=80=99?
> [-Werror=3Dimplicit-function-declaration]
> >
> > Warnings:
> >     cc1: some warnings being treated as errors
> >
> >
> ------------------------------------------------------------------------=
--------
> > orion5x_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section
> mismatches
> >
> >
> ------------------------------------------------------------------------=
--------
> > oxnas_v6_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, =
0 section
> mismatches
> >
> >
> ------------------------------------------------------------------------=
--------
> > palmz72_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section
> mismatches
> >
> >
> ------------------------------------------------------------------------=
--------
> > pcm027_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section
> mismatches
> >
> >
> ------------------------------------------------------------------------=
--------
> > pic32mzda_defconfig (mips, gcc-8) =E2=80=94 FAIL, 1 error, 1 warning, =
0 section
> mismatches
> >
> > Errors:
> >     mm/memory.c:1523:41: error: implicit declaration of function
> =E2=80=98pte_index=E2=80=99; did you mean =E2=80=98page_index=E2=80=99?
> [-Werror=3Dimplicit-function-declaration]
> >
> > Warnings:
> >     cc1: some warnings being treated as errors
> >
> >
> ------------------------------------------------------------------------=
--------
> > pistachio_defconfig (mips, gcc-8) =E2=80=94 FAIL, 1 error, 1 warning, =
0 section
> mismatches
> >
> > Errors:
> >     mm/memory.c:1523:41: error: implicit declaration of function
> =E2=80=98pte_index=E2=80=99; did you mean =E2=80=98page_index=E2=80=99?
> [-Werror=3Dimplicit-function-declaration]
> >
> > Warnings:
> >     cc1: some warnings being treated as errors
> >
> >
> ------------------------------------------------------------------------=
--------
> > pleb_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction
> mismatches
> >
> >
> ------------------------------------------------------------------------=
--------
> > pnx8335_stb225_defconfig (mips, gcc-8) =E2=80=94 FAIL, 1 error, 1 warn=
ing, 0
> section mismatches
> >
> > Errors:
> >     mm/memory.c:1523:41: error: implicit declaration of function
> =E2=80=98pte_index=E2=80=99; did you mean =E2=80=98page_index=E2=80=99?
> [-Werror=3Dimplicit-function-declaration]
> >
> > Warnings:
> >     cc1: some warnings being treated as errors
> >
> >
> ------------------------------------------------------------------------=
--------
> > prima2_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section
> mismatches
> >
> >
> ------------------------------------------------------------------------=
--------
> > pxa168_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section
> mismatches
> >
> >
> ------------------------------------------------------------------------=
--------
> > pxa255-idp_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings=
, 0
> section mismatches
> >
> >
> ------------------------------------------------------------------------=
--------
> > pxa3xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section
> mismatches
> >
> >
> ------------------------------------------------------------------------=
--------
> > pxa910_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section
> mismatches
> >
> >
> ------------------------------------------------------------------------=
--------
> > pxa_defconfig (arm, gcc-8) =E2=80=94 FAIL, 3 errors, 6 warnings, 0 sec=
tion
> mismatches
> >
> > Errors:
> >     ERROR: "snd_ac97_reset" [sound/soc/codecs/snd-soc-wm9713.ko]
> undefined!
> >     ERROR: "snd_ac97_reset" [sound/soc/codecs/snd-soc-wm9712.ko]
> undefined!
> >     ERROR: "snd_ac97_reset" [sound/soc/codecs/snd-soc-wm9705.ko]
> undefined!
> >
> > Warnings:
> >     WARNING: unmet direct dependencies detected for SND_SOC_WM9705
> >     WARNING: unmet direct dependencies detected for SND_SOC_WM9712
> >     WARNING: unmet direct dependencies detected for SND_SOC_WM9713
> >     WARNING: unmet direct dependencies detected for SND_SOC_WM9705
> >     WARNING: unmet direct dependencies detected for SND_SOC_WM9712
> >     WARNING: unmet direct dependencies detected for SND_SOC_WM9713
> >
> >
> ------------------------------------------------------------------------=
--------
> > qcom_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction
> mismatches
> >
> >
> ------------------------------------------------------------------------=
--------
> > qi_lb60_defconfig (mips, gcc-8) =E2=80=94 FAIL, 1 error, 1 warning, 0 =
section
> mismatches
> >
> > Errors:
> >     mm/memory.c:1523:41: error: implicit declaration of function
> =E2=80=98pte_index=E2=80=99; did you mean =E2=80=98page_index=E2=80=99?
> [-Werror=3Dimplicit-function-declaration]
> >
> > Warnings:
> >     cc1: some warnings being treated as errors
> >
> >
> ------------------------------------------------------------------------=
--------
> > rb532_defconfig (mips, gcc-8) =E2=80=94 FAIL, 1 error, 1 warning, 0 se=
ction
> mismatches
> >
> > Errors:
> >     mm/memory.c:1523:41: error: implicit declaration of function
> =E2=80=98pte_index=E2=80=99; did you mean =E2=80=98page_index=E2=80=99?
> [-Werror=3Dimplicit-function-declaration]
> >
> > Warnings:
> >     cc1: some warnings being treated as errors
> >
> >
> ------------------------------------------------------------------------=
--------
> > rbtx49xx_defconfig (mips, gcc-8) =E2=80=94 FAIL, 1 error, 1 warning, 0=
 section
> mismatches
> >
> > Errors:
> >     mm/memory.c:1523:41: error: implicit declaration of function
> =E2=80=98pte_index=E2=80=99; did you mean =E2=80=98page_index=E2=80=99?
> [-Werror=3Dimplicit-function-declaration]
> >
> > Warnings:
> >     cc1: some warnings being treated as errors
> >
> >
> ------------------------------------------------------------------------=
--------
> > realview_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, =
0 section
> mismatches
> >
> >
> ------------------------------------------------------------------------=
--------
> > rm200_defconfig (mips, gcc-8) =E2=80=94 FAIL, 1 error, 1 warning, 0 se=
ction
> mismatches
> >
> > Errors:
> >     mm/memory.c:1523:41: error: implicit declaration of function
> =E2=80=98pte_index=E2=80=99; did you mean =E2=80=98page_index=E2=80=99?
> [-Werror=3Dimplicit-function-declaration]
> >
> > Warnings:
> >     cc1: some warnings being treated as errors
> >
> >
> ------------------------------------------------------------------------=
--------
> > rpc_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion
> mismatches
> >
> >
> ------------------------------------------------------------------------=
--------
> > rt305x_defconfig (mips, gcc-8) =E2=80=94 FAIL, 1 error, 1 warning, 0 s=
ection
> mismatches
> >
> > Errors:
> >     mm/memory.c:1523:41: error: implicit declaration of function
> =E2=80=98pte_index=E2=80=99; did you mean =E2=80=98page_index=E2=80=99?
> [-Werror=3Dimplicit-function-declaration]
> >
> > Warnings:
> >     cc1: some warnings being treated as errors
> >
> >
> ------------------------------------------------------------------------=
--------
> > rv32_defconfig (riscv, gcc-8) =E2=80=94 PASS, 0 errors, 6 warnings, 0 =
section
> mismatches
> >
> > Warnings:
> >     <stdin>:830:2: warning: #warning syscall fstat64 not implemented
> [-Wcpp]
> >     <stdin>:1127:2: warning: #warning syscall fstatat64 not implemente=
d
> [-Wcpp]
> >     <stdin>:1511:2: warning: #warning syscall clone3 not implemented
> [-Wcpp]
> >     <stdin>:830:2: warning: #warning syscall fstat64 not implemented
> [-Wcpp]
> >     <stdin>:1127:2: warning: #warning syscall fstatat64 not implemente=
d
> [-Wcpp]
> >     <stdin>:1511:2: warning: #warning syscall clone3 not implemented
> [-Wcpp]
> >
> >
> ------------------------------------------------------------------------=
--------
> > s3c2410_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section
> mismatches
> >
> >
> ------------------------------------------------------------------------=
--------
> > s3c6400_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section
> mismatches
> >
> >
> ------------------------------------------------------------------------=
--------
> > s5pv210_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section
> mismatches
> >
> >
> ------------------------------------------------------------------------=
--------
> > sama5_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection
> mismatches
> >
> >
> ------------------------------------------------------------------------=
--------
> > sb1250_swarm_defconfig (mips, gcc-8) =E2=80=94 FAIL, 1 error, 1 warnin=
g, 0
> section mismatches
> >
> > Errors:
> >     mm/memory.c:1523:41: error: implicit declaration of function
> =E2=80=98pte_index=E2=80=99; did you mean =E2=80=98page_index=E2=80=99?
> [-Werror=3Dimplicit-function-declaration]
> >
> > Warnings:
> >     cc1: some warnings being treated as errors
> >
> >
> ------------------------------------------------------------------------=
--------
> > shannon_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section
> mismatches
> >
> >
> ------------------------------------------------------------------------=
--------
> > shmobile_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, =
0 section
> mismatches
> >
> >
> ------------------------------------------------------------------------=
--------
> > simpad_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section
> mismatches
> >
> >
> ------------------------------------------------------------------------=
--------
> > socfpga_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section
> mismatches
> >
> >
> ------------------------------------------------------------------------=
--------
> > spear13xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings,=
 0 section
> mismatches
> >
> >
> ------------------------------------------------------------------------=
--------
> > spear3xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, =
0 section
> mismatches
> >
> >
> ------------------------------------------------------------------------=
--------
> > spear6xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, =
0 section
> mismatches
> >
> >
> ------------------------------------------------------------------------=
--------
> > spitz_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection
> mismatches
> >
> >
> ------------------------------------------------------------------------=
--------
> > stm32_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection
> mismatches
> >
> >
> ------------------------------------------------------------------------=
--------
> > sunxi_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection
> mismatches
> >
> >
> ------------------------------------------------------------------------=
--------
> > tango4_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section
> mismatches
> >
> >
> ------------------------------------------------------------------------=
--------
> > tb0219_defconfig (mips, gcc-8) =E2=80=94 FAIL, 1 error, 1 warning, 0 s=
ection
> mismatches
> >
> > Errors:
> >     mm/memory.c:1523:41: error: implicit declaration of function
> =E2=80=98pte_index=E2=80=99; did you mean =E2=80=98page_index=E2=80=99?
> [-Werror=3Dimplicit-function-declaration]
> >
> > Warnings:
> >     cc1: some warnings being treated as errors
> >
> >
> ------------------------------------------------------------------------=
--------
> > tb0226_defconfig (mips, gcc-8) =E2=80=94 FAIL, 1 error, 1 warning, 0 s=
ection
> mismatches
> >
> > Errors:
> >     mm/memory.c:1523:41: error: implicit declaration of function
> =E2=80=98pte_index=E2=80=99; did you mean =E2=80=98page_index=E2=80=99?
> [-Werror=3Dimplicit-function-declaration]
> >
> > Warnings:
> >     cc1: some warnings being treated as errors
> >
> >
> ------------------------------------------------------------------------=
--------
> > tb0287_defconfig (mips, gcc-8) =E2=80=94 FAIL, 1 error, 1 warning, 0 s=
ection
> mismatches
> >
> > Errors:
> >     mm/memory.c:1523:41: error: implicit declaration of function
> =E2=80=98pte_index=E2=80=99; did you mean =E2=80=98page_index=E2=80=99?
> [-Werror=3Dimplicit-function-declaration]
> >
> > Warnings:
> >     cc1: some warnings being treated as errors
> >
> >
> ------------------------------------------------------------------------=
--------
> > tct_hammer_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings=
, 0
> section mismatches
> >
> >
> ------------------------------------------------------------------------=
--------
> > tegra_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection
> mismatches
> >
> >
> ------------------------------------------------------------------------=
--------
> > tinyconfig (mips, gcc-8) =E2=80=94 FAIL, 1 error, 1 warning, 0 section=
 mismatches
> >
> > Errors:
> >     mm/memory.c:1523:41: error: implicit declaration of function
> =E2=80=98pte_index=E2=80=99; did you mean =E2=80=98page_index=E2=80=99?
> [-Werror=3Dimplicit-function-declaration]
> >
> > Warnings:
> >     cc1: some warnings being treated as errors
> >
> >
> ------------------------------------------------------------------------=
--------
> > tinyconfig (arm64, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion
> mismatches
> >
> >
> ------------------------------------------------------------------------=
--------
> > tinyconfig (i386, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on
> mismatches
> >
> >
> ------------------------------------------------------------------------=
--------
> > tinyconfig (riscv, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion
> mismatches
> >
> >
> ------------------------------------------------------------------------=
--------
> > tinyconfig (arc, gcc-8) =E2=80=94 FAIL, 1 error, 1 warning, 0 section =
mismatches
> >
> > Errors:
> >     mm/memory.c:1523:41: error: implicit declaration of function
> =E2=80=98pte_index=E2=80=99; did you mean =E2=80=98page_index=E2=80=99?
> [-Werror=3Dimplicit-function-declaration]
> >
> > Warnings:
> >     cc1: some warnings being treated as errors
> >
> >
> ------------------------------------------------------------------------=
--------
> > tinyconfig (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion
> mismatches
> >
> > Warnings:
> >     .config:1167:warning: override: UNWINDER_GUESS changes choice stat=
e
> >
> >
> ------------------------------------------------------------------------=
--------
> > tinyconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n
> mismatches
> >
> >
> ------------------------------------------------------------------------=
--------
> > trizeps4_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, =
0 section
> mismatches
> >
> >
> ------------------------------------------------------------------------=
--------
> > u300_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction
> mismatches
> >
> >
> ------------------------------------------------------------------------=
--------
> > u8500_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection
> mismatches
> >
> >
> ------------------------------------------------------------------------=
--------
> > vdk_hs38_defconfig (arc, gcc-8) =E2=80=94 FAIL, 1 error, 1 warning, 0 =
section
> mismatches
> >
> > Errors:
> >     mm/memory.c:1523:41: error: implicit declaration of function
> =E2=80=98pte_index=E2=80=99; did you mean =E2=80=98page_index=E2=80=99?
> [-Werror=3Dimplicit-function-declaration]
> >
> > Warnings:
> >     cc1: some warnings being treated as errors
> >
> >
> ------------------------------------------------------------------------=
--------
> > vdk_hs38_smp_defconfig (arc, gcc-8) =E2=80=94 FAIL, 1 error, 1 warning=
, 0
> section mismatches
> >
> > Errors:
> >     mm/memory.c:1523:41: error: implicit declaration of function
> =E2=80=98pte_index=E2=80=99; did you mean =E2=80=98page_index=E2=80=99?
> [-Werror=3Dimplicit-function-declaration]
> >
> > Warnings:
> >     cc1: some warnings being treated as errors
> >
> >
> ------------------------------------------------------------------------=
--------
> > versatile_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings,=
 0 section
> mismatches
> >
> >
> ------------------------------------------------------------------------=
--------
> > vexpress_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, =
0 section
> mismatches
> >
> >
> ------------------------------------------------------------------------=
--------
> > vf610m4_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section
> mismatches
> >
> >
> ------------------------------------------------------------------------=
--------
> > viper_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection
> mismatches
> >
> >
> ------------------------------------------------------------------------=
--------
> > vocore2_defconfig (mips, gcc-8) =E2=80=94 FAIL, 1 error, 1 warning, 0 =
section
> mismatches
> >
> > Errors:
> >     mm/memory.c:1523:41: error: implicit declaration of function
> =E2=80=98pte_index=E2=80=99; did you mean =E2=80=98page_index=E2=80=99?
> [-Werror=3Dimplicit-function-declaration]
> >
> > Warnings:
> >     cc1: some warnings being treated as errors
> >
> >
> ------------------------------------------------------------------------=
--------
> > vt8500_v6_v7_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnin=
gs, 0
> section mismatches
> >
> >
> ------------------------------------------------------------------------=
--------
> > workpad_defconfig (mips, gcc-8) =E2=80=94 FAIL, 1 error, 1 warning, 0 =
section
> mismatches
> >
> > Errors:
> >     mm/memory.c:1523:41: error: implicit declaration of function
> =E2=80=98pte_index=E2=80=99; did you mean =E2=80=98page_index=E2=80=99?
> [-Werror=3Dimplicit-function-declaration]
> >
> > Warnings:
> >     cc1: some warnings being treated as errors
> >
> >
> ------------------------------------------------------------------------=
--------
> > x86_64_defconfig (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings,=
 0 section
> mismatches
> >
> >
> ------------------------------------------------------------------------=
--------
> > x86_64_defconfig+kselftest (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 0=
 warnings,
> 0 section mismatches
> >
> >
> ------------------------------------------------------------------------=
--------
> > x86_64_defconfig+kvm_guest (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 0=
 warnings,
> 0 section mismatches
> >
> >
> ------------------------------------------------------------------------=
--------
> > xcep_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction
> mismatches
> >
> >
> ------------------------------------------------------------------------=
--------
> > xway_defconfig (mips, gcc-8) =E2=80=94 FAIL, 1 error, 1 warning, 0 sec=
tion
> mismatches
> >
> > Errors:
> >     mm/memory.c:1523:41: error: implicit declaration of function
> =E2=80=98pte_index=E2=80=99; did you mean =E2=80=98page_index=E2=80=99?
> [-Werror=3Dimplicit-function-declaration]
> >
> > Warnings:
> >     cc1: some warnings being treated as errors
> >
> >
> ------------------------------------------------------------------------=
--------
> > zeus_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction
> mismatches
> >
> >
> ------------------------------------------------------------------------=
--------
> > zx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion
> mismatches
> >
> > ---
> > For more info write to <info@kernelci.org>
> >
> > --
> > You received this message because you are subscribed to the Google
> Groups "Clang Built Linux" group.
> > To unsubscribe from this group and stop receiving emails from it, send
> an email to clang-built-linux+unsubscribe@googlegroups.com.
> > To view this discussion on the web visit
> https://groups.google.com/d/msgid/clang-built-linux/5e57d0a2.1c69fb81.b4=
4cf.2a50%40mx.google.com
> .
>
>
>
> --
> Thanks,
> ~Nick Desaulniers
>
>=20
>
>

--0000000000000f4d3e059f94b10b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Thu, Feb 27, 2020 at 7:21 PM Nick Desa=
ulniers via Groups.Io &lt;ndesaulniers=3D<a href=3D"mailto:google.com@group=
s.io">google.com@groups.io</a>&gt; wrote:<br></div><div class=3D"gmail_quot=
e"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex">+ KernelCI<br>
<br>
So it looks like this is the latest report we received. Any thoughts<br>
on why clang-8 is being used in the report after<br>
<a href=3D"https://github.com/kernelci/kernelci-core/pull/325" rel=3D"nore=
ferrer" target=3D"_blank">https://github.com/kernelci/kernelci-core/pull/32=
5</a> was merged 2 days<br>
ago?=C2=A0 Is the deployment not continuous (ie. still has to be pushed to=
<br>
production)?<br></blockquote><div><br></div>That&#39;s right, production i=
s not updated continuously.=C2=A0 Some<br>changes have to go hand-in-hand w=
ith the kernelci-backend<br>instance, some changes need Docker images to be=
 rebuilt...<br>Typically production gets updated once a week, I&#39;m plann=
ing to do<br><div>this tomorrow.</div><div><br></div><div>Guillaume=C2=A0</=
div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
On Thu, Feb 27, 2020 at 6:22 AM <a href=3D"http://kernelci.org" rel=3D"nor=
eferrer" target=3D"_blank">kernelci.org</a> bot &lt;<a href=3D"mailto:bot@k=
ernelci.org" target=3D"_blank">bot@kernelci.org</a>&gt; wrote:<br>
&gt;<br>
&gt; next/master build: 219 builds: 84 failed, 135 passed, 101 errors, 267=
 warnings (next-20200227)<br>
&gt;<br>
&gt; Full Build Summary: <a href=3D"https://kernelci.org/build/next/branch=
/master/kernel/next-20200227/" rel=3D"noreferrer" target=3D"_blank">https:/=
/kernelci.org/build/next/branch/master/kernel/next-20200227/</a><br>
&gt;<br>
&gt; Tree: next<br>
&gt; Branch: master<br>
&gt; Git Describe: next-20200227<br>
&gt; Git Commit: 10569a280f259f696c0b32fc1d45866d2fd33f53<br>
&gt; Git URL: git://<a href=3D"http://git.kernel.org/pub/scm/linux/kernel/=
git/next/linux-next.git" rel=3D"noreferrer" target=3D"_blank">git.kernel.or=
g/pub/scm/linux/kernel/git/next/linux-next.git</a><br>
&gt; Built: 7 unique architectures<br>
&gt;<br>
&gt; Build Failures Detected:<br>
&gt;<br>
&gt; arc:<br>
&gt;=C2=A0 =C2=A0 =C2=A0allnoconfig: (gcc-8) FAIL<br>
&gt;=C2=A0 =C2=A0 =C2=A0axs103_defconfig: (gcc-8) FAIL<br>
&gt;=C2=A0 =C2=A0 =C2=A0axs103_smp_defconfig: (gcc-8) FAIL<br>
&gt;=C2=A0 =C2=A0 =C2=A0haps_hs_defconfig: (gcc-8) FAIL<br>
&gt;=C2=A0 =C2=A0 =C2=A0haps_hs_smp_defconfig: (gcc-8) FAIL<br>
&gt;=C2=A0 =C2=A0 =C2=A0haps_hs_smp_defconfig+kselftest: (gcc-8) FAIL<br>
&gt;=C2=A0 =C2=A0 =C2=A0hsdk_defconfig: (gcc-8) FAIL<br>
&gt;=C2=A0 =C2=A0 =C2=A0nsimosci_hs_defconfig: (gcc-8) FAIL<br>
&gt;=C2=A0 =C2=A0 =C2=A0nsimosci_hs_smp_defconfig: (gcc-8) FAIL<br>
&gt;=C2=A0 =C2=A0 =C2=A0tinyconfig: (gcc-8) FAIL<br>
&gt;=C2=A0 =C2=A0 =C2=A0vdk_hs38_defconfig: (gcc-8) FAIL<br>
&gt;=C2=A0 =C2=A0 =C2=A0vdk_hs38_smp_defconfig: (gcc-8) FAIL<br>
&gt;<br>
&gt; arm:<br>
&gt;=C2=A0 =C2=A0 =C2=A0cm_x300_defconfig: (gcc-8) FAIL<br>
&gt;=C2=A0 =C2=A0 =C2=A0em_x270_defconfig: (gcc-8) FAIL<br>
&gt;=C2=A0 =C2=A0 =C2=A0eseries_pxa_defconfig: (gcc-8) FAIL<br>
&gt;=C2=A0 =C2=A0 =C2=A0pxa_defconfig: (gcc-8) FAIL<br>
&gt;<br>
&gt; mips:<br>
&gt;=C2=A0 =C2=A0 =C2=A032r2el_defconfig: (gcc-8) FAIL<br>
&gt;=C2=A0 =C2=A0 =C2=A032r2el_defconfig+kselftest: (gcc-8) FAIL<br>
&gt;=C2=A0 =C2=A0 =C2=A0allnoconfig: (gcc-8) FAIL<br>
&gt;=C2=A0 =C2=A0 =C2=A0ar7_defconfig: (gcc-8) FAIL<br>
&gt;=C2=A0 =C2=A0 =C2=A0ath25_defconfig: (gcc-8) FAIL<br>
&gt;=C2=A0 =C2=A0 =C2=A0ath79_defconfig: (gcc-8) FAIL<br>
&gt;=C2=A0 =C2=A0 =C2=A0bcm47xx_defconfig: (gcc-8) FAIL<br>
&gt;=C2=A0 =C2=A0 =C2=A0bcm63xx_defconfig: (gcc-8) FAIL<br>
&gt;=C2=A0 =C2=A0 =C2=A0bigsur_defconfig: (gcc-8) FAIL<br>
&gt;=C2=A0 =C2=A0 =C2=A0bmips_be_defconfig: (gcc-8) FAIL<br>
&gt;=C2=A0 =C2=A0 =C2=A0bmips_stb_defconfig: (gcc-8) FAIL<br>
&gt;=C2=A0 =C2=A0 =C2=A0capcella_defconfig: (gcc-8) FAIL<br>
&gt;=C2=A0 =C2=A0 =C2=A0cavium_octeon_defconfig: (gcc-8) FAIL<br>
&gt;=C2=A0 =C2=A0 =C2=A0ci20_defconfig: (gcc-8) FAIL<br>
&gt;=C2=A0 =C2=A0 =C2=A0cobalt_defconfig: (gcc-8) FAIL<br>
&gt;=C2=A0 =C2=A0 =C2=A0cu1000-neo_defconfig: (gcc-8) FAIL<br>
&gt;=C2=A0 =C2=A0 =C2=A0db1xxx_defconfig: (gcc-8) FAIL<br>
&gt;=C2=A0 =C2=A0 =C2=A0decstation_64_defconfig: (gcc-8) FAIL<br>
&gt;=C2=A0 =C2=A0 =C2=A0decstation_defconfig: (gcc-8) FAIL<br>
&gt;=C2=A0 =C2=A0 =C2=A0decstation_r4k_defconfig: (gcc-8) FAIL<br>
&gt;=C2=A0 =C2=A0 =C2=A0e55_defconfig: (gcc-8) FAIL<br>
&gt;=C2=A0 =C2=A0 =C2=A0fuloong2e_defconfig: (gcc-8) FAIL<br>
&gt;=C2=A0 =C2=A0 =C2=A0gcw0_defconfig: (gcc-8) FAIL<br>
&gt;=C2=A0 =C2=A0 =C2=A0gpr_defconfig: (gcc-8) FAIL<br>
&gt;=C2=A0 =C2=A0 =C2=A0ip22_defconfig: (gcc-8) FAIL<br>
&gt;=C2=A0 =C2=A0 =C2=A0ip27_defconfig: (gcc-8) FAIL<br>
&gt;=C2=A0 =C2=A0 =C2=A0ip28_defconfig: (gcc-8) FAIL<br>
&gt;=C2=A0 =C2=A0 =C2=A0ip32_defconfig: (gcc-8) FAIL<br>
&gt;=C2=A0 =C2=A0 =C2=A0jazz_defconfig: (gcc-8) FAIL<br>
&gt;=C2=A0 =C2=A0 =C2=A0jmr3927_defconfig: (gcc-8) FAIL<br>
&gt;=C2=A0 =C2=A0 =C2=A0lasat_defconfig: (gcc-8) FAIL<br>
&gt;=C2=A0 =C2=A0 =C2=A0lemote2f_defconfig: (gcc-8) FAIL<br>
&gt;=C2=A0 =C2=A0 =C2=A0loongson1b_defconfig: (gcc-8) FAIL<br>
&gt;=C2=A0 =C2=A0 =C2=A0loongson1c_defconfig: (gcc-8) FAIL<br>
&gt;=C2=A0 =C2=A0 =C2=A0loongson3_defconfig: (gcc-8) FAIL<br>
&gt;=C2=A0 =C2=A0 =C2=A0malta_defconfig: (gcc-8) FAIL<br>
&gt;=C2=A0 =C2=A0 =C2=A0malta_kvm_defconfig: (gcc-8) FAIL<br>
&gt;=C2=A0 =C2=A0 =C2=A0malta_kvm_guest_defconfig: (gcc-8) FAIL<br>
&gt;=C2=A0 =C2=A0 =C2=A0malta_qemu_32r6_defconfig: (gcc-8) FAIL<br>
&gt;=C2=A0 =C2=A0 =C2=A0maltaaprp_defconfig: (gcc-8) FAIL<br>
&gt;=C2=A0 =C2=A0 =C2=A0maltasmvp_defconfig: (gcc-8) FAIL<br>
&gt;=C2=A0 =C2=A0 =C2=A0maltasmvp_eva_defconfig: (gcc-8) FAIL<br>
&gt;=C2=A0 =C2=A0 =C2=A0maltaup_defconfig: (gcc-8) FAIL<br>
&gt;=C2=A0 =C2=A0 =C2=A0maltaup_xpa_defconfig: (gcc-8) FAIL<br>
&gt;=C2=A0 =C2=A0 =C2=A0markeins_defconfig: (gcc-8) FAIL<br>
&gt;=C2=A0 =C2=A0 =C2=A0mips_paravirt_defconfig: (gcc-8) FAIL<br>
&gt;=C2=A0 =C2=A0 =C2=A0mpc30x_defconfig: (gcc-8) FAIL<br>
&gt;=C2=A0 =C2=A0 =C2=A0msp71xx_defconfig: (gcc-8) FAIL<br>
&gt;=C2=A0 =C2=A0 =C2=A0mtx1_defconfig: (gcc-8) FAIL<br>
&gt;=C2=A0 =C2=A0 =C2=A0nlm_xlp_defconfig: (gcc-8) FAIL<br>
&gt;=C2=A0 =C2=A0 =C2=A0nlm_xlr_defconfig: (gcc-8) FAIL<br>
&gt;=C2=A0 =C2=A0 =C2=A0omega2p_defconfig: (gcc-8) FAIL<br>
&gt;=C2=A0 =C2=A0 =C2=A0pic32mzda_defconfig: (gcc-8) FAIL<br>
&gt;=C2=A0 =C2=A0 =C2=A0pistachio_defconfig: (gcc-8) FAIL<br>
&gt;=C2=A0 =C2=A0 =C2=A0pnx8335_stb225_defconfig: (gcc-8) FAIL<br>
&gt;=C2=A0 =C2=A0 =C2=A0qi_lb60_defconfig: (gcc-8) FAIL<br>
&gt;=C2=A0 =C2=A0 =C2=A0rb532_defconfig: (gcc-8) FAIL<br>
&gt;=C2=A0 =C2=A0 =C2=A0rbtx49xx_defconfig: (gcc-8) FAIL<br>
&gt;=C2=A0 =C2=A0 =C2=A0rm200_defconfig: (gcc-8) FAIL<br>
&gt;=C2=A0 =C2=A0 =C2=A0rt305x_defconfig: (gcc-8) FAIL<br>
&gt;=C2=A0 =C2=A0 =C2=A0sb1250_swarm_defconfig: (gcc-8) FAIL<br>
&gt;=C2=A0 =C2=A0 =C2=A0tb0219_defconfig: (gcc-8) FAIL<br>
&gt;=C2=A0 =C2=A0 =C2=A0tb0226_defconfig: (gcc-8) FAIL<br>
&gt;=C2=A0 =C2=A0 =C2=A0tb0287_defconfig: (gcc-8) FAIL<br>
&gt;=C2=A0 =C2=A0 =C2=A0tinyconfig: (gcc-8) FAIL<br>
&gt;=C2=A0 =C2=A0 =C2=A0vocore2_defconfig: (gcc-8) FAIL<br>
&gt;=C2=A0 =C2=A0 =C2=A0workpad_defconfig: (gcc-8) FAIL<br>
&gt;=C2=A0 =C2=A0 =C2=A0xway_defconfig: (gcc-8) FAIL<br>
&gt;<br>
&gt; Errors and Warnings Detected:<br>
&gt;<br>
&gt; arc:<br>
&gt;=C2=A0 =C2=A0 =C2=A0allnoconfig (gcc-8): 1 error, 1 warning<br>
&gt;=C2=A0 =C2=A0 =C2=A0axs103_defconfig (gcc-8): 1 error, 1 warning<br>
&gt;=C2=A0 =C2=A0 =C2=A0axs103_smp_defconfig (gcc-8): 1 error, 1 warning<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0haps_hs_defconfig (gcc-8): 1 error, 1 warning<br>
&gt;=C2=A0 =C2=A0 =C2=A0haps_hs_smp_defconfig (gcc-8): 1 error, 1 warning<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0haps_hs_smp_defconfig (gcc-8): 1 error, 1 warning<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0hsdk_defconfig (gcc-8): 1 error, 1 warning<br>
&gt;=C2=A0 =C2=A0 =C2=A0nsimosci_hs_defconfig (gcc-8): 1 error, 1 warning<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0nsimosci_hs_smp_defconfig (gcc-8): 1 error, 1 warn=
ing<br>
&gt;=C2=A0 =C2=A0 =C2=A0tinyconfig (gcc-8): 1 error, 1 warning<br>
&gt;=C2=A0 =C2=A0 =C2=A0vdk_hs38_defconfig (gcc-8): 1 error, 1 warning<br>
&gt;=C2=A0 =C2=A0 =C2=A0vdk_hs38_smp_defconfig (gcc-8): 1 error, 1 warning=
<br>
&gt;<br>
&gt; arm64:<br>
&gt;=C2=A0 =C2=A0 =C2=A0allmodconfig (clang-8): 81 warnings<br>
&gt;=C2=A0 =C2=A0 =C2=A0defconfig (clang-8): 18 warnings<br>
&gt;=C2=A0 =C2=A0 =C2=A0defconfig (gcc-8): 1 warning<br>
&gt;=C2=A0 =C2=A0 =C2=A0defconfig (gcc-8): 1 warning<br>
&gt;=C2=A0 =C2=A0 =C2=A0defconfig (gcc-8): 1 warning<br>
&gt;=C2=A0 =C2=A0 =C2=A0defconfig (gcc-8): 1 warning<br>
&gt;<br>
&gt; arm:<br>
&gt;=C2=A0 =C2=A0 =C2=A0allmodconfig (gcc-8): 21 warnings<br>
&gt;=C2=A0 =C2=A0 =C2=A0aspeed_g4_defconfig (gcc-8): 4 warnings<br>
&gt;=C2=A0 =C2=A0 =C2=A0aspeed_g5_defconfig (gcc-8): 4 warnings<br>
&gt;=C2=A0 =C2=A0 =C2=A0cm_x300_defconfig (gcc-8): 1 error, 2 warnings<br>
&gt;=C2=A0 =C2=A0 =C2=A0em_x270_defconfig (gcc-8): 1 error, 2 warnings<br>
&gt;=C2=A0 =C2=A0 =C2=A0eseries_pxa_defconfig (gcc-8): 14 errors, 12 warni=
ngs<br>
&gt;=C2=A0 =C2=A0 =C2=A0multi_v5_defconfig (gcc-8): 4 warnings<br>
&gt;=C2=A0 =C2=A0 =C2=A0multi_v7_defconfig (gcc-8): 4 warnings<br>
&gt;=C2=A0 =C2=A0 =C2=A0multi_v7_defconfig (gcc-8): 4 warnings<br>
&gt;=C2=A0 =C2=A0 =C2=A0multi_v7_defconfig (gcc-8): 4 warnings<br>
&gt;=C2=A0 =C2=A0 =C2=A0multi_v7_defconfig (gcc-8): 4 warnings<br>
&gt;=C2=A0 =C2=A0 =C2=A0multi_v7_defconfig (gcc-8): 5 warnings<br>
&gt;=C2=A0 =C2=A0 =C2=A0pxa_defconfig (gcc-8): 3 errors, 6 warnings<br>
&gt;<br>
&gt; i386:<br>
&gt;<br>
&gt; mips:<br>
&gt;=C2=A0 =C2=A0 =C2=A032r2el_defconfig (gcc-8): 1 error, 1 warning<br>
&gt;=C2=A0 =C2=A0 =C2=A032r2el_defconfig (gcc-8): 1 error, 1 warning<br>
&gt;=C2=A0 =C2=A0 =C2=A0allnoconfig (gcc-8): 1 error, 1 warning<br>
&gt;=C2=A0 =C2=A0 =C2=A0ar7_defconfig (gcc-8): 1 error, 1 warning<br>
&gt;=C2=A0 =C2=A0 =C2=A0ath25_defconfig (gcc-8): 1 error, 1 warning<br>
&gt;=C2=A0 =C2=A0 =C2=A0ath79_defconfig (gcc-8): 1 error, 1 warning<br>
&gt;=C2=A0 =C2=A0 =C2=A0bcm47xx_defconfig (gcc-8): 1 error, 1 warning<br>
&gt;=C2=A0 =C2=A0 =C2=A0bcm63xx_defconfig (gcc-8): 1 error, 1 warning<br>
&gt;=C2=A0 =C2=A0 =C2=A0bigsur_defconfig (gcc-8): 1 error, 1 warning<br>
&gt;=C2=A0 =C2=A0 =C2=A0bmips_be_defconfig (gcc-8): 1 error, 1 warning<br>
&gt;=C2=A0 =C2=A0 =C2=A0bmips_stb_defconfig (gcc-8): 1 error, 1 warning<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0capcella_defconfig (gcc-8): 1 error, 1 warning<br>
&gt;=C2=A0 =C2=A0 =C2=A0cavium_octeon_defconfig (gcc-8): 1 error, 1 warnin=
g<br>
&gt;=C2=A0 =C2=A0 =C2=A0ci20_defconfig (gcc-8): 1 error, 1 warning<br>
&gt;=C2=A0 =C2=A0 =C2=A0cobalt_defconfig (gcc-8): 1 error, 1 warning<br>
&gt;=C2=A0 =C2=A0 =C2=A0cu1000-neo_defconfig (gcc-8): 1 error, 1 warning<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0db1xxx_defconfig (gcc-8): 1 error, 1 warning<br>
&gt;=C2=A0 =C2=A0 =C2=A0decstation_64_defconfig (gcc-8): 1 error, 1 warnin=
g<br>
&gt;=C2=A0 =C2=A0 =C2=A0decstation_defconfig (gcc-8): 1 error, 1 warning<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0decstation_r4k_defconfig (gcc-8): 1 error, 1 warni=
ng<br>
&gt;=C2=A0 =C2=A0 =C2=A0e55_defconfig (gcc-8): 1 error, 1 warning<br>
&gt;=C2=A0 =C2=A0 =C2=A0fuloong2e_defconfig (gcc-8): 1 error, 1 warning<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0gcw0_defconfig (gcc-8): 1 error, 1 warning<br>
&gt;=C2=A0 =C2=A0 =C2=A0gpr_defconfig (gcc-8): 1 error, 1 warning<br>
&gt;=C2=A0 =C2=A0 =C2=A0ip22_defconfig (gcc-8): 1 error, 1 warning<br>
&gt;=C2=A0 =C2=A0 =C2=A0ip27_defconfig (gcc-8): 3 errors, 2 warnings<br>
&gt;=C2=A0 =C2=A0 =C2=A0ip28_defconfig (gcc-8): 1 error, 1 warning<br>
&gt;=C2=A0 =C2=A0 =C2=A0ip32_defconfig (gcc-8): 1 error, 1 warning<br>
&gt;=C2=A0 =C2=A0 =C2=A0jazz_defconfig (gcc-8): 1 error, 1 warning<br>
&gt;=C2=A0 =C2=A0 =C2=A0jmr3927_defconfig (gcc-8): 1 error, 1 warning<br>
&gt;=C2=A0 =C2=A0 =C2=A0lasat_defconfig (gcc-8): 1 error, 1 warning<br>
&gt;=C2=A0 =C2=A0 =C2=A0lemote2f_defconfig (gcc-8): 1 error, 1 warning<br>
&gt;=C2=A0 =C2=A0 =C2=A0loongson1b_defconfig (gcc-8): 1 error, 1 warning<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0loongson1c_defconfig (gcc-8): 1 error, 1 warning<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0loongson3_defconfig (gcc-8): 1 error, 1 warning<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0malta_defconfig (gcc-8): 1 error, 1 warning<br>
&gt;=C2=A0 =C2=A0 =C2=A0malta_kvm_defconfig (gcc-8): 1 error, 1 warning<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0malta_kvm_guest_defconfig (gcc-8): 1 error, 1 warn=
ing<br>
&gt;=C2=A0 =C2=A0 =C2=A0malta_qemu_32r6_defconfig (gcc-8): 1 error, 1 warn=
ing<br>
&gt;=C2=A0 =C2=A0 =C2=A0maltaaprp_defconfig (gcc-8): 1 error, 1 warning<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0maltasmvp_defconfig (gcc-8): 1 error, 1 warning<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0maltasmvp_eva_defconfig (gcc-8): 1 error, 1 warnin=
g<br>
&gt;=C2=A0 =C2=A0 =C2=A0maltaup_defconfig (gcc-8): 1 error, 1 warning<br>
&gt;=C2=A0 =C2=A0 =C2=A0maltaup_xpa_defconfig (gcc-8): 1 error, 1 warning<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0markeins_defconfig (gcc-8): 1 error, 1 warning<br>
&gt;=C2=A0 =C2=A0 =C2=A0mips_paravirt_defconfig (gcc-8): 1 error, 1 warnin=
g<br>
&gt;=C2=A0 =C2=A0 =C2=A0mpc30x_defconfig (gcc-8): 1 error, 1 warning<br>
&gt;=C2=A0 =C2=A0 =C2=A0msp71xx_defconfig (gcc-8): 1 error, 1 warning<br>
&gt;=C2=A0 =C2=A0 =C2=A0mtx1_defconfig (gcc-8): 1 error, 1 warning<br>
&gt;=C2=A0 =C2=A0 =C2=A0nlm_xlp_defconfig (gcc-8): 1 error, 1 warning<br>
&gt;=C2=A0 =C2=A0 =C2=A0nlm_xlr_defconfig (gcc-8): 1 error, 1 warning<br>
&gt;=C2=A0 =C2=A0 =C2=A0omega2p_defconfig (gcc-8): 1 error, 1 warning<br>
&gt;=C2=A0 =C2=A0 =C2=A0pic32mzda_defconfig (gcc-8): 1 error, 1 warning<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0pistachio_defconfig (gcc-8): 1 error, 1 warning<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0pnx8335_stb225_defconfig (gcc-8): 1 error, 1 warni=
ng<br>
&gt;=C2=A0 =C2=A0 =C2=A0qi_lb60_defconfig (gcc-8): 1 error, 1 warning<br>
&gt;=C2=A0 =C2=A0 =C2=A0rb532_defconfig (gcc-8): 1 error, 1 warning<br>
&gt;=C2=A0 =C2=A0 =C2=A0rbtx49xx_defconfig (gcc-8): 1 error, 1 warning<br>
&gt;=C2=A0 =C2=A0 =C2=A0rm200_defconfig (gcc-8): 1 error, 1 warning<br>
&gt;=C2=A0 =C2=A0 =C2=A0rt305x_defconfig (gcc-8): 1 error, 1 warning<br>
&gt;=C2=A0 =C2=A0 =C2=A0sb1250_swarm_defconfig (gcc-8): 1 error, 1 warning=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0tb0219_defconfig (gcc-8): 1 error, 1 warning<br>
&gt;=C2=A0 =C2=A0 =C2=A0tb0226_defconfig (gcc-8): 1 error, 1 warning<br>
&gt;=C2=A0 =C2=A0 =C2=A0tb0287_defconfig (gcc-8): 1 error, 1 warning<br>
&gt;=C2=A0 =C2=A0 =C2=A0tinyconfig (gcc-8): 1 error, 1 warning<br>
&gt;=C2=A0 =C2=A0 =C2=A0vocore2_defconfig (gcc-8): 1 error, 1 warning<br>
&gt;=C2=A0 =C2=A0 =C2=A0workpad_defconfig (gcc-8): 1 error, 1 warning<br>
&gt;=C2=A0 =C2=A0 =C2=A0xway_defconfig (gcc-8): 1 error, 1 warning<br>
&gt;<br>
&gt; riscv:<br>
&gt;=C2=A0 =C2=A0 =C2=A0rv32_defconfig (gcc-8): 6 warnings<br>
&gt;<br>
&gt; x86_64:<br>
&gt;=C2=A0 =C2=A0 =C2=A0tinyconfig (gcc-8): 1 warning<br>
&gt;<br>
&gt; Errors summary:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A080=C2=A0 =C2=A0mm/memory.c:1523:41: error: implici=
t declaration of function =E2=80=98pte_index=E2=80=99; did you mean =E2=80=
=98page_index=E2=80=99? [-Werror=3Dimplicit-function-declaration]<br>
&gt;=C2=A0 =C2=A0 =C2=A03=C2=A0 =C2=A0 ERROR: &quot;snd_ac97_reset&quot; [=
sound/soc/codecs/snd-soc-wm9712.ko] undefined!<br>
&gt;=C2=A0 =C2=A0 =C2=A02=C2=A0 =C2=A0 arch/mips/include/asm/sn/addrs.h:58=
:44: error: left shift count &gt;=3D width of type [-Werror=3Dshift-count-o=
verflow]<br>
&gt;=C2=A0 =C2=A0 =C2=A01=C2=A0 =C2=A0 sound/soc/codecs/wm9712.c:94:3: err=
or: =E2=80=98const struct regmap_config=E2=80=99 has no member named =E2=80=
=
=98num_reg_defaults=E2=80=99<br>
&gt;=C2=A0 =C2=A0 =C2=A01=C2=A0 =C2=A0 sound/soc/codecs/wm9712.c:93:3: err=
or: =E2=80=98const struct regmap_config=E2=80=99 has no member named =E2=80=
=
=98reg_defaults=E2=80=99<br>
&gt;=C2=A0 =C2=A0 =C2=A01=C2=A0 =C2=A0 sound/soc/codecs/wm9712.c:91:3: err=
or: =E2=80=98const struct regmap_config=E2=80=99 has no member named =E2=80=
=
=98volatile_reg=E2=80=99<br>
&gt;=C2=A0 =C2=A0 =C2=A01=C2=A0 =C2=A0 sound/soc/codecs/wm9712.c:89:3: err=
or: =E2=80=98const struct regmap_config=E2=80=99 has no member named =E2=80=
=
=98cache_type=E2=80=99<br>
&gt;=C2=A0 =C2=A0 =C2=A01=C2=A0 =C2=A0 sound/soc/codecs/wm9712.c:88:3: err=
or: =E2=80=98const struct regmap_config=E2=80=99 has no member named =E2=80=
=
=98max_register=E2=80=99<br>
&gt;=C2=A0 =C2=A0 =C2=A01=C2=A0 =C2=A0 sound/soc/codecs/wm9712.c:87:3: err=
or: =E2=80=98const struct regmap_config=E2=80=99 has no member named =E2=80=
=
=98val_bits=E2=80=99<br>
&gt;=C2=A0 =C2=A0 =C2=A01=C2=A0 =C2=A0 sound/soc/codecs/wm9712.c:86:3: err=
or: =E2=80=98const struct regmap_config=E2=80=99 has no member named =E2=80=
=
=98reg_stride=E2=80=99<br>
&gt;=C2=A0 =C2=A0 =C2=A01=C2=A0 =C2=A0 sound/soc/codecs/wm9712.c:85:3: err=
or: =E2=80=98const struct regmap_config=E2=80=99 has no member named =E2=80=
=
=98reg_bits=E2=80=99<br>
&gt;=C2=A0 =C2=A0 =C2=A01=C2=A0 =C2=A0 sound/soc/codecs/wm9712.c:84:35: er=
ror: storage size of =E2=80=98wm9712_regmap_config=E2=80=99 isn=E2=80=99t k=
nown<br>
&gt;=C2=A0 =C2=A0 =C2=A01=C2=A0 =C2=A0 sound/soc/codecs/wm9712.c:84:21: er=
ror: variable =E2=80=98wm9712_regmap_config=E2=80=99 has initializer but in=
complete type<br>
&gt;=C2=A0 =C2=A0 =C2=A01=C2=A0 =C2=A0 sound/soc/codecs/wm9712.c:80:10: er=
ror: implicit declaration of function =E2=80=98regmap_ac97_default_volatile=
=
=E2=80=99 [-Werror=3Dimplicit-function-declaration]<br>
&gt;=C2=A0 =C2=A0 =C2=A01=C2=A0 =C2=A0 sound/soc/codecs/wm9712.c:675:3: er=
ror: implicit declaration of function =E2=80=98snd_soc_component_exit_regma=
p=E2=80=99; did you mean =E2=80=98snd_soc_component_trigger=E2=80=99? [-Wer=
ror=3Dimplicit-function-declaration]<br>
&gt;=C2=A0 =C2=A0 =C2=A01=C2=A0 =C2=A0 sound/soc/codecs/wm9712.c:662:2: er=
ror: implicit declaration of function =E2=80=98snd_soc_component_init_regma=
p=E2=80=99; did you mean =E2=80=98snd_soc_component_trigger=E2=80=99? [-Wer=
ror=3Dimplicit-function-declaration]<br>
&gt;=C2=A0 =C2=A0 =C2=A01=C2=A0 =C2=A0 sound/soc/codecs/wm9712.c:653:12: e=
rror: implicit declaration of function =E2=80=98regmap_init_ac97=E2=80=99; =
did you mean =E2=80=98memmap_init_zone=E2=80=99? [-Werror=3Dimplicit-functi=
on-declaration]<br>
&gt;=C2=A0 =C2=A0 =C2=A01=C2=A0 =C2=A0 ERROR: &quot;snd_ac97_reset&quot; [=
sound/soc/codecs/snd-soc-wm9713.ko] undefined!<br>
&gt;=C2=A0 =C2=A0 =C2=A01=C2=A0 =C2=A0 ERROR: &quot;snd_ac97_reset&quot; [=
sound/soc/codecs/snd-soc-wm9705.ko] undefined!<br>
&gt;<br>
&gt; Warnings summary:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A081=C2=A0 =C2=A0cc1: some warnings being treated as=
 errors<br>
&gt;=C2=A0 =C2=A0 =C2=A036=C2=A0 =C2=A01 warning generated.<br>
&gt;=C2=A0 =C2=A0 =C2=A014=C2=A0 =C2=A0drivers/net/ethernet/mellanox/mlx5/=
core/diag/rsc_dump.h:4:9: warning: &#39;__MLX5_RSC_DUMP_H&#39; is used as a=
 header guard here, followed by #define of a different macro [-Wheader-guar=
d]<br>
&gt;=C2=A0 =C2=A0 =C2=A09=C2=A0 =C2=A0 drivers/net/phy/mdio-cavium.h:113:4=
8: warning: cast to pointer from integer of different size [-Wint-to-pointe=
r-cast]<br>
&gt;=C2=A0 =C2=A0 =C2=A09=C2=A0 =C2=A0 arch/arm/boot/dts/aspeed-bmc-facebo=
ok-tiogapass.dts:523.3-30: Warning (i2c_bus_reg): /ahb/apb/bus@1e78a000/i2c=
-bus@380/ipmb0@10:reg: I2C address must be less than 10-bits, got &quot;0x4=
0000010&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A09=C2=A0 =C2=A0 arch/arm/boot/dts/aspeed-bmc-facebo=
ok-tiogapass.dts:521.11-525.4: Warning (i2c_bus_reg): /ahb/apb/bus@1e78a000=
/i2c-bus@380/ipmb0@10: I2C bus unit address format error, expected &quot;40=
000010&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A09=C2=A0 =C2=A0 arch/arm/boot/dts/aspeed-bmc-facebo=
ok-tiogapass.dts:437.3-30: Warning (i2c_bus_reg): /ahb/apb/bus@1e78a000/i2c=
-bus@140/ipmb0@10:reg: I2C address must be less than 10-bits, got &quot;0x4=
0000010&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A09=C2=A0 =C2=A0 arch/arm/boot/dts/aspeed-bmc-facebo=
ok-tiogapass.dts:435.11-439.4: Warning (i2c_bus_reg): /ahb/apb/bus@1e78a000=
/i2c-bus@140/ipmb0@10: I2C bus unit address format error, expected &quot;40=
000010&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A08=C2=A0 =C2=A0 WARNING: unmet direct dependencies =
detected for SND_SOC_WM9712<br>
&gt;=C2=A0 =C2=A0 =C2=A06=C2=A0 =C2=A0 2 warnings generated.<br>
&gt;=C2=A0 =C2=A0 =C2=A04=C2=A0 =C2=A0 kernel/sched/fair.c:1524:20: warnin=
g: =E2=80=98test_idle_cores=E2=80=99 declared =E2=80=98static=E2=80=99 but =
never defined [-Wunused-function]<br>
&gt;=C2=A0 =C2=A0 =C2=A04=C2=A0 =C2=A0 drivers/net/phy/mdio-cavium.h:114:3=
7: warning: cast to pointer from integer of different size [-Wint-to-pointe=
r-cast]<br>
&gt;=C2=A0 =C2=A0 =C2=A02=C2=A0 =C2=A0 fs/btrfs/backref.c:394:30: warning:=
 suggest braces around initialization of subobject [-Wmissing-braces]<br>
&gt;=C2=A0 =C2=A0 =C2=A02=C2=A0 =C2=A0 drivers/gpu/drm/sun4i/sun6i_mipi_ds=
i.c:722:36: warning: suggest braces around initialization of subobject [-Wm=
issing-braces]<br>
&gt;=C2=A0 =C2=A0 =C2=A02=C2=A0 =C2=A0 drivers/gpu/drm/amd/amdgpu/../displ=
ay/dc/core/dc_link_dp.c:2692:80: warning: suggest braces around initializat=
ion of subobject [-Wmissing-braces]<br>
&gt;=C2=A0 =C2=A0 =C2=A02=C2=A0 =C2=A0 WARNING: unmet direct dependencies =
detected for SND_SOC_WM9713<br>
&gt;=C2=A0 =C2=A0 =C2=A02=C2=A0 =C2=A0 WARNING: unmet direct dependencies =
detected for SND_SOC_WM9705<br>
&gt;=C2=A0 =C2=A0 =C2=A02=C2=A0 =C2=A0 &lt;stdin&gt;:830:2: warning: #warn=
ing syscall fstat64 not implemented [-Wcpp]<br>
&gt;=C2=A0 =C2=A0 =C2=A02=C2=A0 =C2=A0 &lt;stdin&gt;:1511:2: warning: #war=
ning syscall clone3 not implemented [-Wcpp]<br>
&gt;=C2=A0 =C2=A0 =C2=A02=C2=A0 =C2=A0 &lt;stdin&gt;:1127:2: warning: #war=
ning syscall fstatat64 not implemented [-Wcpp]<br>
&gt;=C2=A0 =C2=A0 =C2=A02=C2=A0 =C2=A0 3 warnings generated.<br>
&gt;=C2=A0 =C2=A0 =C2=A01=C2=A0 =C2=A0 sound/soc/codecs/wm9712.c:93:18: wa=
rning: excess elements in struct initializer<br>
&gt;=C2=A0 =C2=A0 =C2=A01=C2=A0 =C2=A0 sound/soc/codecs/wm9712.c:91:18: wa=
rning: excess elements in struct initializer<br>
&gt;=C2=A0 =C2=A0 =C2=A01=C2=A0 =C2=A0 sound/soc/codecs/wm9712.c:89:16: wa=
rning: excess elements in struct initializer<br>
&gt;=C2=A0 =C2=A0 =C2=A01=C2=A0 =C2=A0 sound/soc/codecs/wm9712.c:88:18: wa=
rning: excess elements in struct initializer<br>
&gt;=C2=A0 =C2=A0 =C2=A01=C2=A0 =C2=A0 sound/soc/codecs/wm9712.c:87:14: wa=
rning: excess elements in struct initializer<br>
&gt;=C2=A0 =C2=A0 =C2=A01=C2=A0 =C2=A0 sound/soc/codecs/wm9712.c:86:16: wa=
rning: excess elements in struct initializer<br>
&gt;=C2=A0 =C2=A0 =C2=A01=C2=A0 =C2=A0 sound/soc/codecs/wm9712.c:85:14: wa=
rning: excess elements in struct initializer<br>
&gt;=C2=A0 =C2=A0 =C2=A01=C2=A0 =C2=A0 sound/soc/codecs/wm9712.c:653:10: w=
arning: assignment to =E2=80=98struct regmap *=E2=80=99 from =E2=80=98int=
=E2=80=99 makes pointer from integer without a cast [-Wint-conversion]<br>
&gt;=C2=A0 =C2=A0 =C2=A01=C2=A0 =C2=A0 net/sched/cls_flower.c:331:1: warni=
ng: the frame size of 1032 bytes is larger than 1024 bytes [-Wframe-larger-=
than=3D]<br>
&gt;=C2=A0 =C2=A0 =C2=A01=C2=A0 =C2=A0 net/nfc/hci/llc_shdlc.c:687:34: war=
ning: variable &#39;connect_wq&#39; is uninitialized when used within its o=
wn initialization [-Wuninitialized]<br>
&gt;=C2=A0 =C2=A0 =C2=A01=C2=A0 =C2=A0 net/nfc/hci/command.c:59:34: warnin=
g: variable &#39;ew_wq&#39; is uninitialized when used within its own initi=
alization [-Wuninitialized]<br>
&gt;=C2=A0 =C2=A0 =C2=A01=C2=A0 =C2=A0 mm/shmem.c:2745:35: warning: variab=
le &#39;shmem_falloc_waitq&#39; is uninitialized when used within its own i=
nitialization [-Wuninitialized]<br>
&gt;=C2=A0 =C2=A0 =C2=A01=C2=A0 =C2=A0 include/linux/kernel.h:47:25: warni=
ng: excess elements in struct initializer<br>
&gt;=C2=A0 =C2=A0 =C2=A01=C2=A0 =C2=A0 fs/proc/proc_sysctl.c:705:35: warni=
ng: variable &#39;wq&#39; is uninitialized when used within its own initial=
ization [-Wuninitialized]<br>
&gt;=C2=A0 =C2=A0 =C2=A01=C2=A0 =C2=A0 fs/proc/base.c:1985:35: warning: va=
riable &#39;wq&#39; is uninitialized when used within its own initializatio=
n [-Wuninitialized]<br>
&gt;=C2=A0 =C2=A0 =C2=A01=C2=A0 =C2=A0 fs/nfs/dir.c:464:34: warning: varia=
ble &#39;wq&#39; is uninitialized when used within its own initialization [=
-Wuninitialized]<br>
&gt;=C2=A0 =C2=A0 =C2=A01=C2=A0 =C2=A0 fs/nfs/dir.c:1638:34: warning: vari=
able &#39;wq&#39; is uninitialized when used within its own initialization =
[-Wuninitialized]<br>
&gt;=C2=A0 =C2=A0 =C2=A01=C2=A0 =C2=A0 fs/namei.c:3213:34: warning: variab=
le &#39;wq&#39; is uninitialized when used within its own initialization [-=
Wuninitialized]<br>
&gt;=C2=A0 =C2=A0 =C2=A01=C2=A0 =C2=A0 fs/namei.c:1736:34: warning: variab=
le &#39;wq&#39; is uninitialized when used within its own initialization [-=
Wuninitialized]<br>
&gt;=C2=A0 =C2=A0 =C2=A01=C2=A0 =C2=A0 fs/fuse/readdir.c:161:34: warning: =
variable &#39;wq&#39; is uninitialized when used within its own initializat=
ion [-Wuninitialized]<br>
&gt;=C2=A0 =C2=A0 =C2=A01=C2=A0 =C2=A0 fs/cifs/readdir.c:84:34: warning: v=
ariable &#39;wq&#39; is uninitialized when used within its own initializati=
on [-Wuninitialized]<br>
&gt;=C2=A0 =C2=A0 =C2=A01=C2=A0 =C2=A0 fs/afs/dir_silly.c:205:34: warning:=
 variable &#39;wq&#39; is uninitialized when used within its own initializa=
tion [-Wuninitialized]<br>
&gt;=C2=A0 =C2=A0 =C2=A01=C2=A0 =C2=A0 drivers/soc/fsl/dpio/qbman-portal.c=
:870:14: warning: cast from pointer to integer of different size [-Wpointer=
-to-int-cast]<br>
&gt;=C2=A0 =C2=A0 =C2=A01=C2=A0 =C2=A0 drivers/scsi/lpfc/lpfc_sli.c:11910:=
34: warning: variable &#39;done_q&#39; is uninitialized when used within it=
s own initialization [-Wuninitialized]<br>
&gt;=C2=A0 =C2=A0 =C2=A01=C2=A0 =C2=A0 drivers/scsi/lpfc/lpfc_scsi.c:4728:=
34: warning: variable &#39;waitq&#39; is uninitialized when used within its=
 own initialization [-Wuninitialized]<br>
&gt;=C2=A0 =C2=A0 =C2=A01=C2=A0 =C2=A0 drivers/scsi/bfa/bfad_im.c:378:34: =
warning: variable &#39;wq&#39; is uninitialized when used within its own in=
itialization [-Wuninitialized]<br>
&gt;=C2=A0 =C2=A0 =C2=A01=C2=A0 =C2=A0 drivers/scsi/bfa/bfad_im.c:301:34: =
warning: variable &#39;wq&#39; is uninitialized when used within its own in=
itialization [-Wuninitialized]<br>
&gt;=C2=A0 =C2=A0 =C2=A01=C2=A0 =C2=A0 drivers/net/wireless/ath/ath11k/deb=
ugfs_sta.c:185:7: warning: variable &#39;rate_idx&#39; is used uninitialize=
d whenever &#39;if&#39; condition is false [-Wsometimes-uninitialized]<br>
&gt;=C2=A0 =C2=A0 =C2=A01=C2=A0 =C2=A0 drivers/net/wireless/ath/ath11k/deb=
ugfs_sta.c:184:13: warning: variable &#39;rate_idx&#39; is used uninitializ=
ed whenever &#39;if&#39; condition is false [-Wsometimes-uninitialized]<br>
&gt;=C2=A0 =C2=A0 =C2=A01=C2=A0 =C2=A0 drivers/net/wireless/ath/ath11k/deb=
ugfs_sta.c:175:7: warning: variable &#39;rate_idx&#39; is used uninitialize=
d whenever &#39;if&#39; condition is false [-Wsometimes-uninitialized]<br>
&gt;=C2=A0 =C2=A0 =C2=A01=C2=A0 =C2=A0 drivers/net/wireless/ath/ath11k/deb=
ugfs_sta.c:139:13: note: initialize the variable &#39;rate_idx&#39; to sile=
nce this warning<br>
&gt;=C2=A0 =C2=A0 =C2=A01=C2=A0 =C2=A0 drivers/net/usb/lan78xx.c:2659:34: =
warning: variable &#39;unlink_wakeup&#39; is uninitialized when used within=
 its own initialization [-Wuninitialized]<br>
&gt;=C2=A0 =C2=A0 =C2=A01=C2=A0 =C2=A0 drivers/net/phy/mdio-octeon.c:48:3:=
 warning: cast from pointer to integer of different size [-Wpointer-to-int-=
cast]<br>
&gt;=C2=A0 =C2=A0 =C2=A01=C2=A0 =C2=A0 drivers/net/ethernet/amazon/ena/ena=
_netdev.c:310:38: warning: suggest braces around initialization of subobjec=
t [-Wmissing-braces]<br>
&gt;=C2=A0 =C2=A0 =C2=A01=C2=A0 =C2=A0 drivers/misc/mic/vop/vop_vringh.c:3=
99:34: warning: variable &#39;wake&#39; is uninitialized when used within i=
ts own initialization [-Wuninitialized]<br>
&gt;=C2=A0 =C2=A0 =C2=A01=C2=A0 =C2=A0 drivers/misc/mic/vop/vop_vringh.c:1=
55:34: warning: variable &#39;wake&#39; is uninitialized when used within i=
ts own initialization [-Wuninitialized]<br>
&gt;=C2=A0 =C2=A0 =C2=A01=C2=A0 =C2=A0 drivers/hwtracing/coresight/coresig=
ht-cti-sysfs.c:948:11: warning: address of array &#39;grp-&gt;sig_types&#39=
; will always evaluate to &#39;true&#39; [-Wpointer-bool-conversion]<br>
&gt;=C2=A0 =C2=A0 =C2=A01=C2=A0 =C2=A0 drivers/gpu/host1x/syncpt.c:208:34:=
 warning: variable &#39;wq&#39; is uninitialized when used within its own i=
nitialization [-Wuninitialized]<br>
&gt;=C2=A0 =C2=A0 =C2=A01=C2=A0 =C2=A0 drivers/gpu/drm/amd/amdgpu/../displ=
ay/dc/dce/dmub_psr.c:147:56: warning: address of &#39;pipe_ctx-&gt;stream_r=
es&#39; will always evaluate to &#39;true&#39; [-Wpointer-bool-conversion]<=
br>
&gt;=C2=A0 =C2=A0 =C2=A01=C2=A0 =C2=A0 drivers/gpu/drm/amd/amdgpu/../displ=
ay/dc/dce/dmub_psr.c:147:31: warning: address of &#39;pipe_ctx-&gt;plane_re=
s&#39; will always evaluate to &#39;true&#39; [-Wpointer-bool-conversion]<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A01=C2=A0 =C2=A0 drivers/gpu/drm/amd/amdgpu/../displ=
ay/dc/core/dc_link_dp.c:2690:53: warning: suggest braces around initializat=
ion of subobject [-Wmissing-braces]<br>
&gt;=C2=A0 =C2=A0 =C2=A01=C2=A0 =C2=A0 drivers/gpu/drm/amd/amdgpu/../displ=
ay/dc/bios/command_table2.c:342:53: warning: suggest braces around initiali=
zation of subobject [-Wmissing-braces]<br>
&gt;=C2=A0 =C2=A0 =C2=A01=C2=A0 =C2=A0 drivers/gpu/drm/amd/amdgpu/../displ=
ay/dc/bios/command_table2.c:116:62: warning: suggest braces around initiali=
zation of subobject [-Wmissing-braces]<br>
&gt;=C2=A0 =C2=A0 =C2=A01=C2=A0 =C2=A0 drivers/gpu/drm/amd/amdgpu/../displ=
ay/dc/bios/bios_parser2.c:297:41: warning: suggest braces around initializa=
tion of subobject [-Wmissing-braces]<br>
&gt;=C2=A0 =C2=A0 =C2=A01=C2=A0 =C2=A0 drivers/gpu/drm/amd/amdgpu/../displ=
ay/amdgpu_dm/amdgpu_dm.c:8558:43: warning: suggest braces around initializa=
tion of subobject [-Wmissing-braces]<br>
&gt;=C2=A0 =C2=A0 =C2=A01=C2=A0 =C2=A0 drivers/bluetooth/bluecard_cs.c:282=
:36: warning: variable &#39;wq&#39; is uninitialized when used within its o=
wn initialization [-Wuninitialized]<br>
&gt;=C2=A0 =C2=A0 =C2=A01=C2=A0 =C2=A0 drivers/android/binderfs.c:657:41: =
warning: suggest braces around initialization of subobject [-Wmissing-brace=
s]<br>
&gt;=C2=A0 =C2=A0 =C2=A01=C2=A0 =C2=A0 cc1: all warnings being treated as =
errors<br>
&gt;=C2=A0 =C2=A0 =C2=A01=C2=A0 =C2=A0 /tmp/ccgeLqJj.s:18191: Warning: usi=
ng r15 results in unpredictable behaviour<br>
&gt;=C2=A0 =C2=A0 =C2=A01=C2=A0 =C2=A0 /tmp/ccgeLqJj.s:18119: Warning: usi=
ng r15 results in unpredictable behaviour<br>
&gt;=C2=A0 =C2=A0 =C2=A01=C2=A0 =C2=A0 .config:1167:warning: override: UNW=
INDER_GUESS changes choice state<br>
&gt;<br>
&gt; =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt;<br>
&gt; Detailed per-defconfig build reports:<br>
&gt;<br>
&gt; ---------------------------------------------------------------------=
-----------<br>
&gt; 32r2el_defconfig (mips, gcc-8) =E2=80=94 FAIL, 1 error, 1 warning, 0 =
section mismatches<br>
&gt;<br>
&gt; Errors:<br>
&gt;=C2=A0 =C2=A0 =C2=A0mm/memory.c:1523:41: error: implicit declaration o=
f function =E2=80=98pte_index=E2=80=99; did you mean =E2=80=98page_index=E2=
=
=80=99? [-Werror=3Dimplicit-function-declaration]<br>
&gt;<br>
&gt; Warnings:<br>
&gt;=C2=A0 =C2=A0 =C2=A0cc1: some warnings being treated as errors<br>
&gt;<br>
&gt; ---------------------------------------------------------------------=
-----------<br>
&gt; 32r2el_defconfig+kselftest (mips, gcc-8) =E2=80=94 FAIL, 1 error, 1 w=
arning, 0 section mismatches<br>
&gt;<br>
&gt; Errors:<br>
&gt;=C2=A0 =C2=A0 =C2=A0mm/memory.c:1523:41: error: implicit declaration o=
f function =E2=80=98pte_index=E2=80=99; did you mean =E2=80=98page_index=E2=
=
=80=99? [-Werror=3Dimplicit-function-declaration]<br>
&gt;<br>
&gt; Warnings:<br>
&gt;=C2=A0 =C2=A0 =C2=A0cc1: some warnings being treated as errors<br>
&gt;<br>
&gt; ---------------------------------------------------------------------=
-----------<br>
&gt; allmodconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 21 warnings, 0 se=
ction mismatches<br>
&gt;<br>
&gt; Warnings:<br>
&gt;=C2=A0 =C2=A0 =C2=A0/tmp/ccgeLqJj.s:18119: Warning: using r15 results =
in unpredictable behaviour<br>
&gt;=C2=A0 =C2=A0 =C2=A0/tmp/ccgeLqJj.s:18191: Warning: using r15 results =
in unpredictable behaviour<br>
&gt;=C2=A0 =C2=A0 =C2=A0drivers/net/phy/mdio-cavium.h:114:37: warning: cas=
t to pointer from integer of different size [-Wint-to-pointer-cast]<br>
&gt;=C2=A0 =C2=A0 =C2=A0drivers/net/phy/mdio-cavium.h:113:48: warning: cas=
t to pointer from integer of different size [-Wint-to-pointer-cast]<br>
&gt;=C2=A0 =C2=A0 =C2=A0drivers/net/phy/mdio-cavium.h:113:48: warning: cas=
t to pointer from integer of different size [-Wint-to-pointer-cast]<br>
&gt;=C2=A0 =C2=A0 =C2=A0drivers/net/phy/mdio-cavium.h:113:48: warning: cas=
t to pointer from integer of different size [-Wint-to-pointer-cast]<br>
&gt;=C2=A0 =C2=A0 =C2=A0drivers/net/phy/mdio-cavium.h:114:37: warning: cas=
t to pointer from integer of different size [-Wint-to-pointer-cast]<br>
&gt;=C2=A0 =C2=A0 =C2=A0drivers/net/phy/mdio-cavium.h:113:48: warning: cas=
t to pointer from integer of different size [-Wint-to-pointer-cast]<br>
&gt;=C2=A0 =C2=A0 =C2=A0drivers/net/phy/mdio-cavium.h:114:37: warning: cas=
t to pointer from integer of different size [-Wint-to-pointer-cast]<br>
&gt;=C2=A0 =C2=A0 =C2=A0drivers/net/phy/mdio-cavium.h:113:48: warning: cas=
t to pointer from integer of different size [-Wint-to-pointer-cast]<br>
&gt;=C2=A0 =C2=A0 =C2=A0drivers/net/phy/mdio-cavium.h:113:48: warning: cas=
t to pointer from integer of different size [-Wint-to-pointer-cast]<br>
&gt;=C2=A0 =C2=A0 =C2=A0drivers/net/phy/mdio-cavium.h:114:37: warning: cas=
t to pointer from integer of different size [-Wint-to-pointer-cast]<br>
&gt;=C2=A0 =C2=A0 =C2=A0drivers/net/phy/mdio-octeon.c:48:3: warning: cast =
from pointer to integer of different size [-Wpointer-to-int-cast]<br>
&gt;=C2=A0 =C2=A0 =C2=A0drivers/net/phy/mdio-cavium.h:113:48: warning: cas=
t to pointer from integer of different size [-Wint-to-pointer-cast]<br>
&gt;=C2=A0 =C2=A0 =C2=A0drivers/net/phy/mdio-cavium.h:113:48: warning: cas=
t to pointer from integer of different size [-Wint-to-pointer-cast]<br>
&gt;=C2=A0 =C2=A0 =C2=A0drivers/net/phy/mdio-cavium.h:113:48: warning: cas=
t to pointer from integer of different size [-Wint-to-pointer-cast]<br>
&gt;=C2=A0 =C2=A0 =C2=A0drivers/soc/fsl/dpio/qbman-portal.c:870:14: warnin=
g: cast from pointer to integer of different size [-Wpointer-to-int-cast]<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dt=
s:435.11-439.4: Warning (i2c_bus_reg): /ahb/apb/bus@1e78a000/i2c-bus@140/ip=
mb0@10: I2C bus unit address format error, expected &quot;40000010&quot;<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dt=
s:437.3-30: Warning (i2c_bus_reg): /ahb/apb/bus@1e78a000/i2c-bus@140/ipmb0@=
10:reg: I2C address must be less than 10-bits, got &quot;0x40000010&quot;<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dt=
s:521.11-525.4: Warning (i2c_bus_reg): /ahb/apb/bus@1e78a000/i2c-bus@380/ip=
mb0@10: I2C bus unit address format error, expected &quot;40000010&quot;<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dt=
s:523.3-30: Warning (i2c_bus_reg): /ahb/apb/bus@1e78a000/i2c-bus@380/ipmb0@=
10:reg: I2C address must be less than 10-bits, got &quot;0x40000010&quot;<b=
r>
&gt;<br>
&gt; ---------------------------------------------------------------------=
-----------<br>
&gt; allmodconfig (arm64, clang-8) =E2=80=94 PASS, 0 errors, 81 warnings, =
0 section mismatches<br>
&gt;<br>
&gt; Warnings:<br>
&gt;=C2=A0 =C2=A0 =C2=A0fs/proc/base.c:1985:35: warning: variable &#39;wq&=
#39; is uninitialized when used within its own initialization [-Wuninitiali=
zed]<br>
&gt;=C2=A0 =C2=A0 =C2=A01 warning generated.<br>
&gt;=C2=A0 =C2=A0 =C2=A0mm/shmem.c:2745:35: warning: variable &#39;shmem_f=
alloc_waitq&#39; is uninitialized when used within its own initialization [=
-Wuninitialized]<br>
&gt;=C2=A0 =C2=A0 =C2=A01 warning generated.<br>
&gt;=C2=A0 =C2=A0 =C2=A0fs/proc/proc_sysctl.c:705:35: warning: variable &#=
39;wq&#39; is uninitialized when used within its own initialization [-Wunin=
itialized]<br>
&gt;=C2=A0 =C2=A0 =C2=A01 warning generated.<br>
&gt;=C2=A0 =C2=A0 =C2=A0fs/namei.c:1736:34: warning: variable &#39;wq&#39;=
 is uninitialized when used within its own initialization [-Wuninitialized]=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0fs/namei.c:3213:34: warning: variable &#39;wq&#39;=
 is uninitialized when used within its own initialization [-Wuninitialized]=
<br>
&gt;=C2=A0 =C2=A0 =C2=A02 warnings generated.<br>
&gt;=C2=A0 =C2=A0 =C2=A0drivers/android/binderfs.c:657:41: warning: sugges=
t braces around initialization of subobject [-Wmissing-braces]<br>
&gt;=C2=A0 =C2=A0 =C2=A01 warning generated.<br>
&gt;=C2=A0 =C2=A0 =C2=A0drivers/hwtracing/coresight/coresight-cti-sysfs.c:=
948:11: warning: address of array &#39;grp-&gt;sig_types&#39; will always e=
valuate to &#39;true&#39; [-Wpointer-bool-conversion]<br>
&gt;=C2=A0 =C2=A0 =C2=A01 warning generated.<br>
&gt;=C2=A0 =C2=A0 =C2=A0fs/afs/dir_silly.c:205:34: warning: variable &#39;=
wq&#39; is uninitialized when used within its own initialization [-Wuniniti=
alized]<br>
&gt;=C2=A0 =C2=A0 =C2=A01 warning generated.<br>
&gt;=C2=A0 =C2=A0 =C2=A0drivers/bluetooth/bluecard_cs.c:282:36: warning: v=
ariable &#39;wq&#39; is uninitialized when used within its own initializati=
on [-Wuninitialized]<br>
&gt;=C2=A0 =C2=A0 =C2=A01 warning generated.<br>
&gt;=C2=A0 =C2=A0 =C2=A0fs/cifs/readdir.c:84:34: warning: variable &#39;wq=
&#39; is uninitialized when used within its own initialization [-Wuninitial=
ized]<br>
&gt;=C2=A0 =C2=A0 =C2=A01 warning generated.<br>
&gt;=C2=A0 =C2=A0 =C2=A0drivers/gpu/host1x/syncpt.c:208:34: warning: varia=
ble &#39;wq&#39; is uninitialized when used within its own initialization [=
-Wuninitialized]<br>
&gt;=C2=A0 =C2=A0 =C2=A01 warning generated.<br>
&gt;=C2=A0 =C2=A0 =C2=A0net/nfc/hci/command.c:59:34: warning: variable &#3=
9;ew_wq&#39; is uninitialized when used within its own initialization [-Wun=
initialized]<br>
&gt;=C2=A0 =C2=A0 =C2=A01 warning generated.<br>
&gt;=C2=A0 =C2=A0 =C2=A0fs/btrfs/backref.c:394:30: warning: suggest braces=
 around initialization of subobject [-Wmissing-braces]<br>
&gt;=C2=A0 =C2=A0 =C2=A01 warning generated.<br>
&gt;=C2=A0 =C2=A0 =C2=A0net/nfc/hci/llc_shdlc.c:687:34: warning: variable =
&#39;connect_wq&#39; is uninitialized when used within its own initializati=
on [-Wuninitialized]<br>
&gt;=C2=A0 =C2=A0 =C2=A01 warning generated.<br>
&gt;=C2=A0 =C2=A0 =C2=A0fs/fuse/readdir.c:161:34: warning: variable &#39;w=
q&#39; is uninitialized when used within its own initialization [-Wuninitia=
lized]<br>
&gt;=C2=A0 =C2=A0 =C2=A01 warning generated.<br>
&gt;=C2=A0 =C2=A0 =C2=A0fs/nfs/dir.c:464:34: warning: variable &#39;wq&#39=
; is uninitialized when used within its own initialization [-Wuninitialized=
]<br>
&gt;=C2=A0 =C2=A0 =C2=A0fs/nfs/dir.c:1638:34: warning: variable &#39;wq&#3=
9; is uninitialized when used within its own initialization [-Wuninitialize=
d]<br>
&gt;=C2=A0 =C2=A0 =C2=A02 warnings generated.<br>
&gt;=C2=A0 =C2=A0 =C2=A0drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c:722:36: war=
ning: suggest braces around initialization of subobject [-Wmissing-braces]<=
br>
&gt;=C2=A0 =C2=A0 =C2=A01 warning generated.<br>
&gt;=C2=A0 =C2=A0 =C2=A0drivers/misc/mic/vop/vop_vringh.c:155:34: warning:=
 variable &#39;wake&#39; is uninitialized when used within its own initiali=
zation [-Wuninitialized]<br>
&gt;=C2=A0 =C2=A0 =C2=A0drivers/misc/mic/vop/vop_vringh.c:399:34: warning:=
 variable &#39;wake&#39; is uninitialized when used within its own initiali=
zation [-Wuninitialized]<br>
&gt;=C2=A0 =C2=A0 =C2=A02 warnings generated.<br>
&gt;=C2=A0 =C2=A0 =C2=A0drivers/net/ethernet/amazon/ena/ena_netdev.c:310:3=
8: warning: suggest braces around initialization of subobject [-Wmissing-br=
aces]<br>
&gt;=C2=A0 =C2=A0 =C2=A01 warning generated.<br>
&gt;=C2=A0 =C2=A0 =C2=A0drivers/net/usb/lan78xx.c:2659:34: warning: variab=
le &#39;unlink_wakeup&#39; is uninitialized when used within its own initia=
lization [-Wuninitialized]<br>
&gt;=C2=A0 =C2=A0 =C2=A01 warning generated.<br>
&gt;=C2=A0 =C2=A0 =C2=A0drivers/net/wireless/ath/ath11k/debugfs_sta.c:185:=
7: warning: variable &#39;rate_idx&#39; is used uninitialized whenever &#39=
;if&#39; condition is false [-Wsometimes-uninitialized]<br>
&gt;=C2=A0 =C2=A0 =C2=A0drivers/net/wireless/ath/ath11k/debugfs_sta.c:184:=
13: warning: variable &#39;rate_idx&#39; is used uninitialized whenever &#3=
9;if&#39; condition is false [-Wsometimes-uninitialized]<br>
&gt;=C2=A0 =C2=A0 =C2=A0drivers/net/wireless/ath/ath11k/debugfs_sta.c:175:=
7: warning: variable &#39;rate_idx&#39; is used uninitialized whenever &#39=
;if&#39; condition is false [-Wsometimes-uninitialized]<br>
&gt;=C2=A0 =C2=A0 =C2=A0drivers/net/wireless/ath/ath11k/debugfs_sta.c:139:=
13: note: initialize the variable &#39;rate_idx&#39; to silence this warnin=
g<br>
&gt;=C2=A0 =C2=A0 =C2=A03 warnings generated.<br>
&gt;=C2=A0 =C2=A0 =C2=A0drivers/scsi/bfa/bfad_im.c:301:34: warning: variab=
le &#39;wq&#39; is uninitialized when used within its own initialization [-=
Wuninitialized]<br>
&gt;=C2=A0 =C2=A0 =C2=A0drivers/scsi/bfa/bfad_im.c:378:34: warning: variab=
le &#39;wq&#39; is uninitialized when used within its own initialization [-=
Wuninitialized]<br>
&gt;=C2=A0 =C2=A0 =C2=A02 warnings generated.<br>
&gt;=C2=A0 =C2=A0 =C2=A0drivers/net/ethernet/mellanox/mlx5/core/diag/rsc_d=
ump.h:4:9: warning: &#39;__MLX5_RSC_DUMP_H&#39; is used as a header guard h=
ere, followed by #define of a different macro [-Wheader-guard]<br>
&gt;=C2=A0 =C2=A0 =C2=A01 warning generated.<br>
&gt;=C2=A0 =C2=A0 =C2=A0drivers/scsi/lpfc/lpfc_sli.c:11910:34: warning: va=
riable &#39;done_q&#39; is uninitialized when used within its own initializ=
ation [-Wuninitialized]<br>
&gt;=C2=A0 =C2=A0 =C2=A01 warning generated.<br>
&gt;=C2=A0 =C2=A0 =C2=A0drivers/scsi/lpfc/lpfc_scsi.c:4728:34: warning: va=
riable &#39;waitq&#39; is uninitialized when used within its own initializa=
tion [-Wuninitialized]<br>
&gt;=C2=A0 =C2=A0 =C2=A01 warning generated.<br>
&gt;=C2=A0 =C2=A0 =C2=A0drivers/net/ethernet/mellanox/mlx5/core/diag/rsc_d=
ump.h:4:9: warning: &#39;__MLX5_RSC_DUMP_H&#39; is used as a header guard h=
ere, followed by #define of a different macro [-Wheader-guard]<br>
&gt;=C2=A0 =C2=A0 =C2=A01 warning generated.<br>
&gt;=C2=A0 =C2=A0 =C2=A0drivers/net/ethernet/mellanox/mlx5/core/diag/rsc_d=
ump.h:4:9: warning: &#39;__MLX5_RSC_DUMP_H&#39; is used as a header guard h=
ere, followed by #define of a different macro [-Wheader-guard]<br>
&gt;=C2=A0 =C2=A0 =C2=A01 warning generated.<br>
&gt;=C2=A0 =C2=A0 =C2=A0drivers/net/ethernet/mellanox/mlx5/core/diag/rsc_d=
ump.h:4:9: warning: &#39;__MLX5_RSC_DUMP_H&#39; is used as a header guard h=
ere, followed by #define of a different macro [-Wheader-guard]<br>
&gt;=C2=A0 =C2=A0 =C2=A01 warning generated.<br>
&gt;=C2=A0 =C2=A0 =C2=A0drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/am=
dgpu_dm.c:8558:43: warning: suggest braces around initialization of subobje=
ct [-Wmissing-braces]<br>
&gt;=C2=A0 =C2=A0 =C2=A01 warning generated.<br>
&gt;=C2=A0 =C2=A0 =C2=A0drivers/net/ethernet/mellanox/mlx5/core/diag/rsc_d=
ump.h:4:9: warning: &#39;__MLX5_RSC_DUMP_H&#39; is used as a header guard h=
ere, followed by #define of a different macro [-Wheader-guard]<br>
&gt;=C2=A0 =C2=A0 =C2=A01 warning generated.<br>
&gt;=C2=A0 =C2=A0 =C2=A0drivers/net/ethernet/mellanox/mlx5/core/diag/rsc_d=
ump.h:4:9: warning: &#39;__MLX5_RSC_DUMP_H&#39; is used as a header guard h=
ere, followed by #define of a different macro [-Wheader-guard]<br>
&gt;=C2=A0 =C2=A0 =C2=A01 warning generated.<br>
&gt;=C2=A0 =C2=A0 =C2=A0drivers/net/ethernet/mellanox/mlx5/core/diag/rsc_d=
ump.h:4:9: warning: &#39;__MLX5_RSC_DUMP_H&#39; is used as a header guard h=
ere, followed by #define of a different macro [-Wheader-guard]<br>
&gt;=C2=A0 =C2=A0 =C2=A01 warning generated.<br>
&gt;=C2=A0 =C2=A0 =C2=A0drivers/gpu/drm/amd/amdgpu/../display/dc/bios/comm=
and_table2.c:116:62: warning: suggest braces around initialization of subob=
ject [-Wmissing-braces]<br>
&gt;=C2=A0 =C2=A0 =C2=A0drivers/gpu/drm/amd/amdgpu/../display/dc/bios/comm=
and_table2.c:342:53: warning: suggest braces around initialization of subob=
ject [-Wmissing-braces]<br>
&gt;=C2=A0 =C2=A0 =C2=A02 warnings generated.<br>
&gt;=C2=A0 =C2=A0 =C2=A0drivers/gpu/drm/amd/amdgpu/../display/dc/bios/bios=
_parser2.c:297:41: warning: suggest braces around initialization of subobje=
ct [-Wmissing-braces]<br>
&gt;=C2=A0 =C2=A0 =C2=A01 warning generated.<br>
&gt;=C2=A0 =C2=A0 =C2=A0drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dmub_=
psr.c:147:31: warning: address of &#39;pipe_ctx-&gt;plane_res&#39; will alw=
ays evaluate to &#39;true&#39; [-Wpointer-bool-conversion]<br>
&gt;=C2=A0 =C2=A0 =C2=A0drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dmub_=
psr.c:147:56: warning: address of &#39;pipe_ctx-&gt;stream_res&#39; will al=
ways evaluate to &#39;true&#39; [-Wpointer-bool-conversion]<br>
&gt;=C2=A0 =C2=A0 =C2=A02 warnings generated.<br>
&gt;=C2=A0 =C2=A0 =C2=A0drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_l=
ink_dp.c:2690:53: warning: suggest braces around initialization of subobjec=
t [-Wmissing-braces]<br>
&gt;=C2=A0 =C2=A0 =C2=A0drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_l=
ink_dp.c:2692:80: warning: suggest braces around initialization of subobjec=
t [-Wmissing-braces]<br>
&gt;=C2=A0 =C2=A0 =C2=A0drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_l=
ink_dp.c:2692:80: warning: suggest braces around initialization of subobjec=
t [-Wmissing-braces]<br>
&gt;=C2=A0 =C2=A0 =C2=A03 warnings generated.<br>
&gt;<br>
&gt; ---------------------------------------------------------------------=
-----------<br>
&gt; allmodconfig (arm64, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches<br>
&gt;<br>
&gt; ---------------------------------------------------------------------=
-----------<br>
&gt; allmodconfig (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches<br>
&gt;<br>
&gt; ---------------------------------------------------------------------=
-----------<br>
&gt; allnoconfig (riscv, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches<br>
&gt;<br>
&gt; ---------------------------------------------------------------------=
-----------<br>
&gt; allnoconfig (arm64, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches<br>
&gt;<br>
&gt; ---------------------------------------------------------------------=
-----------<br>
&gt; allnoconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches<br>
&gt;<br>
&gt; ---------------------------------------------------------------------=
-----------<br>
&gt; allnoconfig (arc, gcc-8) =E2=80=94 FAIL, 1 error, 1 warning, 0 sectio=
n mismatches<br>
&gt;<br>
&gt; Errors:<br>
&gt;=C2=A0 =C2=A0 =C2=A0mm/memory.c:1523:41: error: implicit declaration o=
f function =E2=80=98pte_index=E2=80=99; did you mean =E2=80=98page_index=E2=
=
=80=99? [-Werror=3Dimplicit-function-declaration]<br>
&gt;<br>
&gt; Warnings:<br>
&gt;=C2=A0 =C2=A0 =C2=A0cc1: some warnings being treated as errors<br>
&gt;<br>
&gt; ---------------------------------------------------------------------=
-----------<br>
&gt; allnoconfig (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches<br>
&gt;<br>
&gt; ---------------------------------------------------------------------=
-----------<br>
&gt; allnoconfig (mips, gcc-8) =E2=80=94 FAIL, 1 error, 1 warning, 0 secti=
on mismatches<br>
&gt;<br>
&gt; Errors:<br>
&gt;=C2=A0 =C2=A0 =C2=A0mm/memory.c:1523:41: error: implicit declaration o=
f function =E2=80=98pte_index=E2=80=99; did you mean =E2=80=98page_index=E2=
=
=80=99? [-Werror=3Dimplicit-function-declaration]<br>
&gt;<br>
&gt; Warnings:<br>
&gt;=C2=A0 =C2=A0 =C2=A0cc1: some warnings being treated as errors<br>
&gt;<br>
&gt; ---------------------------------------------------------------------=
-----------<br>
&gt; allnoconfig (i386, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches<br>
&gt;<br>
&gt; ---------------------------------------------------------------------=
-----------<br>
&gt; allnoconfig (arm64, clang-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches<br>
&gt;<br>
&gt; ---------------------------------------------------------------------=
-----------<br>
&gt; am200epdkit_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnin=
gs, 0 section mismatches<br>
&gt;<br>
&gt; ---------------------------------------------------------------------=
-----------<br>
&gt; ar7_defconfig (mips, gcc-8) =E2=80=94 FAIL, 1 error, 1 warning, 0 sec=
tion mismatches<br>
&gt;<br>
&gt; Errors:<br>
&gt;=C2=A0 =C2=A0 =C2=A0mm/memory.c:1523:41: error: implicit declaration o=
f function =E2=80=98pte_index=E2=80=99; did you mean =E2=80=98page_index=E2=
=
=80=99? [-Werror=3Dimplicit-function-declaration]<br>
&gt;<br>
&gt; Warnings:<br>
&gt;=C2=A0 =C2=A0 =C2=A0cc1: some warnings being treated as errors<br>
&gt;<br>
&gt; ---------------------------------------------------------------------=
-----------<br>
&gt; aspeed_g4_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings=
, 0 section mismatches<br>
&gt;<br>
&gt; Warnings:<br>
&gt;=C2=A0 =C2=A0 =C2=A0arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dt=
s:435.11-439.4: Warning (i2c_bus_reg): /ahb/apb/bus@1e78a000/i2c-bus@140/ip=
mb0@10: I2C bus unit address format error, expected &quot;40000010&quot;<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dt=
s:437.3-30: Warning (i2c_bus_reg): /ahb/apb/bus@1e78a000/i2c-bus@140/ipmb0@=
10:reg: I2C address must be less than 10-bits, got &quot;0x40000010&quot;<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dt=
s:521.11-525.4: Warning (i2c_bus_reg): /ahb/apb/bus@1e78a000/i2c-bus@380/ip=
mb0@10: I2C bus unit address format error, expected &quot;40000010&quot;<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dt=
s:523.3-30: Warning (i2c_bus_reg): /ahb/apb/bus@1e78a000/i2c-bus@380/ipmb0@=
10:reg: I2C address must be less than 10-bits, got &quot;0x40000010&quot;<b=
r>
&gt;<br>
&gt; ---------------------------------------------------------------------=
-----------<br>
&gt; aspeed_g5_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings=
, 0 section mismatches<br>
&gt;<br>
&gt; Warnings:<br>
&gt;=C2=A0 =C2=A0 =C2=A0arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dt=
s:435.11-439.4: Warning (i2c_bus_reg): /ahb/apb/bus@1e78a000/i2c-bus@140/ip=
mb0@10: I2C bus unit address format error, expected &quot;40000010&quot;<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dt=
s:437.3-30: Warning (i2c_bus_reg): /ahb/apb/bus@1e78a000/i2c-bus@140/ipmb0@=
10:reg: I2C address must be less than 10-bits, got &quot;0x40000010&quot;<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dt=
s:521.11-525.4: Warning (i2c_bus_reg): /ahb/apb/bus@1e78a000/i2c-bus@380/ip=
mb0@10: I2C bus unit address format error, expected &quot;40000010&quot;<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dt=
s:523.3-30: Warning (i2c_bus_reg): /ahb/apb/bus@1e78a000/i2c-bus@380/ipmb0@=
10:reg: I2C address must be less than 10-bits, got &quot;0x40000010&quot;<b=
r>
&gt;<br>
&gt; ---------------------------------------------------------------------=
-----------<br>
&gt; assabet_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, =
0 section mismatches<br>
&gt;<br>
&gt; ---------------------------------------------------------------------=
-----------<br>
&gt; at91_dt_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, =
0 section mismatches<br>
&gt;<br>
&gt; ---------------------------------------------------------------------=
-----------<br>
&gt; ath25_defconfig (mips, gcc-8) =E2=80=94 FAIL, 1 error, 1 warning, 0 s=
ection mismatches<br>
&gt;<br>
&gt; Errors:<br>
&gt;=C2=A0 =C2=A0 =C2=A0mm/memory.c:1523:41: error: implicit declaration o=
f function =E2=80=98pte_index=E2=80=99; did you mean =E2=80=98page_index=E2=
=
=80=99? [-Werror=3Dimplicit-function-declaration]<br>
&gt;<br>
&gt; Warnings:<br>
&gt;=C2=A0 =C2=A0 =C2=A0cc1: some warnings being treated as errors<br>
&gt;<br>
&gt; ---------------------------------------------------------------------=
-----------<br>
&gt; ath79_defconfig (mips, gcc-8) =E2=80=94 FAIL, 1 error, 1 warning, 0 s=
ection mismatches<br>
&gt;<br>
&gt; Errors:<br>
&gt;=C2=A0 =C2=A0 =C2=A0mm/memory.c:1523:41: error: implicit declaration o=
f function =E2=80=98pte_index=E2=80=99; did you mean =E2=80=98page_index=E2=
=
=80=99? [-Werror=3Dimplicit-function-declaration]<br>
&gt;<br>
&gt; Warnings:<br>
&gt;=C2=A0 =C2=A0 =C2=A0cc1: some warnings being treated as errors<br>
&gt;<br>
&gt; ---------------------------------------------------------------------=
-----------<br>
&gt; axm55xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, =
0 section mismatches<br>
&gt;<br>
&gt; ---------------------------------------------------------------------=
-----------<br>
&gt; axs103_defconfig (arc, gcc-8) =E2=80=94 FAIL, 1 error, 1 warning, 0 s=
ection mismatches<br>
&gt;<br>
&gt; Errors:<br>
&gt;=C2=A0 =C2=A0 =C2=A0mm/memory.c:1523:41: error: implicit declaration o=
f function =E2=80=98pte_index=E2=80=99; did you mean =E2=80=98page_index=E2=
=
=80=99? [-Werror=3Dimplicit-function-declaration]<br>
&gt;<br>
&gt; Warnings:<br>
&gt;=C2=A0 =C2=A0 =C2=A0cc1: some warnings being treated as errors<br>
&gt;<br>
&gt; ---------------------------------------------------------------------=
-----------<br>
&gt; axs103_smp_defconfig (arc, gcc-8) =E2=80=94 FAIL, 1 error, 1 warning,=
 0 section mismatches<br>
&gt;<br>
&gt; Errors:<br>
&gt;=C2=A0 =C2=A0 =C2=A0mm/memory.c:1523:41: error: implicit declaration o=
f function =E2=80=98pte_index=E2=80=99; did you mean =E2=80=98page_index=E2=
=
=80=99? [-Werror=3Dimplicit-function-declaration]<br>
&gt;<br>
&gt; Warnings:<br>
&gt;=C2=A0 =C2=A0 =C2=A0cc1: some warnings being treated as errors<br>
&gt;<br>
&gt; ---------------------------------------------------------------------=
-----------<br>
&gt; badge4_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches<br>
&gt;<br>
&gt; ---------------------------------------------------------------------=
-----------<br>
&gt; bcm2835_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, =
0 section mismatches<br>
&gt;<br>
&gt; ---------------------------------------------------------------------=
-----------<br>
&gt; bcm47xx_defconfig (mips, gcc-8) =E2=80=94 FAIL, 1 error, 1 warning, 0=
 section mismatches<br>
&gt;<br>
&gt; Errors:<br>
&gt;=C2=A0 =C2=A0 =C2=A0mm/memory.c:1523:41: error: implicit declaration o=
f function =E2=80=98pte_index=E2=80=99; did you mean =E2=80=98page_index=E2=
=
=80=99? [-Werror=3Dimplicit-function-declaration]<br>
&gt;<br>
&gt; Warnings:<br>
&gt;=C2=A0 =C2=A0 =C2=A0cc1: some warnings being treated as errors<br>
&gt;<br>
&gt; ---------------------------------------------------------------------=
-----------<br>
&gt; bcm63xx_defconfig (mips, gcc-8) =E2=80=94 FAIL, 1 error, 1 warning, 0=
 section mismatches<br>
&gt;<br>
&gt; Errors:<br>
&gt;=C2=A0 =C2=A0 =C2=A0mm/memory.c:1523:41: error: implicit declaration o=
f function =E2=80=98pte_index=E2=80=99; did you mean =E2=80=98page_index=E2=
=
=80=99? [-Werror=3Dimplicit-function-declaration]<br>
&gt;<br>
&gt; Warnings:<br>
&gt;=C2=A0 =C2=A0 =C2=A0cc1: some warnings being treated as errors<br>
&gt;<br>
&gt; ---------------------------------------------------------------------=
-----------<br>
&gt; bigsur_defconfig (mips, gcc-8) =E2=80=94 FAIL, 1 error, 1 warning, 0 =
section mismatches<br>
&gt;<br>
&gt; Errors:<br>
&gt;=C2=A0 =C2=A0 =C2=A0mm/memory.c:1523:41: error: implicit declaration o=
f function =E2=80=98pte_index=E2=80=99; did you mean =E2=80=98page_index=E2=
=
=80=99? [-Werror=3Dimplicit-function-declaration]<br>
&gt;<br>
&gt; Warnings:<br>
&gt;=C2=A0 =C2=A0 =C2=A0cc1: some warnings being treated as errors<br>
&gt;<br>
&gt; ---------------------------------------------------------------------=
-----------<br>
&gt; bmips_be_defconfig (mips, gcc-8) =E2=80=94 FAIL, 1 error, 1 warning, =
0 section mismatches<br>
&gt;<br>
&gt; Errors:<br>
&gt;=C2=A0 =C2=A0 =C2=A0mm/memory.c:1523:41: error: implicit declaration o=
f function =E2=80=98pte_index=E2=80=99; did you mean =E2=80=98page_index=E2=
=
=80=99? [-Werror=3Dimplicit-function-declaration]<br>
&gt;<br>
&gt; Warnings:<br>
&gt;=C2=A0 =C2=A0 =C2=A0cc1: some warnings being treated as errors<br>
&gt;<br>
&gt; ---------------------------------------------------------------------=
-----------<br>
&gt; bmips_stb_defconfig (mips, gcc-8) =E2=80=94 FAIL, 1 error, 1 warning,=
 0 section mismatches<br>
&gt;<br>
&gt; Errors:<br>
&gt;=C2=A0 =C2=A0 =C2=A0mm/memory.c:1523:41: error: implicit declaration o=
f function =E2=80=98pte_index=E2=80=99; did you mean =E2=80=98page_index=E2=
=
=80=99? [-Werror=3Dimplicit-function-declaration]<br>
&gt;<br>
&gt; Warnings:<br>
&gt;=C2=A0 =C2=A0 =C2=A0cc1: some warnings being treated as errors<br>
&gt;<br>
&gt; ---------------------------------------------------------------------=
-----------<br>
&gt; capcella_defconfig (mips, gcc-8) =E2=80=94 FAIL, 1 error, 1 warning, =
0 section mismatches<br>
&gt;<br>
&gt; Errors:<br>
&gt;=C2=A0 =C2=A0 =C2=A0mm/memory.c:1523:41: error: implicit declaration o=
f function =E2=80=98pte_index=E2=80=99; did you mean =E2=80=98page_index=E2=
=
=80=99? [-Werror=3Dimplicit-function-declaration]<br>
&gt;<br>
&gt; Warnings:<br>
&gt;=C2=A0 =C2=A0 =C2=A0cc1: some warnings being treated as errors<br>
&gt;<br>
&gt; ---------------------------------------------------------------------=
-----------<br>
&gt; cavium_octeon_defconfig (mips, gcc-8) =E2=80=94 FAIL, 1 error, 1 warn=
ing, 0 section mismatches<br>
&gt;<br>
&gt; Errors:<br>
&gt;=C2=A0 =C2=A0 =C2=A0mm/memory.c:1523:41: error: implicit declaration o=
f function =E2=80=98pte_index=E2=80=99; did you mean =E2=80=98page_index=E2=
=
=80=99? [-Werror=3Dimplicit-function-declaration]<br>
&gt;<br>
&gt; Warnings:<br>
&gt;=C2=A0 =C2=A0 =C2=A0cc1: some warnings being treated as errors<br>
&gt;<br>
&gt; ---------------------------------------------------------------------=
-----------<br>
&gt; cerfcube_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings,=
 0 section mismatches<br>
&gt;<br>
&gt; ---------------------------------------------------------------------=
-----------<br>
&gt; ci20_defconfig (mips, gcc-8) =E2=80=94 FAIL, 1 error, 1 warning, 0 se=
ction mismatches<br>
&gt;<br>
&gt; Errors:<br>
&gt;=C2=A0 =C2=A0 =C2=A0mm/memory.c:1523:41: error: implicit declaration o=
f function =E2=80=98pte_index=E2=80=99; did you mean =E2=80=98page_index=E2=
=
=80=99? [-Werror=3Dimplicit-function-declaration]<br>
&gt;<br>
&gt; Warnings:<br>
&gt;=C2=A0 =C2=A0 =C2=A0cc1: some warnings being treated as errors<br>
&gt;<br>
&gt; ---------------------------------------------------------------------=
-----------<br>
&gt; clps711x_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings,=
 0 section mismatches<br>
&gt;<br>
&gt; ---------------------------------------------------------------------=
-----------<br>
&gt; cm_x2xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, =
0 section mismatches<br>
&gt;<br>
&gt; ---------------------------------------------------------------------=
-----------<br>
&gt; cm_x300_defconfig (arm, gcc-8) =E2=80=94 FAIL, 1 error, 2 warnings, 0=
 section mismatches<br>
&gt;<br>
&gt; Errors:<br>
&gt;=C2=A0 =C2=A0 =C2=A0ERROR: &quot;snd_ac97_reset&quot; [sound/soc/codec=
s/snd-soc-wm9712.ko] undefined!<br>
&gt;<br>
&gt; Warnings:<br>
&gt;=C2=A0 =C2=A0 =C2=A0WARNING: unmet direct dependencies detected for SN=
D_SOC_WM9712<br>
&gt;=C2=A0 =C2=A0 =C2=A0WARNING: unmet direct dependencies detected for SN=
D_SOC_WM9712<br>
&gt;<br>
&gt; ---------------------------------------------------------------------=
-----------<br>
&gt; cns3420vb_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings=
, 0 section mismatches<br>
&gt;<br>
&gt; ---------------------------------------------------------------------=
-----------<br>
&gt; cobalt_defconfig (mips, gcc-8) =E2=80=94 FAIL, 1 error, 1 warning, 0 =
section mismatches<br>
&gt;<br>
&gt; Errors:<br>
&gt;=C2=A0 =C2=A0 =C2=A0mm/memory.c:1523:41: error: implicit declaration o=
f function =E2=80=98pte_index=E2=80=99; did you mean =E2=80=98page_index=E2=
=
=80=99? [-Werror=3Dimplicit-function-declaration]<br>
&gt;<br>
&gt; Warnings:<br>
&gt;=C2=A0 =C2=A0 =C2=A0cc1: some warnings being treated as errors<br>
&gt;<br>
&gt; ---------------------------------------------------------------------=
-----------<br>
&gt; colibri_pxa270_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 war=
nings, 0 section mismatches<br>
&gt;<br>
&gt; ---------------------------------------------------------------------=
-----------<br>
&gt; colibri_pxa300_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 war=
nings, 0 section mismatches<br>
&gt;<br>
&gt; ---------------------------------------------------------------------=
-----------<br>
&gt; collie_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches<br>
&gt;<br>
&gt; ---------------------------------------------------------------------=
-----------<br>
&gt; corgi_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches<br>
&gt;<br>
&gt; ---------------------------------------------------------------------=
-----------<br>
&gt; cu1000-neo_defconfig (mips, gcc-8) =E2=80=94 FAIL, 1 error, 1 warning=
, 0 section mismatches<br>
&gt;<br>
&gt; Errors:<br>
&gt;=C2=A0 =C2=A0 =C2=A0mm/memory.c:1523:41: error: implicit declaration o=
f function =E2=80=98pte_index=E2=80=99; did you mean =E2=80=98page_index=E2=
=
=80=99? [-Werror=3Dimplicit-function-declaration]<br>
&gt;<br>
&gt; Warnings:<br>
&gt;=C2=A0 =C2=A0 =C2=A0cc1: some warnings being treated as errors<br>
&gt;<br>
&gt; ---------------------------------------------------------------------=
-----------<br>
&gt; davinci_all_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnin=
gs, 0 section mismatches<br>
&gt;<br>
&gt; ---------------------------------------------------------------------=
-----------<br>
&gt; db1xxx_defconfig (mips, gcc-8) =E2=80=94 FAIL, 1 error, 1 warning, 0 =
section mismatches<br>
&gt;<br>
&gt; Errors:<br>
&gt;=C2=A0 =C2=A0 =C2=A0mm/memory.c:1523:41: error: implicit declaration o=
f function =E2=80=98pte_index=E2=80=99; did you mean =E2=80=98page_index=E2=
=
=80=99? [-Werror=3Dimplicit-function-declaration]<br>
&gt;<br>
&gt; Warnings:<br>
&gt;=C2=A0 =C2=A0 =C2=A0cc1: some warnings being treated as errors<br>
&gt;<br>
&gt; ---------------------------------------------------------------------=
-----------<br>
&gt; decstation_64_defconfig (mips, gcc-8) =E2=80=94 FAIL, 1 error, 1 warn=
ing, 0 section mismatches<br>
&gt;<br>
&gt; Errors:<br>
&gt;=C2=A0 =C2=A0 =C2=A0mm/memory.c:1523:41: error: implicit declaration o=
f function =E2=80=98pte_index=E2=80=99; did you mean =E2=80=98page_index=E2=
=
=80=99? [-Werror=3Dimplicit-function-declaration]<br>
&gt;<br>
&gt; Warnings:<br>
&gt;=C2=A0 =C2=A0 =C2=A0cc1: some warnings being treated as errors<br>
&gt;<br>
&gt; ---------------------------------------------------------------------=
-----------<br>
&gt; decstation_defconfig (mips, gcc-8) =E2=80=94 FAIL, 1 error, 1 warning=
, 0 section mismatches<br>
&gt;<br>
&gt; Errors:<br>
&gt;=C2=A0 =C2=A0 =C2=A0mm/memory.c:1523:41: error: implicit declaration o=
f function =E2=80=98pte_index=E2=80=99; did you mean =E2=80=98page_index=E2=
=
=80=99? [-Werror=3Dimplicit-function-declaration]<br>
&gt;<br>
&gt; Warnings:<br>
&gt;=C2=A0 =C2=A0 =C2=A0cc1: some warnings being treated as errors<br>
&gt;<br>
&gt; ---------------------------------------------------------------------=
-----------<br>
&gt; decstation_r4k_defconfig (mips, gcc-8) =E2=80=94 FAIL, 1 error, 1 war=
ning, 0 section mismatches<br>
&gt;<br>
&gt; Errors:<br>
&gt;=C2=A0 =C2=A0 =C2=A0mm/memory.c:1523:41: error: implicit declaration o=
f function =E2=80=98pte_index=E2=80=99; did you mean =E2=80=98page_index=E2=
=
=80=99? [-Werror=3Dimplicit-function-declaration]<br>
&gt;<br>
&gt; Warnings:<br>
&gt;=C2=A0 =C2=A0 =C2=A0cc1: some warnings being treated as errors<br>
&gt;<br>
&gt; ---------------------------------------------------------------------=
-----------<br>
&gt; defconfig (arm64, clang-8) =E2=80=94 PASS, 0 errors, 18 warnings, 0 s=
ection mismatches<br>
&gt;<br>
&gt; Warnings:<br>
&gt;=C2=A0 =C2=A0 =C2=A0fs/btrfs/backref.c:394:30: warning: suggest braces=
 around initialization of subobject [-Wmissing-braces]<br>
&gt;=C2=A0 =C2=A0 =C2=A01 warning generated.<br>
&gt;=C2=A0 =C2=A0 =C2=A0drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c:722:36: war=
ning: suggest braces around initialization of subobject [-Wmissing-braces]<=
br>
&gt;=C2=A0 =C2=A0 =C2=A01 warning generated.<br>
&gt;=C2=A0 =C2=A0 =C2=A0drivers/net/ethernet/mellanox/mlx5/core/diag/rsc_d=
ump.h:4:9: warning: &#39;__MLX5_RSC_DUMP_H&#39; is used as a header guard h=
ere, followed by #define of a different macro [-Wheader-guard]<br>
&gt;=C2=A0 =C2=A0 =C2=A01 warning generated.<br>
&gt;=C2=A0 =C2=A0 =C2=A0drivers/net/ethernet/mellanox/mlx5/core/diag/rsc_d=
ump.h:4:9: warning: &#39;__MLX5_RSC_DUMP_H&#39; is used as a header guard h=
ere, followed by #define of a different macro [-Wheader-guard]<br>
&gt;=C2=A0 =C2=A0 =C2=A01 warning generated.<br>
&gt;=C2=A0 =C2=A0 =C2=A0drivers/net/ethernet/mellanox/mlx5/core/diag/rsc_d=
ump.h:4:9: warning: &#39;__MLX5_RSC_DUMP_H&#39; is used as a header guard h=
ere, followed by #define of a different macro [-Wheader-guard]<br>
&gt;=C2=A0 =C2=A0 =C2=A01 warning generated.<br>
&gt;=C2=A0 =C2=A0 =C2=A0drivers/net/ethernet/mellanox/mlx5/core/diag/rsc_d=
ump.h:4:9: warning: &#39;__MLX5_RSC_DUMP_H&#39; is used as a header guard h=
ere, followed by #define of a different macro [-Wheader-guard]<br>
&gt;=C2=A0 =C2=A0 =C2=A01 warning generated.<br>
&gt;=C2=A0 =C2=A0 =C2=A0drivers/net/ethernet/mellanox/mlx5/core/diag/rsc_d=
ump.h:4:9: warning: &#39;__MLX5_RSC_DUMP_H&#39; is used as a header guard h=
ere, followed by #define of a different macro [-Wheader-guard]<br>
&gt;=C2=A0 =C2=A0 =C2=A01 warning generated.<br>
&gt;=C2=A0 =C2=A0 =C2=A0drivers/net/ethernet/mellanox/mlx5/core/diag/rsc_d=
ump.h:4:9: warning: &#39;__MLX5_RSC_DUMP_H&#39; is used as a header guard h=
ere, followed by #define of a different macro [-Wheader-guard]<br>
&gt;=C2=A0 =C2=A0 =C2=A01 warning generated.<br>
&gt;=C2=A0 =C2=A0 =C2=A0drivers/net/ethernet/mellanox/mlx5/core/diag/rsc_d=
ump.h:4:9: warning: &#39;__MLX5_RSC_DUMP_H&#39; is used as a header guard h=
ere, followed by #define of a different macro [-Wheader-guard]<br>
&gt;=C2=A0 =C2=A0 =C2=A01 warning generated.<br>
&gt;<br>
&gt; ---------------------------------------------------------------------=
-----------<br>
&gt; defconfig (riscv, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches<br>
&gt;<br>
&gt; ---------------------------------------------------------------------=
-----------<br>
&gt; defconfig (arm64, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches<br>
&gt;<br>
&gt; Warnings:<br>
&gt;=C2=A0 =C2=A0 =C2=A0kernel/sched/fair.c:1524:20: warning: =E2=80=98tes=
t_idle_cores=E2=80=99 declared =E2=80=98static=E2=80=99 but never defined [=
-Wunused-function]<br>
&gt;<br>
&gt; ---------------------------------------------------------------------=
-----------<br>
&gt; defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy (arm64, gcc-8) =E2=80=94 PASS, 0 =
errors, 1 warning, 0 section mismatches<br>
&gt;<br>
&gt; Warnings:<br>
&gt;=C2=A0 =C2=A0 =C2=A0kernel/sched/fair.c:1524:20: warning: =E2=80=98tes=
t_idle_cores=E2=80=99 declared =E2=80=98static=E2=80=99 but never defined [=
-Wunused-function]<br>
&gt;<br>
&gt; ---------------------------------------------------------------------=
-----------<br>
&gt; defconfig+CONFIG_RANDOMIZE_BASE=3Dy (arm64, gcc-8) =E2=80=94 PASS, 0 =
errors, 1 warning, 0 section mismatches<br>
&gt;<br>
&gt; Warnings:<br>
&gt;=C2=A0 =C2=A0 =C2=A0kernel/sched/fair.c:1524:20: warning: =E2=80=98tes=
t_idle_cores=E2=80=99 declared =E2=80=98static=E2=80=99 but never defined [=
-Wunused-function]<br>
&gt;<br>
&gt; ---------------------------------------------------------------------=
-----------<br>
&gt; defconfig+kselftest (riscv, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnin=
gs, 0 section mismatches<br>
&gt;<br>
&gt; ---------------------------------------------------------------------=
-----------<br>
&gt; defconfig+kselftest (arm64, gcc-8) =E2=80=94 PASS, 0 errors, 1 warnin=
g, 0 section mismatches<br>
&gt;<br>
&gt; Warnings:<br>
&gt;=C2=A0 =C2=A0 =C2=A0kernel/sched/fair.c:1524:20: warning: =E2=80=98tes=
t_idle_cores=E2=80=99 declared =E2=80=98static=E2=80=99 but never defined [=
-Wunused-function]<br>
&gt;<br>
&gt; ---------------------------------------------------------------------=
-----------<br>
&gt; dove_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches<br>
&gt;<br>
&gt; ---------------------------------------------------------------------=
-----------<br>
&gt; e55_defconfig (mips, gcc-8) =E2=80=94 FAIL, 1 error, 1 warning, 0 sec=
tion mismatches<br>
&gt;<br>
&gt; Errors:<br>
&gt;=C2=A0 =C2=A0 =C2=A0mm/memory.c:1523:41: error: implicit declaration o=
f function =E2=80=98pte_index=E2=80=99; did you mean =E2=80=98page_index=E2=
=
=80=99? [-Werror=3Dimplicit-function-declaration]<br>
&gt;<br>
&gt; Warnings:<br>
&gt;=C2=A0 =C2=A0 =C2=A0cc1: some warnings being treated as errors<br>
&gt;<br>
&gt; ---------------------------------------------------------------------=
-----------<br>
&gt; ebsa110_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, =
0 section mismatches<br>
&gt;<br>
&gt; ---------------------------------------------------------------------=
-----------<br>
&gt; efm32_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches<br>
&gt;<br>
&gt; ---------------------------------------------------------------------=
-----------<br>
&gt; em_x270_defconfig (arm, gcc-8) =E2=80=94 FAIL, 1 error, 2 warnings, 0=
 section mismatches<br>
&gt;<br>
&gt; Errors:<br>
&gt;=C2=A0 =C2=A0 =C2=A0ERROR: &quot;snd_ac97_reset&quot; [sound/soc/codec=
s/snd-soc-wm9712.ko] undefined!<br>
&gt;<br>
&gt; Warnings:<br>
&gt;=C2=A0 =C2=A0 =C2=A0WARNING: unmet direct dependencies detected for SN=
D_SOC_WM9712<br>
&gt;=C2=A0 =C2=A0 =C2=A0WARNING: unmet direct dependencies detected for SN=
D_SOC_WM9712<br>
&gt;<br>
&gt; ---------------------------------------------------------------------=
-----------<br>
&gt; ep93xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches<br>
&gt;<br>
&gt; ---------------------------------------------------------------------=
-----------<br>
&gt; eseries_pxa_defconfig (arm, gcc-8) =E2=80=94 FAIL, 14 errors, 12 warn=
ings, 0 section mismatches<br>
&gt;<br>
&gt; Errors:<br>
&gt;=C2=A0 =C2=A0 =C2=A0sound/soc/codecs/wm9712.c:80:10: error: implicit d=
eclaration of function =E2=80=98regmap_ac97_default_volatile=E2=80=99 [-Wer=
ror=3Dimplicit-function-declaration]<br>
&gt;=C2=A0 =C2=A0 =C2=A0sound/soc/codecs/wm9712.c:84:21: error: variable =
=E2=80=98wm9712_regmap_config=E2=80=99 has initializer but incomplete type=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0sound/soc/codecs/wm9712.c:85:3: error: =E2=80=98co=
nst struct regmap_config=E2=80=99 has no member named =E2=80=98reg_bits=E2=
=80=99<br>
&gt;=C2=A0 =C2=A0 =C2=A0sound/soc/codecs/wm9712.c:86:3: error: =E2=80=98co=
nst struct regmap_config=E2=80=99 has no member named =E2=80=98reg_stride=
=E2=80=99<br>
&gt;=C2=A0 =C2=A0 =C2=A0sound/soc/codecs/wm9712.c:87:3: error: =E2=80=98co=
nst struct regmap_config=E2=80=99 has no member named =E2=80=98val_bits=E2=
=80=99<br>
&gt;=C2=A0 =C2=A0 =C2=A0sound/soc/codecs/wm9712.c:88:3: error: =E2=80=98co=
nst struct regmap_config=E2=80=99 has no member named =E2=80=98max_register=
=
=E2=80=99<br>
&gt;=C2=A0 =C2=A0 =C2=A0sound/soc/codecs/wm9712.c:89:3: error: =E2=80=98co=
nst struct regmap_config=E2=80=99 has no member named =E2=80=98cache_type=
=E2=80=99<br>
&gt;=C2=A0 =C2=A0 =C2=A0sound/soc/codecs/wm9712.c:91:3: error: =E2=80=98co=
nst struct regmap_config=E2=80=99 has no member named =E2=80=98volatile_reg=
=
=E2=80=99<br>
&gt;=C2=A0 =C2=A0 =C2=A0sound/soc/codecs/wm9712.c:93:3: error: =E2=80=98co=
nst struct regmap_config=E2=80=99 has no member named =E2=80=98reg_defaults=
=
=E2=80=99<br>
&gt;=C2=A0 =C2=A0 =C2=A0sound/soc/codecs/wm9712.c:94:3: error: =E2=80=98co=
nst struct regmap_config=E2=80=99 has no member named =E2=80=98num_reg_defa=
ults=E2=80=99<br>
&gt;=C2=A0 =C2=A0 =C2=A0sound/soc/codecs/wm9712.c:653:12: error: implicit =
declaration of function =E2=80=98regmap_init_ac97=E2=80=99; did you mean =
=E2=80=98memmap_init_zone=E2=80=99? [-Werror=3Dimplicit-function-declarati=
on]<br>
&gt;=C2=A0 =C2=A0 =C2=A0sound/soc/codecs/wm9712.c:662:2: error: implicit d=
eclaration of function =E2=80=98snd_soc_component_init_regmap=E2=80=99; did=
 you mean =E2=80=98snd_soc_component_trigger=E2=80=99? [-Werror=3Dimplicit-=
function-declaration]<br>
&gt;=C2=A0 =C2=A0 =C2=A0sound/soc/codecs/wm9712.c:675:3: error: implicit d=
eclaration of function =E2=80=98snd_soc_component_exit_regmap=E2=80=99; did=
 you mean =E2=80=98snd_soc_component_trigger=E2=80=99? [-Werror=3Dimplicit-=
function-declaration]<br>
&gt;=C2=A0 =C2=A0 =C2=A0sound/soc/codecs/wm9712.c:84:35: error: storage si=
ze of =E2=80=98wm9712_regmap_config=E2=80=99 isn=E2=80=99t known<br>
&gt;<br>
&gt; Warnings:<br>
&gt;=C2=A0 =C2=A0 =C2=A0WARNING: unmet direct dependencies detected for SN=
D_SOC_WM9712<br>
&gt;=C2=A0 =C2=A0 =C2=A0WARNING: unmet direct dependencies detected for SN=
D_SOC_WM9712<br>
&gt;=C2=A0 =C2=A0 =C2=A0sound/soc/codecs/wm9712.c:85:14: warning: excess e=
lements in struct initializer<br>
&gt;=C2=A0 =C2=A0 =C2=A0sound/soc/codecs/wm9712.c:86:16: warning: excess e=
lements in struct initializer<br>
&gt;=C2=A0 =C2=A0 =C2=A0sound/soc/codecs/wm9712.c:87:14: warning: excess e=
lements in struct initializer<br>
&gt;=C2=A0 =C2=A0 =C2=A0sound/soc/codecs/wm9712.c:88:18: warning: excess e=
lements in struct initializer<br>
&gt;=C2=A0 =C2=A0 =C2=A0sound/soc/codecs/wm9712.c:89:16: warning: excess e=
lements in struct initializer<br>
&gt;=C2=A0 =C2=A0 =C2=A0sound/soc/codecs/wm9712.c:91:18: warning: excess e=
lements in struct initializer<br>
&gt;=C2=A0 =C2=A0 =C2=A0sound/soc/codecs/wm9712.c:93:18: warning: excess e=
lements in struct initializer<br>
&gt;=C2=A0 =C2=A0 =C2=A0include/linux/kernel.h:47:25: warning: excess elem=
ents in struct initializer<br>
&gt;=C2=A0 =C2=A0 =C2=A0sound/soc/codecs/wm9712.c:653:10: warning: assignm=
ent to =E2=80=98struct regmap *=E2=80=99 from =E2=80=98int=E2=80=99 makes p=
ointer from integer without a cast [-Wint-conversion]<br>
&gt;=C2=A0 =C2=A0 =C2=A0cc1: some warnings being treated as errors<br>
&gt;<br>
&gt; ---------------------------------------------------------------------=
-----------<br>
&gt; exynos_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches<br>
&gt;<br>
&gt; ---------------------------------------------------------------------=
-----------<br>
&gt; ezx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches<br>
&gt;<br>
&gt; ---------------------------------------------------------------------=
-----------<br>
&gt; footbridge_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warning=
s, 0 section mismatches<br>
&gt;<br>
&gt; ---------------------------------------------------------------------=
-----------<br>
&gt; fuloong2e_defconfig (mips, gcc-8) =E2=80=94 FAIL, 1 error, 1 warning,=
 0 section mismatches<br>
&gt;<br>
&gt; Errors:<br>
&gt;=C2=A0 =C2=A0 =C2=A0mm/memory.c:1523:41: error: implicit declaration o=
f function =E2=80=98pte_index=E2=80=99; did you mean =E2=80=98page_index=E2=
=
=80=99? [-Werror=3Dimplicit-function-declaration]<br>
&gt;<br>
&gt; Warnings:<br>
&gt;=C2=A0 =C2=A0 =C2=A0cc1: some warnings being treated as errors<br>
&gt;<br>
&gt; ---------------------------------------------------------------------=
-----------<br>
&gt; gcw0_defconfig (mips, gcc-8) =E2=80=94 FAIL, 1 error, 1 warning, 0 se=
ction mismatches<br>
&gt;<br>
&gt; Errors:<br>
&gt;=C2=A0 =C2=A0 =C2=A0mm/memory.c:1523:41: error: implicit declaration o=
f function =E2=80=98pte_index=E2=80=99; did you mean =E2=80=98page_index=E2=
=
=80=99? [-Werror=3Dimplicit-function-declaration]<br>
&gt;<br>
&gt; Warnings:<br>
&gt;=C2=A0 =C2=A0 =C2=A0cc1: some warnings being treated as errors<br>
&gt;<br>
&gt; ---------------------------------------------------------------------=
-----------<br>
&gt; gemini_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches<br>
&gt;<br>
&gt; ---------------------------------------------------------------------=
-----------<br>
&gt; gpr_defconfig (mips, gcc-8) =E2=80=94 FAIL, 1 error, 1 warning, 0 sec=
tion mismatches<br>
&gt;<br>
&gt; Errors:<br>
&gt;=C2=A0 =C2=A0 =C2=A0mm/memory.c:1523:41: error: implicit declaration o=
f function =E2=80=98pte_index=E2=80=99; did you mean =E2=80=98page_index=E2=
=
=80=99? [-Werror=3Dimplicit-function-declaration]<br>
&gt;<br>
&gt; Warnings:<br>
&gt;=C2=A0 =C2=A0 =C2=A0cc1: some warnings being treated as errors<br>
&gt;<br>
&gt; ---------------------------------------------------------------------=
-----------<br>
&gt; h3600_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches<br>
&gt;<br>
&gt; ---------------------------------------------------------------------=
-----------<br>
&gt; h5000_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches<br>
&gt;<br>
&gt; ---------------------------------------------------------------------=
-----------<br>
&gt; hackkit_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, =
0 section mismatches<br>
&gt;<br>
&gt; ---------------------------------------------------------------------=
-----------<br>
&gt; haps_hs_defconfig (arc, gcc-8) =E2=80=94 FAIL, 1 error, 1 warning, 0 =
section mismatches<br>
&gt;<br>
&gt; Errors:<br>
&gt;=C2=A0 =C2=A0 =C2=A0mm/memory.c:1523:41: error: implicit declaration o=
f function =E2=80=98pte_index=E2=80=99; did you mean =E2=80=98page_index=E2=
=
=80=99? [-Werror=3Dimplicit-function-declaration]<br>
&gt;<br>
&gt; Warnings:<br>
&gt;=C2=A0 =C2=A0 =C2=A0cc1: some warnings being treated as errors<br>
&gt;<br>
&gt; ---------------------------------------------------------------------=
-----------<br>
&gt; haps_hs_smp_defconfig (arc, gcc-8) =E2=80=94 FAIL, 1 error, 1 warning=
, 0 section mismatches<br>
&gt;<br>
&gt; Errors:<br>
&gt;=C2=A0 =C2=A0 =C2=A0mm/memory.c:1523:41: error: implicit declaration o=
f function =E2=80=98pte_index=E2=80=99; did you mean =E2=80=98page_index=E2=
=
=80=99? [-Werror=3Dimplicit-function-declaration]<br>
&gt;<br>
&gt; Warnings:<br>
&gt;=C2=A0 =C2=A0 =C2=A0cc1: some warnings being treated as errors<br>
&gt;<br>
&gt; ---------------------------------------------------------------------=
-----------<br>
&gt; haps_hs_smp_defconfig+kselftest (arc, gcc-8) =E2=80=94 FAIL, 1 error,=
 1 warning, 0 section mismatches<br>
&gt;<br>
&gt; Errors:<br>
&gt;=C2=A0 =C2=A0 =C2=A0mm/memory.c:1523:41: error: implicit declaration o=
f function =E2=80=98pte_index=E2=80=99; did you mean =E2=80=98page_index=E2=
=
=80=99? [-Werror=3Dimplicit-function-declaration]<br>
&gt;<br>
&gt; Warnings:<br>
&gt;=C2=A0 =C2=A0 =C2=A0cc1: some warnings being treated as errors<br>
&gt;<br>
&gt; ---------------------------------------------------------------------=
-----------<br>
&gt; hisi_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches<br>
&gt;<br>
&gt; ---------------------------------------------------------------------=
-----------<br>
&gt; hsdk_defconfig (arc, gcc-8) =E2=80=94 FAIL, 1 error, 1 warning, 0 sec=
tion mismatches<br>
&gt;<br>
&gt; Errors:<br>
&gt;=C2=A0 =C2=A0 =C2=A0mm/memory.c:1523:41: error: implicit declaration o=
f function =E2=80=98pte_index=E2=80=99; did you mean =E2=80=98page_index=E2=
=
=80=99? [-Werror=3Dimplicit-function-declaration]<br>
&gt;<br>
&gt; Warnings:<br>
&gt;=C2=A0 =C2=A0 =C2=A0cc1: some warnings being treated as errors<br>
&gt;<br>
&gt; ---------------------------------------------------------------------=
-----------<br>
&gt; i386_defconfig (i386, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches<br>
&gt;<br>
&gt; ---------------------------------------------------------------------=
-----------<br>
&gt; i386_defconfig+kselftest (i386, gcc-8) =E2=80=94 PASS, 0 errors, 0 wa=
rnings, 0 section mismatches<br>
&gt;<br>
&gt; ---------------------------------------------------------------------=
-----------<br>
&gt; imote2_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches<br>
&gt;<br>
&gt; ---------------------------------------------------------------------=
-----------<br>
&gt; imx_v4_v5_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings=
, 0 section mismatches<br>
&gt;<br>
&gt; ---------------------------------------------------------------------=
-----------<br>
&gt; imx_v6_v7_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings=
, 0 section mismatches<br>
&gt;<br>
&gt; ---------------------------------------------------------------------=
-----------<br>
&gt; integrator_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warning=
s, 0 section mismatches<br>
&gt;<br>
&gt; ---------------------------------------------------------------------=
-----------<br>
&gt; iop32x_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches<br>
&gt;<br>
&gt; ---------------------------------------------------------------------=
-----------<br>
&gt; ip22_defconfig (mips, gcc-8) =E2=80=94 FAIL, 1 error, 1 warning, 0 se=
ction mismatches<br>
&gt;<br>
&gt; Errors:<br>
&gt;=C2=A0 =C2=A0 =C2=A0mm/memory.c:1523:41: error: implicit declaration o=
f function =E2=80=98pte_index=E2=80=99; did you mean =E2=80=98page_index=E2=
=
=80=99? [-Werror=3Dimplicit-function-declaration]<br>
&gt;<br>
&gt; Warnings:<br>
&gt;=C2=A0 =C2=A0 =C2=A0cc1: some warnings being treated as errors<br>
&gt;<br>
&gt; ---------------------------------------------------------------------=
-----------<br>
&gt; ip27_defconfig (mips, gcc-8) =E2=80=94 FAIL, 3 errors, 2 warnings, 0 =
section mismatches<br>
&gt;<br>
&gt; Errors:<br>
&gt;=C2=A0 =C2=A0 =C2=A0arch/mips/include/asm/sn/addrs.h:58:44: error: lef=
t shift count &gt;=3D width of type [-Werror=3Dshift-count-overflow]<br>
&gt;=C2=A0 =C2=A0 =C2=A0arch/mips/include/asm/sn/addrs.h:58:44: error: lef=
t shift count &gt;=3D width of type [-Werror=3Dshift-count-overflow]<br>
&gt;=C2=A0 =C2=A0 =C2=A0mm/memory.c:1523:41: error: implicit declaration o=
f function =E2=80=98pte_index=E2=80=99; did you mean =E2=80=98page_index=E2=
=
=80=99? [-Werror=3Dimplicit-function-declaration]<br>
&gt;<br>
&gt; Warnings:<br>
&gt;=C2=A0 =C2=A0 =C2=A0cc1: all warnings being treated as errors<br>
&gt;=C2=A0 =C2=A0 =C2=A0cc1: some warnings being treated as errors<br>
&gt;<br>
&gt; ---------------------------------------------------------------------=
-----------<br>
&gt; ip28_defconfig (mips, gcc-8) =E2=80=94 FAIL, 1 error, 1 warning, 0 se=
ction mismatches<br>
&gt;<br>
&gt; Errors:<br>
&gt;=C2=A0 =C2=A0 =C2=A0mm/memory.c:1523:41: error: implicit declaration o=
f function =E2=80=98pte_index=E2=80=99; did you mean =E2=80=98page_index=E2=
=
=80=99? [-Werror=3Dimplicit-function-declaration]<br>
&gt;<br>
&gt; Warnings:<br>
&gt;=C2=A0 =C2=A0 =C2=A0cc1: some warnings being treated as errors<br>
&gt;<br>
&gt; ---------------------------------------------------------------------=
-----------<br>
&gt; ip32_defconfig (mips, gcc-8) =E2=80=94 FAIL, 1 error, 1 warning, 0 se=
ction mismatches<br>
&gt;<br>
&gt; Errors:<br>
&gt;=C2=A0 =C2=A0 =C2=A0mm/memory.c:1523:41: error: implicit declaration o=
f function =E2=80=98pte_index=E2=80=99; did you mean =E2=80=98page_index=E2=
=
=80=99? [-Werror=3Dimplicit-function-declaration]<br>
&gt;<br>
&gt; Warnings:<br>
&gt;=C2=A0 =C2=A0 =C2=A0cc1: some warnings being treated as errors<br>
&gt;<br>
&gt; ---------------------------------------------------------------------=
-----------<br>
&gt; ixp4xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches<br>
&gt;<br>
&gt; ---------------------------------------------------------------------=
-----------<br>
&gt; jazz_defconfig (mips, gcc-8) =E2=80=94 FAIL, 1 error, 1 warning, 0 se=
ction mismatches<br>
&gt;<br>
&gt; Errors:<br>
&gt;=C2=A0 =C2=A0 =C2=A0mm/memory.c:1523:41: error: implicit declaration o=
f function =E2=80=98pte_index=E2=80=99; did you mean =E2=80=98page_index=E2=
=
=80=99? [-Werror=3Dimplicit-function-declaration]<br>
&gt;<br>
&gt; Warnings:<br>
&gt;=C2=A0 =C2=A0 =C2=A0cc1: some warnings being treated as errors<br>
&gt;<br>
&gt; ---------------------------------------------------------------------=
-----------<br>
&gt; jmr3927_defconfig (mips, gcc-8) =E2=80=94 FAIL, 1 error, 1 warning, 0=
 section mismatches<br>
&gt;<br>
&gt; Errors:<br>
&gt;=C2=A0 =C2=A0 =C2=A0mm/memory.c:1523:41: error: implicit declaration o=
f function =E2=80=98pte_index=E2=80=99; did you mean =E2=80=98page_index=E2=
=
=80=99? [-Werror=3Dimplicit-function-declaration]<br>
&gt;<br>
&gt; Warnings:<br>
&gt;=C2=A0 =C2=A0 =C2=A0cc1: some warnings being treated as errors<br>
&gt;<br>
&gt; ---------------------------------------------------------------------=
-----------<br>
&gt; jornada720_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warning=
s, 0 section mismatches<br>
&gt;<br>
&gt; ---------------------------------------------------------------------=
-----------<br>
&gt; keystone_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings,=
 0 section mismatches<br>
&gt;<br>
&gt; ---------------------------------------------------------------------=
-----------<br>
&gt; lart_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches<br>
&gt;<br>
&gt; ---------------------------------------------------------------------=
-----------<br>
&gt; lasat_defconfig (mips, gcc-8) =E2=80=94 FAIL, 1 error, 1 warning, 0 s=
ection mismatches<br>
&gt;<br>
&gt; Errors:<br>
&gt;=C2=A0 =C2=A0 =C2=A0mm/memory.c:1523:41: error: implicit declaration o=
f function =E2=80=98pte_index=E2=80=99; did you mean =E2=80=98page_index=E2=
=
=80=99? [-Werror=3Dimplicit-function-declaration]<br>
&gt;<br>
&gt; Warnings:<br>
&gt;=C2=A0 =C2=A0 =C2=A0cc1: some warnings being treated as errors<br>
&gt;<br>
&gt; ---------------------------------------------------------------------=
-----------<br>
&gt; lemote2f_defconfig (mips, gcc-8) =E2=80=94 FAIL, 1 error, 1 warning, =
0 section mismatches<br>
&gt;<br>
&gt; Errors:<br>
&gt;=C2=A0 =C2=A0 =C2=A0mm/memory.c:1523:41: error: implicit declaration o=
f function =E2=80=98pte_index=E2=80=99; did you mean =E2=80=98page_index=E2=
=
=80=99? [-Werror=3Dimplicit-function-declaration]<br>
&gt;<br>
&gt; Warnings:<br>
&gt;=C2=A0 =C2=A0 =C2=A0cc1: some warnings being treated as errors<br>
&gt;<br>
&gt; ---------------------------------------------------------------------=
-----------<br>
&gt; loongson1b_defconfig (mips, gcc-8) =E2=80=94 FAIL, 1 error, 1 warning=
, 0 section mismatches<br>
&gt;<br>
&gt; Errors:<br>
&gt;=C2=A0 =C2=A0 =C2=A0mm/memory.c:1523:41: error: implicit declaration o=
f function =E2=80=98pte_index=E2=80=99; did you mean =E2=80=98page_index=E2=
=
=80=99? [-Werror=3Dimplicit-function-declaration]<br>
&gt;<br>
&gt; Warnings:<br>
&gt;=C2=A0 =C2=A0 =C2=A0cc1: some warnings being treated as errors<br>
&gt;<br>
&gt; ---------------------------------------------------------------------=
-----------<br>
&gt; loongson1c_defconfig (mips, gcc-8) =E2=80=94 FAIL, 1 error, 1 warning=
, 0 section mismatches<br>
&gt;<br>
&gt; Errors:<br>
&gt;=C2=A0 =C2=A0 =C2=A0mm/memory.c:1523:41: error: implicit declaration o=
f function =E2=80=98pte_index=E2=80=99; did you mean =E2=80=98page_index=E2=
=
=80=99? [-Werror=3Dimplicit-function-declaration]<br>
&gt;<br>
&gt; Warnings:<br>
&gt;=C2=A0 =C2=A0 =C2=A0cc1: some warnings being treated as errors<br>
&gt;<br>
&gt; ---------------------------------------------------------------------=
-----------<br>
&gt; loongson3_defconfig (mips, gcc-8) =E2=80=94 FAIL, 1 error, 1 warning,=
 0 section mismatches<br>
&gt;<br>
&gt; Errors:<br>
&gt;=C2=A0 =C2=A0 =C2=A0mm/memory.c:1523:41: error: implicit declaration o=
f function =E2=80=98pte_index=E2=80=99; did you mean =E2=80=98page_index=E2=
=
=80=99? [-Werror=3Dimplicit-function-declaration]<br>
&gt;<br>
&gt; Warnings:<br>
&gt;=C2=A0 =C2=A0 =C2=A0cc1: some warnings being treated as errors<br>
&gt;<br>
&gt; ---------------------------------------------------------------------=
-----------<br>
&gt; lpc18xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, =
0 section mismatches<br>
&gt;<br>
&gt; ---------------------------------------------------------------------=
-----------<br>
&gt; lpc32xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, =
0 section mismatches<br>
&gt;<br>
&gt; ---------------------------------------------------------------------=
-----------<br>
&gt; lpd270_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches<br>
&gt;<br>
&gt; ---------------------------------------------------------------------=
-----------<br>
&gt; lubbock_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, =
0 section mismatches<br>
&gt;<br>
&gt; ---------------------------------------------------------------------=
-----------<br>
&gt; magician_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings,=
 0 section mismatches<br>
&gt;<br>
&gt; ---------------------------------------------------------------------=
-----------<br>
&gt; mainstone_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings=
, 0 section mismatches<br>
&gt;<br>
&gt; ---------------------------------------------------------------------=
-----------<br>
&gt; malta_defconfig (mips, gcc-8) =E2=80=94 FAIL, 1 error, 1 warning, 0 s=
ection mismatches<br>
&gt;<br>
&gt; Errors:<br>
&gt;=C2=A0 =C2=A0 =C2=A0mm/memory.c:1523:41: error: implicit declaration o=
f function =E2=80=98pte_index=E2=80=99; did you mean =E2=80=98page_index=E2=
=
=80=99? [-Werror=3Dimplicit-function-declaration]<br>
&gt;<br>
&gt; Warnings:<br>
&gt;=C2=A0 =C2=A0 =C2=A0cc1: some warnings being treated as errors<br>
&gt;<br>
&gt; ---------------------------------------------------------------------=
-----------<br>
&gt; malta_kvm_defconfig (mips, gcc-8) =E2=80=94 FAIL, 1 error, 1 warning,=
 0 section mismatches<br>
&gt;<br>
&gt; Errors:<br>
&gt;=C2=A0 =C2=A0 =C2=A0mm/memory.c:1523:41: error: implicit declaration o=
f function =E2=80=98pte_index=E2=80=99; did you mean =E2=80=98page_index=E2=
=
=80=99? [-Werror=3Dimplicit-function-declaration]<br>
&gt;<br>
&gt; Warnings:<br>
&gt;=C2=A0 =C2=A0 =C2=A0cc1: some warnings being treated as errors<br>
&gt;<br>
&gt; ---------------------------------------------------------------------=
-----------<br>
&gt; malta_kvm_guest_defconfig (mips, gcc-8) =E2=80=94 FAIL, 1 error, 1 wa=
rning, 0 section mismatches<br>
&gt;<br>
&gt; Errors:<br>
&gt;=C2=A0 =C2=A0 =C2=A0mm/memory.c:1523:41: error: implicit declaration o=
f function =E2=80=98pte_index=E2=80=99; did you mean =E2=80=98page_index=E2=
=
=80=99? [-Werror=3Dimplicit-function-declaration]<br>
&gt;<br>
&gt; Warnings:<br>
&gt;=C2=A0 =C2=A0 =C2=A0cc1: some warnings being treated as errors<br>
&gt;<br>
&gt; ---------------------------------------------------------------------=
-----------<br>
&gt; malta_qemu_32r6_defconfig (mips, gcc-8) =E2=80=94 FAIL, 1 error, 1 wa=
rning, 0 section mismatches<br>
&gt;<br>
&gt; Errors:<br>
&gt;=C2=A0 =C2=A0 =C2=A0mm/memory.c:1523:41: error: implicit declaration o=
f function =E2=80=98pte_index=E2=80=99; did you mean =E2=80=98page_index=E2=
=
=80=99? [-Werror=3Dimplicit-function-declaration]<br>
&gt;<br>
&gt; Warnings:<br>
&gt;=C2=A0 =C2=A0 =C2=A0cc1: some warnings being treated as errors<br>
&gt;<br>
&gt; ---------------------------------------------------------------------=
-----------<br>
&gt; maltaaprp_defconfig (mips, gcc-8) =E2=80=94 FAIL, 1 error, 1 warning,=
 0 section mismatches<br>
&gt;<br>
&gt; Errors:<br>
&gt;=C2=A0 =C2=A0 =C2=A0mm/memory.c:1523:41: error: implicit declaration o=
f function =E2=80=98pte_index=E2=80=99; did you mean =E2=80=98page_index=E2=
=
=80=99? [-Werror=3Dimplicit-function-declaration]<br>
&gt;<br>
&gt; Warnings:<br>
&gt;=C2=A0 =C2=A0 =C2=A0cc1: some warnings being treated as errors<br>
&gt;<br>
&gt; ---------------------------------------------------------------------=
-----------<br>
&gt; maltasmvp_defconfig (mips, gcc-8) =E2=80=94 FAIL, 1 error, 1 warning,=
 0 section mismatches<br>
&gt;<br>
&gt; Errors:<br>
&gt;=C2=A0 =C2=A0 =C2=A0mm/memory.c:1523:41: error: implicit declaration o=
f function =E2=80=98pte_index=E2=80=99; did you mean =E2=80=98page_index=E2=
=
=80=99? [-Werror=3Dimplicit-function-declaration]<br>
&gt;<br>
&gt; Warnings:<br>
&gt;=C2=A0 =C2=A0 =C2=A0cc1: some warnings being treated as errors<br>
&gt;<br>
&gt; ---------------------------------------------------------------------=
-----------<br>
&gt; maltasmvp_eva_defconfig (mips, gcc-8) =E2=80=94 FAIL, 1 error, 1 warn=
ing, 0 section mismatches<br>
&gt;<br>
&gt; Errors:<br>
&gt;=C2=A0 =C2=A0 =C2=A0mm/memory.c:1523:41: error: implicit declaration o=
f function =E2=80=98pte_index=E2=80=99; did you mean =E2=80=98page_index=E2=
=
=80=99? [-Werror=3Dimplicit-function-declaration]<br>
&gt;<br>
&gt; Warnings:<br>
&gt;=C2=A0 =C2=A0 =C2=A0cc1: some warnings being treated as errors<br>
&gt;<br>
&gt; ---------------------------------------------------------------------=
-----------<br>
&gt; maltaup_defconfig (mips, gcc-8) =E2=80=94 FAIL, 1 error, 1 warning, 0=
 section mismatches<br>
&gt;<br>
&gt; Errors:<br>
&gt;=C2=A0 =C2=A0 =C2=A0mm/memory.c:1523:41: error: implicit declaration o=
f function =E2=80=98pte_index=E2=80=99; did you mean =E2=80=98page_index=E2=
=
=80=99? [-Werror=3Dimplicit-function-declaration]<br>
&gt;<br>
&gt; Warnings:<br>
&gt;=C2=A0 =C2=A0 =C2=A0cc1: some warnings being treated as errors<br>
&gt;<br>
&gt; ---------------------------------------------------------------------=
-----------<br>
&gt; maltaup_xpa_defconfig (mips, gcc-8) =E2=80=94 FAIL, 1 error, 1 warnin=
g, 0 section mismatches<br>
&gt;<br>
&gt; Errors:<br>
&gt;=C2=A0 =C2=A0 =C2=A0mm/memory.c:1523:41: error: implicit declaration o=
f function =E2=80=98pte_index=E2=80=99; did you mean =E2=80=98page_index=E2=
=
=80=99? [-Werror=3Dimplicit-function-declaration]<br>
&gt;<br>
&gt; Warnings:<br>
&gt;=C2=A0 =C2=A0 =C2=A0cc1: some warnings being treated as errors<br>
&gt;<br>
&gt; ---------------------------------------------------------------------=
-----------<br>
&gt; markeins_defconfig (mips, gcc-8) =E2=80=94 FAIL, 1 error, 1 warning, =
0 section mismatches<br>
&gt;<br>
&gt; Errors:<br>
&gt;=C2=A0 =C2=A0 =C2=A0mm/memory.c:1523:41: error: implicit declaration o=
f function =E2=80=98pte_index=E2=80=99; did you mean =E2=80=98page_index=E2=
=
=80=99? [-Werror=3Dimplicit-function-declaration]<br>
&gt;<br>
&gt; Warnings:<br>
&gt;=C2=A0 =C2=A0 =C2=A0cc1: some warnings being treated as errors<br>
&gt;<br>
&gt; ---------------------------------------------------------------------=
-----------<br>
&gt; milbeaut_m10v_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warn=
ings, 0 section mismatches<br>
&gt;<br>
&gt; ---------------------------------------------------------------------=
-----------<br>
&gt; mini2440_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings,=
 0 section mismatches<br>
&gt;<br>
&gt; ---------------------------------------------------------------------=
-----------<br>
&gt; mips_paravirt_defconfig (mips, gcc-8) =E2=80=94 FAIL, 1 error, 1 warn=
ing, 0 section mismatches<br>
&gt;<br>
&gt; Errors:<br>
&gt;=C2=A0 =C2=A0 =C2=A0mm/memory.c:1523:41: error: implicit declaration o=
f function =E2=80=98pte_index=E2=80=99; did you mean =E2=80=98page_index=E2=
=
=80=99? [-Werror=3Dimplicit-function-declaration]<br>
&gt;<br>
&gt; Warnings:<br>
&gt;=C2=A0 =C2=A0 =C2=A0cc1: some warnings being treated as errors<br>
&gt;<br>
&gt; ---------------------------------------------------------------------=
-----------<br>
&gt; mmp2_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches<br>
&gt;<br>
&gt; ---------------------------------------------------------------------=
-----------<br>
&gt; moxart_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches<br>
&gt;<br>
&gt; ---------------------------------------------------------------------=
-----------<br>
&gt; mpc30x_defconfig (mips, gcc-8) =E2=80=94 FAIL, 1 error, 1 warning, 0 =
section mismatches<br>
&gt;<br>
&gt; Errors:<br>
&gt;=C2=A0 =C2=A0 =C2=A0mm/memory.c:1523:41: error: implicit declaration o=
f function =E2=80=98pte_index=E2=80=99; did you mean =E2=80=98page_index=E2=
=
=80=99? [-Werror=3Dimplicit-function-declaration]<br>
&gt;<br>
&gt; Warnings:<br>
&gt;=C2=A0 =C2=A0 =C2=A0cc1: some warnings being treated as errors<br>
&gt;<br>
&gt; ---------------------------------------------------------------------=
-----------<br>
&gt; mps2_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches<br>
&gt;<br>
&gt; ---------------------------------------------------------------------=
-----------<br>
&gt; msp71xx_defconfig (mips, gcc-8) =E2=80=94 FAIL, 1 error, 1 warning, 0=
 section mismatches<br>
&gt;<br>
&gt; Errors:<br>
&gt;=C2=A0 =C2=A0 =C2=A0mm/memory.c:1523:41: error: implicit declaration o=
f function =E2=80=98pte_index=E2=80=99; did you mean =E2=80=98page_index=E2=
=
=80=99? [-Werror=3Dimplicit-function-declaration]<br>
&gt;<br>
&gt; Warnings:<br>
&gt;=C2=A0 =C2=A0 =C2=A0cc1: some warnings being treated as errors<br>
&gt;<br>
&gt; ---------------------------------------------------------------------=
-----------<br>
&gt; mtx1_defconfig (mips, gcc-8) =E2=80=94 FAIL, 1 error, 1 warning, 0 se=
ction mismatches<br>
&gt;<br>
&gt; Errors:<br>
&gt;=C2=A0 =C2=A0 =C2=A0mm/memory.c:1523:41: error: implicit declaration o=
f function =E2=80=98pte_index=E2=80=99; did you mean =E2=80=98page_index=E2=
=
=80=99? [-Werror=3Dimplicit-function-declaration]<br>
&gt;<br>
&gt; Warnings:<br>
&gt;=C2=A0 =C2=A0 =C2=A0cc1: some warnings being treated as errors<br>
&gt;<br>
&gt; ---------------------------------------------------------------------=
-----------<br>
&gt; multi_v4t_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings=
, 0 section mismatches<br>
&gt;<br>
&gt; ---------------------------------------------------------------------=
-----------<br>
&gt; multi_v5_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings,=
 0 section mismatches<br>
&gt;<br>
&gt; Warnings:<br>
&gt;=C2=A0 =C2=A0 =C2=A0arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dt=
s:435.11-439.4: Warning (i2c_bus_reg): /ahb/apb/bus@1e78a000/i2c-bus@140/ip=
mb0@10: I2C bus unit address format error, expected &quot;40000010&quot;<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dt=
s:437.3-30: Warning (i2c_bus_reg): /ahb/apb/bus@1e78a000/i2c-bus@140/ipmb0@=
10:reg: I2C address must be less than 10-bits, got &quot;0x40000010&quot;<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dt=
s:521.11-525.4: Warning (i2c_bus_reg): /ahb/apb/bus@1e78a000/i2c-bus@380/ip=
mb0@10: I2C bus unit address format error, expected &quot;40000010&quot;<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dt=
s:523.3-30: Warning (i2c_bus_reg): /ahb/apb/bus@1e78a000/i2c-bus@380/ipmb0@=
10:reg: I2C address must be less than 10-bits, got &quot;0x40000010&quot;<b=
r>
&gt;<br>
&gt; ---------------------------------------------------------------------=
-----------<br>
&gt; multi_v7_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings,=
 0 section mismatches<br>
&gt;<br>
&gt; Warnings:<br>
&gt;=C2=A0 =C2=A0 =C2=A0arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dt=
s:435.11-439.4: Warning (i2c_bus_reg): /ahb/apb/bus@1e78a000/i2c-bus@140/ip=
mb0@10: I2C bus unit address format error, expected &quot;40000010&quot;<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dt=
s:437.3-30: Warning (i2c_bus_reg): /ahb/apb/bus@1e78a000/i2c-bus@140/ipmb0@=
10:reg: I2C address must be less than 10-bits, got &quot;0x40000010&quot;<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dt=
s:521.11-525.4: Warning (i2c_bus_reg): /ahb/apb/bus@1e78a000/i2c-bus@380/ip=
mb0@10: I2C bus unit address format error, expected &quot;40000010&quot;<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dt=
s:523.3-30: Warning (i2c_bus_reg): /ahb/apb/bus@1e78a000/i2c-bus@380/ipmb0@=
10:reg: I2C address must be less than 10-bits, got &quot;0x40000010&quot;<b=
r>
&gt;<br>
&gt; ---------------------------------------------------------------------=
-----------<br>
&gt; multi_v7_defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy (arm, gcc-8) =E2=80=94 P=
ASS, 0 errors, 4 warnings, 0 section mismatches<br>
&gt;<br>
&gt; Warnings:<br>
&gt;=C2=A0 =C2=A0 =C2=A0arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dt=
s:435.11-439.4: Warning (i2c_bus_reg): /ahb/apb/bus@1e78a000/i2c-bus@140/ip=
mb0@10: I2C bus unit address format error, expected &quot;40000010&quot;<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dt=
s:437.3-30: Warning (i2c_bus_reg): /ahb/apb/bus@1e78a000/i2c-bus@140/ipmb0@=
10:reg: I2C address must be less than 10-bits, got &quot;0x40000010&quot;<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dt=
s:521.11-525.4: Warning (i2c_bus_reg): /ahb/apb/bus@1e78a000/i2c-bus@380/ip=
mb0@10: I2C bus unit address format error, expected &quot;40000010&quot;<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dt=
s:523.3-30: Warning (i2c_bus_reg): /ahb/apb/bus@1e78a000/i2c-bus@380/ipmb0@=
10:reg: I2C address must be less than 10-bits, got &quot;0x40000010&quot;<b=
r>
&gt;<br>
&gt; ---------------------------------------------------------------------=
-----------<br>
&gt; multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy (arm, gcc-8) =
=E2=80=94 PASS, 0 errors, 4 warnings, 0 section mismatches<br>
&gt;<br>
&gt; Warnings:<br>
&gt;=C2=A0 =C2=A0 =C2=A0arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dt=
s:435.11-439.4: Warning (i2c_bus_reg): /ahb/apb/bus@1e78a000/i2c-bus@140/ip=
mb0@10: I2C bus unit address format error, expected &quot;40000010&quot;<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dt=
s:437.3-30: Warning (i2c_bus_reg): /ahb/apb/bus@1e78a000/i2c-bus@140/ipmb0@=
10:reg: I2C address must be less than 10-bits, got &quot;0x40000010&quot;<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dt=
s:521.11-525.4: Warning (i2c_bus_reg): /ahb/apb/bus@1e78a000/i2c-bus@380/ip=
mb0@10: I2C bus unit address format error, expected &quot;40000010&quot;<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dt=
s:523.3-30: Warning (i2c_bus_reg): /ahb/apb/bus@1e78a000/i2c-bus@380/ipmb0@=
10:reg: I2C address must be less than 10-bits, got &quot;0x40000010&quot;<b=
r>
&gt;<br>
&gt; ---------------------------------------------------------------------=
-----------<br>
&gt; multi_v7_defconfig+CONFIG_SMP=3Dn (arm, gcc-8) =E2=80=94 PASS, 0 erro=
rs, 4 warnings, 0 section mismatches<br>
&gt;<br>
&gt; Warnings:<br>
&gt;=C2=A0 =C2=A0 =C2=A0arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dt=
s:435.11-439.4: Warning (i2c_bus_reg): /ahb/apb/bus@1e78a000/i2c-bus@140/ip=
mb0@10: I2C bus unit address format error, expected &quot;40000010&quot;<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dt=
s:437.3-30: Warning (i2c_bus_reg): /ahb/apb/bus@1e78a000/i2c-bus@140/ipmb0@=
10:reg: I2C address must be less than 10-bits, got &quot;0x40000010&quot;<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dt=
s:521.11-525.4: Warning (i2c_bus_reg): /ahb/apb/bus@1e78a000/i2c-bus@380/ip=
mb0@10: I2C bus unit address format error, expected &quot;40000010&quot;<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dt=
s:523.3-30: Warning (i2c_bus_reg): /ahb/apb/bus@1e78a000/i2c-bus@380/ipmb0@=
10:reg: I2C address must be less than 10-bits, got &quot;0x40000010&quot;<b=
r>
&gt;<br>
&gt; ---------------------------------------------------------------------=
-----------<br>
&gt; multi_v7_defconfig+kselftest (arm, gcc-8) =E2=80=94 PASS, 0 errors, 5=
 warnings, 0 section mismatches<br>
&gt;<br>
&gt; Warnings:<br>
&gt;=C2=A0 =C2=A0 =C2=A0net/sched/cls_flower.c:331:1: warning: the frame s=
ize of 1032 bytes is larger than 1024 bytes [-Wframe-larger-than=3D]<br>
&gt;=C2=A0 =C2=A0 =C2=A0arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dt=
s:435.11-439.4: Warning (i2c_bus_reg): /ahb/apb/bus@1e78a000/i2c-bus@140/ip=
mb0@10: I2C bus unit address format error, expected &quot;40000010&quot;<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dt=
s:437.3-30: Warning (i2c_bus_reg): /ahb/apb/bus@1e78a000/i2c-bus@140/ipmb0@=
10:reg: I2C address must be less than 10-bits, got &quot;0x40000010&quot;<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dt=
s:521.11-525.4: Warning (i2c_bus_reg): /ahb/apb/bus@1e78a000/i2c-bus@380/ip=
mb0@10: I2C bus unit address format error, expected &quot;40000010&quot;<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dt=
s:523.3-30: Warning (i2c_bus_reg): /ahb/apb/bus@1e78a000/i2c-bus@380/ipmb0@=
10:reg: I2C address must be less than 10-bits, got &quot;0x40000010&quot;<b=
r>
&gt;<br>
&gt; ---------------------------------------------------------------------=
-----------<br>
&gt; mv78xx0_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, =
0 section mismatches<br>
&gt;<br>
&gt; ---------------------------------------------------------------------=
-----------<br>
&gt; mvebu_v5_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings,=
 0 section mismatches<br>
&gt;<br>
&gt; ---------------------------------------------------------------------=
-----------<br>
&gt; mvebu_v7_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings,=
 0 section mismatches<br>
&gt;<br>
&gt; ---------------------------------------------------------------------=
-----------<br>
&gt; mxs_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches<br>
&gt;<br>
&gt; ---------------------------------------------------------------------=
-----------<br>
&gt; neponset_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings,=
 0 section mismatches<br>
&gt;<br>
&gt; ---------------------------------------------------------------------=
-----------<br>
&gt; netwinder_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings=
, 0 section mismatches<br>
&gt;<br>
&gt; ---------------------------------------------------------------------=
-----------<br>
&gt; nhk8815_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, =
0 section mismatches<br>
&gt;<br>
&gt; ---------------------------------------------------------------------=
-----------<br>
&gt; nlm_xlp_defconfig (mips, gcc-8) =E2=80=94 FAIL, 1 error, 1 warning, 0=
 section mismatches<br>
&gt;<br>
&gt; Errors:<br>
&gt;=C2=A0 =C2=A0 =C2=A0mm/memory.c:1523:41: error: implicit declaration o=
f function =E2=80=98pte_index=E2=80=99; did you mean =E2=80=98page_index=E2=
=
=80=99? [-Werror=3Dimplicit-function-declaration]<br>
&gt;<br>
&gt; Warnings:<br>
&gt;=C2=A0 =C2=A0 =C2=A0cc1: some warnings being treated as errors<br>
&gt;<br>
&gt; ---------------------------------------------------------------------=
-----------<br>
&gt; nlm_xlr_defconfig (mips, gcc-8) =E2=80=94 FAIL, 1 error, 1 warning, 0=
 section mismatches<br>
&gt;<br>
&gt; Errors:<br>
&gt;=C2=A0 =C2=A0 =C2=A0mm/memory.c:1523:41: error: implicit declaration o=
f function =E2=80=98pte_index=E2=80=99; did you mean =E2=80=98page_index=E2=
=
=80=99? [-Werror=3Dimplicit-function-declaration]<br>
&gt;<br>
&gt; Warnings:<br>
&gt;=C2=A0 =C2=A0 =C2=A0cc1: some warnings being treated as errors<br>
&gt;<br>
&gt; ---------------------------------------------------------------------=
-----------<br>
&gt; nommu_virt_defconfig (riscv, gcc-8) =E2=80=94 PASS, 0 errors, 0 warni=
ngs, 0 section mismatches<br>
&gt;<br>
&gt; ---------------------------------------------------------------------=
-----------<br>
&gt; nsimosci_hs_defconfig (arc, gcc-8) =E2=80=94 FAIL, 1 error, 1 warning=
, 0 section mismatches<br>
&gt;<br>
&gt; Errors:<br>
&gt;=C2=A0 =C2=A0 =C2=A0mm/memory.c:1523:41: error: implicit declaration o=
f function =E2=80=98pte_index=E2=80=99; did you mean =E2=80=98page_index=E2=
=
=80=99? [-Werror=3Dimplicit-function-declaration]<br>
&gt;<br>
&gt; Warnings:<br>
&gt;=C2=A0 =C2=A0 =C2=A0cc1: some warnings being treated as errors<br>
&gt;<br>
&gt; ---------------------------------------------------------------------=
-----------<br>
&gt; nsimosci_hs_smp_defconfig (arc, gcc-8) =E2=80=94 FAIL, 1 error, 1 war=
ning, 0 section mismatches<br>
&gt;<br>
&gt; Errors:<br>
&gt;=C2=A0 =C2=A0 =C2=A0mm/memory.c:1523:41: error: implicit declaration o=
f function =E2=80=98pte_index=E2=80=99; did you mean =E2=80=98page_index=E2=
=
=80=99? [-Werror=3Dimplicit-function-declaration]<br>
&gt;<br>
&gt; Warnings:<br>
&gt;=C2=A0 =C2=A0 =C2=A0cc1: some warnings being treated as errors<br>
&gt;<br>
&gt; ---------------------------------------------------------------------=
-----------<br>
&gt; omap1_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches<br>
&gt;<br>
&gt; ---------------------------------------------------------------------=
-----------<br>
&gt; omap2plus_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings=
, 0 section mismatches<br>
&gt;<br>
&gt; ---------------------------------------------------------------------=
-----------<br>
&gt; omega2p_defconfig (mips, gcc-8) =E2=80=94 FAIL, 1 error, 1 warning, 0=
 section mismatches<br>
&gt;<br>
&gt; Errors:<br>
&gt;=C2=A0 =C2=A0 =C2=A0mm/memory.c:1523:41: error: implicit declaration o=
f function =E2=80=98pte_index=E2=80=99; did you mean =E2=80=98page_index=E2=
=
=80=99? [-Werror=3Dimplicit-function-declaration]<br>
&gt;<br>
&gt; Warnings:<br>
&gt;=C2=A0 =C2=A0 =C2=A0cc1: some warnings being treated as errors<br>
&gt;<br>
&gt; ---------------------------------------------------------------------=
-----------<br>
&gt; orion5x_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, =
0 section mismatches<br>
&gt;<br>
&gt; ---------------------------------------------------------------------=
-----------<br>
&gt; oxnas_v6_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings,=
 0 section mismatches<br>
&gt;<br>
&gt; ---------------------------------------------------------------------=
-----------<br>
&gt; palmz72_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, =
0 section mismatches<br>
&gt;<br>
&gt; ---------------------------------------------------------------------=
-----------<br>
&gt; pcm027_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches<br>
&gt;<br>
&gt; ---------------------------------------------------------------------=
-----------<br>
&gt; pic32mzda_defconfig (mips, gcc-8) =E2=80=94 FAIL, 1 error, 1 warning,=
 0 section mismatches<br>
&gt;<br>
&gt; Errors:<br>
&gt;=C2=A0 =C2=A0 =C2=A0mm/memory.c:1523:41: error: implicit declaration o=
f function =E2=80=98pte_index=E2=80=99; did you mean =E2=80=98page_index=E2=
=
=80=99? [-Werror=3Dimplicit-function-declaration]<br>
&gt;<br>
&gt; Warnings:<br>
&gt;=C2=A0 =C2=A0 =C2=A0cc1: some warnings being treated as errors<br>
&gt;<br>
&gt; ---------------------------------------------------------------------=
-----------<br>
&gt; pistachio_defconfig (mips, gcc-8) =E2=80=94 FAIL, 1 error, 1 warning,=
 0 section mismatches<br>
&gt;<br>
&gt; Errors:<br>
&gt;=C2=A0 =C2=A0 =C2=A0mm/memory.c:1523:41: error: implicit declaration o=
f function =E2=80=98pte_index=E2=80=99; did you mean =E2=80=98page_index=E2=
=
=80=99? [-Werror=3Dimplicit-function-declaration]<br>
&gt;<br>
&gt; Warnings:<br>
&gt;=C2=A0 =C2=A0 =C2=A0cc1: some warnings being treated as errors<br>
&gt;<br>
&gt; ---------------------------------------------------------------------=
-----------<br>
&gt; pleb_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches<br>
&gt;<br>
&gt; ---------------------------------------------------------------------=
-----------<br>
&gt; pnx8335_stb225_defconfig (mips, gcc-8) =E2=80=94 FAIL, 1 error, 1 war=
ning, 0 section mismatches<br>
&gt;<br>
&gt; Errors:<br>
&gt;=C2=A0 =C2=A0 =C2=A0mm/memory.c:1523:41: error: implicit declaration o=
f function =E2=80=98pte_index=E2=80=99; did you mean =E2=80=98page_index=E2=
=
=80=99? [-Werror=3Dimplicit-function-declaration]<br>
&gt;<br>
&gt; Warnings:<br>
&gt;=C2=A0 =C2=A0 =C2=A0cc1: some warnings being treated as errors<br>
&gt;<br>
&gt; ---------------------------------------------------------------------=
-----------<br>
&gt; prima2_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches<br>
&gt;<br>
&gt; ---------------------------------------------------------------------=
-----------<br>
&gt; pxa168_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches<br>
&gt;<br>
&gt; ---------------------------------------------------------------------=
-----------<br>
&gt; pxa255-idp_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warning=
s, 0 section mismatches<br>
&gt;<br>
&gt; ---------------------------------------------------------------------=
-----------<br>
&gt; pxa3xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches<br>
&gt;<br>
&gt; ---------------------------------------------------------------------=
-----------<br>
&gt; pxa910_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches<br>
&gt;<br>
&gt; ---------------------------------------------------------------------=
-----------<br>
&gt; pxa_defconfig (arm, gcc-8) =E2=80=94 FAIL, 3 errors, 6 warnings, 0 se=
ction mismatches<br>
&gt;<br>
&gt; Errors:<br>
&gt;=C2=A0 =C2=A0 =C2=A0ERROR: &quot;snd_ac97_reset&quot; [sound/soc/codec=
s/snd-soc-wm9713.ko] undefined!<br>
&gt;=C2=A0 =C2=A0 =C2=A0ERROR: &quot;snd_ac97_reset&quot; [sound/soc/codec=
s/snd-soc-wm9712.ko] undefined!<br>
&gt;=C2=A0 =C2=A0 =C2=A0ERROR: &quot;snd_ac97_reset&quot; [sound/soc/codec=
s/snd-soc-wm9705.ko] undefined!<br>
&gt;<br>
&gt; Warnings:<br>
&gt;=C2=A0 =C2=A0 =C2=A0WARNING: unmet direct dependencies detected for SN=
D_SOC_WM9705<br>
&gt;=C2=A0 =C2=A0 =C2=A0WARNING: unmet direct dependencies detected for SN=
D_SOC_WM9712<br>
&gt;=C2=A0 =C2=A0 =C2=A0WARNING: unmet direct dependencies detected for SN=
D_SOC_WM9713<br>
&gt;=C2=A0 =C2=A0 =C2=A0WARNING: unmet direct dependencies detected for SN=
D_SOC_WM9705<br>
&gt;=C2=A0 =C2=A0 =C2=A0WARNING: unmet direct dependencies detected for SN=
D_SOC_WM9712<br>
&gt;=C2=A0 =C2=A0 =C2=A0WARNING: unmet direct dependencies detected for SN=
D_SOC_WM9713<br>
&gt;<br>
&gt; ---------------------------------------------------------------------=
-----------<br>
&gt; qcom_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches<br>
&gt;<br>
&gt; ---------------------------------------------------------------------=
-----------<br>
&gt; qi_lb60_defconfig (mips, gcc-8) =E2=80=94 FAIL, 1 error, 1 warning, 0=
 section mismatches<br>
&gt;<br>
&gt; Errors:<br>
&gt;=C2=A0 =C2=A0 =C2=A0mm/memory.c:1523:41: error: implicit declaration o=
f function =E2=80=98pte_index=E2=80=99; did you mean =E2=80=98page_index=E2=
=
=80=99? [-Werror=3Dimplicit-function-declaration]<br>
&gt;<br>
&gt; Warnings:<br>
&gt;=C2=A0 =C2=A0 =C2=A0cc1: some warnings being treated as errors<br>
&gt;<br>
&gt; ---------------------------------------------------------------------=
-----------<br>
&gt; rb532_defconfig (mips, gcc-8) =E2=80=94 FAIL, 1 error, 1 warning, 0 s=
ection mismatches<br>
&gt;<br>
&gt; Errors:<br>
&gt;=C2=A0 =C2=A0 =C2=A0mm/memory.c:1523:41: error: implicit declaration o=
f function =E2=80=98pte_index=E2=80=99; did you mean =E2=80=98page_index=E2=
=
=80=99? [-Werror=3Dimplicit-function-declaration]<br>
&gt;<br>
&gt; Warnings:<br>
&gt;=C2=A0 =C2=A0 =C2=A0cc1: some warnings being treated as errors<br>
&gt;<br>
&gt; ---------------------------------------------------------------------=
-----------<br>
&gt; rbtx49xx_defconfig (mips, gcc-8) =E2=80=94 FAIL, 1 error, 1 warning, =
0 section mismatches<br>
&gt;<br>
&gt; Errors:<br>
&gt;=C2=A0 =C2=A0 =C2=A0mm/memory.c:1523:41: error: implicit declaration o=
f function =E2=80=98pte_index=E2=80=99; did you mean =E2=80=98page_index=E2=
=
=80=99? [-Werror=3Dimplicit-function-declaration]<br>
&gt;<br>
&gt; Warnings:<br>
&gt;=C2=A0 =C2=A0 =C2=A0cc1: some warnings being treated as errors<br>
&gt;<br>
&gt; ---------------------------------------------------------------------=
-----------<br>
&gt; realview_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings,=
 0 section mismatches<br>
&gt;<br>
&gt; ---------------------------------------------------------------------=
-----------<br>
&gt; rm200_defconfig (mips, gcc-8) =E2=80=94 FAIL, 1 error, 1 warning, 0 s=
ection mismatches<br>
&gt;<br>
&gt; Errors:<br>
&gt;=C2=A0 =C2=A0 =C2=A0mm/memory.c:1523:41: error: implicit declaration o=
f function =E2=80=98pte_index=E2=80=99; did you mean =E2=80=98page_index=E2=
=
=80=99? [-Werror=3Dimplicit-function-declaration]<br>
&gt;<br>
&gt; Warnings:<br>
&gt;=C2=A0 =C2=A0 =C2=A0cc1: some warnings being treated as errors<br>
&gt;<br>
&gt; ---------------------------------------------------------------------=
-----------<br>
&gt; rpc_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches<br>
&gt;<br>
&gt; ---------------------------------------------------------------------=
-----------<br>
&gt; rt305x_defconfig (mips, gcc-8) =E2=80=94 FAIL, 1 error, 1 warning, 0 =
section mismatches<br>
&gt;<br>
&gt; Errors:<br>
&gt;=C2=A0 =C2=A0 =C2=A0mm/memory.c:1523:41: error: implicit declaration o=
f function =E2=80=98pte_index=E2=80=99; did you mean =E2=80=98page_index=E2=
=
=80=99? [-Werror=3Dimplicit-function-declaration]<br>
&gt;<br>
&gt; Warnings:<br>
&gt;=C2=A0 =C2=A0 =C2=A0cc1: some warnings being treated as errors<br>
&gt;<br>
&gt; ---------------------------------------------------------------------=
-----------<br>
&gt; rv32_defconfig (riscv, gcc-8) =E2=80=94 PASS, 0 errors, 6 warnings, 0=
 section mismatches<br>
&gt;<br>
&gt; Warnings:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;stdin&gt;:830:2: warning: #warning syscall fst=
at64 not implemented [-Wcpp]<br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;stdin&gt;:1127:2: warning: #warning syscall fs=
tatat64 not implemented [-Wcpp]<br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;stdin&gt;:1511:2: warning: #warning syscall cl=
one3 not implemented [-Wcpp]<br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;stdin&gt;:830:2: warning: #warning syscall fst=
at64 not implemented [-Wcpp]<br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;stdin&gt;:1127:2: warning: #warning syscall fs=
tatat64 not implemented [-Wcpp]<br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;stdin&gt;:1511:2: warning: #warning syscall cl=
one3 not implemented [-Wcpp]<br>
&gt;<br>
&gt; ---------------------------------------------------------------------=
-----------<br>
&gt; s3c2410_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, =
0 section mismatches<br>
&gt;<br>
&gt; ---------------------------------------------------------------------=
-----------<br>
&gt; s3c6400_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, =
0 section mismatches<br>
&gt;<br>
&gt; ---------------------------------------------------------------------=
-----------<br>
&gt; s5pv210_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, =
0 section mismatches<br>
&gt;<br>
&gt; ---------------------------------------------------------------------=
-----------<br>
&gt; sama5_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches<br>
&gt;<br>
&gt; ---------------------------------------------------------------------=
-----------<br>
&gt; sb1250_swarm_defconfig (mips, gcc-8) =E2=80=94 FAIL, 1 error, 1 warni=
ng, 0 section mismatches<br>
&gt;<br>
&gt; Errors:<br>
&gt;=C2=A0 =C2=A0 =C2=A0mm/memory.c:1523:41: error: implicit declaration o=
f function =E2=80=98pte_index=E2=80=99; did you mean =E2=80=98page_index=E2=
=
=80=99? [-Werror=3Dimplicit-function-declaration]<br>
&gt;<br>
&gt; Warnings:<br>
&gt;=C2=A0 =C2=A0 =C2=A0cc1: some warnings being treated as errors<br>
&gt;<br>
&gt; ---------------------------------------------------------------------=
-----------<br>
&gt; shannon_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, =
0 section mismatches<br>
&gt;<br>
&gt; ---------------------------------------------------------------------=
-----------<br>
&gt; shmobile_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings,=
 0 section mismatches<br>
&gt;<br>
&gt; ---------------------------------------------------------------------=
-----------<br>
&gt; simpad_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches<br>
&gt;<br>
&gt; ---------------------------------------------------------------------=
-----------<br>
&gt; socfpga_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, =
0 section mismatches<br>
&gt;<br>
&gt; ---------------------------------------------------------------------=
-----------<br>
&gt; spear13xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings=
, 0 section mismatches<br>
&gt;<br>
&gt; ---------------------------------------------------------------------=
-----------<br>
&gt; spear3xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings,=
 0 section mismatches<br>
&gt;<br>
&gt; ---------------------------------------------------------------------=
-----------<br>
&gt; spear6xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings,=
 0 section mismatches<br>
&gt;<br>
&gt; ---------------------------------------------------------------------=
-----------<br>
&gt; spitz_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches<br>
&gt;<br>
&gt; ---------------------------------------------------------------------=
-----------<br>
&gt; stm32_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches<br>
&gt;<br>
&gt; ---------------------------------------------------------------------=
-----------<br>
&gt; sunxi_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches<br>
&gt;<br>
&gt; ---------------------------------------------------------------------=
-----------<br>
&gt; tango4_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches<br>
&gt;<br>
&gt; ---------------------------------------------------------------------=
-----------<br>
&gt; tb0219_defconfig (mips, gcc-8) =E2=80=94 FAIL, 1 error, 1 warning, 0 =
section mismatches<br>
&gt;<br>
&gt; Errors:<br>
&gt;=C2=A0 =C2=A0 =C2=A0mm/memory.c:1523:41: error: implicit declaration o=
f function =E2=80=98pte_index=E2=80=99; did you mean =E2=80=98page_index=E2=
=
=80=99? [-Werror=3Dimplicit-function-declaration]<br>
&gt;<br>
&gt; Warnings:<br>
&gt;=C2=A0 =C2=A0 =C2=A0cc1: some warnings being treated as errors<br>
&gt;<br>
&gt; ---------------------------------------------------------------------=
-----------<br>
&gt; tb0226_defconfig (mips, gcc-8) =E2=80=94 FAIL, 1 error, 1 warning, 0 =
section mismatches<br>
&gt;<br>
&gt; Errors:<br>
&gt;=C2=A0 =C2=A0 =C2=A0mm/memory.c:1523:41: error: implicit declaration o=
f function =E2=80=98pte_index=E2=80=99; did you mean =E2=80=98page_index=E2=
=
=80=99? [-Werror=3Dimplicit-function-declaration]<br>
&gt;<br>
&gt; Warnings:<br>
&gt;=C2=A0 =C2=A0 =C2=A0cc1: some warnings being treated as errors<br>
&gt;<br>
&gt; ---------------------------------------------------------------------=
-----------<br>
&gt; tb0287_defconfig (mips, gcc-8) =E2=80=94 FAIL, 1 error, 1 warning, 0 =
section mismatches<br>
&gt;<br>
&gt; Errors:<br>
&gt;=C2=A0 =C2=A0 =C2=A0mm/memory.c:1523:41: error: implicit declaration o=
f function =E2=80=98pte_index=E2=80=99; did you mean =E2=80=98page_index=E2=
=
=80=99? [-Werror=3Dimplicit-function-declaration]<br>
&gt;<br>
&gt; Warnings:<br>
&gt;=C2=A0 =C2=A0 =C2=A0cc1: some warnings being treated as errors<br>
&gt;<br>
&gt; ---------------------------------------------------------------------=
-----------<br>
&gt; tct_hammer_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warning=
s, 0 section mismatches<br>
&gt;<br>
&gt; ---------------------------------------------------------------------=
-----------<br>
&gt; tegra_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches<br>
&gt;<br>
&gt; ---------------------------------------------------------------------=
-----------<br>
&gt; tinyconfig (mips, gcc-8) =E2=80=94 FAIL, 1 error, 1 warning, 0 sectio=
n mismatches<br>
&gt;<br>
&gt; Errors:<br>
&gt;=C2=A0 =C2=A0 =C2=A0mm/memory.c:1523:41: error: implicit declaration o=
f function =E2=80=98pte_index=E2=80=99; did you mean =E2=80=98page_index=E2=
=
=80=99? [-Werror=3Dimplicit-function-declaration]<br>
&gt;<br>
&gt; Warnings:<br>
&gt;=C2=A0 =C2=A0 =C2=A0cc1: some warnings being treated as errors<br>
&gt;<br>
&gt; ---------------------------------------------------------------------=
-----------<br>
&gt; tinyconfig (arm64, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches<br>
&gt;<br>
&gt; ---------------------------------------------------------------------=
-----------<br>
&gt; tinyconfig (i386, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches<br>
&gt;<br>
&gt; ---------------------------------------------------------------------=
-----------<br>
&gt; tinyconfig (riscv, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches<br>
&gt;<br>
&gt; ---------------------------------------------------------------------=
-----------<br>
&gt; tinyconfig (arc, gcc-8) =E2=80=94 FAIL, 1 error, 1 warning, 0 section=
 mismatches<br>
&gt;<br>
&gt; Errors:<br>
&gt;=C2=A0 =C2=A0 =C2=A0mm/memory.c:1523:41: error: implicit declaration o=
f function =E2=80=98pte_index=E2=80=99; did you mean =E2=80=98page_index=E2=
=
=80=99? [-Werror=3Dimplicit-function-declaration]<br>
&gt;<br>
&gt; Warnings:<br>
&gt;=C2=A0 =C2=A0 =C2=A0cc1: some warnings being treated as errors<br>
&gt;<br>
&gt; ---------------------------------------------------------------------=
-----------<br>
&gt; tinyconfig (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sec=
tion mismatches<br>
&gt;<br>
&gt; Warnings:<br>
&gt;=C2=A0 =C2=A0 =C2=A0.config:1167:warning: override: UNWINDER_GUESS cha=
nges choice state<br>
&gt;<br>
&gt; ---------------------------------------------------------------------=
-----------<br>
&gt; tinyconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches<br>
&gt;<br>
&gt; ---------------------------------------------------------------------=
-----------<br>
&gt; trizeps4_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings,=
 0 section mismatches<br>
&gt;<br>
&gt; ---------------------------------------------------------------------=
-----------<br>
&gt; u300_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches<br>
&gt;<br>
&gt; ---------------------------------------------------------------------=
-----------<br>
&gt; u8500_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches<br>
&gt;<br>
&gt; ---------------------------------------------------------------------=
-----------<br>
&gt; vdk_hs38_defconfig (arc, gcc-8) =E2=80=94 FAIL, 1 error, 1 warning, 0=
 section mismatches<br>
&gt;<br>
&gt; Errors:<br>
&gt;=C2=A0 =C2=A0 =C2=A0mm/memory.c:1523:41: error: implicit declaration o=
f function =E2=80=98pte_index=E2=80=99; did you mean =E2=80=98page_index=E2=
=
=80=99? [-Werror=3Dimplicit-function-declaration]<br>
&gt;<br>
&gt; Warnings:<br>
&gt;=C2=A0 =C2=A0 =C2=A0cc1: some warnings being treated as errors<br>
&gt;<br>
&gt; ---------------------------------------------------------------------=
-----------<br>
&gt; vdk_hs38_smp_defconfig (arc, gcc-8) =E2=80=94 FAIL, 1 error, 1 warnin=
g, 0 section mismatches<br>
&gt;<br>
&gt; Errors:<br>
&gt;=C2=A0 =C2=A0 =C2=A0mm/memory.c:1523:41: error: implicit declaration o=
f function =E2=80=98pte_index=E2=80=99; did you mean =E2=80=98page_index=E2=
=
=80=99? [-Werror=3Dimplicit-function-declaration]<br>
&gt;<br>
&gt; Warnings:<br>
&gt;=C2=A0 =C2=A0 =C2=A0cc1: some warnings being treated as errors<br>
&gt;<br>
&gt; ---------------------------------------------------------------------=
-----------<br>
&gt; versatile_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings=
, 0 section mismatches<br>
&gt;<br>
&gt; ---------------------------------------------------------------------=
-----------<br>
&gt; vexpress_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings,=
 0 section mismatches<br>
&gt;<br>
&gt; ---------------------------------------------------------------------=
-----------<br>
&gt; vf610m4_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, =
0 section mismatches<br>
&gt;<br>
&gt; ---------------------------------------------------------------------=
-----------<br>
&gt; viper_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches<br>
&gt;<br>
&gt; ---------------------------------------------------------------------=
-----------<br>
&gt; vocore2_defconfig (mips, gcc-8) =E2=80=94 FAIL, 1 error, 1 warning, 0=
 section mismatches<br>
&gt;<br>
&gt; Errors:<br>
&gt;=C2=A0 =C2=A0 =C2=A0mm/memory.c:1523:41: error: implicit declaration o=
f function =E2=80=98pte_index=E2=80=99; did you mean =E2=80=98page_index=E2=
=
=80=99? [-Werror=3Dimplicit-function-declaration]<br>
&gt;<br>
&gt; Warnings:<br>
&gt;=C2=A0 =C2=A0 =C2=A0cc1: some warnings being treated as errors<br>
&gt;<br>
&gt; ---------------------------------------------------------------------=
-----------<br>
&gt; vt8500_v6_v7_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warni=
ngs, 0 section mismatches<br>
&gt;<br>
&gt; ---------------------------------------------------------------------=
-----------<br>
&gt; workpad_defconfig (mips, gcc-8) =E2=80=94 FAIL, 1 error, 1 warning, 0=
 section mismatches<br>
&gt;<br>
&gt; Errors:<br>
&gt;=C2=A0 =C2=A0 =C2=A0mm/memory.c:1523:41: error: implicit declaration o=
f function =E2=80=98pte_index=E2=80=99; did you mean =E2=80=98page_index=E2=
=
=80=99? [-Werror=3Dimplicit-function-declaration]<br>
&gt;<br>
&gt; Warnings:<br>
&gt;=C2=A0 =C2=A0 =C2=A0cc1: some warnings being treated as errors<br>
&gt;<br>
&gt; ---------------------------------------------------------------------=
-----------<br>
&gt; x86_64_defconfig (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings=
, 0 section mismatches<br>
&gt;<br>
&gt; ---------------------------------------------------------------------=
-----------<br>
&gt; x86_64_defconfig+kselftest (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, =
0 warnings, 0 section mismatches<br>
&gt;<br>
&gt; ---------------------------------------------------------------------=
-----------<br>
&gt; x86_64_defconfig+kvm_guest (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, =
0 warnings, 0 section mismatches<br>
&gt;<br>
&gt; ---------------------------------------------------------------------=
-----------<br>
&gt; xcep_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches<br>
&gt;<br>
&gt; ---------------------------------------------------------------------=
-----------<br>
&gt; xway_defconfig (mips, gcc-8) =E2=80=94 FAIL, 1 error, 1 warning, 0 se=
ction mismatches<br>
&gt;<br>
&gt; Errors:<br>
&gt;=C2=A0 =C2=A0 =C2=A0mm/memory.c:1523:41: error: implicit declaration o=
f function =E2=80=98pte_index=E2=80=99; did you mean =E2=80=98page_index=E2=
=
=80=99? [-Werror=3Dimplicit-function-declaration]<br>
&gt;<br>
&gt; Warnings:<br>
&gt;=C2=A0 =C2=A0 =C2=A0cc1: some warnings being treated as errors<br>
&gt;<br>
&gt; ---------------------------------------------------------------------=
-----------<br>
&gt; zeus_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches<br>
&gt;<br>
&gt; ---------------------------------------------------------------------=
-----------<br>
&gt; zx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches<br>
&gt;<br>
&gt; ---<br>
&gt; For more info write to &lt;<a href=3D"mailto:info@kernelci.org" targe=
t=3D"_blank">info@kernelci.org</a>&gt;<br>
&gt;<br>
&gt; --<br>
&gt; You received this message because you are subscribed to the Google Gr=
oups &quot;Clang Built Linux&quot; group.<br>
&gt; To unsubscribe from this group and stop receiving emails from it, sen=
d an email to <a href=3D"mailto:clang-built-linux%2Bunsubscribe@googlegroup=
s.com" target=3D"_blank">clang-built-linux+unsubscribe@googlegroups.com</a>=
.<br>
&gt; To view this discussion on the web visit <a href=3D"https://groups.go=
ogle.com/d/msgid/clang-built-linux/5e57d0a2.1c69fb81.b44cf.2a50%40mx.google=
.com" rel=3D"noreferrer" target=3D"_blank">https://groups.google.com/d/msgi=
d/clang-built-linux/5e57d0a2.1c69fb81.b44cf.2a50%40mx.google.com</a>.<br>
<br>
<br>
<br>
-- <br>
Thanks,<br>
~Nick Desaulniers<br>
<br>
<br>
<br>
</blockquote></div></div>

--0000000000000f4d3e059f94b10b--
