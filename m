Date: Mon, 15 Oct 2018 14:29:21 +0100
From: "Mark Brown" <broonie@kernel.org>
Subject: Re: [kernelci] add a new config fragment to kernel/configs
Message-ID: <20181015132921.GB12949@sirena.org.uk>
References: <CADYN=9KyT05X_SUPNacmNEkgPi=6Ya9oQB9XRRHOMpAp=tkbgg@mail.gmail.com>
 <7hin27fhkk.fsf@baylibre.com>
 <20181012163939.GD2340@sirena.org.uk>
 <7h5zy3fjo1.fsf@baylibre.com>
MIME-Version: 1.0
In-Reply-To: <7h5zy3fjo1.fsf@baylibre.com>
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="SkvwRMAIpAhPCcCJ"
Content-Disposition: inline
List-ID: <kernelci.groups.io>
To: Kevin Hilman <khilman@baylibre.com>
Cc: Anders Roxell <anders.roxell@linaro.org>, kernelci@groups.io

--SkvwRMAIpAhPCcCJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Oct 15, 2018 at 03:01:34PM +0200, Kevin Hilman wrote:
> Mark Brown <broonie@kernel.org> writes:

> > Per testsuite configs have the disadvantage that you've got to work with
> > every single testsuite to add them (or maintain them separately) and
> > deal with any churn in kernel config requirements as you move between
> > kernels with new options or whatever somehow.  Some of the testsuites
> > will doubtless still end up needing them but hopefully most won't.

> I don't have any proof of this, but I suspect there will testsuites that
> are testing things that are not formally ABI, and we'll end up with
> per-testsuite defconfigs anyways, which may need to duplicate stuff in
> all_abi.config (or specify they need to be combined with all_abi.config)

Oh, there definitely are.

> Personally, I think we should first try the "allmodconfig +
> min_boot.config" approach.

> If that works, would we still need all_abi.config?

Possibly not, the concerns I guess would be size of the image (though we
could probably arrange to not actually ship all the modules to all the
boards if it was getting in the way) and if all the random debug options
that allmodconfig turns on might be too disruptive (I'm not sure if we'd
be able to turn them off with just a straight min_boot fragment, though
you could extend merge_config).

--SkvwRMAIpAhPCcCJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlvEljAACgkQJNaLcl1U
h9ApZwf+MZYvJ0YY9XsXcw+S7nBWmLOv0tyrzKalDDs5LpT30XU3d1dQVRNbfMzP
8e6LGxSq0yA+sqR9YuimARvib6rSxlZHpQlu//hgaAtlNNSxFUi7MhQ0hSqq9hin
pyD+NH8RCpKCuyz+8A4ZrLbzcAbumIXsn84oygmTzbH7iVigUnHC3MbagCNJij7O
w47bbZ7ZcS1KApiY90ipyCiwS8gtA+Qu8/c9hRWnIOWQ3a92O9SXPVlRChsCW5Jt
V8OPs5PX4aTf6zLIUoYHSC52sNsCU0xknspSZ5mvw5q+uzMLFJFpZ4pFB7YL2qVv
ce/oUdP6gOtrkmKovaNIS0431+wy5Q==
=hrcO
-----END PGP SIGNATURE-----

--SkvwRMAIpAhPCcCJ--
