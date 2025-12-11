Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BA7029BDA9
	for <kernelci@lists.linux.dev>; Thu, 11 Dec 2025 17:21:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765473663; cv=none; b=sGw2GRJY87GGAguB3LUHmnM3REogum6P75K6cMV2o9sLn1I4GPzpbSWwCLewsz/5kqcJabBsQTJDwsDmNUJqgEIudub3T7EYJtfZuezxR+7LZCzcczTxEZlFQnfhIl4xDKs1+7FxHl6ljSxd1G8a4y8s3ej7eZlIESMHagBih0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765473663; c=relaxed/simple;
	bh=LmQG9ZdK1jYYxJxfaubnPzjjvwe7QXHVOz2liLUXy+s=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=WoGjItrTmOTomGVOZoEkVc2bz6h5XvBG0xDx4OI8/mkynKwVQA5PRTseUtKmkXtGOVkj6nY7t+jWmKtCgDOpmjk+uAvz8lhkrceWTaCi82070S59FDeKcWd6zu1uBvDDXgfe5Guw4qSDyxsVXRRHem/H3OLSWV1z9DmnGIU7710=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=profusion.mobi; spf=pass smtp.mailfrom=profusion.mobi; dkim=pass (2048-bit key) header.d=profusion.mobi header.i=@profusion.mobi header.b=GYstNrYh; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=profusion.mobi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=profusion.mobi
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=profusion.mobi header.i=@profusion.mobi header.b="GYstNrYh"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-298145fe27eso5045275ad.1
        for <kernelci@lists.linux.dev>; Thu, 11 Dec 2025 09:21:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=profusion.mobi; s=google; t=1765473659; x=1766078459; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=LmQG9ZdK1jYYxJxfaubnPzjjvwe7QXHVOz2liLUXy+s=;
        b=GYstNrYhtE3aFVachsST+GUVl+p+Rh26kwnE9GkDohPhqZWuRHf7yz7GCcAB4vzA+S
         RSeWRXNSL3NWeqFI9uFiCtw5OC3DkzBP06WoGJtMYVlLYwSDZLor8Cuq5bs0bXwPSgQQ
         qKmjophlNy1AyJ/ZJhgBf863Gc571DuDMUj3wfmD0Fz711hqu4V+URhpkcl0pBEsNcuQ
         psb759Xzebecw6mCrhydvELbM4q/8nhBC2gTUJRJAJ+YLf0NQ4hVotCpALr7NWLcuawJ
         sq4y2U+5sBjjAp+Pkkcv0J3iz+XAnbTgGn1vnTPaj5iPIdkTHAlQ0Nwvv+areHdvIYpf
         pfeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765473659; x=1766078459;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LmQG9ZdK1jYYxJxfaubnPzjjvwe7QXHVOz2liLUXy+s=;
        b=g+XoiKSLXTst5V/8GsY9vxYiqo6rPa7zll8FBP7fWCn6SCdM8aMjFza32fp1K3nYFU
         J8PlH3XNOb0Pfky2K8By2hOBf3KoDihQVWIuglya9KXISAM+cfEVKLPnjg7r7HrfDFGg
         LwP2o+SMNswWLDzwltuvgYDcwlUsGULqopTz0yhrz5sH7DcoA7l4I9N9ivvXPkzcA8cS
         ICYqjPudwSx8vKMI6W8sASxM3ZV9K8A7QwhKSlR4XuzNQ4rnPhD6nUIBJPytw1rJ5/cV
         +Cg00h7N7dzUSokTHpu3e773kDoUDKBFaLvnfglD5Wc4yKAbdNtmLQrNnJrApIc+Dx/7
         YVzw==
X-Gm-Message-State: AOJu0Yxrr+iJrsNkA79cdi95DnOrjIb1NOMQKBSIZSlrqFgqNHwftYGA
	tSB2XCS1nm98BqZCMDoybCKu9XXC/4+xgAKgjC91gmKmwhDNRlgHYAkcp8IiJuPc1BAP5OTyIS3
	T+DFh5ddM4+40meiGfVGbtrpnKkPv18vsxu5lkXmkeXedt0g5wOToiJgCSw==
