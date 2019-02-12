Date: Tue, 12 Feb 2019 12:33:00 +0000
From: Mark Brown <broonie@sirena.org.uk>
Subject: Re: Baseline test plan and bootrr
Message-ID: <20190212123300.GB20635@sirena.org.uk>
References: <e32f672f-da87-7f89-c9b3-93a0a56aaad0@collabora.com>
 <df8ef2bb-b351-2003-5a1c-030a056d1d63@collabora.com>
 <CAFqH_500cnVrgknz5e7=QmH99KfBihLMNA2hee92jmVvQ4_XKw@mail.gmail.com>
 <142fbd32-4872-360e-89d2-3ca540df416e@collabora.com>
MIME-Version: 1.0
In-Reply-To: <142fbd32-4872-360e-89d2-3ca540df416e@collabora.com>
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="uQr8t48UFsdbeI+V"
Content-Disposition: inline
List-ID: <kernelci.groups.io>
To: kernelci@groups.io, tomeu.vizoso@collabora.com
Cc: Enric Balletbo Serra <eballetbo@gmail.com>, guillaume.tucker@gmail.com, Enric Balletbo i Serra <enric.balletbo@collabora.com>, anibal.limon@linaro.org, nicolas.dechesne@linaro.org, bjorn.andersson@linaro.org

--uQr8t48UFsdbeI+V
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Feb 12, 2019 at 07:52:03AM +0100, Tomeu Vizoso wrote:
> On 2/11/19 6:18 PM, Enric Balletbo Serra wrote:

> > device-specific scripts. I'm wondering if the bootrr developers have
> > or thought at some point on some kind of automatic tool to generate
> > the scripts (i.e parsing the DT, however, this doesn't cover all the
> > cases) or if is done always manually.

> The kernel already exposes the device list to userspace, doesn't it? But
> that doesn't help with knowing which of them aren't expected to probe.

The kernel gives you a list of devices available to bind and a list of
drivers loaded, from these you can infer which devices should be able to
probe.

--uQr8t48UFsdbeI+V
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlxivPsACgkQJNaLcl1U
h9Aw8wf+LsB8oWIoNOCJEYfB5gxhCN6mmB+0l9/5Co0cUQbk+BSvkQMUTg7V6UI0
M8Mev6HEjGX8yx2mKGg4w0jfe8crR0vHZlrTObT4TtpXhJM4dlyok+h1iW2mFgry
qARQvZsh4oJAH+PoW3hdhsy8qzy8ARU/u+pOfwWXruBDnBiFETUmpmw/Ps+IR3hz
JW3JlOQzGAa+m8BVMU0ZFYYvQD5KSsO/W9N8oHR60b+h8m2k7L9EaMJTmo37diez
RJ++cBfE0d7lX4dHFBtdWzEzWqlTRc3aKPK4yR1bRlOwTMRp5SyBXyzmkcztjTK7
7Qad4Uh16R05kDniZjtcnbVr2vnveA==
=6DRM
-----END PGP SIGNATURE-----

--uQr8t48UFsdbeI+V--
