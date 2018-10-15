Date: Mon, 15 Oct 2018 15:05:37 +0100
From: "Mark Brown" <broonie@kernel.org>
Subject: Re: [kernelci] add a new config fragment to kernel/configs
Message-ID: <20181015140536.GC12949@sirena.org.uk>
References: <CADYN=9KyT05X_SUPNacmNEkgPi=6Ya9oQB9XRRHOMpAp=tkbgg@mail.gmail.com>
 <7hin27fhkk.fsf@baylibre.com>
 <20181012163939.GD2340@sirena.org.uk>
 <7h5zy3fjo1.fsf@baylibre.com>
 <20181015132921.GB12949@sirena.org.uk>
 <CAP71WjywZ=iqwZCTEYB7XjhO=r+hXhVzzjiS+XjztgGrK9HOOg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAP71WjywZ=iqwZCTEYB7XjhO=r+hXhVzzjiS+XjztgGrK9HOOg@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="KDt/GgjP6HVcx58l"
Content-Disposition: inline
List-ID: <kernelci.groups.io>
To: kernelci@groups.io
Cc: Kevin Hilman <khilman@baylibre.com>, Anders Roxell <anders.roxell@linaro.org>

--KDt/GgjP6HVcx58l
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Oct 15, 2018 at 03:40:20PM +0200, Nicolas Dechesne wrote:
> On Mon, Oct 15, 2018 at 3:29 PM Mark Brown <broonie@kernel.org> wrote:
> > On Mon, Oct 15, 2018 at 03:01:34PM +0200, Kevin Hilman wrote:
> > > Mark Brown <broonie@kernel.org> writes:

> > > Personally, I think we should first try the "allmodconfig +
> > > min_boot.config" approach.

> > > If that works, would we still need all_abi.config?

> how about making a new tree (in kernelci.org?) that contains "test"
> config fragments and maintain them outside of linux master?
> kernelci.org could decide which fragment to use for which 'build'. If
> some fragments are good enough for mainline, then we might end up
> trying to upstream them at some point. That would at least ensure that
> everything is properly archived and reproducible. We can mimic what
> AOSP is doing for their custom config fragments
> (https://android.googlesource.com/kernel/configs/+/master).

The problem is more figuring out which config fragments we need rather
than where to host them.  The thinking with pushing it upstream was that
there's been some interest in collaboration with other people doing test
stuff and there's no particular advantage to having a separate repo.

--KDt/GgjP6HVcx58l
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlvEnrAACgkQJNaLcl1U
h9BnSAf+LFacRI9Tm9x8HL2jLh3wdcbA3IcFDeRhnMr4M2BC9EG2KXFTu6mIfBNa
JQkX9m9PgzE9jqP+rPUEs7NzwzMFGINjHDNW8NoepBhczr3khFccxlt7JzYcCvN4
Rz+7xq8gA6/CDMJBoK/iDCiq5CjNqoBXSVFlYPJp31K3Ot2uZ4f78+S0TJF8+atn
Oe5lNMR/S0z1YLoxfPRwHj3vgD7TEZA1tfNLM2pDMKSsna4JYqPMvCsoOO+v58f5
qysnzoKT3WmMGNasgLDz/P+woxDgYrxZiCpld6gVGnsDNtuU9N0peJX7DQ/scZoC
l40rriTST3DqeC9DvEWOPczMYyxraA==
=rwbQ
-----END PGP SIGNATURE-----

--KDt/GgjP6HVcx58l--
