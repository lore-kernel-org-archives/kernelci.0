Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31E4440D566
	for <kernelci@lists.linux.dev>; Sat, 20 Jun 2026 00:02:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781913724; cv=none; b=K7maBUCuVESsTjep/Yz21SfderA6BJTZ3zB3n8tKTCpzjrKLX4W98e6bFeH3EBAp0hHBHN2mnEXw/oi2w0vGpQRY+5hIxXTOWT9AYEVMCOUu1E68H+IUWpriZPdCSfslCSsI9OnokZThkR4QDT+lpUPDzYMIZa6X2CO68DHOW+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781913724; c=relaxed/simple;
	bh=fSumW3Ch7UuQeqitIMiP5RYU5OJgJUmrfD4f2CDF2ZY=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=ffYWArr1Dg3guKn+t632GGHsejcBYCXA1OdRKG+FpobkAHrDhAZqM07o/RM2gHjzcqoXczFDkf5gMCS1NZZsPPI9Bi2rT6IpKCFJlRD/2B1R8wYUBMck2/v/7ED4lagGPoDiqBd7UwTdsgKjeQ4qm1llRyHpylbxdTHp2/wDDdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org; spf=pass smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b=H2E6UQfQ; arc=none smtp.client-ip=74.125.82.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b="H2E6UQfQ"
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-1390f75d8bbso3188815c88.0
        for <kernelci@lists.linux.dev>; Fri, 19 Jun 2026 17:02:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci.org; s=google; t=1781913722; x=1782518522; darn=lists.linux.dev;
        h=message-id:date:cc:to:from:subject:content-transfer-encoding
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=2cOC+I3qJUIY0KtalcyQsABCsUIlBQVv12rftU8q4bQ=;
        b=H2E6UQfQEpAkn5W7dmyxWdDtFc6J8ckBHFx3/YdAyUHL85k7FFNQjW1SZrd4m4+C6i
         6QqUyEpKtinUh/sYVQwl42/1WitpKr8QIFYYeicjp0BWxkgAz4E70ZjawKbnLaJ09Sko
         jh14vKO4DlUlpUTaeg87e9dUvYI0udMgkMDs16LasAE2t6ercTgCAfwrbU7kBd9hmzxe
         0Eo3PB1PTrbXCfV570sYbcWLA9Pg7qq8Wajt71af1t52n5m2513ueSJPIpQjA4dPfuA0
         tmxJkITvSlm67do/mjI+pBOiWoeT6BN7AfHund76FY87d6UwDWA9m1iBzd/9glQpSfb8
         WUXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781913722; x=1782518522;
        h=message-id:date:cc:to:from:subject:content-transfer-encoding
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2cOC+I3qJUIY0KtalcyQsABCsUIlBQVv12rftU8q4bQ=;
        b=ikum1XUNRRAyI7l3We4xgJ8nIdJZWrit4v/+/8kNPs0oWzUXYTuacxs8NNiKTjlaoJ
         Hir/ZgqpgujW4mvb0tKYvdIEexN/0V7HLf/+Gx34gVuC3D08Ti63CdgfUC57wpp7Q2up
         +cVnGzfvE4udAYvj+GQifkgf6/YZBolP2fB0jUE1p+FrKO1StdCzvFb+vgaCRbKanmE4
         UZZUSPA186ucv85hBFbZ+kJxRvh09YEJHj5vEZhuhSetsfBiVCLJRqr1pLFnV6psS69Z
         7hbbvFRm9lYQB49RvxhxABzmsgbCGGJViYca9LqRy/SeOPQpAR7aZMEOGm/d6OsK9gt2
         O1Qw==
X-Gm-Message-State: AOJu0Yx96d4VN0DmRxk4Gn+9QkU+KgSOVH7BqHJmnSpKMN41OsgY933x
	tVXV/xxvHhQrxaxtHRqxEEGyRPDRxUOF8d6mH+V714ZjA4YDukYhjzTmq5yLt32tEy+7KqM63Oi
	icZbg
X-Gm-Gg: AfdE7cmPR9LUsFn8xCGUcRU08AFzyn2MT7wSAT8IirDvNaE4DaiP038nRh1h1/fMwgQ
	8YlcI1donM0LKLH6Up2my6W5IYVOYTKy6PTl/wfrBC8nW0XatfjRQS2j12SdhKNrcIYKjOyCSIE
	q0owXAz16wec22X1RdTOIBFbAJ64DFK5T7Cj3QfWbfP7IHH4HCbYK7zkw7oj/lXjSty1koOtMDc
	B+DWvhJpC3bzukR0Cvt+AvcaSBm+LVnCEO8XNC1qwYKOdDqSjS8K0zcAS9jYYAvLb3Cm3R3xV6i
	WXBo3Pc4KKusSkkLqRZLgWXhPzXGJAwnrpulQYun0cr36vcsVgkMib1cLiR837fe/fRDT311cXc
	G8a2fK+7vqsFzH7Q0hUpphVzAH+IuikEma61YCxeq8MaefaVWkX9C2VW4FOJlLlQ4Quin78zYwt
	vgUur5aA==
