Date: Wed, 17 Jul 2019 18:44:04 +0100
From: "Mark Brown" <broonie@kernel.org>
Subject: Re: next/master baseline: 7 runs, 0 regressions (next-20190717)
Message-ID: <20190717174404.GE4459@sirena.org.uk>
References: <5d2f063d.1c69fb81.64f72.9c8e@mx.google.com>
 <1ab642a0-0157-84c6-a3a8-da3ead6f55b1@collabora.com>
 <7ha7dcy8ck.fsf@baylibre.com>
MIME-Version: 1.0
In-Reply-To: <7ha7dcy8ck.fsf@baylibre.com>
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="vmttodhTwj0NAgWp"
Content-Disposition: inline
List-ID: <kernelci.groups.io>
To: kernelci@groups.io, khilman@baylibre.com
Cc: guillaume.tucker@gmail.com, kernel-build-reports@lists.linaro.org, Enric Balletbo i Serra <enric.balletbo@collabora.com>

--vmttodhTwj0NAgWp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jul 17, 2019 at 10:43:55AM -0500, Kevin Hilman wrote:
> "Guillaume Tucker" <guillaume.tucker@gmail.com> writes:

> > run | platform                 | arch   | lab                      | compiler | defconfig                                         | errors
> > ----+--------------------------+--------+--------------------------+----------+---------------------------------------------------+-------
> >   1 | rk3288-veyron-jaq        | arm    | lab-collabora            | gcc-8    | multi_v7_defconfig+CONFIG_EFI=y+CONFIG_ARM_LPAE=y | 1/61

> > which obviously makes the table quite a bit wider.

> > The width of each column is currently fixed but it could be
> > dynamically computed based on the results to avoid superfluous
> > spaces:

> > run | platform          | arch | lab           | compiler | defconfig                                         | errors
> > ----+-------------------+------+---------------+----------+---------------------------------------------------+-------
> >   1 | rk3288-veyron-jaq | arm  | lab-collabora | gcc-8    | multi_v7_defconfig+CONFIG_EFI=y+CONFIG_ARM_LPAE=y | 1/61

> > Is that still readable enough, or does it get so wide that it's
> > becoming too hard to read?

> IMO, that's readable, but any more columns, and were going to soon be in
> the realm of "not useful to view in email"

Both of those are *way* over 80 columns so it's already a bit of an
issue, I do tend to agree with Kevin that it's still usable as is if
you expand the window but won't scale much further.

--vmttodhTwj0NAgWp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl0vXmMACgkQJNaLcl1U
h9Cd0Af9EuiG5qpygRj4t/WzWSA1TaKesz9+edoqh3CyCZPdoKRdpMgpIYDk5c+d
zVKtHjpO4huN/YZUwK2S4LXgHLADQm9Y/G7bmu4/puIW4bsybaq+4mpoMd4u0m6c
XEU01RjLgOekqZR/zAM6VNxHxMRwjCa39uzE7WAL1B0qmBHDULXt/GVRCgZnnu3G
y8SZzw5zwRdxjCv9gl+ZL0NgxBWrOXB0O1Uy8H3JrLDT9rApW6SZreuMaZ4g3et9
9ddZczDfw2aT/ESRs/s1zk4jX0iIrPWN1JwEFpQ0hCWZOQCmMpI9xRm2WXmCLQEu
DR96opWDd56enE9Qq/JMBxLn7vsyyA==
=jjzJ
-----END PGP SIGNATURE-----

--vmttodhTwj0NAgWp--
