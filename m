Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3CA4397683
	for <kernelci@lists.linux.dev>; Thu, 12 Mar 2026 23:34:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773358495; cv=none; b=JLMc5OptzATdwUzji/vQCEyVZpPkokz8jdNCrmsdopV9hZsfvUT5Y1028OMS+7kTVEHrCAyKEyTKnjpDrTy2xPS6OnJgZeNBUwRXEZuWfpFTkhfMgfSUB7E7s/ApfNX1Zi1vcSgdwtaYtqBmIssVswKK9v7vtE0NH0BlAvBMnO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773358495; c=relaxed/simple;
	bh=NsBLYSs10MAdUB4LXMyYdshfOlD/M5aL9UCFikaZth4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=idQktGWX3M0+3XGfz9u4DZR/89ghQv0ZdZ5dKUU0FFm+StNOBDqEL5uh9ChdkJ7CExhLmQphXJ9Q//ULlReiV/iLXt+Ke6AxTx7YJWkJIM6RNKywZWAkLXMYdWadGk5YPEzeN9MspoItUuLF2EQPMMMBnIO2LVCv25ebUZnoVFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bcwgL+i+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bcwgL+i+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3A93C4CEF7;
	Thu, 12 Mar 2026 23:34:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773358495;
	bh=NsBLYSs10MAdUB4LXMyYdshfOlD/M5aL9UCFikaZth4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bcwgL+i+g+E0hrY9DJZTs6rb+gfvpjax5ZZjJmx1Pl7ULjtDA1+P+vSEzOE8OSqPv
	 xV7tSygKu9RhJTVB/kYiYvdNVJsXuPUqxCuEh/kdQBoiJHfue3m3WnGWUOvIl7WfPS
	 LOjQ/a+D0nYFY4dAEPY5AK2VfVBq+XVKV2YoqxTM+4FNhy2XO0ABlPIJglSzV5o1f+
	 6JhdBP9VV1uZ2Opy5iIHYeg0RuGYTS5LKMb7Ns1KCHqGjE382QcJkEmLQ/2sZR0GQg
	 ECof+6Ro3s5qiF0RpPGzE71JliM2KiVnk0+RPEb2csVVAoAfZHHra2A1lzeHR8WpAE
	 te8mPyPAxiOlw==
Date: Thu, 12 Mar 2026 23:34:51 +0000
From: Mark Brown <broonie@kernel.org>
To: Eric Biggers <ebiggers@kernel.org>
Cc: kernelci@lists.linux.dev
Subject: Re: Enabling additional KUnit tests in KernelCI?
Message-ID: <3da07ee3-f3e4-49b1-bcf4-fe9c55eaeb41@sirena.org.uk>
References: <20260307075546.GA19654@sol>
 <d2c55e92-5210-4d12-86f4-a24b64ab0fb9@sirena.org.uk>
 <20260312215145.GA4805@quark>
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="RfluQZs15kmIELpL"
Content-Disposition: inline
In-Reply-To: <20260312215145.GA4805@quark>
X-Cookie: I feel better about world problems now!


--RfluQZs15kmIELpL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Mar 12, 2026 at 02:51:45PM -0700, Eric Biggers wrote:
> On Thu, Mar 12, 2026 at 08:21:26PM +0000, Mark Brown wrote:

> > We should be running KUnit tests:

> >   https://github.com/kernelci/kernelci-pipeline/blob/a3b622cfee641e26bed1906b29ed7065bee45921/config/jobs.yaml#L2153

> >   https://github.com/kernelci/kernelci-pipeline/blob/a3b622cfee641e26bed1906b29ed7065bee45921/config/scheduler.yaml#L1750

> Which ones?  Does anything need to be done to add new tests to the list?

> Note that even if "all" tests are being run (via
> CONFIG_KUNIT_ALL_TESTS=y), that includes only the tests whose
> dependencies are met.  There can be additional kconfig dependencies.

Whatever is enabled by the KUnit runner tools/testing/kunit/kunit.py
(which makes x86_64 a bit of an unfortunate choice given how slim theilr
defconfig is).  The theory is that the KUnit configs will do the right
thing, it looks like we're not currently pasing --alltests though which
we should - I'll look at a patch for that tomorrow.  If you need arch
specific options that aren't enabled by the platform's defconfig that
gets a bit awkward.

> > though like you say something seems to be going AWOL with at least the
> > reporting, I can't see any results either.  The job that's configured
> > there is to run on x86_64 rather than UML so is probably what you're
> > looking for in terms of the tests?

> The kernel has optimized crypto and/or CRC code for the following
> architectures: arm, arm64, mips, powerpc, riscv, s390, sparc, x86.  In
> many cases there's also a finer division based on CPU features.

> So I'm looking for testing on as many platforms as possible.  But some
> x86_64 platform is a good start, certainly better than nothing.

The KUnit runner uses qemu as standard which I guess is probably fine
for an initial pass, we would need to do a bunch more plumbing to run on
actual hardware and pull the results out.  We'd also be restricted by
what's available to us, at the minute we've got arm, arm64, riscv and
x86 systems with a bit of an embedded focus.

--RfluQZs15kmIELpL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmzTZsACgkQJNaLcl1U
h9CH9Qf8CSlZcjTsoAFDzuGgeeqydONo6hEw/xauyBIen59zvdpibNC+kLbPfMMW
qYmEbcrR5mcjlDsevw3euteI2aa7TrmQ+X/4CaspUQZA7OS6dZKmoYGZJEzgMpTF
fKmVhlKHzMPDZwDBB4mWhhU+5JK4wxl1piMh8msNRX5g29Mm8g9cinOlJZ0mJ0qt
gXliC0ef/AMXYxSvBtgrS/jez4PKXyFNNiSywEvCyVfu6nm4ZM+vwkpKPt8Ch+3K
qwbSgEh34UeWmSEXijaOeUEl2wXn9uRbqTbg1g59qFPDJnjt9hCrP9BQTu5uXi4C
GvrAmB0Q0kvdobGNLJ/LioFgmFHBGA==
=ZNCA
-----END PGP SIGNATURE-----

--RfluQZs15kmIELpL--
