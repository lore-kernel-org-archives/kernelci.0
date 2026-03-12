Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D1D1359A8B
	for <kernelci@lists.linux.dev>; Thu, 12 Mar 2026 20:21:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773346890; cv=none; b=VcVgmGv8tJNYMxq9tmrl1do6PqFq0n86pTYbz0BeO06Y0thIqnsrhNS0S5hXGpmr1ImY9at+9JuzzDvNGLzc+g7KabG8jodTaM05hfacJUkWJgtgOM029A0dWuxnT5avpuJVb/jT/NTGKR1KZdv+gNl8XNeWLuOAn5UPKdszCDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773346890; c=relaxed/simple;
	bh=wMOL91iQ6BLL1F/V6G6do0jgLtUkT+UdXHeXrl2H2DI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FOxLrReLehj6z47C8D3eWvg8gv7uBjIslGXELNXbBvO/RszNs51dvEV6lps2EetVw5SpDnyHlWOrwjZimiYeNyL0NmawUXd4cordpkbmrjDxx70+5ekkROlTZ53qR2CcDXiR+SWOTpWDyI1G5/qJMuNQZkpxhm01YsGriYjdrgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rRDuXf9O; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rRDuXf9O"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F980C19425;
	Thu, 12 Mar 2026 20:21:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773346890;
	bh=wMOL91iQ6BLL1F/V6G6do0jgLtUkT+UdXHeXrl2H2DI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rRDuXf9OaiRB82vRrUu494TD17Ct+p8ZCKKFZhBMAuk6vCBi5kQMpCIqw6Kv4EPtv
	 iIEy77Qocze6i6EWgp5MDBTcZA0YYASXHEI/tTd7N6O3zcI7pfQ2BeMoTa0wxckgAs
	 7cDPFXZEbJvvB9T48GQ83VWJBV6xoeEVhfjChPZ7vI1sjMBCJMh1+v60hVwjBjeYhT
	 R9QdpZP4/9v+6fFCedGIZW1Iv73EVyKwb7cyeutETploO0mRHQArSjwX//La3RY0DC
	 MP0bFJiEoPWBhNyqVLi8NROed5+9rufaeF8Q04ogi3vsONUqF6TF9FRYFUJXcKKR41
	 ui2UzFT5Ylo/g==
Date: Thu, 12 Mar 2026 20:21:26 +0000
From: Mark Brown <broonie@kernel.org>
To: Eric Biggers <ebiggers@kernel.org>
Cc: kernelci@lists.linux.dev
Subject: Re: Enabling additional KUnit tests in KernelCI?
Message-ID: <d2c55e92-5210-4d12-86f4-a24b64ab0fb9@sirena.org.uk>
References: <20260307075546.GA19654@sol>
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="lOQGICPgvv6f6KLc"
Content-Disposition: inline
In-Reply-To: <20260307075546.GA19654@sol>
X-Cookie: I feel better about world problems now!


--lOQGICPgvv6f6KLc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Mar 06, 2026 at 11:55:46PM -0800, Eric Biggers wrote:

> I would like the KUnit tests in lib/crypto/tests/ and lib/crc/tests/ to
> run in KernelCI and have any failures reported to
> linux-crypto@vger.kernel.org.  Preferably on all platforms, not just
> UML, since UML doesn't cover all the code.  Is there a way to do this?
> What is the status of KUnit in KernelCI?  I'm having a hard time finding
> information about this, and looking at the latest mainline test results
> (https://dashboard.kernelci.org/tree/mainline/master/4ae12d8bd9a830799db335ee661d6cbc6597f838?p=t)
> there seem to be no KUnit tests running at all.

We should be running KUnit tests:

  https://github.com/kernelci/kernelci-pipeline/blob/a3b622cfee641e26bed1906b29ed7065bee45921/config/jobs.yaml#L2153

  https://github.com/kernelci/kernelci-pipeline/blob/a3b622cfee641e26bed1906b29ed7065bee45921/config/scheduler.yaml#L1750

though like you say something seems to be going AWOL with at least the
reporting, I can't see any results either.  The job that's configured
there is to run on x86_64 rather than UML so is probably what you're
looking for in terms of the tests?

--lOQGICPgvv6f6KLc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmzIEUACgkQJNaLcl1U
h9CV3gf+IPV0DgwTZvbcBmnKREgaDhylSlhq8mw7b/fI+X1wDjQ1fGJCxKRyHdaP
n11yd+at0dFt8+B6qmwM8PY9ll8yQtgPOL/lgj+MdLpUXDrBHGLAEKDAZqzw8Z8/
afvD0DVcU7gENpf87mBVMzgvLnHZaIIW7qpfXZ7xZuhRJSRvihttTqJB88tCBgkq
B+Sn64ETyfahpz9TGqmtVaux4C0Muq4om/UOzqCW9UClPuyt0SBNckZHsgmZbdKN
HU0aiQxmRCZFAvnkDe67yY4DkplN5iNuMvJhrn6HwiAuRpjtAQH/nV9GqscvX0TQ
mmUpps23a8weW+UiWFsEwJ45vxqcXQ==
=lExc
-----END PGP SIGNATURE-----

--lOQGICPgvv6f6KLc--
