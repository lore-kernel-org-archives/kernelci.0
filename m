Date: Tue, 6 Aug 2019 20:02:55 +0100
From: "Mark Brown" <broonie@kernel.org>
Subject: Re: aarch64 Big Endian
Message-ID: <20190806190254.GH4527@sirena.org.uk>
References: <CAKwvOdn0kv+N5raBDE_aPv637ROHmu7C1_C9F3PXNnAYSMTOYQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAKwvOdn0kv+N5raBDE_aPv637ROHmu7C1_C9F3PXNnAYSMTOYQ@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="NzX0AQGjRQPusK/O"
Content-Disposition: inline
List-ID: <kernelci.groups.io>
To: kernelci@groups.io, ndesaulniers@google.com
Cc: clang-built-linux <clang-built-linux@googlegroups.com>

--NzX0AQGjRQPusK/O
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Aug 06, 2019 at 11:45:25AM -0700, Nick Desaulniers via Groups.Io wrote:

> I was able to "boot" a aarch64 kernel with CONFIG_CPU_BIG_ENDIAN=y,
> but without a userspace image... the kernel seems to get stuck in a
> loop somewhere.  I would have expected it to panic somewhere since no
> rootfs was provided.

> Is the boot failures KernelCI's reporting a boot timeout or no output at all?

As I said in my previous reports and the linked logs I gave show it gets
to userspace but can't figure out how to interpret init, there's plenty
of output.  You can see this in any arm64 big endian job in -next.

> [    0.351576] Unpacking initramfs...
> [    0.451870] Freeing initrd memory: 14796K
> [    0.454334] hw perfevents: enabled with armv8_pmuv3 PMU driver, 1
> counters available
> [    0.454815] kvm [1]: HYP mode not available
> [    0.732776] request_module: kmod_concurrent_max (0) close to 0
> (max_modprobes: 50), for module binfmt-4c46, throttling...
> [    5.882267] request_module: modprobe binfmt-4c46 cannot be
> processed, kmod busy with 50 threads for more than 5 seconds now

This is the same symptoms, it will eventually time out trying to run
init and generate a panic.  Those request_module messages are it trying
to load binfmt_misc which is how the kernel handles unknown binaries,
it's trying to run userspace but can't work out how to do that.

--NzX0AQGjRQPusK/O
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl1Jzt4ACgkQJNaLcl1U
h9DjIQf+Jbh2whfQAhlVZr/5rZPr5rsXc8Ktn9n3kdBNe8nJW5QD4JaTwjJjZnTt
WlDs/sO3HUA0yF3AsyZfBUGtQqcKdCe40zoY/ZjY1pmttP9PxiIrW3WX4ewk9m1l
NwNhjSsoia1IAbVw0Tavm8GoagENhzHilOyUuMLxeAvtCo49cvflg+RgEfciSe4T
WT9AlWi6+DCRjAOTOdzu4O55OBSpT1MWRLbEDyQLifa7V+r/hNTvVvC/WZ9hZejW
8GDAnOYBVUGzyIR/JhgiqAMbtRd74QgH0UQ+FxFvo+5aTTUeoTpnmkdQY0Btju/z
dr68pUXLaJj53uHqIJ3OstEG5E1hSA==
=FJZ0
-----END PGP SIGNATURE-----

--NzX0AQGjRQPusK/O--
