Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AD173AAF6B
	for <kernelci@lists.linux.dev>; Thu, 30 Jul 2026 19:35:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785440155; cv=pass; b=D3DbIv/gZ3gyVO7LqxjTFhhCSGDtJkqLb5wOE39viVWm5utNwoo/RHVWVHomsCkVnpE7vFocmZVZXu2O0Nf7v0pocdpqWdKyvPdBfBSOTBHq5dGv244Dff9Vk6Xu0BU706qlbzvy5O5LYDMqensXVFx3tmF+CmCaCtrBNXOsHhQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785440155; c=relaxed/simple;
	bh=fYu3Y/nFZAUD9GY/BKAkjO2+fIS9beMjaJbJ39X6CtU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XPECQS7QmppVwnSoQQurDK1n8EaMElxbQwJSIougKjtJiN+y27jItpz+gQsGnbmCSewRfvqlQNnwK3gJbyJMORqRGPZIg5cUJ00HAMJ8V4LVgs96Kc5c8DYjpU0yjET4pvgUY9BDs+OmS8YgZZXtNbbKOssEytdIkNfk0yWXoI4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=profusion.mobi; spf=pass smtp.mailfrom=profusion.mobi; dkim=pass (2048-bit key) header.d=profusion-mobi.20251104.gappssmtp.com header.i=@profusion-mobi.20251104.gappssmtp.com header.b=ctjHasH1; arc=pass smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=profusion.mobi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=profusion.mobi
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=profusion-mobi.20251104.gappssmtp.com header.i=@profusion-mobi.20251104.gappssmtp.com header.b="ctjHasH1"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-38101f85591so966108a91.1
        for <kernelci@lists.linux.dev>; Thu, 30 Jul 2026 12:35:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785440151; cv=none;
        d=google.com; s=arc-20260327;
        b=sE4JVKYYto4owFbxFI1L/MMhwpEfN9+Y/mfOlfpBfTvcB5hQVUuSKBvtoSrYP7hY7S
         KjfjR9YXz2QZh9sLGa1KDfhSzdykVKkWCnIhwy/b39jpthWgdDz/K0vfBJ09qtEWwjlR
         9sbfBqII+8PID7sx/X2lHLQ6YIFD7zbHJ2aMNEiM8AplEKJhsiFhuDOSpHE5IJe95Qyp
         ygLJHSlJptZocj6puX+yMHcCJt0Eif1VGCk6izeaYbj0F3yEu2gslXJcNsCFOxLaI9mh
         rm4AQ16haHGMdbMp9PuPVs4m4kaB5RxrGYRjbLLwiNmxAGXStJ6k0to8+fHSZaXN5hHp
         aTqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3bqfv0wHJIiGg5MARkTGVdPvf6KPDfs7a6RWlY2oseE=;
        fh=ybhEkdGy/VTzvwYk/rPE9gTd4QuaSHXOvvLY/SEoF0c=;
        b=UfYLcHBvXuvC56oKc9GTvi1YArUUl8DH5gmkxcdhuVBj7+USReWszMOV31qZ9GV2CY
         ceuV7RnqHC6zAlThHyVEby+43hwRJZGt8x4j2Y4QtLATxvCMAxw8jUv16nKy0iJEYIfF
         D4FO3PKHFwk/exOJokC3LU4D51xz8Z9rP67tccDrEo4Kf8M/2pWWsqE+sk1YraSd7fdH
         qlwFoTwx+g5yNky7z6Fuvi1WD5vZgiJJ6A5dOSocweTHgvxEMYYlAxrru/9ZaOqDCQEB
         o5YiI+LpCsxF8ylLGV3JmOH1O1/XgPZ7AWS2cTpsNsMnNNRcLCYJlj8gBovnHkS/EG4X
         BX7w==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=profusion-mobi.20251104.gappssmtp.com; s=20251104; t=1785440151; x=1786044951; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3bqfv0wHJIiGg5MARkTGVdPvf6KPDfs7a6RWlY2oseE=;
        b=ctjHasH1qcEZlBtQbtxsVzDAGaI15Puc5oUFgm6R7ijMk+G6y2lcrEQp2RxXZP939z
         ZxpzdovloVvdYoLxGJnAU2jGl1b+4SBgeVGINQ2ig3dzxXvmyVfGJ3WiTqNOxp8h+fFv
         vplS1g7aOsFGVER0pmwq1ZgG7sjqg9F854HdCn/IX14tRwDLqXp+8YpK3PkTPqao+inM
         rbMc6liMzMXHGeRfFN8RJHoTVL7Y597CoysNBDofMJNNkOR3rUN1wFdzK8NsKyC6x8zg
         3yX+FoMOH1NX5FoTcTU5grWdoTnLDKoS3W2dZ0nedgYFTGGAydKiXt0x5Aq9Z+EaFr/k
         YFeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785440151; x=1786044951;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3bqfv0wHJIiGg5MARkTGVdPvf6KPDfs7a6RWlY2oseE=;
        b=RXYNqFfEFY0YVgTynw0jNx74HmWDIthJBBIy+6TpyphWhQ1NvgLE8pWq3n0gBuM/85
         87/vitob4jbjBQNi2C+D/yu8Kry13xSn7LwISrFvP+7rMfnQl6y3dVkZHyGZVFEt39Zo
         0R2WYH0zaf/v3lNQOr03aPZW6dXkXHY5KY85a3cPy+riGMNmW61bpHIsj4+cDtXJMZT4
         1k7aeK45LKlsIVjyxaCXBNM9A9jyfko5TG/giG4L2Z0qOVdkDuKKbcpSevUQpWfc7PWe
         T/3L6f1w9AQZV2e5m3StlNeqSCjOuv7Itqll0BX5aP/p63EJrxLWQfBezoQmDg1UgOQc
         I3pg==
