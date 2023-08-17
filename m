Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09A813239
	for <kernelci@lists.linux.dev>; Thu, 17 Aug 2023 18:34:05 +0000 (UTC)
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-40a47e8e38dso43671cf.1
        for <kernelci@lists.linux.dev>; Thu, 17 Aug 2023 11:34:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1692297244; x=1692902044;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rjwv8sslpW+2jt+7VuXCijBydYvuy0SecoEskGI9Hvg=;
        b=mRsOhspkMEK2n+R1CkVHVpfAMtm0Sa916XMiv4H+Cl59SviDwcTKHyeuTKgvsn/cSn
         8DB63ATRXXMz9K+aiTQpVKm8xMXQn6CK9v9j/RmnOMR+ovU+kce3K3Uv6r5O9zV6wwFK
         39Wbt3tnHL/Ri5TI1pbKgX3Gt/R5cOeeeYrMX8uUDCXGeLXwlLPywp2nr8eoEKVLPxaN
         dMm0ICQoYi36DAZKWQPevn4awNMHlS+/VCw3y+wArX9zIa4neFsfsDwQvkEEgPzH8IBj
         9N1DmZy3RdaI1iH7yJbG+eqVIE0S2lZfekgRMsX+ceHgxf6iJ2RsYHQRB+pZWi3a9iMY
         58aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692297244; x=1692902044;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Rjwv8sslpW+2jt+7VuXCijBydYvuy0SecoEskGI9Hvg=;
        b=VI3PVQ4bKkQmcXTmc1stpI3+s2Vj/F1eiRLHoSAwJmsjjz39c/iVgcWa0Dn9f1HZIe
         HqekfNI1N1BcF3cCQtgQIc+mFdO5s0bD0S35FwDf97g2uw6oWmM8qYohfafBkrXUqb7x
         xgEDix7F0ZgGzfoG2pn8+ThSIaH1bRM6/YHusGl/0GWlre3a6+F8JX56meyyuaIgphn6
         IXTX1YLDi8txpCZsDODaDRaEh5L4DHcqzyCJ85Q0y7rMUOcTisT0yDzPiLLQ4F0OwY8s
         CRqclPuS+w1wGYwf3DAn5FoLKLJTKITh5rxgSb6S+6Yal5dS8bszQT0vKDY3JVdiuRXg
         0ZCA==
X-Gm-Message-State: AOJu0YxW4fFlFFTrrrOKM8JZxdB61fx2ygHqSDItIaGJJFa0JvsDfm9M
	s9v6h1k6htrzqsttIF0l+GUrS/QZWDt/ZrlnHxod1A==
X-Google-Smtp-Source: AGHT+IEAoy+DC+ZtRcR24ffFRFO1j1wvaVNNo42ihSrViDhvZaj9joDlxOmKfTAV1k1Hmd0SLHtyhBIunqwuMP0wbPA=
X-Received: by 2002:a05:622a:1801:b0:404:8218:83da with SMTP id
 t1-20020a05622a180100b00404821883damr45742qtc.1.1692297244495; Thu, 17 Aug
 2023 11:34:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220613094924.913340374@linuxfoundation.org> <20220613094928.793712131@linuxfoundation.org>
 <6283c4b1-2513-207d-4ed6-fdabf3f3880e@collabora.com> <2023081619-slapping-congrats-8e85@gregkh>
 <471bf84d-9d58-befc-8224-359a62e29786@collabora.com>
In-Reply-To: <471bf84d-9d58-befc-8224-359a62e29786@collabora.com>
From: Saravana Kannan <saravanak@google.com>
Date: Thu, 17 Aug 2023 11:33:26 -0700
Message-ID: <CAGETcx-NVoN7b8XCV09ouof81XxZk4wtGhEcqcFAt6Gs=JWKdw@mail.gmail.com>
Subject: Re: [PATCH 5.17 127/298] driver core: Fix wait_for_device_probe() &
 deferred_probe_timeout interaction
To: Shreeya Patel <shreeya.patel@collabora.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org, 
	John Stultz <jstultz@google.com>, "David S. Miller" <davem@davemloft.net>, 
	Alexey Kuznetsov <kuznet@ms2.inr.ac.ru>, Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>, 
	Jakub Kicinski <kuba@kernel.org>, Rob Herring <robh@kernel.org>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, 
	Robin Murphy <robin.murphy@arm.com>, Andy Shevchenko <andy.shevchenko@gmail.com>, 
	Sudeep Holla <sudeep.holla@arm.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
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