X-Received: by 2002:a05:7022:991:b0:137:f49d:3388 with SMTP id a92af1059eb24-139a5030739mr2093069c88.21.1781913721980;
        Fri, 19 Jun 2026 17:02:01 -0700 (PDT)
Received: from 330cfa3079ca ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-139adcc5f14sm990952c88.6.2026.06.19.17.02.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jun 2026 17:02:01 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: KernelCI Metrics Report - 2026-06-20 00:00 UTC
From: KernelCI bot <bot@kernelci.org>
To: kernelci@lists.linux.dev
Cc: kernelci-results@groups.io
Date: Sat, 20 Jun 2026 00:02:00 -0000
Message-ID: <178191372032.17275.3724496592745885782@330cfa3079ca>



KernelCI Metrics Summary
========================
Period: 2026-06-13 00:00 UTC to 2026-06-20 00:00 UTC


  COVERAGE
  --------
                      This week    Last week    Change
                      ─────────    ─────────    ──────
  Trees monitored     34           35           -1
  Checkouts           58,648       8,606        +50,042  (+581%)
  Builds              8,963        10,549       -1,586  (-15%)
  Tests               2,906,938    2,447,061    +459,877  (+19%)


  BUILD REGRESSIONS
  -----------------
  A "regression" is defined as a reported problem affecting 0 or multiple builds.

  Origin    Regressions       Affected           Affected builds by top issues
            (known + new)     Builds (total)     #1      #2      #3
  ─────────────────────────────────────────────────────────────────────────
  maestro   11  + 5   = 16    197                42      27      23      
  microsoft 0   + 1   = 1     2                  2       
  redhat    1   + 0   = 1     4                  4       
  ─────────────────────────────────────────────────────────────────────────
  Total     12  + 6   = 18    203


  TOP REGRESSIONS PER ORIGIN
  --------------------------
  maestro:
    #1 (42 occurrences) -  passing argument 1 of ‘__do_kmalloc_node’ makes pointer from integ...
      Dashboard: https://d.kernelci.org/issue/maestro:54c89979f71a499b7aae008163ebb25cc99f6565?iv=1
    #2 (27 occurrences) -  stack frame size (2088) exceeds limit (2048) in 'dml31_ModeSupport...
      Dashboard: https://d.kernelci.org/issue/maestro:96417cd30041ab8f3153128d0120c6cd70782d99?iv=1
    #3 (23 occurrences) -  the frame size of 1056 bytes is larger than 1024 bytes [-Werror=fr...
      Dashboard: https://d.kernelci.org/issue/maestro:2d2c5f1e10db58dfd3e3dede1ad14b9b83331a14?iv=1
  
  microsoft:
    #1 (2 occurrences) -  passing argument 1 of ‘__do_kmalloc_node’ makes pointer from integ...
      Dashboard: https://d.kernelci.org/issue/microsoft:72854c34d42c1cfa839d3c79e6dcc070ed65bf26?iv=1
  
  redhat:
    #1 (4 occurrences) -  error: target emulation unknown: -m or at least one .o file requir...
      Dashboard: https://d.kernelci.org/issue/redhat:a8b090056d8e6bc4eee9ffa4389946c992a6e989?iv=1
  

  TEST LABS ACTIVITY
  ------------------
  17 labs reported results this week (1 more than last week).

  Labs marked with an asterisk (*) are new.

  Lab                   Covered builds  Boots    Tests          Change (tests)
  ────────────────────────────────────────────────────────────────────────────────
  broonie               1,328           0        4,927          -2,799  (-36%)
  lava-broonie          400             1,249    314,638        +124,843  (+66%)
  lava-cip              412             1,105    74             -56  (-43%)
  lava-collabora        715             3,821    396,128        +186,981  (+89%)
  lava-foundriesio      102             102      0              0  (0%)
  lava-kci-qualcomm     138             266      274,253        +221,616  (+421%)
  lava-kontron          238             459      0              0  (0%)
  lava-pengutronix      158             361      0              0  (0%)
  linaro                27              27       0              0  (0%)
  maestro               4,093           0        1,661,599      -187,359  (-10%)
  microsoft             103             589      11,820         +6,444  (+120%)
  opentest-ti           124             3,350    1,456          +933  (+178%)
  pull-labs-aws-ec2     101             101      0              0  (0%)
  pull-labs-demo        775             1,475    223,640        +106,531  (+91%)
  pull-pengutronix *    65              65       0              0  (0%)
  redhat                245             0        5,331          -1,082  (-17%)
  syzbot                38              0        55             +7  (+15%)
  ────────────────────────────────────────────────────────────────────────────────
  Total                 9,062           12,970   2,893,921      +456,059  (+19%)

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
