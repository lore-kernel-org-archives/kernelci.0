Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B18636AF2
	for <kernelci@lists.linux.dev>; Wed, 15 May 2024 17:09:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715792988; cv=none; b=Grgm/X5Mn0LZ/rjk5z7CmQKyOSCzjICvNV2DiKPZ47ZdMTxJmAQUCFDIhyWzp4vUx1A3oQo3AMOl+F+v/8iXKWHeKQXNPp59pUGxkvcvOqr29DvIj6mht9nVKQ4PtCJXz3aB5+oD7ObZDxXdoWOKhS/OuyixewkqkHKqwiABGUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715792988; c=relaxed/simple;
	bh=WKeh4HW0IH1wYgoMAGQHaSNB9H+/wFKPVoi5btifs+4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BNrEsIyOC1QJkfDwdYIGY/R1aKessE07upRFFQEq/wV6gMTaSUSKIijr9U4PFVjdXmDxXAv0DkATmKaC/tY6fV2wKW5jgGFZ7hE3KGx9UAYMJgOkgbfJCgaZgx1Ih4j2+b8MGDzjeVVIXgZXL2JRVm2Pos88d1VQ9c7xh5TGXOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cVn4zeDl; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cVn4zeDl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6756C116B1;
	Wed, 15 May 2024 17:09:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715792988;
	bh=WKeh4HW0IH1wYgoMAGQHaSNB9H+/wFKPVoi5btifs+4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cVn4zeDlQFMDfqcfKzaTFpdBUD8bT3uq+dVlmvjxhHdKxpx63n2HLZoJ9D+vkA/Sl
	 oe3g7Par2GUz3Zf/lYISvYm4ycsWJcr1u+pF0UKAFoS13YARn5LQ6YLMmM2bQaSe2E
	 7Su9F8oTto781s7q/Faws+AQw2MBjQw3V7YumhP31CEYUJsTtUCq85u+Rqp2lzzBHh
	 sr085AaBpLHllCNs4eSV1eOaA6oncFqxPhZwzql9qsNd0eewGxzrDodABkE4pPzzV6
	 aUyDWmmGNkSB266xReS/OYzLHwRrYQfITuYH6hPismg0DSvhA5curKOY9BdCJaf26e
	 wmz9kqgxuuJ/A==
Date: Wed, 15 May 2024 18:09:44 +0100
From: Mark Brown <broonie@kernel.org>
To: kernelci-results@groups.io, bot@kernelci.org
Cc: kernel-build-reports@lists.linaro.org, kernelci@lists.linux.dev
Subject: Re: next/master build: 174 builds: 12 failed, 162 passed, 13 errors,
 11657 warnings (next-20240515)
Message-ID: <59c655f0-1077-481c-b5b2-ec830990c138@sirena.org.uk>
References: <6644e7e2.170a0220.e1869.edb7@mx.google.com>
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Ntdr80yw2aStC9cx"
Content-Disposition: inline
In-Reply-To: <6644e7e2.170a0220.e1869.edb7@mx.google.com>
X-Cookie: When in doubt, lead trump.


--Ntdr80yw2aStC9cx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 15, 2024 at 09:50:42AM -0700, KernelCI bot wrote:
> next/master build: 174 builds: 12 failed, 162 passed, 13 errors, 11657 wa=
rnings (next-20240515)
>=20
> This legacy KernelCI providing this report will shutdown sometime
> soon in favor of our new KernelCI infra. Not all tests are being
> migrated.
> If you are still using this report and want us to prioritize your
> usecase in the new system, please let us know at
> kernelci@lists.linux.dev

I'm not specifically using these emails so much, but I do use the web
dashboard version of the same thing a fair bit.

--Ntdr80yw2aStC9cx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmZE7FcACgkQJNaLcl1U
h9C7kgf/RNrAa+59dJZER9mi3GM0309QXAtpY9VEs7w0CJ6f062mi7eheJNIQdmT
gh6zCfieZYB8fmtdQE9BpFp94COoIJsUG1YQmSkeAe/0Mcg5I17gsklbHJ5w9R6Q
vi160PP7zFo32nsuv/tiYaLXgtRTFAuxQCSAbnveDFbRFTDBLNDxgRr4vEv6y3Pp
sWcPGYX0X5Od0re6LAmiaIlCuttCVrRQd68hZlAJckVKr5qDPAFcLeVN0IrNpZkQ
WoYLbOb68zDJm8zHuS5w5cJAmyJllNqh7w/+75yDepgBp2QG2fY9c84ZnSjmVqLw
SZQbhLkfW6wg6FfUYEEjSEoRhK3cRA==
=e60A
-----END PGP SIGNATURE-----

--Ntdr80yw2aStC9cx--
