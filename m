Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F426383B4
	for <kernelci@lists.linux.dev>; Mon,  4 Mar 2024 11:13:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709550784; cv=none; b=HKAWXPg0JkaHeZlj4Xm0aMB6IH6raO263of4P2/M3cFNWQt1iXo4kAhTN1Rzi+jAvXwGvQUKQISOju05Nu7OL9MTs5rSe/b677txIGBVSAFLnsPtn9zlZWzKnHoAeddTHoJjLewH3KvV2TXpH4IkIoXQzWuNXZRz1Hw0HNJgmyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709550784; c=relaxed/simple;
	bh=BCy0Hx88WwhmnHSyuJBBAaJRbV8fYrG9jlRMWdx1Egg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OOJVjRGilJemrqUz8FLc3+bt0+TRBqGzZlyyLD+ioKxK6zPE9er5fIxZqhEoc7ArZBX6OnX1dDT5VxkLDPzGTYlsbX6Uf7IuMIK8yPk3xoc8QinHohPvsdZ1bnib1jqZKSgb03+d1cxT7U2y4W5pz9wXYP7meoCZ0nOBwkMbQDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-6098bf69909so20326047b3.1
        for <kernelci@lists.linux.dev>; Mon, 04 Mar 2024 03:13:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709550780; x=1710155580;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X8dLsJKtv+8j8qXEd3qFacsSzLxPyFjQtVyNStvTTTM=;
        b=OblrQtE2k1QsqlLJDJBT1E1eTyanvFJ7i0M+fWXqUC9ap9O39Fee82/WkQIIHy98qC
         Vom66h+UWth7TzDA42IF+BrlweJ+C7ZU6qJAQFM5hIhCLvYPWqO+idQ01ZnZcR3yRvcs
         GyQ5bhdtcImp92qpE6lQKwFBwyXeWBUzkIu/P8lhh2mU4wzrnvVHr9QeCmoCasqNzFHS
         SpMQ5FwqAJoWuBm+0qY0+30gmfIas3BTAmjlCkD60Q6drRIchk8WqoCiKLVBV9aOPQfC
         W14I2ZTlQfO4slWWXQ2OL4m168AOgu7/feMOxj1wEnlacB3h27prQ/YTYyqSqiTpEOE5
         OtUQ==
X-Forwarded-Encrypted: i=1; AJvYcCWGHsT1hi3yxaFVjpJ8TQalEVRJhzbrCCCBLl3LlC5YD8/EvLVjShJi8Ug5eX/yKiJoxHR6tRkICm9k04353ntGx7NKhQOOpSg=
X-Gm-Message-State: AOJu0YxrsU+PJjftVeSarTIEgrx60IOpOy0aWzGoihYOSy9bdjIAG0hG
	6vrbdeV5rRO6tZ1t23ZzZyIbTipBbulylH8EuA9VvMizESTBk2zEXDIomt6LXg4=
X-Google-Smtp-Source: AGHT+IEI9kq/8/3F2lG65OexSb7kawkJU+NM9bfFObK0Jw9N5E3SJLH7Kxd9bwB53/Lix5+gmqyW7g==
X-Received: by 2002:a81:5212:0:b0:609:b154:49e4 with SMTP id g18-20020a815212000000b00609b15449e4mr1064951ywb.3.1709550780079;
        Mon, 04 Mar 2024 03:13:00 -0800 (PST)
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com. [209.85.219.181])
        by smtp.gmail.com with ESMTPSA id u13-20020a252e0d000000b00dc9c5991ecdsm2099504ybu.50.2024.03.04.03.12.59
        for <kernelci@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Mar 2024 03:12:59 -0800 (PST)
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-dbed179f0faso3679945276.1
        for <kernelci@lists.linux.dev>; Mon, 04 Mar 2024 03:12:59 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXnMaTxxlIsKsuKxVVOfw69RScYOt0yTU/a4YktvAlDUNsFH0Td9yNzY+JOGyCLk+vn4oR0RU7uk8kQDUWjEQermEs9XJsQdys=
