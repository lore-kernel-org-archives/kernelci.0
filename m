Date: Wed, 9 Oct 2019 15:25:05 +0100
From: "Mark Brown" <broonie@kernel.org>
Subject: Re: kernelci/staging.kernelci.org baseline: 59 runs, 1 regressions (staging-20191009.1)
Message-ID: <20191009142505.GE3929@sirena.co.uk>
References: <5d9dc6c8.1c69fb81.ffa07.41ad@mx.google.com>
 <557293d8-dde3-b24a-988f-f9b90dccf5f4@collabora.com>
MIME-Version: 1.0
In-Reply-To: <557293d8-dde3-b24a-988f-f9b90dccf5f4@collabora.com>
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="XuV1QlJbYrcVoo+x"
Content-Disposition: inline
List-ID: <kernelci.groups.io>
To: Guillaume Tucker <guillaume.tucker@collabora.com>
Cc: mgalka@collabora.com, alexandra.pereira@collabora.com, dan.rue@linaro.org, matthew.hart@linaro.org, kernelci@baylibre.com, anders.roxell@linaro.org, kernelci@groups.io

--XuV1QlJbYrcVoo+x
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 09, 2019 at 12:53:10PM +0100, Guillaume Tucker wrote:
> On 09/10/2019 12:38, kernelci.org bot wrote:

> > run | platform                     | arch   | lab          | compiler |=
 defconfig                    | errors
> > ----+------------------------------+--------+--------------+----------+=
------------------------------+-------
> > 40  | qemu_arm64-virt-gicv2        | arm64  | lab-baylibre | gcc-8    |=
 defconfig                    | 1/5  =20

> Any thoughts on showing measurements in test reports, i.e. the
> number of lines with emergency messages in this case?

The 1/5 bit is a bit weird - from the column title I'd expect it to be a
count of errors, but 1/5 sounds like 5 is what we're aiming for.
Perhaps just a count?

> It's not exactly great, but I don't know how to make something
> generic and still more useful without doing a lot of redesign at
> several levels.  Ideally we should be showing the log lines
> themselves in the email, like we do with builds, but that's not
> so easy to do with LAVA.  I guess the next step would be
> extracting the log lines associated with each test case as they
> should be there. Then we would be using that rather than storing
> the number of lines in a "measurement".

OTOH if the log lines for all the boards end up in the mail the mail
might get a bit big - this feels like something where being able to go
to the web UI to figure things out might be better, at least for a big
summary report like this.

--XuV1QlJbYrcVoo+x
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl2d7cAACgkQJNaLcl1U
h9CqzAf/duSEVr+KNDncRmejGjbBCUbLQgexTqb1aDhFqjuhOk6un21XjsGYJiIs
NWO5LEonnPRSVWN/W0r3ppMb4ArDG90g/JXGEKGI4SfZK4wIU4Qm/dgsVjK/xfdK
34HN6DRUp7JSISEattGU+mGUtnZsnPWSey7gp++4mn9TtqwISA/I86xobEW9Evvs
m6iKrbQaB1rnELjdXO+tBS7K3TQ/dIU/tqlOgwrY6T3F7sx5BM/7+RymKhdlEqr8
ovSp/6TwmVnym9mcxgxSD0vhTcYuD6Du2AuyTKNUyWy7sRZCYoyfBaNN2p9+Igvd
VdSnOvksZh5MAzBpOwIb3okgHx1dUA==
=bBc6
-----END PGP SIGNATURE-----

--XuV1QlJbYrcVoo+x--
