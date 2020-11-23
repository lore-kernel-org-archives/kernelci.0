Return-Path: <dan.rue@linaro.org>
Date: Mon, 23 Nov 2020 11:05:13 -0600
From: "Dan Rue" <dan.rue@linaro.org>
Subject: Re: TuxBuild Now Supports Clang 11 and 5 new architectures
Message-ID: <20201123170513.mdfs53skfdcux7jm@jug>
References: <CAGm4vTM-ozY8wSsuZhqCsz8qnrjaCRkmLnLJVkuYB6sVUaqnuQ@mail.gmail.com>
 <b455831c-1205-551f-6bb2-6bb33b750d17@collabora.com>
MIME-Version: 1.0
In-Reply-To: <b455831c-1205-551f-6bb2-6bb33b750d17@collabora.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
List-ID: <kernelci.groups.io>
To: Guillaume Tucker <guillaume.tucker@collabora.com>
Cc: tuxbuild <tuxbuild@linaro.org>, clang-built-linux <clang-built-linux@googlegroups.com>, kernelci@groups.io

On Thu, Nov 19, 2020 at 09:13:41AM +0000, Guillaume Tucker wrote:
> Hi Dan,

Hi Guillaume!

>=20
> On 17/11/2020 21:41, Dan Rue wrote:
> > Cheers!
> >=20
> > Today we've deployed support for clang-11, and we dropped support for c=
lang 8 and 9 based on user feedback.
> >=20
> > In addition, we have added the following architectures with gcc 8, 9, a=
nd 10:
> > - s390
> > - powerpc
> > - sparc
> > - hppa
> > - sh
> >=20
> > TuxBuild's full support matrix is as follows:
> >=20
> > =A0 =A0 =A0 =A0 =A0arc arm arm64 hppa i386 mips powerpc riscv s390 sh =
=A0sparc x86_64
> > clang-10 no =A0yes yes =A0 no =A0 yes =A0yes =A0no =A0 =A0 =A0yes =A0 n=
o =A0 no =A0no =A0 =A0yes
> > clang-11 no =A0yes yes =A0 no =A0 yes =A0yes =A0no =A0 =A0 =A0yes =A0 n=
o =A0 no =A0no =A0 =A0yes
>=20
> Out of interest, are there builds produced with tuxbuild for all
> the supported configurations that can be downloaded with a build
> log?

I don't think there's anything published, but Antonio might have
something related to the container tests that are done in tuxmake before
publishing new containers.

>=20
> I've just been working on building riscv with Clang for KernelCI
> and there are quite a few issues, we've dropped clang-10 as it's
> actually broken.  So I wonder if you define "supported" solely by
> having a Docker image and the ability to start a build, or if
> it's required to actually complete a kernel build?
>=20
> See related discussion about riscv here:
>=20
>   https://github.com/kernelci/kernelci-core/pull/534

If there is a legitimate problem in the kernel sources or in a toolchain
implementation, the tuxmake would be expected to fail, and tuxmake
shouldn't work around things that are broken.

If tuxmake is doing the wrong thing, then it's a bug that we should fix.

If a combination might work but currently doesn't, tuxmake can support
it. If it will never work, we won't bother.

`tuxmake -r podman -t riscv -t clang-10` works for me on v5.10-rc5.
Here's the tuxbuild of the same, with logs and such:
https://builds.tuxbuild.com/1khN9GYmp4AKa1g6m4MwM7yhgnE/

>=20
>=20
> > gcc-10 =A0 no =A0yes yes =A0 yes =A0yes =A0yes =A0yes =A0 =A0 yes =A0 y=
es =A0yes yes =A0 yes
> > gcc-8 =A0 =A0yes yes yes =A0 yes =A0yes =A0yes =A0yes =A0 =A0 yes =A0 y=
es =A0yes yes =A0 yes
> > gcc-9 =A0 =A0yes yes yes =A0 yes =A0yes =A0yes =A0yes =A0 =A0 yes =A0 y=
es =A0yes yes =A0 yes
> >=20
> > We're still updating the tuxbuild documentation, but the new toolchains=
 and architectures are available immediately without a tuxbuild update (the=
 argument validation is all done server-side).
