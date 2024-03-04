Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78E3C4C600
	for <kernelci@lists.linux.dev>; Mon,  4 Mar 2024 16:17:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709569058; cv=none; b=VfwxEUKI52iMMfbP2+G6gJIm9+MHTftD7azJJvDjtfyDtJWWcfcz0jD75vhNi3PLL3cfPkxfMJiWqOvaSZjj3TfTSy/ECaV3E8Ow9H5uKTbe85gWcuuWtSHc4/+zBkTkdsytd4/Ze1/1Zb/TLZTKfcvH96pVgp52NhJ/N4d1HII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709569058; c=relaxed/simple;
	bh=pJO9gacEPP5sFMHLlJa9c2bsoqfYUttJAmzyO8JWUPM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HiUZc2X5IIuNxhCl3GRTpJWGDcDfrt9rrtAXAk8lkh8LGxVb7P39o1Nb665M3UhMgweA0F7aMkN0g9W7L3oh3uYYOoOEfY7/i6uuPwUnyGPGLqv7mESYgs99C7XZ9LMvWTDuKSIuH9H+IOqJFXRzdt8dk6Q5H7QCp/oOLcPt6sg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=mR6LP4zU; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="mR6LP4zU"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-428405a0205so1026071cf.1
        for <kernelci@lists.linux.dev>; Mon, 04 Mar 2024 08:17:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1709569055; x=1710173855; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pJO9gacEPP5sFMHLlJa9c2bsoqfYUttJAmzyO8JWUPM=;
        b=mR6LP4zUrsPvMVaUw4rQzMyKQhCmOVbEkxJKAE/gHJ/XciSkH9ac47w7HtYyD3ZyaD
         6UVyYChGJ+2gK3sxFsDW2H3cEWDakSoVOKiJ+78j1kwmW4sQtl96aPthzdGgwN8BMXQw
         su2SpveaIm8z1UTRS0j7Tm9JWEvYNdPNEgRovgv54CLqgEXCmgxTnZia/YBk+G3jOyAt
         vXlUiXJI4aOtLOhoMDcDai9+YpY5+J5OMWhAoc08BeuLkKTzxSglhn1vVVg4MG79Gp8g
         5Ukn60gRkIZEh3VP16uN8KL42TdhL0YTJC8OqGmgS7K9bJ+JzQ1xksJesAY6aUTP9M5r
         mEAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709569055; x=1710173855;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pJO9gacEPP5sFMHLlJa9c2bsoqfYUttJAmzyO8JWUPM=;
        b=wGi81yliDBUPnS479/uPtmdl+KP0gh+Ow+4S9pCD5HkpEqUkJaTUCEaTS9qe9/iCdw
         DLkGOXrAn589RuyJrmfms+FKq335Fe2YmvFJIDYPPefnBqGrssIeirac4yMYuHAqrfJG
         bJI3mPTYI8Tb8Ng46WmAZjjj8cRloOoA23i/6aNEVEuo7gKtxEufrjnym55DGIbf17mi
         DV1EXyBjABVhX0WrCCZywnX3NWYTD7kNjtfpAGM3nSbm322y9O64QDc8bzoHBgEIQ/oV
         RfMy7MKwi0MX5CLDkvW1ZTY0n3Q3ZtXWAeawHw1DFfZDHPkyzJTq93nDimUE9xgQpRej
         dPDw==
X-Forwarded-Encrypted: i=1; AJvYcCUn4QVbEPuVRz/Y/8t5sh+fMfhHlSO4z72ZFC9ERYou1H8t9wqnuao7a2hye3l9SvpkEf500wbQfjspZNns2ovW4rFydSY7IjQ=
X-Gm-Message-State: AOJu0YwANmAaHKFFMtEl4xmY3hrk3+MHetOc03IydxJROHukrE+Bw4tx
	K3aBSbPWcC+/yLbS0CHjzpLcgkFODIrrhLZ0RuZhNC6G0UYSUiZGwRqC1BXFp6jVZ6fQj+7Nb8p
	q1/owu9CyM2IZxTf/FZ22+7ShR1ELJcXJjb2o
X-Google-Smtp-Source: AGHT+IHbFr+UrpkmDyx9eEQjvWp5e9il7+Ss/3DBjwoc6vhBdezPC0MNPvzzn5kv1q0w0+yTuTK/ZwenVZtUrxnT/+s=
X-Received: by 2002:ac8:68a:0:b0:42e:9dd8:4a64 with SMTP id
 f10-20020ac8068a000000b0042e9dd84a64mr708152qth.18.1709569055283; Mon, 04 Mar
 2024 08:17:35 -0800 (PST)
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
 <20240304-rigorous-silkworm-of-awe-4eee8f@houat> <CABXOdTc4MXcjwgGuJb4_69-4OFELD37x0B6oMr=4z=nxZ2HPXQ@mail.gmail.com>
 <20240304-ludicrous-grinning-goldfish-090aac@houat>
In-Reply-To: <20240304-ludicrous-grinning-goldfish-090aac@houat>
From: Guenter Roeck <groeck@google.com>
Date: Mon, 4 Mar 2024 08:17:22 -0800
Message-ID: <CABXOdTeDydWO9mf2yxWjjebHZ1bE=R2HPs1P4XYwNhzznNKxmw@mail.gmail.com>
Subject: Re: [PATCH 1/3] kci-gitlab: Introducing GitLab-CI Pipeline for Kernel Testing
To: Maxime Ripard <mripard@kernel.org>
Cc: Linus Torvalds <torvalds@linuxfoundation.org>, Nikolai Kondrashov <spbnick@gmail.com>, 
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

On Mon, Mar 4, 2024 at 8:05=E2=80=AFAM Maxime Ripard <mripard@kernel.org> w=
rote:
>
> On Mon, Mar 04, 2024 at 07:46:34AM -0800, Guenter Roeck wrote:
> > On Mon, Mar 4, 2024 at 1:24=E2=80=AFAM Maxime Ripard <mripard@kernel.or=
g> wrote:
> > [ ... ]
> > >
> > > If anything, it's more of a side-effect to the push for COMPILE_TEST
> > > than anything.
> > >
> >
> > If the drm subsystem maintainers don't want people to build it with
> > COMPILE_TEST while at the same time not limiting it to platforms where
> > it doesn't even build, I'd suggest making it dependent on
> > !COMPILE_TEST.
>
> I don't think we want anything. My point was that you can't have an
> option that is meant to explore for bad practices and expose drivers
> that don't go through the proper abstraction, and at the same time
> complain that things gets broken. It's the whole point of it.
>
Can we get back to the original problem, please ?

Build errors such as failed 32-bit builds are a nuisance for those
running build tests. It seems to me that an automated infrastructure
to prevent such build errors from making it into the kernel should be
desirable. You seem to disagree, and at least it looked like you
complained about the existence of COMPILE_TEST, or that people are
doing COMPILE_TEST builds. What is your suggested alternative ?
Disabling build tests on drm doesn't seem to be it, and it seems you
don't like the idea of a basic generic CI either, but what is it ?

> > The same applies to all other subsystems where maintainers don't want
> > build tests to run but also don't want to add restrictions such as
> > "64-bit only". After all, this was just one example.
>
> We have drivers for some 32 bits platforms.
>
I said "such as". Again, that was an example. In this case it would
obviously only apply to parts of drm which are not supported on 32-bit
systems (and, presumably, the parts of drm which are supposed to be
supported on 32-bit systems should build on those).

Thanks,
Guenter
