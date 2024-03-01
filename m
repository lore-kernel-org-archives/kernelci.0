Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A65D78825
	for <kernelci@lists.linux.dev>; Fri,  1 Mar 2024 18:15:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709316919; cv=none; b=S2qhag+m0/P9cBt1bgoma86ohjdHrmoHQk0rr3JEGot8JZ+mqvfwf3f+ofbmSWjf7yZ/mhl39bfA3QISnyCQAA2YbDyyAJD/GCtI/lqXmvHeMQcw+7DNp+DlQK6/WgTiiAPWUSGjrS2AOP5Rj55XKF1wa4pZgOlQLLtFaBSrtOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709316919; c=relaxed/simple;
	bh=ilD63mxz6Db+bQXMG5bdGNIi+lIsJcR3XDP61N4g+Q8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jyUGCZQ6zf8o+4/a9J57HPESHfHQqqQ4VCs6fmNwGRf9s4Y2KDkjrgc2JRA9P9D7S3NboCuTeiYPkHjQumwHo+xksA/J1MsFcRjO+HkD0t5pAF24LakU4RGtPKgQqLZjonzNJ2+jlgiITNCKm0bAXO2cRqxNP5N1cjAT7bESHuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=M375jIKw; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="M375jIKw"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-42e6939d34fso424101cf.0
        for <kernelci@lists.linux.dev>; Fri, 01 Mar 2024 10:15:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1709316916; x=1709921716; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ok/k6bG5z61hgRXgZ+F2/73YwYCA40OogdC0RM8E7XY=;
        b=M375jIKwh7i4s2XBciPGKCc4Oyr3lvZBfpvtR5l8qOTjQnEGwCMR0uRGA7V8wuIbiC
         0+nH69So9J4XW4UhK7x7B+tOgdejxhHnFS9JHPJAU+G707pBLbUTrIPgai14tQFLOXoq
         ToxWjmXzneEf4f5N3ID4smjJL0yD+P9eQzsl0DRKwyCSAXbtzAApqzxftiFhBWm6Wo7y
         3eq+TRbyWzO3PH028E2x6dFmCwBe6uyD3i/QgaiM1xphFm8YeSfyvzIGUh6nwEXOdDVv
         hgBe394sIBuKg7Kx183fNrorgGnKqGpshdzB9qaZqm+9C8pokYTu1xg/C1/zCcFu0Mkd
         IwbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709316916; x=1709921716;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ok/k6bG5z61hgRXgZ+F2/73YwYCA40OogdC0RM8E7XY=;
        b=fo+/iWeOeYHJPtA9Irf2hPUQNmAFZJf5cZGWu10BUZ081dRM4JhxYrer8rb6NzfhSk
         rv7ax1VX1Q3s8ibBwjH936XUczm2MuOQLovLgaqAmnE8rnw+pzYNtREILW9oi7nLU+SJ
         6hGGIoJa/oV728aZjbdh5fS6F+YxlDwrAiQLXNY0ORuormUhcvLxfd+qBW519R6OfXYb
         7a8C9abe9vOZYSFYhsyiVQuH3ooxYzL9w7TRaeA1mKfxPWxiiVxPbDAThM+vXl/0Qsr8
         X6DxfyuPYUt6fgkhC1hX+dcW2TZlvMYLom6BWRHZWcx3rNt9HZabBGmzsuew57WSQXCS
         VWYg==
X-Forwarded-Encrypted: i=1; AJvYcCXIL2QhVLZsJYwluNpy2dnx2c1Vm2FD2NqZzTFlxS9nFId1/4Bb8GnLPZUeds+XN77vFZ6rCONOcoEhxIbE/dmnvPNdtz8swf8=
X-Gm-Message-State: AOJu0Yx40FnOY1XtuKtdNIjO5rWoBsmj0JqERgA0sA2Xj57wzq4i6Zie
	sk7vWYhTQskm9/xdBBlZX8reZBnLTteb/ocymug3lvCFwvBrJ5HdON9hh/ErT4q/P2nr2tgrZNA
	jdZad/et4oWqCfLgRxGdqMNMDlWODDTtq6JUUtLXEB9jotrrPDQ==
