Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E8F23EE1C5
	for <kernelci@lists.linux.dev>; Tue, 24 Mar 2026 11:39:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774352384; cv=pass; b=EpsHPjM8HxloREX7wXfy4iQXXpF9Uq4yCtPQdMRFk8xf/ep39iSSGX57Ff3irCb2osTl7dJmsmiEoOTKS0GLF9QV7yHWeTYyrIAF9UjjTNtTJzcavSaDNGGWQmCJEglXYgKjWonavEyhkR1vEIt+AX9AL/HUt44rGMa8nM7G7NI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774352384; c=relaxed/simple;
	bh=7eBuhyyyPezY1urjK127MEYzmsMRyrnvl3C3w9U5Src=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DKRdLapO+Fto/lu15quqiWmZaSfu+U45VPYEXhnR5Nazp+PjP72s18V3P41pJOUGrwQBMNT9OLxSGecPk+1S7FNTJYX8EgAqSYTqoisrg7XSdSgVCNUemCrUjGrW0D9flNI9mceBFWqpLLNHCSOr1cfWtsnyqeRaq2Mnz28u2V8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Z43M2B1T; arc=pass smtp.client-ip=209.85.222.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Z43M2B1T"
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-8cfd44fa075so145606785a.0
        for <kernelci@lists.linux.dev>; Tue, 24 Mar 2026 04:39:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774352379; cv=none;
        d=google.com; s=arc-20240605;
        b=Md+cK5qtjM8wRN5PdB8X6nxIra6NlO/D8L9p0Xfa/p8FnJA6keuruELWLd7dUpHUVb
         FfF5oYMkWBPMCgZBEzeojKz+tOwKnBhDssB358fV3BK/gz8EhQx/R4UV6MhDNUYIl9nm
         VHgOUC7KFOPMQfxuvDu1PQNfZ5NzdlDG3sd9r2pD/4OG8kSFbzfdrhIQwr5VV+GZzTqR
         8ignptb3T9cd6F2jB9M5BBcsuF1PZ/Y0QIL+ngWtqyJLLeU7Tl+NIz271azKT2o0IX5y
         mIHQC3XGHtncW0LeFb15oGc0SXfeYSDfLiUgr9slf6eRtX5hwI4meGbIMmmpOjfV5GmU
         b0/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=b1JU4tTIxVyJhi6GtPjNFGpSGrqSucM997q0M6XZUp0=;
        fh=rz+li1xV5a/T4Y4d0HLsLvxwWU5DgM4+tK1//HguI0o=;
        b=YTToFVt7UF0cWxy9FlnG0Q+FaiIMouPbALMA0NJQB2Xb+9JZIbxdfMtHueQELNXjdo
         d7Bf9mOReJQ+9saHA3Y7iOUiQuHfGuoRhnvmMLvgwOGqzbHzA51i2ZvKxOvps3A42KLn
         5tPrrZqSRWyNZrr105wby+dAYjGq20/MXtA3IyIjEaEejuuC/LTK7Oi1CuWZDVYLSEgt
         7N0414avMDy9zNXQq8j6SzrqAL+Wb1SPSFNWWJhRW+Yw9R4H0lw8iDI7P5xdQ5eMK5g+
         XCG/y+a54UrHrpLP/XMCwalvfSQAYE2u6kWAcNUPnugeOuEUsoYAe5GjqG3CBHyX9uES
         PRFQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774352379; x=1774957179; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b1JU4tTIxVyJhi6GtPjNFGpSGrqSucM997q0M6XZUp0=;
        b=Z43M2B1TSu8Hj9v2na9RqB+jlq7DB3/SXXXSvsGZiNEh7E7pW+R2dPBvTDYDjhSL/D
         1mWM/loMvnuDId4CszCRec+SpPEcmhqoANReYI/FW8uzA54ban1rIjIFuZzuA92VlcMr
         Crc2BAbDbfJmae+ihtMw0O+DMiDLYnU+qO8hsqBxFMnPR5VkrohvUn7wehzZl11g5a95
         GwOKhgdeY4/tKwHP2nh0TwtLJw4NK4bhFhU5ArY7BKBTN7r8BuCA5l+FbkNmgdQ6wFGt
         ZDs+yXauMw3tDg/fPkP9YY9dfCQZvxEsexWaWnThtmqnl4biPaSKy1QahbS3Id/DsDKD
         m9FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774352379; x=1774957179;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=b1JU4tTIxVyJhi6GtPjNFGpSGrqSucM997q0M6XZUp0=;
        b=UexdYdLPmwKp8L3T8xgC0fzW9DH6MDzx3arsv91Se4PiA2YeOMprrswjS40VTnly7d
         vMiRKiuLhhPoQGUPyQ9/sAa/H/CNeHib6DQI6f6HKdKIN0+4u/lT6+sP4Yh1k/1O+1Gq
         z6EMKLWRAWQ6buCVVnh97emfM6wFrL/ehBhd0Dbq0mE05HBvFklcA5KUVMpXgQeEXrUD
         8iQtQU4Qb4jgmUNvKf/OxNU5ydiA8Q2v8+MwnEclvm9PGZyHbaEQM5th+BUQTX5aEcoi
         flYUWOEGkq6lIsNqTXirjY7sCALujjR523AOJM8TR/i2MpP6qRyWIYU7UGGJvAWp63TT
         vWXA==
