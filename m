Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 400BD39BFE1
	for <kernelci@lists.linux.dev>; Wed,  8 Apr 2026 08:31:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775637112; cv=pass; b=Ste9s/FAOxZr8ht27Zk8iURgyE0iXv2jv3Dbt+IIIQXrSTnpPLZizVwpOudFtyAXjlifu0NekjD3HT8vr3bmvEKDDsLmRjuQF5uozAt0HiKFrgMRnjUugyMpBtVBMp1Pg5Yn3QGXdJhoAS7McqbOycy+x0D2RsBXuWM0lMJ2vwM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775637112; c=relaxed/simple;
	bh=CpjxAvZ2Abp5BCHR0OH7sga5+fYwhmFL7xPGHbGeRXU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EwHBEYfYar8BTpOhtuXNx1ckhDndxRDm+nArO20u3VgsrGABrIG0u9XKgHFC5qIqKqrMkm331lNYLZmXCY6rYbgmeEeueYMGXzktdl1+i02q5MFSc5AjkYY098TlZI742tkgbMjs9+F7WMHJvB4ByeXIvgmlsij/sUYFWcuyyjw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gKid+epF; arc=pass smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gKid+epF"
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-8cfc085395fso511323685a.2
        for <kernelci@lists.linux.dev>; Wed, 08 Apr 2026 01:31:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775637109; cv=none;
        d=google.com; s=arc-20240605;
        b=G1SieZ1YHfKEF8Ko2RwPySc8kAwpGrG0Akzc0PzATn3oDyHB6FbIFpvFZvlaRArVmN
         caXCbcIf7qFTp/JFOOnBtaJa/NnJguSS4bK/WeGbrd1zhnU08wdJVzj7jKZwG2UUdf2Z
         UWegLa31mEhj3WEKSHlE107/MgMlvrU+TOS1a8rYpWT/flvL+VNHM28cyRjq5MYdem4n
         ZTfKT1C+6quSoK2AePt5hkG+GYnNnPkXBPLhEawL3MEiqVEydJMilGNHgXhPFlqHoKa2
         M+/Hx2d4tzUdFPxBrNQFFM7PbnY8Qlyl6R+euiLhZbJlUPLz1BUFaIScUuJELw66Uv+/
         OkwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fEr8UGx20aJOC/6H0h4DI71EHex18/Hd6cnxlCThRWY=;
        fh=tG2Tht/Bm0QZ5IkCQoz3rXXhD/iGPaEkyUhwmzW9CUQ=;
        b=de9bb2hVKiJTWEQWU5gTSsy3cIYTL0++YSkbG8LfpxQVq4I/P1LF9lzoyF3GhKoDIy
         2sSYPRPyIYGHm86oEVrOwRfMet9SuwCSqdeJAdJb+f1HZirseETqLxVZiFFtaInimcFb
         4mrpzwAG9Fvw9nodyjB4JuT6o8wXkzPMdKDFiREeeDEvX60WnVPthL+06NFrLHpg5iMI
         rB0RA6T0MEHtFG6HP6XjUSTbJ1sFLa/UVS3lnRFLrhOAqNlaf4iuo21fw6K49E5+6Uv8
         a7vlc+QaSd4oUMNs7UVplg6J/pjSAMAj1M7Znz+4KoOV0FZEweVeSruG90TqUM9OlMES
         jbUw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1775637109; x=1776241909; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fEr8UGx20aJOC/6H0h4DI71EHex18/Hd6cnxlCThRWY=;
        b=gKid+epFn99fKKt89soZaoUng6uN6IkdSPyC2PRN5ChoRYfd5/7oRdEwo4oOkuMVdd
         UJvrtIKrFbfrY/Piy9FmGievgyNisiU7RUnCMVqn+JzDCZ4LMdPd0U1aWKB/Icn6huAs
         fDKKRVnPOFGISjyK0u7ZBJXzH4lv15CdIJbEGl3BeyN77yWh/bd6OeTPMHfwLClPdlaw
         enIy1CylZpYfZeQP7QJ0dywDeHMu/PD2z3kMTC9KomFqZbaG0BZIa10OKnk/rvdijQS1
         pCcPffPylQ1YiaEVrGlHRgv0XJdVGyy+vcl62nNqPDfn5q4jyGiSQps+zYwPi131M/Qo
         TuBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775637109; x=1776241909;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fEr8UGx20aJOC/6H0h4DI71EHex18/Hd6cnxlCThRWY=;
        b=Ddb1LXMvYSviXBwJ78jdyGpmaRKfIzJaMPwsA7cvk+QQG9aG4qvzdV9invvKAcuHcb
         vArgggUNidmdnOFmv/ulRM4g5jkbKn9DpDdGN4WB+69zjI/b3Dr08fCjALVHHMNaKXr7
         AzoSv//+DR+0iXktmVzecjpM+yDTlIo0stI9vnDZge34cA96lH6ciOHAOZeiNa+S8ptj
         F5i+Is1zZmgyUk6xfNKpxYqeuJt70C/SiMKroQNeKLj0cKTVnbJkCeBvpbBWzNHal184
         YczWxeN8dVhDJ2ZwU+uKC97qxEHkc07cYDz5b3Z5zINHoGKwIpy3tj0cYS19piK7ubuc
         DOwQ==
