Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 041BC317142
	for <kernelci@lists.linux.dev>; Thu, 12 Mar 2026 21:51:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773352308; cv=none; b=XdxN3Wjg00jkb7HqO5d5/asEtgkXfeGY7TLtQnsKDha//HM065FYoCE8LpCWsqOQqw5FH2CW4cOZgB9uQD9yocyC3diymKoTslYDpJKHoxeD8u8+6ZA7/4UfLSe1TWu4B7d6yTS7f1TKQXeEPj+egEPhyiEQOLDQRptqDGu3/ME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773352308; c=relaxed/simple;
	bh=tRiNAGpup7K2RNag0rBvmPhQLnOw47lMmluX3l6SdGg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CUW9ZP1SyhuMdkrtflbCxVCdPNLjquXG6ps3P6PGV9Y1VaEWVMuLcwBlg14VnW0V2de96Vkj9sTpK8zr30D/eOowx9YrYU/VExshOihmxkaZKo5NmxC5YxRCRgLdOBsuVhM0dsalWoIoAxu8l5CAhzGuMlWyB2Q0o6m0DWZiOWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tTASJUKo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tTASJUKo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43E6DC19425;
	Thu, 12 Mar 2026 21:51:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773352307;
	bh=tRiNAGpup7K2RNag0rBvmPhQLnOw47lMmluX3l6SdGg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tTASJUKo/8P5Qm6CCZrxoT4Ue8N04PppXe99PzZdMpJ47y8hnNQrVd2KaJkYy3Pg7
	 zZniOrd1VyG+qIPgy8Ry5DpInpCRqBYYyDT6Eh7K9LxNL3BRp9d98bdWOpZ4/4u8O4
	 2VfKsHtfhEw/OC8OvYPtX2cBiP6gvH95lqV5a7aoyNT8nDpeq45gbz2Qt186Q/mmHV
	 hAHyGkEI1TmvLwXtKVV/MmBHsC7dzjrLNvZAKWR8ODl7xx7p6yFateoaB/0kkQxO0F
	 w1kH+95j0q/yJQyFh7t/E08IkeDQa2D+swGedpzbD+VWuwOE3EwNqRkBgiDBiC5p6W
	 Co7PuobUnmTfg==
Date: Thu, 12 Mar 2026 14:51:45 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: kernelci@lists.linux.dev
Subject: Re: Enabling additional KUnit tests in KernelCI?
Message-ID: <20260312215145.GA4805@quark>
References: <20260307075546.GA19654@sol>
 <d2c55e92-5210-4d12-86f4-a24b64ab0fb9@sirena.org.uk>
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d2c55e92-5210-4d12-86f4-a24b64ab0fb9@sirena.org.uk>

On Thu, Mar 12, 2026 at 08:21:26PM +0000, Mark Brown wrote:
> On Fri, Mar 06, 2026 at 11:55:46PM -0800, Eric Biggers wrote:
> 
> > I would like the KUnit tests in lib/crypto/tests/ and lib/crc/tests/ to
> > run in KernelCI and have any failures reported to
> > linux-crypto@vger.kernel.org.  Preferably on all platforms, not just
> > UML, since UML doesn't cover all the code.  Is there a way to do this?
> > What is the status of KUnit in KernelCI?  I'm having a hard time finding
> > information about this, and looking at the latest mainline test results
> > (https://dashboard.kernelci.org/tree/mainline/master/4ae12d8bd9a830799db335ee661d6cbc6597f838?p=t)
> > there seem to be no KUnit tests running at all.
> 
> We should be running KUnit tests:
> 
>   https://github.com/kernelci/kernelci-pipeline/blob/a3b622cfee641e26bed1906b29ed7065bee45921/config/jobs.yaml#L2153
> 
>   https://github.com/kernelci/kernelci-pipeline/blob/a3b622cfee641e26bed1906b29ed7065bee45921/config/scheduler.yaml#L1750

Which ones?  Does anything need to be done to add new tests to the list?

Note that even if "all" tests are being run (via
CONFIG_KUNIT_ALL_TESTS=y), that includes only the tests whose
dependencies are met.  There can be additional kconfig dependencies.

> though like you say something seems to be going AWOL with at least the
> reporting, I can't see any results either.  The job that's configured
> there is to run on x86_64 rather than UML so is probably what you're
> looking for in terms of the tests?

The kernel has optimized crypto and/or CRC code for the following
architectures: arm, arm64, mips, powerpc, riscv, s390, sparc, x86.  In
many cases there's also a finer division based on CPU features.

So I'm looking for testing on as many platforms as possible.  But some
x86_64 platform is a good start, certainly better than nothing.

- Eric

