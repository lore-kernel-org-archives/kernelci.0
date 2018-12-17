Date: Mon, 17 Dec 2018 12:09:47 +0000
From: "Mark Brown" <broonie@kernel.org>
Subject: Re: [kernelci] Multiple compiler support in the backend
Message-ID: <20181217120947.GA13868@sirena.org.uk>
References: <CAH+k93Fy4sFGYMPVBuOcXwh4_ANt2qdCLMSCRzEjeEihJ1_Ekw@mail.gmail.com>
 <CAH1_8nAj1h9ooiAOdmSWdP9TAGA_QnYx_-2UM2YrXV+4ACqh5w@mail.gmail.com>
 <20181214181910.GF6467@sirena.org.uk>
 <7h5zvwndvr.fsf@baylibre.com>
MIME-Version: 1.0
In-Reply-To: <7h5zvwndvr.fsf@baylibre.com>
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="UlVJffcvxoiEqYs2"
Content-Disposition: inline
List-ID: <kernelci.groups.io>
To: Kevin Hilman <khilman@baylibre.com>
Cc: kernelci@groups.io, guillaume.tucker@gmail.com, Matt Hart <matthew.hart@linaro.org>

--UlVJffcvxoiEqYs2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Dec 14, 2018 at 10:48:24AM -0800, Kevin Hilman wrote:
> "Mark Brown" <broonie@kernel.org> writes:

> > Sadly the clang-7 packages for Debian don't seem to have anything like
> > that but my locally built copies of clang-8 have the git hash and repo
> > URL for everything in the build.

> The debian packages for recent clang builds I'm using are from
> apt.llvm.org, and they seem to provide pretty detailed versioning:

>    $ clang --version |head -1
>    clang version 8.0.0-svn345496-1~exp1+0~20181029105533.852~1.gbpf10f36 (trunk)

Yeah, that looks like a svn version of what I got from my local git
snapshot - the Debian packages will be built from tarballs so they lack
the VCS information, that's going to be a problem with releases I guess.

--UlVJffcvxoiEqYs2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlwXkggACgkQJNaLcl1U
h9D2YQf/YodNoHMId7p88I5wC5ZtayukmkBK0dnUzao/g1b5hSTTAUAj9M8Vh5hs
V+eRh4cLQuXyoWdYs70K3eaXVSHdhWOUNvWnxAs2C94KCyuyRJsmroh1q+wFZK/O
iaVuM9CoY7dTuCvFMjA2HvkxJfsyKqOb2V30i2FRjrDFaTShQNRJe92wzn6PCy53
5v0Sueq2YBFXLCxrGe34ChBeCFLb2uDs9R+zRYNsdVYHN3lAvxe3XUPr4mCaF5PD
buC59V1QxiW4CTQBTWM+DBAM604m/RgmFp9lDDgRRop5MN6z9vVasUaR+Y7AHlME
HMfYlyaIbGaYUmmP6e2tKn1Efej59g==
=aJpA
-----END PGP SIGNATURE-----

--UlVJffcvxoiEqYs2--
