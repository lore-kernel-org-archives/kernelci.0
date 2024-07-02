Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EFB81A2C06
	for <kernelci@lists.linux.dev>; Tue,  2 Jul 2024 13:12:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719925974; cv=none; b=tNmyqbKBt/M4z1oY/lBPHxW8v7OlU/JMOYLaYsfK7g8eW/TI7dHihX77HeLCFsaZpgf1ZWdf23UkYoCieA+kObL3oZEuub2xOKeWRKNhaRo3UV3vp4jkcHAEqU2Sl+fT2G0PPpCOHw1j/VSxZoCQmuiAIDjUI/lwC+L/pvq9/Sk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719925974; c=relaxed/simple;
	bh=5D8uTMJIbKYx/sjT6fXkyZu+wy4pZMtaKHEX/r1LQvQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t9HiSNmBGZ/CTSZWqb4BtrL2oGINKXDD5shcK4VCPY+DWWsHPYW8eMoeQ3HqmT+ph3K7jzoGvCV6nITumSqHqmrc+GkumO7AD0+v4lCe2ELpNrCABOETIm/2Dq0Ha14QrxFdhx21sh2KS7s1lnZ5uJkeXbulVigVdQ4wuOFf6ks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AxPGVTsO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AxPGVTsO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B4F9C2BD10;
	Tue,  2 Jul 2024 13:12:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719925974;
	bh=5D8uTMJIbKYx/sjT6fXkyZu+wy4pZMtaKHEX/r1LQvQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AxPGVTsOFt843wYRqZ8POB5xl2zcKgn/N4bRwx7hUSMWeMKJ5wLXmdpJASdeDe8oO
	 sgeat6GFMXviIBlK6UBEYxlVlLxCUi07gB1/EwtxQYih5z0RsS8Ic7lv1/61aOp9Sq
	 FSQzQtiMMU37Ef/KgrqMHXiZZUev7DqdhAOV0fLk2Wp8YYsWpDB5uKEf8RXTyELYvR
	 US9UA59k7747+kMuLDv+CmGXT1R0Fa/bdaJfSzrjLyOZy13cF8s+VvFHdX5Uuit3E+
	 LwFacsMrte81sGYmCiXK2pL2yfKkG1ecELQcejwsH4SoldPXYv14z0471a5QSd4SGg
	 Dik9AedesQfbw==
Date: Tue, 2 Jul 2024 14:12:50 +0100
From: Mark Brown <broonie@kernel.org>
To: Todd Kjos <tkjos@google.com>
Cc: kernelci@lists.linux.dev, Denys Fedoryshchenko <denys.f@collabora.com>,
	Viktor Martensson <vmartensson@google.com>,
	Betty Zhou <bettyzhou@google.com>
Subject: Re: new branch + more recent gcc?
Message-ID: <bb6b9aba-04d4-4b36-a556-d52f44b12ed6@sirena.org.uk>
References: <962098da-8dfe-8a77-169d-ac1b2902b8b8@collabora.com>
 <CAHRSSEzH+PF92DrbPXKPwpaoqEPhh1hWKL8vio9Ou_-ejcb0Bg@mail.gmail.com>
 <CAHRSSEyp35+k4v-ak1qp0vvUOWJjTnJkWhOtCO5MCS++zL2u6w@mail.gmail.com>
 <CAHRSSEwYk1oGmJEn5xvB91GKSmaJ_ku5D7hvbS00Jb9-piUbOQ@mail.gmail.com>
 <a5fef4b96be3c80aff75eb3b20e1edc90e8bfe42.camel@collabora.com>
 <CAHRSSEzfXJU=GcyC_HfUUnNQdyjT8S68HqhN1bdaB6NE0TPGsA@mail.gmail.com>
 <961641f4-e0ed-48da-8336-186e3b8d23ea@collabora.com>
 <CAHRSSEx+1=8N6wEDFwiXoR61q+oX-r9tGXJjJ6vtzJ4y21c1uA@mail.gmail.com>
 <CAHRSSEwO4M0KKwdVEwjBDQ4vjMrWcHYKUVX7f4D9P9wTe2LTUQ@mail.gmail.com>
 <CAHRSSExXLEaz9GpnBXGE383Rq_rzgxFjWqnsxX_fRGkj4848fA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="9JHsIju1C8TR8OQp"
Content-Disposition: inline
In-Reply-To: <CAHRSSExXLEaz9GpnBXGE383Rq_rzgxFjWqnsxX_fRGkj4848fA@mail.gmail.com>
X-Cookie: Phasers locked on target, Captain.


--9JHsIju1C8TR8OQp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jul 01, 2024 at 10:27:24AM -0700, Todd Kjos wrote:

> 1) use gcc-13 instead of gcc-10 for android kernel builds

It sounds like you just need an upgrade here rather than specifically
GCC 13?  The reason I ask is that GCC 12 is the standard compiler in
Debian Bookworm so might be easier to update to quickly.

> 2) add android15-6.6-lts branch to kernelci testing

https://github.com/kernelci/kernelci-core/pull/2597

> 3) discontinue all gki_defconfig builds

https://github.com/kernelci/kernelci-core/pull/2598

(not 100% sure I got that one right, have to see how it goes on staging.)

--9JHsIju1C8TR8OQp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmaD/NEACgkQJNaLcl1U
h9CRtQf/Xf3Y7PylHzUzMchZ9Ug/JTnrpaQUaGHqlXLtAyy3feUaFwSsO6/zW3B6
JV8MxEeWuMp/PF4jxyrx9/PElVFjn7GxYfqd1grP9CGVC0IWGx5GKqfrasc0zqQ/
lVM9gjyRfwB5iRrobGJdZMB1/bj8QozStk0SsU9KY9yNU2m71VuN9SQXmJdcjUMX
sHtzvNb9JTFxKI1fFwpaMp4ssk2NvWlV7beVRBe8i4JYAAjZOgMJTFHCRnVwr27Z
IkbdW261biM3O89dJmegpWcUngz0LgIklCGZqpt1uiuIZM7M84L5mLhjNB6zMdF8
fd9xsIRaa08k1iX15z03QomdWHbcXA==
=d8W+
-----END PGP SIGNATURE-----

--9JHsIju1C8TR8OQp--
