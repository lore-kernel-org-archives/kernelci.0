Return-Path: <khilman@baylibre.com>
References: <CAOi56cVeis2079Fe_Kn9zRf5AZcZf0rRz+z_5xYM81hB_6P6eA@mail.gmail.com> <4aeb14c51ed09fffc4273795eb3c3fb7958c522f.camel@synopsys.com>
From: "Kevin Hilman" <khilman@baylibre.com>
Subject: Re: kernelCI: kernel builds for ARCH=arc
In-reply-to: <4aeb14c51ed09fffc4273795eb3c3fb7958c522f.camel@synopsys.com>
Date: Mon, 05 Nov 2018 14:54:02 -0800
Message-ID: <7hftwf3zlh.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
List-ID: <kernelci.groups.io>
To: Alexey Brodkin <alexey.brodkin@synopsys.com>
Cc: "khilman@baylibre.com" <khilman@baylibre.com>, Vineet Gupta <vineet.gupta1@synopsys.com>, "kernelci@groups.io" <kernelci@groups.io>


Alexey Brodkin writes:

> Hi Kevin,
>
> On Mon, 2018-11-05 at 09:18 -0800, Kevin Hilman wrote:
>> Hi Alexy,
>>
>> I'm working on the kernelCI build side for ARCH=arc, and running into
>> some basic build issues with the compilers you pointed me to.
>>
>> First, on some of the builds, we're seeing:
>>
>> arch/arc/Makefile:27: *** Toolchain not configured for ARCompact builds.  Stop.
>>
>> In an earlier thread, you mentioned only focusing on ARCv2 ISA.
>> Are some of the upstream defconfigs configured for ARCompact?  If so,
>> could you tell us which defconfigs we should enable?
>
> Ideally all our defconfigs could be built - we have [just] 17 of them.
> I'm not sure how much you'd like or may build though.

For now, I'd like to stick with 1 toolchain per arch, so based on the
info below, that will limit us to just the defconfigs that support
ARCv2.

> The most important is "hsdk_defconfig" because that's the one you'll
> need to run on the board.
>
> Now if you'd like to only build a couple of configs for ARC I'd say it would be good
> indeed to build both ARCompact and ARCv2 configs.
>
> ARCv2 configs are:
> ------------------------------>8---------------------------
> # git grep "CONFIG_ISA_ARCV2=y" arch/arc/configs
>
> arch/arc/configs/axs103_defconfig:24:CONFIG_ISA_ARCV2=y
> arch/arc/configs/axs103_smp_defconfig:24:CONFIG_ISA_ARCV2=y
> arch/arc/configs/haps_hs_defconfig:22:CONFIG_ISA_ARCV2=y
> arch/arc/configs/haps_hs_smp_defconfig:24:CONFIG_ISA_ARCV2=y
> arch/arc/configs/hsdk_defconfig:19:CONFIG_ISA_ARCV2=y
> arch/arc/configs/nsim_hs_defconfig:27:CONFIG_ISA_ARCV2=y
> arch/arc/configs/nsim_hs_smp_defconfig:25:CONFIG_ISA_ARCV2=y
> arch/arc/configs/nsimosci_hs_defconfig:24:CONFIG_ISA_ARCV2=y
> arch/arc/configs/nsimosci_hs_smp_defconfig:19:CONFIG_ISA_ARCV2=y
> arch/arc/configs/vdk_hs38_defconfig:15:CONFIG_ISA_ARCV2=y
> arch/arc/configs/vdk_hs38_smp_defconfig:15:CONFIG_ISA_ARCV2=y
> ------------------------------>8---------------------------
>
> Others are ARCompact.
>
> And for minimal setup I'd add "nsim_hs_defconfig" (that's ARCv2 config for
> simulator) and "nsim_700_defconfig" (ARCompact config for simulator)
> to already mentioned "hsdk_defconfig".
>
>> Also, I tried the latest release from here:
>> https://urldefense.proofpoint.com/v2/url?u=https-3A__github.com_foss-2Dfor-2Dsynopsys-2Ddwc-2Darc-2Dprocessors_toolchain_releases_&d=DwIBaQ&c=DPL6_X_6JkXFx7AXWqB0tg&r=lqdeeSSEes0GFDDl656eViXO7breS55ytWkhpk5R81I&m=Zme7Q1nCF-s71OkG89tVXtiv6vcwQBJtnKjMxlogIlU&s=PvPLFgqnZ-B-WiJlY9G_5QrxaVvIjHkgRHvMeIgVaKQ&e=
>>
>> And specifically, I tried the 2018.09-rc1 prebuilt_glibc release, and
>> I'm getting a bunch of link failures at the end due to mismatch
>> architectures.   I get the same results with the 2018.03 release
>> whether I try the glibc or the uclibc release.
>>
>> Below is a log from an attempt with the v4.19 kernel, but I see the
>> same thing with the latest mainline (v4.20-rc1).
>>
>> Any suggestions on what I'm doing wrong here with the toolchain setup?
>
> I guess the problem is you try to use the same one toolchain
> for both ARCv2 and ARCompact builds. And this doesn't work because
> we import libgcc from the toolchain and essentially libgcc built for
> ARCv2 couldn't be linked with other code built for ARCompact.
>
> See all those mentioned library objects like "_muldi3", "_umodsi3"
> etc come exactly from libgcc.
>
> So solution here is to use 2 separate toolchains for ARCv2 and ARCompact.
>
> Also note messages like "arch/arc/Makefile:27: *** Toolchain not configured for ARCompact builds."
> are gone with older kernels as in 4.19 I removed it, see
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=615f64458ad890ef94abc879a66d8b27236e733a
>
> I did it to enable use of so-called multilib toolchains...
>
> But neither of toolchains from our release page are multilib [yet].
>
> That said you may only use
> https://github.com/foss-for-synopsys-dwc-arc-processors/toolchain/releases/download/arc-2018.09-rc1/arc_gnu_2018.09-rc1_prebuilt_glibc_le_archs_linux_install.tar.gz
> for building ARCv2 configs... i.e. for example "hsdk_defconfig" and "nsim_hs_defconfig".
>
> And for "nsim_700_defconfig" you'll need to use
> https://github.com/foss-for-synopsys-dwc-arc-processors/toolchain/releases/download/arc-2018.09-rc1/arc_gnu_2018.09-rc1_prebuilt_uclibc_le_arc700_linux_install.tar.gz
>
> If you really want to have one toolchain for both ARC versions you may
> build it with help of Crosstool-NG - use "arc-multilib-linux-uclibc" sample for that.
>
> Let me know if there are still any questions or issues.

Thanks for clarifying.

I just realized the default defconfig selected when doing a "make
defconfig" is and ARCompact config, and the toolchain is ARCv2, hence
the mismatch.

Since we currently only support a single toolchain per arch, I'll stick
with ARCv2 since that's the hardware we also have.

I'll have to cleanup our defconfig selection for ARCH=arc so that it
only enables ARCv2 configs.

Thanks,

Kevin
