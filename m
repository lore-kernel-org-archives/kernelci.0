Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A2DD47793
	for <kernelci@lists.linux.dev>; Mon,  4 Mar 2024 15:46:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709567209; cv=none; b=SZOsFXp2QeluhDU+PKiUPLSr44GhIEExDHDAxgjepFMXc2lUVWTifNGHj3N0dhq/EU+UBYDco6LtcKEsEOTDEn8bRLg6Mmu/25HzoVc2iJOefZI4mQ0BrrtIy0rdqLV9SHgmZZ+TWxUbnkgdRPYjlTNhXVvnhMjs/0Ps0u5/0XU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709567209; c=relaxed/simple;
	bh=FmYFhieBdwNBCdmRDPjUD9GHVVYPw43TwbCvph3PCyc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oSid44fei69FP0bIicTAkL/E2qbp4Ktcn+2DGzPQKktZDz65T+XI5xKlbtEitopDXnFXDucfwOap1GdLsrYXuzOJ6+mrOpjLGOMETO7k/abn6ubJQvIjpXcdbo/46Hc/g6luDSH5dGNgpQFTEgZI0NV95nZHJdfrVBRavr/drxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=OuDf8oeS; arc=none smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="OuDf8oeS"
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-42e6939d34fso1035261cf.0
        for <kernelci@lists.linux.dev>; Mon, 04 Mar 2024 07:46:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1709567207; x=1710172007; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FmYFhieBdwNBCdmRDPjUD9GHVVYPw43TwbCvph3PCyc=;
        b=OuDf8oeShn3XkhY9qJD2/tazbKZMI8bVBHwGVm9ovJfBgxyvGRbLvvfDd4uD2d/Qib
         Ryx0YssHut+4H9j1b4+ftJ+RbAYCHMowSWRjV9TiLFXr+SP47xduX7B832y6ufFkiXx0
         T49Q5Ll+z+0zt14aMBsXnq7KW40OAqiV70LVasdc+Pv4gyYYoH3PcXawr+i7F9TQ3uJl
         TNNztsJbKVH99/L+zqtOg3HBa76KoqdenuCsdt3+AXXPNgU1f7SlDfkeDzwtEnkpcqR1
         e4LU3f20gpgyC1yXtoXMzuWxpKLuSnuCGZ+kchjy9o9U7Y0a8ondfAO2RE1FgSFwpg5i
         u6dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709567207; x=1710172007;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FmYFhieBdwNBCdmRDPjUD9GHVVYPw43TwbCvph3PCyc=;
        b=K1vAy51yMhZSKTomgILrwhsnMjRubY6xS1gWwLPFJFnmLKhC/ExxZYGij5MKl2ag+P
         6D9qTwaUZQ/C1sQKBs9wgf6lAXsctFu+8eOa7tCplVb7XeGynwp8wxFuwhC6XsGB4HLM
         mfwHycZcbhrbmff99j3pjJf/a2Z4sSL+N20dyFzGNMhjD0Jk/4Yu251PTiI4l/mHHwYs
         HstpMd/x54/4b2iintRUf3OKIykTVBNfdmQX6kaV4Tj19aLbdJxpSXeKsNWsAl1rDzsv
         x1YhHV+CzGNfnfq00NGCPJQvnbBuq7ZZhJv8h7NDXH+wsbZqGbqbsqetbZ9HlwxvViDa
         4mUA==
X-Forwarded-Encrypted: i=1; AJvYcCX6Jgg4pesi7fAZMMnL2wU5ITDjeAF3xuTDbUtateh7An2lD76N5L/WfbBWdQL3EFnqkUP2/NZ1yIfiOYpnV4Yb4bbaFkjte4Q=
X-Gm-Message-State: AOJu0Yw4cOmNkKl7Z7UodU+glBkQVw/DAMMRr9UxRSQoLPmLmfETDb1L
	glUC4BRVVVpbUFxctfj7C2uvjXrcBhST970FyB4r3ZYdYayVuvQHDwXLS5/4FguVXwtgxEp2C6Q
	CF9L/o0xhbUvCB3UA5xKf+UYnHphcazg8lulc
X-Google-Smtp-Source: AGHT+IFVI6LZq4ULZ2pJwHISc+k1i94355Y/0LAb1CjD+NtEu1Yvguv+RgPLIv7k3k/C3Vw9/9vsUOmbNMtl5qL4OZI=
X-Received: by 2002:a05:622a:11cd:b0:42e:d8fb:8ab5 with SMTP id
 n13-20020a05622a11cd00b0042ed8fb8ab5mr505328qtk.5.1709567206948; Mon, 04 Mar
 2024 07:46:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240228225527.1052240-1-helen.koike@collabora.com>
 <20240228225527.1052240-2-helen.koike@collabora.com> <20240229-dancing-laughing-groundhog-d85161@houat>
 <5d7ed81b-37f9-48e9-ab7e-484b74ca886c@gmail.com> <CAHk-=wixVy3WYvjbt43ZSrCqPDsS76QJQSkXFbbPsAOs1MCSAQ@mail.gmail.com>
 <CABXOdTeT2ip1uS2EG2w8pW7254Tnd=ZDNz-KC61-G-yqDTVgJA@mail.gmail.com> <20240304-rigorous-silkworm-of-awe-4eee8f@houat>
In-Reply-To: <20240304-rigorous-silkworm-of-awe-4eee8f@houat>
From: Guenter Roeck <groeck@google.com>
Date: Mon, 4 Mar 2024 07:46:34 -0800
Message-ID: <CABXOdTc4MXcjwgGuJb4_69-4OFELD37x0B6oMr=4z=nxZ2HPXQ@mail.gmail.com>
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

On Mon, Mar 4, 2024 at 1:24=E2=80=AFAM Maxime Ripard <mripard@kernel.org> w=
rote:
[ ... ]
>
> If anything, it's more of a side-effect to the push for COMPILE_TEST
> than anything.
>

If the drm subsystem maintainers don't want people to build it with
COMPILE_TEST while at the same time not limiting it to platforms where
it doesn't even build, I'd suggest making it dependent on
!COMPILE_TEST.

The same applies to all other subsystems where maintainers don't want
build tests to run but also don't want to add restrictions such as
"64-bit only". After all, this was just one example.

Guenter
