Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA1457DA66
	for <kernelci@lists.linux.dev>; Thu,  5 Feb 2026 19:31:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770319894; cv=none; b=G32IAagnNVCX8FakfhH+AkNBWT9ZSvWg7yeQeQ3ymdXDbQiUU472I1gSPW2we2vmgUBPJVEsDCFYCVOFQ/zZ0GW2WlPhbs4vETBcMCXGhhhxldJ+cBD4u/wCyo5KPkzRB8Pfl5vYEcwur4qNB/X/BPJeBECJdkmr4CTWFWwB8Ik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770319894; c=relaxed/simple;
	bh=kgePD53OC0IfxePMh+X3guA40DAUgEu7aMlMObifDx0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pOAC2t+amXzQUL/oX90XK2h4xNAIagcQA6wGJuHA/1ukawyUmb2OFOXyIjGUgqUOpgPwbSV65uE8fOO6tOeyrld9av2VyUeVQgx/wFNl7xx1yPBtJsSTNI3CeH54ETdBxonSJ1lxZi6CuHFyA+2Fyk4qZ/aaN8EePWjfMWD129Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JWSGEV01; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JWSGEV01"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1770319892;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xE1L3XRSs3Gftva7zU65nOATg8JDrxz2YeL0N8qicEg=;
	b=JWSGEV01/XM+YW9zSa9wqqRNpLfFp9CLi/4bvapOnwcI4f29UP2aPdXtEQKl33X8gyiQwY
	/WA9780Hi2IdV1eP4JN1gujdtQjEq5LesKcYof3K3IYYmVmKx95hk3RszqhsHvCKw2h1XO
	9ookEUKH7L9VjJ/umBfgLNCONZMf8Qc=
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-81-UNJSNcVMNLeT9G4qqHbW1g-1; Thu, 05 Feb 2026 14:31:31 -0500
X-MC-Unique: UNJSNcVMNLeT9G4qqHbW1g-1
X-Mimecast-MFC-AGG-ID: UNJSNcVMNLeT9G4qqHbW1g_1770319891
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-795131afb2fso23193077b3.0
        for <kernelci@lists.linux.dev>; Thu, 05 Feb 2026 11:31:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770319891; x=1770924691;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xE1L3XRSs3Gftva7zU65nOATg8JDrxz2YeL0N8qicEg=;
        b=GZFDYPNbIImdlxW3BQp/pR2YR0P+xriEUk1xcY9Db2SQwIVHcG08W2TbzgeIwY5lf7
         NE9IefWnfpPzhsL7VchNF/kMDBUhsyqcR2U4V2S0Y+l3Gm5eEADQLQfAp3x+jq5GKNLc
         CMGq6f5g48mqhQfK+/dwCKBTun4m3PH71s3M2TqlSSW/i3U4awgO9ZXwyJiCrEGY/BLK
         V/+Y1LrvoAXCxIlUzjJgPZOxQf1a8zl+Ex+vWFMpJvqWCUHzXA4SOmbsIe8de+JDod1R
         ZplWEsIU+zijgIDzdOaIGLmLuHoivXegT7MTDWG1mY0o/G78qTMp+Ipq/65rCkYqZIrf
         JjtA==
X-Forwarded-Encrypted: i=1; AJvYcCUKcyyF2DCQk87S0beLhisAMyP1p8XVhLqrn9rHz7kG8lQaO8WhD5RQENOswZf6V4adnIjht+MNQg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz19m87ey2yVtXhdJoZP3owB4zGYYdf4mzRx6z00glcR/eib3DL
	23mnQCTlKR5HFiudrQz+ml7o8W3o8V6/zZ4IJkaIVREb9pwPQ1cPF55QHlq/UOt/TjSS/Ovs490
	rN9nvy54Xx+GITFOyZN99D4mftG60vIyOYCmYQTdLMyTMGrdmgIRKd4o3LKWiXCgFmDFRICstur
	AY6nHfVnMCQNmokd4TqJ6FL4S/OunCOuGqnD3ASSCW1+eTQqd5
