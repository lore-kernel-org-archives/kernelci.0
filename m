Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 377CE35F8A6
	for <kernelci@lists.linux.dev>; Thu,  5 Feb 2026 14:22:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770301329; cv=none; b=MXCsHM06DclSvK+eHU3B7iezQ8NjuCJZm3LiyRbWl/muMZW2Ri8o4Z498Bma8+PoTPV3+fOix+pvjrylnYl/otyXzCRfbofqlVyV9TZR9qdOQvxZiWgyE7mjrwI8vO5/X3MV3Ws0fpcqZ/Dp7H0RIcuwYxDloIu+knqs9X+Yqr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770301329; c=relaxed/simple;
	bh=QpSqZL/DTMJ4gp5sgjIyH+8zARSjWsDHZLwFlNVh6QQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s53N2j9q/rEVfWbUayfCx5wVa4m3r8of600L6yADvCe5GONCJ6zMp+sN0YBcqkvSU6phjjaUptzA3HfXIe1xQtCCNx9HwO52qmnFjgX635c9TWIrCcW0U3xRQxpq07O/35IZ/+DL+QOwkyt2xT2uWWTu8pPBYlqhDOsVQqsl4sM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=sC4JMZH1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="sC4JMZH1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 439F3C19425;
	Thu,  5 Feb 2026 14:22:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1770301328;
	bh=QpSqZL/DTMJ4gp5sgjIyH+8zARSjWsDHZLwFlNVh6QQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sC4JMZH144to/KtsxM4B1LVbfh0u1TSVRIy2qTklXkvp6aDq/MBSKX+5q8mblSJdn
	 ANek3Mqq6ZmtjI4kdJZjRtYrBxDAp3z/SHOczHjF7kj5KX3TBXVNEj0tbmXpBIv3P8
	 uPZiwNEVMozyugG0AjcVmATXiy/ze8IeI1rGwTYQ=
Date: Thu, 5 Feb 2026 15:22:05 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Jenny Qu <jenny@pebblebed.com>
Cc: kernelci@lists.linux.dev
Subject: Re: Talk proposal: What 125K kernel bugs tell us about testing gaps
Message-ID: <2026020530-cilantro-resisting-c65e@gregkh>
References: <CAPBP3tRAnaV=NmTZ_yFK+w3GtfTTXtZ3XtpyK+AzvfnCHb8AxQ@mail.gmail.com>
 <2026020513-smoking-pureness-b6a0@gregkh>
 <CAPBP3tTV6CCB5-wmFhWKkyKJ1Cpj0EkmOH73By-zkOKDW8vYtQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPBP3tTV6CCB5-wmFhWKkyKJ1Cpj0EkmOH73By-zkOKDW8vYtQ@mail.gmail.com>

On Thu, Feb 05, 2026 at 12:58:20AM -0800, Jenny Qu wrote:
> [resending to list - accidentally replied off-list]
> 
> On Wed, Feb 04, 2026 at 11:00:00PM, Greg KH wrote:
> > I hate to say "your ai model could be replaced with a sql statement"
> 
> Fair point on the descriptive statistics. I should have been clearer:
> the 125K bug analysis was training data, not the contribution. verhaal
> and the LWN employer reports (Jonathan Corbet's per-release stats
> using the gitdm database) already cover the descriptive side well.
> 
> The part SQL can't do is the predictive model. VulnBERT takes a raw
> git diff *before merge* and predicts whether it introduces a
> vulnerability. The evaluation is a strict temporal holdout: trained
> on commits with Fixes: tags from <=2023, tested on 2024 commits that
> later received Fixes: tags. 92% recall, 1.2% FPR on that split.

Cool!  So you have re-implemented Sasha's AUTOSEL bot? :)

Note, there are papers and presentations about how that works for the
past 10 years, you might want to look into that as it seems that your
models are the same here (prediction as to what type of commit is a
fix).

> To be direct about limitations: those numbers are on historical data
> where we know ground truth. The model catches patterns it's seen
> before (unbalanced refcounts, missing NULL checks, lock/unlock
> mismatches). It will miss novel bug classes it hasn't been trained on.
> It's a triage tool and not yet an oracle.

That's fine, we need that.  And if you have a pattern that it matches,
let's add it to our coccinelle ruleset so that it does not come back in!

> And it's not ready for production use yet. I'm reworking the
> architecture. The current approach uses CodeBERT embeddings with
> handcrafted features, and I think incorporating LLM reasoning traces
> over diffs will do substantially better. I don't want to hand anyone
> a tool that generates false confidence.

Look at the ebpf "AI" patch reviews that are happening on the mailing
list today already if you want an example of how this could work.  Try
running it on the output of the lore.kernel.org git repos (email is in
git format for others to work easily off of, including the tool 'lei').
Then if your tool catches problems, email them to the patch authors and
list to let them know!

That's the best thing we can do now, catch bugs before they are
committed.

> 1. Subsystem-level test prioritization. The lifetime gap between
>    CAN bus (4.2 years) and gpu/i915 (1.4 years) almost certainly
>    reflects testing coverage differences. i915 has dedicated
>    fuzzing infrastructure and active reviewers like Chris Wilson
>    and Ville Syrjala. KernelCI could use lifetime data as a signal
>    for where to invest in test enablement. This is actionable now,
>    no ML required.

Yes, that is directly due to fuzzing issues.  Fuzzers work on a "layer
by layer" basis, working deeper into the kernel and adding different
subsystems all the time.  That's why you will see "waves" of bugfixes
happening like this.  It's normal and to be expected.

> 2. Longer-term: commit-level risk scoring to allocate CI resources.
>    Flag high-risk commits for extra sanitizer runs, longer fuzzing
>    passes. Low-risk commits get the standard pipeline. But this
>    needs a model I trust enough to deploy, and I'm not there yet.

Again, look at what is already happening on these types of reviews and
perhaps plug your model into that as well and see what happens?  We're
always wanting more code review to help alleviate our most limited
resource, maintainers to review changes.

thanks!

greg k-h
