Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77608357A26
	for <kernelci@lists.linux.dev>; Thu,  5 Feb 2026 07:00:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770274806; cv=none; b=P3KvDw+sn0mAYywDHTlyXTjx3KG51PTUpgVi0Fupsc7jYplbeVU15Lpwwy93VmUGHR8Bml7gZtLyifBfiVdMEGAwYG+Va0pwR2aoaqMcqdThxYrPQi9ppUrHoS5OGDtiKt0xfdkhDdOFqjHhLBq49diyYqGvJ/PImMPjupT7FuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770274806; c=relaxed/simple;
	bh=yiO1DFO4AWoAgOES1WJl/E4ti7EcAahOLkRvnwjjz+Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b6e9pT9AGt1fMtXRxe32v+AIYsEITKrWR1AOtvL4rw/jVK3E1mFPdaJw8Cf6BNshEnyJvlb06hsJEIAFmQjITpjN90eqW0o6owpo2IFFZQSNNFCq8i1zHm5YeifnGwCp4HAZTnPcFxPIzl2B/lpdZYCtiHqvFTv+ucU2DDqqutA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=FWuNFpdt; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="FWuNFpdt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AED0EC19421;
	Thu,  5 Feb 2026 07:00:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1770274806;
	bh=yiO1DFO4AWoAgOES1WJl/E4ti7EcAahOLkRvnwjjz+Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FWuNFpdthQmiqrBLNwEk+vxs7XzeeV8D3RcQdh3o86S9EMKIxuWUOjqzHG458IG4j
	 ohh1QI7pwv7d5wcSUGYwhdxe153GCy5rDuwp5zKIhel4uIgVqLyrlO1CvtW5lHslaG
	 jk8UvRV2rhbmvLpNR9QUWBmMEb6v8TxwQKiCBiDM=
Date: Thu, 5 Feb 2026 08:00:02 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Jenny Qu <jenny@pebblebed.com>
Cc: kernelci@lists.linux.dev
Subject: Re: Talk proposal: What 125K kernel bugs tell us about testing gaps
Message-ID: <2026020513-smoking-pureness-b6a0@gregkh>
References: <CAPBP3tRAnaV=NmTZ_yFK+w3GtfTTXtZ3XtpyK+AzvfnCHb8AxQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPBP3tRAnaV=NmTZ_yFK+w3GtfTTXtZ3XtpyK+AzvfnCHb8AxQ@mail.gmail.com>

On Wed, Feb 04, 2026 at 06:49:57PM -0800, Jenny Qu wrote:
> Hi,
> 
> I'm a security researcher working on automated kernel vulnerability
> detection. I'd love to present at an upcoming Thursday call if there's
> interest.

Cool, but isn't this a better subject for a conference talk?

> I analyzed every Fixes: tag in the kernel's 20-year git history (125K
> bug-fix pairs) and built a model to catch vulnerabilities at commit
> time. Some findings that might be relevant to KernelCI's testing
> strategy:
> 
> - Security bugs hide for 2.1 years on average; race conditions persist 5.0 years
> - 117 "super-reviewers" (including Dan Carpenter, who invented the
> Fixes: tag) catch bugs 47% faster
> - Subsystems like CAN bus (4.2 years) and SCTP (4.0 years) have
> dramatically longer bug lifetimes than gpu/i915 (1.4 years)
> - Weekend commits are 8% less likely to introduce bugs, but take 45%
> longer to fix (review coverage effect)
> 
> The model (VulnBERT) achieves 92% recall at 1.2% false positive rate
> on held-out 2024 data. I'm also working on SmartKuang, an RL-based
> system that has reproduced CVE-2022-34918 autonomously.

I hate to say "your ai model could be replaced with a sql statement",
but really, we do have tools that show this today that give all of this
data in a sqlite database that people can use to mine for the same info.
It's what the kernel CVE team uses to track bug fixes over time for
their work:
	https://git.sr.ht/~gregkh/verhaal
and is part of the vulns.git repo on git.kernel.org

Also for the tracking of employer to people and who is doing the work,
see the reports on lwn.net for the past few decades that have been
documenting this.  The tool for that is also public (but part of the
database of employer mapping is not for obvious reasons, sorry).  I
think you undercounted people's employers a lot as you can not always
rely on email addresses to convey this.

Anyway, I liked your reports as I'm always interested in more people
mining our public data for stuff like this, it's great to see.  But with
regards to kernelci, how do you feel this information can help with our
project?  What would you like us to do based on what you have found
here?

thanks,

greg k-h
