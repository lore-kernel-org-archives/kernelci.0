Date: Wed, 9 Oct 2019 17:06:00 +0100
From: "Mark Brown" <broonie@kernel.org>
Subject: Re: kernelci/staging.kernelci.org baseline: 59 runs, 1 regressions (staging-20191009.1)
Message-ID: <20191009160600.GJ2036@sirena.org.uk>
References: <5d9dc6c8.1c69fb81.ffa07.41ad@mx.google.com>
 <557293d8-dde3-b24a-988f-f9b90dccf5f4@collabora.com>
 <20191009142505.GE3929@sirena.co.uk>
 <0e8e25e6-872e-7639-fea8-b743bc9d9913@collabora.com>
MIME-Version: 1.0
In-Reply-To: <0e8e25e6-872e-7639-fea8-b743bc9d9913@collabora.com>
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="9v+t0xRk6rtskISq"
Content-Disposition: inline
List-ID: <kernelci.groups.io>
To: kernelci@groups.io, guillaume.tucker@gmail.com
Cc: mgalka@collabora.com, alexandra.pereira@collabora.com, dan.rue@linaro.org, matthew.hart@linaro.org, kernelci@baylibre.com, anders.roxell@linaro.org

--9v+t0xRk6rtskISq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Oct 09, 2019 at 03:40:22PM +0100, Guillaume Tucker wrote:

> Yes that's not new but it's not great either, it means 1 failure
> among 5 tests.  I think we should rather have the number of
> passes and total as that's more intuitive, and replace "errors"
> with "results" in the column title.

That's a good idea - switching it to passes rather than fails
makes the existing display work I think.

> Showing just the number of failures also works but because we
> don't have a functional web frontend yet it's actually very
> helpful to know how many tests were run, to see whether it's the
> expected number.  We should definitely be able to revisit and
> simplify things in these emails once we can refer to a web page
> with all the details.

Yeah, a useful web UI would mean there's a lot of opportunity to
revisit these.

--9v+t0xRk6rtskISq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl2eBWcACgkQJNaLcl1U
h9CtKgf+PyADFvY1ob58cDNEVQ/5bCzUjHR9VZ9lHRRRriI9rstnUYb7iKmdVByk
fPHzK04LNA9qtl77qnDtJmW3e2bRXH8Le/JGjznLZQQLyiBX3tPEScBd4ULYqmUv
5SfY986phPDVYk6cvlF+OYKPI/BENlHJzF/4KJeJmpKe7YuZsDrocD5tDU8MdG/J
85/7DP4bsCbNzn/LyCZ6uYP/Wedk5kvFUGSu/PaW3vfMHfZZWIeal+dAmCPa2fKD
9jsLZk319eGuQyjGBMZGgTnaEtlnzWSkikaudDbWKUptsM0bgDq3T/NMOLoMvbAP
4Gz+OFzPzdD5XyvKvQNnrVEqn0auSQ==
=D+Lz
-----END PGP SIGNATURE-----

--9v+t0xRk6rtskISq--
