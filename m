Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB24E3054E4
	for <kernelci@lists.linux.dev>; Thu,  5 Feb 2026 19:57:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770321476; cv=pass; b=k1mCGQ4JN+qQtP6LRxZ3jLI9Gta0UjM9xm8HryuPKl4rL1cJtf14kVISurEGYdHVN0p0xCjlqW9EtLSDf6bPmyNPeqzgKO4SJdo0+pFVOc/2FE5Ie7LLnX40R8s/RmZKkh8pERfCqByy6N/zaJWdNuN9lQjtXWY3C6XBhmW4H3g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770321476; c=relaxed/simple;
	bh=wTX5+Hk5S/DIJxtuNxWuEmuBa75HqrULAzy5gjYcdEA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Dx/avIr22QWHx8UJHSxsninyCpxcQAG5BrVU/Prv6EYQC7Cah+cpNCuDgJBR0OJZKb1fsbClDdX37TNfFeisC3AhkTYfb47aG5ezAzhiW8+HY0BakbVYe+lVENmtIRoM9kWKz2GLiQWCtvDaMd9f6qLU3qXDnsjMbnr1Gm3k9a4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pebblebed.com; spf=fail smtp.mailfrom=pebblebed.com; dkim=pass (2048-bit key) header.d=pebblebed-com.20230601.gappssmtp.com header.i=@pebblebed-com.20230601.gappssmtp.com header.b=0UMnfV2o; arc=pass smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pebblebed.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=pebblebed.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pebblebed-com.20230601.gappssmtp.com header.i=@pebblebed-com.20230601.gappssmtp.com header.b="0UMnfV2o"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-435903c4040so993148f8f.3
        for <kernelci@lists.linux.dev>; Thu, 05 Feb 2026 11:57:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770321474; cv=none;
        d=google.com; s=arc-20240605;
        b=iMZJSOhv3Cw2+7YLWL6nhZFUg7rWp92RZIohS3+zqCmWl+n3ZAI4LU91YB2nDQjlBL
         Fog60EKPMvk+pRSqD2YMZ2AhjmBhZ9yQPxRx3ke4N8tDmi1OMkWrYjTU4YOQvmY/3wQm
         mqp30Voub2HC/1xCuJrwW6OMhE0zSb70Ri1IFf8U46Lb6SJtrZnEs603YeuQSIywwtME
         rYbBnTlIqG8rMg2TsjVVrtXFaYl7BAYloMMScDOa0CA4G1W5DQ3odhaBZzVXmHiYr0bx
         uSeElTs+HzP6YfLlTZqS/Ge25tk5TqOTSEs/tKE6vEDxi4Ym/hkSvlOQI+nF7UtFahbi
         ucWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jRdKewUfWrTZ8W+zomDSAEALPe6rgVH9KdoOAzVfHoI=;
        fh=fyIcDTL5oQzgtDQluK3sasjMvWo4Cg03XRl5smpqcVk=;
        b=NYR6Q1Kn2SgqeiGyyh9IDcObusc7VT9nMgZHR5Biwh/ksQS5UcvFSp+NFuGVulyCMm
         hWdU1aPVgIJbrqgiP3ybwUm6OszfuIiijZhDwtPPqubF2PfmbCUMJ/ZCh7dAuus/DS1o
         fWLLficugYaCJq6ymnvGNtXYVlbTioW41XQbNp9z3o1CYliTLVjhqUkW522In4SWYZXN
         GUGSFqn1ahMhs2c83iQ0JjT/Bpfc4gLteOJ/UONWtaJbVJ2p85BdMn7nT4cyHQ7Arz31
         QphUzmyVKf5YbqbsFcW94N2xH9cHG2a1MtKsTvoGXY7c4GKtWVQ5OXpFlHP+/AKEJYW+
         ERgg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pebblebed-com.20230601.gappssmtp.com; s=20230601; t=1770321474; x=1770926274; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jRdKewUfWrTZ8W+zomDSAEALPe6rgVH9KdoOAzVfHoI=;
        b=0UMnfV2ommNmL8qEEVA1LrXajSAV9ZPv2bI1hHgq0D5MlX1x6ktEtRitm+6ZrwXZmr
         Ov5T3HZyNnBvz+vaV+b+xYwcHvrVvb6ZxLz5Ybv68z+Sm4POxrJVPisbdP7LQ1/VO1a1
         KlnZKbn7AS3lLO8SAJ7ofCfYRZ7suKXQvqmy8+9F8bsKEbX3GwjYOHX6TMm/J6q9owW6
         kOard0cmb87eHYHGWpBWfuypPFEFXDjMl/NsEP+vlcqtC2GjEdBViatRjx2PkPTpPik0
         LYAksBnSxyRnOHFD2jtampXr7UmgcNqQ27rQK3kVNUSGK49cAN7bnwpVsrxqMdKkicsh
         j7Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770321474; x=1770926274;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jRdKewUfWrTZ8W+zomDSAEALPe6rgVH9KdoOAzVfHoI=;
        b=Pw3iBE7hoR6fTCRg4cV5OQm5B9YBGYJ6znV/pmcdBegxu/DqMHuBvGFWaoI6ksrx7e
         Cj8t8A6IEX7MMc3DbTlwEdR2ZcXb9JRlDlxbSoXpKrbrtT1E4Vjzs4QVxKZU7AmKBuwO
         WmOeUarDTWa1ot7BQGZ0fBK2odbMv8Vn/bn8KMo3cYohdWqL2Kjp1A8cvsf1qeucyl7Z
         HXOBiWhYcvMH1WZ0wh1iEg4V5gxInLQGVGTTtVYuFL4XAfji+Ewzjj+SCHq8xtC/e+hr
         A6MGSnJnBi40cZp/OsxqTXgy5gLdz+GLr5H0cHf2fWVuu6zUxIn3E9Kr3nMEzxgEVMzX
         +RJQ==
