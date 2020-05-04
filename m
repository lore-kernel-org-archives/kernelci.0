Date: Mon, 4 May 2020 12:28:37 +0100
From: "Mark Brown" <broonie@kernel.org>
Subject: Re: stable-rc/linux-5.4.y bisection: baseline.dmesg.alert on meson-g12a-x96-max
Message-ID: <20200504112837.GD5491@sirena.org.uk>
References: <5eabecbf.1c69fb81.2c617.628f@mx.google.com>
 <cc10812b-19bd-6bd1-75da-32082241640a@collabora.com>
 <20200501122536.GA38314@sirena.org.uk>
 <20200502134721.GH13035@sasha-vm>
 <20200502140908.GA10998@kroah.com>
MIME-Version: 1.0
In-Reply-To: <20200502140908.GA10998@kroah.com>
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="HWvPVVuAAfuRc6SZ"
Content-Disposition: inline
List-ID: <kernelci.groups.io>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Sasha Levin <sashal@kernel.org>, Guillaume Tucker <guillaume.tucker@collabora.com>, Jerome Brunet <jbrunet@baylibre.com>, kernelci@groups.io, Kevin Hilman <khilman@baylibre.com>, Liam Girdwood <lgirdwood@gmail.com>, linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org, stable@vger.kernel.org

--HWvPVVuAAfuRc6SZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, May 02, 2020 at 04:09:08PM +0200, Greg Kroah-Hartman wrote:
> On Sat, May 02, 2020 at 09:47:21AM -0400, Sasha Levin wrote:

> > > > >   Result:     09f4294793bd3 ASoC: meson: axg-card: fix codec-to-codec link setup

> > > | This clearly describes the issue as only being present after the above
> > > | commit which is not in v5.6.

> > > Probably best that this not be backported.

> > Hrm... But I never queued that commit... I wonder what's up.

> I saw the Fixes: tag, but missed the changelog text.  My fault.

> I'll go drop it from everywhere, sorry about that.

Ah, that explains it - thanks for sorting this out.

--HWvPVVuAAfuRc6SZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl6v/GUACgkQJNaLcl1U
h9DTqQf+J1WhHhwnr86jT/LtdmuYxn4YhdfaaW+RFSBKmakNZhXZ9BKok8utln+p
PkdIEGrfr8QfsSuhz4WYKDcN6K72tM+U3j0c4UFrYlm9kEfpuDr5AqJrdAclL76T
Ns2oaZFZEnIpHnkajK6KCa1Ss4Ka7AvQNuVJfZ+/d4DdAVDSUl3H9TM+1yJyR4Cz
FjMXYnlw+kp4LGSLCUy2yMEZ6YR1dzgDi7PIae1IYwwourTFOVjsox1CQPmE2bYv
32U+RLyE6qxAlFRwVqmhMqBWYr/ZUEmV8W026fEQWprg7jCq2oPCQxALfanL9f/X
rKflgftgFph+o3Rxz/MB0jHdsT/FbQ==
=KlPi
-----END PGP SIGNATURE-----

--HWvPVVuAAfuRc6SZ--
