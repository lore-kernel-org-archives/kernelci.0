Date: Wed, 26 Aug 2020 19:13:13 +0100
From: "Mark Brown" <broonie@kernel.org>
Subject: Re: http://kernelci.org/ gets "Welcome to nginx!" page.
Message-ID: <20200826181313.GO4965@sirena.org.uk>
References: <77eb4eeb-d14d-d5d1-65a3-7f8f7b241df1@amd.com>
MIME-Version: 1.0
In-Reply-To: <77eb4eeb-d14d-d5d1-65a3-7f8f7b241df1@amd.com>
Content-Type: multipart/mixed; boundary="Groupsio=E6UPHQ2KEWAVKXwmyQU3"
List-ID: <kernelci.groups.io>
To: kernelci@groups.io, kim.phillips@amd.com
Cc: info@kernelci.org

--Groupsio=E6UPHQ2KEWAVKXwmyQU3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Aug 26, 2020 at 12:54:37PM -0500, Kim Phillips wrote:
> Hi, I typed kernelci.org in my browser which went to:

> http://kernelci.org/

> which showed a "Welcome to nginx!" page.

> I luckily went to "www.kernelci.org" to see the desired content.

> Please correct the non-redirection issue?

FWIW I've just tested this and it does happen but only for plain HTTP -
browsers that do https by default work fine (some of them will
automatically try to rewrite any http URIs they see).

--Groupsio=E6UPHQ2KEWAVKXwmyQU3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl9GpjgACgkQJNaLcl1U
h9BCAwf/df3Do1Teip5SEYwVrZQ0zoiPQSuUFKOBU1LUb7yklOty1nonQmWs+4Gf
LDWiAqrSoVln3eO4soRe4M2IeksNycqaghlTn0hV127AwDCabVSJMK/hHCTHrse0
rTuprnSdvHkwn1NwHf/UMD9RAQLmWD2ABEWwh2pozhqw/1wuWkldXaKpruRbFtra
b8vgI54EOwpuFTpCpVSotEFr9QwbCyx5mSu5FonBPAo+mi7ZPO9KaPnTRGN0h6/K
CuRbX4U8d8kAVaFqTwnAAE93pM9lFlzuysRW1XERQy3JJB1KzJ1oOrSlhy8Fbg7P
34hptXJznb1lKIIjrAtjCgysBE0+NA==
=TegK
-----END PGP SIGNATURE-----

--Groupsio=E6UPHQ2KEWAVKXwmyQU3--
