Date: Wed, 16 Oct 2019 10:56:36 +0100
From: "Mark Brown" <broonie@kernel.org>
Subject: Re: Branch for kernelci
Message-ID: <20191016095636.GA4881@sirena.co.uk>
References: <20191015202114.GA120152@google.com>
 <CAHRSSExkad8q8bdjF77t_JOwfFmDpERfq4CDthSZp8p23HoJ+w@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHRSSExkad8q8bdjF77t_JOwfFmDpERfq4CDthSZp8p23HoJ+w@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="AqsLC8rIMeq19msA"
Content-Disposition: inline
List-ID: <kernelci.groups.io>
To: kernelci@groups.io, tkjos@google.com
Cc: catalin.marinas@arm.com, will@kernel.org

--AqsLC8rIMeq19msA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Oct 15, 2019 at 01:52:36PM -0700, Todd Kjos via Groups.Io wrote:
> Please add testing for Will Deacon's ARM64 staging tree to kernelci:

> [web] https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git/log/?h=for-kernelci
> [git] git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-kernelci

> It would make sense to have dashboard available as "arm64" or some
> other unique tree name (eg "https://kernelci.org/job/arm64").

> The owners of this tree are the ARM64 maintainers: will@kernel.org and
> catalin.marinas@arm.com (CC'd)

Are you sure they are interested in this?  When asked previously they
indicated that they didn't see any extra value in covering their tree
specifically separately to -next.

--AqsLC8rIMeq19msA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl2m6VEACgkQJNaLcl1U
h9CqUQf+OfrHVE8Q5Ho4QKeTa0/IWKv6JHhi3y/iXUe1kQjQRgBJm5BiTg7aKtzg
7Hv199V5L6ARfKH6NghH2MrsJ9YZwiWS9To5GMFMCs+GXcvniO69zv1BHNlZVZ59
h7FnaJxpc3CchnYanZNjzRKPb1/ur3kjmBWO5tW70776fKtJQjf91TRsn4vQ73OH
5AOV+FCZJnnszsCmeBw24AZRsPN17S+e3Y5IXI1DZDDqZJ2AkWTsxvuOImt2kr+t
+ICVVo+58m379LFfGwxo098AvvQ6qW6eT6IwnUugHUROhFuG5m3rGvAqn88bdelU
60hYbj0Ad9d6biNlHHsGSeowGyfhHg==
=8mlo
-----END PGP SIGNATURE-----

--AqsLC8rIMeq19msA--
