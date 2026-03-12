Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F16A2396D06
	for <kernelci@lists.linux.dev>; Thu, 12 Mar 2026 11:01:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773313297; cv=pass; b=szDB2KmYIwss4tgAIKKCm8pOrm2Cb6HB6t/LTcgGu18xGnmlR1TuKrU9TYnRdIJTxb7TPgeh2dFMVwc5sG7fjVIUe11mnyYqos+m4+ZZIYb1rL0VhFPzyai7HTfhfemzvXd/0aqgtITobypQbV3nip49GqKtKFCuVVQDKKN0VGI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773313297; c=relaxed/simple;
	bh=0zxcgQDtOkzuDcRA2q44z7t+s3n+qOgza1zZ5+soKUA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LRfwIElefj0u3xSHQxSdweM76lEj1AsoDrhfdg9DZwHXDK2k8mTn9SOPw8jlKgoYDfFxb0gzeBQ5sGCW2NpzU5UyAphLrnYOJLCXLmzWSm7cQL07JjcoFqT89z9TkwNd3LvC4kDybV767uD/c0O4tz1PWqZqgAVLcx1N9djBCmU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=S3Sh+0k4; arc=pass smtp.client-ip=209.85.221.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="S3Sh+0k4"
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-56af4e998d4so1431579e0c.0
        for <kernelci@lists.linux.dev>; Thu, 12 Mar 2026 04:01:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773313294; cv=none;
        d=google.com; s=arc-20240605;
        b=iopm2SGY15AHSXdAq38QK83PpsRDg819HWJ+dvRK69v+q8VxvRMzZAGv2zS/nSqZ91
         F9uO1wf+5HFF+AsoaHij06zJUm3IhF6K+U7IKHI6Zm7raPaHhkMq5mz8iKuCeYaUErHr
         5FFXeMKnZbQCZAk90lfI1zEfGn0UZY/MWWhOtx0CRZvgus8S6fpaH3+74S/HRA6Cjh5I
         XMn4Y56IQe1TfhkxtuKGVAAQmxg1JmCm9OMzYcjiRtKCP43pJAk5U98p/QcOTHpOvIl+
         ZVcum/y6fdM7CPOMcmfppsaiFj03dHHRbgsDYq1BlqGNYygIQtqzTbZ0j0HSbqeTHlbY
         1Kbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ap0GzBUHCPM0odXIDZuWrsnmgsy5TlLBEMOGgHBUlf8=;
        fh=MOINci8leQOG2teuccRVwcHEiek6AJoVAneGuADESX0=;
        b=elQBwPMHLXjXEYH0mkYxxyBThX7eA7EEElJeSCoVXOdqEOnCX3vpjgyjzeWZ0TF9pF
         aGbuLGSHrY8ecwyyO5X2lFejpjOAVMSDtVevR6QBuc8M1TSNEL+nce8TNeJ/4Hz5+/k9
         KbwbCA7g4E7cmHe+L3pXH510kK1aSP/JblwFlXbhbGQv/xqVLX52EYFVg4paiwzLR7YJ
         KWA2Fgbn9taS/J+tDJDGbCJaQcthl+MvqNAsjbFb8bX7KulXMsAcQuAv6Cwq5qERC6OQ
         leghID/T91DaDcSwiXi2PtDcXh7is2/Hv0iQyvH45/IONQf3Qdrt8hzMpbxTHlW982aX
         kGGA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773313294; x=1773918094; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ap0GzBUHCPM0odXIDZuWrsnmgsy5TlLBEMOGgHBUlf8=;
        b=S3Sh+0k4IH4BvEoef86RxdtQYYPpusMwlw/9Y5DsMCf/3of6gXF7ZL0h5cXc2NqRKm
         WtJEFo7ObOR96Z8OktBhmyyBrn6W5uACZbOBNi5e/fCdEjRKHHV/jroUo/Pa3h/phsQN
         vWP9KOVD2uJIW9U3pZbQcGHNEUp6Qp0+KcYEmL6sUzxphwSg26E8gOXoxOChT4XhmNmV
         eqde9GlOBDA+xpEo+hBYj5eKditRAcTcN4HSGONjurQjci/3eEJzVBeAAMFlQC7QfQ4B
         QU1dpUHDJoW8U47QwNaY9xaPrK7vqXX4I3+itQNkxNLn41QUBn/BW3Y0wuXyubbg9lxH
         oq7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773313294; x=1773918094;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ap0GzBUHCPM0odXIDZuWrsnmgsy5TlLBEMOGgHBUlf8=;
        b=tMoaRaCtEdnxi9IsSkNEQNCgyp8f71iUSexJsqr5osySXt2y6F9yIPRGFHGKpivxNV
         7NROhBq3bWWlEpdRum4CoKNmY+O8jBbC+CuQDf34vuV7yqsihrYwXgNhu4lpUcLuZCG8
         qJnzFao8r5A75wMGkF06FBcgZoJ2I0KZBvjxsLkWwjiiyx9g1Lv05iNQTdS2Z2tA1Rmi
         MS6lPcjpmtw3nuaXBgD/CdaydtJC8ZNizeMay5LRkUi9v9OhF2ThbAWT8TBaJBnCeMfk
         6iUH1iuDcNfCj8ESqm3eX/xF1t2K3E9chGjwAZXkmEPaFBUtolNKenKbi1VoVh+crti4
         hkwA==