X-Forwarded-Encrypted: i=1; AJvYcCVu4wAQjlVDD7mPNjE182PKS/LcFOmEpSIl4vMZVbpxHMtpmJdENNrXKLoP6oLVn5O1hw4T88Y8pA==@lists.linux.dev
X-Gm-Message-State: AOJu0YyBDGI3Kg7p3h3Iz9m7/KoDaQcrqlTTOfFLGPDm9osBECiTlGdq
	F/ExvQdmtmNRrb3ZKZsRHaVl9nrx6JZDIgAv7zGKLu5F/bsINst95fOuCcUAVAeW+9pEDi8+Fbs
	5cZIPR9kLhniSgYm5iICTcNO+122Vu0s7xMq5sdGg
X-Gm-Gg: AeBDievU0loByLXgktYktXBmo46HE4dGrpvH1Ph6ARwPsq6UreSFs9I3Bxe6JoSNBak
	w38SK+zmX6zzcBStbFx0+zfzWl8rRlqNyCb5rPXiirh8wzIxz0HUg5poj+vZ6shNqh6D/jLhgNq
	7z3fzhzK/dnMVrqJngfZD0q4340MEforjzFXlXCB6Fwv4J3tW5cDsK+4e+KKsmHFHK74vSH5tZh
	SqBQzfQStMlyCPUKsihfPQIXEPRU5HRumaAQgTRwaeIISqzaPT3Xi0mat7ReqKt0CbTV5m7sI0c
	qz+ewchnRKSWvjZBORMkEaSkh3Zm+aBZ22RxJjoxY2NcDI+LXTRpvUWKjkPU
X-Received: by 2002:a05:6214:5019:b0:8a0:e931:5fbe with SMTP id
 6a1803df08f44-8ac5e17fd0emr65467436d6.29.1775637108770; Wed, 08 Apr 2026
 01:31:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAL0q8a67TOQVyDMpdFdgqJmyC9snDoTJaG8Fhf2OqKS1wc=S8g@mail.gmail.com>
 <dc1c30c3-823d-4feb-b381-82260f0db6f4@gtucker.io> <060dfaa0-4686-48da-8995-b03823b6d97d@gtucker.io>
 <abIHnXct64ninKSh@sirena.co.uk> <CAL0q8a5qBDA18iNrZbsSyh=7zt0dg4yZp4T4=hkz++Fcw-VnXg@mail.gmail.com>
 <cf4a0198-1552-463b-83c3-78d17508c07b@gtucker.io> <CAL0q8a4JkK5YnK=vjb521_F563M=8WYxkVNKadRv_dACzW0xxw@mail.gmail.com>
