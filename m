Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53F063587DE
	for <kernelci@lists.linux.dev>; Sat,  4 Apr 2026 00:00:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775260822; cv=none; b=kBffMUPxEi6o4SmIpjrQxdIo/ZnOrxzVEVe9mdEBnYh5pH4BqALv7IpYAQdXYQjJ68ac7nL81rVSPHdn23rZL9FuBABBNcz8Gsr4h3y0LK1dpMMMgmVGEyZRqCHd1Cor1mLnsD+yFgg5Jx0ZEDanUhsaO8Ivp4Eq9GgD43/RX3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775260822; c=relaxed/simple;
	bh=tq/YuQ6QMnQ7UXwDFqb8d5VWxYj3f+eZMl7lFXDPP60=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=npjd+k1ZM9SyYSqN1w2U9xl959kIBREJlo0WQZtNq40lg8W/J2dyTbpsyoiYmWRoXbZH3wnNakCSTif1aOoTCO+EP+sZSbhoL56C/OdOWhCGWg8XFOYJWlIreHAkYah4Wk4ubgJCcdXNz8FXwOpd2/Q6kJZTUrPLYmLwiWDeHuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20251104.gappssmtp.com header.i=@kernelci-org.20251104.gappssmtp.com header.b=D50EPIOI; arc=none smtp.client-ip=74.125.82.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20251104.gappssmtp.com header.i=@kernelci-org.20251104.gappssmtp.com header.b="D50EPIOI"
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-12713e56abdso944960c88.1
        for <kernelci@lists.linux.dev>; Fri, 03 Apr 2026 17:00:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20251104.gappssmtp.com; s=20251104; t=1775260820; x=1775865620; darn=lists.linux.dev;
        h=message-id:date:cc:to:from:subject:content-transfer-encoding
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=G9E00FJfDMED24M9Tuqdyx28SfBSjUX+q9vVtjI96nY=;
        b=D50EPIOI/xEk59Sey+bJlqa/X4le2ye0Guq7l++15mW3cqvy0oIks3L9Lc/7IkR9w/
         iWt6+5dpszfJx8va6F6fs0pPSmm8MFdORyPC05D6AT76k0qShADzaTQUsQhb07Kx/6+t
         4gaQHz7vFIpVCLXjl6/l49UfKQjLzy/bbVkI43NujlWaQZ3/hc7NMwHVvyNWVqd3WN6b
         DrQ0EDAHOgYI6xiHPyfGdglrhMsL65Iwdmm3X8v0SAR8imhhe1c/PHgT7WCU++ywynao
         6KHG2gEJ0xAIwXCi0FfpVPbZS8h5Ozobg6UWHYjVq5dd1SbfRWiPdPecTXZF0JxP7KTi
         vRyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775260820; x=1775865620;
        h=message-id:date:cc:to:from:subject:content-transfer-encoding
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G9E00FJfDMED24M9Tuqdyx28SfBSjUX+q9vVtjI96nY=;
        b=oQU0wPhyg3YR8/KqXVUBsLRl0dDBqExMrGO3GKteb6gXqeVpT+IjXwSbyw1g+aifE8
         TYKK7zY/UsTlssT8aItesc5zDSyhzialyGAgiaQhtNsHUmauAqZ4lwwq1adCnKaGJd7O
         FHHCHKF3kx++bqtxrrW4wQ9NmmOehziXdz/CJBNueCH7rVL2ZFtAn+Wiblhdz8qfkA2x
         HPwIzJuCoRXju35wwd4s5xoLe3UhbPJD4uSbZ8ub1TIUb6JVna451WB1fXILKrbCjpY2
         l17JVDwXg5zXBgvYt17ZqjBp+NkQVgBaNthMtTxqtT1F+ziupOiPIOsORl4Hw5X8seAv
         p2Tg==
