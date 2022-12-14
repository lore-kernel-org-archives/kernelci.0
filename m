Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F6C18470
	for <kernelci@lists.linux.dev>; Wed, 14 Dec 2022 14:03:47 +0000 (UTC)
Received: by mail-qt1-f178.google.com with SMTP id g7so2523892qts.1
        for <kernelci@lists.linux.dev>; Wed, 14 Dec 2022 06:03:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2Ppa4oLKdAQL4oGsIxNKU1jwlXuu49XPnf0pPCL/ZIA=;
        b=wwjexnPXz/1MAxgiWLT7RRQ8Ch5WgWMfUAVd12B9jVpXhUFx5FXYvFUHXWjUIVKpfU
         lxB3xPZBLLcVhptA+6W/0kEYinYoj+40GOOgs7jvgL510sNrVveE0jDUDO38y+GY4z0h
         ad8WbTY5gRqytHPPqu+hkl6cKXM0wfaDtXgHvPr6WmxQh9Q1KohEkPgrOEI7p1r6oeLS
         egjwctVo/SH4E0Z4UM8ou2EXoz3IYfrY0y4hwdeqae2lh+k5iKezv7stDH3ZZYra/oTD
         WwQqGsm7rjyjR27t5Gw7pOyCFl3aNKNARJZGplvx1Nawr7to76kpHSF1483AVxzd240v
         se3A==
X-Gm-Message-State: ANoB5pldkPBg/ilXA097AVV99HpzzYyiQHwaL4TbiMq/OjZDqdLsPSf+
	tj/6hphoN/xLDUb1m4to3EghG1xEV99n9A==
X-Google-Smtp-Source: AA0mqf5JLrkAy07njORhvoVMj/mKJTmNxQyviY+xglmf9ZNnoau3aPsP8Wv/qs3EM6bxHk38HWX1dw==
X-Received: by 2002:ac8:5bd1:0:b0:3a7:ff5f:cc54 with SMTP id b17-20020ac85bd1000000b003a7ff5fcc54mr14098205qtb.67.1671026626114;
        Wed, 14 Dec 2022 06:03:46 -0800 (PST)
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com. [209.85.219.176])
        by smtp.gmail.com with ESMTPSA id cb19-20020a05622a1f9300b0039a08c0a594sm1719296qtb.82.2022.12.14.06.03.44
        for <kernelci@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Dec 2022 06:03:45 -0800 (PST)
Received: by mail-yb1-f176.google.com with SMTP id d128so21488660ybf.10
        for <kernelci@lists.linux.dev>; Wed, 14 Dec 2022 06:03:44 -0800 (PST)
X-Received: by 2002:a25:7104:0:b0:702:90b4:2e24 with SMTP id
 m4-20020a257104000000b0070290b42e24mr13563159ybc.365.1671026624646; Wed, 14
 Dec 2022 06:03:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <6398848e.170a0220.f8e8e.d44f@mx.google.com> <Y5itf0+yNIQa6fU4@sirena.org.uk>
 <CAMuHMdW4RNFspMheq1JGUkCm+s1oM90Q_4vPH1XX9ZRAxrmPdA@mail.gmail.com> <ea3d5e98-8901-1f9c-b27d-3c65e7969c41@collabora.com>
In-Reply-To: <ea3d5e98-8901-1f9c-b27d-3c65e7969c41@collabora.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 14 Dec 2022 15:03:33 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVGK=WDXqtJ_NgBJf_g=wQJ0V+dQ_b0RztafpxoRW=v5Q@mail.gmail.com>
Message-ID: <CAMuHMdVGK=WDXqtJ_NgBJf_g=wQJ0V+dQ_b0RztafpxoRW=v5Q@mail.gmail.com>
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

On Wed, Dec 14, 2022 at 1:54 PM Guillaume Tucker
<guillaume.tucker@collabora.com> wrote:
> On 14/12/2022 11:06, Geert Uytterhoeven wrote:
> > On Tue, Dec 13, 2022 at 5:58 PM Mark Brown <broonie@kernel.org> wrote:
> >> On Tue, Dec 13, 2022 at 05:56:30AM -0800, KernelCI bot wrote:
> >> The KernelCI bisection bot found regressions in at least two KMS tests
> >> in the Renesas tree on rk3399-gru-kevin just after the Renesas tree
> >> merged up mainline:
> >>
> >>    igt-kms-rockchip.kms_vblank.pipe-A-wait-forked
> >>    igt-kms-rockchip.kms_vblank.pipe-A-query-busy
> >>
> >> which it bisected to ca871659ec16 ("drm/bridge: analogix_dp: Support
> >> PSR-exit to disable transition").  I'm not *100%* sure I trust the
> >> bisection but it sure is suspicous that two separate bisects for related
> >> issues landed on the same commit.
> >
> > ... which is an old commit, added in v5.19-rc2, and which did not
> > enter through the renesas tree at all?
>
> Do you mean this report shouldn't have been sent to you?

Exactly.

> FYI The renesas tree got rebased and inherited a regression which
> got bisected.

Renesas/master is (usually) never rebased.
So when did this rebase happen, and why is it relevant?

>  The same thing probably happened to other trees.

Indeed, I expect any tree that merged v5.19-rc2 or later to contain
this regression.  That doesn't mean it's a good idea to tell all
consumers of v5.19-rc2 and later they got a regression (and make it
sound like the problem was introduced in their trees).

> Yes it would be good to have 2nd order regressions based on a
> reference branch (e.g. mainline in this case) in KernelCI but

Sorry, I don't know what is a "2nd order regression".

> that's for next year.  Regardless, it found a commit and the
> bisection looks legit.

Good. So please report it to the relevant parties.

While bisecting, as soon as you happen to arrive at a commit
that is already upstream...

    > git bisect start
    > # good: [997b2d66ff4e40ef6a5acf76452e8c21104416f7] Merge branch
'renesas-next' into renesas-devel
    > git bisect good 997b2d66ff4e40ef6a5acf76452e8c21104416f7
    > # bad: [710ce3a8a6fbfcd81d8ad361dc9d43c6a785f25e] Merge tag
'v6.1' into renesas-devel
    > git bisect bad 710ce3a8a6fbfcd81d8ad361dc9d43c6a785f25e
    > # bad: [044610f8e4155ec0374f7c8307b725b7d01d750c] Merge tag
'ata-6.0-rc2' of
git://git.kernel.org/pub/scm/linux/kernel/git/dlemoal/libata
    > git bisect bad 044610f8e4155ec0374f7c8307b725b7d01d750c
(which happens here  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^)

... there is no point in "blaming" any of the bisection points before.

The git command to check this is (assumed "linus" is a remote pointing
to Linus' tree):

    git branch -a --contains 044610f8e4155ec0374f7c8307b725b7d01d750c
linus/master

You can use similar commands to find the maintainer's tree for commits
that are in linux-next and in a for-next branch, but not yet upstream.

Thanks!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
