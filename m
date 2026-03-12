Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3E233A3E99
	for <kernelci@lists.linux.dev>; Thu, 12 Mar 2026 12:07:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773317265; cv=none; b=Cv8Vyu5Mr2MfMLkCdg2o0aCcctUv41jV45Yj8T+Z1caprfQ0hRhZEND//+3RvW4GqtJRJhpV0ENMm3FboLM9it0q1TgFqARYYUFDtYltvSf6C2Op3k1kdUdpJTXNEiviopmK86PB8cLYP2v5RfQ18onHjocsJfARIk8fKwX5pJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773317265; c=relaxed/simple;
	bh=anA2UtJ1cDw3mWjmmqpoEew1fQQfZIgeI2HsYmPsh7k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tC/tOFdzdYz8wbKUAeyeDysLB3JY5AuUGDxF/y4YugEKlfV7Docvf+/3nsomMsoFO6yFm/gDR2lVyrKweeRs/SOJb2EYIYBptdxjwVqRyOGLZ0BKh/CCa/vFgRnB71nClea/JwmSOmiQ2Nyly5ibDJKaQ7zGiYZOm56hBsu0znY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gtucker.io; spf=pass smtp.mailfrom=gtucker.io; dkim=pass (2048-bit key) header.d=gtucker.io header.i=@gtucker.io header.b=hHKQlFk/; arc=none smtp.client-ip=217.70.183.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gtucker.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gtucker.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gtucker.io header.i=@gtucker.io header.b="hHKQlFk/"
Received: by mail.gandi.net (Postfix) with ESMTPSA id CC3D841CE5;
	Thu, 12 Mar 2026 12:07:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gtucker.io; s=gm1;
	t=1773317254;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=p0zMWVuDhTbCc1++c03zKrfwpMq7EoYq4kJNQo1l/fU=;
	b=hHKQlFk/vP2Upsr7FWNt7vUepVVBVPdDX6BOWWcD2SA2z4QFvbJL5DKnhuB5Eb4UwQ34C8
	vEcU4cA/bDf7in6Y2uLv+4C4ivfPjRpqbinGGv5dedBi1K0qC5qSNzJG5nthqF+nTjqWc3
	Z2wH8pY2Qo+0GvygR9kdxc8XIntvQMm77TMtNRV5gNq3fDnoeHaYuuDjXqRSfCUpXl4Wtp
	LZi8URY7nme9N/qCHd52dABz1VCYGd8E9G974IgOd2SOyB4yNh+Wit16p4cLnVqI4dGOi0
	eDscQMLyR2aIuNtjRp6m/sXZzyDLEk4+5bcS0uLOP3xelk6LOYFNvCDJ/QNCCg==
Message-ID: <cf4a0198-1552-463b-83c3-78d17508c07b@gtucker.io>
Date: Thu, 12 Mar 2026 13:07:21 +0100
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Meeting proposal for KernelCI Bisection
To: Ben Copeland <ben.copeland@linaro.org>, Mark Brown <broonie@kernel.org>
Cc: "kernelci lists.linux.dev" <kernelci@lists.linux.dev>
References: <CAL0q8a67TOQVyDMpdFdgqJmyC9snDoTJaG8Fhf2OqKS1wc=S8g@mail.gmail.com>
 <dc1c30c3-823d-4feb-b381-82260f0db6f4@gtucker.io>
 <060dfaa0-4686-48da-8995-b03823b6d97d@gtucker.io>
 <abIHnXct64ninKSh@sirena.co.uk>
 <CAL0q8a5qBDA18iNrZbsSyh=7zt0dg4yZp4T4=hkz++Fcw-VnXg@mail.gmail.com>
