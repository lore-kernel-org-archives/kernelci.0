Return-Path: <broonie@sirena.org.uk>
Mime-Version: 1.0 (1.0)
Subject: Re: Who should I talk to about making kernel changes that could potential break CI
From: Mark Brown <broonie@sirena.org.uk>
In-Reply-To: <20190625222124.GA79586@armakuni.lastninja.net>
Date: Wed, 26 Jun 2019 12:50:52 +0100
Message-Id: <3752F42D-887C-40E6-B6F5-E9AA69954829@sirena.org.uk>
References: <20190625222124.GA79586@armakuni.lastninja.net>
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable
List-ID: <kernelci.groups.io>
To: kernelci@groups.io, naveen@lastninja.net
Cc: info@kernelci.org


> On 25 Jun 2019, at 23:21, Naveen Nathan <naveen@lastninja.net> wrote:
>=20
> Hi,
>=20
> A few months ago I submitted a patch [1] to make /dev/urandom block unti=
l
> sufficient entropy is gathered; this is blocked by a kernel config
> option CONFIG_SECURE_URANDOM=3D[yn].
>=20
> If set, this will break systemd systems.
>=20
> If set, this will probably break Kernel CI (afaik tests are run on
> Debian which use systemd) - specifically when randconfig is used
> and the config option is set to y.

KernelCI doesn=E2=80=99t do randconfigs so it won=E2=80=99t be affected.=
=20

>=20
> There is no longer a 'CONFIG_EXPERIMENTAL', to depend/block on, so
> I cannot rely on that going forward.
>=20
> I was hoping to work with the Kernel CI peeps to see if we can prepare
> the Kernel CI system to support this config option.
>=20
> Thanks,
> Naveen
>=20
> [1]: https://lore.kernel.org/patchwork/patch/1079511/
>=20
>=20
>=20