On Thu, Aug 17, 2023 at 4:37=E2=80=AFAM Shreeya Patel
<shreeya.patel@collabora.com> wrote:
>
> Hi Greg,
>
> On 16/08/23 20:33, Greg Kroah-Hartman wrote:
> > On Wed, Aug 16, 2023 at 03:09:27PM +0530, Shreeya Patel wrote:
> >> On 13/06/22 15:40, Greg Kroah-Hartman wrote:
> >>> From: Saravana Kannan<saravanak@google.com>
> >>>
> >>> [ Upstream commit 5ee76c256e928455212ab759c51d198fedbe7523 ]
> >>>
> >>> Mounting NFS rootfs was timing out when deferred_probe_timeout was
> >>> non-zero [1].  This was because ip_auto_config() initcall times out
> >>> waiting for the network interfaces to show up when
> >>> deferred_probe_timeout was non-zero. While ip_auto_config() calls
> >>> wait_for_device_probe() to make sure any currently running deferred
> >>> probe work or asynchronous probe finishes, that wasn't sufficient to
> >>> account for devices being deferred until deferred_probe_timeout.
> >>>
> >>> Commit 35a672363ab3 ("driver core: Ensure wait_for_device_probe() wai=
ts
> >>> until the deferred_probe_timeout fires") tried to fix that by making
> >>> sure wait_for_device_probe() waits for deferred_probe_timeout to expi=
re
> >>> before returning.
> >>>
> >>> However, if wait_for_device_probe() is called from the kernel_init()
> >>> context:
> >>>
> >>> - Before deferred_probe_initcall() [2], it causes the boot process to
> >>>     hang due to a deadlock.
> >>>
> >>> - After deferred_probe_initcall() [3], it blocks kernel_init() from
> >>>     continuing till deferred_probe_timeout expires and beats the poin=
t of
> >>>     deferred_probe_timeout that's trying to wait for userspace to loa=
d
> >>>     modules.
> >>>
> >>> Neither of this is good. So revert the changes to
> >>> wait_for_device_probe().
> >>>
> >>> [1] -https://lore.kernel.org/lkml/TYAPR01MB45443DF63B9EF29054F7C41FD8=
C60@TYAPR01MB4544.jpnprd01.prod.outlook.com/
> >>> [2] -https://lore.kernel.org/lkml/YowHNo4sBjr9ijZr@dev-arch.thelio-39=
90X/
> >>> [3] -https://lore.kernel.org/lkml/Yo3WvGnNk3LvLb7R@linutronix.de/
> >> Hi Saravana, Greg,
> >>
> >>
> >> KernelCI found this patch causes the baseline.bootrr.deferred-probe-em=
pty test to fail on r8a77960-ulcb,
> >> see the following details for more information.
> >>
> >> KernelCI dashboard link:
> >> https://linux.kernelci.org/test/plan/id/64d2a6be8c1a8435e535b264/
> >>
> >> Error messages from the logs :-
> >>
> >> + UUID=3D11236495_1.5.2.4.5
> >> + set +x
> >> + export 'PATH=3D/opt/bootrr/libexec/bootrr/helpers:/lava-11236495/1/.=
./bin:/sbin:/usr/sbin:/bin:/usr/bin'
> >> + cd /opt/bootrr/libexec/bootrr
> >> + sh helpers/bootrr-auto
> >> e6800000.ethernet
> >> e6700000.dma-controller
> >> e7300000.dma-controller
> >> e7310000.dma-controller
> >> ec700000.dma-controller
> >> ec720000.dma-controller
> >> fea20000.vsp
> >> feb00000.display
> >> fea28000.vsp
> >> fea30000.vsp
> >> fe9a0000.vsp
> >> fe9af000.fcp
> >> fea27000.fcp
> >> fea2f000.fcp
> >> fea37000.fcp
> >> sound
> >> ee100000.mmc
> >> ee140000.mmc
> >> ec500000.sound
> >> /lava-11236495/1/../bin/lava-test-case
> >> <8>[   17.476741] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Ddeferred-probe-=
empty RESULT=3Dfail>
> >>
> >> Test case failing :-
> >> Baseline Bootrr deferred-probe-empty test -https://github.com/kernelci=
/bootrr/blob/main/helpers/bootrr-generic-tests
> >>
> >> Regression Reproduced :-
> >>
> >> Lava job after reverting the commit 5ee76c256e92
> >> https://lava.collabora.dev/scheduler/job/11292890
> >>
> >>
> >> Bisection report from KernelCI can be found at the bottom of the email=
.
> >>
> >> Thanks,
> >> Shreeya Patel
> >>
> >> #regzbot introduced: 5ee76c256e92
> >> #regzbot title: KernelCI: Multiple devices deferring on r8a77960-ulcb
> >>
> >> ----------------------------------------------------------------------=
---------------------------------------------------------------------------=
--
> >>
> >> * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * **
> >> * If you do send a fix, please include this trailer: *
> >> * Reported-by: "kernelci.org bot" <bot@...> *
> >> * *
> >> * Hope this helps! *
> >> * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
> >>
> >> stable-rc/linux-5.10.y bisection: baseline.bootrr.deferred-probe-empty=
 on
> >> r8a77960-ulcb
> > You are testing 5.10.y, yet the subject says 5.17?
> >
> > Which is it here?
>
> Sorry, I accidentally used the lore link for 5.17 while reporting this
> issue,
> but this test does fail on all the stable releases from 5.10 onwards.
>
> stable 5.15 :-
> https://linux.kernelci.org/test/case/id/64dd156a5ac58d0cf335b1ea/
> mainline :-
> https://linux.kernelci.org/test/case/id/64dc13d55cb51357a135b209/
>

Shreeya, can you try the patch Geert suggested and let us know if it
helps? If not, then I can try to take a closer look.

-Saravana
