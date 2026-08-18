Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D83C533E360
	for <kernelci@lists.linux.dev>; Tue, 18 Aug 2026 16:19:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787069960; cv=pass; b=u6LjySvBwv9T1/w/ruRTafPykYfOuaWOWtAoJG2HxRiY3fM/ymF7ZnWy3zjH47RjgcuRd9E0IBD6DbJcoYNMSJ3LhDdXr7+Nq8rRhXq9ndqKs8f2QobnBKYKI9mpQin/m3cpBNogo4zldzdLJiw7WS7EL07Nbvyp+2iLQ0t0YD0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787069960; c=relaxed/simple;
	bh=Luwmf/h3uMWVEcZL4WGlRAmQ/Ykfbnw1Rxv4VkXypeY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=O+sdF3ojnsDxyiKGiZjSEnwnE40MG5asWFoDfdIaxG/hYIn+/4KkwnBKgBCDrK8El1d91LrXBa/KPs8Ce4TKyExMtaWwHcsG1T707vzhf1KIXejDQIh+1EHbB2oPq+BdA+6KXnnhUKOouY88DhLBIBf48ArC2DbIUt8EpZff9WY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tYrXDeWL; arc=pass smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tYrXDeWL"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-49558ce01afso110145e9.1
        for <kernelci@lists.linux.dev>; Tue, 18 Aug 2026 09:19:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787069957; cv=none;
        d=google.com; s=arc-20260327;
        b=lCwXq4hpRBs6ZhAr7Fqs/jVEO5hXheaxuQFwQQIXzlxk9vdgI9Ixaqi9zQP6X/GXem
         KpDhHLnPoxKiiBf1/cby/rAjhI+0OrTn5y0z1297aRehSRrGod0dlrk2vHH9+Cpa9Xh8
         QXGIc+ZSMSJDajNZt2TufSaB5uW1GFKQiO56mTUAO0yi0Gek7+PoC3zOeL0re15dXaZ2
         yx+tqTMC/kuOG5VEeo8Qc82AyHTDqnZRosWIWT/IaRSb2Npa0jPW2zkgpPUtUXOFFX6Q
         9eOCIYxshC65GwmfmIwfmeknvjY+ZPe3pv54ZFwi3gGoF+p66AF5CGQEP3GHvHqF/b1T
         Ms4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4cCYfaTW+Xm7KzVKnTbBSnOXTWiHki0P9YtWKmlB9XY=;
        fh=UfmIo0Pq8Cj2L8DBBPMOQZk3urlhVZP/DmP+5sPBkS8=;
        b=sihp9J7xntW6sX5WYQAgXOC+rtsJ10+CcuTerNFF65ALAVTIzXmMvCcrXYr/qjPvcd
         9nhslpa0gwzU69QUS2i0WJsxuYtyOIUJVdaPIzRqf6I7izKeLBky3hoF2Dns11XRLiZx
         szRdZkXgZzSkNjz1+uic9GvxshIV7ZRroICsrPFCNYrDXsiog7GQkQELwxup5jz7Wxh5
         09QmDQDyk9jaqpXqriwmTU1zEnMwdmB+NY9WFaXjIvEIWCQeYTP1MyGrml/NowbIu/WN
         /LH9QgMIWbCfrItiHBdTxgdsW7MzeyF/gF3LFTcqL0N32t/h2f54yLL7PFXZCQAFDOUL
         7mvQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787069957; x=1787674757; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4cCYfaTW+Xm7KzVKnTbBSnOXTWiHki0P9YtWKmlB9XY=;
        b=tYrXDeWLeSrZ5TY9D1bp3dpr4aL8c7YcoNhh2KNshjs28wRY3RxU6Klw/gJbsUDKT2
         9N695YpA5G+xrLbkZnKK9aq56LzfFxkEG1LLK/TDUPI68A0zrl3Ya1Lb61Vm2WXIfBnr
         zwHbQv2GjN5dFPcJLCO5l4xGLYU15JOBxfuD/7wYPxP9Dvk94pL3RVz5Wb7pB3mebGhU
         ArjZ0Vtbeij1nX+xmivDv3jkn1yh9x+n/f2nKI4Thfj/Ljmp1AxyXxPUMQUe9XS9mAVh
         lC+0+7Uk0Rb2M57rfgCd1WY72/+C/Rcp51DprLRovH7cTyKXD5YpRHXm8t3jqqq5iI8w
         jFxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787069957; x=1787674757;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4cCYfaTW+Xm7KzVKnTbBSnOXTWiHki0P9YtWKmlB9XY=;
        b=EZ2pW8i/JGlbrPkXn6KHaxuUVFKyruPNTzZ7tYTSh5Eq4kUwtq8qw6+xvfvc4zTlZN
         LhdA9sWowgBginqsmKlxShKdTWDtzfr4p7Ox0bcB+nsfTGhJKjiWmwm9Tw79OO3bXLkN
         J9L2CJxfJK/yKQzBxS6KTvbLRZ/FdOc6IGuaYwS7/Z8wnlVajWW+TeWxyrwWlX7LBrk1
         AJgyNUbDyUunkZTp5QXz/K2tAap4gbkbzvBmDqbANddj+SDRhvKX3B7DMOADbsJQF6ja
         d527pJmXVzfpTPMmPS52mQMPqFAqlCAxCofcrpkj8pX9vBckEnbcRfZt2jJmnTOH/upi
         ArSg==
