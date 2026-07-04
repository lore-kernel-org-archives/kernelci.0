Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B71713594A
	for <kernelci@lists.linux.dev>; Sat,  4 Jul 2026 00:01:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783123282; cv=none; b=jhC/jLP2pScCP0mjIlKsiK6cv3TwBN5P3tdH1aD47i7TG5eoDLJlYvgXO84fHOkIlPg03i6TyiEASmrEmZvbpoC2ZK6rClsK5qOb58BH1jH6eY8Fqpjx5deWaScnAnpWduhwBPVmHOrTFvdb9Wx8N5MElNF1Yi9OA3VwmpoDYo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783123282; c=relaxed/simple;
	bh=ZVCbJtssbkB5D8gmRtlsG+HXcrDzcIQEQyC8m/Zh7SQ=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=AWZTN5CG6Vq5KE6NW6By3yQzkvG2gLNz0xuc87WIIZIeH7EpCt890ZbXUMbO5hzF4awaR4kmaDPEHh8Zg1wiH36q2k4wje4YKdXCjOYxUC/VBp8H6V+S37p5Zp4Fc+dZQvpeFqXbRWp023tRCJk1zxvUmG5NRktBX5c5xAL6BN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org; spf=pass smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b=J2qquAYs; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b="J2qquAYs"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-36b9d265355so770745a91.2
        for <kernelci@lists.linux.dev>; Fri, 03 Jul 2026 17:01:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci.org; s=google; t=1783123280; x=1783728080; darn=lists.linux.dev;
        h=message-id:date:cc:to:from:subject:content-transfer-encoding
         :mime-version:content-type:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=96uovnqv9JRyKfjg7LeLoZtB7NG9kcSGaouf5zLTprk=;
        b=J2qquAYsmVXL0JrgTlitBOKN4N9A0fj4mEqtwxvgVvYG7C+PxR+eITiCMqRf1oATry
         96ZDbTJmysBBhCFInNN20yOWDn/tkd/HxObl5ohyAhOCR18JrHbAJRqSU0sXzFWud/md
         8nR2TZbGKyCXktrVbNa9PRetGlI3U1OYVkacUqJonMTDY52am2+oQyzt510JwG82CUry
         75rsONyTvVSsc83i6ZiVi7ORN5uUQ+Xly5+6r2ubYLmu/jzCoCQL4BNXwAyVCndFv9kO
         BcUd7fGKlMCKF+FomWzhHmOeR3I2y7PENCDVrVHvLmh3AzndRFi35A9Y+GI4uywCim0w
         u7NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783123280; x=1783728080;
        h=message-id:date:cc:to:from:subject:content-transfer-encoding
         :mime-version:content-type:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=96uovnqv9JRyKfjg7LeLoZtB7NG9kcSGaouf5zLTprk=;
        b=qY8mz88G94CTkYfSQlXTNRG5fOeXImHJOoHf2vMY4/07KXJs91kV6wt4PuHwvgK+GD
         28ZhAdwh8QMpSOjwlMzvZd53ys2p5Jj47rjfzQ9B3FxqMawu0sHANOC1Mz+YzhjOPCpb
         3XT14Z9vVI9expCh6Z6P9rl58NVnRgsaN4fJ5CkgjkK8fjmmc+GKML5l+ZpfLRIr6sO7
         m0R0F6q43uP/tV5Lf8B/mCwe6FvUa+toRdYLUvIC1N5YfckfdsabOFLij/JPDMlLrlGl
         WIOWQqmYJR7vDPGyJcJSAWus6sagqGFUldTYZMYxDHbAeMeaFDICAYjeCPnR872vg74M
         2FpA==
X-Gm-Message-State: AOJu0Yz9Izqm35VQaFePkHAywIkO0c7yfjL4CVlvWTlOf4WMNdwN29Wa
	oZKSkPOX7iXRAeSWrrqYLKt9huRGPb9htC6WY2bstgiYY31M2BpPTbNbPn/O6jyEwFnOg67/lWA
	yECur
X-Gm-Gg: AfdE7ckHXoRfhSd6c7lUiMpN/3p7eW+1f4dq/afB/0TOrIRyvSFSR8NMLwu+mx9AoUo
	E/8cgNG2G4W+aCqmhLjJBBHKF+7bGGzWLq9XAxTdecg8QPPfo+vVMNc+rlfCIxfGJfmsA0GtmBE
	whgt1xQV9HcgbxeCv6Iad+ZHQfgh2y70depjz6RTFQENTanrMB1uBGBUZYJG94kid158oS//pzs
	P1PYuIINjlRPBFGHWsU6gKSClHhyfHKhdCRVCAYCnvinCkTkqoCyNQfJHYwfwePb6WglDF1MwfH
	TKZPvYYMtkcXBridkcrla1Y6ZHBuhnY8csCoJQEBu1yi9EKHO/e+N0ndPf5W2dEFk3P9Y/FZLld
	f9/ykyZ+Y+5rgcydlyrt1JqHQSRMgUQ7Y0vB+hREAZ3efqeFiLcyFaYEI/RCLGvoyXkQ/8rcmhi
	Ub/EgEWKHpsTzglWbe
