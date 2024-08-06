Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AED613C90F
	for <kernelci@lists.linux.dev>; Tue,  6 Aug 2024 19:26:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722972417; cv=none; b=q0p3HCW9fHOGjpKQO3SZdVYyQREvbvNUGxVqZkDcGb3vv+wapNRoN3ynUVrd9UCzcTlCeQdVo31qO8r8fpxZXLvCmVEVBAp4m+yTtTXw5xxbfDIi5U3eAz5YRGAjYtvT/2CnPDH4M9yTjFkDavks8zoRBJ+9pmmcria0DiPo/tg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722972417; c=relaxed/simple;
	bh=8U5Uu9NdUmDb2g7pn4WgLA5BIMZzdV1XX5UCW1NwnDc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HtiGt9k1cgH0Em4Jf/tPCAsADOEsWc3pNJwyXopjJ/a95emvz+ZlZ+BdD8l6++tzxZUPpn6+iWp2qsi2rc4VSvx4hKruSzpr78pjGrYY1sWKkcK//HZ2P3lKhffGN47OD1vUSVrh34YVOlS2FKwZAijKs4qhjqq8/ogP7JNsJik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YjExOxr7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YjExOxr7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 094D5C32786;
	Tue,  6 Aug 2024 19:26:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722972416;
	bh=8U5Uu9NdUmDb2g7pn4WgLA5BIMZzdV1XX5UCW1NwnDc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YjExOxr7uC0L1py05ioWhZZgcbmeG7ISrLf/phTXW++zUMOYJmz+myXnABtEmfiAI
	 an9t7OzmnFnItZH6yOuHuo9C54AtAR0e/nco2I3QyzxxW/NcqdFonwc2DxvbgaH7ji
	 Lnlp14EIQ8d91GHUqubNZji6eClu1voKgzi/+VB3x7G1TtSYJ8jv72G+6Hefh61kYm
	 DrTisnUeWI1qGveRwp4gt6JVHUt53Pj2TL9mu0ouxnb4/itaGG4WufxLLeNEdlk5lm
	 NXdIxhs6yBWRAPvAt4VJ2gLhED4fLGub8fK9YBQnYUvT0h7hhY7nBbQ0F8C49u6Mnm
	 WGZFPZnJJF6fA==
Date: Tue, 6 Aug 2024 20:26:50 +0100
From: Mark Brown <broonie@kernel.org>
To: Nikolai Kondrashov <spbnick@gmail.com>
Cc: syzkaller <syzkaller@googlegroups.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Vishal Bhoj <vishal.bhoj@linaro.org>,
	Alice Ferrazzi <alicef@gentoo.org>,
	automated-testing@lists.yoctoproject.org,
	Cristian Marussi <cristian.marussi@arm.com>,
	Tim Bird <Tim.Bird@sony.com>,
	Johnson George <Johnson.George@microsoft.com>,
	Veronika Kabatova <vkabatov@redhat.com>,
	"kernelci@lists.linux.dev" <kernelci@lists.linux.dev>,
	Don Zickus <dzickus@redhat.com>, Philip Li <philip.li@intel.com>,
	Denys Fedoryshchenko <denys.f@collabora.com>,
	Michael Hofmann <mhofmann@redhat.com>,
	Tales da Aparecida <tdaapare@redhat.com>,
	Aditya Nagesh <adityanagesh@microsoft.com>,
	Jeny Dhruvit Sheth <jeny.sadadia@collabora.com>,
	Sachin Sant <sachinp@linux.ibm.com>,
	"Hambardzumyan, Minas" <minas@ti.com>
Subject: Re: [Automated-testing] KCIDB: Test schema enhancements
Message-ID: <ab2e9692-f2b5-4b5f-8767-308c1a4d2771@sirena.org.uk>
References: <5188d6fe-bd01-402b-a6e6-0fe57ef4d336@gmail.com>
 <738dcd74-fe4d-4e49-900e-b7c1635bb798@gmail.com>
 <49484f50-3506-4856-99a8-591b7ae29a44@gmail.com>
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="HkU2MEC0o0EnAAEy"
Content-Disposition: inline
In-Reply-To: <49484f50-3506-4856-99a8-591b7ae29a44@gmail.com>
X-Cookie: One picture is worth 128K words.


--HkU2MEC0o0EnAAEy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 06, 2024 at 08:39:13PM +0300, Nikolai Kondrashov wrote:
> On 8/5/24 3:28 PM, Nikolai Kondrashov wrote:

> > The "compatible" property in the root of a device tree specifies the de=
vice
> > vendor, the device (board) model, as well as often the device SoC and f=
amily.
> > These are generally encoded as several strings, ordered from most to le=
ast
> > specific, each potentially containing multiple parts separated by comma=
s.
> > E.g.:

> >     "ti,omap3-beagleboard", "ti,omap3450", "ti,omap3"

> Just wanted to highlight, that we also need feedback on this. Thank you!

It looks good to me - I suspect it's just uncontroversial and everyone
thinks it makes sense? =20

--HkU2MEC0o0EnAAEy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmayePkACgkQJNaLcl1U
h9CkTgf/SiqNl5vkqFmskv6NhQRRvX9nPTT+fsGxykxhsl7a9wyr9gBoKylfH4q7
emWZLtbA8fY+w8cEy323CXS8CrAda2xhVZSoto1CT38lwoiLs+mGOrCThBQNQZr8
Y0ss00JysE4/Gd0wymwqDgjeTMlexB+lV8tICIjBEZCi3m9bf2KU5vZCXauMZuGd
RIKpHnZwsEQUJKzSWFzE8mAB75EST7tIIPrWnv1wLYMg5qBGC1tMaTxilYB8ilHD
pvCyN/YGJ5n6qGvR+JYr+Wa7riZ6JFZmUc4SeCsBeELRcrUem8CYy18ms2diupx+
YoeEzj+v6lH0XQoNEIDp0ov1CzX6Ug==
=0a8B
-----END PGP SIGNATURE-----

--HkU2MEC0o0EnAAEy--