X-Forwarded-Encrypted: i=1; AJvYcCUcEUadX1IeEVq/Ss6DfIe25aPy6a0doVIcBH66CM1niiuFKLfCBtcI26TJD6LxKzct+5SoLh1I3g==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz8uROdIVnUy4vlkY8Nj/iT3Fn5BgE87xwQCVYoxCFqNXalb+a0
	OTOOiWDgOyub23Dpu7c3lFKfk9djxrF0wKZmrUJj8JiNevTMmUl6gUEKVt6gGziI0NB252papHR
	iSLb309/cb2zJVo0DmKPXCSIcFQdmkfrnR8uxTdPP
X-Gm-Gg: ATEYQzxwE/m0bxBjAwgmGD6xCRAi6/jVTq9JW79PwhCOI86dfQZauXUuCtkg5eAH0Ut
	SlevEN8Ka/gNWF6+b0idviSeZZZ//ZRdKwgHgDZNNAa/0U5efUYh47uZe/uxLetU8VGq8SAvqmk
	UBtkCc7eXfUhdY8WPsT9Bjen1JtVAFiuo1l7r2BU467aUBrP7QbQBkqOn5caZ7mMhgjqbt84wTI
	JDeM6i1uVaf2wV11l9G8H+hWCX+GaDy/zCyenaW0MTuGFOTYkdVOAJEbSnDjwTrCY08F1DiMLu4
	0Yo7XDeveSFXFn2AlW9tUOXq6QvWGKbqcDBQQPb1tMN1kszKOCqHpm60lY8i
X-Received: by 2002:a05:6122:3786:b0:567:fb8:c7ea with SMTP id
 71dfb90a1353d-56b527fc213mr1165212e0c.8.1773313293570; Thu, 12 Mar 2026
 04:01:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAL0q8a67TOQVyDMpdFdgqJmyC9snDoTJaG8Fhf2OqKS1wc=S8g@mail.gmail.com>
 <dc1c30c3-823d-4feb-b381-82260f0db6f4@gtucker.io> <060dfaa0-4686-48da-8995-b03823b6d97d@gtucker.io>
 <abIHnXct64ninKSh@sirena.co.uk>
In-Reply-To: <abIHnXct64ninKSh@sirena.co.uk>
From: Ben Copeland <ben.copeland@linaro.org>
Date: Thu, 12 Mar 2026 11:01:22 +0000
X-Gm-Features: AaiRm522pRPzjskGwKbkoOXYfRTjDhtdsECFdJhwsaYlHmCYvhjRDmjKsijchng
Message-ID: <CAL0q8a5qBDA18iNrZbsSyh=7zt0dg4yZp4T4=hkz++Fcw-VnXg@mail.gmail.com>
Subject: Re: Meeting proposal for KernelCI Bisection
To: Mark Brown <broonie@kernel.org>
Cc: Guillaume Tucker <gtucker@gtucker.io>, 
	"kernelci lists.linux.dev" <kernelci@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 12 Mar 2026 at 00:24, Mark Brown <broonie@kernel.org> wrote:
