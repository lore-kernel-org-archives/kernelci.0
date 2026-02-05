Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 099E636655E
	for <kernelci@lists.linux.dev>; Thu,  5 Feb 2026 08:58:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770281914; cv=pass; b=bZzwmbPRGgvGMRIkWCyj1BDQ/Q+OXHqo1NhCXoKM7Wo157TyzclrmVT0JmfHKuGIV6n29lriT7BgNMLKwtiQhGlT3fFFxSYKnl8kdUaykmXQpZe0CzaFjy9YJU6z0OAPbfYSB7of2nclq2FIIfU3Phpz9JDlP/kXWxELpccf7yo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770281914; c=relaxed/simple;
	bh=lHyWvuTF/oEW1DUg8CZxn1cuRRMqx6m518nJkJWsOvQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=R89kF22DRNzrtdIqkLzyCmjinqXagxnWLmG6CkY4qytqZI5/3rP/MacXoQlpjbdhfXpnlYpeEMqsX++nVdaHaI2prMzJKrzvl6cBes7E+HJSqKUUDJF2ghwdBrfpQyC/eBKuFuZCXrEfcyMZS1Gbm7o9dvNJOhOhgOuz+P+VAEg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pebblebed.com; spf=fail smtp.mailfrom=pebblebed.com; dkim=pass (2048-bit key) header.d=pebblebed-com.20230601.gappssmtp.com header.i=@pebblebed-com.20230601.gappssmtp.com header.b=zrV5AvhO; arc=pass smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pebblebed.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=pebblebed.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pebblebed-com.20230601.gappssmtp.com header.i=@pebblebed-com.20230601.gappssmtp.com header.b="zrV5AvhO"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-47edd6111b4so6936205e9.1
        for <kernelci@lists.linux.dev>; Thu, 05 Feb 2026 00:58:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770281912; cv=none;
        d=google.com; s=arc-20240605;
        b=QiJz9/v/eTw7OtU3XseBdF6e259DrYTRwRomi3Ew2j6nz5c+o1meYUZpRtMsi3JskE
         TNVKNGEZc1+o0c86RwgGPWQg4R7GA7BcZXI+FXiuLu1vt57SmuCJJRKRA859UtFTP2se
         RSmNL9o+UbD6Y2SddmGaM1TrlooqZplZqv95pBI6Wt1GJdRX9GVk8N8mUtPpZl3ybcSx
         s7s22GY45LlMb2mcJB2h7demMnq2mGMvghZ/0jGAk6DGuL8APxv28Wti367u2GC8nT4G
         8gXva9pMvab7ii/h59H42fe+zWrsasG8F9E3kDv7ueQgx2LPJr/6OQb+/B5NOq8aJlRu
         D4Mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jDM0RJdvLuuskAB+G3I7nybCXIrqiFZYaY2CN3ZZQao=;
        fh=CN5Fx0qpxWj0+1dhYxI/uo5RTX4VzZ0f4rxa/fAflTE=;
        b=M7JQsW52KASSEO4vp/ItY4dkzeZlaMknuofhKAKGMyD0J7Qwq9OS+VT2GhQC6PN250
         Mn648I5eJcUGpXguCm19IczGW55+FCQSg5traY7Kd2hTlZSv2ZSRx2QiQsMNsGW91WWL
         mEY2XGUT2DzCUzqHF9byCnCvkJhjMf2btAiIeRdyoDllHjQnWO0An7g7mV5SN2s8AYvo
         Nj2JLgME00xsM8fGl6YeS2WwDkTf7Say0fyJmyO114XYpPARTI3K0jVWFLGHoLZcSzGM
         BI5fS7FDmtcNA7/oozeF1cdIIwi/3gSp7czVD28Qvy73FCxwap0c5jZKk4db64qbvL4P
         tyxg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pebblebed-com.20230601.gappssmtp.com; s=20230601; t=1770281912; x=1770886712; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jDM0RJdvLuuskAB+G3I7nybCXIrqiFZYaY2CN3ZZQao=;
        b=zrV5AvhOvTy8qKeQGmgMGndgT2fSW6PSISafE32700SijaQe+p7Ki1g6+pcyiDsQBn
         E5npkKgzHoPK38QiLnwd9xVw4osWdcBDGHWHIaDVXm0FLrpMwf7qcl3NTRvZxUwdjp95
         Um3WcUhrZFBTFPF1zncv3vf+aA7A2jgMVcxrFZjqjld2q6N/ocoKqkdqnxCHTU+w6ivw
         4ZuuUJva6Apy25NaFfLKqvJOWaf0JTDaFaRKEk/LFiikvnFmWKPvoVF/20EG8of16lZP
         r9616P/ilR4sHyYfcj13tyUl+W8E07d4sEG+LNe9j/ezuWx5/ust62sEaDolcFRN+FYB
         PleQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770281912; x=1770886712;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jDM0RJdvLuuskAB+G3I7nybCXIrqiFZYaY2CN3ZZQao=;
        b=Z2KDHyHhGyGQOd0VnEeo+gO3fV5b91LI9ulz7YyMgjsXvpk7hTKXGj1c9eDNYgiM5S
         m/YL+gg/qSKOPRRn1KOs7zvLDgGAIFxl5h7HSByF8dnPwUNCGKjgNh157Am32Hsl7tYa
         sNZyFodvaKs6EzQY6z8EOX93S4cStdv2hG9u9WOedmuYHN7+QcpDvB7jlX/g4SJQ3ClJ
         f/4mpL/S2ItUlG4o6YnIwNzZybRa+0ToNDFpJHPc/g3v/4uvr6LxBk9V/Esr+3G5vOMa
         kJCkRCzGqfuLzYTivhnalYSqNL+qcfhcKLF95Tp7wKSeShZSEst2b080SG4omco1k9Tq
         RQBw==
