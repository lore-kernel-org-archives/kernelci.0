Date: Wed, 19 Jun 2019 19:57:14 +0100
From: "Mark Brown" <broonie@kernel.org>
Subject: Re: kernel tree support matrix for Clang
Message-ID: <20190619185714.GY5316@sirena.org.uk>
References: <CAKwvOd=VBORyjtbqijM8FGAQUV6r6qy3ADQRGrxnKHY_ke=iPw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAKwvOd=VBORyjtbqijM8FGAQUV6r6qy3ADQRGrxnKHY_ke=iPw@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="7knXg9dK90d7f3Md"
Content-Disposition: inline
List-ID: <kernelci.groups.io>
To: kernelci@groups.io, ndesaulniers@google.com
Cc: Matt Hart <matthew.hart@linaro.org>, Dan Rue <dan.rue@linaro.org>, Anmar Oueja <anmar.oueja@linaro.org>, clang-built-linux <clang-built-linux@googlegroups.com>, Todd Kjos <tkjos@google.com>, Sandeep Patil <sspatil@google.com>, Alistair Delva <adelva@google.com>, Stephen Hines <srhines@google.com>

--7knXg9dK90d7f3Md
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 19, 2019 at 11:04:34AM -0700, Nick Desaulniers via Groups.Io wr=
ote:

> https://travis-ci.com/ClangBuiltLinux/continuous-integration/builds/11608=
9229
>=20
> Currently 40 targets.  They're not partitioned in the UI, but here's
> how I view them:

These appear to mostly be defconfig builds?

> Today KernelCI is covering builds of linux-next with Clang, which is a
> great first step.  I think the above list of trees & branches listed
> above for the reasons above are good next steps for KernelCI coverage.

> What do you all think?

The last time we talked about it the plan was to turn clang builds on
for mainline just as soon as the last few patches for making that build
land so that should be after the merge window.

For the stables I did see in at least v4.4 what looked like new
warnings, I'm guessing Greg would take fixes for them but it's probably
better to do do that before enabling anything.

--7knXg9dK90d7f3Md
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl0KhYkACgkQJNaLcl1U
h9AOeQf/WDx+aTAyVe82k1nPohqxL+41hQVAZ6FxkPtorxuktqMELz3c4SYFwuSj
bN0tnSYoS7+PuiCYiNxMoDNryu0OTdyLxOA9wSFQb+MzCvE/GT6g+SH3BDzHKCFD
O6tySDq2tt6Wk4FkRLvaN90Az1y+wzRLsU4dsioUdLSu9Vm0baBOMQqMz+pcEXUR
9vZwkHrHeHfQtSUThNd44GjbF5hSiB5QR5GJFk4S+YxQ8N3hhj7prBTKA/XUyaqJ
TfHGOQFYCZIUOX8PFvs5uSj10mDd5AuMuj7BdeJSrQku09yjAAnriYMmbQAPV/An
53IN2MiUX6z+RGSuABryKCBgj/lFZA==
=uJIg
-----END PGP SIGNATURE-----

--7knXg9dK90d7f3Md--
