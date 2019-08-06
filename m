Date: Tue, 6 Aug 2019 21:08:09 +0100
From: "Mark Brown" <broonie@kernel.org>
Subject: Re: aarch64 Big Endian
Message-ID: <20190806200809.GI4527@sirena.org.uk>
References: <CAKwvOdn0kv+N5raBDE_aPv637ROHmu7C1_C9F3PXNnAYSMTOYQ@mail.gmail.com>
 <20190806190254.GH4527@sirena.org.uk>
 <CABXOdTckrMfM_-5+pJ37KHveLE8oRDvFAzPftnp_5--fYJVuXQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CABXOdTckrMfM_-5+pJ37KHveLE8oRDvFAzPftnp_5--fYJVuXQ@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4LwthZj+AV2mq5CX"
Content-Disposition: inline
List-ID: <kernelci.groups.io>
To: Guenter Roeck <groeck@google.com>
Cc: kernelci@groups.io, Nick Desaulniers <ndesaulniers@google.com>, clang-built-linux <clang-built-linux@googlegroups.com>

--4LwthZj+AV2mq5CX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Aug 06, 2019 at 12:58:43PM -0700, Guenter Roeck wrote:
> On Tue, Aug 6, 2019 at 12:03 PM Mark Brown <broonie@kernel.org> wrote:

> > This is the same symptoms, it will eventually time out trying to run
> > init and generate a panic.  Those request_module messages are it trying
> > to load binfmt_misc which is how the kernel handles unknown binaries,
> > it's trying to run userspace but can't work out how to do that.

> Correct. Also, while there is no root file system, there is an initrd
> (or at least the log says so), and there is most likely a little
> endian binary (init ?) in that initrd.

Right, sorry - should've mentioned.  You need a big endian root
filesystem (or init) to go with a big endian kernel.  The kernelci one
should be:

	http://storage.kernelci.org/images/rootfs/buildroot/arm64be/

--4LwthZj+AV2mq5CX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl1J3igACgkQJNaLcl1U
h9BnYAf/QPE78fv8x0SdFsgrnWKWinXqRyTOxP6bsCulC3DOCRg7zMl/9qHtwmOd
V1ajWNK5853c4ZIlrTVB32EjnBpn1cAi+9VCRCLveyYCcI+AoK3XsH0AjpzFLKXX
32jaamHVSzhNjwGhqq2lIDoafFrojsM7ajvB8M2b2rsxJVcZNHnY17Un2Xx93TFA
HPFL+r5nf9iuqUSQx+WL6DdkEF+VefzB1u/MCP8L0EIcSfVykofvlDAUNiF8noBA
dHqEWfuHfxKFWOpJ6+adBAn+YaPEe8qyhAz7P0BvuKb6QDIAEu4gQeCbIOtfxUIf
I2Y/dxnOJiGejLtbBYJYaHFRKYiKvA==
=6wQB
-----END PGP SIGNATURE-----

--4LwthZj+AV2mq5CX--