X-Gm-Gg: AZuq6aIQWlv6VynpD/CavQ5p/37W4rhXGFSqBN5PVqixAPecKhIkgAlERVgRXbwenhY
	+fskIoeIq+Y+6cn4dAIZH0sO8HMzlPGNslFJ7a2yI/XRCjL6jfJTUK6QwPHXWnZRk3qdFiQxOO1
	NSv53gyOa0rgawGSCKv4RnUsNOoLZG6uHBr0xEKoTP4+sOk+/djFxm98lYGdBwxQ9f61EjZ1wrn
	SssvF31BlWSl2tLV1ZsQ2bn02fi
X-Received: by 2002:a05:690c:906:b0:794:722c:3a2f with SMTP id 00721157ae682-7952aab5cb4mr3029647b3.31.1770319890323;
        Thu, 05 Feb 2026 11:31:30 -0800 (PST)
X-Received: by 2002:a05:690c:906:b0:794:722c:3a2f with SMTP id
 00721157ae682-7952aab5cb4mr3029397b3.31.1770319889919; Thu, 05 Feb 2026
 11:31:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAPBP3tRAnaV=NmTZ_yFK+w3GtfTTXtZ3XtpyK+AzvfnCHb8AxQ@mail.gmail.com>
 <2026020513-smoking-pureness-b6a0@gregkh> <CAPBP3tTV6CCB5-wmFhWKkyKJ1Cpj0EkmOH73By-zkOKDW8vYtQ@mail.gmail.com>
In-Reply-To: <CAPBP3tTV6CCB5-wmFhWKkyKJ1Cpj0EkmOH73By-zkOKDW8vYtQ@mail.gmail.com>
From: Donald Zickus <dzickus@redhat.com>
Date: Thu, 5 Feb 2026 14:31:18 -0500
X-Gm-Features: AZwV_QjPNzC16RdIXplPj0UCh8PnSbCpiUjMUoKPGAbpuhQTffI276RLHxSIFgA
Message-ID: <CAK18DXZquzGjSEhSvfptW+LnvO6Ttmkn8L=wYCffVLHZygiaPw@mail.gmail.com>
Subject: Re: Talk proposal: What 125K kernel bugs tell us about testing gaps
To: Jenny Qu <jenny@pebblebed.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, kernelci@lists.linux.dev
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Vc2T96xBgidMxVnbXys_N-fldSo1b64mhlrVRBwK6FI_1770319891
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

(resending in plain text instead of html)

Hi Jenny,


On Thu, Feb 5, 2026 at 4:44=E2=80=AFAM Jenny Qu <jenny@pebblebed.com> wrote=
:
>
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
> on commits with Fixes: tags from <=3D2023, tested on 2024 commits that
> later received Fixes: tags. 92% recall, 1.2% FPR on that split.
>
> To be direct about limitations: those numbers are on historical data
> where we know ground truth. The model catches patterns it's seen
> before (unbalanced refcounts, missing NULL checks, lock/unlock
> mismatches). It will miss novel bug classes it hasn't been trained on.
> It's a triage tool and not yet an oracle.
>
> And it's not ready for production use yet. I'm reworking the
> architecture. The current approach uses CodeBERT embeddings with
> handcrafted features, and I think incorporating LLM reasoning traces
> over diffs will do substantially better. I don't want to hand anyone
> a tool that generates false confidence.
>
> On employer attribution: you're right, email domain mapping
> undercounts significantly. Developers using personal emails,
> acquisitions (Mellanox -> NVIDIA), and consultants all break the
> heuristic.
>
> > how do you feel this information can help with our project? What
> > would you like us to do based on what you have found here?
>
> Honestly, I'd rather hear from the KernelCI community what would
> actually be useful than prescribe solutions. But two directions I
> think are worth discussing:
>
> 1. Subsystem-level test prioritization. The lifetime gap between
>    CAN bus (4.2 years) and gpu/i915 (1.4 years) almost certainly
>    reflects testing coverage differences. i915 has dedicated
>    fuzzing infrastructure and active reviewers like Chris Wilson
>    and Ville Syrjala. KernelCI could use lifetime data as a signal
>    for where to invest in test enablement. This is actionable now,
>    no ML required.
>
> 2. Longer-term: commit-level risk scoring to allocate CI resources.
>    Flag high-risk commits for extra sanitizer runs, longer fuzzing
>    passes. Low-risk commits get the standard pipeline. But this
>    needs a model I trust enough to deploy, and I'm not there yet.
>
> I'm speaking at BugBash 2026 in April and looking at LPC for a more
> technical deep-dive.

