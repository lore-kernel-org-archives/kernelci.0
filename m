Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2A6119E7C4
	for <kernelci@lists.linux.dev>; Tue, 16 Jul 2024 15:18:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721143128; cv=none; b=C1vNcgn65RsxwvQX3yQH6mwgKnJ7hCK/B92z9psZ8rPFl7Zps6JLtWuZ8DPKqlEJgLOZytYf/jGSJCmqSZTD9rvS4/xOGEcfhv9QNAzU/FO/gBM+xtJBGT7vBb4aCloAtXK2yiIqGG7c3/daJs2LGJcdYA4EJXZBvJe8F9J3fds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721143128; c=relaxed/simple;
	bh=wcj5ZYab7PJJmz9UTFjcgt8ZdiB0EQoflbCYHF99+m4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UA/H2labXe5x1jw4mfRW+q5M5Wy8WdoLQa5z/1+aqKLzuWXncBUSiCGahR0b1N7Psu5ga47UYZ43w+T+/SkefvQr0fpiyqeHE07iEJSMRQmQ7Wzi1j1vsgmgpZrV6NrXSulOyP0tvhvuzc/u4Kf2+f4BVv6Bx6CJ4SFuu2f2ooo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=HLMLNVdW; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="HLMLNVdW"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-57a16f4b8bfso20745a12.0
        for <kernelci@lists.linux.dev>; Tue, 16 Jul 2024 08:18:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1721143125; x=1721747925; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vXyiq+ZjxAbZkSwJCEfwXu65ywzRD2Zau3KkDQF/aXA=;
        b=HLMLNVdWGRNX67n+RpkiClnKB/EObAucsTj56ZvuZqWyHO7js6UOGMu/cAI2CFIO4e
         uF9DUrXzWJucCGEvu0mdXyBmCU3C3ifuC869v9RAGEuFM1ZMvW2wyZ0S9oAmaKfdylL+
         79vSPPRLX8TlC/Loeo4IRxaOUtIvS8zn9z0r0jgZMm8P8+0QQY47wGIxg53VTKTwYquc
         DekmHg3E5246ZSMyEkH2QXUNfYl+t4JD5VQfL4yKLGrQQ6YJHaTr0LdSgWe96q61WY9S
         RHF4wyOFmFOsK4qHb50NspfhvQJJWK7s3Px+q0xXvohNMxX5xFb8pbGr5H5MXjgXiq2F
         2I2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721143125; x=1721747925;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vXyiq+ZjxAbZkSwJCEfwXu65ywzRD2Zau3KkDQF/aXA=;
        b=rqsAyEgbb4Ze17lrCwgGzqV8FMF15ytejAl1OBoe269uUQwf6FqeIp05WLOQqVi7BS
         Ugw2edpq5wdmSxUL2Cx3XqSDZDamGRZPo/gmAGljCRzMXhipzjK+zbMWdw4BQrz7n1S0
         BFxpccV2pvI/OHTqfZBNnhhK4JJNA19AEMzUlbpW0tAKTCHvW6aTUohnKWb357qANtQI
         gk1ItfmvFvVuX2SLLYyQNRHdhsP7wh99jHAuUkTytHb4wMfHuLBO50ujAp/BbH0Ukdp4
         2qQgoiycyiktPUMYsqUoOZe+dUJz8lyf5wVIiXj45mGi4MPQqNl2l+i2UI19g784gKDu
         xJGg==
X-Forwarded-Encrypted: i=1; AJvYcCX9hCSe/+8IP7HKxAUArhHecVDNpRrneDm+d42DhT1RPB0xrS/O7RROm8JWxF733g/0gHaPiGreBFeYSPI7giIPhx/hsY0RNrk=
X-Gm-Message-State: AOJu0YxsTm4U54/6wyvmgHBeTK2TN9acqLKgZoGUWWGcn5Ii34/L8Pc5
	FFlmXAfqGGH1zarKBwWwe6bnNeGCaUmrFz+xoXNMmdsxat4Rms7FVujqzDMMvfv1ab5E46TnM4h
	IwLNp+OOpj2TZBq+L+ieZEHGt9r19qFqMYB4x
X-Google-Smtp-Source: AGHT+IEEvgQW5BQPNz80O5vG/DpPs3YQ+K5Ju0eAzpFn9FUmheQXvQi64md6FB60Wmk99ac+13Xil1NVZ9cbhjxnTDc=
X-Received: by 2002:a05:6402:3553:b0:57c:c3a7:dab6 with SMTP id
 4fb4d7f45d1cf-59eed29cc7emr278756a12.3.1721143124992; Tue, 16 Jul 2024
 08:18:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <962098da-8dfe-8a77-169d-ac1b2902b8b8@collabora.com>
 <CAHRSSEyp35+k4v-ak1qp0vvUOWJjTnJkWhOtCO5MCS++zL2u6w@mail.gmail.com>
 <CAHRSSEwYk1oGmJEn5xvB91GKSmaJ_ku5D7hvbS00Jb9-piUbOQ@mail.gmail.com>
 <a5fef4b96be3c80aff75eb3b20e1edc90e8bfe42.camel@collabora.com>
 <CAHRSSEzfXJU=GcyC_HfUUnNQdyjT8S68HqhN1bdaB6NE0TPGsA@mail.gmail.com>
 <961641f4-e0ed-48da-8336-186e3b8d23ea@collabora.com> <CAHRSSEx+1=8N6wEDFwiXoR61q+oX-r9tGXJjJ6vtzJ4y21c1uA@mail.gmail.com>
 <CAHRSSEwO4M0KKwdVEwjBDQ4vjMrWcHYKUVX7f4D9P9wTe2LTUQ@mail.gmail.com>
 <CAHRSSExXLEaz9GpnBXGE383Rq_rzgxFjWqnsxX_fRGkj4848fA@mail.gmail.com>
 <bb6b9aba-04d4-4b36-a556-d52f44b12ed6@sirena.org.uk> <CAHRSSEypz9tgdeaFSXvVr=KZZdg=XY32zDkWT-dYi7N3z8Hh3w@mail.gmail.com>
 <95e1943a-d534-4ce4-ba3b-285a52684420@collabora.com> <CAHRSSEzRE2ZXui+uiq=eZvDRcdkjo2cKK7qO4nUTEFOo2cz15Q@mail.gmail.com>
 <01c856716324fd101de893554683c10db35db47e.camel@collabora.com>
 <CAHRSSEz_=hs_p=u4XCuGx2xpd36rkycOof7sOh0e1cXtnRXODA@mail.gmail.com> <ddbb549e-7964-4f55-8a7e-69140134b9c6@collabora.com>
