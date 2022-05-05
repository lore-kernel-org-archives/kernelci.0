Message-ID: <adcac2f5fdfdaec902e49f08b16924c09cb7d6cf.camel@collabora.com>
Subject: Re: kernelci failures due to "pahole" missing
From: "Denys Fedoryshchenko" <denys.f@collabora.com>
Date: Thu, 05 May 2022 08:23:48 +0300
In-Reply-To: <16EBDBAB78C06CE6.10903@groups.io>
References: 
	  <CAHRSSEwMoYQz2ua+PmFRcWSXJREUtrsKCFdivDJ+XdJP9Di_MQ@mail.gmail.com>
	 <f91a21bd782f3988cb6988ff96558dda036ca16f.camel@collabora.com>
	 <CAHRSSEynGz318YD-TmzZUyXE9ZquLGgoBJJnYzrFsUN8dp8NFA@mail.gmail.com>
	 <16EBDBAB78C06CE6.10903@groups.io>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-ID: <kernelci.groups.io>
To: kernelci@groups.io, Todd Kjos <tkjos@google.com>

Short update.
Some of builders crashed due OOM, but not because of logs,
but because LTO during linking phase consume more than 21Gb of RAM,
and k8s builders allocated for project have only 4Gb allocated.
It is not easy to solve, as it is either require to change LTO to "Thin
LTO" (or disable it totally) to reduce memory consumption, which is not
great, or increase builders size (and that means additional costs and
approvals related to that).
We are discussing on IRC possible solutions to this problem.

On Wed, 2022-05-04 at 12:06 +0300, Denys Fedoryshchenko wrote:
> At the moment I have identified a problem with more packages that are
> missing, now it is python, and i'm adding it as well, but need to
> test
> everything manually, and then on staging.
>=20
> Here is example of build that needs python:
> https://linux.kernelci.org/build/id/6271d9f8c49e05f410dc7b53/
> https://storage.kernelci.org/android/android13-5.10/ASB-2022-04-05_13-5.1=
0-206-g4dce9d7a65b1/arm64/gki_defconfig/clang-14/logs/kernel.log
>=20
> Also, another problem some of the builders crashed, probably due to
> OOM
> or insufficient resources.=C2=A0
> https://linux.kernelci.org/build/id/6271db3a3c249a41a7dc7b48/
> https://storage.kernelci.org/android/android13-5.15/ASB-2022-04-05_13-5.1=
5-1526-g22e9215f1bea/arm64/gki_defconfig/clang-14/logs/kernel.log
>=20
> On manual tests, builds with pahole create about 819Mbyte of
> warnings,
> such as:
> "namespace__recode_dwarf_types: couldn't find 0x13423 type for
> 0x3d6a5
> (member)!"
> I am currently investigating whether these issues are related.=20
> Therefore, it takes a bit more time than i expected, than just adding
> a
> pahole/dwarves package.
>=20
> I will update as soon as more information available.
>=20
> On Tue, 2022-05-03 at 07:45 -0700, Todd Kjos wrote:
> > Denys, Thanks for the update. Do you have a prediction for when it
> > will land?
> >=20
> > On Mon, May 2, 2022 at 9:58 PM Denys Fedoryshchenko
> > <denys.f@collabora.com> wrote:
> > > Hi,=20
> > >=20
> > > We are testing in staging fix for that:
> > > https://github.com/kernelci/kernelci-core/pull/1158
> > >=20
> > > Also i noticed in some cases lz4 package required for this test,
> > > so added it too.
> > >=20
> > > Best regards,
> > > Denys
> > >=20
> > > On Fri, 2022-04-29 at 15:22 -0700, Todd Kjos via groups.io wrote:
> > > > We have a bunch of Android kernel test failures due to missing
> > > > "pahole" in
> > > > the build environment (example android13-5.15 gki_defconfig
> > > >=20
> > > <https://storage.kernelci.org/android/android13-5.15/ASB-2022-04-05_1=
3-5.15-1515-g7a68c2c45139/arm64/gki_defconfig/gcc-10/logs/kernel.log
> > > > >=20
> > > > ):
> > > >=20
> > > >=20
> > > > =C2=A0 LD=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vmlinux.o
> > > > =C2=A0 MODPOST vmlinux.symvers
> > > > =C2=A0 MODINFO modules.builtin.modinfo
> > > > =C2=A0 GEN=C2=A0=C2=A0=C2=A0=C2=A0 modules.builtin
> > > > BTF: .tmp_vmlinux.btf: pahole (pahole) is not available
> > > > Failed to generate BTF for vmlinux
> > > > Try to disable CONFIG_DEBUG_INFO_BTF
> > > > make[1]: *** [/tmp/kci/linux/Makefile:1247: vmlinux] Error 1
> > > > make[1]: Leaving directory '/tmp/kci/linux/build'
> > > > make: *** [Makefile:237: __sub-make] Error 2
> > > > make: Leaving directory '/tmp/kci/linux'
> > > >=20
> > > > Would it be possible to get pahole added to the build
> > > environments
> > > > used to
> > > > build android kernels?
> > > >=20
> > > > -Todd
> > > >=20
> > > >=20
> > > >=20
> > > >=20
> > > >=20
> > >=20
> > >=20
>=20
>=20
>=20
>=20
>=20
>=20
>=20


