Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF73818EAD
	for <kernelci@lists.linux.dev>; Mon,  4 Mar 2024 10:07:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709546859; cv=none; b=ESMVxLVMvAIdV+rLxhoK3JwYzsMG6+hXYswE+jdHmxw/BKZ2XEgN8TiE0SJ7tX2HiXvJ6tU3mGk73XX0LY5WWX0el0o1RxNoC9jlt9noDu2Gu9sTzS5NVvmEJLZ0WXwBnjrEAijpAEEUWa1ZdoMV/5mr/VMI7zi+6Xf/79ZX4GI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709546859; c=relaxed/simple;
	bh=ItdYRVoq54OKq2AVn5zcTMjjQ4E7x0re7IeusVb+ZrE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ra27a2hAkzZ2q7G1tdT5BJu8E2IJ1m3NkkQgvjbzaD6SuV1IdlXfbiF3h1RpDoISrDwn7aGiHmdpHlv1pRjQGqrShwbg4FqbxBCBoJm2Gb0FJJgkzyt9jxsW+n1dXeoTUQ+Kmh6A/XKtC+2tA+Www8gvzvrVyd7yQxJ4Gr0KYe4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-6095dfcb461so40086637b3.2
        for <kernelci@lists.linux.dev>; Mon, 04 Mar 2024 02:07:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709546856; x=1710151656;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ER0dUVit3cfqDNJxrJfG+KdxGIXN2zcWnKvfnV+eZ4A=;
        b=li3RMfF5zivWTpg4AHFh11dE1aPAn/ooveQ+biiN2W4cEzaSs9EjKSROoljqKI/fhA
         aT4Ftq1cBrzTM1fUFlrYoo41kOtAY6lRjWSrkFK3UYHzBcVsNu7iki1tBOlmwz/7zkzP
         7uhrTrwYUdQgPAV7s4j8Lda/4jqZiIgTydW+QPSXfiZAD88PPQ4Px0HoKOp1NColo3md
         VlUUA3G0ThtHIaNrzqKAo2lsAmO/I8QrQjhKbJS5ElHaY0LdelY9pk6IGvuRcbboqt6G
         a+zn+ujFqzmUYiEeK1+YZGQN0uZthPTI0Z7KuV72maof8LyECc2Xyia4RvCB7olV+dWq
         sI6Q==
X-Forwarded-Encrypted: i=1; AJvYcCW+wnNsyWrmARENZCtLYXMXjv7+6QCDxNMMDOsx3R+/iV9H2q2GlZBlwOY+LC1l/4aWXsRx2MsOY3b8YCGzcA31q/E83wyCJ00=
X-Gm-Message-State: AOJu0YwfB4EeV46fd/TXnG4IRxaGeNuEzaYjP6EuQ12BSrAs6Hf2FW6y
	+ecbn0gTiiDU3IBCLOeoYnkzK0+aSP7YpCbPUVLRlyCsbY3tNuSxFcZoNTsaKxk=
X-Google-Smtp-Source: AGHT+IHMj4dRvoQoRfXDtlrIhKN1nq4RMu5gh6pnsJ3oC36sskbE6KKTIlTsHSc5r8fhSyjQZmeHKw==
X-Received: by 2002:a0d:e892:0:b0:609:2c0e:7afc with SMTP id r140-20020a0de892000000b006092c0e7afcmr7603238ywe.20.1709546855908;
        Mon, 04 Mar 2024 02:07:35 -0800 (PST)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com. [209.85.128.172])
        by smtp.gmail.com with ESMTPSA id z13-20020a814c0d000000b00607b37e2c74sm2528931ywa.118.2024.03.04.02.07.35
        for <kernelci@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Mar 2024 02:07:35 -0800 (PST)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-60983233a0dso32844577b3.3
        for <kernelci@lists.linux.dev>; Mon, 04 Mar 2024 02:07:35 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWod2+Ej60TOO6LZQWRSTqunZE21+v5fy7K9Jc4YAkfSKavnOzf8JEsQkT1pEtMsjlQILyZJ7Aedqy8HJXx2cKmvcbGIm4v8KY=
X-Received: by 2002:a81:9856:0:b0:609:7e98:1562 with SMTP id
 p83-20020a819856000000b006097e981562mr6776283ywg.38.1709546855021; Mon, 04
 Mar 2024 02:07:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240228225527.1052240-1-helen.koike@collabora.com>
 <20240228225527.1052240-2-helen.koike@collabora.com> <20240229-dancing-laughing-groundhog-d85161@houat>
 <5d7ed81b-37f9-48e9-ab7e-484b74ca886c@gmail.com> <CAHk-=wixVy3WYvjbt43ZSrCqPDsS76QJQSkXFbbPsAOs1MCSAQ@mail.gmail.com>
 <CABXOdTeT2ip1uS2EG2w8pW7254Tnd=ZDNz-KC61-G-yqDTVgJA@mail.gmail.com>
 <269232e6-41c9-4aa1-9320-662beabcd69b@infradead.org> <CAMuHMdXuXV9WV3aANFTteuP8Q3JY6R5OWsVBedGOP7e_JguxqA@mail.gmail.com>
 <CAMuHMdWi069YAvOoXe7sHJ_o702tY4tDQgL3sfApPR3aCnZboQ@mail.gmail.com> <20240304-transparent-oriole-of-honeydew-f4174e@houat>