In-Reply-To: <ddbb549e-7964-4f55-8a7e-69140134b9c6@collabora.com>
From: Todd Kjos <tkjos@google.com>
Date: Tue, 16 Jul 2024 08:18:29 -0700
Message-ID: <CAHRSSExNqUG8fTi=A2BNjqmxP=NicRqF5z1_sQNR5-BEW31=RQ@mail.gmail.com>
Subject: Re: new branch + more recent gcc?
To: Muhammad Usama Anjum <usama.anjum@collabora.com>
Cc: Mark Brown <broonie@kernel.org>, kernelci@lists.linux.dev, 
	Viktor Martensson <vmartensson@google.com>, Betty Zhou <bettyzhou@google.com>, 
	Denys Fedoryshchenko <denys.f@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 16, 2024 at 2:40=E2=80=AFAM Muhammad Usama Anjum
<usama.anjum@collabora.com> wrote:
>
> Hi Todd,
>
> It seems like some branches in android repository have been deprecated. W=
e
> are thinking of removing them from the KernelCI. Is it okay to do so? Or =
do
> you want us to continually running tests on these deprecated branches for=
 a
> little while? I'm not sure about the deprecation schedule for these.
>
> android_4.9-p, android_4.9-q-release, android_4.14-p,
> android_4.14-q-release, android_4.14-stable, android_4.19-q-release

Yes, all of these can be removed. android-4.14-stable too.

>
> Thanks,
> Usama
>
> On 7/11/24 10:20 PM, Todd Kjos wrote:
> > Denys, it looks like you fixed it. Thanks!
> >
> > On Tue, Jul 9, 2024 at 10:38=E2=80=AFAM Denys Fedoryshchenko
> > <denys.f@collabora.com> wrote:
> >>
> >> I am investigating cause, likely one of cross-compiler images is broke=
n
> >> and blocking k8s queue. It is likely will be fixed within few hours an=
d
> >> few more needed to clean the queue.
> >>
> >> Sorry for the hiccup.
> >>
> >> On Tue, 2024-07-09 at 10:02 -0700, Todd Kjos wrote:
> >>> Something isn't right. We've dropped from about 35 builds per android
> >>> kernel branch down to only 1-5 builds. Can we get all those other
> >>> builds back?
> >>>
> >>> See https://linux.kernelci.org/job/android/
> >>>
> >>>
> >>> On Wed, Jul 3, 2024 at 11:09=E2=80=AFPM Muhammad Usama Anjum
> >>> <usama.anjum@collabora.com> wrote:
> >>>>
> >>>> On 7/2/24 8:45 PM, Todd Kjos wrote:
> >>>>> On Tue, Jul 2, 2024 at 6:12=E2=80=AFAM Mark Brown <broonie@kernel.o=
rg>
> >>>>> wrote:
> >>>>>>
> >>>>>> On Mon, Jul 01, 2024 at 10:27:24AM -0700, Todd Kjos wrote:
> >>>>>>
> >>>>>>> 1) use gcc-13 instead of gcc-10 for android kernel builds
> >>>>>>
> >>>>>> It sounds like you just need an upgrade here rather than
> >>>>>> specifically
> >>>>>> GCC 13?  The reason I ask is that GCC 12 is the standard
> >>>>>> compiler in
> >>>>>> Debian Bookworm so might be easier to update to quickly.
> >>>>>
> >>>>> GCC 12 would be fine
> >>>>>
> >>>>>>
> >>>>>>> 2) add android15-6.6-lts branch to kernelci testing
> >>>>>>
> >>>>>> https://github.com/kernelci/kernelci-core/pull/2597
> >>>>>>
> >>>>>>> 3) discontinue all gki_defconfig builds
> >>>>>>
> >>>>>> https://github.com/kernelci/kernelci-core/pull/2598
> >>>>>>
> >>>>>> (not 100% sure I got that one right, have to see how it goes on
> >>>>>> staging.)
> >>>>>
> >>>>> Thanks!
> >>>>
> >>>> I've opened PR to enable android builds including android15-6.6-lts
> >>>> in new
> >>>> kernelci:
> >>>> https://github.com/kernelci/kernelci-pipeline/pull/667
> >>>>
> >>>>>
> >>>>
> >>>> --
> >>>> BR,
> >>>> Muhammad Usama Anjum
> >>>
> >>
>
> --
> BR,
> Muhammad Usama Anjum
