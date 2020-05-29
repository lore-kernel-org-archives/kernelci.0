Date: Fri, 29 May 2020 11:44:20 +0100
From: "Mark Brown" <broonie@kernel.org>
Subject: Re: kci_build proposal
Message-ID: <20200529104420.GC4610@sirena.org.uk>
References: <7ho8q77i1t.fsf@baylibre.com>
 <18306.1590738124792037023@groups.io>
MIME-Version: 1.0
In-Reply-To: <18306.1590738124792037023@groups.io>
Content-Type: multipart/mixed; boundary="Groupsio=dmlZBjXW3EpAsGytxQRB"
List-ID: <kernelci.groups.io>
To: kernelci@groups.io, mathieu.acher@irisa.fr
Cc: Kevin Hilman <khilman@baylibre.com>

--Groupsio=dmlZBjXW3EpAsGytxQRB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 29, 2020 at 12:42:04AM -0700, Mathieu Acher wrote:

> One issue we found is to build the right Docker image: some
> configurations of the kernel require specific tools and anticipating
> all can be tricky, leading to some false-positive failures.  Have you
> encountered this situation?=20

We do, generally when we notice something like this has happened we will
just add the new tool to our images and move on.  Since linux-next is
included in our coverage we tend to notice when things hit that and
people are a bit more tolerant of breakage there than they might be in
other trees so long as it gets addressed reasonably promptly.

--Groupsio=dmlZBjXW3EpAsGytxQRB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl7Q54QACgkQJNaLcl1U
h9AvmQf/T3/U+7UTy4PKDfMAQh2w5p0G9Zc8aWj/toWNolOjDBd8glwRmwp4W2F9
+rnqCojw4wW5zA2XFfUC+sUU1fSGn7TVMgaszyrtW54RxTxukCCVJ5PW/0xm/Y9t
roVM77Nre9zvRXTJ6s3r1z8ZkcaDIoy4qbZ/DZv3FCEspNQyG+cOM3svQdO/cXy3
Sm7RaBbtD6HomOYUhoqco36HlxfcrL+PSusNM/G2bDIHIwbU92dv1DrU+bAqHVZ2
8Ps9T4wuOFD1gwFsX7m/7m7/QPIa9/Fa5BomUdvIPcGSGJ+wPP2Jr19rxo14qGjp
+KK8zL5RJSO29Cx24itxikCHj4V90A==
=+AWq
-----END PGP SIGNATURE-----

--Groupsio=dmlZBjXW3EpAsGytxQRB--
