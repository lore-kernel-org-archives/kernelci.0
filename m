Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B78331ED93
	for <kernelci@lists.linux.dev>; Thu, 30 Jul 2026 12:17:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785413861; cv=none; b=s1t1g5AJkjHKHa6MwI7hOPmaHKh6qsgeIa1xQu2jL/x2NXJVZlcmvREXeVgmuDEQe6RsQHBHTxzPoS9U6ekDR9NHhBp9RqjRKcQbsYtZO6Rak8oKwxKjotNeU0Wr8vU1c12hP6aOPdYomIDdIbvVk+xz2DZ5lKeMZO3NBfLOg1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785413861; c=relaxed/simple;
	bh=s7Z/i3HRbJIejewoLRT21O4DUhFUT0h2jmY9eQo+2/s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RVZxzR/oIGqHUOxpa8hc7w/MdfJFA2yBA7C9SiXmiFf+RoHWLHWTD8d6xAOoB3te2quJZFNV+2BQrtVP6PmKlu+wkN0B8784dkwpEpkKfj685/oxT3sQfE0kCYtEVZxWIrFDzYQhSlmeOs7QhvuPcONzoU3OxwgD/6rpQO1KzTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OVt1aOc6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OVt1aOc6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B0DB1F00A3A;
	Thu, 30 Jul 2026 12:17:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785413859;
	bh=LeZ6+1nYz1WgJNNBesfWQxkvrKY/BuPaBIGP+gCkLN4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=OVt1aOc6B0AIjDaqrsLpCwzMPJcoGhsx1atDnOB9Ovtui3ZlTofQD/cB4JVXRqgTy
	 a7LDD1xnTpKd3+Xwszfsm9/GYiH+a1s9rlmOMqktdL8ZCnHfjSJmkH5qf0UCTHoohY
	 oBPA9yHY1IAvTDXND8yg4hEuwVYIX8ChFBHNW8E8WcvweN2CHVo/dis1Nai87nX0hh
	 OiZyegt1FGCGcEj2vIGJISnIAg8rOBAXjVGUX+81Ey0Pd16R1qtt/rA2EHasGI4vlm
	 Mpuyfp7Tgojk5/B6RZWzCBCgMgjg4egBMwLmXDo21IJB2eKuMdcFz3erxovxEQwLeQ
	 bdagYlOmsuQ9g==
Date: Thu, 30 Jul 2026 13:17:36 +0100
From: Mark Brown <broonie@kernel.org>
To: Will Deacon <will@kernel.org>
Cc: kernelci@lists.linux.dev, catalin.marinas@arm.com
Subject: Re: Missing kernelci bot emails?
Message-ID: <17901d7a-d6ac-4557-827f-b5fcc0af6f0f@sirena.org.uk>
References: <ams_9JHxvOVUFX_W@willie-the-truck>
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="L6KA1UDix4h6BYXS"
Content-Disposition: inline
In-Reply-To: <ams_9JHxvOVUFX_W@willie-the-truck>
X-Cookie: In specially marked packages only.


--L6KA1UDix4h6BYXS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jul 30, 2026 at 01:13:40PM +0100, Will Deacon wrote:

> The last email I got from the KernelCI Bot was on 20th June:

> https://lore.kernel.org/all/178192264021.17323.9854948270991678156@330cfa3079ca/

> I've updated the arm64 for-kernelci branch since then, but I don't seem
> to have received another update. Is something broken?

FWIW the branch is still being tested:

   https://dashboard.kernelci.org/tree/arm64/for-kernelci/365f9c7a6b81889720fc221c166075b1ce81c641?i=7

so whatever's happening is the emails.

--L6KA1UDix4h6BYXS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmprQN8ACgkQJNaLcl1U
h9AH5Qf9EfasjYIHffhxQs2ca1O9CunowfR24CEGNiQnKAtrE90kf0nqgcRhOI8x
LiG7kfijnU7zbGwv9d4fMTSltEm9eMSqAC525BQTBwEAYUkTGr3qc0tVRzz4qlEH
6rcxOskSOb23A1gCR/GBSPqDP2MBQTBjNpV3FsAmqf/pMKqeKvOd7X5aloN3Hxd2
aaq3LCqCkt8jyDYJyBLd0NuBpZJ5UFtnyT0pUYrvNxNK3yX2UkN33R/tWoqCSP8X
eKkCgh0MRJKwMqVfYN+L/jImTW7DgJcHm2IeWNZgvkMkLrJMBS47VZMA5vCVoYQz
ZrfGz4GUfapXW780Ao2U3Q6TV+ZRHw==
=03l/
-----END PGP SIGNATURE-----

--L6KA1UDix4h6BYXS--