X-Gm-Message-State: AOJu0YzhqhQLxjcWMosYHIUgsE46JZLBO9FqKUcXY8KTuASFmfwCzcUR
	l3p/PCY0sjTUoCpDqo0UZIpKxlq315rsMRTXtROE/A1QgPVfmFm2QlHfioA3N/HzJRYdvbhbABJ
	L7uxCaWPUS6+wcpFEhMHxKXwNhToS6gV99/A+Hrg+ULTKocGWOyY4yf1sxA==
X-Gm-Gg: AZuq6aKFyH7Rs8CNgz6RzgarDBwb7M2GPMGwfQrQa3pprvvZNGQiRF5WSps2CijCnw/
	CLz7/kxbj22s0GFnYFD2XVPzGl5zINvWO9N39yj4NgkudW2316d7zQPjK6AKeyaMHFdpbAT7x6M
	MhwfXnyvnA8tfXd1kleB9nfFGohCT0WpgHfDPynsLclNFi2ZqfJP2Poq8fiKYOwxcT/Qh2YktOu
	vIjAeV6NgtutmjzN+PPxjtjbmsgvG4dhvXgwG3pHlv49+oEPv2yzjriQ/DVndy9yDlgH7m1i/2D
	9jsmmI519SUhxmTinXgQTkMJplI=
X-Received: by 2002:a05:600c:c4b8:b0:477:5af7:6fa with SMTP id
 5b1f17b1804b1-4830e98b2ffmr73608155e9.32.1770281912168; Thu, 05 Feb 2026
 00:58:32 -0800 (PST)
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAPBP3tRAnaV=NmTZ_yFK+w3GtfTTXtZ3XtpyK+AzvfnCHb8AxQ@mail.gmail.com>
 <2026020513-smoking-pureness-b6a0@gregkh>
In-Reply-To: <2026020513-smoking-pureness-b6a0@gregkh>
From: Jenny Qu <jenny@pebblebed.com>
Date: Thu, 5 Feb 2026 00:58:20 -0800
X-Gm-Features: AZwV_QhKyVQTFIACUWJJhxTSRhANwlsZENP_CeYL9_i3F0hPohZLZP9SSt9JSm4
Message-ID: <CAPBP3tTV6CCB5-wmFhWKkyKJ1Cpj0EkmOH73By-zkOKDW8vYtQ@mail.gmail.com>
Subject: Re: Talk proposal: What 125K kernel bugs tell us about testing gaps
To: Greg KH <gregkh@linuxfoundation.org>
Cc: kernelci@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

[resending to list - accidentally replied off-list]

On Wed, Feb 04, 2026 at 11:00:00PM, Greg KH wrote:
> I hate to say "your ai model could be replaced with a sql statement"

Fair point on the descriptive statistics. I should have been clearer:
the 125K bug analysis was training data, not the contribution. verhaal
and the LWN employer reports (Jonathan Corbet's per-release stats
using the gitdm database) already cover the descriptive side well.

