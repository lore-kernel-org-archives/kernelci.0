Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9D5E23A98E
	for <kernelci@lists.linux.dev>; Thu,  4 Sep 2025 15:47:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757000826; cv=none; b=a8lLVQB/O8D/3o1Z3Rg8SMoBp880wOHu3L8D0PZHukLq57G7y2kCd/UBW6hevwd4sIJQZN19B/7FPke3df+OinYCEf18kLe9z9S85EYXR1J+lfVxoj7uOYRv0D/ASNDxuHjZUaH1z0L5M58MOaK4jbX2GBfLsRPJD8ogZMGq2S8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757000826; c=relaxed/simple;
	bh=IB8IyMq40cLwBp1EH9c03h2zIRTRK63nzembICYKkBk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U+XJj+HShJwQS/sOa//VLlsZiaMHoq6cDyd5GwTIycm3URFxhzXYht3a1aDNKv+UnAVlWTLI0Qar/5hGnL6hjYGGxBJe+nsBCOtZx7Y7SYnrz0jTnZPdSaZSqW50aIcflP8NwEDLhasltp2qH23u31lfJs4SL0qExi6DB4wXRgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KXWa61Of; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KXWa61Of"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74987C4CEF0;
	Thu,  4 Sep 2025 15:47:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757000825;
	bh=IB8IyMq40cLwBp1EH9c03h2zIRTRK63nzembICYKkBk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KXWa61OfajaOBT59Io0nEW7MkgCjLvheMfq8KyYr6KuEnsFzeU80eXLaB8tG4AUuA
	 lmKe8Lz6Qrj6LtdM2L1t4E+fNHnZhpskwNrc+C2IrlgfVVA9O3ftTHTFVmIYb1EXUE
	 PS4io7AI9Bas7MJLQigJHAAZcl9ZLwMKFAnZn1wYHT5A97M5f735hlthlP3APCd8/h
	 lrxD6KZsP/QFasahyQTTlkWK289+Owy7d4dqW225N2UREhzdIX2OSMG5T3WuHag/uJ
	 ZUo0bn/lseimKDHmPFDgwnp2q81EYyCwEe2gB8IKoo8bZvQ9Zmc22KnWKCAdEEvRiK
	 mkaNBseSNyM2Q==
Date: Thu, 4 Sep 2025 16:47:01 +0100
From: Mark Brown <broonie@kernel.org>
To: Donald Zickus <dzickus@redhat.com>
Cc: kernelci <kernelci@lists.linux.dev>,
	Gustavo Padovan <gustavo.padovan@collabora.com>,
	mwaqar <mwaqar@linuxfoundation.org>
Subject: Re: KernelCI TSC nomination request
Message-ID: <21a6bc14-e242-4402-8018-ebe6428e0430@sirena.org.uk>
References: <CAK18DXZFCrvj-QK=45xVSkt+EJ6FSSPsxPxoeRBXPdDRySup9A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="yIgMXo8JM+ra5wQo"
Content-Disposition: inline
In-Reply-To: <CAK18DXZFCrvj-QK=45xVSkt+EJ6FSSPsxPxoeRBXPdDRySup9A@mail.gmail.com>
X-Cookie: No lifeguard on duty.


--yIgMXo8JM+ra5wQo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Sep 02, 2025 at 03:24:13PM -0400, Donald Zickus wrote:

> If you would like to nominate yourself for a committee position on the
> TSC, please reply to this email with your nomination request.

I'd like to nominate myself (thanks for the reminder Greg!).

--yIgMXo8JM+ra5wQo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmi5tHQACgkQJNaLcl1U
h9DfRgf/Yw2+0tg/026YOfw5glh/Y2Vu0/0ywZLXaH7PHusU1mSnX6aOUd9qKf2/
liHp4j/S4AZMNjP/wAM21xXkNwNDMGUB+3772KLKL+rIgXSkK79P1WKuOVjiiWoH
pvLofj7wgymVElTOQJxfUq3QXSl4CB3cdTI3aoPDEq1Ix1WVAFUwx8zI+9vMpVP9
YNLuEayJPXTVq16GLgYmwUsR1gpULoPUE7do/hEQHVrWSGGCUCGCy+GLYwqj+90u
BqEcEAywgEoq5fR83j0PwNUSl1R/5HfgxIdFpOu0CZjStIG0nh+L+4MiBmzYx68Y
t2K4wXadmEO3vdKVQo0xGlN0tocI+w==
=L49v
-----END PGP SIGNATURE-----

--yIgMXo8JM+ra5wQo--