X-Gm-Message-State: AOJu0YyTMY47EKS8LzA98SZjn03Qmsxsjb8jo6uoogUr3vRNN657Hd+i
	RZWX1oChP38paTGPQK1F58f6fHThnRUYS7nMODfB5KsDqN9JpkbSPFEbAkzEbPS0WJCciIkHgVY
	hk3Ya
X-Gm-Gg: ATEYQzxNFyCcZVdNI3Lv8RATS41v6uwEHb5LiuhfrBxgv4g2j6nJfZlQgIh3ETo9Ek5
	7GbYZnQkVD7KgFuSvrQtNQkT05rhO2KkKCp2R7A/itxAc2avzUPvpmSJYS9zSGrTWn7SM2Sdit2
	LZekXpOXw8b/0udDqLh/JJoRyy12FEJpGkJNCiT0C2zmRiqScrxLjEk2Jm6akK50hFTKVVDab6w
	i7kBynVcikWIFQ5jhPmGH5ZYBLDZJwMCiwyUcxiJZ8DVLsrbXSNCzEUs9eoZQHZK6fSQHFFbgdZ
	UcH+LJgFPxovrak1WfioT5LqcXTnZVD3A+7J5KVEWcqfPbBbmCH9s/VQGUVpmcgF7LU6HGxoQY/
	CKUx4FdurY8mQFbK8D/xKHyw6XCtgs/t7vKsQFt0jyhboypwi08m8NvILMj4G/zmF6HvaIJmx19
	I9b5IGl8U+drV3zPOs
X-Received: by 2002:a05:7022:6286:b0:127:38a9:5abd with SMTP id a92af1059eb24-12bf085530cmr3350330c88.12.1775260814892;
        Fri, 03 Apr 2026 17:00:14 -0700 (PDT)
Received: from 8692ffc4d55e ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ca792f3f54sm6209865eec.7.2026.04.03.17.00.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 17:00:14 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: KernelCI Metrics Report - 2026-04-04 00:00 UTC
From: KernelCI bot <bot@kernelci.org>
To: kernelci@lists.linux.dev
Cc: kernelci-results@groups.io
Date: Sat, 04 Apr 2026 00:00:14 -0000
Message-ID: <177526081276.752.10962549612619656787@8692ffc4d55e>



KernelCI Metrics Summary
========================
Period: 2026-03-28 00:00 UTC to 2026-04-04 00:00 UTC


  COVERAGE
  --------
                      This week    Last week    Change
                      ─────────    ─────────    ──────
  Trees monitored     44           48           -4
  Checkouts           4,068        3,975        +93  (+2%)
  Builds              8,099        10,231       -2,132  (-21%)
  Tests               560,091      505,532      +54,559  (+11%)


  BUILD REGRESSIONS
  -----------------
  A "regression" is a newly detected failure (first occurrence).
  An "occurrence" is each subsequent hit of that same failure.

  Origin      Occurrences    New regressions
  ────────────────────────────────────────────
  maestro     307            22
  redhat      9              1
  ────────────────────────────────────────────
  Total       316            23


  LAB ACTIVITY
  ------------
  8 labs reported results this week (unchanged from last week).

  Labs marked with an asterisk (*) are new.
  Labs that stopped reporting are shown with a -100% change.

  Origin            Lab                      Builds   Boots    Tests          Change (tests)
  ──────────────────────────────────────────────────────────────────────────────────────────
  maestro           lava-broonie             0        1,109    187,404        -23,577  (-11%)
  maestro           lava-cip                 0        768      171            +19  (+12%)
  maestro           lava-collabora           0        2,687    220,318        +40,894  (+23%)
  maestro           lava-foundriesio         0        106      0              0  (0%)
  maestro           lava-kci-qualcomm        0        109      74,998         +74,909  (+84167%)
  maestro           lava-pengutronix         0        444      0              0  (0%)
  ti                opentest-ti              0        1,232    35             +35
  maestro           pull-labs-demo           0        200      121            -46  (-28%)
  ──────────────────────────────────────────────────────────────────────────────────────────
  Total                                      0        6,655    483,047        +92,234  (+24%)

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
