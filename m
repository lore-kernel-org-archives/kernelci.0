Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5797235965
	for <kernelci@lists.linux.dev>; Thu, 23 Jan 2025 15:47:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737647235; cv=none; b=J/ZxdYgl+9OP5gfhNzve0bf7eD7mgNopw0kUv7Nts9RNHzxsHWigdzczhAtcjZYve0lR6EQ0m9vTFNeqfrrz5Vm6uZv2N/zTtsynZSB9jm+SPPTn4zKDb3IKplPaCMg3ispFe8GgehiP6QxtDtNova7obNfPWRTN0F6e1clBlQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737647235; c=relaxed/simple;
	bh=C+6VTFf4oQZgdC2iMUDsKcOtxuNkydWnEcm+CAZfMB4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Y2yRQstUSJWI1n6yuXrRBHNNOPA5eELtuL+57jZQPclJW9uGSMMG29gfqS0BaLpMsLmqupVZz3xMCfdJNmix/PIdan+oSK/ML9fkMG09zhzu5jLFZZ9/8WG8Nf7BbtHZ9Jsr+DUhTmA7R1Gj8SBplDrnKMkudzygEMpoXntCIag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=WsDYLWyb; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="WsDYLWyb"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5da12292b67so1819864a12.3
        for <kernelci@lists.linux.dev>; Thu, 23 Jan 2025 07:47:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1737647232; x=1738252032; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=5c1ACikcoZvFxPEfQa5a/N07yqND3XkMMWgBnWWCeno=;
        b=WsDYLWybtm7JmPHVeKfwJXV0E41AE9fHQUKDlS+dSTFpuoHfn/0sQ0L8QyGtCzIBYL
         pPIUF/HN6Nza3gPhrGTTLNXNgAdY25XRvoS+h3AE85Hdj2lDZV1hkfoG1edF4KjF9sSG
         Ny/BnVl+Og0KyasAyPtuubQtEPLih5h2Iyr3I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737647232; x=1738252032;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5c1ACikcoZvFxPEfQa5a/N07yqND3XkMMWgBnWWCeno=;
        b=kaKjuK3EL9AaNv1TFXsdg1659i1D7iqMND293L8sPuxHNi5w34OVBOl/vRnngfdPu7
         gM3hgw9RrCCS3JKTlOyR63DpTigS0Ijtts7ZBTYkREM8x0UVj2aKBXIhvfiFx4YeAX3p
         iz2vg2wspYK3hO0D0PjjrEc0/qBRSVfvgaz7qzIwMNfaWHPV0FT8DBUK+NOeoVZiVwDa
         b3s4xLKvY7YLG59iVXtDCqgwfVD/rKMAe8KUCvB5oNruMJe+yrEZnJz7pYEhiFoSS2wI
         9yfU7PGM/Ot+dkIK8caVRSIb0IZp5xOmrfJXcUOzsDv3x4h1K6tuFHpCG8IhjlUNwY/a
         fNFA==
X-Gm-Message-State: AOJu0Yy2sbn/B+4sV2LfZA+aDpaUvVMAVEO4IgTI+VEUNgTqY9dbUTuc
	uQWl88z3KdD1gf+PVBBjHKdmKtQjYFiNXzJvRWqReeQzHVTdsMmmhb/RsoM2VPXTgCuJkl+MP6B
	5QGk=
X-Gm-Gg: ASbGncsX/pegkew1imcLi0L6SDRSIBLio3qcyoX/331HCadUYikNcnkicFc7vXyR5ad
	0gOOU0mqcSvdX1l3UwgNgPW9WOkAvkLNag4/vlghp50LxImxseA6tgNwJ3wS0/mm3LMZpk76wrX
	EAPl0dmRDNkJ1yN/yBogKiO0AKAzu2yWmvr2cWyBBAr6DWRLK21RA6HSrrh6Sd+iPgU9Jem59s0
	ULIWroU5QTUE6/lvUdw0kt0yxp5xBjStkrqlFDhdBrphfa+Wizx/QDenNvhSe5FavLHobVkL5CE
	o0+4OM02uytycoVm2ZrmmGw/n2Hl8WvIsyO2XWnf66iMw8NrETS4Ug==
