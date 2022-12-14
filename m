Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DD7A8489
	for <kernelci@lists.linux.dev>; Wed, 14 Dec 2022 15:07:07 +0000 (UTC)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-3e78d07ab4fso240050117b3.9
        for <kernelci@lists.linux.dev>; Wed, 14 Dec 2022 07:07:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TR/KFpeiUC9gRpsBXc0Ne5FWmMcPN8h9/1WoJtjqPZg=;
        b=lbhUOrv9n+snC0yeddYVAFk6L5Wfv3h9jnTMJssDjv33GD8by0wyqWrkStSF0+cyV5
         ZwOo59GyG9gr3VfUquxcouD7ALppikm/jp6vjJc5i8Llrh0SPg6FLfdtleFOlgNQ+6N+
         VH2+6ly8agGp9pyCQ/gNwcbEAYDTjDm8PUkVP3t+E3VjG2zEU7dvdyQh1YOu9XIHUCIt
         tMM768F6FzRIVEIrZAA6OQWihve/kLHpLv+GLMnTX/YSjn4mH3Uy/JLHs/BjoLOPSm+M
         tnjbUZj6qFX5rQPddaLsOs1rJdUWnb9cwDYrqn70YeqpeYCeXdkf3sumPUEGVWb8ihmq
         r3mw==
X-Gm-Message-State: ANoB5pk8JW4WGpd3H1yWVTkHGzYtdb1ChlhtLZOYdEDNs7X772uGDRJ/
	p3GYp8/wcLzyY6I4DxBD+rTlJpfNH/zI/w==
X-Google-Smtp-Source: AA0mqf6FMxCgSGiMhr43xmA0aXUVgAYYEIntBB76DutAGX3Xz33hdohVGFIFMJxXgh9+LcsrWpAvOA==
X-Received: by 2002:a05:7500:22d4:b0:ea:7ff1:79f3 with SMTP id l20-20020a05750022d400b000ea7ff179f3mr2690712gac.9.1671030425929;
        Wed, 14 Dec 2022 07:07:05 -0800 (PST)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com. [209.85.128.172])
        by smtp.gmail.com with ESMTPSA id q40-20020a05620a2a6800b006f8665f483fsm10215536qkp.85.2022.12.14.07.07.04
        for <kernelci@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Dec 2022 07:07:04 -0800 (PST)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-40b40ff39f1so202269777b3.10
        for <kernelci@lists.linux.dev>; Wed, 14 Dec 2022 07:07:04 -0800 (PST)
X-Received: by 2002:a81:a8a:0:b0:37e:6806:a5f9 with SMTP id
 132-20020a810a8a000000b0037e6806a5f9mr12506156ywk.47.1671030423737; Wed, 14
 Dec 2022 07:07:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <6398848e.170a0220.f8e8e.d44f@mx.google.com> <Y5itf0+yNIQa6fU4@sirena.org.uk>
 <CAMuHMdW4RNFspMheq1JGUkCm+s1oM90Q_4vPH1XX9ZRAxrmPdA@mail.gmail.com>
 <ea3d5e98-8901-1f9c-b27d-3c65e7969c41@collabora.com> <CAMuHMdVGK=WDXqtJ_NgBJf_g=wQJ0V+dQ_b0RztafpxoRW=v5Q@mail.gmail.com>
 <fea3d246-d1d5-450f-6e9e-1ab63a91a053@collabora.com>
In-Reply-To: <fea3d246-d1d5-450f-6e9e-1ab63a91a053@collabora.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 14 Dec 2022 16:06:52 +0100
X-Gmail-Original-Message-ID: <CAMuHMdV9NagbF2mqByLFA1qBUiBsRuYuWGUMJ=QcmLnGuX_3CA@mail.gmail.com>
Message-ID: <CAMuHMdV9NagbF2mqByLFA1qBUiBsRuYuWGUMJ=QcmLnGuX_3CA@mail.gmail.com>
Subject: Re: renesas/master bisection: igt-kms-rockchip.kms_vblank.pipe-A-wait-forked
 on rk3399-gru-kevin
To: Guillaume Tucker <guillaume.tucker@collabora.com>
Cc: Mark Brown <broonie@kernel.org>, Brian Norris <briannorris@chromium.org>, 
	Sean Paul <seanpaul@chromium.org>, Douglas Anderson <dianders@chromium.org>, 
	dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <robert.foss@linaro.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, kernelci@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi Guillaume,