>
> On Wed, Mar 11, 2026 at 10:01:08PM +0100, Guillaume Tucker wrote:
>
> > Stage 1: the basics
> > -------------------
>
> > The first step is to implement the same kind of bisection as was
> > initially done in Jenkins but this time with Maestro:
>
> > * only for LAVA test regressions
> > * triggered once all the results for a particular revision are in
> > * removing duplicates with simple criteria
> > * optimising builder usage while waiting for runtime test results
>
> > The pipeline logic boils down to this:
>
> > 1. look for base 'good' commit with reference branch (i.e. mainline)
> > 2. check bad / good commits
> > 3. iterate with git bisect
> > 4. check found commit and revert in place to check it fixes the issue
> > 5. send email report in reply to the original patch thread
> >    (or alternatively build a list of recipients from the commit)
>
> > It would be wise to send reports to a fixed audience initially for
> > moderation until it's deemed good enough for automated replies.
>
> I think there's a bunch of stuff we can do a lot better here than the v1
> stuff did - the big one is sharing the builds and test runs between
> multiple bisections.  Especially with the builds it's relatively common
> to be able to share at least the first step or two of a set of
> bisections (eg, if two tests fail on the same build we can reuse the
> build), and it's not uncommon for multiple tests in the same test job
> fail at once with the same or closely related causes.  You can get
> something a whole lot more responsive that's still very simple in
> implementation.

Agreed, build sharing is key. We're currently integrating TuxMake into
KCI which gives us reproducible builds keyed by (commit, arch, defconfig,
toolchain) =E2=80=94 that gives us a natural cache key for sharing builds a=
cross
bisections and reusing builds that already exist from normal CI runs.

Also we should propose n-bisect: rather than testing one commit per round,
we pick N evenly-spaced commits from the range and build/test them all
in parallel. That combined with a build cache means many of those builds
may already exist and we skip straight to testing. For a range of 1000
commits, n=3D7 gets us down to ~4 rounds instead of 10 =E2=80=94 and any bu=
ild
that's already cached is essentially free.

> Doing builds and tests as Maestro jobs probably gets us a lot of the way
> there, what Arisu has implemented already in kci-dev but rearranged a
> bit with more of a server focus (eg, driving multiple bisects in
> parallel).

Yes, Arisu's kci-dev bisect already drives the full loop via Maestro's
/api/checkout endpoint with job and platform filtering. The main gap is
that it's client-side =E2=80=94 one bisection at a time on the developer's
machine. Moving the orchestration server-side so we can drive multiple
bisections in parallel and share builds between them is the natural
next step. We'll discuss whether that's a new pipeline service or an
extension of what's already there.

> > Stage 2: expanded coverage
> > --------------------------
>
> > * add primitive support for metrics-based results e.g. thresholds
>
> BTW throwing https://otava.apache.org/ out there in case people haven't
> seen it.  More relevantly there's also the fastpath bisection stuff.

Thanks for the pointer =E2=80=94 Otava looks useful for Stage 2 when we get=
 to
performance regression detection. It does a statistical change-point
detection on performance data from various backends which is exactly
the kind of thing we'd need for metrics-based bisection.

> > Stage 3: advanced features
> > --------------------------
>
> > Using 'git bisect' has its own limitations.  It's great during
> > development but automated systems have different use cases.  A more
>
> There's also stuff like mining history and throwing test results that we
> already have in the range at the bisect (eg, if we've tested commits on
> a different branch or as part of another bisect), not particularly smart
> in terms of the bisect algorithms or anything but making use of the
> data set that KernelCI is building up to try to improve their performance=
.

This is a good one. KCIDB already has results across trees and branches
=E2=80=94 querying it before each bisection step to see if we've already te=
sted
a commit could save us entire rounds. Even for n-bisect, if half the
points are already known good/bad from prior runs, we narrow the range
before we even start building.

> Another idea that's getting more into trying to be actually clever would
> be looking at the builds we've already got and testing those if they're
> somehow close enough to what we might have otherwise chosen rather than
> spending time doing another build.

Agreed =E2=80=94 with n-bisect we have some flexibility here. If we pick 7
evenly-spaced commits but one of them is 2 commits away from a build
we already have, we could shift the test point to use the existing
build. The range narrowing still works as long as we know which segment
each result falls in.

> > their tree (e.g. -rc2 tag).  Semi-automated bisections is also
> > something to explore, with a command line that 'git bisect' can run
> > on each iteration and the ability to trigger fully automated ones
> > manually.
>
> There's the bisect stuff Arisu did in kci-dev that I mentioned for the
> first bit.

Right, kci-dev bisect already supports this =E2=80=94 developers can run it
manually with --good/--bad and it drives the full loop. We also have
TuxMake + TuxRun for fully local bisection (git bisect run with
reproducible builds and QEMU testing). So semi-automated is essentially
working today; the meeting on the 19th is focused on getting from there
to a fully automated server-side bisection triggered by regression
detection.

> > So this is a bit of a brainstom or braindump exercise without
> > actually diving into anything in much detail.  It'll be interesting
> > to see how this combines with others' experience of automated
> > bisections in various environments.  Hope this helps!
>
> Yeah, likewise.

Great discussion, looking forward to continuing this next Thursday.

Ben
