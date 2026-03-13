Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC578397699
	for <kernelci@lists.linux.dev>; Fri, 13 Mar 2026 12:31:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773405105; cv=none; b=UOFzMYzeg92v49dKSb/qEowRj6rILWcrxE1wocG51/eAqCzHJReo1gkqgTjiHIpX33ZeehhgEkkoLrMVpAWgFTFKv8bsdEzfwyOwc9E2wZjxWq4ZoMURF5Vg6f4WjlssuBcxw1k4bFDcF6nE3V/qCSBbefkMPl9Oi3KPt3ohZ+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773405105; c=relaxed/simple;
	bh=h8UNT2qehXv+2kRRDkK6RK3Zo8UUEY/5NLQvhc6rAYk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NXvzNfZOlP+pCqzrIFXJzwNeNoRpuvIjkgJQKWPelMzmnqUVQj0w8HOjvHwZbESlIz+r5mULptWm4Cn/VTd7kQytN+8qfOy3AXWHrTjp2eTfr0U/iG3OMx8m3SMyGPv+QPH4YO5CkSM84tunJUaEhRjsjhCk3rncvRLAf7lvzlk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LEJ4muRx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LEJ4muRx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3EE9C2BC86;
	Fri, 13 Mar 2026 12:31:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773405105;
	bh=h8UNT2qehXv+2kRRDkK6RK3Zo8UUEY/5NLQvhc6rAYk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LEJ4muRxMfPj51tSrqHbWSPuajtJIhsO8sm22QXRs1BGHqf+qc7vVqWZxPAo2jEdK
	 ECtnLdIf/ou+tiIZvoIyiZMuMsPClgu5iHBg3aKiFSZrm9a0rRiZccdZVeREJKsKtc
	 vTjNw4Hs6qp2/phDCf9Jc5t7D2cxqWfk5dAyl4L+gmeKl4UCgrPSNvchOUkIW1ZtQ8
	 5sTz9vphVdR/3FaKdcyMDD4gB+UExDRdG3FkZagxcc9b5Ia67pX97PIHJ/4nC2cAkQ
	 III4YInvyWVcfbVNPWbiTizixWlfrLvQs3jWJciXWiysTlFREQWwaStBs0cjFSVs25
	 xeADGtr2idHPg==
Date: Fri, 13 Mar 2026 12:31:41 +0000
From: Mark Brown <broonie@kernel.org>
To: Eric Biggers <ebiggers@kernel.org>
Cc: kernelci@lists.linux.dev
Subject: Re: Enabling additional KUnit tests in KernelCI?
Message-ID: <4fd302e0-ffa7-4bbf-a94a-c8879fde32f4@sirena.org.uk>
References: <20260307075546.GA19654@sol>
 <d2c55e92-5210-4d12-86f4-a24b64ab0fb9@sirena.org.uk>
 <20260312215145.GA4805@quark>
 <3da07ee3-f3e4-49b1-bcf4-fe9c55eaeb41@sirena.org.uk>
 <20260313010456.GA1458907@google.com>
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Po24HKR3YMAV6BWk"
Content-Disposition: inline
In-Reply-To: <20260313010456.GA1458907@google.com>
X-Cookie: Monitor not included.


--Po24HKR3YMAV6BWk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Mar 13, 2026 at 01:04:56AM +0000, Eric Biggers wrote:
> On Thu, Mar 12, 2026 at 11:34:51PM +0000, Mark Brown wrote:

> > Whatever is enabled by the KUnit runner tools/testing/kunit/kunit.py
> > (which makes x86_64 a bit of an unfortunate choice given how slim theilr
> > defconfig is).  The theory is that the KUnit configs will do the right

> Yes, the tests run by kunit.py depend on the args passed to it.  It
> looks like without any arguments it runs all tests available with
> defconfig + tools/testing/kunit/configs/default.config.  With
> --alltests, it runs all tests available with defconfig +
> tools/testing/kunit/configs/all_tests.config.  Both set
> "CONFIG_KUNIT_ALL_TESTS=y", so the difference is just what additional
> options get enabled to fulfill the test dependencies.  all_tests.config
> enables more dependencies than default.config.

Yes, exactly.

> So I think KernelCI should start passing --alltests to kunit.py, and I
> should get the dependencies for all the crypto and CRC tests added to
> tools/testing/kunit/configs/all_tests.config.  Then KernelCI would pick
> them up automatically.

That sounds like a plan.

> > The KUnit runner uses qemu as standard which I guess is probably fine
> > for an initial pass, we would need to do a bunch more plumbing to run on
> > actual hardware and pull the results out.  We'd also be restricted by
> > what's available to us, at the minute we've got arm, arm64, riscv and
> > x86 systems with a bit of an embedded focus.

> It seems kunit.py uses UML by default, though it accepts an --arch
> argument which enables QEMU.  So something to think about for KernelCI
> would be to run all KUnit tests with different combinations of --arch.

Right, and UML only works with an x86 host which is fun.  qemu is the
standard way of running for a specific architecture.

--Po24HKR3YMAV6BWk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmm0A6wACgkQJNaLcl1U
h9DwJAf8DxjIWGzC15EUwpndpzSTFqKA8BbVsCXFjejA/80M75l31xfbja/4aJku
SJZKk1CcFi7f9K19ywfwFNrg7UzGI/MrXPvL7qya9KXl90y58Rzl81l5/QgoqyRk
7NaA8JuietgYWvBmwlgrpKVLqkEdRut9Y+nbOwtkcJ995BEHGOsELK9nYH84eTkE
8yB9DLgZs8EGKj09hbRf1Athx2RFOxTet9xzwAC13joVMYbwZd0xIcjxtnia3NVw
bLCwE5Q27KVUqp8w50hL60T4EHUtLuyVOD5NJgU1O8nF0RcrsP9aL/0u4Y7bj4Ec
EjoaVS30tkBDp91D5vZhZbtIebE1LA==
=PDf4
-----END PGP SIGNATURE-----

--Po24HKR3YMAV6BWk--