Thanks for this.  As a board member of KernelCI, most of the efforts
we have funded or try to support are ones that have been adopted by
the community.  The work we try to sponsor needs to provide value to
the community but the kernel community can be tricky to navigate as
you can see by Greg's comments.

I would recommend those conferences but also try attaching your work
as replies to various patches.  Try to show off the value of your work
on mailing lists and let that start conversations on how to steer it
towards something that could be considered useful.  That journey will
lead to overlap of existing technologies that Greg mentioned, but more
importantly it will lead to conversations on how to collaborate around
those technologies to make something valuable to the community.  The
end result being that it becomes a no-brainer to add to kernelci.

A current example we are working with is Thorsten's regzbot[0].  A
difficult social problem around regression tracking that the community
helped him navigate towards something of value and now makes sense for
kernelci to sponsor.

Cheers,
Don

[0] - https://linux-regtracking.leemhuis.info/about/


>
> kindly,
> Jenny
> jenny@pebblebed.com
>
>
> On Wed, Feb 4, 2026 at 11:00=E2=80=AFPM Greg KH <gregkh@linuxfoundation.o=
rg> wrote:
> >
> > On Wed, Feb 04, 2026 at 06:49:57PM -0800, Jenny Qu wrote:
> > > Hi,
> > >
> > > I'm a security researcher working on automated kernel vulnerability
> > > detection. I'd love to present at an upcoming Thursday call if there'=
s
> > > interest.
> >
> > Cool, but isn't this a better subject for a conference talk?
> >
> > > I analyzed every Fixes: tag in the kernel's 20-year git history (125K
> > > bug-fix pairs) and built a model to catch vulnerabilities at commit
> > > time. Some findings that might be relevant to KernelCI's testing
> > > strategy:
> > >
> > > - Security bugs hide for 2.1 years on average; race conditions persis=
t 5.0 years
> > > - 117 "super-reviewers" (including Dan Carpenter, who invented the
> > > Fixes: tag) catch bugs 47% faster
> > > - Subsystems like CAN bus (4.2 years) and SCTP (4.0 years) have
> > > dramatically longer bug lifetimes than gpu/i915 (1.4 years)
> > > - Weekend commits are 8% less likely to introduce bugs, but take 45%
> > > longer to fix (review coverage effect)
> > >
> > > The model (VulnBERT) achieves 92% recall at 1.2% false positive rate
> > > on held-out 2024 data. I'm also working on SmartKuang, an RL-based
> > > system that has reproduced CVE-2022-34918 autonomously.
> >
> > I hate to say "your ai model could be replaced with a sql statement",
> > but really, we do have tools that show this today that give all of this
> > data in a sqlite database that people can use to mine for the same info=
.
> > It's what the kernel CVE team uses to track bug fixes over time for
> > their work:
> >         https://git.sr.ht/~gregkh/verhaal
> > and is part of the vulns.git repo on git.kernel.org
> >
> > Also for the tracking of employer to people and who is doing the work,
> > see the reports on lwn.net for the past few decades that have been
> > documenting this.  The tool for that is also public (but part of the
> > database of employer mapping is not for obvious reasons, sorry).  I
> > think you undercounted people's employers a lot as you can not always
> > rely on email addresses to convey this.
> >
> > Anyway, I liked your reports as I'm always interested in more people
> > mining our public data for stuff like this, it's great to see.  But wit=
h
> > regards to kernelci, how do you feel this information can help with our
> > project?  What would you like us to do based on what you have found
> > here?
> >
> > thanks,
> >
> > greg k-h
>