X-Forwarded-Encrypted: i=1; AJvYcCVhJY3TkWxDGk3/z4AkWaFIIugxzsGTrvVq+S2/+tLQ4Y3OE2Vh+QphdnIuY6e+rYBSQk3FjJqVvw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yyexcl+LiYOMGszjNwjaobFlcupXSazVAVxKoiLFyNWquJ/huTE
	gThGxb9rNhraO3amF2h2y5vyXxSxSlzGOreRl3U0EHbb8hwvmlPN2KPPV2k2Gc82ePJq/vzCRR8
	0Ka06+7gjye4CMwEgvdiv6oGgFEElWEibCZLaGLocmQ==
X-Gm-Gg: AZuq6aL32pha1aGML+Ow4P3x+uXktrCKc+mOCB2Q2X2dbBY8ZXjiVSny5wDZIE4/xOc
	D8HB+EYUKcZDi1ysQ8G7hCtQWxOz2tszHFAyL8uTWxsXB/T9uM2YZ/zZRpOBzHhMylft8ohDUQq
	zTfuoWXSKhSS4FL/V6vfeB/DRh8ieF4V6GmeTXlUAJkAq82CJzak9xg+vF7FiOF49ylnSBtsjnC
	pEQfLMDts8c+cv6tMd8DBxw6T7Zf4FbHszGatE9I2d7jmzFTNniznOYkmtsBNouAaJBCe9pxXAG
	RURXk/rG3iJ5DHlRT/VsYEojZNZYW/H5KYlz9g==
X-Received: by 2002:a05:6000:240e:b0:436:19a1:392c with SMTP id
 ffacd0b85a97d-4362933f9e8mr695262f8f.20.1770321473814; Thu, 05 Feb 2026
 11:57:53 -0800 (PST)
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAPBP3tRAnaV=NmTZ_yFK+w3GtfTTXtZ3XtpyK+AzvfnCHb8AxQ@mail.gmail.com>
 <2026020513-smoking-pureness-b6a0@gregkh> <CAPBP3tTV6CCB5-wmFhWKkyKJ1Cpj0EkmOH73By-zkOKDW8vYtQ@mail.gmail.com>
 <CAK18DXbBKCVPFfWMg3DCv_iHiUOWiAvAtVZ-J1nfQJ3fhbdb-g@mail.gmail.com>