X-Gm-Gg: AY/fxX7HTdoEYCHHiIrEZILS2cps967V2jB4SnfVp2eoun8lP2jsBPmIbHX74HzX4pK
	ZG94VsyPhrhCneb97/VolaRo9HQOgaH14b81DEScTOZKmhYyArxFNNNKl3GI9c1GsvoschLXfDI
	qtCvWFVaHZHUKx1zGAouLjo0k6lo6fwbwYS4/7xf8jVmxMu94GqMWNqiddWFr0iezIO5n+d/b+5
	dRvkINAdq1how0rBVpBAfbrxu1zFZE/SsHZfYzNzYtt2JHZCeJk8sH3WvLLWZReFpYpJ7g=
X-Google-Smtp-Source: AGHT+IGIEw8NIzNK4M1hkgR2qbK2fxItvRCTz1FGf5X42w9MrJDQmxspIw3KEWLWPPFbpqVD0Qk3DH+s4eWmCwsfG+8=
X-Received: by 2002:a17:903:32c1:b0:295:ed0:f7bf with SMTP id
 d9443c01a7336-29ec2809302mr70694845ad.58.1765473659418; Thu, 11 Dec 2025
 09:20:59 -0800 (PST)
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Gustavo Flores <gustavo.flores@profusion.mobi>
Date: Thu, 11 Dec 2025 14:20:47 -0300
X-Gm-Features: AQt7F2rxR9AxdnljDYgSf-dDU_m971Lc9K4Bh3hPbhGXSFNu13XwMA1AyLhDocU
Message-ID: <CAB31pVk7zc493XMYYZOnSkUJ5+n-jo90cmGyr+kz=_C67+fBRA@mail.gmail.com>
Subject: KernelCI Dashboard Report - November 24 - December 05, 2025
To: kernelci@lists.linux.dev
Cc: kernelci-webdashboard@groups.io
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello everyone,

Over the last two weeks we focused on improving the ingester (the tool
that receives KernelCI=E2=80=99s data submissions), advancing the hardware
listing work, refining UI behavior across views, and expanding our
test coverage. Here are the changes from the last two weeks:

## Ingester

Introduced hardware listing denormalization to speed up hardware queries. [=
1]
Added extra metrics to the ingester performance tests. [2]
Updated the ingester data insertion policy to match expected behavior. [3]

These performance changes will take effect a bit later, as soon as we
are able to transition from the old ingester to the new one. This
transition will not affect how the submissions are received, so no
data will be lost.

## UI and Fixes

Fixed filter button positioning in hardware detail tables. [4]
Ensured hardware listing and tree listing tables render even when empty. [5=
]
Fixed the filter button in the tree details page. [6]

## Testing

Added unit tests for ProxyView. [7]
Added unit tests for OriginsView. [8]
Fixed test discovery warnings. [9]

## Notifications

Improved hardware summary generation for notifications. [10]

## Future Changes

Over the next weeks we=E2=80=99ll continue validating the hardware
denormalization, adjust dashboard views to use the new tables, and
refine ingester performance. We will also start working in
denormalizing the tree listing view.

## References

[1] - https://github.com/kernelci/dashboard/pull/1614
[2] - https://github.com/kernelci/dashboard/pull/1643
[3] - https://github.com/kernelci/dashboard/pull/1638
[4] - https://github.com/kernelci/dashboard/pull/1648
[5] - https://github.com/kernelci/dashboard/pull/1637
[6] - https://github.com/kernelci/dashboard/pull/1641
[7] - https://github.com/kernelci/dashboard/pull/1654
[8] - https://github.com/kernelci/dashboard/pull/1651
[9] - https://github.com/kernelci/dashboard/pull/1639
[10] - https://github.com/kernelci/dashboard/pull/1645
