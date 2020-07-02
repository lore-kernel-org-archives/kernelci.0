Date: Thu, 2 Jul 2020 12:24:00 +0100
From: "Mark Brown" <broonie@kernel.org>
Subject: Re: Improve kernelci setup for RISC-V
Message-ID: <20200702112400.GC4483@sirena.org.uk>
References: <3c2cba2849caa6ea0116611c1da3268b41432b76.camel@wdc.com>
 <7hsgeaixcl.fsf@baylibre.com>
MIME-Version: 1.0
In-Reply-To: <7hsgeaixcl.fsf@baylibre.com>
Content-Type: multipart/mixed; boundary="Groupsio=KDXVuhUEPTB0pkueCCae"
List-ID: <kernelci.groups.io>
To: kernelci@groups.io, khilman@baylibre.com
Cc: Atish Patra <Atish.Patra@wdc.com>, "drew@beagleboard.org" <drew@beagleboard.org>, "palmer@dabbelt.com" <palmer@dabbelt.com>, "david.abdurachmanov@sifive.com" <david.abdurachmanov@sifive.com>, "raj.khem@gmail.com" <raj.khem@gmail.com>, Alistair Francis <Alistair.Francis@wdc.com>, Corentin Labbe <clabbe@baylibre.com>, Lakshmipathi Ganapathi <lakshmipathi.ganapathi@collabora.co.uk>

--Groupsio=KDXVuhUEPTB0pkueCCae
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jul 01, 2020 at 05:17:46PM -0700, Kevin Hilman wrote:
> Atish Patra <Atish.Patra@wdc.com> writes:

> > But Alistair & khem (cc'd) expressed interest to add OE to kernelci as
> > well. Can you share some pointers on what needs to be done ?

> The main tricky/annoying part with yocto is that builds are per-board,
> where as we like to build rootfs images per-arch.  Maybe there's a way
> to build an arch-generic yocto rootfs using a qemu target or something,
> though.

That definitely works well, I'm doing a lot of my testing with a setup
like that - just ignore the kernel that yocto builds and use the rest of
the rootfs.  Once you start to get further up the stack it can be an
issue but for most things KernelCI is covering now it's fine.  The only
gotcha I'm aware of is if there's architecture variants that are binary
incompatible (like moving to v7 on arm) you need to pick one that's
suitable for everything that'll use the image.

> OTOH, I'm not quite sure what we would gain by using yocto instead of
> debian?  Are there more packages for yocto available than for debian
> currently?

I'd expect it's the other way around TBH.

--Groupsio=KDXVuhUEPTB0pkueCCae
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl79w88ACgkQJNaLcl1U
h9AnrQf9FX7Z59TyPQzYo/Tr5bLVx3qJ729UxRRZqxcDSnNIok3z4gilQ1XuSjVR
AaJh9p68FnNP8AiDRkfU9iOq0etAprJNpY40Dl9Tx/WBBgblJqXyY+z8OsJ1Ha0h
zGdmG9bjmUWzTKnpjTJurTq+hZ8/7y2aOevx7qJv6sQ3Ik+QwnVn3vCEuOjvWFBF
T2muy3vK3FhXpOWykcaBStKoxQq0v9Pv+9qqLwmOkIIpL1FX4Q6xVKSM6L+s47sX
rSgjStTxWnjVtOVlzHFtlfuOe1GPRpZYqggqE3EL2ujeCwvi3kxJ+kHGh8iXUDFj
pp4N58ZHHRClYYJGntARG9TPOP7yVA==
=oAnW
-----END PGP SIGNATURE-----

--Groupsio=KDXVuhUEPTB0pkueCCae--