In-Reply-To: <CAK18DXbBKCVPFfWMg3DCv_iHiUOWiAvAtVZ-J1nfQJ3fhbdb-g@mail.gmail.com>
From: Jenny Qu <jenny@pebblebed.com>
Date: Thu, 5 Feb 2026 11:57:42 -0800
X-Gm-Features: AZwV_QjtO-M-wJaWVPT2gvvjJkblgn1WPIjYeFr4K1Kor2dfuOEurbEWsqxbpLw
Message-ID: <CAPBP3tRFaWnBXMH2veOogV3aq5e-FfZPeVEBTnXx77Vh4mj=CA@mail.gmail.com>
Subject: Re: Talk proposal: What 125K kernel bugs tell us about testing gaps
To: Donald Zickus <dzickus@redhat.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, kernelci@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks Greg and Don, this is exactly the guidance I needed.

I'll dig into AUTOSEL, the eBPF AI review workflow, and Coccinelle.
The path makes sense: prove value by running on real patches and
engaging on-list, iterate based on feedback, let adoption happen
organically.

Will report back when I have something worth showing.

Kindly,
Jenny

On Thu, Feb 5, 2026 at 10:24=E2=80=AFAM Donald Zickus <dzickus@redhat.com> =
wrote:
>
> Hi Jenny,
>
> On Thu, Feb 5, 2026 at 4:44=E2=80=AFAM Jenny Qu <jenny@pebblebed.com> wro=
te:
>>
>> [resending to list - accidentally replied off-list]
>>
>> On Wed, Feb 04, 2026 at 11:00:00PM, Greg KH wrote:
>> > I hate to say "your ai model could be replaced with a sql statement"
>>
>> Fair point on the descriptive statistics. I should have been clearer:
>> the 125K bug analysis was training data, not the contribution. verhaal
>> and the LWN employer reports (Jonathan Corbet's per-release stats
>> using the gitdm database) already cover the descriptive side well.
>>
>> The part SQL can't do is the predictive model. VulnBERT takes a raw
>> git diff *before merge* and predicts whether it introduces a
>> vulnerability. The evaluation is a strict temporal holdout: trained
>> on commits with Fixes: tags from <=3D2023, tested on 2024 commits that
>> later received Fixes: tags. 92% recall, 1.2% FPR on that split.
>>
>> To be direct about limitations: those numbers are on historical data
>> where we know ground truth. The model catches patterns it's seen
>> before (unbalanced refcounts, missing NULL checks, lock/unlock
>> mismatches). It will miss novel bug classes it hasn't been trained on.
>> It's a triage tool and not yet an oracle.
>>
>> And it's not ready for production use yet. I'm reworking the
>> architecture. The current approach uses CodeBERT embeddings with
>> handcrafted features, and I think incorporating LLM reasoning traces
>> over diffs will do substantially better. I don't want to hand anyone
>> a tool that generates false confidence.
>>
>> On employer attribution: you're right, email domain mapping
>> undercounts significantly. Developers using personal emails,
>> acquisitions (Mellanox -> NVIDIA), and consultants all break the
>> heuristic.
>>
>> > how do you feel this information can help with our project? What
>> > would you like us to do based on what you have found here?
>>
>> Honestly, I'd rather hear from the KernelCI community what would
>> actually be useful than prescribe solutions. But two directions I
>> think are worth discussing:
>>
>> 1. Subsystem-level test prioritization. The lifetime gap between
>>    CAN bus (4.2 years) and gpu/i915 (1.4 years) almost certainly
>>    reflects testing coverage differences. i915 has dedicated
>>    fuzzing infrastructure and active reviewers like Chris Wilson
>>    and Ville Syrjala. KernelCI could use lifetime data as a signal
>>    for where to invest in test enablement. This is actionable now,
>>    no ML required.
>>
>> 2. Longer-term: commit-level risk scoring to allocate CI resources.
>>    Flag high-risk commits for extra sanitizer runs, longer fuzzing
>>    passes. Low-risk commits get the standard pipeline. But this
>>    needs a model I trust enough to deploy, and I'm not there yet.
>>
>> I'm speaking at BugBash 2026 in April and looking at LPC for a more
>> technical deep-dive.
>
>
> Thanks for this.  As a board member of KernelCI, most of the efforts we h=
ave funded or try to support are ones that have been adopted by the communi=
ty.  The work we try to sponsor needs to provide value to the community but=
 the kernel community can be tricky to navigate as you can see by Greg's co=
