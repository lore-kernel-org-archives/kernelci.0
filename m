Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 885D918952A
	for <kernelci@lists.linux.dev>; Wed, 18 Sep 2024 13:20:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726665606; cv=none; b=us+utIWT+2Pmr+qZOTcrOr9aY9yVyG6EabOSX9dsbEq9BoQQ9pZmjoGTPOVMnXewXo6RNSFly3l9KzWjv+4QLIMuCvqiCL5oXl+CFViHSe9UKEnPV7BFNMsLYZJ4l7hrYzQVi+eBBKDfUDw9IPgffHC3bIh9EVftY75NufIqVRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726665606; c=relaxed/simple;
	bh=SHkWgd2IAx+QnCM0yiTdiJ1NU3em+8781oaGRwXaidQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LaLg/008LLVKLTHNGSXLSZrlI9Z89mBp3U7lIkcSDqqnOnhYTZS66Z7Fy5/tmIIPJDSCOxPnj7IEbbDZYOHzlRvBKVA972vb86PlGJ7tCiTGAyzhFX1r4H9iuaLye5ZSXiTefStXLyk6/QR7ib838Q9+TelXNsbB1ZSOO4TjSPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jPi8kRTV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jPi8kRTV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA828C4CEC3;
	Wed, 18 Sep 2024 13:20:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726665606;
	bh=SHkWgd2IAx+QnCM0yiTdiJ1NU3em+8781oaGRwXaidQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jPi8kRTV19eLU+bY6nb+epcTBuy7RvkFrY1EDpX/NWlLPGB/aZ+Y9lxDYUNFuFOx9
	 m0YepGxQuwOLJIWgCtVA9BfNrC4PLjbqLnC5cngn57J3r9f2qmJU0B3n4+QUvt1I/U
	 Zzb3WZHGt8ixnkCVPVdysQgg2t4RQeaIMYYukm1h0xrqifO/qUHWpXOpYoNA8zzd6W
	 34qOGuCpGjGKpkFo5IvWUSNtzX0dSYATosCrKmi0X16ykfMg2kso3pWhdyiUAqoL+y
	 Yiy5dH2RisF7qWxMDijWmxfMLztUfFOc8JJEpdFPBXmKFFO5/jQNw0acFDqZxs9/oJ
	 78jsC/ZATwbtA==
Date: Wed, 18 Sep 2024 15:20:02 +0200
From: Mark Brown <broonie@kernel.org>
To: Laura Nao <laura.nao@collabora.com>
Cc: Donald Zickus <dzickus@redhat.com>,
	Nikolai Kondrashov <nkondras@redhat.com>, kernelci@lists.linux.dev,
	Gustavo Padovan <gustavo.padovan@collabora.com>
Subject: Re: Test catalog
Message-ID: <ZurTgmBPQ_gTjKF2@finisterre.sirena.org.uk>
References: <CAK18DXZ9610pCm42m-D-gAKTrGQuh5TmEwaPyA6QHiB_80pK4Q@mail.gmail.com>
 <6edcd2a2-4e09-4f41-a4f5-5595fefecf75@collabora.com>
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xbKknv0Ook8F02Sg"
Content-Disposition: inline
In-Reply-To: <6edcd2a2-4e09-4f41-a4f5-5595fefecf75@collabora.com>
X-Cookie: Editing is a rewording activity.


--xbKknv0Ook8F02Sg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 17, 2024 at 12:15:25PM +0200, Laura Nao wrote:
> Hi Don,
>=20
> Sure, count me in! Thursday morning works for me. Looking forward to the
> discussion. I agree it's important to centralize info on available test
> suites and how to pick the right subset for each platform, focusing on
> maintainers' needs.

Thursday monring should be good for me as well.

--xbKknv0Ook8F02Sg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmbq04EACgkQJNaLcl1U
h9CVxQf/bQiBqUBSGbuYHJIGqWXqFMmH06TZhH80IDLHsYGRPV6usgILL2lKY3WH
ti6+boBhaJOV+dtJ20jLvUoksfzOXb/kkR987UNp2t8/CezWO5mqEzxG+lLGuF5w
8M/wYLaX68akgqNfj5YLAHxvyEqQTSa4NuJ6YKBdL23MGUzrvHNZbxGYDcnEuc9S
7if1c2sCkWZSHgzPY0/xY82o+NEWrd70eRvUGOnwrBF8yPsVHJM18G5vD9O46N0X
Z5ZDD/AoO8DIQQonA3r9mAG0ORU5W2duqNyN7yp71uMAKrE8a7hz5YFqiVqZ1QDS
nAsD9j0UaUbhcktqIWOdicrev3JM9A==
=Plcs
-----END PGP SIGNATURE-----

--xbKknv0Ook8F02Sg--
