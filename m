Date: Fri, 14 Dec 2018 18:19:10 +0000
From: "Mark Brown" <broonie@kernel.org>
Subject: Re: [kernelci] Multiple compiler support in the backend
Message-ID: <20181214181910.GF6467@sirena.org.uk>
References: <CAH+k93Fy4sFGYMPVBuOcXwh4_ANt2qdCLMSCRzEjeEihJ1_Ekw@mail.gmail.com>
 <CAH1_8nAj1h9ooiAOdmSWdP9TAGA_QnYx_-2UM2YrXV+4ACqh5w@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAH1_8nAj1h9ooiAOdmSWdP9TAGA_QnYx_-2UM2YrXV+4ACqh5w@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Bqc0IY4JZZt50bUr"
Content-Disposition: inline
List-ID: <kernelci.groups.io>
To: kernelci@groups.io, guillaume.tucker@gmail.com
Cc: Matt Hart <matthew.hart@linaro.org>

--Bqc0IY4JZZt50bUr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Dec 14, 2018 at 03:01:04PM +0000, Guillaume Tucker wrote:

> Potentially, we could have different flavours of the same
> compiler version from different build environments.  Say, maybe
> Linaro's GCC 8 will be different from Debian's etc...  Will the
> build environment be shown in the email reports, or will there
> still just be the compiler version as we do now?

At least for GCC based toolchains the convention is for vendors to
modify the version number of the compiler to indicate that they've added
stuff - for example, on my desktop right now GCC reports that it is "gcc
(Debian 8.2.0-6) 8.2.0", the Linaro toolchains do the same as do other
binary toolchains I've looked at in the past.  That's probably enough I
think?

Sadly the clang-7 packages for Debian don't seem to have anything like
that but my locally built copies of clang-8 have the git hash and repo
URL for everything in the build.

--Bqc0IY4JZZt50bUr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlwT9B0ACgkQJNaLcl1U
h9Bjwgf+MNZV6hh7cRRkU5SEPK+5yLi32qmW4VTLCPySkq7rIH01CMXJ89V8sdWV
eGFkBAVz0K3QV7SCTJvfz8FetN19JeLkTMhzQRj68GxF4Fvbc8fKE28tutJrnUG8
lPEL3pLnEtVfyrVbNGMqonMOk1p74c8HeRcV1+gHzfn4J6ToEiTwGH2zsrmAI+iv
dTJG/EEHyWCLCq5cXd8wlZ19g6ABVk5UjaZGlEOux/F+zkB0PGpkfOS52lUD9mMs
Mcw99ubwneR1uzDtak+H9i5xX7+eOxKhmNTx44kO3wkTouyIrCBrsdpim9nMNKe6
aTtDnCgS2QzFb8kVU0QU/2JeLUdRVg==
=chCZ
-----END PGP SIGNATURE-----

--Bqc0IY4JZZt50bUr--
