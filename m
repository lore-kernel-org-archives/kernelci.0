Date: Thu, 26 Mar 2020 20:48:43 +0000
From: "Mark Brown" <broonie@kernel.org>
Subject: Re: next/master build: 227 builds: 17 failed, 210 passed, 41 errors, 497 warnings (next-20200326)
Message-ID: <20200326204843.GA24981@sirena.org.uk>
References: <5e7cb175.1c69fb81.d10e.6d4a@mx.google.com>
 <CAKwvOdkTh+uHOK0bd5UGGfYiFQU+MkeT71Yy7Ggof9FkQHCG-g@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAKwvOdkTh+uHOK0bd5UGGfYiFQU+MkeT71Yy7Ggof9FkQHCG-g@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ibTvN161/egqYuK8"
Content-Disposition: inline
List-ID: <kernelci.groups.io>
To: kernelci@groups.io, ndesaulniers@google.com
Cc: Guillaume Tucker <guillaume.tucker@collabora.com>, clang-built-linux <clang-built-linux@googlegroups.com>, "kernelci.org bot" <bot@kernelci.org>

--ibTvN161/egqYuK8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Mar 26, 2020 at 11:49:21AM -0700, Nick Desaulniers via Groups.Io wrote:

> Oh no, did the format of the logs change with the latest deployment?
> I expected to see the breakdown of which builds had which
> warnings/errors, which is very fast for me to triage.  If it was an
> intentional change, can we please bring those back?

Yes, it was an intentional change due to the huge size of the reports -
the basic issue was including all the successful builds as well which
made it really hard to actually get to the problematic bit of the report
with all the scrolling and deleting.  Ideally we'd just be able to
filter those out and leave only the fails, I agree they make it much
easier to triage and report things but it's a more involved change to do
that.  Kevin, Guillaume, what do you think?

--ibTvN161/egqYuK8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl59FSoACgkQJNaLcl1U
h9Bksgf9GY7DlxQrKRC8GFE8w+FslNiuxN4BCEPz5sEwX0WTQowHY2dXf4eIi4FW
9/bLQRnYty0EwpSj2wYkUYzrJJBQD3MXbMl9FLUQdiWYXbW3sLIOX8k2tAoEEJ07
aNrAFejA5ZAcbN8PTMXYoAM21c+Fxgb9kaGA5zmNh+cWse8pPABaXcNqnQXdNiFv
8h22zkRCJCT/sK4UM6shM44p79Ag/SfepklGUF+wDr9Ur+1p8x+r/8zw7PDGiK7v
Lx34NryZpWEq3f9PUAwt+fI9bGm3LQYEDCcDsNtv7bKd/1hyC8lyv0uae72lDg5h
vm/w+u9OEDNNChO8p2lMtnb01PgHrg==
=7FyF
-----END PGP SIGNATURE-----

--ibTvN161/egqYuK8--
