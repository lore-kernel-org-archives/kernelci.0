Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 311F61A3029
	for <kernelci@lists.linux.dev>; Fri, 13 Mar 2026 01:04:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773363898; cv=none; b=C63RuR9t3MNlluTpCzX6R3QGTflFiF2+nIHndvP74yr+mu1uKD95Ax6bcLSWUDfVqJpBclkbsz4gr8BqLocEO13ubW3DsgOQBTJzyNicSERUyDiggFNrHdnkZarxRCCGoh7HcUyOMx3EXgAQb3w14/tC84GfoXGtXde8CQMW/2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773363898; c=relaxed/simple;
	bh=v3Y6Bg28uRdnNdlK6B8EUo02WUvhlNoRCl+4Fqlwq3I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jMHeACErmlt0RJDvTQCGIUaZHEyvUX/zfoe+u+gBXURl/lKfpWyK/DNd58A1qYQP/jsVWCCFXMFe4YF4o7If5SXJzNZWcvC7M2Gp7YGQL7j6EKcFx3Bf6lGVuIirqGoPRh/KobIsg9d7QLcokpJdqDRtYm0FxC1AKw/DApkst0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ofYaAXdp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ofYaAXdp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9901C4CEF7;
	Fri, 13 Mar 2026 01:04:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773363897;
	bh=v3Y6Bg28uRdnNdlK6B8EUo02WUvhlNoRCl+4Fqlwq3I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ofYaAXdpIsCkmgV6r+cKCNEH4UjtOhQ1VhbJrpoRvaoFz7YebylSF2vtPhq3V+R11
	 JRfEjdBWFiMoJntrSrNGb0Kjxy1Sd6cwwOZ8EtOTnfRiHhTQVPmqjb4yilYbHe8+WE
	 tdmoSJ1jWM0hl5SSaQ8iGjID/G+mIZTO2fVZlIBxHSodRf1t0LGtUmHagx/VLIY0TG
	 W1dyikDL4KgdGNmE5uiMz0mkhWsbgteB/HZZpz+TUTwed8uZBInEAEEaliI9x12Hko
	 OML1Z+mXtFiDhXwxSJ4pJ5hm28kgivPRNRMkK49Dz9Iv8kyQ36CuwA8c75KLq9A9QB
	 Z91i0gaOCcR6A==
Date: Fri, 13 Mar 2026 01:04:56 +0000
From: Eric Biggers <ebiggers@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: kernelci@lists.linux.dev
Subject: Re: Enabling additional KUnit tests in KernelCI?
Message-ID: <20260313010456.GA1458907@google.com>
References: <20260307075546.GA19654@sol>
 <d2c55e92-5210-4d12-86f4-a24b64ab0fb9@sirena.org.uk>
 <20260312215145.GA4805@quark>
 <3da07ee3-f3e4-49b1-bcf4-fe9c55eaeb41@sirena.org.uk>
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3da07ee3-f3e4-49b1-bcf4-fe9c55eaeb41@sirena.org.uk>

On Thu, Mar 12, 2026 at 11:34:51PM +0000, Mark Brown wrote:
> On Thu, Mar 12, 2026 at 02:51:45PM -0700, Eric Biggers wrote:
> > On Thu, Mar 12, 2026 at 08:21:26PM +0000, Mark Brown wrote:
> 
> > > We should be running KUnit tests:
> 
> > >   https://github.com/kernelci/kernelci-pipeline/blob/a3b622cfee641e26bed1906b29ed7065bee45921/config/jobs.yaml#L2153
> 
> > >   https://github.com/kernelci/kernelci-pipeline/blob/a3b622cfee641e26bed1906b29ed7065bee45921/config/scheduler.yaml#L1750
> 
> > Which ones?  Does anything need to be done to add new tests to the list?
> 
> > Note that even if "all" tests are being run (via
> > CONFIG_KUNIT_ALL_TESTS=y), that includes only the tests whose
> > dependencies are met.  There can be additional kconfig dependencies.
> 
> Whatever is enabled by the KUnit runner tools/testing/kunit/kunit.py
> (which makes x86_64 a bit of an unfortunate choice given how slim theilr
> defconfig is).  The theory is that the KUnit configs will do the right
> thing, it looks like we're not currently pasing --alltests though which
> we should - I'll look at a patch for that tomorrow.  If you need arch
> specific options that aren't enabled by the platform's defconfig that
> gets a bit awkward.

Yes, the tests run by kunit.py depend on the args passed to it.  It
looks like without any arguments it runs all tests available with
defconfig + tools/testing/kunit/configs/default.config.  With
--alltests, it runs all tests available with defconfig +
tools/testing/kunit/configs/all_tests.config.  Both set
"CONFIG_KUNIT_ALL_TESTS=y", so the difference is just what additional
options get enabled to fulfill the test dependencies.  all_tests.config
enables more dependencies than default.config.

So I think KernelCI should start passing --alltests to kunit.py, and I
should get the dependencies for all the crypto and CRC tests added to
tools/testing/kunit/configs/all_tests.config.  Then KernelCI would pick
them up automatically.

Same for any other kernel subsystem: it seems maintainers should get
their test dependencies added to all_tests.config.  (Unless those
options are arch-specific, as you mentioned.  The crypto and CRC options
are all generic though; just the implementations differ across arches.)

> > > though like you say something seems to be going AWOL with at least the
> > > reporting, I can't see any results either.  The job that's configured
> > > there is to run on x86_64 rather than UML so is probably what you're
> > > looking for in terms of the tests?
> 
> > The kernel has optimized crypto and/or CRC code for the following
> > architectures: arm, arm64, mips, powerpc, riscv, s390, sparc, x86.  In
> > many cases there's also a finer division based on CPU features.
> 
> > So I'm looking for testing on as many platforms as possible.  But some
> > x86_64 platform is a good start, certainly better than nothing.
> 
> The KUnit runner uses qemu as standard which I guess is probably fine
> for an initial pass, we would need to do a bunch more plumbing to run on
> actual hardware and pull the results out.  We'd also be restricted by
> what's available to us, at the minute we've got arm, arm64, riscv and
> x86 systems with a bit of an embedded focus.

It seems kunit.py uses UML by default, though it accepts an --arch
argument which enables QEMU.  So something to think about for KernelCI
would be to run all KUnit tests with different combinations of --arch.

Of course, running the tests natively on different hardware would be
even better, when such hardware is available.

- Eric