In-Reply-To: <CAL0q8a4JkK5YnK=vjb521_F563M=8WYxkVNKadRv_dACzW0xxw@mail.gmail.com>
From: Ben Copeland <ben.copeland@linaro.org>
Date: Wed, 8 Apr 2026 09:31:37 +0100
X-Gm-Features: AQROBzCQwif75tLGNviCFmQcrZ_ls_QXL0nvrHN9jlOaMsTyj9FiOmfgAD6uanQ
Message-ID: <CAL0q8a6cpgnCL2DUfZbcybKkvfP3d4VZvi3M=mSPuQLy8LqK-A@mail.gmail.com>
Subject: Re: Meeting proposal for KernelCI Bisection
To: Guillaume Tucker <gtucker@gtucker.io>
Cc: Mark Brown <broonie@kernel.org>, 
	"kernelci lists.linux.dev" <kernelci@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 24 Mar 2026 at 11:39, Ben Copeland <ben.copeland@linaro.org> wrote:
>
> Hello all,
>
> Thanks for joining the bisection call. Here's where we landed.
>
> What we agreed on
> -----------------
>
> The main takeaway was that we should build a generic bisection toolbox
> rather than something tightly coupled to KernelCI/Maestro. Donald
> pushed for this, and I think it's the right call. Everyone has a
> slightly different infrastructure, and we want the core logic to be
> reusable. KernelCI-specific bits (Maestro integration, etc.) sit on
> top.
>
> The approach is building blocks. Break the problem into pieces
> (build, test, result parsing, reporting) with clean interfaces so
> You can swap backends in and out.
>
> We also talked about build caching. Denys raised some real
> concerns about stale caches giving misleading results, so we're
> parking that for now and focusing on getting the core framework
> right first.
>
> I've set up a repo here:
>
>    https://github.com/kernelci/kci-bisect
>
> There's a contrib/ directory, please dump your existing scripts in
> there before the next meeting, so we have something concrete to look
> at. Doesn't need to be polished, just working.
>
> What people have today
> ----------------------
>
> - Mark: wrapper scripts doing parallel builds across a k8s cluster,
>   sharing builds between bisections
> - Denys: kci-dev bisect command driving Maestro, plus a git bisect
>   wrapper for overnight runs
> - Guillaume: Renelec (bisection API framework) and Vixie (client),
>   testing with builds and KUnit
> - Anders/Ben: TuxMake + TuxRun for reproducible local bisection
> - Anyone else: Please feel free to contribute your scripts
>
> Actions
> -------
>
> - Ben: create GitHub issues to track the work (doing this today)
> - Ben: schedule follow-up in ~2 weeks
> - Mark: contribute bisection scripts as a starting point
> - Denys: write up technical description / technical variance
> - Guillaume: feedback on how Renelec/Vixie fits with this
> - Everyone: get your scripts into contrib/ before next meeting
>
> Next meeting
> ------------
>
> I'll send an invite in roughly two weeks. We'll go through
> whatever's been shared in the repo, and start nailing down the actual
> building blocks and interfaces.

Invites have been sent out. The meeting is setup for Apr 23, 2026,
4:30:00 PM (UTC+1)

The meeting can be seen on Kernelci Calandar: https://kernelci.org/calendar=
/

And just a reminder, can all make sure they get their scripts into the
repo so we have time to review + dicuss before the meeting.

Thanks

Ben