X-Received: by 2002:a25:ab44:0:b0:dcc:55e9:ec34 with SMTP id
 u62-20020a25ab44000000b00dcc55e9ec34mr4965526ybi.30.1709550779663; Mon, 04
 Mar 2024 03:12:59 -0800 (PST)
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240228225527.1052240-2-helen.koike@collabora.com>
 <20240229-dancing-laughing-groundhog-d85161@houat> <5d7ed81b-37f9-48e9-ab7e-484b74ca886c@gmail.com>
 <CAHk-=wixVy3WYvjbt43ZSrCqPDsS76QJQSkXFbbPsAOs1MCSAQ@mail.gmail.com>
 <CABXOdTeT2ip1uS2EG2w8pW7254Tnd=ZDNz-KC61-G-yqDTVgJA@mail.gmail.com>
 <269232e6-41c9-4aa1-9320-662beabcd69b@infradead.org> <CAMuHMdXuXV9WV3aANFTteuP8Q3JY6R5OWsVBedGOP7e_JguxqA@mail.gmail.com>
 <CAMuHMdWi069YAvOoXe7sHJ_o702tY4tDQgL3sfApPR3aCnZboQ@mail.gmail.com>
 <20240304-transparent-oriole-of-honeydew-f4174e@houat> <CAMuHMdXyvcyXw8eXc2MONNaBYYGpVdnPh2h3T=QV38MEUzhu9A@mail.gmail.com>
 <20240304-dangerous-mastiff-of-fury-1fac5c@houat>
In-Reply-To: <20240304-dangerous-mastiff-of-fury-1fac5c@houat>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 4 Mar 2024 12:12:47 +0100
X-Gmail-Original-Message-ID: <CAMuHMdV2HkYjowOZBgSZQ3N01UeUTnyv5kjx-82C9YJ+dsgsxQ@mail.gmail.com>
Message-ID: <CAMuHMdV2HkYjowOZBgSZQ3N01UeUTnyv5kjx-82C9YJ+dsgsxQ@mail.gmail.com>
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

On Mon, Mar 4, 2024 at 11:20=E2=80=AFAM Maxime Ripard <mripard@kernel.org> =
wrote:
> On Mon, Mar 04, 2024 at 11:07:22AM +0100, Geert Uytterhoeven wrote:
> > On Mon, Mar 4, 2024 at 10:15=E2=80=AFAM Maxime Ripard <mripard@kernel.o=
rg> wrote:
> > > On Mon, Mar 04, 2024 at 09:12:38AM +0100, Geert Uytterhoeven wrote:
> > > > On Sun, Mar 3, 2024 at 10:30=E2=80=AFAM Geert Uytterhoeven <geert@l=
inux-m68k.org> wrote:
> > > > ERROR: modpost: "__udivdi3" [drivers/gpu/drm/sun4i/sun4i-drm-hdmi.k=
o] undefined!
> > > > make[3]: *** [scripts/Makefile.modpost:145: Module.symvers] Error 1
> > > > make[2]: *** [Makefile:1871: modpost] Error 2
> > > > make[1]: *** [Makefile:240: __sub-make] Error 2
> > > > make: *** [Makefile:240: __sub-make] Error 2
> > > >
> > > > No warnings found in log.
> > > > -------------------------------------------------------------------=
>8---
> > >
> > > The driver is meant for a controller featured in an SoC with a Cortex=
-A8
> > > ARM CPU and less than a GiB/s memory bandwidth.
> >
> > Good, so the hardware cannot possibly need 64-bit pixel clock values ;-=
)
>
> This is an early patch to convert that function into a framework hook
> implementation. HDMI 2.1 has a max TMDS character rate of slightly less
> than 6GHz, so larger than 2^32 - 1.
>
> So yes, this driver doesn't need to. The framework does however.

That's gonna be interesting, as the Common Clock Framework does not
support 64-bit clock rates on 32-bit platforms yet...

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