X-Forwarded-Encrypted: i=1; AJvYcCVhFcDv5Ql9Go/rp4RHeQeRv58f/Trfr5T7NQu6mvyfROTx/gvzO9Nv4efsBsSWPFL+4T30Qk6glg==@lists.linux.dev
X-Gm-Message-State: AOJu0YzTK9rvfKuflhT6UPuOY8ZWUfMe7sEo5WXO0BXjqN1xW2rCryOg
	K1BHBrL+k/+xzZjMGNNVmUre9U2kBqBpE79em7BEngcy1CSP+kuCEEEPV8hJICnoRSY+TGu3QMI
	ftvplDcDgSx1tKXKnxQaU41+/tnF0yPh6kkg73Z1ZGa76/SoxhHOWhQ==
X-Gm-Gg: ATEYQzzKJRBMrlj6f4aHqDEbBeeZBKxxzbS1syk7obeuE9JTqiGODRZIaOxM5sGiRt+
	L4rK3axF6vxDLMr4ebyHNkBL78c+ODcb/8aKA9gFR6poDJZKbEzmtS+nF2H1/tmTCHrFi04hObk
	ZQtNauNniQ9+/p2LzFYrPTxETo1AlsTKU9nKdgh9S97cr2x8Q1h3Z8UN3cjy/xYtti16l68eoGh
	OPyaiaaPiFDVd0bnKcdj0KmDRxX8UxXlFPd4iRVDduWD9nUbnE50i4CB5IjFYAhJ0VzahiI7Pmv
	hQByQ2S1durSw5DLUP8FazSsiqIsqtM9FbQfZVCt788x1WRjSaYCC9c84Pag
X-Received: by 2002:a05:622a:9d8:10b0:50b:29a6:8696 with SMTP id
 d75a77b69052e-50b373a1b75mr171807481cf.7.1774352378602; Tue, 24 Mar 2026
 04:39:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAL0q8a67TOQVyDMpdFdgqJmyC9snDoTJaG8Fhf2OqKS1wc=S8g@mail.gmail.com>
 <dc1c30c3-823d-4feb-b381-82260f0db6f4@gtucker.io> <060dfaa0-4686-48da-8995-b03823b6d97d@gtucker.io>
 <abIHnXct64ninKSh@sirena.co.uk> <CAL0q8a5qBDA18iNrZbsSyh=7zt0dg4yZp4T4=hkz++Fcw-VnXg@mail.gmail.com>
 <cf4a0198-1552-463b-83c3-78d17508c07b@gtucker.io>