>
> If anything comes up in the meantime, reply here or open an issue
> on the repo.
>
> Cheers,
>
> Ben
>
>
> On Thu, 12 Mar 2026 at 12:07, Guillaume Tucker <gtucker@gtucker.io> wrote=
:
> >
> > Hello,
> >
> > On 12/03/2026 12:01 pm, Ben Copeland wrote:
> > > On Thu, 12 Mar 2026 at 00:24, Mark Brown <broonie@kernel.org> wrote:
> > >>
> > >> On Wed, Mar 11, 2026 at 10:01:08PM +0100, Guillaume Tucker wrote:
> > >>
> > >>> Stage 1: the basics
> > >>> -------------------
> > >>
> > >>> The first step is to implement the same kind of bisection as was
> > >>> initially done in Jenkins but this time with Maestro:
> > >>
> > >>> * only for LAVA test regressions
> > >>> * triggered once all the results for a particular revision are in
> > >>> * removing duplicates with simple criteria
> > >>> * optimising builder usage while waiting for runtime test results
> > >>
> > >>> The pipeline logic boils down to this:
> > >>
> > >>> 1. look for base 'good' commit with reference branch (i.e. mainline=
)
> > >>> 2. check bad / good commits
> > >>> 3. iterate with git bisect
> > >>> 4. check found commit and revert in place to check it fixes the iss=
ue
> > >>> 5. send email report in reply to the original patch thread
> > >>>     (or alternatively build a list of recipients from the commit)
> > >>
> > >>> It would be wise to send reports to a fixed audience initially for
> > >>> moderation until it's deemed good enough for automated replies.
> > >>
> > >> I think there's a bunch of stuff we can do a lot better here than th=
e v1
> >
> > Yes this Stage 1 proposal is more like an MVP to get things off the
> > ground as doing just that can be quite complex enough already.
> >
> > >> stuff did - the big one is sharing the builds and test runs between
> > >> multiple bisections.  Especially with the builds it's relatively com=
mon
> > >> to be able to share at least the first step or two of a set of
> > >> bisections (eg, if two tests fail on the same build we can reuse the
> > >> build), and it's not uncommon for multiple tests in the same test jo=
b
> > >> fail at once with the same or closely related causes.  You can get
> > >> something a whole lot more responsive that's still very simple in
> > >> implementation.
> > >
> > > Agreed, build sharing is key. We're currently integrating TuxMake int=
o
> > > KCI which gives us reproducible builds keyed by (commit, arch, defcon=
fig,
> > > toolchain) =E2=80=94 that gives us a natural cache key for sharing bu=
ilds across
> > > bisections and reusing builds that already exist from normal CI runs.
> >
> > An even better approach although much more experimental is to use a
> > remote build backend with object caching such as RBE.  See this talk
> > from an expert in the field from Source.dev about how it might apply
> > to the kernel:
> >
> >    https://lpc.events/event/18/contributions/1927/
> >
> > In a nutshell, this works at the compiler command line level so
> > objects get shared across all the builds.  It will automatically
> > de-duplicate matching ones in real time too, so you essentially just
> > do regular builds on the client side and it takes care of caching
> > with the highest possible granularity.  It's not completely trivial
> > to get working with kbuild though (hence this talk); it's on my
> > roadmap for VIXI so I'll be looking into this during the next couple
> > of months.
> >
> > While it seemed worth bringing up here, I think it's going to take a
> > very long time to become production ready (if it ever gets there) so
> > the proposed "query the DB before building" approach is still worth
> > pursuing first.
> >
> > > Also we should propose n-bisect: rather than testing one commit per r=
ound,
> > > we pick N evenly-spaced commits from the range and build/test them al=
l
> > > in parallel. That combined with a build cache means many of those bui=
lds
> > > may already exist and we skip straight to testing. For a range of 100=
0
> > > commits, n=3D7 gets us down to ~4 rounds instead of 10 =E2=80=94 and =
any build
> > > that's already cached is essentially free.
> >
> > This was considered a while ago for KernelCI, i.e. you can run both
> > "git bisect good" and "bad" at every step and run multiple branches
> > in parallel.  The issue though is that it's wasteful in resources,
> > unless there's good caching in place of course.  So it might work
> > better for some use cases than others based on heuristics.
> > Eventually this folds back into the advanced section with dynamic
> > orchestration if you push things a bit further.
> >
> > >> Doing builds and tests as Maestro jobs probably gets us a lot of the=
 way
