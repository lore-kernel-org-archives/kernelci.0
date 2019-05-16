Date: Thu, 16 May 2019 13:05:41 +0100
From: "Mark Brown" <broonie@kernel.org>
Subject: Re: [Automated-testing] A common place for CI results?
Message-ID: <20190516120541.GG5598@sirena.org.uk>
References: <299272045.11819252.1554465036421.JavaMail.zimbra@redhat.com>
 <457016061.11846096.1554475313006.JavaMail.zimbra@redhat.com>
 <ECADFF3FD767C149AD96A924E7EA6EAF977191AE@USCULXMSG01.am.sony.com>
 <20190515203334.lbhpqpdyulqztr5c@xps.therub.org>
 <516df501-82c2-67d5-890e-5a4274c7ce35@ti.com>
MIME-Version: 1.0
In-Reply-To: <516df501-82c2-67d5-890e-5a4274c7ce35@ti.com>
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="reI/iBAAp9kzkmX4"
Content-Disposition: inline
List-ID: <kernelci.groups.io>
To: Carlos Hernandez <ceh@ti.com>
Cc: Dan Rue <dan.rue@linaro.org>, kernelci@groups.io, Tim.Bird@sony.com, automated-testing@yoctoproject.org, info@kernelci.org

--reI/iBAAp9kzkmX4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 15, 2019 at 06:58:04PM -0400, Carlos Hernandez wrote:
> On 5/15/19 4:33 PM, Dan Rue wrote:

> > This has a few benefits:
> > - Non-opinionated place to hold structured data

Of course structure is opinion :/

> +1
>=20
> I like the idea

Me too.

> > The things this leaves me wanting are:
> > - raw data storage. It would be nice if raw data were stored somewhere
> >    permanent in some intermediary place so that later implementations
> >    could happen, and for data that doesn't fit into whatever structure =
we
> >    end up with.

> If required, we could setup a related table w/ raw data. I believe max ce=
ll
> size ~ 100MB per https://cloud.google.com/bigquery/quotas

> However, another approach could be to define the structure version in the
> schema. New fields can be added and left blank for old data.

Versioned structures do make tooling to use the data more difficult to
implement, I think Dan's idea is good especially early on when things
are being tried for the first time.

--reI/iBAAp9kzkmX4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlzdUhQACgkQJNaLcl1U
h9B/vwf9GkYYTVDmQeyPpvEKLldvzmAxbvHBcx2w3qVkDqGOp/w4ZkosLSYhiopf
PO5RjGgZn1MNygb9XIeyFgBnz0htR4fUozeLE74W+mqKbTGsNOxgQ0hdK3gR1ePa
un8TANtCuxlUnkjhO5uW52J14/s80jMza4cssi+hC2WjRgDXoYOZ935coa21PNLD
heZj/cSkVrdEcAz0mcrbUGt8Op8rUOmBHq944NCijWUNyz7qjPNUK3WxpgLcLNIB
69m9lxKN551HgdVFuu8gBQZ43p8KK6Lj1NeKzE53DjFlWl92/ZFan77fVHGfRZCN
loOZAXuQ63mOCwm47fOgeOqtLkrFTA==
=2Jj/
-----END PGP SIGNATURE-----

--reI/iBAAp9kzkmX4--