In-Reply-To: <cf4a0198-1552-463b-83c3-78d17508c07b@gtucker.io>
From: Ben Copeland <ben.copeland@linaro.org>
Date: Tue, 24 Mar 2026 11:39:27 +0000
X-Gm-Features: AQROBzBnfVOfAYeXO_hxjr_1cwPSedJRdmO1mBZokt65UnawKU7qz77IgIw-MaQ
Message-ID: <CAL0q8a4JkK5YnK=vjb521_F563M=8WYxkVNKadRv_dACzW0xxw@mail.gmail.com>
Subject: Re: Meeting proposal for KernelCI Bisection
To: Guillaume Tucker <gtucker@gtucker.io>
Cc: Mark Brown <broonie@kernel.org>, 
	"kernelci lists.linux.dev" <kernelci@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello all,

Thanks for joining the bisection call. Here's where we landed.

What we agreed on
-----------------

The main takeaway was that we should build a generic bisection toolbox
rather than something tightly coupled to KernelCI/Maestro. Donald
pushed for this, and I think it's the right call. Everyone has a
slightly different infrastructure, and we want the core logic to be
reusable. KernelCI-specific bits (Maestro integration, etc.) sit on
top.

The approach is building blocks. Break the problem into pieces
(build, test, result parsing, reporting) with clean interfaces so
You can swap backends in and out.

We also talked about build caching. Denys raised some real
concerns about stale caches giving misleading results, so we're
parking that for now and focusing on getting the core framework
right first.

I've set up a repo here:

   https://github.com/kernelci/kci-bisect

There's a contrib/ directory, please dump your existing scripts in
there before the next meeting, so we have something concrete to look
at. Doesn't need to be polished, just working.

What people have today
----------------------

- Mark: wrapper scripts doing parallel builds across a k8s cluster,
  sharing builds between bisections
- Denys: kci-dev bisect command driving Maestro, plus a git bisect
  wrapper for overnight runs
- Guillaume: Renelec (bisection API framework) and Vixie (client),
  testing with builds and KUnit
- Anders/Ben: TuxMake + TuxRun for reproducible local bisection
- Anyone else: Please feel free to contribute your scripts

Actions
-------

- Ben: create GitHub issues to track the work (doing this today)
- Ben: schedule follow-up in ~2 weeks
- Mark: contribute bisection scripts as a starting point
- Denys: write up technical description / technical variance
- Guillaume: feedback on how Renelec/Vixie fits with this
- Everyone: get your scripts into contrib/ before next meeting

Next meeting
------------

I'll send an invite in roughly two weeks. We'll go through
whatever's been shared in the repo, and start nailing down the actual
building blocks and interfaces.

If anything comes up in the meantime, reply here or open an issue
on the repo.

Cheers,

Ben


