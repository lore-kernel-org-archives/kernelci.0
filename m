Date: Tue, 2 Oct 2018 19:45:34 +0100
From: "Mark Brown" <broonie@kernel.org>
Subject: Re: [kernelci] Rolling out the docker builds
Message-ID: <20181002184534.GD6338@sirena.org.uk>
References: <CAH+k93HMWWgyUe0aZYvHBC=eykHPT_EZpFeMPT=u0hQjcrdS7A@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAH+k93HMWWgyUe0aZYvHBC=eykHPT_EZpFeMPT=u0hQjcrdS7A@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="zS7rBR6csb6tI2e1"
Content-Disposition: inline
List-ID: <kernelci.groups.io>
To: kernelci@groups.io

--zS7rBR6csb6tI2e1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 02, 2018 at 05:37:43PM +0100, Matt Hart wrote:

> As the garage builders seem to be down again, and we weren't really
> sure they were running the latest ansible changes anyway, I'm planning
> to spend tomorrow..

> - updating our ansible config to just install and configure docker
> - adding a patch to staging to split x86 and x64
> - merging the staging kernelci-core so that production can start using do=
cker
>=20
> This will allow me to move all the Azure builders to production, and
> remove any concerns that any builder hasn't been configured recently.

\o/

> A side effect will mean bumping the GCC versions for x86, arm and
> arm64 to at least GCC-7. If anyone thinks we should be using GCC-8,
> let me know.
> Otherwise, please speak up if you don't want me to do any of this.

--zS7rBR6csb6tI2e1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAluzvM0ACgkQJNaLcl1U
h9D1hQf9HCVwcQcQ65BJkk5sI8T8qACXPympeWifRYjPAyGT6KsfWXDzdc9K07ad
2m2bJxrhgPW55GcLpFeo2wdp0zhB/QykdBV2977CTo6/a7IVxHPs+5iWu/7hlOxK
qPzUPOK0OgkbdzF6ndbjzP2UN/caJYVpX5SIX2QqxfLLv3afKqezlo6Za59Bp6YR
6cjFU8LCGaX7dPgeVM0hB/US7xIKx2ch/UJIOEVjTuxTksS5m646+mOOh/BlmxNw
3sbcZsHbrYweNE6ORWVKx0snK3pPztNfyGjbUE2W/QBZB2oNiyUHXr8oFJahsjIk
o4pmfMHcyrAbfkCBn+tmZZaQAdQ39A==
=HJzD
-----END PGP SIGNATURE-----

--zS7rBR6csb6tI2e1--
