Date: Fri, 21 Jun 2019 12:28:16 +0100
From: "Mark Brown" <broonie@kernel.org>
Subject: Re: Add more arches to kernelci via QEMU devices (part2)
Message-ID: <20190621112816.GF5316@sirena.org.uk>
References: <CA+j61XPeb0rjEO_=e8-bhdm9c79Wm=az_o=o9TtNwMhROSKB4w@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CA+j61XPeb0rjEO_=e8-bhdm9c79Wm=az_o=o9TtNwMhROSKB4w@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="G+QafMOtP06Swj/I"
Content-Disposition: inline
List-ID: <kernelci.groups.io>
To: kernelci@groups.io, clabbe@baylibre.com

--G+QafMOtP06Swj/I
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jun 21, 2019 at 11:24:16AM +0200, Corentin Labbe wrote:

> 4) defconfig hacks
> Some qemu machines can only be booted if defconfig are hacked.
> Examples are
> - need to disable cryptohw in exynos/cubieboard
> - need to disable some CONFIG for omap1
> Does kernelci want to build extra defconfig+hacks ?

These seem like bugs, we probably shouldn't be using those emulations if
they don't work - it's not like it's the only way to get coverage of 32
bit Arm or anything.

One question if we're going to start covering new architectures is where
are the builders coming from?

--G+QafMOtP06Swj/I
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl0Mv00ACgkQJNaLcl1U
h9DmwAf/bImIeFKU/g84NLM/0PNu0RW4E6NpAIRRV8hJ9grikVZ4GXN6CPJzU3Zq
BWYOqR6vbdJdFTm0DWcnx+ORHMHv6ghZUf9rtK0M5OBep0CbQPb0lpa4bSmPxTCC
fpKB7COtXCGBtla0oZD1YP8/pCyJoAjKGUzVS5BKQNMTa29C1dxbFy0iqVJFnKDN
21BhAs9E5QLPngdHys0me4ttpnLN4S5USafapAakukD75LaHgt9PrFIexCwAPvJw
3zKVaGbCCw8xESFJ+hsLX+XRQOkSWo0BgjuPVSIfJKUOm4iTJivdq1GNi4nl0kUI
56CBuuWpKO0ocwWOawP0XAoavIXpqA==
=xpIX
-----END PGP SIGNATURE-----

--G+QafMOtP06Swj/I--
