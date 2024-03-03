Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C779AD27
	for <kernelci@lists.linux.dev>; Sun,  3 Mar 2024 09:31:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709458273; cv=none; b=eWPzsmgnWmkyxU/8+FoeWSRgT3c+xR8BRDov+O7nTrmFpDl1ipVI6ZA2dx/BtBD3Yc6oHyMICwsVAS625Jx1uPC0tutKzppQX87cqn/KPLgjcfz+g2mHGCZTNnn4N/xH1Vux3UX++g5E/YCMBDMOYpysLckf00FBhBrayqAX++g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709458273; c=relaxed/simple;
	bh=qNRnfHzytu7FlNcNip2StOGlbTwoZ8fM8RaPRfKvn7A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UuYoBAVonfL07ymm7IAwl9oWyFxA4ce7832rMtp9sq2xNnsl+oW3vMz4di2H+7THlOmHEUbSnha0YGQN0CdO7T4BQGBdkNgGnooMsXC1ErEN92/8YMW07iC7ajjSzt2ydUimajCK+OEs5LHhDIPtqGfjDHUcuuRyTlXR+5Ot8IM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-60978e6f9a3so31982297b3.3
        for <kernelci@lists.linux.dev>; Sun, 03 Mar 2024 01:31:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709458269; x=1710063069;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+h+cxR9Zi+zZIFamlmv2ivpOejR06HV/J+RWDkEaK2g=;
        b=JWthvzPF0navBrCniB9YeVcKwBYXpbFeoRDEeAngmPyxDgxQufR2R/8+4/qlEPcetH
         IbhN/UYAjhSCvZl1xJtoQDvwKDQQpEzZ9ft5yBiHwJ+9FFFygp5qAlUQhltxCCkAYh0A
         53cz4/Y3KUXJEgk+vkVOchvHMShNAQTb+SWO8zT+NVnkZZ4sllela8YETIsTNp+sKHx2
         71kA9ZtAnoM+BG0/ZZKVAxZCKkMk9DGvM6Tk/6m725l5brvX421y93yRzxTa9IhFqG3M
         9hnnyicGONFBHBMPzzfYH3wrdI8oOxNpAo2Tymqv+iLdKShDCifYJzUUt/dnjrpIiLKW
         04SA==
X-Forwarded-Encrypted: i=1; AJvYcCUmZBX5Ilz9k0d24EiNmAWV/dOQ7poJWPs+Zkj6+sP0hAapHOTOly1Jkd+3ENhg81RcKR57NApr7vqfkYSaV2fePxw7vlm083M=
X-Gm-Message-State: AOJu0YyDVgVQNxG/XZn4YyKRIsEmxt4EwTQEJhiDBc5NxxSUAtXDCDa/
	20rDJAptlljnTb5uga04oCDV92+h7X7gYWZCVkFv6aCW4rp8Z/pSYXY8K7ZuIWM=
X-Google-Smtp-Source: AGHT+IGx89dUpj7tcJSPAYDrq+jYl+IPg0PpRPjuSwHhf4DJV8xzXEWn9QzDvvrJI5PWVI15O/x6xg==
X-Received: by 2002:a0d:d5cc:0:b0:608:d165:2f18 with SMTP id x195-20020a0dd5cc000000b00608d1652f18mr6086853ywd.43.1709458269446;
        Sun, 03 Mar 2024 01:31:09 -0800 (PST)
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com. [209.85.219.177])
        by smtp.gmail.com with ESMTPSA id d193-20020a814fca000000b00609a9c4b597sm40481ywb.38.2024.03.03.01.31.09
        for <kernelci@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 03 Mar 2024 01:31:09 -0800 (PST)
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-dc6d8bd612dso3546242276.1
        for <kernelci@lists.linux.dev>; Sun, 03 Mar 2024 01:31:09 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVOutI8IPdYTWYkQJROupVrZegUECc9BEnBNvKYviMyDGtGyWzVvgK7s43GTktrUe4KH2Vr96CYpTtqfvrNzc1uq/oN4e+iEvQ=
X-Received: by 2002:a81:8494:0:b0:604:9b50:e973 with SMTP id
 u142-20020a818494000000b006049b50e973mr5488306ywf.44.1709458269052; Sun, 03
 Mar 2024 01:31:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240228225527.1052240-1-helen.koike@collabora.com>
 <20240228225527.1052240-2-helen.koike@collabora.com> <20240229-dancing-laughing-groundhog-d85161@houat>
 <5d7ed81b-37f9-48e9-ab7e-484b74ca886c@gmail.com> <CAHk-=wixVy3WYvjbt43ZSrCqPDsS76QJQSkXFbbPsAOs1MCSAQ@mail.gmail.com>
 <CABXOdTeT2ip1uS2EG2w8pW7254Tnd=ZDNz-KC61-G-yqDTVgJA@mail.gmail.com> <269232e6-41c9-4aa1-9320-662beabcd69b@infradead.org>
