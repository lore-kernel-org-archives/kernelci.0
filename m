Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5EE428EA
	for <kernelci@lists.linux.dev>; Wed, 14 Dec 2022 15:02:18 +0000 (UTC)
Received: by mail-qt1-f175.google.com with SMTP id c7so2631538qtw.8
        for <kernelci@lists.linux.dev>; Wed, 14 Dec 2022 07:02:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zizgjhAGxfQnxHupIAnCacCyNq0cxVj4cOtAYW/ctXU=;
        b=Nc+h1Isbret0pt459xY9Ov8XGXnjPbOoM9oQG/ZQsEELaAAabFefremDZ6IaYd/Upn
         Yi08kekkOmpOnCy6nl6gAG6RNxikvL/bLZSxtfVlB90oYiGZzOy6WhmKEl2/xfIAylPo
         eoCpCQFXeXx0xB7WQ9EpFNHQGcN9X6/yQmrMweBRy572y4IGCEtNfZm3Hra0aRPcwEOs
         HAUGapLqNljHWzsU1td0eZAqD0UWa/YiABTY7UM5VMYVJF775rsEO0OaT0W7PkpNMEBQ
         KhKkrMiLA0wZUGQHZyKLIq0//aBSmDdnaF2d5qYqUFdeueHZECSJg92YJmDewkOVIkbf
         VXOA==
X-Gm-Message-State: ANoB5pmFoAT0tvP2dtaz2fUAS0LnfQr7qaE9ejV3wmX2SvAShZ+wmaE0
	KOmmBrPoPq1SiBTGwVOzzCCuucwuvRZSXQ==
X-Google-Smtp-Source: AA0mqf5jx/BINnu+73tm26D7VJVYOwcw0xNBoC5jKGBkUrHx4quss4HZYcrXbWfFYmV+ONi5hP53Sg==
X-Received: by 2002:ac8:4f49:0:b0:3a6:acb:86be with SMTP id i9-20020ac84f49000000b003a60acb86bemr34319382qtw.66.1671030137374;
        Wed, 14 Dec 2022 07:02:17 -0800 (PST)
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com. [209.85.219.170])
        by smtp.gmail.com with ESMTPSA id f15-20020ac8498f000000b003a4f22c6507sm1783291qtq.48.2022.12.14.07.02.16
        for <kernelci@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Dec 2022 07:02:16 -0800 (PST)
Received: by mail-yb1-f170.google.com with SMTP id i186so21704125ybc.9
        for <kernelci@lists.linux.dev>; Wed, 14 Dec 2022 07:02:16 -0800 (PST)
X-Received: by 2002:a25:9:0:b0:6f9:29ef:a5ee with SMTP id 9-20020a250009000000b006f929efa5eemr38819937yba.380.1671030135781;
 Wed, 14 Dec 2022 07:02:15 -0800 (PST)
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <6398848e.170a0220.f8e8e.d44f@mx.google.com> <Y5itf0+yNIQa6fU4@sirena.org.uk>
 <CAMuHMdW4RNFspMheq1JGUkCm+s1oM90Q_4vPH1XX9ZRAxrmPdA@mail.gmail.com>
 <ea3d5e98-8901-1f9c-b27d-3c65e7969c41@collabora.com> <CAMuHMdVGK=WDXqtJ_NgBJf_g=wQJ0V+dQ_b0RztafpxoRW=v5Q@mail.gmail.com>
 <fea3d246-d1d5-450f-6e9e-1ab63a91a053@collabora.com> <Y5ngIwSr7PradhxE@sirena.org.uk>
In-Reply-To: <Y5ngIwSr7PradhxE@sirena.org.uk>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 14 Dec 2022 16:02:04 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXyFp=96NpoxRgSzFL=vndcweTGyXy9JCmjD=VZF-5O=g@mail.gmail.com>
Message-ID: <CAMuHMdXyFp=96NpoxRgSzFL=vndcweTGyXy9JCmjD=VZF-5O=g@mail.gmail.com>
Subject: Re: renesas/master bisection: igt-kms-rockchip.kms_vblank.pipe-A-wait-forked
 on rk3399-gru-kevin
To: Mark Brown <broonie@kernel.org>
Cc: Guillaume Tucker <guillaume.tucker@collabora.com>, Brian Norris <briannorris@chromium.org>, 
	Sean Paul <seanpaul@chromium.org>, Douglas Anderson <dianders@chromium.org>, 
	dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <robert.foss@linaro.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, kernelci@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi Mark,

On Wed, Dec 14, 2022 at 3:39 PM Mark Brown <broonie@kernel.org> wrote:
> On Wed, Dec 14, 2022 at 03:16:33PM +0100, Guillaume Tucker wrote:
> > Mark, how did you get the list of recipients?
>
> > There's a command for this btw, which was used when the reports
> > were automatically sent to the recipients before we reverted to
> > manual filtering to reduce the noise:
>
> My standard thing is to look at who touched the commit, possibly also
> adding seemingly relevant maintainers depending on how good the list
> from the commit was (IIRC in this case the commit went entirely through
> ChromeOS people so I added relevant DRM submaintainers which turned out
> to be a surprisingly large number of people), and relevant lists.
>
> > As you can see, Geert is not listed there.
>
> I didn't send the report to Geert as far as I can see, I imagine he saw
> it as a result of it going to one of the lists and noticed the mention
> of Renesas as the tree, possibly he's got some filter set up to find
> things that mention it.  The recipient list I have is:
>
> | To: kernelci-results@groups.io, bot@kernelci.org, Brian Norris
> |         <briannorris@chromium.org>, Sean Paul <seanpaul@chromium.org>, Douglas
> |         Anderson <dianders@chromium.org>
> | Cc: gtucker@collabora.com, dri-devel@lists.freedesktop.org,
> |         linux-arm-kernel@lists.infradead.org, Andrzej Hajda
> |         <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>,
> |         Robert Foss <robert.foss@linaro.org>, Laurent Pinchart
> |         <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>,
> |         Jernej Skrabec <jernej.skrabec@gmail.com>
>
> which doesn't mention him at all.

Right. I noticed the email because my name was in the body (it's part
of the git repo name).
The "Re: renesas/master bisection" in the subject immediately triggered
my interest.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
