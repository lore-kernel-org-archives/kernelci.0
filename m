Date: Thu, 29 Aug 2019 13:14:41 +0100
From: "Mark Brown" <broonie@kernel.org>
Subject: Re: Some questions about KernelCI
Message-ID: <20190829121441.GD4118@sirena.co.uk>
References: <CACT4Y+bt8r-1t7=sFtH75_Bj-xBdTTUkM-tZ=GEoy2B=rCYQOg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CACT4Y+bt8r-1t7=sFtH75_Bj-xBdTTUkM-tZ=GEoy2B=rCYQOg@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="IDYEmSnFhs3mNXr+"
Content-Disposition: inline
List-ID: <kernelci.groups.io>
To: kernelci@groups.io, dvyukov@google.com
Cc: Kevin Hilman <khilman@baylibre.com>

--IDYEmSnFhs3mNXr+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Aug 28, 2019 at 02:03:22PM -0700,  via Groups.Io wrote:

Just responding for me, this hasn't been reviewed by anyone else.

> 1. Do I understand it correctly that KernelCI is still mostly about
> building/booting, it started running tests some time ago but few tests
> are currently onboarded? Is there a full list of tests? I looked at
> lava-kernel-tests repo, but on the dashboard I also seen "networking"
> tests, so I am not sure if lava-kernel-tests is the full list. There
> are plans to onboard more tests in the future, right?

There's also some of the v4l tests running.  The plan is to get the UI
working well and figure out what we're doing in terms of hardware to run
things on before expanding testsuite coverage.  I'll let the people
working on that provide more detail on how that's going.

> 2. Are there test coverage reports anywhere? Is it in plans?

There's some e-mail reports for tests which are sent to developers at
the minute, the web UI is being looked at as well since as you've
noticed it's currently not great.

> 3. Does KernelCI use any of KASAN, LOCKDEP, KMEMLEAK, FAULT_INJECTION,
> DEBUG_OBJECTS, DEBUG_VM runtime debugging features?

Not at the current time except in so far as they appear in defconfigs,
we do talk about it sometimes - some of them would even be useful during
boot testing - but we've had resource issues in the past with adding the
extra configs.

> 4. Do I understand it correctly that test failures are currently not
> reported in any way (other than being shown on the dashboard)? Who
> looks at the dashboard? Is there constant monitoring of all results?
> Is automatic reporting in plans?

The test support is pretty much in development at the moment, until
we've got the infrastructure working well we're not really pushing on
reporting things out too much.

> 5. There is no pre-commit testing, right?

Right.  It's a feature that gets talked about from time to time but
nobody's stepped forward to implement it and we'd need to figure out
resources to run the tests as well.

> 6. What are the major TODO items for near/mid-term future?

There's a bunch of issues in github:

	https://github.com/kernelci

but really a lot of it is about people scratching their own itches, for
example I want to do some work on the e-mail build reports since they're
not very usable right now but I've never got round to filing an issue
for it.

> 7. What is rough approximation of total engineer-years spent on the
> project? What are the major time sinks? Pain points?

Finger in the air I'd guess more than 8, possibly quite a bit - the
project has been going for a bit over 5 years, we've had periods where
there's been multiple people working on it pretty much full time but
also periods where it's been mostly in maintanence mode.

For me the biggest specific pain point right now is front end developers
able to work on the UI.

--IDYEmSnFhs3mNXr+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl1nwbAACgkQJNaLcl1U
h9Dg/Qf+Mjpj5nk7yn2ZtSouw6KSJ6Iz2yILB7VPsgZpYwHbGpuGwaJEK+3/sEgA
66lubelu0HksXWWUG1GpJn6r3M+2flrSRx51KRCG80Lhwi7hWyzowXOUmyZHgQ0E
5lcBDuIJK0Frh+fvclPvTNtJPTaF/83H/aiaIE2jbTJ3N0PeF+1pR9iNBQVICylL
aJiLwws5Ca4Z5yYiMLpDK/3q/BsxCnO03im1DPP2XWxMoTm6jNw6QMVCMiGMGO+i
94dVnqI1JTZlWPpN9+1BXcSFLzX1g8XT/gJ7VLxGzFVbB4ypryldo/AH+z4prOCA
knkpT3XF2c4Zzet0KYd+58fVRniQvw==
=NBpN
-----END PGP SIGNATURE-----

--IDYEmSnFhs3mNXr+--