> >=20
> > Now that we have TuxMake integration which is enabling these new featur=
es, we would like to add tuxmake build reproducers to tuxbuild. A build rep=
roducer is a simple one-line shell script provided alongside the other tuxb=
uild artifacts, which contain the tuxmake command-line invocation to perfor=
m the same build locally. For example:
> >=20
> > =A0 =A0 $ cat tuxmake_reproducer.sh
> > =A0 =A0 tuxmake --runtime docker --image docker.io/tuxmake/arm64_clang-=
11 <http://docker.io/tuxmake/arm64_clang-11> --target-arch arm64 --kconfig =
defconfig --kconfig-add "CONFIG_KASAN=3Dy" --toolchain clang-11
>=20
> That's nice but I believe it would be easier to adopt if the
> syntax was simpler.  For example:
>=20
>   tuxmake --runtime docker --target-arch arm64 --kconfig defconfig --kcon=
fig-add "CONFIG_KASAN=3Dy" --toolchain clang-11
>=20
> or if you really want to keep the docker image mentioned to
> ensure reproducibility:
>=20
>   tuxmake --runtime docker --image docker.io/tuxmake/arm64_clang-11 --kco=
nfig defconfig --kconfig-add "CONFIG_KASAN=3Dy"
>=20
> I can see why you would want to define all the parameters
> explicitly, but it seems like there's some repetition there.  If
> the docker image is already arch-specific, then do you also need
> to specify the arch as a separate parameter?

You're right, --image in the above example was superfluous. We were
struggling to decide how granular to be with reproducers because you can
be as simple as:

    tuxmake --runtime docker --target-arch x86_64 --kconfig defconfig --too=
lchain gcc

And as "correct" as e.g.:

    tuxmake --image docker.io/tuxmake/x86_64_gcc@sha256:f8218cbfad8ecf6628f=
c44db864a402070feb87ff43a880e1409649172d4bc8c -r docker --target-arch x86_6=
4 --kconfig tinyconfig --toolchain gcc -e "KBUILD_BUILD_TIMESTAMP=3D'Tue Ma=
y 26 16:16:14 2020 -0500'" -e "KBUILD_BUILD_USER=3Dtuxmake" -e "KBUILD_BUIL=
D_HOST=3Dtuxmake"

The latter provides (at least potentially) an actual reproducible build,
but the former is simpler and usually sufficient.

We decided to favor simplicity and all tuxbuilds now publish a
tuxbuild_reproducer.sh and tuxmake_reproducer.sh which consists of the
simple version of the command.

For example in the risc5/clang-10 build from above, we see the following
two reproducers now:

tuxbuild_reproducer.sh:
https://builds.tuxbuild.com/1khN9GYmp4AKa1g6m4MwM7yhgnE/tuxbuild_reproducer=
.sh

    #!/bin/sh

    tuxbuild build --git-repo https://git.kernel.org/pub/scm/linux/kernel/g=
it/torvalds/linux.git --git-sha 418baf2c28f3473039f2f7377760bd8f6897ae18 --=
target-arch riscv --toolchain clang-10 --kconfig defconfig


tuxmake_reproducer.sh:
https://builds.tuxbuild.com/1khN9GYmp4AKa1g6m4MwM7yhgnE/tuxmake_reproducer.=
sh

    #!/bin/sh

    tuxmake --runtime docker --target-arch riscv --toolchain clang-10 --kco=
nfig defconfig


Hope that helps!
Dan

>=20
> Best wishes,
> Guillaume
>=20
> > As a kernel developer, would you appreciate receiving such a command as=
 a part of a build discussion on a mailing list?
> >=20
> > Would you send something like that to your colleagues?
> >=20
> > Do you find the concept of a local reproducer helpful?
> >=20
> > Thanks again to everyone using and supporting TuxBuild and TuxMake - we=
 see you and we appreciate you,
> >=20
> > Dan
> >=20
> > p.s. Did you know that it's possible to perform actual reproducible bui=
lds with tuxmake? It's true. Try it for yourself, and see if your bzImage s=
ha256sum matches:
> >=20
> > =A0 =A0 $ git describe
> > =A0 =A0 v5.10-rc4
> > =A0 =A0 $ tuxmake --image docker.io/tuxmake/x86_64_gcc@sha256:f8218cbfa=
d8ecf6628fc44db864a402070feb87ff43a880e1409649172d4bc8c <http://docker.io/t=
uxmake/x86_64_gcc@sha256:f8218cbfad8ecf6628fc44db864a402070feb87ff43a880e14=
09649172d4bc8c> -r docker -k tinyconfig -e "KBUILD_BUILD_TIMESTAMP=3D'Tue M=
ay 26 16:16:14 2020 -0500'" -e "KBUILD_BUILD_USER=3Dtuxmake" -e "KBUILD_BUI=
LD_HOST=3Dtuxmake"
> > =A0 =A0 ...
> > =A0 =A0 $ sha256sum /home/drue/.cache/tuxmake/builds/634/bzImage=A0
> > =A0 =A0 5581ed4583fb4b9d76760ee329e248fe7281d7ea3b6ae0737efc7a6a4462aff=
a =A0/home/drue/.cache/tuxmake/builds/634/bzImage
> >=20
> > p.p.s. Did you know that tuxmake also supports podman? Just use -r podm=
an instead of -r docker.
>=20

--=20
Linaro LKFT
https://lkft.linaro.org
