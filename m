Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41FA37995A
	for <kernelci@lists.linux.dev>; Mon,  4 Mar 2024 19:44:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709581478; cv=none; b=fAejs6knaiTMcMo2aiCqrGkzjUjAWuW++LEc/Lz5hiTSsXUBggL5Rbt0FLqy/j+jEYyV4Od48EziZ590MBjVoNSUtBA2FH47cabNAra+yItqeiCG8W5KsJCwkGg0eZMt2wMkdjA5nrNbBdkDdOc26YDTzkrK2Bx/wxuzU7XyRwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709581478; c=relaxed/simple;
	bh=aJziShSE5N9NFf9GEp25onUfKHjDILdb8pau9PDQq4s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oVFRbYICHRUDRxdKBzinTLaK3zWhuhRniOBU20ZnNDeTuGsHK9ZP+641f5a3wyUw9ce6sqnuO52EfgS0gTzj5D6blDebwlclQc956QFXSjcQKGRa+6yCeJ8UFAaS+QRdSOz+qR8BrUsML3YSXfRPJwKSEfTDU2dyEzWzvlNzro0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Vpxb9/tL; arc=none smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Vpxb9/tL"
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-42e6939d34fso69201cf.0
        for <kernelci@lists.linux.dev>; Mon, 04 Mar 2024 11:44:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1709581476; x=1710186276; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aJziShSE5N9NFf9GEp25onUfKHjDILdb8pau9PDQq4s=;
        b=Vpxb9/tLK1lv9zZyXp2OvWLfFxkFx1wUggfs7Pcg+CGLsamYGGJ9GbxQfZahjOYqMH
         LZTPeHMAs7aGwedyptvlM4XrxesExqTEoNjxVWHWNn+jBgZXGJIBjxOx5rMm8JrIH/u7
         32qzF2F4BiCvkpKmyDMFaZJpNJKVMbBToM3VukwYbrZPry1hsAVQ+ukTwXAEBaA1IwsS
         kaVVmu7lOcaFHcJrxz59n5nKAtFH2khkC+6O76Lh2xllX5+xpvjwsyE0+oGao2pJNaXi
         NEOYAlWzhkqUMgrbGWuc9V+kacy1sJISi+goCbfAhamcfZ1WU4ft12UTNfBAnNdZRUXU
         R7cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709581476; x=1710186276;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aJziShSE5N9NFf9GEp25onUfKHjDILdb8pau9PDQq4s=;
        b=W1LToXTars66mdTuIvUTprGq0x80KIt4dKpe2VA4et9IOMyhwe4Bds6jTeH+PRtosR
         O/WlUkIgkLEyYAaPyD2B1SR0IK6Inq5XRIDuHwKAon6ZL4PyKU5yQ86gKXfd/AmF0vHo
         Ti89WkHqMI+u+t5lBz29KR7fNgUUgG2HHB84Gqe0Fqce913kBA3LCMW1i4Vh2irv3zpI
         ADaffOfwwYeud8aj65oRuLveHaSxul0zRBHZMNnsmlrogjc2Q3P3H/Qs18XGOsHbdkVT
         fR3g/CVgiwZj+ZcfkdGdPyCgXLxgCRT+DFZOVjZwkrYngCbyiF9GZDnDbz5ym6KM0iNr
         kU1Q==
X-Forwarded-Encrypted: i=1; AJvYcCWKvdA4re8LHdDyd1/nKpyLLE/xEJLHr4gOtHCpa771vCbVlPH7PShDkRsbJ+RK/9A1lKP4DJEqCXIgcJj38aqjwkI+3tu8PE8=
X-Gm-Message-State: AOJu0YzPwfIX3Z8RPgDFJJ2b0R44IOfaTjBVJadqQqVa2/y0PuTie7Q6
	+e8S3pxxWZY8nlz5r0mvNg2K/Hk4lK69+J4j4O8EJz4nhqCRZuRxi9rwOVahDE0/Ax75ghPlTju
	eH1L5gTADJZmIaliOgaP4dA3cXXZWR5x2FOsG
X-Google-Smtp-Source: AGHT+IHCoxbqlkbvC40r/0Ghlkohpq677Z5qku5s52QYJ8GDMhK8thtW4dw5bCp5PdHftTKp8r3OdR4wiI1Sy39wTq4=
X-Received: by 2002:ac8:7f56:0:b0:42e:f958:ea67 with SMTP id
 g22-20020ac87f56000000b0042ef958ea67mr5712qtk.7.1709581476100; Mon, 04 Mar
 2024 11:44:36 -0800 (PST)
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
 <20240304-ludicrous-grinning-goldfish-090aac@houat> <CABXOdTeDydWO9mf2yxWjjebHZ1bE=R2HPs1P4XYwNhzznNKxmw@mail.gmail.com>
 <20240304-benevolent-brawny-urchin-0af0ad@houat>
In-Reply-To: <20240304-benevolent-brawny-urchin-0af0ad@houat>
From: Guenter Roeck <groeck@google.com>
Date: Mon, 4 Mar 2024 11:44:23 -0800
Message-ID: <CABXOdTcT+szLRMfx=3WFoXDirOmWCY7T+8Q+zZJ=B5GscpDNnQ@mail.gmail.com>
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

On Mon, Mar 4, 2024 at 9:09=E2=80=AFAM Maxime Ripard <mripard@kernel.org> w=
rote:

[ ...]

>
> And singling out DRM because it regularly allegedly breaks things on
> xtensa or m68k and claiming we're not taking CI seriously because of it
> is completely ridiculous. If the all the subsystems were taking CI as
> seriously as DRM, we would be in a much better place.
>

FWIW:

$ git grep CONFIG_DRM arch/xtensa/ arch/m68k/
arch/m68k/configs/virt_defconfig:CONFIG_DRM=3Dy
arch/m68k/configs/virt_defconfig:CONFIG_DRM_FBDEV_EMULATION=3Dy
arch/m68k/configs/virt_defconfig:CONFIG_DRM_VIRTIO_GPU=3Dy
arch/xtensa/configs/virt_defconfig:CONFIG_DRM=3Dy
arch/xtensa/configs/virt_defconfig:CONFIG_DRM_VGEM=3Dy
arch/xtensa/configs/virt_defconfig:CONFIG_DRM_VIRTIO_GPU=3Dy

If that isn't supported, it might really make sense to declare that
CONFIG_DRM depends on !xtensa and !m68k.

Guenter