mments.
>
> I would recommend those conferences but also try attaching your work as r=
eplies to various patches.  Try to show off the value of your work on maili=
ng lists and let that start conversations on how to steer it towards someth=
ing that could be considered useful.  That journey will lead to overlap of =
existing technologies that Greg mentioned, but more importantly it will lea=
d to conversations on how to collaborate around those technologies to make =
something valuable to the community.  The end result being that it becomes =
a no-brainer to add to kernelci.
>
> A current example we are working with is Thorsten's regzbot[0].  A diffic=
ult social problem around regression tracking that the community helped him=
 navigate towards something of value and now makes sense for kernelci to sp=
onsor.
>
> Cheers,
> Don
>
> [0] - https://linux-regtracking.leemhuis.info/about/
>
>>
>> kindly,
>> Jenny
>> jenny@pebblebed.com
>>
>>
>> On Wed, Feb 4, 2026 at 11:00=E2=80=AFPM Greg KH <gregkh@linuxfoundation.=
org> wrote:
>> >
>> > On Wed, Feb 04, 2026 at 06:49:57PM -0800, Jenny Qu wrote:
>> > > Hi,
>> > >
>> > > I'm a security researcher working on automated kernel vulnerability
>> > > detection. I'd love to present at an upcoming Thursday call if there=
's
>> > > interest.
>> >
>> > Cool, but isn't this a better subject for a conference talk?
>> >
>> > > I analyzed every Fixes: tag in the kernel's 20-year git history (125=
K
>> > > bug-fix pairs) and built a model to catch vulnerabilities at commit
>> > > time. Some findings that might be relevant to KernelCI's testing
>> > > strategy:
>> > >
>> > > - Security bugs hide for 2.1 years on average; race conditions persi=
st 5.0 years
>> > > - 117 "super-reviewers" (including Dan Carpenter, who invented the
>> > > Fixes: tag) catch bugs 47% faster
>> > > - Subsystems like CAN bus (4.2 years) and SCTP (4.0 years) have
>> > > dramatically longer bug lifetimes than gpu/i915 (1.4 years)
>> > > - Weekend commits are 8% less likely to introduce bugs, but take 45%
>> > > longer to fix (review coverage effect)
>> > >
>> > > The model (VulnBERT) achieves 92% recall at 1.2% false positive rate
>> > > on held-out 2024 data. I'm also working on SmartKuang, an RL-based
>> > > system that has reproduced CVE-2022-34918 autonomously.
>> >
>> > I hate to say "your ai model could be replaced with a sql statement",
>> > but really, we do have tools that show this today that give all of thi=
s
>> > data in a sqlite database that people can use to mine for the same inf=
o.
>> > It's what the kernel CVE team uses to track bug fixes over time for
>> > their work:
>> >         https://git.sr.ht/~gregkh/verhaal
>> > and is part of the vulns.git repo on git.kernel.org
>> >
>> > Also for the tracking of employer to people and who is doing the work,
>> > see the reports on lwn.net for the past few decades that have been
>> > documenting this.  The tool for that is also public (but part of the
>> > database of employer mapping is not for obvious reasons, sorry).  I
>> > think you undercounted people's employers a lot as you can not always
>> > rely on email addresses to convey this.
>> >
>> > Anyway, I liked your reports as I'm always interested in more people
>> > mining our public data for stuff like this, it's great to see.  But wi=
th
>> > regards to kernelci, how do you feel this information can help with ou=
r
>> > project?  What would you like us to do based on what you have found
>> > here?
>> >
>> > thanks,
>> >
>> > greg k-h
>>