X-Forwarded-Encrypted: i=1; AHgh+RrAA+SUUCWZ/7hCD85cf1DGdOTGGY8Fp6GGlQhqbp/iNKW0QGVaBhVKQReY4ER9+6X29Xb67lMgQA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzPjXWwAMbhLNpTlDVSrDkouLPVTJqJQjQiKrB7Mt/OUDzcOv06
	TvLss29kR1F/DOO8UwSaVO1hVbnO47GJJtqVjIgy5Yn7DokSk1kbVgiewdndJmYZmTA8Y9FALeW
	5oSjbb4R0SChXyTsnuEsTSn+LEEPDAk5HShdLsyNJ
X-Gm-Gg: AR+sD11tHyRaFs54zfh4JLbh1b40DfaKzSrT3kfRW6Bzv8ke8bMYGhs8StH9ryqiPtq
	neqQI5JzrltwwMGJ/ZK655uOoFWmQRXnzeBzUhMWc+H2NFKFuWuNQk9oqm6QiuK/qVpLm6GbHjJ
	4JSb4xbf2Tk1e+6L3WXvJXkuOV2TIc9HUGM+6AhAPDSnlCgw8ladWli1RVWeChTMmUikIkPP+M4
	SdVjOYiTSEJsGc9rZ1+Sje/D+JnRX2d8BspqqqHaPVBiGepd0dnadXU0B9YPay7R4+EcGpK4Y5x
	Jw9YZyT6rCqvkvPTtbmZDWBHxnbvRHLeSMkNl8zH8HobJpuA3yHl+sgTK1YT5vLY62z4QHTU7RJ
	DrH+bkt1LZh1yJrAt0f80AQ4m7g2lCNbSVGnb/7/u1voBAO+FbJF01PrJd9OVVrJySws=
X-Received: by 2002:a05:600c:848e:b0:499:7024:9d4a with SMTP id
 5b1f17b1804b1-4999fb2ec1cmr179077065e9.8.1787069956525; Tue, 18 Aug 2026
 09:19:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <178701474442.5156.12765087253678603047@kernelci.org> <c9ba4aeb-a288-4597-b13a-9da55666f96a@leemhuis.info>