> > >> there, what Arisu has implemented already in kci-dev but rearranged =
a
> > >> bit with more of a server focus (eg, driving multiple bisects in
> > >> parallel).
> > >
> > > Yes, Arisu's kci-dev bisect already drives the full loop via Maestro'=
s
> > > /api/checkout endpoint with job and platform filtering. The main gap =
is
> > > that it's client-side =E2=80=94 one bisection at a time on the develo=
per's
> > > machine. Moving the orchestration server-side so we can drive multipl=
e
> > > bisections in parallel and share builds between them is the natural
> > > next step. We'll discuss whether that's a new pipeline service or an
> > > extension of what's already there.
> >
> > Great, thanks for confirming this.  I haven't tried it yet myself.
> >
> > >>> Stage 2: expanded coverage
> > >>> --------------------------
> > >>
> > >>> * add primitive support for metrics-based results e.g. thresholds
> > >>
> > >> BTW throwing https://otava.apache.org/ out there in case people have=
n't
> > >> seen it.  More relevantly there's also the fastpath bisection stuff.
> > >
> > > Thanks for the pointer =E2=80=94 Otava looks useful for Stage 2 when =
we get to
> > > performance regression detection. It does a statistical change-point
> > > detection on performance data from various backends which is exactly
> > > the kind of thing we'd need for metrics-based bisection.
> >
> > Right although I would argue this could be added incrementally, first
> > with simpler rules to convert floating point values to binary
> > pass/fail.  The Otava basic principle does sound similar to the
> > Scalpel PoC though, thanks for sharing this indeed.
> >
> > >>> Stage 3: advanced features
> > >>> --------------------------
> > >>
> > >>> Using 'git bisect' has its own limitations.  It's great during
> > >>> development but automated systems have different use cases.  A more
> > >>
> > >> There's also stuff like mining history and throwing test results tha=
t we
> > >> already have in the range at the bisect (eg, if we've tested commits=
 on
> > >> a different branch or as part of another bisect), not particularly s=
mart
> > >> in terms of the bisect algorithms or anything but making use of the
> > >> data set that KernelCI is building up to try to improve their perfor=
mance.
> > >
> > > This is a good one. KCIDB already has results across trees and branch=
es
> > > =E2=80=94 querying it before each bisection step to see if we've alre=
ady tested
> > > a commit could save us entire rounds. Even for n-bisect, if half the
> > > points are already known good/bad from prior runs, we narrow the rang=
e
> > > before we even start building.
> > >
> > >> Another idea that's getting more into trying to be actually clever w=
ould
> > >> be looking at the builds we've already got and testing those if they=
're
> > >> somehow close enough to what we might have otherwise chosen rather t=
han
> > >> spending time doing another build.
> > >
> > > Agreed =E2=80=94 with n-bisect we have some flexibility here. If we p=
ick 7
> > > evenly-spaced commits but one of them is 2 commits away from a build
> > > we already have, we could shift the test point to use the existing
> > > build. The range narrowing still works as long as we know which segme=
nt
> > > each result falls in.
> >
> > Yes, and the rules for picking "close enough" data can be relatively
> > loose as it's more important to get bisections running fast than
> > being 100% accurate.  The checks at the end to verify the result are
> > there to catch any false positives since there are many other
> > interfering factors that can mislead it anyway (e.g. flipping
> > pass/fail non-monotonic test results along the history).  You could
> > even pick an existing build from a neighbouring commit to test and
> > pass it on to Git.
> >
> > >>> their tree (e.g. -rc2 tag).  Semi-automated bisections is also
> > >>> something to explore, with a command line that 'git bisect' can run
> > >>> on each iteration and the ability to trigger fully automated ones
> > >>> manually.
> > >>
> > >> There's the bisect stuff Arisu did in kci-dev that I mentioned for t=
he
> > >> first bit.
> > >
> > > Right, kci-dev bisect already supports this =E2=80=94 developers can =
run it
> > > manually with --good/--bad and it drives the full loop. We also have
> > > TuxMake + TuxRun for fully local bisection (git bisect run with
> > > reproducible builds and QEMU testing). So semi-automated is essential=
ly
> > > working today; the meeting on the 19th is focused on getting from the=
re
> > > to a fully automated server-side bisection triggered by regression
> > > detection.
> >
> > And another use case in this category is a fully automated
> > server-side bisection triggered manually, potentially with extra
> > patches to apply at each iteration.  This should typically only be
> > available to KernelCI admins though, unless developers get a special
> > API token to run custom bisections or isolate issues.
> >
> > >>> So this is a bit of a brainstom or braindump exercise without
> > >>> actually diving into anything in much detail.  It'll be interesting
> > >>> to see how this combines with others' experience of automated
> > >>> bisections in various environments.  Hope this helps!
> > >>
> > >> Yeah, likewise.
> > >
> > > Great discussion, looking forward to continuing this next Thursday.
> >
> > Indeed :)
> >
> > Best wishes,
> > Guillaume
