Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A387B358D32
	for <kernelci@lists.linux.dev>; Fri, 31 Jul 2026 12:35:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785501317; cv=none; b=iIvbWgsXRy1zS4nyzk9eiu55tNFLj/UY4sEkUCm7Yw1I7IDSHYqYxyCe9uDpp6xgIIfkJup6M+errHNwlkizi/BoCl+i6nCcuf/SbRsd6hwf3fFxDYc1s4htv9C6hiiR1r5SlOGO80htg8TwKUPrCZ+wZuFitiZIX0wroPljQ6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785501317; c=relaxed/simple;
	bh=p065tevRirGq8ZueznueunPQVAs0uLH8aoGLgv8jsH0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FvoyqQRjjbgMHWkhPtJ6zi2Otix4ODanttdDosahojbfPR4qfeB1btjqylfLAvn7bEBykGXHz5SazYNAVWX4Igz3iZEJOnTt7hBtmNJIfhE1zkv8us3kuXLMtbKJxnbZ20T2gxXNL9G3cMoscdUG6N9fN3gHt/QdM9sLH/POnIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SwFx+ihp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SwFx+ihp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20BE41F000E9;
	Fri, 31 Jul 2026 12:35:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785501316;
	bh=CK5CP0yC+Stv2ifK/pW0OQdQI/mrSfshKYTPIV0hky4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=SwFx+ihpeUHWrtAAsuSB3yCcJ92BqzfjxAuQT1cSs1Imz4P930gzjNJqnbYNqCMdP
	 h6kVQLg/nixoVoMvkF40yg/Trshcoh9Fy7guBjnQ+EBzDSfqnOmMHaOZlr7Ab6OtbN
	 uQM7toyvR6Kc1LRnCdAsn5tfrQbMVtVEMhhumf7Pmv/jROBauRTb7aMus5sq++Hv5Z
	 9dvI8Jxkn+ScnxWVnJoWtr1RieH4NfdZ5tH7slpfXjw7wg3SXMhIAOdx0QwJywt/pD
	 AKX5yCaTa1VmCj2xSkESJEkABdq2ErtX+rEsW+WO2ULTNr4wNRLj84Y8eiuAKB/uFY
	 eoR0MzqmVDvxg==
Date: Fri, 31 Jul 2026 13:35:12 +0100
From: Will Deacon <will@kernel.org>
To: Alan Zanoni Peixinho <alan.peixinho@profusion.mobi>
Cc: Mark Brown <broonie@kernel.org>, kernelci@lists.linux.dev,
	catalin.marinas@arm.com
Subject: Re: Missing kernelci bot emails?
Message-ID: <amyWgI-SATPT3Kmz@google.com>
References: <ams_9JHxvOVUFX_W@willie-the-truck>
 <17901d7a-d6ac-4557-827f-b5fcc0af6f0f@sirena.org.uk>
 <CAKKBm2t15GgkDsYympwXuu-=TkU8NZc0Ej6kyDzrMXMaXEHRDQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAKKBm2t15GgkDsYympwXuu-=TkU8NZc0Ej6kyDzrMXMaXEHRDQ@mail.gmail.com>

Hi Alan,

On Thu, Jul 30, 2026 at 04:35:40PM -0300, Alan Zanoni Peixinho wrote:
> Apologies for the delay — I wanted to take a proper look at the
> notifications system first, since it's a part of the KernelCI
> Dashboard I hadn't explored in depth before.

No problem, thank you for looking into it.

> From local testing, the system appears to be working as intended. What
> I did find is that a summary email is only sent when two conditions
> are both met:
>     1. A recent checkout exists. The subscribed branch must have a
> checkout that started between 5 and 29 hours before the daily run. The
> 5-hour delay gives builds and tests time to finish reporting, and only
> the most recent checkout in that window is used.
>     2. At least one test changed state. Looking at the last 7 days, a
> test must show a regression (PASS to FAIL), a fix (FAIL to PASS), or
> unstable behaviour (flapping, or inconclusive results such as ERROR or
> SKIP). If everything is stable, the report is skipped.
> 
> Debugging against
> https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git, all
> the tests I can see in the current window are passing with no state
> changes, which is why the notification is being
>   skipped. Does that match your expectation — that there simply
> haven't been any status changes recently?

Ah, that would expain it then, thanks. If possible, I would actually
like to receive an email even if the status hasn't changed but the HEAD
commit of the tested branch _has_ changed since last time. That way, I
know that the tests have run without having to poll the dashboard. Is
that possible with the current system?

> There is also a flag to send the summary every day (when we have
> builds) regardless of whether anything changed on test status — we
> already use it for the mainline tree. If you'd prefer that for arm64,
> I'm happy to enable it.

That's a bit noisy; it would be more helpful to have one email each time
I push to the branch.

Cheers,

Will
