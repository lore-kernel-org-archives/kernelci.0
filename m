Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4842AFC0A
	for <kernelci@lists.linux.dev>; Wed, 16 Aug 2023 10:20:23 +0000 (UTC)
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-1c5451a1fbaso449496fac.1
        for <kernelci@lists.linux.dev>; Wed, 16 Aug 2023 03:20:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692181223; x=1692786023;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sRnD5MJxMIbxOVX7RD5xV6IP488gaBEltwZdndXE0OY=;
        b=bxzdhZvJJnQyJUpZNpFuQLYzP+Yxi9Sq+/A+fSM4uD0HMuXfM5zWEh9iw8qgD2Lmvp
         pCcXFyUes/erNyB0+N/1DqNF8D1p0dRKuWjj/s/kqkKFAjBKa/woN+LvHkwONK5KElK0
         X+Yt01IUwzYoBrUQOGVnL3lYb55tMyEwa8Ifxhu/UJj/LSgf4JUud6Wchzw8TjdIgaby
         BJ/sUTOalnhgcV8TJcuSOjjo+4KSojnBhM+NI4F9kI5FxvO5kR5T1Ylj2GwKArAuq7gd
         zLXiPrdsAbWbavVR8ygOIqjrIeLdq1i7XQj1hitTeynTRZJ2Nc7x20yUgrIXkIUaH3GC
         9mKA==
X-Gm-Message-State: AOJu0Yxexauo//sPsK8bsW18xeIQf0inQsn8+5q+tlWLlPSVvqkLwuGO
	EeaJ1Mm7OuK8+5OnCgi5r2kWC5/01Mxq5A==
X-Google-Smtp-Source: AGHT+IH/bGoP7MxY8uk0Z6fLeupliXNHcDWskRIUmweeB8FQwbodE5dXz79I3ngJ3btTCXjvdQ/Zhw==
X-Received: by 2002:a05:6870:8996:b0:1bb:951e:3d61 with SMTP id f22-20020a056870899600b001bb951e3d61mr1721293oaq.36.1692181222816;
        Wed, 16 Aug 2023 03:20:22 -0700 (PDT)
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com. [209.85.167.181])
        by smtp.gmail.com with ESMTPSA id v123-20020a4a5a81000000b0056d361ca33fsm6469904ooa.16.2023.08.16.03.20.22
        for <kernelci@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Aug 2023 03:20:22 -0700 (PDT)
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-3a76d882052so5052234b6e.0
        for <kernelci@lists.linux.dev>; Wed, 16 Aug 2023 03:20:22 -0700 (PDT)
X-Received: by 2002:a5b:e8f:0:b0:d62:b8f5:d745 with SMTP id
 z15-20020a5b0e8f000000b00d62b8f5d745mr1066703ybr.52.1692180913900; Wed, 16
 Aug 2023 03:15:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220613094924.913340374@linuxfoundation.org> <20220613094928.793712131@linuxfoundation.org>
 <6283c4b1-2513-207d-4ed6-fdabf3f3880e@collabora.com> <CAMuHMdVrWotHv5qTW0j_=uZsmwv7Vrkg-rm-=U=YbffsSfwfCg@mail.gmail.com>
In-Reply-To: <CAMuHMdVrWotHv5qTW0j_=uZsmwv7Vrkg-rm-=U=YbffsSfwfCg@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 16 Aug 2023 12:15:01 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXo-p3H2s+38bJzcg_MqjdBumO_cKkZu+uSeuusw_CBCw@mail.gmail.com>
Message-ID: <CAMuHMdXo-p3H2s+38bJzcg_MqjdBumO_cKkZu+uSeuusw_CBCw@mail.gmail.com>
Subject: Re: [PATCH 5.17 127/298] driver core: Fix wait_for_device_probe() &
 deferred_probe_timeout interaction