X-Forwarded-Encrypted: i=1; AHgh+RpUttiBOfdWNY/djYaWbY5B/CtN/LmLKT0/ASbZCbcDYoA/MoU21ZrgLVJkUj2SNPUajy0/WuxkcQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzDuHcvmJMgH9zs6PhR7k4q7s9wRm/GrGwaB1iatqHYA10lBsYn
	Vu1KNE0KhIPkdVkpMn2pi6lWcauzeWQqC/eOntE8SZu+CWZ7eA+BCdCa8RtS0+BjTaVvYB+nXoQ
	NU3gvD67illpL/WFuCjddHiHgexQ7TEHXOjVKxS25LA==
X-Gm-Gg: AR+sD10ImEwzYyAXHI+WaQA/1A6QcBIM3Dn2P+oe4218Vq1pdb5pM7N9IYBOfRqv++U
	eZMN3yP/cKRFwy/SoZsTwZdDEWeWRCJX4EjqlgyPpYvJIL+o+IZkt3aBQE/+HxP3lL7q947LfPm
	XVUgcwmQcMai6Z2V/aWyp3mqf2Iwv6ik9uxxqTUe/JeULNKEjzJmt0ch+vfyuXnhfzllNENhEnA
	VQ5piCABwzgZV2zT0lDQQ77NW49P9nRlvPsgzCQjWmww6uA12LDG0S1oIq8K3eTZL3wZXSnW+6j
	p5mKlFlgJwJa0ROmJz9Bn/SGueeLLdgKBAxPTfOI9RdKwOfc/P6N9naN
X-Received: by 2002:a05:6a21:7489:b0:3c0:4179:b5d5 with SMTP id
 adf61e73a8af0-3c90d9ce835mr1570496637.28.1785440151519; Thu, 30 Jul 2026
 12:35:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <ams_9JHxvOVUFX_W@willie-the-truck> <17901d7a-d6ac-4557-827f-b5fcc0af6f0f@sirena.org.uk>
In-Reply-To: <17901d7a-d6ac-4557-827f-b5fcc0af6f0f@sirena.org.uk>
From: Alan Zanoni Peixinho <alan.peixinho@profusion.mobi>
Date: Thu, 30 Jul 2026 16:35:40 -0300
X-Gm-Features: AUfX_mx6vGlZMR0Eob3ISybBHVa675wb_84eDiKuW6e_y0Pwzadl8E7xH50_-yI
Message-ID: <CAKKBm2t15GgkDsYympwXuu-=TkU8NZc0Ej6kyDzrMXMaXEHRDQ@mail.gmail.com>
Subject: Re: Missing kernelci bot emails?
To: Mark Brown <broonie@kernel.org>
Cc: Will Deacon <will@kernel.org>, kernelci@lists.linux.dev, catalin.marinas@arm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello everybody,

Apologies for the delay =E2=80=94 I wanted to take a proper look at the
notifications system first, since it's a part of the KernelCI
Dashboard I hadn't explored in depth before.

From local testing, the system appears to be working as intended. What
I did find is that a summary email is only sent when two conditions
are both met:
    1. A recent checkout exists. The subscribed branch must have a
checkout that started between 5 and 29 hours before the daily run. The
5-hour delay gives builds and tests time to finish reporting, and only
the most recent checkout in that window is used.
    2. At least one test changed state. Looking at the last 7 days, a
test must show a regression (PASS to FAIL), a fix (FAIL to PASS), or
unstable behaviour (flapping, or inconclusive results such as ERROR or
SKIP). If everything is stable, the report is skipped.

Debugging against
https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git, all
the tests I can see in the current window are passing with no state
changes, which is why the notification is being
  skipped. Does that match your expectation =E2=80=94 that there simply
haven't been any status changes recently?
There is also a flag to send the summary every day (when we have
builds) regardless of whether anything changed on test status =E2=80=94 we
already use it for the mainline tree. If you'd prefer that for arm64,
I'm happy to enable it.

Att,
Alan Peixinho

On Thu, Jul 30, 2026 at 9:24=E2=80=AFAM Mark Brown <broonie@kernel.org> wro=
te:
>
> On Thu, Jul 30, 2026 at 01:13:40PM +0100, Will Deacon wrote:
>
> > The last email I got from the KernelCI Bot was on 20th June:
>
> > https://lore.kernel.org/all/178192264021.17323.9854948270991678156@330c=
fa3079ca/
>
> > I've updated the arm64 for-kernelci branch since then, but I don't seem
> > to have received another update. Is something broken?
>
> FWIW the branch is still being tested:
>
>    https://dashboard.kernelci.org/tree/arm64/for-kernelci/365f9c7a6b81889=
720fc221c166075b1ce81c641?i=3D7
>
> so whatever's happening is the emails.
