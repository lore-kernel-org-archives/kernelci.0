Date: Tue, 21 Apr 2020 16:53:59 +0100
From: "Mark Brown" <broonie@kernel.org>
Subject: Re: kci_build proposal
Message-ID: <20200421155359.GD4540@sirena.org.uk>
References: <20200420163628.wmbc7f7vuvqsbdhw@xps.therub.org>
 <CAH1_8nBL+YSnmWyEkV336+wkq4YP=pHs1srUNxUZ_zhGxOe45Q@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAH1_8nBL+YSnmWyEkV336+wkq4YP=pHs1srUNxUZ_zhGxOe45Q@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="fOHHtNG4YXGJ0yqR"
Content-Disposition: inline
List-ID: <kernelci.groups.io>
To: kernelci@groups.io, guillaume.tucker@gmail.com
Cc: Dan Rue <dan.rue@linaro.org>

--fOHHtNG4YXGJ0yqR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Apr 21, 2020 at 04:46:34PM +0100, Guillaume Tucker wrote:
> On Mon, Apr 20, 2020 at 5:36 PM Dan Rue <dan.rue@linaro.org> wrote:

> > I've been working on a kernel building service/api that's designed to
> > perform
> > massive numbers of builds. The actual kernel build implementation reuses
> > kernelci's kci_build script.

> Out of interest, how do you manage the builders?

> We're looking into Kubernetes now so we might find issues similar
> to those in your use-case.

Indeed if the tool that you're working on is free software (I'm guessing
it might be if it's for Linaro?) then it might make sense to just deploy
a copy of that software rather than developing something similar.

--fOHHtNG4YXGJ0yqR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl6fFxYACgkQJNaLcl1U
h9DzWQf/eYlAUmNY285+K6rurb4Shd27/2zUIGf9XOgrol4asrTA+F/PyhjZzOOa
0g1DoUqvOc/AbUU4eDOlVB85nvYTImfXvJ31IfgLmn9fS9Nt2XOh6F38bi4UK2Go
1XhNPBrqvszAHR2CLpsSKffVdISCKIcsKyg7GUQeyigsAwvqHgrL7TpozzsUqqbr
B6nh0Lps95AkcrymTvZAQrBCHPHo74sX33PZfDlYX7SfLp17OCXGbWWrywd82e/x
N8rsf8bxu/TZu640EGiij3hOa6Lunn7KOJWXO5mVz4Ya4MU6RY+GAtJRNXgNjnIA
sGEPR4RBmOu4UhYtCfLI9kbqHjCL7w==
=9AQS
-----END PGP SIGNATURE-----

--fOHHtNG4YXGJ0yqR--