On Thu, 12 Mar 2026 at 12:07, Guillaume Tucker <gtucker@gtucker.io> wrote:
>
> Hello,
>
> On 12/03/2026 12:01 pm, Ben Copeland wrote:
> > On Thu, 12 Mar 2026 at 00:24, Mark Brown <broonie@kernel.org> wrote:
> >>
> >> On Wed, Mar 11, 2026 at 10:01:08PM +0100, Guillaume Tucker wrote:
> >>
> >>> Stage 1: the basics
> >>> -------------------
> >>
> >>> The first step is to implement the same kind of bisection as was
> >>> initially done in Jenkins but this time with Maestro:
> >>
> >>> * only for LAVA test regressions
> >>> * triggered once all the results for a particular revision are in
> >>> * removing duplicates with simple criteria
> >>> * optimising builder usage while waiting for runtime test results
> >>
> >>> The pipeline logic boils down to this:
> >>
> >>> 1. look for base 'good' commit with reference branch (i.e. mainline)
> >>> 2. check bad / good commits
> >>> 3. iterate with git bisect
> >>> 4. check found commit and revert in place to check it fixes the issue
> >>> 5. send email report in reply to the original patch thread
> >>>     (or alternatively build a list of recipients from the commit)
> >>
> >>> It would be wise to send reports to a fixed audience initially for
> >>> moderation until it's deemed good enough for automated replies.
> >>
> >> I think there's a bunch of stuff we can do a lot better here than the =
v1
>
> Yes this Stage 1 proposal is more like an MVP to get things off the
> ground as doing just that can be quite complex enough already.
>
> >> stuff did - the big one is sharing the builds and test runs between
> >> multiple bisections.  Especially with the builds it's relatively commo=
n
> >> to be able to share at least the first step or two of a set of
> >> bisections (eg, if two tests fail on the same build we can reuse the
> >> build), and it's not uncommon for multiple tests in the same test job
> >> fail at once with the same or closely related causes.  You can get
> >> something a whole lot more responsive that's still very simple in
> >> implementation.
> >
> > Agreed, build sharing is key. We're currently integrating TuxMake into
> > KCI which gives us reproducible builds keyed by (commit, arch, defconfi=
g,
> > toolchain) =E2=80=94 that gives us a natural cache key for sharing buil=
ds across
> > bisections and reusing builds that already exist from normal CI runs.
>
> An even better approach although much more experimental is to use a
> remote build backend with object caching such as RBE.  See this talk
> from an expert in the field from Source.dev about how it might apply
> to the kernel:
>
>    https://lpc.events/event/18/contributions/1927/
>
> In a nutshell, this works at the compiler command line level so
> objects get shared across all the builds.  It will automatically
> de-duplicate matching ones in real time too, so you essentially just
> do regular builds on the client side and it takes care of caching
> with the highest possible granularity.  It's not completely trivial
> to get working with kbuild though (hence this talk); it's on my
> roadmap for VIXI so I'll be looking into this during the next couple
> of months.
>
> While it seemed worth bringing up here, I think it's going to take a
> very long time to become production ready (if it ever gets there) so
> the proposed "query the DB before building" approach is still worth
> pursuing first.
>
> > Also we should propose n-bisect: rather than testing one commit per rou=
nd,
> > we pick N evenly-spaced commits from the range and build/test them all
> > in parallel. That combined with a build cache means many of those build=
s
> > may already exist and we skip straight to testing. For a range of 1000
> > commits, n=3D7 gets us down to ~4 rounds instead of 10 =E2=80=94 and an=
y build
> > that's already cached is essentially free.
>
> This was considered a while ago for KernelCI, i.e. you can run both
> "git bisect good" and "bad" at every step and run multiple branches
> in parallel.  The issue though is that it's wasteful in resources,
> unless there's good caching in place of course.  So it might work
> better for some use cases than others based on heuristics.
> Eventually this folds back into the advanced section with dynamic
> orchestration if you push things a bit further.
>
> >> Doing builds and tests as Maestro jobs probably gets us a lot of the w=
ay
> >> there, what Arisu has implemented already in kci-dev but rearranged a
> >> bit with more of a server focus (eg, driving multiple bisects in
> >> parallel).
> >
> > Yes, Arisu's kci-dev bisect already drives the full loop via Maestro's
> > /api/checkout endpoint with job and platform filtering. The main gap is
> > that it's client-side =E2=80=94 one bisection at a time on the develope=
r's
> > machine. Moving the orchestration server-side so we can drive multiple
> > bisections in parallel and share builds between them is the natural
> > next step. We'll discuss whether that's a new pipeline service or an
> > extension of what's already there.
>
> Great, thanks for confirming this.  I haven't tried it yet myself.
>
> >>> Stage 2: expanded coverage
> >>> --------------------------
> >>
> >>> * add primitive support for metrics-based results e.g. thresholds
> >>
> >> BTW throwing https://otava.apache.org/ out there in case people haven'=
t
> >> seen it.  More relevantly there's also the fastpath bisection stuff.
> >
> > Thanks for the pointer =E2=80=94 Otava looks useful for Stage 2 when we=
 get to