On Wed, Dec 14, 2022 at 3:16 PM Guillaume Tucker
<guillaume.tucker@collabora.com> wrote:
> On 14/12/2022 15:03, Geert Uytterhoeven wrote:
> > On Wed, Dec 14, 2022 at 1:54 PM Guillaume Tucker
> > <guillaume.tucker@collabora.com> wrote:
> >> On 14/12/2022 11:06, Geert Uytterhoeven wrote:
> >>> On Tue, Dec 13, 2022 at 5:58 PM Mark Brown <broonie@kernel.org> wrote:
> >>>> On Tue, Dec 13, 2022 at 05:56:30AM -0800, KernelCI bot wrote:
> >>>> The KernelCI bisection bot found regressions in at least two KMS tests
> >>>> in the Renesas tree on rk3399-gru-kevin just after the Renesas tree
> >>>> merged up mainline:
> >>>>
> >>>>    igt-kms-rockchip.kms_vblank.pipe-A-wait-forked
> >>>>    igt-kms-rockchip.kms_vblank.pipe-A-query-busy
> >>>>
> >>>> which it bisected to ca871659ec16 ("drm/bridge: analogix_dp: Support
> >>>> PSR-exit to disable transition").  I'm not *100%* sure I trust the
> >>>> bisection but it sure is suspicous that two separate bisects for related
> >>>> issues landed on the same commit.
> >>>
> >>> ... which is an old commit, added in v5.19-rc2, and which did not
> >>> enter through the renesas tree at all?
> >>
> >> Do you mean this report shouldn't have been sent to you?
> >
> > Exactly.

> As you can see, Geert is not listed there.

Sorry, it was indeed not sent explicitly to me, but I was mentioned,
so I noticed.

> >> FYI The renesas tree got rebased and inherited a regression which
> >> got bisected.
> >
> > Renesas/master is (usually) never rebased.
> > So when did this rebase happen, and why is it relevant?
>
> Sorry then I guess it wasn't rebased but if mainline was merged
> into the branch then it inherited the regressions from mainline
> at that point.

Yep.

> >>  The same thing probably happened to other trees.
> >
> > Indeed, I expect any tree that merged v5.19-rc2 or later to contain
> > this regression.  That doesn't mean it's a good idea to tell all
> > consumers of v5.19-rc2 and later they got a regression (and make it
> > sound like the problem was introduced in their trees).
>
> No, the issues aren't reported more than once.  And again, the
> tree used to do the bisection is not relevant as what matters is
> the commit that it found.
>
> >> Yes it would be good to have 2nd order regressions based on a
> >> reference branch (e.g. mainline in this case) in KernelCI but
> >
> > Sorry, I don't know what is a "2nd order regression".
>
> Regressions are basically a delta between results in a given
> revision and the previous one on the same branch (new failures).
> What I call "2nd order" regressions are a delta of these
> regressions compared to another reference branch.  For example,
> regressions that are in a particular tree and aren't also in
> mainline such as the one at hand which isn't specific to renesas.

This regression must also be present in mainline (in v6.1).

> >> that's for next year.  Regardless, it found a commit and the
> >> bisection looks legit.
> >
> > Good. So please report it to the relevant parties.
> >
> > While bisecting, as soon as you happen to arrive at a commit
> > that is already upstream...
> >
> >     > git bisect start
> >     > # good: [997b2d66ff4e40ef6a5acf76452e8c21104416f7] Merge branch
> > 'renesas-next' into renesas-devel
> >     > git bisect good 997b2d66ff4e40ef6a5acf76452e8c21104416f7
> >     > # bad: [710ce3a8a6fbfcd81d8ad361dc9d43c6a785f25e] Merge tag
> > 'v6.1' into renesas-devel
> >     > git bisect bad 710ce3a8a6fbfcd81d8ad361dc9d43c6a785f25e
> >     > # bad: [044610f8e4155ec0374f7c8307b725b7d01d750c] Merge tag
> > 'ata-6.0-rc2' of
> > git://git.kernel.org/pub/scm/linux/kernel/git/dlemoal/libata
> >     > git bisect bad 044610f8e4155ec0374f7c8307b725b7d01d750c
> > (which happens here  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^)
> >
> > ... there is no point in "blaming" any of the bisection points before.
> >
> > The git command to check this is (assumed "linus" is a remote pointing
> > to Linus' tree):
> >
> >     git branch -a --contains 044610f8e4155ec0374f7c8307b725b7d01d750c
> > linus/master
> >
> > You can use similar commands to find the maintainer's tree for commits
> > that are in linux-next and in a for-next branch, but not yet upstream.
>
> I think it won't be to implement this as soon as we start
> tracking regressions specific to each tree since we'll have valid
> good/bad revisions that are relevant to the tree in the first
> place (if I understand correctly what you mean here).

My point is that regressions should be reported against the tree where
they truly originated, not against a random tree that merged upstream.

Thanks!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
