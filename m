Date: Thu, 17 Oct 2019 17:11:37 +0100
From: "Mark Brown" <broonie@kernel.org>
Subject: Re: Branch for kernelci
Message-ID: <20191017161137.GG4976@sirena.co.uk>
References: <20191015202114.GA120152@google.com>
 <CAHRSSExkad8q8bdjF77t_JOwfFmDpERfq4CDthSZp8p23HoJ+w@mail.gmail.com>
 <20191016095636.GA4881@sirena.co.uk>
 <20191016123833.GG49619@arrakis.emea.arm.com>
 <20191016125416.GA11371@sirena.co.uk>
 <20191016164621.xa2nc6li2luiujug@willie-the-truck>
 <456755903.4221278.1571246924706.JavaMail.zimbra@redhat.com>
 <20191016235055.begiifweaxolgwih@willie-the-truck>
 <287771981.4310580.1571311874347.JavaMail.zimbra@redhat.com>
 <20191017160242.qgp5y56gnbxnmkaa@willie-the-truck>
MIME-Version: 1.0
In-Reply-To: <20191017160242.qgp5y56gnbxnmkaa@willie-the-truck>
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Zrag5V6pnZGjLKiw"
Content-Disposition: inline
List-ID: <kernelci.groups.io>
To: Will Deacon <will@kernel.org>
Cc: Veronika Kabatova <vkabatov@redhat.com>, kernelci@groups.io, Catalin Marinas <catalin.marinas@arm.com>, tkjos@google.com

--Zrag5V6pnZGjLKiw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Oct 17, 2019 at 05:02:43PM +0100, Will Deacon wrote:

> Curious: why 'olddefconfig' instead of 'defconfig'? Are there some options
> required by CKI that aren't present in defconfig?

In general anything that's doing runtime tests will need some extra
config options to get the functionality they're trying to test enabled,
for example for kselftests there's fragments in tree as
tools/testing/selftests/*/config (a lot though not all of those tend to
end up in defconfigs but other testsuites end up adding more).  This was
why Anders was looking at making allmodconfig bootable, it'd reduce the
need for this.

--Zrag5V6pnZGjLKiw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl2okrgACgkQJNaLcl1U
h9D0Agf6AtzgL0HgfVOhCdG6GkmU8niSM6P3qe5vKpPDeMA8dHlx/DvNNW2QYA4I
Ljyx9VJw5VQ2ZuqXEd6oyTCtSP9CuT6AOJSt0RRXdwCZinXc+Rbxoi9lMN4a1sDA
ui9cjeZcYcovRuyST9zcJ38JzDOczIINR22bnhSq/Iq5BX6MNjuKUkNdE+HK8B+Z
ds6NzqUKFRE4TBMvdAbeuOi9vt8+1DHIcmFlZUhtUbbt4t6h0EV98KPtxQHFKsZV
DNMcZ8Sf18nS2VoFYG/AamsEizR0UXHLuuHrafs3lmLbXB0lYebzfS3Q6VCss3SP
rpehDJlWpFeIornx4l8Oa7jRmrUAIA==
=o0RS
-----END PGP SIGNATURE-----

--Zrag5V6pnZGjLKiw--
