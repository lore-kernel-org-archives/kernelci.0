Date: Tue, 11 Dec 2018 12:07:20 +0000
From: "Mark Brown" <broonie@kernel.org>
Subject: Re: [kernelci] next/master boot bisection: next-20181210 on meson-gxl-s905x-libretech-cc
Message-ID: <20181211120720.GC6686@sirena.org.uk>
References: <5c0ef32c.1c69fb81.72744.44d8@mx.google.com>
 <CAOi56cV9NL2bVnALDEs_XOv96Y=bFiVcsNJ3E0KPC+n1uXNcjw@mail.gmail.com>
 <20181211005359.GC3004@sirena.org.uk>
 <fff93168-d5b1-9997-c562-41e26461ba7a@collabora.com>
MIME-Version: 1.0
In-Reply-To: <fff93168-d5b1-9997-c562-41e26461ba7a@collabora.com>
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5QAgd0e35j3NYeGe"
Content-Disposition: inline
List-ID: <kernelci.groups.io>
To: kernelci@groups.io
Cc: Mark Brown <broonie@kernal.org>, Kevin Hilman <khilman@baylibre.com>

--5QAgd0e35j3NYeGe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Dec 11, 2018 at 08:58:28AM +0000, Guillaume Tucker wrote:
> On 11/12/2018 00:53, Mark Brown wrote:

> > It does say in the subject that it's a boot - perhaps we should put
> > something in the body as well?  It doesn't actually get mentioned there.

> Parameters:
>   Tree:       next
>   URL:        http://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
>   Branch:     master
>   Target:     meson-gxl-s905x-libretech-cc
>   Lab:        lab-baylibre
>   Config:     defconfig+CONFIG_CPU_BIG_ENDIAN=y
>   Plan:       boot

> The "Plan" parameter here says it's a "boot".

> Maybe we could have a link to a wiki page explaining what our
> test plans are, in case the recipients aren't familiar with any
> test plan.  Also, maybe "Test Suite" would be easier to
> understand than "Plan".

I think the problem is more that it's towards the bottom of a table of
stuff and people aren't going to get that far into reading the mail in
the first place.  How about changing the "Bisection result..." line to
be "Boot bisection result..." instead?

--5QAgd0e35j3NYeGe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlwPqHcACgkQJNaLcl1U
h9Dd1Af9HGOwbRBvAhXIUDg6uilVnhiOC8AGlm94Z0qWbbqyS8OhIh4nekeffzLV
upfkHKYVcMEvK0knNORy+b4qv9GcM194ebRYhqIq5cU2MzBt/lzvfjmqzHTUIX3L
qdTtKtqN8l5ZSmQonxfd9aGTx8Ly8hUVg4khBzjtN313BE5HM/FQiW51HFYFThDB
FilawGtbjimyj6FIvXGMRR6gfSYIki2TeukrprX/guACPENhzu2AX0wtNPU9zJkH
epqyUqm/2YKDnz/3bz1othtHxMdUZ9oTKxO3Gn/zj4we1oFqlIFrijBohLKjneS4
fYCHlG8YfT2IlPZp/otig4U7n7Uc/Q==
=iwl8
-----END PGP SIGNATURE-----

--5QAgd0e35j3NYeGe--
