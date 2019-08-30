Date: Fri, 30 Aug 2019 20:53:24 +0100
From: "Mark Brown" <broonie@kernel.org>
Subject: Re: Some questions about KernelCI
Message-ID: <20190830195324.GH5182@sirena.co.uk>
References: <CACT4Y+bt8r-1t7=sFtH75_Bj-xBdTTUkM-tZ=GEoy2B=rCYQOg@mail.gmail.com>
 <20190829121441.GD4118@sirena.co.uk>
 <CACT4Y+Zn-q=iAnLttLKSPVAg-u_4sGv4YxT4hfGc+N=UrMf6vw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CACT4Y+Zn-q=iAnLttLKSPVAg-u_4sGv4YxT4hfGc+N=UrMf6vw@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="cPi+lWm09sJ+d57q"
Content-Disposition: inline
List-ID: <kernelci.groups.io>
To: Dmitry Vyukov <dvyukov@google.com>
Cc: kernelci@groups.io, Kevin Hilman <khilman@baylibre.com>

--cPi+lWm09sJ+d57q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 30, 2019 at 12:07:47PM -0700, Dmitry Vyukov wrote:
> On Thu, Aug 29, 2019 at 5:14 AM Mark Brown <broonie@kernel.org> wrote:

> > > 2. Are there test coverage reports anywhere? Is it in plans?

> > There's some e-mail reports for tests which are sent to developers at
> > the minute, the web UI is being looked at as well since as you've
> > noticed it's currently not great.

> I meant code coverage reports/stats, which show what's being tested
> and what's not tested.

No, I don't think that's something that's ever done for the kernel in
any sustained fashion. =20

> > > 4. Do I understand it correctly that test failures are currently not
> > > reported in any way (other than being shown on the dashboard)? Who
> > > looks at the dashboard? Is there constant monitoring of all results?
> > > Is automatic reporting in plans?

> > The test support is pretty much in development at the moment, until
> > we've got the infrastructure working well we're not really pushing on
> > reporting things out too much.

> This equally applies to build and boot testing too. If code does not
> build, this needs to be reported. How does this happen?

The build results are visible via the web site but the main thing for
KernelCI and all the other build testers is that people do some basic
triage and forward on the relevant bits of the e-mail reports.

--cPi+lWm09sJ+d57q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl1pfrMACgkQJNaLcl1U
h9Bd3gf6AiVxNe2YwluXvkZR+6bC18+F4x64MxZNkRhkxbMSKVH17OqRrAotixtD
sHqLFHUmQiRkWV0XvuYEPjV6mi9ksw55MuEAeAAvQJnVrHtJWcXDBIAj00nsIDPR
QH9COxSUWTLpRMug2ehFM4oiM53KB1A4DYDvurdwNeg3OzHxILki9TtfpM+tVkSC
l7qmzg0KU4xVtilfODOGqJtDiIL0yyJ8LNEeqO9b67OEvuwbtmMeF0/isVwSWXuV
r2ELLQUMzfN3PR4kGp+n6AIpv+FQH2/54iFVQOo/YO1Gg71JLGbTGlIrRkk8v0fv
vTb+QCCa55m3E4mj/zjqJm6O+ABVuw==
=J8Ua
-----END PGP SIGNATURE-----

--cPi+lWm09sJ+d57q--
