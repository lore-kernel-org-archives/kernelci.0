Date: Thu, 24 Sep 2020 12:04:02 +0100
From: "Mark Brown" <broonie@kernel.org>
Subject: Re: kernelci.org update - 2020-09-23 #minutes
Message-ID: <20200924110402.GB4754@sirena.org.uk>
References: <107c1572-ffc5-8797-6ae3-10fbe4e91eee@collabora.com>
 <CAKwvOdkHiRAxCrrqRTq=k09zW-X9cHogyq+7fTuM_aJyntXs4Q@mail.gmail.com>
 <200d3c91-9906-01d6-2642-718fbd356d76@collabora.com>
 <CAKwvOdmAev4-AP3g0cgZ8rV+iR4ACuy1ZQ_XoD09c1d2GF1S7Q@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAKwvOdmAev4-AP3g0cgZ8rV+iR4ACuy1ZQ_XoD09c1d2GF1S7Q@mail.gmail.com>
Content-Type: multipart/mixed; boundary="Groupsio=00ofwQwtZVpvNFPqAzo6"
List-ID: <kernelci.groups.io>
To: kernelci@groups.io, ndesaulniers@google.com
Cc: Guillaume Tucker <guillaume.tucker@collabora.com>, clang-built-linux <clang-built-linux@googlegroups.com>, Todd Kjos <tkjos@google.com>

--Groupsio=00ofwQwtZVpvNFPqAzo6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Sep 23, 2020 at 03:06:52PM -0700, Nick Desaulniers via groups.io wrote:
> On Wed, Sep 23, 2020 at 2:26 PM Guillaume Tucker

> > > android-mainline
> > > android12-5.4
> > > android-4.19-stable

> > > are the 3 newest branches that I know of.

> > And which LLVM/Clang versions should be used to build those?

> Will likely be clang-12 (or possibly clang-13).  Those branches are
> basically the kernel branches for "S" which will be released next
> year.  So they are building with a pre-clang-11 right now, but we're
> about to upgrade them to something closer to ToT soon.  Once the "S"
> release of Android is closer, then we will lock down the toolchain
> used for these kernels, but it's sure to change between now and then.

The thought was that it might be worth using the actual Android
toolchains (including all the out of tree patches and whatnot) with
these branches as well as upstream clang.

--Groupsio=00ofwQwtZVpvNFPqAzo6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl9sfSEACgkQJNaLcl1U
h9DvtQf/TUR8x5SCtTU18CrDtYCwGJmYc64wioMFY3wMF1Pw+eD5zzkaWT9UxUtu
tw1raHiQFFVkCu5yPKzKWVmj8QsoEP9Fmbc+T4+jGic37fnyGz2TjeHZPrR4Go26
0WOZMu1LGqCzhXsTF8Vn9xE0weBBHwlBj06wZcMT4u00cVzvVccdDGjjOt88geqx
Q0zVEmi6yajP1z2qOf3zt4ZY2ROah9i8C/lw+4wSfmWdVwFiVA6D/rWA7WSoLfQA
P1xiJV35dtPG97zznW7Lj7izpZi9LHfOU69pum9LltKK/bwwC8WRtFa9p1iZTwNr
6EthDnkIk2aoftxUE3uF5yr/MIucQQ==
=OoqN
-----END PGP SIGNATURE-----

--Groupsio=00ofwQwtZVpvNFPqAzo6--
