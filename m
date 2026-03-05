Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4722837997E
	for <kernelci@lists.linux.dev>; Thu,  5 Mar 2026 16:49:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772729377; cv=none; b=MjHex2cMcSWIP28B5HchuXclHZSknwrIjn6Xg8zvflGH57igZ3JMj8H6eUdGdiOBcm0T9KSS+c0uJKkvIsRhynJbn8f6DBxf6DEhR7JBqN1oCJEPhhooYfUNhQIPkLOk0YuSMIR1rGgmzAiiT90eDH2JU6DUzcsuEdoldDaCWLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772729377; c=relaxed/simple;
	bh=xWornKwLsMyo9/f69Bg6Bmj2+L6QJVFyKIpoQG3c2nQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Zvdpfj0LTkeHLkwIB1dOuVCken+N6otP7oSXD9QD0lJ2JCvyMOudOzstK5OaOmU+CcTClJev5ufkAD/ihWIpvbn1ldYNq9Gu+AgisTxGBQAzaNrELHyK9y/OJiYe6TsvPTj1Ly//9C1BDwd9XDCmSAqYyX+QA8PEEz0tp6WHMxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RSezmRcG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RSezmRcG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CA92C116C6;
	Thu,  5 Mar 2026 16:49:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772729377;
	bh=xWornKwLsMyo9/f69Bg6Bmj2+L6QJVFyKIpoQG3c2nQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RSezmRcGKL3QvwEKXB+Iv16G8+F86TMmsEcawKN+0YXXIyY8kq70Q+zyvm/p4Ls7+
	 hFXdW1NDFDO4bC2Er28fz/7oMML+iDMhUjxTuL69njFETqa0N2++K4mjQRIDmH6daS
	 1k0SEld3NI9vNrfUxYqT83lAT6bBiiskQNcqzbM8ldjRYWpv6INZD+mAAphs/eGi9Q
	 OF0Y6HJZfr5/NMlhnlgQhiS1782gkrUJ4RrgFJdBRCkgb4bMKxsaXiH1TdMLIK5pYZ
	 nhi90hEXMpI0nETq7ubcsP13ygX/ligvl65/l4wDWv8Bl6LhkzMpQOSMoYlXbQu1YS
	 JdtZ2zeDMrTcQ==
Date: Thu, 5 Mar 2026 16:49:33 +0000
From: Mark Brown <broonie@kernel.org>
To: Ben Copeland <ben.copeland@linaro.org>
Cc: "kernelci lists.linux.dev" <kernelci@lists.linux.dev>
Subject: Re: Meeting proposal for KernelCI Bisection
Message-ID: <7a042ff1-4360-4dcb-97df-7b49f3c5f8b1@sirena.org.uk>
References: <CAL0q8a67TOQVyDMpdFdgqJmyC9snDoTJaG8Fhf2OqKS1wc=S8g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="omLhXqyCmHQXhMoR"
Content-Disposition: inline
In-Reply-To: <CAL0q8a67TOQVyDMpdFdgqJmyC9snDoTJaG8Fhf2OqKS1wc=S8g@mail.gmail.com>
X-Cookie: Onward through the fog.


--omLhXqyCmHQXhMoR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Mar 04, 2026 at 05:28:06PM +0000, Ben Copeland wrote:

> I have a list of people to include on a call. If you are interested,
> please let me know, and I will add you to the meeting.

> I propose the meeting for Thursday, 19 March, at 15:00 UTC.

That works for me.

--omLhXqyCmHQXhMoR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmptBwACgkQJNaLcl1U
h9CDqgf6A3FQgha0HWduv+7pLnXMddoW1urKgdI/nu/GashLsdZt8ZbucKNoP93G
5AD8O916+BZ/RQFt1wP6KbDHoYqEEIBjUQKPYADASCz6N17g3P6EGY/fdjjJIMF4
qWuPrbrezjJ8gM0zMMhQ7iwwt96HUYEUfLDwlpKtH3hGT2S/xNCYB/H0y+l86fut
OpIRx8663AntlYw5FySO+kWUAaXzXZoIv/VbSfVjC9hYOk6e/4w6Lz9Hsjgg3I7O
wUFdIi6kZOyVxfYjHoznEya3jOAwJarDOtgTfkwN1ogMAzMJ8qn33jNhk4oBTt4H
nxUTlHikDrjS1hVYJUuSsh41HrHcOQ==
=R6Al
-----END PGP SIGNATURE-----

--omLhXqyCmHQXhMoR--
