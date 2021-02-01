Date: Tue, 2 Feb 2021 00:52:12 +0100 (CET)
From: "Mathieu Acher" <mathieu.acher@irisa.fr>
Message-ID: <1665674197.5891394.1612223532194.JavaMail.zimbra@irisa.fr>
In-Reply-To: <CABXOdTeQQv1kVF9uvU2DPf8ddWd6tzunVmjoGz77eOgbiQgOvA@mail.gmail.com>
References: <20210129212009.GA2659554@localhost> <CAK8P3a19=Zdni0G2LQE58rrdgJ18zNoefio6GwVg36m5B0Eqdg@mail.gmail.com> <CAKwvOdm3sFE=hpai0NLJ_UAYNG2RO2mZGY33uHqmFgZm7fy_KQ@mail.gmail.com> <CABXOdTeQQv1kVF9uvU2DPf8ddWd6tzunVmjoGz77eOgbiQgOvA@mail.gmail.com>
Subject: Re: Minimum supported version of LLVM
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
List-ID: <kernelci.groups.io>
To: kernelci <kernelci@groups.io>, groeck@google.com
Cc: Nick Desaulniers <ndesaulniers@google.com>, Arnd Bergmann <arnd@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Sedat Dilek <sedat.dilek@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, Lukas Bulwahn <lukas.bulwahn@gmail.com>, Kees Cook <keescook@chromium.org>, Marco Elver <elver@google.com>, Dmitry Vyukov <dvyukov@google.com>, Arvind Sankar <nivedita@alum.mit.edu>, Ilie Halip <ilie.halip@gmail.com>, clang-built-linux <clang-built-linux@googlegroups.com>

Hi,=20

My 2 cents here. I've experimented a bit with older versions of the kernel=
 (4.13, 4.15, 4.16) and gcc 8 over tinyconfig/defconfig.=20
It leads to some issues:=20
https://github.com/TuxML/tuxml/issues/30
https://github.com/TuxML/tuxml/issues/31
https://github.com/TuxML/tuxml/issues/32

There is also an interesting bug report by Nathan specifically about 4.14:
https://lkml.org/lkml/2019/4/22/794

My conclusion is that gcc 8 has difficulties for kernel version <=3D 4.16.=
=
=20
There are some patches here and there.

It seems working on 4.17 though.=20
Incidentally or not: Linux 4.17 has been released on 3 June 2018, gcc 8.1 =
on May 2018 ;)=20

> Can you think of a case where an old compiler must be
> used for older versions of kernel sources?

Yes (see above) and I've not tested on randconfig, which may lead to furth=
er bugs/incompatibilities.=20

I'm also wondering: is it worth testing 4.14 (LTS) with versions of gcc >=
=3D 8?=20
As it is a LTS, it seems useful/needed, but it's a bit technical I would s=
ay (patch integration, comprehension of older gcc incompatibilities/bugs, e=
tc.)

Best,=20


--
Dr. Mathieu ACHER, Associate Professor
Univ Rennes, Inria, CNRS, IRISA, France (DiverSE team)
http://www.mathieuacher.com/

----- Mail original -----
> De: "Guenter Roeck via groups.io" <groeck=3Dgoogle.com@groups.io>
> =C0: "kernelci" <kernelci@groups.io>, "Nick Desaulniers" <ndesaulniers@g=
oogle.com>
> Cc: "Arnd Bergmann" <arnd@kernel.org>, "Nathan Chancellor" <nathan@kerne=
l.org>, "Sedat Dilek" <sedat.dilek@gmail.com>,
> "Miguel Ojeda" <ojeda@kernel.org>, "Lukas Bulwahn" <lukas.bulwahn@gmail.=
com>, "Kees Cook" <keescook@chromium.org>,
> "Marco Elver" <elver@google.com>, "Dmitry Vyukov" <dvyukov@google.com>, =
"Arvind Sankar" <nivedita@alum.mit.edu>, "Ilie
> Halip" <ilie.halip@gmail.com>, "clang-built-linux" <clang-built-linux@go=
oglegroups.com>
> Envoy=E9: Mardi 2 F=E9vrier 2021 00:30:33
> Objet: Re: Minimum supported version of LLVM

> On Mon, Feb 1, 2021 at 1:19 PM Nick Desaulniers via groups.io <ndesaulni=
ers=3D
> google.com@groups.io> wrote:
>=20
>> On Fri, Jan 29, 2021 at 3:36 PM Arnd Bergmann <arnd@kernel.org> wrote:
>> >
>> > I'm actually more worried about the reverse: as there is six year
>> > long-term support for kernels, do we expect to be able to build
>> > the oldest kernel with the latest version of llvm at the end of that?
>> >
>> > E.g. would a linux-5.4 that today can be built with clang-8 through
>> > clang-12 allow being built with clang-8 through clang-21 at the
>> > end of its life in 2025, or do we assume that LTS kernel users also
>> > have to use old compilers?
>>
>> I would think so.  The newer compiler should always be better or an
>> improvement.  Can you think of a case where an old compiler must be
>> used for older versions of kernel sources?  Stable has said they will
>> always accept patches for newer toolchain support.
>>
>=20
> v4.4.y, v4.9.y, and v4.14.y require old versions of gcc for some
> architectures.
> New versions of gcc don't work for all architectures either, even
> in the latest kernel, thanks to a variety of gcc bugs. See
> https://github.com/groeck/linux-build-test/blob/master/bin/stable-build-=
arch.sh
> for details.
>=20
> Maybe clang/llvm is going to be better, but I would not bet on it. Maybe=
 we
> should archive this exchange and, 10 years from now, dig it out and have
> a good laugh (sorry, my sarcasm is strong today).
>=20
> Guenter
>=20
>=20
>> --
>> Thanks,
>> ~Nick Desaulniers
>>
>>
>>=20
>>
>>
>>
>=20
>=20
>=20