In-Reply-To: <269232e6-41c9-4aa1-9320-662beabcd69b@infradead.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Sun, 3 Mar 2024 10:30:56 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXuXV9WV3aANFTteuP8Q3JY6R5OWsVBedGOP7e_JguxqA@mail.gmail.com>
Message-ID: <CAMuHMdXuXV9WV3aANFTteuP8Q3JY6R5OWsVBedGOP7e_JguxqA@mail.gmail.com>
Subject: Re: [PATCH 1/3] kci-gitlab: Introducing GitLab-CI Pipeline for Kernel Testing
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Guenter Roeck <groeck@google.com>, Linus Torvalds <torvalds@linuxfoundation.org>, 
	Nikolai Kondrashov <spbnick@gmail.com>, Maxime Ripard <mripard@kernel.org>, 
	Helen Koike <helen.koike@collabora.com>, linuxtv-ci@linuxtv.org, 
	dave.pigott@collabora.com, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-kselftest@vger.kernel.org, 
	gustavo.padovan@collabora.com, pawiecz@collabora.com, 
	tales.aparecida@gmail.com, workflows@vger.kernel.org, 
	kernelci@lists.linux.dev, skhan@linuxfoundation.org, 
	kunit-dev@googlegroups.com, nfraprado@collabora.com, davidgow@google.com, 
	cocci@inria.fr, Julia.Lawall@inria.fr, laura.nao@collabora.com, 
	ricardo.canuelo@collabora.com, kernel@collabora.com, 
	gregkh@linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 3, 2024 at 3:30=E2=80=AFAM Randy Dunlap <rdunlap@infradead.org>=
 wrote:
> On 3/2/24 14:10, Guenter Roeck wrote:
> > On Thu, Feb 29, 2024 at 12:21=E2=80=AFPM Linus Torvalds
> > <torvalds@linuxfoundation.org> wrote:
> >> On Thu, 29 Feb 2024 at 01:23, Nikolai Kondrashov <spbnick@gmail.com> w=
rote:
> >>>
> >>> However, I think a better approach would be *not* to add the .gitlab-=
ci.yaml
> >>> file in the root of the source tree, but instead change the very same=
 repo
> >>> setting to point to a particular entry YAML, *inside* the repo (somew=
here
> >>> under "ci" directory) instead.
> >>
> >> I really don't want some kind of top-level CI for the base kernel proj=
ect.
> >>
> >> We already have the situation that the drm people have their own ci
> >> model. II'm ok with that, partly because then at least the maintainers
> >> of that subsystem can agree on the rules for that one subsystem.
> >>
> >> I'm not at all interested in having something that people will then
> >> either fight about, or - more likely - ignore, at the top level
> >> because there isn't some global agreement about what the rules are.
> >>
> >> For example, even just running checkpatch is often a stylistic thing,
> >> and not everybody agrees about all the checkpatch warnings.
> >
> > While checkpatch is indeed of arguable value, I think it would help a
> > lot not having to bother about the persistent _build_ failures on
> > 32-bit systems. You mentioned the fancy drm CI system above, but they
> > don't run tests and not even test builds on 32-bit targets, which has
> > repeatedly caused (and currently does cause) build failures in drm
> > code when trying to build, say, arm:allmodconfig in linux-next. Most
> > trivial build failures in linux-next (and, yes, sometimes mainline)
> > could be prevented with a simple generic CI.
>
> Yes, definitely. Thanks for bringing that up.

+1

> > Sure, argue against checkpatch as much as you like, but the code
> > should at least _build_, and it should not be necessary for random
> > people to report build failures to the submitters.
>
> I do 110 randconfig builds nightly (10 each of 11 $ARCH/$BITS).
> That's about all the horsepower that I have. and I am not a CI.  :)
>
> So I see quite a bit of what you are saying. It seems that Arnd is
> in the same boat.

You don't even have to do your own builds (although it does help),
and can look at e.g. http://kisskb.ellerman.id.au/kisskb/

Kisskb can send out email when builds get broken, and when they get
fixed again.  I receive such emails for the m68k builds.
I have the feeling this is not used up to its full potential yet.
My initial plan with the "Build regressions/improvements in ..." emails
[1] was to fully automate this, and enable it for the other daily builds
(e.g. linux-next), too, but there are only so many hours in a day...

[1] https://lore.kernel.org/all/20240226081253.3688538-1-geert@linux-m68k.o=
rg/

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
