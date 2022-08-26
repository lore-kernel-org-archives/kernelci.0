Return-Path: <antonio.terceiro@linaro.org>
Date: Fri, 26 Aug 2022 15:40:38 -0300
From: Antonio Terceiro <antonio.terceiro@linaro.org>
Subject: Re: Moving lava-docker out of the KernelCI GitHub organisation
Message-ID: <YwkTphNM4mRI3aF4@linaro.org>
References: <bc992951-6d3b-4ccc-c3b6-ae8dbe32ec1c@collabora.com>
MIME-Version: 1.0
In-Reply-To: <bc992951-6d3b-4ccc-c3b6-ae8dbe32ec1c@collabora.com>
Content-Type: multipart/mixed; boundary="Groupsio=XHx2aLFpJqTh3ySRrgkz"
List-ID: <kernelci.groups.io>
To: Guillaume Tucker <guillaume.tucker@collabora.com>
Cc: Remi Duraffort <remi.duraffort@linaro.org>, Alice Ferrazzi <alice.ferrazzi@miraclelinux.com>, Corentin Labbe <clabbe@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, "kernelci-tsc@groups.io" <kernelci-tsc@groups.io>, "kernelci@groups.io" <kernelci@groups.io>

--Groupsio=XHx2aLFpJqTh3ySRrgkz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 25, 2022 at 04:05:47PM +0200, Guillaume Tucker wrote:
> Hello,
>=20
> The idea of adding BayLibre's lava-healthchecks-binary[1]
> repository to the KernelCI GitHub organisation was brought up
> during a KernelCI weekly meeting last month.  This appears to be
> related to the lava-docker[2] project which is currently in the
> KernelCI organisation, to bring the two repositories together.
>=20
> It seems to me that lava-docker and anything related to providing
> LAVA support is not something that KernelCI should be responsible
> for as a project.  In fact, the lava-docker repository has been
> managed entirely autonomously since the beginning by different
> maintainers than the core KernelCI repositories, and I believe it
> was originally added to the KernelCI org by Kevin as it was an
> easy thing to do that made sense at the time.
>=20
> Rather than having one more LAVA-related project under this org,
> how about either creating a dedicated GitHub organisation for
> lava-docker and related repositories, or adding lava-docker and
> the healthchecks to the LAVA GitLab instance on
> https://git.lavasoftware.org/?
>=20
> Having a dedicated org on GitHub would give the actual
> maintainers of the project full control over it, to add and move
> repositories, manage members, permissions etc. as they wish.
>=20
> However, if the LAVA maintainers think that lava-docker could
> become the main solution for running LAVA in Docker, then maybe
> it should be merged with some existing project on
> git.lavasoftware.org or added as a new project there.  That would
> give it more visibility and potentially remove duplicated
> efforts.

FWIW, there is also
https://git.lavasoftware.org/lava/pkg/docker-compose which seems
similar, but not the same, as kernelci's lava-docker (e.g. there is no
autogeneration of config files AFAICT). That's used by a few people, but
mostly for development purposes I think.

> I'm not sure I'm aware of all the implications for each of these
> options so I thought I would bring it up for discussion here.
> What do you think?

I don't really have an opinion on what to do with lava-docker. In
principle, consolidation and collaboration is good, but we would need to
agree on the details. Also, moving it around must be done in a way that
the current maintainers still have the necessary access to keep
maintaining it (because the move won't make new maintainers magically
appear).

--Groupsio=XHx2aLFpJqTh3ySRrgkz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEst7mYDbECCn80PEM/A2xu81GC94FAmMJE6QACgkQ/A2xu81G
C964cg/9HuSatJOO5AcTuVwTV6S27UpNz/X3I08pdrQaYVwTCGJwUyYnoHB6846/
gQWtl5Xg251Bir4vkCTSQpgVLMEadCG78LAnf19rtP1bB/5wQiBlhcZCGwsRZvHc
k8bkYY65B3Kdq6YtbXQUOOxXIiLDU5R96sgVvFdw3Zj7fYCzQhix6QR5dQ5fv8fK
BmSBkWCyTZqJd3OSFnC5TDjS5qYTuzbQr2jXDf0Uyt766XiWXG7qnlrBHWCFJXRm
hhJUc47s8akkljXJ30rylgKUIMdcg37Z2BSK0cjlci3oWzlLBaeGf3QiSH+ivqQL
DNHXRMhV0LyCmHUz7OUve6yC1mbSue8CUwU7Fm7IwwStpLMTXPr7v8JSnJrO0OtG
phCE/iuhcv46ZPpXEEWfagvRXhZ3Mjai1Z1pRpqg0J1TuYq13gP5l3uIkymeDkEd
ZUKQwG9t26G94r6BGNTUSSWOb/azfa8y1FauGhXtiB6ozSGC0yJQg3Aq0lZc4aLd
poTj2+bqEqt/it7hGpJ8W++0f3H8usIzO/Sd4Ns+2nufvFcoo20guO7YUF3V4Y7H
SC2zX60FhxqaOzgpkiozDA8DGTrDXGlxxMJb77AGOS3kgBqAUJ0PDHLH0dOFQ4HF
2WVrCpk9m5gYxOrG42xr1S/xuLWwDG/fePz0cgA5DTHTRFoAj8g=
=yjbZ
-----END PGP SIGNATURE-----

--Groupsio=XHx2aLFpJqTh3ySRrgkz--
