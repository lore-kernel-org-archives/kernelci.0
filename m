Message-ID: <ac7530daba2a2a42c7a1d254409cbbe34d9a2648.camel@debian.org>
Subject: Re: Testing Debian kernels on kernelci?
From: Ben Hutchings <benh@debian.org>
Date: Mon, 18 Feb 2019 18:09:27 +0000
In-Reply-To: <20190218165402.obkznz2itzlqeys7@tack.einval.com>
References: <20190218165402.obkznz2itzlqeys7@tack.einval.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-zVzOueRN1DpII3kd9RwE"
List-ID: <kernelci.groups.io>
To: Steve McIntyre <93sam@debian.org>, kernelci@groups.io

--=-zVzOueRN1DpII3kd9RwE
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2019-02-18 at 16:54 +0000, Steve McIntyre wrote:
> [ CC: to Ben, the debian kernel team lead ]
>=20
> Hi folks,
>=20
> In Debian we've just been bitten by quite a nasty kernel bug in our
> latest stable release [1], and this has clearly managed to make it
> into a release due to a insufficient testing of our kernels on all our
> platforms. Most people only have x86 hardware, and doing full
> regression testing across multiple Arm, MIPS, etc. platforms is beyond
> our capabilities. You know, the usual situation... :-)
>=20
> Due to my position in the LAVA team in Linaro, I know quite a bit
> about kernelci and I'm wondering if it would be possible to get some
> of our Debian kernel branches added to the list for at least some
> automated boot testing. This would be major help for us.

The last time I looked, KernelCI assumed all essential drivers would be
built in and only supported use of a pre-built initramfs (if any).

Debian kernel packages are modularised almost as far as possible, so
for each kernel build the initramfs will also need to be rebuilt to
include the new kernel modules.

Ben.

> [1]  https://bugs.debian.org/922478
>=20
--=20
Ben Hutchings - Debian developer, member of kernel, installer and LTS teams

--=-zVzOueRN1DpII3kd9RwE
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEErCspvTSmr92z9o8157/I7JWGEQkFAlxq9NcACgkQ57/I7JWG
EQnBFRAAwZLSbeO8aLAS/W+x1urvQSM1vQYGHvIVF4mNggDyT+36rDKQ5cVStbCj
eWNbk/Ebr44uMMkTZ8gbIPlnkXiOVlZtO9O9mbJBRZtaij/3WBnccWTAYRvgYcCo
cAJf/etbv6VA3/1Ha5Ag8QIh9YlaLyd7wDYzhZ0hr3kqGPeOTBMA6KdjYpIYxi3Y
ZeNNxJV9HLtPWwqhvZ3L3zHXkiHPoSrUVcsiswur6tnPN6KT//FJCUnk30W4qNJY
Ah2HGLhJG8+fZfTkHeiDXd69CNVv9rD9uxt0i8OwDMwVazRzngAa7t+f0lr51fJ+
CcoZ0yHmG0mnxdLULAtJBl8m+ehwTOQohK10fwTI4DaJ4rHlJEzQYGB4nqMZgK+f
ygFp2OQc0NibGekLTEgpZ1r1zN/1xquohArHPbqVDYGLEpZovi2vZuQeDsmQy6HO
4DWeNht2R60KRQXutzS/ARIUililwuWxZjdKAWDcA2DBKAkJN6lDGZi9xKPikDiO
v2Ovaa2psKlP38WUneE6le2DXWaBrvljA2VXDjAsnMdISKW/tGm3thFmz4eoBBy4
SYtbNgAAlVDaHpkqeDfSxg70aMiWfZaSEn0JLs3Nc11dw3KsVU/U9U2iOqo6VZdR
ssH4jGkzWGi2tu12A2qStoTZYasWQDEaiBt7nhr2R27EsMUfSXo=
=9PfS
-----END PGP SIGNATURE-----

--=-zVzOueRN1DpII3kd9RwE--