X-Google-Smtp-Source: AGHT+IFY4fgIYg4c4A6jiFmJSvCF6DUgP8WBh3x4FRrFzeMlL9O+wr8CWkL/LcVAMOaqxvsM9b59ug==
X-Received: by 2002:a05:6402:2745:b0:5d0:bf5e:eb8 with SMTP id 4fb4d7f45d1cf-5db7db07846mr58515933a12.23.1737647231567;
        Thu, 23 Jan 2025 07:47:11 -0800 (PST)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com. [209.85.208.49])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab644adb658sm414007666b.134.2025.01.23.07.47.11
        for <kernelci@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jan 2025 07:47:11 -0800 (PST)
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5da12292b67so1819829a12.3
        for <kernelci@lists.linux.dev>; Thu, 23 Jan 2025 07:47:11 -0800 (PST)
X-Received: by 2002:a05:6402:3595:b0:5db:f4fc:8a08 with SMTP id
 4fb4d7f45d1cf-5dbf4fc8bf6mr18353711a12.6.1737647230858; Thu, 23 Jan 2025
 07:47:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250123135342.1468787-1-vignesh.raman@collabora.com> <20250123135342.1468787-6-vignesh.raman@collabora.com>
In-Reply-To: <20250123135342.1468787-6-vignesh.raman@collabora.com>
From: Linus Torvalds <torvalds@linuxfoundation.org>
Date: Thu, 23 Jan 2025 07:46:53 -0800
X-Gmail-Original-Message-ID: <CAHk-=wiWcw-aPcMvWYqJDqxopPYXnPnVgFYAUSkvkRPTjO83uQ@mail.gmail.com>
X-Gm-Features: AWEUYZkvzfVO2hileHLKdeINWEzbU9zhoxsfXAWcm9kmxXjIcn6s0um9krEKyaE
Message-ID: <CAHk-=wiWcw-aPcMvWYqJDqxopPYXnPnVgFYAUSkvkRPTjO83uQ@mail.gmail.com>
Subject: Re: [PATCH v2 5/5] kci-gitlab: docs: Add images
To: Vignesh Raman <vignesh.raman@collabora.com>
Cc: kernelci@lists.linux.dev, linuxtv-ci@linuxtv.org, 
	dave.pigott@collabora.com, mripard@kernel.org, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-kselftest@vger.kernel.org, 
	gustavo.padovan@collabora.com, pawiecz@collabora.com, spbnick@gmail.com, 
	tales.aparecida@gmail.com, workflows@vger.kernel.org, 
	skhan@linuxfoundation.org, kunit-dev@googlegroups.com, 
	nfraprado@collabora.com, davidgow@google.com, cocci@inria.fr, 
	Julia.Lawall@inria.fr, laura.nao@collabora.com, kernel@collabora.com, 
	gregkh@linuxfoundation.org, daniels@collabora.com, helen.koike@collabora.com, 
	shreeya.patel@collabora.com, denys.f@collabora.com, 
	nicolas.dufresne@collabora.com, louis.chauvet@bootlin.com, 
	hamohammed.sa@gmail.com, melissa.srw@gmail.com, simona@ffwll.ch, 
	airlied@gmail.com, Tim.Bird@sony.com, laurent.pinchart@ideasonboard.com, 
	broonie@kernel.org, leobras.c@gmail.com, groeck@google.com, 
	rdunlap@infradead.org, geert@linux-m68k.org, michel.daenzer@mailbox.org, 
	sakari.ailus@iki.fi, jarkko@kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 23 Jan 2025 at 05:56, Vignesh Raman <vignesh.raman@collabora.com> wrote:
>
>  Documentation/ci/gitlab-ci/images/drm-vkms.png | Bin 0 -> 73810 bytes
>  .../ci/gitlab-ci/images/job-matrix.png         | Bin 0 -> 20000 bytes
>  .../ci/gitlab-ci/images/new-project-runner.png | Bin 0 -> 607737 bytes
>  .../ci/gitlab-ci/images/pipelines-on-push.png  | Bin 0 -> 532143 bytes
>  .../ci/gitlab-ci/images/the-pipeline.png       | Bin 0 -> 62464 bytes
>  .../ci/gitlab-ci/images/variables.png          | Bin 0 -> 277518 bytes


This seems excessive.

We have a few images in the tree, but they tend to be either the
penguin logo or various source SVGs.

Not a set of random screenshots or whatever.

         Linus
