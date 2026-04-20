Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6BE83A6B79
	for <kernelci@lists.linux.dev>; Mon, 20 Apr 2026 14:16:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776694617; cv=none; b=laN81MK+z3w2dKVbAFJhYcIjmT/QPmQPuixea0S3oIf1aI2/XuhnphejjG9pEc6CZgXSHEPXVcYA6WbGOXKxVkFNIHzMSpavirOUto6VP8eLBIz1DQjQMYiVECvOx1eZWKIZ/QedxCdqCzH7MCAhtj3RpqaRDcbtV8u9cJNIn4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776694617; c=relaxed/simple;
	bh=vUU7MKQQQSJcA788sVGwfRSe8ivtovzFKiDvHWxdVug=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=faWlQF0DV749GKDzvoOaTOY3aZejkq7TUeR0xdFFkobtAwHPLIT7H9d4uTVG21mPj7drJnK3C3+1OLS4yn7O3r3t2J9kyRmRGb6sMROiM42hlaB0rznASqoDnY2d5UtIYYBeBBfyzaWoi3kuaJRBKUsIgNp8QmW7qzh3a5LgNL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QgPS+65k; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QgPS+65k"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D46C0C19425;
	Mon, 20 Apr 2026 14:16:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776694617;
	bh=vUU7MKQQQSJcA788sVGwfRSe8ivtovzFKiDvHWxdVug=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QgPS+65kYTTXbLilm7wamHCN63c8Cz0qTzxeFOq3p5vhAf7Zvliz+5iWYgw0kXh2i
	 oc4EmS25PPpBQneMZtXm/0BBmdN0Mr6LA6VyPdS/0tu8Nuqg7Im9KPQtyCzJ/2ivPV
	 CUM9+x/QeuyXHPsnp2+hErC7VlM6LzgfN1QUIqUxcGZnoVygtdA7aNWI16f/oL41gJ
	 1AuZXD6E4B0LUMLIzi4RwYWrCJxChrbal9dEGcoUP0txzWQ8l0nJM5yu1MyENKbnnv
	 0o/kla6MxsnePfjKnIu6oZfX6p0O2jSUKUYgke9uB/xOxSfjwEHK1L3VO3ylQGqK0+
	 UygeA0bRYiPTA==
Date: Mon, 20 Apr 2026 15:16:54 +0100
From: Mark Brown <broonie@kernel.org>
To: Eric Biggers <ebiggers@kernel.org>
Cc: kernelci@lists.linux.dev
Subject: Re: Enabling additional KUnit tests in KernelCI?
Message-ID: <a78d492c-028e-4f56-a0f8-0e3d28daf84a@sirena.org.uk>
References: <20260307075546.GA19654@sol>
 <d2c55e92-5210-4d12-86f4-a24b64ab0fb9@sirena.org.uk>
 <20260312215145.GA4805@quark>
 <3da07ee3-f3e4-49b1-bcf4-fe9c55eaeb41@sirena.org.uk>
 <20260313010456.GA1458907@google.com>
 <4fd302e0-ffa7-4bbf-a94a-c8879fde32f4@sirena.org.uk>
 <20260419005019.GA18115@quark>
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="tHzURJ+kX0S1L5jq"
Content-Disposition: inline
In-Reply-To: <20260419005019.GA18115@quark>
X-Cookie: Sales tax applies.


--tHzURJ+kX0S1L5jq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Apr 18, 2026 at 05:50:19PM -0700, Eric Biggers wrote:
> On Fri, Mar 13, 2026 at 12:31:41PM +0000, Mark Brown wrote:

> > Right, and UML only works with an x86 host which is fun.  qemu is the
> > standard way of running for a specific architecture.

> Just to follow up on this, in mainline 'kunit.py run --alltests' now
> runs all the CRC and crypto library KUnit tests.

Excellent, that'll be being picked up as part of the -next merges.

> It looks like the kunit job on KernelCI is still running only on the 6.1
> kernel.  Will it be enabled on newer kernels?

Huh.  That's weird and not intentional, looking at the config I can't
see why it's happening.  Thanks for spotting this, I've filed an issue:

   https://github.com/kernelci/kernelci-pipeline/issues/1466

so it doesn't get lost, hopefully it'll be something obvious but it's
not obvious enough for me right now :/ .

--tHzURJ+kX0S1L5jq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnmNVUACgkQJNaLcl1U
h9D3mwf/UX5/soxk0FJZ3JO+d3YPv2h3F+JGYXHls3a1pL3Koy6puLBwpOAiBtVx
FUappPzLtaORhZ+Fk75Q82zXqIjQbAxybLXFOY5Ocsx5Ksni9Zj9l/JSllP8BG4B
VBwNwED/XCSP/15cOn10UVeJl6FuCQJ3jumcJ4B8DDSVjmBm/VWVe7BPFs6NJukk
VXoVYqtIuCJy5Lb75ts9HuGq2FF1JDK8JI8/TFF3/7dcNDtURiQVnXY/Em9d3Jyx
T//LSFYttHsXDt7SFdXwjVb8ZGV+n7wy3eXaATws3HaGhiTQ8FRBaoHqdmS560Aj
yzFdiSRp6Uvpah6g6f1UdzKcTnFe4A==
=GZck
-----END PGP SIGNATURE-----

--tHzURJ+kX0S1L5jq--