X-Received: by 2002:a17:90b:3c09:b0:37f:9ce1:735a with SMTP id 98e67ed59e1d1-3829f5e83b1mr1322666a91.27.1783123279707;
        Fri, 03 Jul 2026 17:01:19 -0700 (PDT)
Received: from 963b246bc1b3 ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f0b7b9a1bsm25655104eec.3.2026.07.03.17.01.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 17:01:19 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: KernelCI Metrics Report - 2026-07-04 00:00 UTC
From: KernelCI bot <bot@kernelci.org>
To: kernelci@lists.linux.dev
Cc: kernelci-results@groups.io
Date: Sat, 04 Jul 2026 00:01:18 -0000
Message-ID: <178312327835.4708.17910271601389092096@963b246bc1b3>

KernelCI Metrics Summary
========================
Period: 2026-06-27 00:00 UTC to 2026-07-03 23:59 UTC


  COVERAGE
  --------
                      This week    Last week    Change
                      ─────────    ─────────    ──────
  Trees monitored     37           27           +10
  Checkouts           29,712       24,744       +4,968  (+20%)
  Builds              9,567        6,587        +2,980  (+45%)
  Tests               1,730,845    1,806,050    -75,205  (-4%)


  BUILD REGRESSIONS
  -----------------
  A "regression" is defined as a reported problem affecting 0 or multiple builds.

  Origin    Regressions       Affected           Affected builds by top issues
            (known + new)     Builds (total)     #1      #2      #3
  ─────────────────────────────────────────────────────────────────────────
  maestro   7   + 3   = 10    64                 15      12      9       
  redhat    1   + 1   = 2     2                  1       1       
  ─────────────────────────────────────────────────────────────────────────
  Total     8   + 4   = 12    66


  TOP REGRESSIONS PER ORIGIN
  --------------------------
  maestro:
    #1 (15 occurrences) -  stack frame size (2088) exceeds limit (2048) in 'dml31_ModeSupport...
      Dashboard: https://d.kernelci.org/issue/maestro:96417cd30041ab8f3153128d0120c6cd70782d99?iv=1
    #2 (12 occurrences) -  the frame size of 1056 bytes is larger than 1024 bytes [-Werror=fr...
      Dashboard: https://d.kernelci.org/issue/maestro:2d2c5f1e10db58dfd3e3dede1ad14b9b83331a14?iv=1
    #3 (9 occurrences) -  ./arch/x86/include/asm/checksum_32.h:149:6: error: inline assembly...
      Dashboard: https://d.kernelci.org/issue/maestro:cda3cc6e84621dd79dcc795d5d11509fe0f841c1?iv=1
  
  redhat:
    #1 (1 occurrences) -  error: target emulation unknown: -m or at least one .o file requir...
      Dashboard: https://d.kernelci.org/issue/redhat:a8b090056d8e6bc4eee9ffa4389946c992a6e989?iv=1
    #2 (1 occurrences) -  in /tmp/rpmbuild/BUILD/kernel-7.2.0-build/kernel-7.2-rc1/linux-7.2...
      Dashboard: https://d.kernelci.org/issue/redhat:4e64e780684ab309f1de7a5711dde4d1ef63d811?iv=1
  

  TEST LABS ACTIVITY
  ------------------
  16 labs reported results this week (1 fewer than last week).

  Labs marked with an asterisk (*) are new.

  Lab                   Covered builds  Boots    Tests          Change (tests)
  ────────────────────────────────────────────────────────────────────────────────
  broonie               1,530           0        7,343          -2,365  (-24%)
  lava-broonie          256             736      169,739        -39,860  (-19%)
  lava-cip              240             634      341            +341
  lava-collabora        365             2,075    147,558        -101,541  (-41%)
  lava-foundriesio      48              48       0              0  (0%)
  lava-kci-qualcomm     83              138      194,741        -99,006  (-34%)
  lava-kontron          124             194      0              0  (0%)
  lava-pengutronix      133             286      0              0  (0%)
  linaro                17              17       0              0  (0%)
  maestro               1,871           0        1,071,896      +159,299  (+17%)
  microsoft             48              255      10,792         -14  (0%)
  opentest-ti           44              1,032    497            -482  (-49%)
  pull-labs-aws-ec2     41              41       0              0  (0%)
  pull-labs-demo        276             526      119,498        +11,671  (+11%)
  redhat                111             0        2,420          -2,035  (-46%)
  syzbot                32              0        38             -12  (-24%)
  pull-pengutronix      0               0        0              0  (0%)
  ────────────────────────────────────────────────────────────────────────────────
  Total                 5,219           5,982    1,724,863      -74,004  (-4%)

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
