Date: Fri, 1 May 2020 13:25:36 +0100
From: "Mark Brown" <broonie@kernel.org>
Subject: Re: stable-rc/linux-5.4.y bisection: baseline.dmesg.alert on meson-g12a-x96-max
Message-ID: <20200501122536.GA38314@sirena.org.uk>
References: <5eabecbf.1c69fb81.2c617.628f@mx.google.com>
 <cc10812b-19bd-6bd1-75da-32082241640a@collabora.com>
MIME-Version: 1.0
In-Reply-To: <cc10812b-19bd-6bd1-75da-32082241640a@collabora.com>
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="zYM0uCDKw75PZbzx"
Content-Disposition: inline
List-ID: <kernelci.groups.io>
To: Guillaume Tucker <guillaume.tucker@collabora.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, kernelci@groups.io, Kevin Hilman <khilman@baylibre.com>, Liam Girdwood <lgirdwood@gmail.com>, linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org, stable@vger.kernel.org

--zYM0uCDKw75PZbzx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, May 01, 2020 at 12:57:27PM +0100, Guillaume Tucker wrote:

> The call stack is not the same as in the commit message found by
> the bisection, so maybe it only fixed part of the problem:

No, it is a backport which was fixing an issue that wasn't present in
v5.4.

> >   Result:     09f4294793bd3 ASoC: meson: axg-card: fix codec-to-codec link setup

As I said in reply to the AUTOSEL mail:

| > Since the addition of commit 9b5db059366a ("ASoC: soc-pcm: dpcm: Only allow
| > playback/capture if supported"), meson-axg cards which have codec-to-codec
| > links fail to init and Oops:

| This clearly describes the issue as only being present after the above
| commit which is not in v5.6.

Probably best that this not be backported.

--zYM0uCDKw75PZbzx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl6sFT8ACgkQJNaLcl1U
h9CjCwf6A/KP149/7ilTWJylUigNvyI1cVIskzDBGQREGWK0VI2Z8qGOKkNgLzZw
F8H2cYXmeDRb0MJRqgNwV0mDl3iHd7l2lqtIUd4kQdvL7id2OlZV2NEso/o28AwF
x5GDVyl5E9rRto72Krs/X1R1V2+ACbNJORJiargnx7mv7QlmY5L0axZKbifhjP/C
aEA5DlAD6eZXLpOCh++yPZYuatnik0c5uSao+TKsurFgxfC2+xdUnFC9QTYRd7NA
jchP5RvU86y4V7yzhlBcndg+msHZ9/EjcJj1zdbJuaeDX2y895T3jCtgLzlhHVAM
bCa8P2t5jxwaaDQxCLHjRE+uFUbt+w==
=Ue/C
-----END PGP SIGNATURE-----

--zYM0uCDKw75PZbzx--
