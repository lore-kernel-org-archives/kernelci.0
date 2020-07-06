Return-Path: <khilman@baylibre.com>
From: "Kevin Hilman" <khilman@baylibre.com>
Subject: Re: Participate in build test (MIPS/Loongson)
In-Reply-To: <17159ea67a7.13d5ba30b1709.5131811758859128540@flygoat.com>
References: <17159ea67a7.13d5ba30b1709.5131811758859128540@flygoat.com>
Date: Mon, 06 Jul 2020 11:24:39 -0700
Message-ID: <7ho8os4i3c.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
List-ID: <kernelci.groups.io>
To: kernelci@groups.io, jiaxun.yang@flygoat.com, info <info@kernelci.org>
Cc: Corentin Labbe <clabbe@baylibre.com>

Hi Jianxun,

Jiaxun Yang <jiaxun.yang@flygoat.com> writes:

> I'm a maintainer of MIPS/LOONGSON64 and MIPS/LOONGSON2EF support in
> kernel, and I would like to enable build test for these platforms in
> KernelCI. Also I will respond to their build failures.
>
> Currently it's hard for me to provide hardware to perform boot test as
> a amateur, but Fuloong2E has already accepted by QEMU and we can
> perform boot test on it for LOONGSON2EF.
>
> Please give me some instructions.
>
> Btw: MIPS/malta is not under my maintenance but I can also respond to
> it's build failure and QEMU boot failure. I'd like to apply for this
> platform too if I'm eligible.

I don't think we're doing any MIPS boots on QEMU currently, but we can
probably add that if you can give us a bit of guidance.  I've also cc'd
Corentin who has been working on QEMU support for more platforms.

Can you share with us more details on QEMU version that is known to work
well for upstream MIPS kernels, and the qemu cmdline that you use to
boot upstream kernels?  With that, we can guide you on how to add
support.

Kevin




