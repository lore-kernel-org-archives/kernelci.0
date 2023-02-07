Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19EB429CA
	for <kernelci@lists.linux.dev>; Tue,  7 Feb 2023 13:40:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BEB2C433EF;
	Tue,  7 Feb 2023 13:40:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675777239;
	bh=GbvUBbdBctS0ZLdL6JanRImBjVkP4Pa9IPWpHUd/pF8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tCmFL8dWL6wURj02FPMFo6SGsfCwZZNx4ZVbSltUNKjoOTRjYWjlNwSZb709yxe1t
	 12TDJ4E0in4aImRyzN0GrCY0ImpZEKW0zxJELKBffsBNKYVnYBFtmC7BN5W56CMF0m
	 XhtFi1TJC4e8V+uL/YpNJ2gmWqJji/ZnOhpi0lnr5OL23cAMK1oF5SJX/YjJTe5PMj
	 as7YjHZRUIF1PsAdZr2Bj0FSzR/gIx/zJQNeGxpOn9hc7X2ninF4RS4NZalcGAYD0A
	 neTuK1kW3O7j0fYIA4peuOgU6EtKP1ONhwOSl2gkxg74cNn1xpoLYzK3so/QbmY7CJ
	 QekiDu/ZU2++A==
Date: Tue, 7 Feb 2023 13:40:35 +0000
From: Mark Brown <broonie@kernel.org>
To: Guillaume Tucker <guillaume.tucker@collabora.com>
Cc: mingo@kernel.org, x86@kernel.org,
	"kernelci@lists.linux.dev" <kernelci@lists.linux.dev>,
	"kernelci-results@groups.io" <kernelci-results@groups.io>
Subject: Re: tip/master build: 205 builds: 5 failed, 200 passed, 9 errors, 22
 warnings (v6.2-rc7-273-gd67c17ddc899)
Message-ID: <Y+JU07y+lvYAtZQT@sirena.org.uk>
References: <63e1f7e0.170a0220.7142.de7c@mx.google.com>
 <Y+IRiiRtXvUzXOGp@gmail.com>
 <c3cd3489-ca32-bdf5-4538-d95532bf9430@collabora.com>
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="c0ozLuDvekasEivI"
Content-Disposition: inline
In-Reply-To: <c3cd3489-ca32-bdf5-4538-d95532bf9430@collabora.com>
X-Cookie: Do not flush.


--c0ozLuDvekasEivI
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 07, 2023 at 10:56:04AM +0100, Guillaume Tucker wrote:
> On 07/02/2023 09:53, Ingo Molnar wrote:

> >>     4    cc1: error: =E2=80=98-mloongson-mmi=E2=80=99 must be used wit=
h =E2=80=98-mhard-float=E2=80=99
> >=20
> > ... but this exact same error was 'reported' a year ago on January 22:
> >=20
> >>    2    cc1: error: =E2=80=98-mloongson-mmi=E2=80=99 must be used with=
 =E2=80=98-mhard-float=E2=80=99

> > So these regression reports are useless in this form and they clutter=
=20
> > people's inboxes. Is any person reading them and acting on them to make=
=20
> > sure these emails are sensible?

> About the actual kernel build error, I guess it's a shame nobody
> has fixed this yet.  I'll take a look what the root cause might
> be.  If it's a KernelCI build configuration issue e.g. using
> wrong compiler flags then we can fix that, otherwise it's
> probably something to report more directly to some MIPS
> maintainers.

Honestly at this point I think we should just drop the affected MIPS
configurations at this point, as Ingo says they've been failing for
so long with nobody caring.

--c0ozLuDvekasEivI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmPiVNIACgkQJNaLcl1U
h9Cr8Qf+OPNGuOUH8N0tS0gZ0u9sLARc9dyf/98D6kyZ6HeolJkfrPtKC7/ptve0
vhAWSz/r4IKV4xA2PayKRpLDpV3DyJBpSoNO6aLPj2mW5xmU9kNhKZu6YDOmrcdj
VaaRjIGnrqVID9CcUAUQbH2MVOI7j+ZHyxVAsPzsGvW0veBWhnjJvPh8CV5oX5zx
7Tnez2LDlNdvxnMl2QPfIoTxDp4hwbiJZxrgDQz1xBkKfMdJh7TRnoRc1PTjzImi
cSDJd+iccLbPRMkXItJfBfFWDVqWnY5XFmPBTGZpRO/eaMXnm16VERZgMxNN5JuU
Ljyw2zStY2OgTR532jkseq+da5vRqQ==
=Mbt1
-----END PGP SIGNATURE-----

--c0ozLuDvekasEivI--
