Date: Thu, 1 Sep 2022 14:03:38 +0100
From: "Mark Brown" <broonie@kernel.org>
Subject: Re: UM-Linux compilation on Android Common Kernels
Message-ID: <YxCtqsY55Lwaj34H@sirena.org.uk>
References: <131709e8-f804-5623-448d-7c3607be00e0@quicinc.com>
 <CAHRSSExm0P0kBF00R9Ft7-GVMcf0A9190mjeOWU4umKA3PL93A@mail.gmail.com>
 <CAHRSSEy20Zc80XufjYN4XjXbba6BTMHd_9kFaNOnhiuj9yEDsQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHRSSEy20Zc80XufjYN4XjXbba6BTMHd_9kFaNOnhiuj9yEDsQ@mail.gmail.com>
Content-Type: multipart/mixed; boundary="Groupsio=kaSDNiDDkerY9qWpwJwM"
List-ID: <kernelci.groups.io>
To: kernelci@groups.io, tkjos@google.com
Cc: Elliot Berman <quic_eberman@quicinc.com>

--Groupsio=kaSDNiDDkerY9qWpwJwM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Aug 31, 2022 at 11:21:28AM -0700, Todd Kjos via groups.io wrote:
> On Wed, Aug 17, 2022 at 11:05 AM Todd Kjos <tkjos@google.com> wrote:
> > On Wed, Aug 17, 2022 at 10:51 AM Elliot Berman <quic_eberman@quicinc.com> wrote:

> >> Qualcomm recently caught some build errors in UM-Linux on Android Common
> >> Kernel. Todd suggested that these errors might be catchable by 0day. Can

> > I think in this context, I meant "catchable by kernelci".

> >> UM-Linux compilation be enabled for Android Common Kernels?

> >> ARCH=um SUBARCH=x86_64

> > I support this, can we add this test for android kernels? (could limit to 5.10 an higher).

This is definitely technically doable, especially the build side, but
there'd be some work required to enable actually running the kernels and
tests on them.  We discussed this at the weekly meeting today, the main
issue would be finding someone who has the time to do the actual
w.

--Groupsio=kaSDNiDDkerY9qWpwJwM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmMQrakACgkQJNaLcl1U
h9DcRQf6AlocUnr0ZiopOsdshYvKQKWGzxj29q6y9VcopJWCldtATkldFJe/kRbB
GJY5khnV0cHaz3OdE479UNgakQ9W3gP+EE+FSS317ZF6BCZ2RbpM6wLEiku91Fo4
inEDfnWht5aY8u9Dy4XjIgj7iLCaoUCl2Tvpq6IzP5yJLRRhuEgV2lRZjuqRK6Io
kdK++m7oUE0Nq+XxRL1d48MdzjtwpF96ggDdJWmUqlzkG7IFL6ew/qCwU3eFhOOE
Dt6UaLJ+96AIhmgSqRX4OP5AFcEldyRbVDC1GlPmUfAjEljOkmoRphrz5JGabMxq
ojL2hy2O90JLHrEmifXBWQ/MYVatvg==
=uN2U
-----END PGP SIGNATURE-----

--Groupsio=kaSDNiDDkerY9qWpwJwM--
