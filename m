Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E364D2DF68
	for <kernelci@lists.linux.dev>; Sun, 19 Apr 2026 00:50:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776559822; cv=none; b=cXpzuHHtRAbjE9jhCymP6vjhoXu96yEtpjlog47bfChLBNUUlzSCkU2k5LppZvm++br9GS7lufJin1dPpXBqn8BeAwk4zdo1S3Rlo2BYukuUvAjvM2hk7OpHv0IgEwYJ4mNm8Tqu6HiHkDwv6ooffZGGf+NnnpOl/PobdPA7nXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776559822; c=relaxed/simple;
	bh=GnjBkyQXPQuAvZh/pdbLk5HIXkNySsKPF6x7BCpB6tg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l6BYcB1pknN7z6vufTwijnH14yoQx/4BFqi2QGV/HxRUfm6wTHIbT9zoRe+sqyvaUu9coSavhOC3Y51cv/Yw6gDxBPVMcY32a61DqczN5+7540hddDgvwM9dMYm+c0Qxb/NizsyapxgEzwjhN2DTEYfOT0jurCG5281P1fMHZTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GB/5F53B; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GB/5F53B"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 601D3C19424;
	Sun, 19 Apr 2026 00:50:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776559821;
	bh=GnjBkyQXPQuAvZh/pdbLk5HIXkNySsKPF6x7BCpB6tg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GB/5F53BlTeD0e51/T0lGm7LFCZvlK5/gI/TOxxy48doJBt3Syk2KUwUxnIhpcgWH
	 TRrIjePv7BUdMrUeqins5oua8O9VbRlpW40C7sreTBNbyj1mQFHHGdu7QngSEYk12M
	 sGuO/z/xsucdBwoGeWejCDX/vuS95psJuXos7BLrwwJATRqeGirlWhm6t4w/eqig/r
	 QGZPOdF7KbtVq8eA6f5W5ec1ZcBef2GgYmPLSlu9QGGzzwzE/vZc1aNEuHaRxILxsa
	 CpkaI6N4NT5ENQTEEhQHA3cp5LqbVEPUJ7EnumpAQ0XF4HFv3rpBZR2WbvWiqpA0pN
	 wnRonVh62nnYg==
Date: Sat, 18 Apr 2026 17:50:19 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: kernelci@lists.linux.dev
Subject: Re: Enabling additional KUnit tests in KernelCI?
Message-ID: <20260419005019.GA18115@quark>
References: <20260307075546.GA19654@sol>
 <d2c55e92-5210-4d12-86f4-a24b64ab0fb9@sirena.org.uk>
 <20260312215145.GA4805@quark>
 <3da07ee3-f3e4-49b1-bcf4-fe9c55eaeb41@sirena.org.uk>
 <20260313010456.GA1458907@google.com>
 <4fd302e0-ffa7-4bbf-a94a-c8879fde32f4@sirena.org.uk>
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4fd302e0-ffa7-4bbf-a94a-c8879fde32f4@sirena.org.uk>

On Fri, Mar 13, 2026 at 12:31:41PM +0000, Mark Brown wrote:
> On Fri, Mar 13, 2026 at 01:04:56AM +0000, Eric Biggers wrote:
> > On Thu, Mar 12, 2026 at 11:34:51PM +0000, Mark Brown wrote:
> 
> > > Whatever is enabled by the KUnit runner tools/testing/kunit/kunit.py
> > > (which makes x86_64 a bit of an unfortunate choice given how slim theilr
> > > defconfig is).  The theory is that the KUnit configs will do the right
> 
> > Yes, the tests run by kunit.py depend on the args passed to it.  It
> > looks like without any arguments it runs all tests available with
> > defconfig + tools/testing/kunit/configs/default.config.  With
> > --alltests, it runs all tests available with defconfig +
> > tools/testing/kunit/configs/all_tests.config.  Both set
> > "CONFIG_KUNIT_ALL_TESTS=y", so the difference is just what additional
> > options get enabled to fulfill the test dependencies.  all_tests.config
> > enables more dependencies than default.config.
> 
> Yes, exactly.
> 
> > So I think KernelCI should start passing --alltests to kunit.py, and I
> > should get the dependencies for all the crypto and CRC tests added to
> > tools/testing/kunit/configs/all_tests.config.  Then KernelCI would pick
> > them up automatically.
> 
> That sounds like a plan.
> 
> > > The KUnit runner uses qemu as standard which I guess is probably fine
> > > for an initial pass, we would need to do a bunch more plumbing to run on
> > > actual hardware and pull the results out.  We'd also be restricted by
> > > what's available to us, at the minute we've got arm, arm64, riscv and
> > > x86 systems with a bit of an embedded focus.
> 
> > It seems kunit.py uses UML by default, though it accepts an --arch
> > argument which enables QEMU.  So something to think about for KernelCI
> > would be to run all KUnit tests with different combinations of --arch.
> 
> Right, and UML only works with an x86 host which is fun.  qemu is the
> standard way of running for a specific architecture.

Just to follow up on this, in mainline 'kunit.py run --alltests' now
runs all the CRC and crypto library KUnit tests.

It looks like the kunit job on KernelCI is still running only on the 6.1
kernel.  Will it be enabled on newer kernels?

- Eric
