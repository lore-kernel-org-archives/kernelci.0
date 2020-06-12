Date: Fri, 12 Jun 2020 14:50:44 +0100
From: "Mark Brown" <broonie@kernel.org>
Subject: Re: Kernel CI board addition
Message-ID: <20200612135044.GH5396@sirena.org.uk>
References: <456bf4081b13663a33f80e14837b69a3@walle.cc>
MIME-Version: 1.0
In-Reply-To: <456bf4081b13663a33f80e14837b69a3@walle.cc>
Content-Type: multipart/mixed; boundary="Groupsio=mbYgMqp8Hm6v7zvVVHQ0"
List-ID: <kernelci.groups.io>
To: kernelci@groups.io, michael@walle.cc
Cc: info@kernelci.org, michael.walle@kontron.com

--Groupsio=mbYgMqp8Hm6v7zvVVHQ0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jun 09, 2020 at 08:56:12AM +0200, Michael Walle wrote:

> our board (Kontron SMARC-sAL28 [1], based on the NXP Layerscape
> architecture) got upstream support in 5.7 [2]. I would be interested to
> add it to your kernelci.org setup. We could provide you a board together
> with the carrier board [3]. Are there any other requirement?

That sounds good from a software point of view, any issues with the
hardware would be up to a lab that was willing to host things - KernelCI
doesn't operate labs itself, it uses time on boards donated by various
companies and people:

   https://kernelci.org/sponsors/

> > Ideally, be supported by LAVA v2 for ease of integration.

> What means "supported" in this case? I had a look at [4], but couldn't
> find if there are any public "device-types" for the current boards in
> kernelci.

Basically just something that either works already or is very easy to
get going...

> Maybe a little bit about our bootflow: After the SoC comes out of reset,
> by default the RCW gets loaded from EEPROM, which then loads u-boot from
> a writeable SPI flash partition. U-Boot then loads the linux kernel from
> whatever source (USB, sd card, network, ..).

> The board is fully failsafe, which means there is a read-only (and
> hardware write-protected) SPI partition which holds the failsafe RCW and
> bootloader. By default, the u-boot start is supervised by an external
> watchdog and automatically switches to failsafe mode if there is an error.

...this all sounds great, LAVA supports u-boot based boards well so it's
usually pretty trivial to get a u-boot based board integrated into a
LAVA based lab.

--Groupsio=mbYgMqp8Hm6v7zvVVHQ0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl7jiDMACgkQJNaLcl1U
h9ByYwf+OYrYZ+4kpwc0OJIDF2CQmflQ+e74CYPLwnZ+pqSRHgaWEiVLkYeeXLZP
+5nuHTfenBBTfes4Es9j65rQG8P/yFSwhOYQKGHA50LwpVR2ixa6b87XUBF4Ul5B
g+fmhDqYgKxlGn/8Ve1a8Ch34/S3rNustD+5kxcaaQ8kOeP6PLhO40erkZruhv2w
YTmz2dnd1wIEvFb5QQjGVr+8m4u4qZWIMQpbQxuoxBcJptzSzvizbd+hfQXZ6059
OvTogYceFWbc5CB2mI6IZWCubnC+wurjCVRAoHV5EJrN/FqNyul3gxB93Q19+5bp
Sz55v5A+tNeDvjg1GBU0vZ9ZwBUMnQ==
=yC2N
-----END PGP SIGNATURE-----

--Groupsio=mbYgMqp8Hm6v7zvVVHQ0--
