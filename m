Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FEE3D2EE
	for <kernelci@lists.linux.dev>; Wed, 16 Aug 2023 10:11:06 +0000 (UTC)
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-6bca857accbso5362761a34.0
        for <kernelci@lists.linux.dev>; Wed, 16 Aug 2023 03:11:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692180666; x=1692785466;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m88hfTY7ZX8PorgbUqZ8SmbWM9cMFxThUekcSoFTGW0=;
        b=MTkg+fhC9RPgAzF3vJhCFNTfunsGS7iJXADueSUvpiodRYfQhrUFML5AMOTFll5vyE
         xssa45pBePFOm1xd+meBpODj8TEEWwN6d+owggna02NuJ4yGwg1Ge1CP8neacf7uIIcs
         uXvKpp7LachFP6djieNAj9Xiu62y9N+DPyJHxWiR/0GegoojaS6wF8I8tzwvVmhbuivZ
         Nwzb5t7oaeWTaAhSGC/SP9rRxxQDdidVvL9AvAn82DfLAHx6uJKUIVDwrTbopfi4V0SX
         UjrBU/kwNoWKSGBhgcBAhn7QOgG1kPYbKsCkDvkn98p/JgZ7K/v0n4MnTySZ18BYbEka
         3INQ==
X-Gm-Message-State: AOJu0YyAxRsqJwqpILwRSKYe9SZSQGO6E1WhtMFd/aTz3ZiGbKZSz93y
	jeAC5zxosOjFOn52LdwGxFAjbawkVWWE3g==
X-Google-Smtp-Source: AGHT+IGlBhHzKsNJdRJYIHu74zgvRMkIeb+RRus4QAT7fuIwz8q/nSCry01VlraW9K9iUR1xrd1enw==
X-Received: by 2002:a05:6830:1e44:b0:6b9:b985:2892 with SMTP id e4-20020a0568301e4400b006b9b9852892mr1195258otj.17.1692180665956;
        Wed, 16 Aug 2023 03:11:05 -0700 (PDT)
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com. [209.85.167.180])
        by smtp.gmail.com with ESMTPSA id y14-20020a056830108e00b006bc8b4a41dfsm5955202oto.3.2023.08.16.03.11.05
        for <kernelci@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Aug 2023 03:11:05 -0700 (PDT)
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-3a7aedc57ffso4961029b6e.2
        for <kernelci@lists.linux.dev>; Wed, 16 Aug 2023 03:11:05 -0700 (PDT)
X-Received: by 2002:a05:6358:280b:b0:133:7c4:e752 with SMTP id
 k11-20020a056358280b00b0013307c4e752mr1517746rwb.26.1692180665426; Wed, 16
 Aug 2023 03:11:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220613094924.913340374@linuxfoundation.org> <20220613094928.793712131@linuxfoundation.org>
 <6283c4b1-2513-207d-4ed6-fdabf3f3880e@collabora.com>
In-Reply-To: <6283c4b1-2513-207d-4ed6-fdabf3f3880e@collabora.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 16 Aug 2023 12:10:53 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVrWotHv5qTW0j_=uZsmwv7Vrkg-rm-=U=YbffsSfwfCg@mail.gmail.com>
Message-ID: <CAMuHMdVrWotHv5qTW0j_=uZsmwv7Vrkg-rm-=U=YbffsSfwfCg@mail.gmail.com>
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

Hi Shreeya,

On Wed, Aug 16, 2023 at 11:39=E2=80=AFAM Shreeya Patel
<shreeya.patel@collabora.com> wrote:
> On 13/06/22 15:40, Greg Kroah-Hartman wrote:
> > From: Saravana Kannan<saravanak@google.com>
> >
> > [ Upstream commit 5ee76c256e928455212ab759c51d198fedbe7523 ]
> >
> > Mounting NFS rootfs was timing out when deferred_probe_timeout was
> > non-zero [1].  This was because ip_auto_config() initcall times out
> > waiting for the network interfaces to show up when
> > deferred_probe_timeout was non-zero. While ip_auto_config() calls
> > wait_for_device_probe() to make sure any currently running deferred
> > probe work or asynchronous probe finishes, that wasn't sufficient to
> > account for devices being deferred until deferred_probe_timeout.
> >
> > Commit 35a672363ab3 ("driver core: Ensure wait_for_device_probe() waits
> > until the deferred_probe_timeout fires") tried to fix that by making
> > sure wait_for_device_probe() waits for deferred_probe_timeout to expire
> > before returning.
> >
> > However, if wait_for_device_probe() is called from the kernel_init()
> > context:
> >
> > - Before deferred_probe_initcall() [2], it causes the boot process to
> >    hang due to a deadlock.
> >
> > - After deferred_probe_initcall() [3], it blocks kernel_init() from
> >    continuing till deferred_probe_timeout expires and beats the point o=
f
> >    deferred_probe_timeout that's trying to wait for userspace to load
> >    modules.
> >
> > Neither of this is good. So revert the changes to
> > wait_for_device_probe().
> >
> > [1] -https://lore.kernel.org/lkml/TYAPR01MB45443DF63B9EF29054F7C41FD8C6=
0@TYAPR01MB4544.jpnprd01.prod.outlook.com/
> > [2] -https://lore.kernel.org/lkml/YowHNo4sBjr9ijZr@dev-arch.thelio-3990=
X/
> > [3] -https://lore.kernel.org/lkml/Yo3WvGnNk3LvLb7R@linutronix.de/
>
> Hi Saravana, Greg,
>
>
> KernelCI found this patch causes the baseline.bootrr.deferred-probe-empty=
 test to fail on r8a77960-ulcb,
> see the following details for more information.

Commit 9be4cbd09da820a2 ("driver core: Set default deferred_probe_timeout
back to 0.") in v5.19 contains a reference to the same commit as
mentioned in the Fixes tag.  Does backporting that help?

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
