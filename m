Subject: Re: Participate in build test (MIPS/Loongson)
References: <17159ea67a7.13d5ba30b1709.5131811758859128540@flygoat.com>
 <7ho8os4i3c.fsf@baylibre.com>
 <2821325d-56d7-4770-6027-fb30097f6a7b@flygoat.com>
 <bf280d0a-9289-1048-a8a4-f3e2972196d4@flygoat.com>
 <7himerqqk4.fsf@baylibre.com>
 <afbf29a2-8a8c-c301-b806-5d9e161f4615@flygoat.com>
From: "Guillaume Tucker" <guillaume.tucker@collabora.com>
Message-ID: <baf890b6-2349-7be3-9200-c128d4dc33f0@collabora.com>
Date: Mon, 20 Jul 2020 08:58:08 +0100
MIME-Version: 1.0
In-Reply-To: <afbf29a2-8a8c-c301-b806-5d9e161f4615@flygoat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
List-ID: <kernelci.groups.io>
To: jiaxun.yang@flygoat.com, Kevin Hilman <khilman@baylibre.com>
Cc: kernelci@groups.io, Corentin Labbe <clabbe@baylibre.com>

On 18/07/2020 03:18, Jiaxun Yang wrote:
>=20
>=20
> =E5=9C=A8 2020/7/14 1:21, Kevin Hilman =E5=86=99=E9=81=93:
>> Jiaxun Yang <jiaxun.yang@flygoat.com> writes:
>>
>>> =E5=9C=A8 2020/7/7 8:43, Jiaxun Yang =E5=86=99=E9=81=93:
>>>>
>>>> =E5=9C=A8 2020/7/7 2:24, Kevin Hilman =E5=86=99=E9=81=93:
>>>>> Hi Jianxun,
>>>>>
>>>>> Jiaxun Yang<jiaxun.yang@flygoat.com>=C2=A0 writes:
>>>>>
>>>>>> I'm a maintainer of MIPS/LOONGSON64 and MIPS/LOONGSON2EF support in
>>>>>> kernel, and I would like to enable build test for these platforms i=
n
>>>>>> KernelCI. Also I will respond to their build failures.
>>>>>>
>>>>>> Currently it's hard for me to provide hardware to perform boot test=
 as
>>>>>> a amateur, but Fuloong2E has already accepted by QEMU and we can
>>>>>> perform boot test on it for LOONGSON2EF.
>>>>>>
>>>>>> Please give me some instructions.
>>>>>>
>>>>>> Btw: MIPS/malta is not under my maintenance but I can also respond =
to
>>>>>> it's build failure and QEMU boot failure. I'd like to apply for thi=
s
>>>>>> platform too if I'm eligible.
>>>>> I don't think we're doing any MIPS boots on QEMU currently, but we c=
an
>>>>> probably add that if you can give us a bit of guidance.=C2=A0 I've a=
lso cc'd
>>>>> Corentin who has been working on QEMU support for more platforms.
>>>>>
>>>>> Can you share with us more details on QEMU version that is known to =
work
>>>>> well for upstream MIPS kernels, and the qemu cmdline that you use to
>>>>> boot upstream kernels?=C2=A0 With that, we can guide you on how to a=
dd
>>>>> support.
>>>> Sure, with QEMU 4.2/5.0:
>>> Forget to mention that I'd also have to select some drivers to get it =
boot.
>>> I saw clabbe's work on github. Will discuss here.
>> Also, can you keep an eye on the MIPS build results?=C2=A0 At least on
>> stable, mainline and linux-next?
> I will, just looking at mailing list?

You can subscribe to kernelci-results@groups.io:

  https://groups.io/g/kernelci-results

Also you can look for results on the web dashboard, for example:

  https://kernelci.org/build/next/branch/master/kernel/next-20200717/

If you type "mips" in the search box you'll see only the MIPS
builds there.

Thanks,
Guillaume