The part SQL can't do is the predictive model. VulnBERT takes a raw
git diff *before merge* and predicts whether it introduces a
vulnerability. The evaluation is a strict temporal holdout: trained
on commits with Fixes: tags from <=3D2023, tested on 2024 commits that
later received Fixes: tags. 92% recall, 1.2% FPR on that split.

To be direct about limitations: those numbers are on historical data
where we know ground truth. The model catches patterns it's seen
before (unbalanced refcounts, missing NULL checks, lock/unlock
mismatches). It will miss novel bug classes it hasn't been trained on.
It's a triage tool and not yet an oracle.

And it's not ready for production use yet. I'm reworking the
architecture. The current approach uses CodeBERT embeddings with
handcrafted features, and I think incorporating LLM reasoning traces
over diffs will do substantially better. I don't want to hand anyone
a tool that generates false confidence.

On employer attribution: you're right, email domain mapping
undercounts significantly. Developers using personal emails,
acquisitions (Mellanox -> NVIDIA), and consultants all break the
heuristic.

> how do you feel this information can help with our project? What
> would you like us to do based on what you have found here?

Honestly, I'd rather hear from the KernelCI community what would
actually be useful than prescribe solutions. But two directions I
think are worth discussing:

1. Subsystem-level test prioritization. The lifetime gap between
   CAN bus (4.2 years) and gpu/i915 (1.4 years) almost certainly
   reflects testing coverage differences. i915 has dedicated
   fuzzing infrastructure and active reviewers like Chris Wilson
   and Ville Syrjala. KernelCI could use lifetime data as a signal
   for where to invest in test enablement. This is actionable now,
   no ML required.

2. Longer-term: commit-level risk scoring to allocate CI resources.
   Flag high-risk commits for extra sanitizer runs, longer fuzzing
   passes. Low-risk commits get the standard pipeline. But this
   needs a model I trust enough to deploy, and I'm not there yet.

I'm speaking at BugBash 2026 in April and looking at LPC for a more
technical deep-dive.

kindly,
Jenny
jenny@pebblebed.com


On Wed, Feb 4, 2026 at 11:00=E2=80=AFPM Greg KH <gregkh@linuxfoundation.org=
> wrote:
>
> On Wed, Feb 04, 2026 at 06:49:57PM -0800, Jenny Qu wrote:
> > Hi,
> >
> > I'm a security researcher working on automated kernel vulnerability
> > detection. I'd love to present at an upcoming Thursday call if there's
> > interest.
>
> Cool, but isn't this a better subject for a conference talk?
>
> > I analyzed every Fixes: tag in the kernel's 20-year git history (125K
> > bug-fix pairs) and built a model to catch vulnerabilities at commit
> > time. Some findings that might be relevant to KernelCI's testing
> > strategy:
> >
> > - Security bugs hide for 2.1 years on average; race conditions persist =
5.0 years
> > - 117 "super-reviewers" (including Dan Carpenter, who invented the
> > Fixes: tag) catch bugs 47% faster
> > - Subsystems like CAN bus (4.2 years) and SCTP (4.0 years) have
> > dramatically longer bug lifetimes than gpu/i915 (1.4 years)
> > - Weekend commits are 8% less likely to introduce bugs, but take 45%
> > longer to fix (review coverage effect)
> >
> > The model (VulnBERT) achieves 92% recall at 1.2% false positive rate
> > on held-out 2024 data. I'm also working on SmartKuang, an RL-based
> > system that has reproduced CVE-2022-34918 autonomously.
>
> I hate to say "your ai model could be replaced with a sql statement",
> but really, we do have tools that show this today that give all of this
> data in a sqlite database that people can use to mine for the same info.
> It's what the kernel CVE team uses to track bug fixes over time for
> their work:
>         https://git.sr.ht/~gregkh/verhaal
> and is part of the vulns.git repo on git.kernel.org
>
> Also for the tracking of employer to people and who is doing the work,
> see the reports on lwn.net for the past few decades that have been
> documenting this.  The tool for that is also public (but part of the
> database of employer mapping is not for obvious reasons, sorry).  I
> think you undercounted people's employers a lot as you can not always
> rely on email addresses to convey this.
>
> Anyway, I liked your reports as I'm always interested in more people
> mining our public data for stuff like this, it's great to see.  But with
> regards to kernelci, how do you feel this information can help with our
> project?  What would you like us to do based on what you have found
> here?
>
> thanks,
>
> greg k-h