Content-Language: en-US
From: Guillaume Tucker <gtucker@gtucker.io>
In-Reply-To: <CAL0q8a5qBDA18iNrZbsSyh=7zt0dg4yZp4T4=hkz++Fcw-VnXg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: gtucker@gtucker.io
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvkeeijeegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfesthekredttddvjeenucfhrhhomhepifhuihhllhgruhhmvgcuvfhutghkvghruceoghhtuhgtkhgvrhesghhtuhgtkhgvrhdrihhoqeenucggtffrrghtthgvrhhnpedvkeefveeggedugfeuudejgeeutddvheejveehiefgtedvleefkeehffejffefffenucffohhmrghinheplhhptgdrvghvvghnthhspdgrphgrtghhvgdrohhrghenucfkphepkedtrddvudehrddvtdegrdduhedtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepkedtrddvudehrddvtdegrdduhedtpdhhvghloheplgduledvrdduieekrddufedrudegngdpmhgrihhlfhhrohhmpehgthhutghkvghrsehgthhutghkvghrrdhiohdpqhhiugepveevfeffkeegudevgfehpdhmohguvgepshhmthhpohhuthdpnhgspghrtghpthhtohepfedprhgtphhtthhopegsvghnrdgtohhpvghlrghnugeslhhinhgrrhhordhorhhgpdhrtghpthhtohepsghrohhonhhivgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepkhgvrhhnvghltghisehlihhsthhsrdhlihhnuhigrdguvghv
X-GND-State: clean

Hello,

On 12/03/2026 12:01 pm, Ben Copeland wrote:
> On Thu, 12 Mar 2026 at 00:24, Mark Brown <broonie@kernel.org> wrote:
>>
>> On Wed, Mar 11, 2026 at 10:01:08PM +0100, Guillaume Tucker wrote:
>>
>>> Stage 1: the basics
>>> -------------------
>>
>>> The first step is to implement the same kind of bisection as was
>>> initially done in Jenkins but this time with Maestro:
>>
>>> * only for LAVA test regressions
>>> * triggered once all the results for a particular revision are in
>>> * removing duplicates with simple criteria
>>> * optimising builder usage while waiting for runtime test results
>>
>>> The pipeline logic boils down to this:
>>
>>> 1. look for base 'good' commit with reference branch (i.e. mainline)
>>> 2. check bad / good commits
>>> 3. iterate with git bisect
>>> 4. check found commit and revert in place to check it fixes the issue
>>> 5. send email report in reply to the original patch thread
>>>     (or alternatively build a list of recipients from the commit)
>>
>>> It would be wise to send reports to a fixed audience initially for
>>> moderation until it's deemed good enough for automated replies.
>>
>> I think there's a bunch of stuff we can do a lot better here than the v1

Yes this Stage 1 proposal is more like an MVP to get things off the
ground as doing just that can be quite complex enough already.

>> stuff did - the big one is sharing the builds and test runs between
>> multiple bisections.  Especially with the builds it's relatively common
>> to be able to share at least the first step or two of a set of
>> bisections (eg, if two tests fail on the same build we can reuse the
>> build), and it's not uncommon for multiple tests in the same test job
>> fail at once with the same or closely related causes.  You can get
>> something a whole lot more responsive that's still very simple in
>> implementation.
> 
> Agreed, build sharing is key. We're currently integrating TuxMake into
> KCI which gives us reproducible builds keyed by (commit, arch, defconfig,
> toolchain) — that gives us a natural cache key for sharing builds across
> bisections and reusing builds that already exist from normal CI runs.

An even better approach although much more experimental is to use a
remote build backend with object caching such as RBE.  See this talk
from an expert in the field from Source.dev about how it might apply
to the kernel:

   https://lpc.events/event/18/contributions/1927/

In a nutshell, this works at the compiler command line level so
objects get shared across all the builds.  It will automatically
de-duplicate matching ones in real time too, so you essentially just
do regular builds on the client side and it takes care of caching
with the highest possible granularity.  It's not completely trivial
to get working with kbuild though (hence this talk); it's on my
roadmap for VIXI so I'll be looking into this during the next couple
of months.

While it seemed worth bringing up here, I think it's going to take a
very long time to become production ready (if it ever gets there) so
the proposed "query the DB before building" approach is still worth
pursuing first.

> Also we should propose n-bisect: rather than testing one commit per round,
> we pick N evenly-spaced commits from the range and build/test them all
> in parallel. That combined with a build cache means many of those builds
> may already exist and we skip straight to testing. For a range of 1000
> commits, n=7 gets us down to ~4 rounds instead of 10 — and any build
> that's already cached is essentially free.

This was considered a while ago for KernelCI, i.e. you can run both
"git bisect good" and "bad" at every step and run multiple branches
in parallel.  The issue though is that it's wasteful in resources,
unless there's good caching in place of course.  So it might work
better for some use cases than others based on heuristics.
Eventually this folds back into the advanced section with dynamic
orchestration if you push things a bit further.

