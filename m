Return-Path: <khilman@baylibre.com>
From: "Kevin Hilman" <khilman@baylibre.com>
Subject: Re: Participate in build test (MIPS/Loongson)
In-Reply-To: <bf280d0a-9289-1048-a8a4-f3e2972196d4@flygoat.com>
References: <17159ea67a7.13d5ba30b1709.5131811758859128540@flygoat.com> <7ho8os4i3c.fsf@baylibre.com> <2821325d-56d7-4770-6027-fb30097f6a7b@flygoat.com> <bf280d0a-9289-1048-a8a4-f3e2972196d4@flygoat.com>
Date: Mon, 13 Jul 2020 10:21:15 -0700
Message-ID: <7himerqqk4.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
List-ID: <kernelci.groups.io>
To: Jiaxun Yang <jiaxun.yang@flygoat.com>, kernelci@groups.io, info <info@kernelci.org>
Cc: Corentin Labbe <clabbe@baylibre.com>

Jiaxun Yang <jiaxun.yang@flygoat.com> writes:

> =E5=9C=A8 2020/7/7 8:43, Jiaxun Yang =E5=86=99=E9=81=93:
>>
>>
>> =E5=9C=A8 2020/7/7 2:24, Kevin Hilman =E5=86=99=E9=81=93:
>>> Hi Jianxun,
>>>
>>> Jiaxun Yang<jiaxun.yang@flygoat.com>  writes:
>>>
>>>> I'm a maintainer of MIPS/LOONGSON64 and MIPS/LOONGSON2EF support in
>>>> kernel, and I would like to enable build test for these platforms in
>>>> KernelCI. Also I will respond to their build failures.
>>>>
>>>> Currently it's hard for me to provide hardware to perform boot test a=
s
>>>> a amateur, but Fuloong2E has already accepted by QEMU and we can
>>>> perform boot test on it for LOONGSON2EF.
>>>>
>>>> Please give me some instructions.
>>>>
>>>> Btw: MIPS/malta is not under my maintenance but I can also respond to
>>>> it's build failure and QEMU boot failure. I'd like to apply for this
>>>> platform too if I'm eligible.
>>> I don't think we're doing any MIPS boots on QEMU currently, but we can
>>> probably add that if you can give us a bit of guidance.  I've also cc'=
d
>>> Corentin who has been working on QEMU support for more platforms.
>>>
>>> Can you share with us more details on QEMU version that is known to wo=
rk
>>> well for upstream MIPS kernels, and the qemu cmdline that you use to
>>> boot upstream kernels?  With that, we can guide you on how to add
>>> support.
>>
>> Sure, with QEMU 4.2/5.0:
>
> Forget to mention that I'd also have to select some drivers to get it bo=
ot.
> I saw clabbe's work on github. Will discuss here.

Also, can you keep an eye on the MIPS build results?  At least on
stable, mainline and linux-next?

Thanks,

Kevin
