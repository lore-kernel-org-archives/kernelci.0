Date: Fri, 25 Sep 2020 14:23:14 +0100
From: "Mark Brown" <broonie@kernel.org>
Subject: Re: kernelci.org update - 2020-09-23 #minutes
Message-ID: <20200925132314.GC4841@sirena.org.uk>
References: <107c1572-ffc5-8797-6ae3-10fbe4e91eee@collabora.com>
 <CAKwvOdkHiRAxCrrqRTq=k09zW-X9cHogyq+7fTuM_aJyntXs4Q@mail.gmail.com>
 <200d3c91-9906-01d6-2642-718fbd356d76@collabora.com>
 <CAKwvOdmAev4-AP3g0cgZ8rV+iR4ACuy1ZQ_XoD09c1d2GF1S7Q@mail.gmail.com>
 <20200924110402.GB4754@sirena.org.uk>
 <CAKwvOdmEf7jM7QWZcPxy761CGsO24sEDY9OWJJcZKsc6jFy9xA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAKwvOdmEf7jM7QWZcPxy761CGsO24sEDY9OWJJcZKsc6jFy9xA@mail.gmail.com>
Content-Type: multipart/mixed; boundary="Groupsio=k1w9uWBxG5BNuXmtQO5w"
List-ID: <kernelci.groups.io>
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: kernelci@groups.io, Guillaume Tucker <guillaume.tucker@collabora.com>, clang-built-linux <clang-built-linux@googlegroups.com>, Todd Kjos <tkjos@google.com>, android-llvm <android-llvm@googlegroups.com>

--Groupsio=k1w9uWBxG5BNuXmtQO5w
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Sep 24, 2020 at 12:25:42PM -0700, Nick Desaulniers wrote:
> On Thu, Sep 24, 2020 at 4:05 AM Mark Brown <broonie@kernel.org> wrote:

> > The thought was that it might be worth using the actual Android
> > toolchains (including all the out of tree patches and whatnot) with
> > these branches as well as upstream clang.

> Would a Docker image containing AOSP LLVM probably be the easiest to
> integrate?  If so, I can look at providing such an image.

Yes, a docker image would be great - ideally Debian based.  Our current
docker images are built from:

    https://github.com/kernelci/kernelci-core/tree/master/jenkins/dockerfiles

FWIW.

--Groupsio=k1w9uWBxG5BNuXmtQO5w
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl9t70EACgkQJNaLcl1U
h9Apagf8C5vrRMxg9zpjdkpqp1ENXAg7smogtBn9a6gs9rnqdKAmrrYMLSPPGmxn
CDU5nqcj+0TLsdySEw/bSbsDTr07sIMFDxpwtR5RBCAVGBQZnE3IGM8NqqFIyTUl
sfddUwBKzZyzmGBuLDEXzpZzVNnTGp061Y8lrAA7axRZNZdHXIA1bhCH859hgKR2
Wvfw5XmN139hQ8tjfw1JHsKDO/WVrVnfxNmsMMtlOFFZFyzreM2wfDkgAcWZWTSe
+ADGKpTFJEo8pHOyaSejFyuuBhG+xkL0j8zKCcBG7YKiFzR+mx0aKxPO2F6ees03
JqNA8dtYYgdrNcmCSKcssbi1AlN+TQ==
=z1PE
-----END PGP SIGNATURE-----

--Groupsio=k1w9uWBxG5BNuXmtQO5w--