>> Doing builds and tests as Maestro jobs probably gets us a lot of the way
>> there, what Arisu has implemented already in kci-dev but rearranged a
>> bit with more of a server focus (eg, driving multiple bisects in
>> parallel).
> 
> Yes, Arisu's kci-dev bisect already drives the full loop via Maestro's
> /api/checkout endpoint with job and platform filtering. The main gap is
> that it's client-side — one bisection at a time on the developer's
> machine. Moving the orchestration server-side so we can drive multiple
> bisections in parallel and share builds between them is the natural
> next step. We'll discuss whether that's a new pipeline service or an
> extension of what's already there.

Great, thanks for confirming this.  I haven't tried it yet myself.

>>> Stage 2: expanded coverage
>>> --------------------------
>>
>>> * add primitive support for metrics-based results e.g. thresholds
>>
>> BTW throwing https://otava.apache.org/ out there in case people haven't
>> seen it.  More relevantly there's also the fastpath bisection stuff.
> 
> Thanks for the pointer — Otava looks useful for Stage 2 when we get to
> performance regression detection. It does a statistical change-point
> detection on performance data from various backends which is exactly
> the kind of thing we'd need for metrics-based bisection.

Right although I would argue this could be added incrementally, first
with simpler rules to convert floating point values to binary
pass/fail.  The Otava basic principle does sound similar to the
Scalpel PoC though, thanks for sharing this indeed.

>>> Stage 3: advanced features
>>> --------------------------
>>
>>> Using 'git bisect' has its own limitations.  It's great during
>>> development but automated systems have different use cases.  A more
>>
>> There's also stuff like mining history and throwing test results that we
>> already have in the range at the bisect (eg, if we've tested commits on
>> a different branch or as part of another bisect), not particularly smart
>> in terms of the bisect algorithms or anything but making use of the
>> data set that KernelCI is building up to try to improve their performance.
> 
> This is a good one. KCIDB already has results across trees and branches
> — querying it before each bisection step to see if we've already tested
> a commit could save us entire rounds. Even for n-bisect, if half the
> points are already known good/bad from prior runs, we narrow the range
> before we even start building.
> 
>> Another idea that's getting more into trying to be actually clever would
>> be looking at the builds we've already got and testing those if they're
>> somehow close enough to what we might have otherwise chosen rather than
>> spending time doing another build.
> 
> Agreed — with n-bisect we have some flexibility here. If we pick 7
> evenly-spaced commits but one of them is 2 commits away from a build
> we already have, we could shift the test point to use the existing
> build. The range narrowing still works as long as we know which segment
> each result falls in.

Yes, and the rules for picking "close enough" data can be relatively
loose as it's more important to get bisections running fast than
being 100% accurate.  The checks at the end to verify the result are
there to catch any false positives since there are many other
interfering factors that can mislead it anyway (e.g. flipping
pass/fail non-monotonic test results along the history).  You could
even pick an existing build from a neighbouring commit to test and
pass it on to Git.

>>> their tree (e.g. -rc2 tag).  Semi-automated bisections is also
>>> something to explore, with a command line that 'git bisect' can run
>>> on each iteration and the ability to trigger fully automated ones
>>> manually.
>>
>> There's the bisect stuff Arisu did in kci-dev that I mentioned for the
>> first bit.
> 
> Right, kci-dev bisect already supports this — developers can run it
> manually with --good/--bad and it drives the full loop. We also have
> TuxMake + TuxRun for fully local bisection (git bisect run with
> reproducible builds and QEMU testing). So semi-automated is essentially
> working today; the meeting on the 19th is focused on getting from there
> to a fully automated server-side bisection triggered by regression
> detection.

And another use case in this category is a fully automated
server-side bisection triggered manually, potentially with extra
patches to apply at each iteration.  This should typically only be
available to KernelCI admins though, unless developers get a special
API token to run custom bisections or isolate issues.

>>> So this is a bit of a brainstom or braindump exercise without
>>> actually diving into anything in much detail.  It'll be interesting
>>> to see how this combines with others' experience of automated
>>> bisections in various environments.  Hope this helps!
>>
>> Yeah, likewise.
> 
> Great discussion, looking forward to continuing this next Thursday.

Indeed :)

Best wishes,
Guillaume