X-Google-Smtp-Source: AGHT+IGct0hlkK6sxXiVKuPIMLnUxPde8rCvr53Ix4Z8lSZeQYQS4TMOyHI+5TS4JZiCyB7QVeeqbBvVResUBp2aWzo=
X-Received: by 2002:ac8:542:0:b0:42e:b6c4:f33a with SMTP id
 c2-20020ac80542000000b0042eb6c4f33amr159553qth.19.1709316916306; Fri, 01 Mar
 2024 10:15:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <131709e8-f804-5623-448d-7c3607be00e0@quicinc.com>
 <CAHRSSExm0P0kBF00R9Ft7-GVMcf0A9190mjeOWU4umKA3PL93A@mail.gmail.com>
 <CAHRSSEy20Zc80XufjYN4XjXbba6BTMHd_9kFaNOnhiuj9yEDsQ@mail.gmail.com>
 <YxCtqsY55Lwaj34H@sirena.org.uk> <CAHRSSEw9KqQFKZND1fmMa67btkozg0yA_0NjF8C=UiLnvfwHGA@mail.gmail.com>
 <YxXkuTdnt4IbPMDC@sirena.org.uk> <CAHRSSEzgEyPDxZ64SUdJNZRU3YAxS+mJcfVgG4-cSjjuTsH0Xg@mail.gmail.com>
 <9b4773cc-f68c-4e34-4688-92c968bfb66c@collabora.com> <CAHRSSEyrJeru4YKoAFUo2Ai1dmxQAxRTJ1gnAuY1OmxohF=5Gw@mail.gmail.com>
 <CAHRSSEztTzwRThMc1OfpP33r-V8=bNNP3fc_LD9_6eY9Ztj6sA@mail.gmail.com> <ff846cc6-f5f6-c886-4309-cd1b815bbeb8@collabora.com>
In-Reply-To: <ff846cc6-f5f6-c886-4309-cd1b815bbeb8@collabora.com>
From: Todd Kjos <tkjos@google.com>
Date: Fri, 1 Mar 2024 10:15:02 -0800
Message-ID: <CAHRSSEyEqyedEGsOfpPHso=ytHFTYHLbVGn601wDgb2LWGS7Gw@mail.gmail.com>
Subject: Re: UM-Linux compilation on Android Common Kernels
To: Guillaume Tucker <guillaume.tucker@collabora.com>
Cc: Mark Brown <broonie@kernel.org>, Elliot Berman <quic_eberman@quicinc.com>, 
	"kernelci@lists.linux.dev" <kernelci@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 13, 2023 at 12:08=E2=80=AFAM Guillaume Tucker
<guillaume.tucker@collabora.com> wrote:
>
> On 06/07/2023 19:00, Todd Kjos wrote:
> > Any progress on this? (at least doing the um builds?)
> >
> > On Thu, Mar 16, 2023 at 3:46=E2=80=AFPM Todd Kjos <tkjos@google.com <ma=
ilto:tkjos@google.com>> wrote:
> >
> >     On Thu, Sep 15, 2022 at 9:23=E2=80=AFAM Guillaume Tucker
> >     <guillaume.tucker@collabora.com <mailto:guillaume.tucker@collabora.=
com>> wrote:
> >     >
> >     > Hi Todd,
> >     >
> >     > On 14/09/2022 22:36, Todd Kjos via groups.io <http://groups.io> w=
rote:
> >     > > Is there an ETA for at least doing the builds?
> >     >
> >     > I don't think anyone else is asking for user-mode builds, and
> >     > adding this new architecture with a new sub-architecture
> >     > parameter is not as trivial as adding a few lines of YAML config.
> >     > So unless someone on this list is interested, or someone wants to
> >     > run an internship topic around that, I think you'll have to go
> >     > and find someone to do the work.
> >     >
> >     > KernelCI is starting to run KUnit which does involve UM-Linux
> >     > builds but that's all done "under the hood" by the KUnit
> >     > framework.  Still, I guess it would catch some build errors as a
> >     > side-effect.  So an alternative is to wait for that to be fully
> >     > in production (first half 2023) and we can consider enabling it
> >     > on some Android kernel trees.
> >
> >     Is this in production now?
>
> No, the timeline for making the new API & Pipeline as the new
> production system is basically bumped to 2024.  However, KUnit
> jobs are now being run every day on our staging instance and
> we're planning to have an "early access" stable instance online
> in the next couple of months.  I think we'll get back to you at
> that point.

Any update on the schedule for the new API/Pipeline or the "early access"?

>
> Thank you for your understanding.
>
> Best wishes,
> Guillaume
>
> >     > > On Mon, Sep 5, 2022 at 4:59 AM Mark Brown <broonie@kernel.org <=
mailto:broonie@kernel.org>> wrote:
> >     > >
> >     > >> On Thu, Sep 01, 2022 at 08:44:25AM -0700, Todd Kjos wrote:
> >     > >>> Could we start by building but not testing? That at least pre=
vents build
> >     > >>> breakage (which is the case that motivated this).
> >     > >>
> >     > >> Yes, that's definitely an easier first step.
> >     > >>
> >     > >
> >     > >
> >     > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >     > > Groups.io Links: You receive all messages sent to this group.
> >     > > View/Reply Online (#1593): https://groups.io/g/kernelci/message=
/1593 <https://groups.io/g/kernelci/message/1593>
> >     > > Mute This Topic: https://groups.io/mt/93087607/924702 <https://=
groups.io/mt/93087607/924702>
> >     > > Group Owner: kernelci+owner@groups.io <mailto:kernelci%2Bowner@=
groups.io>
> >     > > Unsubscribe: https://groups.io/g/kernelci/unsub <https://groups=
.io/g/kernelci/unsub> [guillaume.tucker@collabora.com <mailto:guillaume.tuc=
ker@collabora.com>]
> >     > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >     > >
> >     > >
> >     >
> >
>
