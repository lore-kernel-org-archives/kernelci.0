Date: Wed, 7 Aug 2019 13:38:54 +0100
From: "Mark Brown" <broonie@kernel.org>
Subject: Re: aarch64 Big Endian
Message-ID: <20190807123854.GB4048@sirena.co.uk>
References: <CAKwvOdn0kv+N5raBDE_aPv637ROHmu7C1_C9F3PXNnAYSMTOYQ@mail.gmail.com>
 <20190806190254.GH4527@sirena.org.uk>
 <CABXOdTckrMfM_-5+pJ37KHveLE8oRDvFAzPftnp_5--fYJVuXQ@mail.gmail.com>
 <20190806200809.GI4527@sirena.org.uk>
 <CABXOdTcWG-wh9ZHMVmON+B4cxV64-8HDkTvpG61eTNAOYbs-jw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CABXOdTcWG-wh9ZHMVmON+B4cxV64-8HDkTvpG61eTNAOYbs-jw@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ZoaI/ZTpAVc4A5k6"
Content-Disposition: inline
List-ID: <kernelci.groups.io>
To: Guenter Roeck <groeck@google.com>
Cc: kernelci@groups.io, Nick Desaulniers <ndesaulniers@google.com>, clang-built-linux <clang-built-linux@googlegroups.com>

--ZoaI/ZTpAVc4A5k6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Aug 06, 2019 at 01:45:44PM -0700, Guenter Roeck wrote:

> FWIW, I generated a big endian aarch64 root file system with buildroot
> and gave it a try with gcc 8.3.0. Works fine for me, at least with "-M
> virt" in qemu. I have not yet tried any other machines.

Yeah, the GCC big endian boots have been working fine.  It's just clang
builds.

--ZoaI/ZTpAVc4A5k6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl1Kxl4ACgkQJNaLcl1U
h9C54Af/Sxz4QnXVAISMIGFSRj6HGRepOYHZbT2kGwq7t/23vD1ZWCI41dMTwRQP
QVKdK9lxNu9dWVjTNtBxyeBhccoNJaPqiMZYW1g7FIeUpG3Kl30WxXe5ZoHnPOMK
8I8wrk6djNwbDWr64mDi7zkIhgz2T9yU4Erjd+p9Jf/UgtdRGYkgHDLBOvVZsJ5M
ZjKinDKoA417bSkCZ7uZengNm0ocqWMqIhODapDaU3T0pe2DIXbbJooYMxORYPrK
CaTQSU1V61wgmk1s9/ZDumHQFOJPKnifcOTFYoNIgGX8uFuwpZNyLV8B5EtOfZBd
1y2SdJufMheY6qUOI+Amfo+PjHjQ5A==
=2aJ+
-----END PGP SIGNATURE-----

--ZoaI/ZTpAVc4A5k6--
