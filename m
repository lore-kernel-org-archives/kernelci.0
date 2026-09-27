Received: from mail-dl2-f12.google.com (mail-dl2-f12.google.com [74.125.229.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A20C3624A6
	for <kernelci@lists.linux.dev>; Sun, 27 Sep 2026 19:33:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790537619; cv=pass; b=g/FkMskw5QK/QpXGUEjVerP1TeZ1WH7pmJz244gkixnaJjRdyWvBLcWzwdZx4vWIOFu18jBZPEDwv0Oe50D2BKI2f89ErT6R9h/MAmwCz7Z0nvzFPgy4hkFCgv1nM1LCYKjbwHPu6RpLvp0nYSdH9wrt/vbvou3djXZv6pweV84=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790537619; c=relaxed/simple;
	bh=FHEBbsQA+vMlNw0zF/tL69nNgyy3WcUCt4OeHB/v6gI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=P/BVKnJox/oQb+MjqytOW0R8DoppdFKiC5rh7xnyfS6A/EyFvHMf7TLbWRPqMIoQCaWNBm8PtZZ7UXruu7ac/ISqSO9QIryN75jV0Nr1KmXayRLngc48gbGobrlQE81I1xhuX+tvhTrF0VgScNzHjoKIUyRTNecI69wFvV+WYGk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DK3ntk3h; arc=pass smtp.client-ip=74.125.229.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DK3ntk3h"
Received: by mail-dl2-f12.google.com with SMTP id a92af1059eb24-141a5d476abso104781c88.2
        for <kernelci@lists.linux.dev>; Sun, 27 Sep 2026 12:33:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790537617; cv=none;
        d=google.com; s=arc-20260327;
        b=TZ4kl0vJqVzpu9JtMnOa4MYhXWPJCQh5g5HpvQ+zT9p7Rz8eV3iBbYcRJlmrZrx5WV
         9WLl6V6YWeCquNWPlrq/KRQj2STOxJK1sXO1VKCUWFD9TRkSm18SDGNXOkbZHv9Mgn29
         epiVV9ntySbnNxx40iKlJrwYlGLGu2NaMnX1xGjLiop37dZP+Tl5skO1vD9A+hMNcFbU
         bvWkC6gCbPKYFiFVtPkxbQOj/YsYK5HeC9BF6RxRpRNvXSVNlwMy9Noo6am0REfD0wfk
         m/o4v+oi4QNgLoQ6p72bxm7MSvccbv+H7w015Peg+EPzMvaMIKySVJHq6RgptrhLVmW2
         oplw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=l5q866BvvSma/IMVrDV/6rai/IHNDTchFlxM/hoTak4=;
        fh=7uWs+u5jWu+aptRDSZvDajaGOTVxH8nGFJtevz8/5WQ=;
        b=s5GUUDWwld5eIlmesRaZyrxwBbrgE5tY4PPaAGNW8U2aAFMKLbSPiE4S8qlKaxwXV9
         your1/4C7sOddVyab7Io1IbpAtvZ7JDGxoFB2mTmsXWdnNj3uPgycRXWGBSa5WVmXDga
         qkkvkdbOZC6+0Lp+6+Kug2Vb9eI/8ir/5SKWdyRj/UrcDhQnWo7Sp3g2dHZP0LdYyoU5
         Au/S4et/atpFl5gFoxlOM90S8wugy+3Z++PvtD5y+W+E66xxKZGmwsqpC8/EZtMh+PIR
         zXgTZ1JlV1x5txMkhM4t3EPBUOkRsi3SvHg+QnxTARkUfyPriLwN/HR01Rw1HixWs61r
         FQ1A==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790537617; x=1791142417; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=l5q866BvvSma/IMVrDV/6rai/IHNDTchFlxM/hoTak4=;
        b=DK3ntk3hEXw45zW+oqtf+nUmkFVqz7+otQ+OqfEE0bCofHp7ygGfGRdzQC9mhmJE3G
         VwTlAxGJUfCggkzbwAs4fjsBZNGsGq6DZvu3LMlfLKcXS+fIY0xKBYjZ9wsewUzemg6T
         w6mocdzb+jGFZm3jxWnGSyxMoSlW4bE50WoxChOywnjc9aNz+zBiv6Yb/KkvClvt5DQ5
         V62ZJrQcwdeEbykBaGXVKADOmknEzzt/e+YgD0eMZmMmjvxvYzyiKALCq1Y9xrzi0aKU
         U+DnxZczMV3ZhCzMEfVuukBpUXDATzfc6VnC71cOluf6EIF2C3XeYdYJtu43Nkwjm2QE
         wVZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790537617; x=1791142417;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=l5q866BvvSma/IMVrDV/6rai/IHNDTchFlxM/hoTak4=;
        b=xKituk8toH6tIzkEGeYtT4mzkT8DG739XYPV+OKRrNVs1+OMzEGoetnpkFaCKZSRko
         uV3t8hdQWA42sNZHr4rK0KjnQ73lFE3EqOoVz6QkB7JaVkJ5koLYCQZwfU6Xd/twpwtx
         fN5htXgKflAk6VJjpcaxC5DtbxQyGG3flwZJ9E4gmj4e3GUvpCszBvqYU5TXSBJcNDMe
         B6GYmRwVjq8wyys6f1syzevS6LmZrgy8AIiKN40IwsQPj3POoNj83qYA8yiQmeyON5Us
         h7pY5NAar7V91sOt2TgieNFsyqdD0VfQq4qUcmLZeJx/1xL/aX8N7aGqrefdaQNaaaO+
         yykA==
X-Gm-Message-State: AFuF++kpLZU32ERDdhZSho5gwDgNpYTy4Jhjg4v8wQ3UzodVUw/GlFD0
	ckOxi+7+YDwWwjpPjAc/de9ebmqmm63LZNlleL8VKQRrrSm3xwmb/Gz0DooL+AuzZk9+qw/Aw3u
	FVjjq0Ilh9joOT/6o5WKK2p773EgNmkQ=
X-Gm-Gg: AYBFou1orwYt2n+E+0tkJA3TpcAKiRQZWgCaU3B2YFh3cTNd5+3GMqDpx7oX4uYn31q
	mk2XCLZHkP2Ij+DSDjiumM//U4s16HbvdgBO1S3BHmnjmphuWdlrQXvJjUwetw/6ooY6GQESIg3
	K1d+sb6w2fJHL0LmFr14cUz03AWMJCan3U9NjLAqtdwclfRdjlVUbCusz7or6YkVvYRkBWhPtFi
	xon8iHOx/yMejNv8kc9jyKuJ5Oi7XFod7qCUM/95Z1v6ey3MoMzji1DlnitPXMi94TpIEon2+78
	aa9KteJadeKzMcNZ/eNnEQnaiLM7HJWdVVL0uI1nbcDbVoLMepvt8VlaSP/ngU6bqP/Q+XiGUwl
	jOYWLZhNLRd2iOzXZ9zDSpLYWDn2oTfDC3s9PmlZ8lg==
X-Received: by 2002:a05:7022:ed0e:b0:149:c766:2965 with SMTP id
 a92af1059eb24-149c7662eb8mr808764c88.2.1790537617314; Sun, 27 Sep 2026
 12:33:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <179039514312.597384.1659548947123427650@kernelci.org>
 <8ad00f0f-d924-4b19-986c-8c17dcdade86@leemhuis.info> <CADnq5_O7R096UP9mF5RvGSzT+c2p2v2Dm8M243CLxXa=VZvRwQ@mail.gmail.com>
In-Reply-To: <CADnq5_O7R096UP9mF5RvGSzT+c2p2v2Dm8M243CLxXa=VZvRwQ@mail.gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Sun, 27 Sep 2026 15:33:24 -0400
X-Gm-Features: AclHuK8c840Og0RGxMLZ7uUkzrUME3CtmSIvH_BZYI1XGrw_XTLZ4m6Qt7dWeFs
Message-ID: <CADnq5_Mg-0CjN1hVm58N=jVhFO_abjNU6mAPY3MpfsajsGfUMw@mail.gmail.com>
Subject: Re: [REGRESSION] mainline/master: (build)stack frame size (3096)
 exceeds limit (3072) in 'dml_core_mode_prog...
To: Thorsten Leemhuis <regressions@leemhuis.info>, "Leo (Sunpeng) Li" <Sunpeng.Li@amd.com>, 
	Alex Hung <alex.hung@amd.com>
Cc: kernelci@lists.linux.dev, kernelci-results@groups.io, 
	regressions@lists.linux.dev, broonie@kernel.org, 
	Alex Deucher <alexander.deucher@amd.com>, DRI <dri-devel@lists.freedesktop.org>, 
	"amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 27, 2026 at 9:29=E2=80=AFAM Alex Deucher <alexdeucher@gmail.com=
> wrote:
>
> On Sat, Sep 26, 2026 at 6:37=E2=80=AFAM Thorsten Leemhuis
> <regressions@leemhuis.info> wrote:
> >
> > On 9/26/26 05:59, KernelCI bot wrote:
> > > New build issue found on mainline/master:
> > >
> > > ---
> > > stack frame size (3096) exceeds limit (3072) in 'dml_core_mode_progra=
mming' [-Werror,-Wframe-larger-than] in drivers/gpu/drm/amd/amdgpu/../displ=
ay/dc/dml2_0/dml21/src/dml2_core/dml2_core_dcn4_calcs.o (drivers/gpu/drm/am=
d/amdgpu/../display/dc/dml2_0/dml21/src/dml2_core/dml2_core_dcn4_calcs.c) [=
logspec:kbuild,kbuild.compiler.error]
> > > ---
> > >
> > > Log excerpt:
> > > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
> > > /tmp/kci/linux/drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/=
src/dml2_core/dml2_core_dcn4_calcs.c:10513:13: error: stack frame size (309=
6) exceeds limit (3072) in 'dml_core_mode_programming' [-Werror,-Wframe-lar=
ger-than]
> > >  10513 | static bool dml_core_mode_programming(struct dml2_core_calcs=
_mode_programming_ex *in_out_params)
> > >        |             ^
> > > 1 error generated.
> >
> > Hmmm, there are known "stack frame size [...] exceeds limit" problems i=
n
> > -next that should soon be fixed there, see:
> > https://lore.kernel.org/all/CADnq5_MFMriR-b3eX0mTZShPDgUBgwoObgumEjJ9cJ=
qdmDM6xQ@mail.gmail.com/
> >
> > But this error is new -- and happens in mainline. Wondering if this is
> > caused by a fix for those problems.
>
> + Leo, Alex
>
> Looks like some combination of compiler and/or config options explodes
> the stack even further than the recent changes handled.

Should be fixed with this patch:
https://patchwork.freedesktop.org/patch/756590/?series=3D175063&rev=3D1

Alex

>
> Alex
>
> >
> > CCing Alex and Christian in case this is really something new they want
> > to know about.
> >
> > Ciao, Thorsten
> >
> > > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
> > >
> > > When fixing this issue, please attribute this report according to the
> > > patch submission rules:
> > >
> > > Reported-by: kernelci.org bot <bot@kernelci.org>
> > > Link: https://lore.kernel.org/all/179039514312.597384.165954894712342=
7650@kernelci.org/
> > >
> > > For complete logs and details about the environment used, see the iss=
ue
> > > on the KernelCI dashboard:
> > >
> > > - dashboard: https://d.kernelci.org/i/maestro:24dc0670f5eb77688896917=
0a199e08b7f23f99b
> > > - giturl: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/li=
nux.git
> > > - commit HEAD:  6812ce4e4379ffc99c52401ec28f0d7ffbc36206
> > >
> > > # Builds where the incident occurred:
> > >
> > > ## x86_64_defconfig+allmodconfig on (x86_64):
> > > - compiler: clang-21
> > > - config: None
> > > - dashboard: https://d.kernelci.org/build/maestro:6ab70c1f5ec73975aad=
e9d6e
> > >
> > > #regzbot introduced: f14572c203d57492e1d4e5d7851a3b143e083b82..6812ce=
4e4379ffc99c52401ec28f0d7ffbc36206
> > > #regzbot link: https://d.kernelci.org/i/maestro:24dc0670f5eb776888969=
170a199e08b7f23f99b
> > >
> > > #kernelci issue maestro:24dc0670f5eb776888969170a199e08b7f23f99b
> > >
> > > --
> > > This is an experimental report format. Please send feedback in!
> > > Talk to us at kernelci@lists.linux.dev
> > >
> > > Made with love by the KernelCI team - https://kernelci.org
> >