To: Shreeya Patel <shreeya.patel@collabora.com>
Cc: saravanak@google.com, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	stable@vger.kernel.org, John Stultz <jstultz@google.com>, 
	"David S. Miller" <davem@davemloft.net>, Alexey Kuznetsov <kuznet@ms2.inr.ac.ru>, 
	Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>, Jakub Kicinski <kuba@kernel.org>, Rob Herring <robh@kernel.org>, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Robin Murphy <robin.murphy@arm.com>, 
	Andy Shevchenko <andy.shevchenko@gmail.com>, Sudeep Holla <sudeep.holla@arm.com>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Naresh Kamboju <naresh.kamboju@linaro.org>, Basil Eljuse <Basil.Eljuse@arm.com>, 
	Ferry Toth <fntoth@gmail.com>, Arnd Bergmann <arnd@arndb.de>, 
	Anders Roxell <anders.roxell@linaro.org>, linux-pm@vger.kernel.org, 
	Nathan Chancellor <nathan@kernel.org>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Linus Torvalds <torvalds@linux-foundation.org>, Sasha Levin <sashal@kernel.org>, 
	linux-kernel@vger.kernel.org, 
	"gustavo.padovan@collabora.com" <gustavo.padovan@collabora.com>, 
	=?UTF-8?Q?Ricardo_Ca=C3=B1uelo_Navarro?= <ricardo.canuelo@collabora.com>, 
	Guillaume Charles Tucker <guillaume.tucker@collabora.com>, usama.anjum@collabora.com, 
	kernelci@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 16, 2023 at 12:10=E2=80=AFPM Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
> On Wed, Aug 16, 2023 at 11:39=E2=80=AFAM Shreeya Patel
> <shreeya.patel@collabora.com> wrote:
> > On 13/06/22 15:40, Greg Kroah-Hartman wrote:
> > > From: Saravana Kannan<saravanak@google.com>
> > >
> > > [ Upstream commit 5ee76c256e928455212ab759c51d198fedbe7523 ]
> > >
> > > Mounting NFS rootfs was timing out when deferred_probe_timeout was
> > > non-zero [1].  This was because ip_auto_config() initcall times out
> > > waiting for the network interfaces to show up when
> > > deferred_probe_timeout was non-zero. While ip_auto_config() calls
> > > wait_for_device_probe() to make sure any currently running deferred
> > > probe work or asynchronous probe finishes, that wasn't sufficient to
> > > account for devices being deferred until deferred_probe_timeout.
> > >
> > > Commit 35a672363ab3 ("driver core: Ensure wait_for_device_probe() wai=
ts
> > > until the deferred_probe_timeout fires") tried to fix that by making
> > > sure wait_for_device_probe() waits for deferred_probe_timeout to expi=
re
> > > before returning.
> > >
> > > However, if wait_for_device_probe() is called from the kernel_init()
> > > context:
> > >
> > > - Before deferred_probe_initcall() [2], it causes the boot process to
> > >    hang due to a deadlock.
> > >
> > > - After deferred_probe_initcall() [3], it blocks kernel_init() from
> > >    continuing till deferred_probe_timeout expires and beats the point=
 of
> > >    deferred_probe_timeout that's trying to wait for userspace to load
> > >    modules.
> > >
> > > Neither of this is good. So revert the changes to
> > > wait_for_device_probe().
> > >
> > > [1] -https://lore.kernel.org/lkml/TYAPR01MB45443DF63B9EF29054F7C41FD8=
C60@TYAPR01MB4544.jpnprd01.prod.outlook.com/
> > > [2] -https://lore.kernel.org/lkml/YowHNo4sBjr9ijZr@dev-arch.thelio-39=
90X/
> > > [3] -https://lore.kernel.org/lkml/Yo3WvGnNk3LvLb7R@linutronix.de/
> >
> > Hi Saravana, Greg,
> >
> >
> > KernelCI found this patch causes the baseline.bootrr.deferred-probe-emp=
ty test to fail on r8a77960-ulcb,
> > see the following details for more information.
>
> Commit 9be4cbd09da820a2 ("driver core: Set default deferred_probe_timeout
> back to 0.") in v5.19 contains a reference to the same commit as
> mentioned in the Fixes tag.  Does backporting that help?

Anyway, remembering the days (weeks?) spent in investigating
subtle issues with fw_devlinks and deferred probe, collecting all the
fixes for backporting to stable may be a very hard job...

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
