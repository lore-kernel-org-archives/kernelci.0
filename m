Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABA413D171E
	for <kernelci@lists.linux.dev>; Tue, 21 Apr 2026 12:34:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776774887; cv=none; b=hu2+uBgr/5Us8PzXXJ9gecX0MuJqU0wOJReeghQsBrEHYfBAM04OhWOLeTx0uv7rNnTej+7UMz9vI5+4Qz94h+RhDW8h1VTTeOqhvQeLhWsSuzgRlZaZNv2htPMgPXtgl3dsv41bvU8Ydr+LQfPEzMJ+S1Ig1qvBexqWBiuf014=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776774887; c=relaxed/simple;
	bh=824n/Nmm/vvgC1c0b8HvTLPuh/YzdHgTuluvY+uv0c0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZYdmkVRGfFd2odsMokTlWT0VSRfmuhVYISgQ9nqWALw8VPNhek405klSBrutjQZ2n194cP1OuTli188AV46y+i+ZEBdQfooK8Yjla58z3etDwDz6kIMjE++MtPhBkIN7l5Ge5q9NOmRNW6BimT6TymFI6VDrhJVFWvHgtGwyf+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OMl9CVq8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OMl9CVq8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA11DC2BCB0;
	Tue, 21 Apr 2026 12:34:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776774887;
	bh=824n/Nmm/vvgC1c0b8HvTLPuh/YzdHgTuluvY+uv0c0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OMl9CVq8zpCyWB48gFktKfFq9wji73AiT5piJGeqjxAuu+N2J0uaerfId/UDdQPtX
	 tHsadQrMY8itqEEk1XoHRfzc3ouMNm/be9K+pyQSEn0Q4KgJyuHqDLy1g5GpEYJmcN
	 lE0aynStZ/EuaY6N7mjIyOw6ziq9cJMk8RYRrUgJCL+FIpARmhUuoFy4vMrkvgXsya
	 u8LJMVOwvedIlsSXRsyVU6tV4Z4M+F4bCEflJOD8gM2K4Fmm1U54mF1wSU0m2yt97W
	 kwMOkitb21peeu/nirNqwvPQYcMQh+Y+xDI/f1kWC1BwjEq2pLS1CnULR1U8Zt+uJ/
	 +DW+eyAZDfmkQ==
Date: Tue, 21 Apr 2026 13:34:43 +0100
From: Mark Brown <broonie@kernel.org>
To: Eric Biggers <ebiggers@kernel.org>
Cc: kernelci@lists.linux.dev
Subject: Re: Enabling additional KUnit tests in KernelCI?
Message-ID: <4e0fa31c-81f2-4890-a9b8-df86d243f139@sirena.org.uk>
References: <20260307075546.GA19654@sol>
 <d2c55e92-5210-4d12-86f4-a24b64ab0fb9@sirena.org.uk>
 <20260312215145.GA4805@quark>
 <3da07ee3-f3e4-49b1-bcf4-fe9c55eaeb41@sirena.org.uk>
 <20260313010456.GA1458907@google.com>
 <4fd302e0-ffa7-4bbf-a94a-c8879fde32f4@sirena.org.uk>
 <20260419005019.GA18115@quark>
 <a78d492c-028e-4f56-a0f8-0e3d28daf84a@sirena.org.uk>
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="X/aB4G1NsbcLS9WD"
Content-Disposition: inline
In-Reply-To: <a78d492c-028e-4f56-a0f8-0e3d28daf84a@sirena.org.uk>
X-Cookie: Jenkinson's Law:


--X/aB4G1NsbcLS9WD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Apr 20, 2026 at 03:16:54PM +0100, Mark Brown wrote:
> On Sat, Apr 18, 2026 at 05:50:19PM -0700, Eric Biggers wrote:

> > It looks like the kunit job on KernelCI is still running only on the 6.1
> > kernel.  Will it be enabled on newer kernels?

> Huh.  That's weird and not intentional, looking at the config I can't
> see why it's happening.  Thanks for spotting this, I've filed an issue:

>    https://github.com/kernelci/kernelci-pipeline/issues/1466

> so it doesn't get lost, hopefully it'll be something obvious but it's
> not obvious enough for me right now :/ .

This should be sorting itself now - Denys realised that the results were
getting produced but stuck in processing, it's one of the biggest suites
which triggered some infrastructure problems.  I'm seeing results
appearing for mainline and -next now, hopefully everything else should
start populating as well.

--X/aB4G1NsbcLS9WD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnnbuMACgkQJNaLcl1U
h9ASjwf/duRfx8wYM/2W3C8NuO2kKtd2g0ptHW8X9AnUTRQVe63bytJeRk3JL/fd
NCoOKSfk22P18CLNNEpKY9NwhPgL7lHo4bUXRTXCfDI93+Ice99VLRDhk6gcjXa2
OT/uqcZ2DJ7Ko6Vo+f2dQBnjAqUzgrLDqC7S1i0FgUKHpBpt3HgJw7W+nbT5/X7W
4HXrDfsPC8J8Y43hCcZuNqoJf6RI82BQYnN0DcJ+W19Dza14WMqZ/Q3Zy6JcqVp8
34GPQgGCapotQalVYqEblikChzD4YlqGff70bUmTC+J4P60KGr6NmaMNa77yycwW
2BdvF38mqqguF1MwsHT5shZwjcQbQQ==
=GR6s
-----END PGP SIGNATURE-----

--X/aB4G1NsbcLS9WD--
