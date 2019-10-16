Date: Wed, 16 Oct 2019 13:54:16 +0100
From: "Mark Brown" <broonie@kernel.org>
Subject: Re: Branch for kernelci
Message-ID: <20191016125416.GA11371@sirena.co.uk>
References: <20191015202114.GA120152@google.com>
 <CAHRSSExkad8q8bdjF77t_JOwfFmDpERfq4CDthSZp8p23HoJ+w@mail.gmail.com>
 <20191016095636.GA4881@sirena.co.uk>
 <20191016123833.GG49619@arrakis.emea.arm.com>
MIME-Version: 1.0
In-Reply-To: <20191016123833.GG49619@arrakis.emea.arm.com>
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Qxx1br4bt0+wmkIi"
Content-Disposition: inline
List-ID: <kernelci.groups.io>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: kernelci@groups.io, tkjos@google.com, will@kernel.org

--Qxx1br4bt0+wmkIi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Oct 16, 2019 at 01:38:34PM +0100, Catalin Marinas wrote:
> On Wed, Oct 16, 2019 at 10:56:36AM +0100, Mark Brown wrote:

> > Are you sure they are interested in this?  When asked previously they
> > indicated that they didn't see any extra value in covering their tree
> > specifically separately to -next.

> Will can comment on the reasoning but I guess it came as a request from
> him since he also created the arm64/for-kernelci branch. This might as
> well be the same as for-next/core but tested in isolation rather than
> with the whole linux-next tree.

Yeah, that was what you'd both rejected doing before which was why I was
surprised (plus the fact that this was coming via Todd rather than one
of you).

--Qxx1br4bt0+wmkIi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl2nEvcACgkQJNaLcl1U
h9DN3gf7B3YOeP4Vy5zddN1eCGPU4euMqprntUQAT921egp65ohEKXoxTKOR10Ba
Jznf9Swy6BgoQkbbP+yIQHFhUlbAlPQJ8t7YjFWjYLVkoHf+ta0WrXpDnjI6Oc/d
5+2OUGxdHvxO6kMwYSkNyiS7MBptO66d0/wgRoDhTTQ7MNAbksTi+naru5vA2CNC
kjH9qorIPmMuFt3L226ygTR+4BK5AMknJyGfjWqEjH0653dcAO9yr6FuSf6cMtPn
80NusDYpngh+SwxurjCnXSV3Tzsin/18/1jWYpeYD6yCwfWXLoT+5cqHPjSkX8Ql
P+Qmdm0aLWPeO8O+T5PqceTMyInvgA==
=+Jcm
-----END PGP SIGNATURE-----

--Qxx1br4bt0+wmkIi--
