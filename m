Subject: Re: TuxBuild Now Supports Clang 11 and 5 new architectures
References: <CAGm4vTM-ozY8wSsuZhqCsz8qnrjaCRkmLnLJVkuYB6sVUaqnuQ@mail.gmail.com>
From: "Guillaume Tucker" <guillaume.tucker@collabora.com>
Message-ID: <b455831c-1205-551f-6bb2-6bb33b750d17@collabora.com>
Date: Thu, 19 Nov 2020 09:13:41 +0000
MIME-Version: 1.0
In-Reply-To: <CAGm4vTM-ozY8wSsuZhqCsz8qnrjaCRkmLnLJVkuYB6sVUaqnuQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
List-ID: <kernelci.groups.io>
To: Dan Rue <dan.rue@linaro.org>
Cc: tuxbuild <tuxbuild@linaro.org>, clang-built-linux <clang-built-linux@googlegroups.com>, kernelci@groups.io

Hi Dan,

On 17/11/2020 21:41, Dan Rue wrote:
> Cheers!
>=20
> Today we've deployed support for clang-11, and we dropped support for cl=
ang 8 and 9 based on user feedback.
>=20
> In addition, we have added the following architectures with gcc 8, 9, an=
d 10:
> - s390
> - powerpc
> - sparc
> - hppa
> - sh
>=20
> TuxBuild's full support matrix is as follows:
>=20
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0arc arm arm64 hppa i386 mips powerpc r=
iscv s390 sh =C2=A0sparc x86_64
> clang-10 no =C2=A0yes yes =C2=A0 no =C2=A0 yes =C2=A0yes =C2=A0no =C2=A0=
 =C2=A0 =C2=A0yes =C2=A0 no =C2=A0 no =C2=A0no =C2=A0 =C2=A0yes
> clang-11 no =C2=A0yes yes =C2=A0 no =C2=A0 yes =C2=A0yes =C2=A0no =C2=A0=
 =C2=A0 =C2=A0yes =C2=A0 no =C2=A0 no =C2=A0no =C2=A0 =C2=A0yes

Out of interest, are there builds produced with tuxbuild for all
the supported configurations that can be downloaded with a build
log?

I've just been working on building riscv with Clang for KernelCI
and there are quite a few issues, we've dropped clang-10 as it's
actually broken.  So I wonder if you define "supported" solely by
having a Docker image and the ability to start a build, or if
it's required to actually complete a kernel build?

See related discussion about riscv here:

  https://github.com/kernelci/kernelci-core/pull/534


> gcc-10 =C2=A0 no =C2=A0yes yes =C2=A0 yes =C2=A0yes =C2=A0yes =C2=A0yes =
=
=C2=A0 =C2=A0 yes =C2=A0 yes =C2=A0yes yes =C2=A0 yes
> gcc-8 =C2=A0 =C2=A0yes yes yes =C2=A0 yes =C2=A0yes =C2=A0yes =C2=A0yes =
=
=C2=A0 =C2=A0 yes =C2=A0 yes =C2=A0yes yes =C2=A0 yes
> gcc-9 =C2=A0 =C2=A0yes yes yes =C2=A0 yes =C2=A0yes =C2=A0yes =C2=A0yes =
=
=C2=A0 =C2=A0 yes =C2=A0 yes =C2=A0yes yes =C2=A0 yes
>=20
> We're still updating the tuxbuild documentation, but the new toolchains =
and architectures are available immediately without a tuxbuild update (the =
argument validation is all done server-side).
>=20
> Now that we have TuxMake integration which is enabling these new feature=
s, we would like to add tuxmake build reproducers to tuxbuild. A build repr=
oducer is a simple one-line shell script provided alongside the other tuxbu=
ild artifacts, which contain the tuxmake command-line invocation to perform=
 the same build locally. For example:
>=20
> =C2=A0 =C2=A0 $ cat tuxmake_reproducer.sh
> =C2=A0 =C2=A0 tuxmake --runtime docker --image docker.io/tuxmake/arm64_c=
lang-11 <http://docker.io/tuxmake/arm64_clang-11> --target-arch arm64 --kco=
nfig defconfig --kconfig-add "CONFIG_KASAN=3Dy" --toolchain clang-11

That's nice but I believe it would be easier to adopt if the
syntax was simpler.  For example:

  tuxmake --runtime docker --target-arch arm64 --kconfig defconfig --kconf=
ig-add "CONFIG_KASAN=3Dy" --toolchain clang-11

or if you really want to keep the docker image mentioned to
ensure reproducibility:

  tuxmake --runtime docker --image docker.io/tuxmake/arm64_clang-11 --kcon=
fig defconfig --kconfig-add "CONFIG_KASAN=3Dy"

I can see why you would want to define all the parameters
explicitly, but it seems like there's some repetition there.  If
the docker image is already arch-specific, then do you also need
to specify the arch as a separate parameter?

Best wishes,
Guillaume

> As a kernel developer, would you appreciate receiving such a command as =
a part of a build discussion on a mailing list?
>=20
> Would you send something like that to your colleagues?
>=20
> Do you find the concept of a local reproducer helpful?
>=20
> Thanks again to everyone using and supporting TuxBuild and TuxMake - we =
see you and we appreciate you,
>=20
> Dan
>=20
> p.s. Did you know that it's possible to perform actual reproducible buil=
ds with tuxmake? It's true. Try it for yourself, and see if your bzImage sh=
a256sum matches:
>=20
> =C2=A0 =C2=A0 $ git describe
> =C2=A0 =C2=A0 v5.10-rc4
> =C2=A0 =C2=A0 $ tuxmake --image docker.io/tuxmake/x86_64_gcc@sha256:f821=
8cbfad8ecf6628fc44db864a402070feb87ff43a880e1409649172d4bc8c <http://docker=
.io/tuxmake/x86_64_gcc@sha256:f8218cbfad8ecf6628fc44db864a402070feb87ff43a8=
80e1409649172d4bc8c> -r docker -k tinyconfig -e "KBUILD_BUILD_TIMESTAMP=3D'=
Tue May 26 16:16:14 2020 -0500'" -e "KBUILD_BUILD_USER=3Dtuxmake" -e "KBUIL=
D_BUILD_HOST=3Dtuxmake"
> =C2=A0 =C2=A0 ...
> =C2=A0 =C2=A0 $ sha256sum /home/drue/.cache/tuxmake/builds/634/bzImage=
=C2=A0
> =C2=A0 =C2=A0 5581ed4583fb4b9d76760ee329e248fe7281d7ea3b6ae0737efc7a6a44=
62affa =C2=A0/home/drue/.cache/tuxmake/builds/634/bzImage
>=20
> p.p.s. Did you know that tuxmake also supports podman? Just use -r podma=
n instead of -r docker.

