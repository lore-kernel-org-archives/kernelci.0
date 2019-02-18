Date: Mon, 18 Feb 2019 18:54:35 +0000
From: "Mark Brown" <broonie@kernel.org>
Subject: Re: Testing Debian kernels on kernelci?
Message-ID: <20190218185435.GI10794@sirena.org.uk>
References: <20190218165402.obkznz2itzlqeys7@tack.einval.com>
 <ac7530daba2a2a42c7a1d254409cbbe34d9a2648.camel@debian.org>
MIME-Version: 1.0
In-Reply-To: <ac7530daba2a2a42c7a1d254409cbbe34d9a2648.camel@debian.org>
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="RwxaKO075aXzzOz0"
Content-Disposition: inline
List-ID: <kernelci.groups.io>
To: kernelci@groups.io, benh@debian.org
Cc: Steve McIntyre <93sam@debian.org>

--RwxaKO075aXzzOz0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Feb 18, 2019 at 06:09:27PM +0000, Ben Hutchings wrote:
> On Mon, 2019-02-18 at 16:54 +0000, Steve McIntyre wrote:

> > Due to my position in the LAVA team in Linaro, I know quite a bit
> > about kernelci and I'm wondering if it would be possible to get some
> > of our Debian kernel branches added to the list for at least some
> > automated boot testing. This would be major help for us.

> The last time I looked, KernelCI assumed all essential drivers would be
> built in and only supported use of a pre-built initramfs (if any).

That's not true any more, it will inject all the modules that get built
into the initramfs.  However the distro config is going to get ignored
anyway unless it appears in arch/${ARCH}/configs since the configurations
are pulled from the kernel source.

--RwxaKO075aXzzOz0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlxq/2sACgkQJNaLcl1U
h9BPgwgAgy2/mNG/435u9OaEZIJilOAMuACeI/xDn48gS73QtrVeT/uQpvQjZ4Hp
2FrmdegEkVWMDhxk0YXN+8LHMZ01484qXaIuw2zBIACcvfsf+H3uF7llLF8oupSp
GjZMa8LzZfWov9aqs/Yzbp39ejgzJ7uY8kAuDmNT4RetTVuSDynFSGIB09FnHv2i
He3V5cP3pfdYyG3u93OrcL+UJcueHBHnic8zazYe5t3MVe+AH5kpGDaLnXOriX8B
oHUim9/BqQ7ACsK2b2gMjxIHBgtm277FghMLgjmxUL0VmdUmX2FTJOX75B/TglrU
A/b2N9/I6beZLHRUcjjy7k1uH1c21A==
=p7wz
-----END PGP SIGNATURE-----

--RwxaKO075aXzzOz0--