In-Reply-To: <20240304-transparent-oriole-of-honeydew-f4174e@houat>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 4 Mar 2024 11:07:22 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXyvcyXw8eXc2MONNaBYYGpVdnPh2h3T=QV38MEUzhu9A@mail.gmail.com>
Message-ID: <CAMuHMdXyvcyXw8eXc2MONNaBYYGpVdnPh2h3T=QV38MEUzhu9A@mail.gmail.com>
Subject: Re: [PATCH 1/3] kci-gitlab: Introducing GitLab-CI Pipeline for Kernel Testing
To: Maxime Ripard <mripard@kernel.org>
Cc: Randy Dunlap <rdunlap@infradead.org>, Guenter Roeck <groeck@google.com>, 
	Linus Torvalds <torvalds@linuxfoundation.org>, Nikolai Kondrashov <spbnick@gmail.com>, 
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

Hi Maxime,

On Mon, Mar 4, 2024 at 10:15=E2=80=AFAM Maxime Ripard <mripard@kernel.org> =
wrote:
> On Mon, Mar 04, 2024 at 09:12:38AM +0100, Geert Uytterhoeven wrote:
> > On Sun, Mar 3, 2024 at 10:30=E2=80=AFAM Geert Uytterhoeven <geert@linux=
-m68k.org> wrote:
> > > On Sun, Mar 3, 2024 at 3:30=E2=80=AFAM Randy Dunlap <rdunlap@infradea=
d.org> wrote:
> > > > On 3/2/24 14:10, Guenter Roeck wrote:
> > > > > While checkpatch is indeed of arguable value, I think it would he=
lp a
> > > > > lot not having to bother about the persistent _build_ failures on
> > > > > 32-bit systems. You mentioned the fancy drm CI system above, but =
they
> > > > > don't run tests and not even test builds on 32-bit targets, which=
 has
> > > > > repeatedly caused (and currently does cause) build failures in dr=
m
> > > > > code when trying to build, say, arm:allmodconfig in linux-next. M=
ost
> > > > > trivial build failures in linux-next (and, yes, sometimes mainlin=
e)
> > > > > could be prevented with a simple generic CI.
> > > >
> > > > Yes, definitely. Thanks for bringing that up.
> > >
> > > +1
> >
> > > Kisskb can send out email when builds get broken, and when they get
> > > fixed again.  I receive such emails for the m68k builds.
> >
> > Like this (yes, one more in DRM; sometimes I wonder if DRM is meant onl=
y
> > for 64-bit little-endian platforms with +200 GiB/s memory bandwidth):
> >
> > ---8<------------------------------------------------------------------=
-
> > Subject: kisskb: FAILED linux-next/m68k-allmodconfig/m68k-gcc8 Mon Mar =
04, 06:35
> > To: geert@linux-m68k.org
> > Date: Mon, 04 Mar 2024 08:05:14 -0000
> >
> > FAILED linux-next/m68k-allmodconfig/m68k-gcc8 Mon Mar 04, 06:35
> >
> > http://kisskb.ellerman.id.au/kisskb/buildresult/15135537/
> >
> > Commit:   Add linux-next specific files for 20240304
> >           67908bf6954b7635d33760ff6dfc189fc26ccc89
> > Compiler: m68k-linux-gcc (GCC) 8.5.0 / GNU ld (GNU Binutils) 2.36.1
> >
> > Possible errors
> > ---------------
> >
> > ERROR: modpost: "__udivdi3" [drivers/gpu/drm/sun4i/sun4i-drm-hdmi.ko] u=
ndefined!
> > make[3]: *** [scripts/Makefile.modpost:145: Module.symvers] Error 1
> > make[2]: *** [Makefile:1871: modpost] Error 2
> > make[1]: *** [Makefile:240: __sub-make] Error 2
> > make: *** [Makefile:240: __sub-make] Error 2
> >
> > No warnings found in log.
> > ------------------------------------------------------------------->8--=
-
>
> The driver is meant for a controller featured in an SoC with a Cortex-A8
> ARM CPU and less than a GiB/s memory bandwidth.

Good, so the hardware cannot possibly need 64-bit pixel clock values ;-)

BTW, doesn't the build fail on arm32, too?


> And I just sent a fix for that one, thanks for the report.

Thanks!

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
