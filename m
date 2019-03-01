Date: Fri, 1 Mar 2019 11:49:58 +0000
From: "Mark Brown" <broonie@kernel.org>
Subject: Re: next/master boot bisection: next-20190215 on beaglebone-black
Message-ID: <20190301114958.GB7429@sirena.org.uk>
References: <5c6702da.1c69fb81.12a14.4ece@mx.google.com>
 <20190215104325.039dbbd9c3bfb35b95f9247b@linux-foundation.org>
 <20190215185151.GG7897@sirena.org.uk>
 <20190226155948.299aa894a5576e61dda3e5aa@linux-foundation.org>
 <CAPcyv4ivjC8fNkfjdFyaYCAjGh7wtvFQnoPpOcR=VNZ=c6d6Rg@mail.gmail.com>
 <20190228151438.fc44921e66f2f5d393c8d7b4@linux-foundation.org>
 <CAPcyv4hDmmK-L=0txw7L9O8YgvAQxZfVFiSoB4LARRnGQ3UC7Q@mail.gmail.com>
 <026b5082-32f2-e813-5396-e4a148c813ea@collabora.com>
 <20190301104011.GB5156@rapoport-lnx>
MIME-Version: 1.0
In-Reply-To: <20190301104011.GB5156@rapoport-lnx>
List-ID: <info.kernelci.org>
List-Help: <https://support.google.com/a/kernelci.org/bin/topic.py?topic=25838>,
 <mailto:info+help@kernelci.org>
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="vGgW1X5XWziG23Ko"
Content-Disposition: inline
List-ID: <kernelci.groups.io>
To: Mike Rapoport <rppt@linux.ibm.com>
Cc: Guillaume Tucker <guillaume.tucker@collabora.com>, Dan Williams <dan.j.williams@intel.com>, Andrew Morton <akpm@linux-foundation.org>, Michal Hocko <mhocko@suse.com>, Tomeu Vizoso <tomeu.vizoso@collabora.com>, Matt Hart <matthew.hart@linaro.org>, Stephen Rothwell <sfr@canb.auug.org.au>, khilman@baylibre.com, enric.balletbo@collabora.com, Nicholas Piggin <npiggin@gmail.com>, Dominik Brodowski <linux@dominikbrodowski.net>, Masahiro Yamada <yamada.masahiro@socionext.com>, Kees Cook <keescook@chromium.org>, Adrian Reber <adrian@lisas.de>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Johannes Weiner <hannes@cmpxchg.org>, Linux MM <linux-mm@kvack.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Richard Guy Briggs <rgb@redhat.com>, "Peter Zijlstra (Intel)" <peterz@infradead.org>, info@kernelci.org

--vGgW1X5XWziG23Ko
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Mar 01, 2019 at 12:40:11PM +0200, Mike Rapoport wrote:

> Another thing to consider is adding "earlyprintk debug" to the kernel
> command line for the boot tests.

We probably don't want to do that on all the tests since it does
occasionally change timing enough to "fix" things but doing a final boot
with the failing commit and earlyprintk turned on is definitely a good
idea.

--vGgW1X5XWziG23Ko
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlx5HGUACgkQJNaLcl1U
h9BTkQf/VrjYWVkvN4y2fMqvKBsYfN7JSwOOYZywThA3uYBAEhgyQgEQU9gfCFZG
GCArUfZPSoLF+QKmaRiH/otILLye8aZDOLfrye3mxgyjtGkOGGQ/MKg1ez+2tKJ5
l/hD+wsMILytbH95oBmXw4GeCKc/7xnBNSAKMBf17X57IIgP5G8qdVxqEFxJc7N/
W9cKcQInyoqMCv4zgu+A6H3cvtYPkArOyoXfaobPn08evl9nj2foLmaJ59jBB3fR
Qsaf10R/O4Wj1lZQx6hLZGGHNIkBNmx1eNdKhCthLbsFs/isfEQo4IFkZ2t2B7ZT
FhMt4KB/mtFOrf0uwjZXISDKJ8dGGQ==
=owaE
-----END PGP SIGNATURE-----

--vGgW1X5XWziG23Ko--
