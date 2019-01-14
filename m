Date: Mon, 14 Jan 2019 22:01:30 +0000
From: "Mark Brown" <broonie@kernel.org>
Subject: Re: Weekly Meeting 2019-01-14 #minutes
Message-ID: <20190114220130.GG11073@sirena.org.uk>
References: <20190114155044.g2xy3a5e42ynivj7@xps.therub.org>
 <7hfttukinm.fsf@baylibre.com>
MIME-Version: 1.0
In-Reply-To: <7hfttukinm.fsf@baylibre.com>
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="c7hkjup166d4FzgN"
Content-Disposition: inline
List-ID: <kernelci.groups.io>
To: Kevin Hilman <khilman@baylibre.com>
Cc: kernelci@groups.io, dan.rue@linaro.org

--c7hkjup166d4FzgN
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 14, 2019 at 01:56:29PM -0800, Kevin Hilman wrote:
> "Dan Rue" <dan.rue@linaro.org> writes:

> >     - Very useful for testing
> >       - [gtucker] Other way to do this is in build-configs.yaml with a=
ll
> >         the other build configuration settings (see initial work in
> >         kernelci-core-staging PR #75)

> We need flexibility in which defconfigs are built per tree, but also per
> arch and probably per toolchain, so having this in a simple file in tree
> is not sufficient.

> IMO, the build-configs.yaml stuff that Guillaume is working on is the
> way to go forward.

The suggestion was to allow trees to drop in something with the
build-configs.yaml syntax so you could do anything you can do with that
with the in tree file.

>=20
> > - [gtucker]
> >   - Test regressions merged on staging, testing last changes to the te=
st
> >     reports
> >   - Adding fix for MIPS (remove hacks and use gcc-7)
>=20
> Thanks!
>=20
> >   - V4l2 & dynamic metadata: adding a template parameter to the
> >     test-configs.yaml test plans settings to specify the video driver =
to
> >     use in the test (discovering the driver name at runtime isn=E2=80=
=99t
> >     practical with current LAVA)
> >
> > - [drue]
> >   - Next steps on =E2=80=98[Help] How to use kernelci to establish a l=
ocal CI
> >     lab?=E2=80=99?
> >     - [chaws] I mentioned this repo:
> >       https://github.com/kernelci/kernelci-core, but still unsure what
> >       the next step is
> >     - Li=E2=80=99s asking for support using kernelci-docker locally, n=
ot adding
> >       a lab to kernelci. There are a lot of versions of this repo in t=
he
> >       wild, so it=E2=80=99s not clear who should help him. Matt can sh=
ow him how
> >       he does it.
>=20
> I'm not sure about a lot of versions, but we (BayLibre) are working
> primarily on this one, which is also deployed for AGL:
> https://github.com/lucj/kernelci-docker
>=20
> Kevin
>=20
>=20
>=20

--c7hkjup166d4FzgN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlw9BrkACgkQJNaLcl1U
h9CFfwf/fooD5YKdH1OYbvCYCB+BDSKyWPvuUfIiws65SkVU6bytJXlV2u148bhf
LAtMt14jJ9aq0qTI+BT1ATWEx0Rg+5SoIXjtAmK6Q3AgHEqD6CKCFhWP4N8jJ5wA
CDaD8MRBTf3DZUc/0cmxcBHYjzLgeQqcBUZUokcfq+Auo/uLMIGY+IBmUH09CZTm
52kfrbsn7FcPnHseOtmBCDyHSL6Ohq5INjOM3i0jalAGe23014NoLlc+D4Od0iJE
Xrtu9FzL0Y6sWrl4UBvaKVnrBtgq9PXlunhvRHsCEGuFcG6EcvAPApZlpCtiV1Or
kVNu7LBTqWTXbSt3VmFwsLULRfUkBA==
=tEvQ
-----END PGP SIGNATURE-----

--c7hkjup166d4FzgN--