In-Reply-To: <c9ba4aeb-a288-4597-b13a-9da55666f96a@leemhuis.info>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 18 Aug 2026 09:19:04 -0700
X-Gm-Features: AcwNN1UVkATS-7eRkbr97TwvxPmdiSnbkKPpC1B5mCbDBU5hC9Z2uIP6SnylR5A
Message-ID: <CAKwvOdkcCnhM-395QVriu3hnjmtX1H-3i_1tU5Jpb1Ybr2Q77g@mail.gmail.com>
Subject: Re: [REGRESSION] mainline/master: (build) in arch/arm/kernel/entry-common.o
 (/tmp/kci/linux/scripts/Makefile...
To: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: Nathan Chancellor <nathan@kernel.org>, regressions@lists.linux.dev, laura.nao@collabora.com, 
	shreeya.patel@collabora.com, broonie@kernel.org, kernelci-results@groups.io, 
	kernelci@lists.linux.dev, Ard Biesheuvel <ardb@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

+ Ard

On Mon, Aug 17, 2026 at 11:00=E2=80=AFPM Thorsten Leemhuis
<regressions@leemhuis.info> wrote:
>
> On 8/18/26 02:59, KernelCI bot wrote:
> > New build issue found on mainline/master:
> >
> > ---
> >  in arch/arm/kernel/entry-common.o (/tmp/kci/linux/scripts/Makefile.bui=
ld:435) [logspec:kbuild,kbuild.compiler]
> > ---
> >
> > Log excerpt:
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
>
> Missing for some reason. See below for one, grabbed it from
> https://d.kernelci.org/log-viewer?itemId=3Dmaestro%3A6a838f2962f33761c0d6=
680b&type=3Dbuild&url=3Dhttps%3A%2F%2Ffiles.kernelci.org%2Fkbuild-clang-21-=
arm-allmodconfig-6a838f2962f33761c0d6680b%2Fbuild.log.gz
>
> Nathan, Nick, do you still care about clang problems like this?

Yes, from the logs, it looks like ARCH=3Darm allmodconfig with clang-21
(perhaps, there's a funny warning about the compiler version in the
logs).

> And do
> you by chance know what's wrong here?
>
> """
> <instantiation>:2:11: error: out of range pc-relative fixup value
>  ldr r10, =3D__per_cpu_offset
>           ^
> <instantiation>:2:11: error: out of range pc-relative fixup value
>  ldr tsk, =3D__current
>           ^
> <instantiation>:2:11: error: out of range pc-relative fixup value
>  ldr tsk, =3D__current
>           ^

Smells like the same problem that was addressed by
commit 5fe41793bc78 ("ARM: 9176/1: avoid literal references in inline assem=
bly")

What tree was being tested? 5fe41793bc78 landed in v5.18-rc1. Whatever
was being tested is probably missing that patch.

> make[5]: *** [/tmp/kci/linux/scripts/Makefile.build:435:
> arch/arm/kernel/entry-common.o] Error 1
> make[5]: Target 'arch/arm/kernel/' not remade because of errors.
> make[4]: *** [/tmp/kci/linux/scripts/Makefile.build:549:
> arch/arm/kernel] Error 2
> make[4]: Target 'arch/arm/' not remade because of errors.
> make[3]: *** [/tmp/kci/linux/scripts/Makefile.build:549: arch/arm] Error =
2
> make[3]: Target './' not remade because of errors.
> make[2]: *** [/tmp/kci/linux/Makefile:2187: .] Error 2
> make[2]: Target '__all' not remade because of errors.
> make[1]: *** [/tmp/kci/linux/Makefile:248: __sub-make] Error 2
> make[1]: Target '__all' not remade because of errors.
> make: *** [Makefile:248: __sub-make] Error 2
> make: Target '__all' not remade because of errors.
> """
> Ciao, Thorsten
>
>
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
> >
> > When fixing this issue, please attribute this report according to the
> > patch submission rules:
> >
> > Reported-by: kernelci.org bot <bot@kernelci.org>
> > Link: https://lore.kernel.org/all/178701474442.5156.1276508725367860304=
7@kernelci.org/
> >
> > For complete logs and details about the environment used, see the issue
> > on the KernelCI dashboard:
> >
> > - dashboard: https://d.kernelci.org/i/maestro:5d5ba40a9374919c6038ec3e5=
0f54dbe70a37c03
> > - giturl: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linu=
x.git
> > - commit HEAD:  ff68e5f557f69a08fdcfa4ce8b1b809d63bd4f45
> >
> > # Builds where the incident occurred:
> >
> > ## defconfig+allmodconfig+CONFIG_FRAME_WARN=3D2048 on (arm):
> > - compiler: clang-21
> > - config: None
> > - dashboard: https://d.kernelci.org/build/maestro:6a838f2962f33761c0d66=
80b
> >
> > #regzbot introduced: 8d3ae59288f1e7d58d76558a6ee96d533bc5019f..ff68e5f5=
57f69a08fdcfa4ce8b1b809d63bd4f45
> > #regzbot link: https://d.kernelci.org/i/maestro:5d5ba40a9374919c6038ec3=
e50f54dbe70a37c03
> >
> > #kernelci issue maestro:5d5ba40a9374919c6038ec3e50f54dbe70a37c03
> >
> > --
> > This is an experimental report format. Please send feedback in!
> > Talk to us at kernelci@lists.linux.dev
> >
> > Made with love by the KernelCI team - https://kernelci.org
> >
>


--=20
Thanks,
~Nick Desaulniers