> > performance regression detection. It does a statistical change-point
> > detection on performance data from various backends which is exactly
> > the kind of thing we'd need for metrics-based bisection.
>
> Right although I would argue this could be added incrementally, first
> with simpler rules to convert floating point values to binary
> pass/fail.  The Otava basic principle does sound similar to the
> Scalpel PoC though, thanks for sharing this indeed.
>
> >>> Stage 3: advanced features
> >>> --------------------------
> >>
> >>> Using 'git bisect' has its own limitations.  It's great during
> >>> development but automated systems have different use cases.  A more
> >>
> >> There's also stuff like mining history and throwing test results that =
we
> >> already have in the range at the bisect (eg, if we've tested commits o=
n
> >> a different branch or as part of another bisect), not particularly sma=
rt
> >> in terms of the bisect algorithms or anything but making use of the
> >> data set that KernelCI is building up to try to improve their performa=
nce.
> >
> > This is a good one. KCIDB already has results across trees and branches
> > =E2=80=94 querying it before each bisection step to see if we've alread=
y tested
> > a commit could save us entire rounds. Even for n-bisect, if half the
> > points are already known good/bad from prior runs, we narrow the range
> > before we even start building.
> >
> >> Another idea that's getting more into trying to be actually clever wou=
ld
> >> be looking at the builds we've already got and testing those if they'r=
e
> >> somehow close enough to what we might have otherwise chosen rather tha=
n
> >> spending time doing another build.
> >
> > Agreed =E2=80=94 with n-bisect we have some flexibility here. If we pic=
k 7
> > evenly-spaced commits but one of them is 2 commits away from a build
> > we already have, we could shift the test point to use the existing
> > build. The range narrowing still works as long as we know which segment
> > each result falls in.
>
> Yes, and the rules for picking "close enough" data can be relatively
> loose as it's more important to get bisections running fast than
> being 100% accurate.  The checks at the end to verify the result are
> there to catch any false positives since there are many other
> interfering factors that can mislead it anyway (e.g. flipping
> pass/fail non-monotonic test results along the history).  You could
> even pick an existing build from a neighbouring commit to test and
> pass it on to Git.
>
> >>> their tree (e.g. -rc2 tag).  Semi-automated bisections is also
> >>> something to explore, with a command line that 'git bisect' can run
> >>> on each iteration and the ability to trigger fully automated ones
> >>> manually.
> >>
> >> There's the bisect stuff Arisu did in kci-dev that I mentioned for the
> >> first bit.
> >
> > Right, kci-dev bisect already supports this =E2=80=94 developers can ru=
n it
> > manually with --good/--bad and it drives the full loop. We also have
> > TuxMake + TuxRun for fully local bisection (git bisect run with
> > reproducible builds and QEMU testing). So semi-automated is essentially
> > working today; the meeting on the 19th is focused on getting from there
> > to a fully automated server-side bisection triggered by regression
> > detection.
>
> And another use case in this category is a fully automated
> server-side bisection triggered manually, potentially with extra
> patches to apply at each iteration.  This should typically only be
> available to KernelCI admins though, unless developers get a special
> API token to run custom bisections or isolate issues.
>
> >>> So this is a bit of a brainstom or braindump exercise without
> >>> actually diving into anything in much detail.  It'll be interesting
> >>> to see how this combines with others' experience of automated
> >>> bisections in various environments.  Hope this helps!
> >>
> >> Yeah, likewise.
> >
> > Great discussion, looking forward to continuing this next Thursday.
>
> Indeed :)
>
> Best wishes,
> Guillaume
