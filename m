Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54DF7625
	for <kernelci@lists.linux.dev>; Sat, 11 Jul 2026 00:01:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783728075; cv=none; b=fJGsNvtviNx9yAgnMx9WMBkXQyFQ0ABAhtPX6q6lrACReFBTwtFrP2fE7yPA+KqEUsr1n34yxJViCl16VVYNIiV3Tzc5ArISy7O9ZvCi169ViDxFzc0T2v9MRXygiudGwbvTiSNFoqcUNh1/Ic+0E04JDObNYGARfLXoZ8y8amo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783728075; c=relaxed/simple;
	bh=r4RqDM9ygoSsvWZ8Xd+PEjHYTS6RjwgD3VlRjJbMYF4=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=jLCeFJz7Qq/JK4MnLfwHrOwUPmT0u4BeCbkccLU2lUVM241vl64/Yy5fbLKVRe3vgJHXtNGvSahpg/kds6bakbG6zDjf8TNHPx0jD688IPapsFPKVDc5C9ZQx7FYRfEnUi1YwmYGnAsNLQ1iE4zba55rhQv2TrvYhKFAsngnr68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org; spf=pass smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b=TUpJpYO0; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b="TUpJpYO0"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-381018b9375so1860744a91.0
        for <kernelci@lists.linux.dev>; Fri, 10 Jul 2026 17:01:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci.org; s=google; t=1783728072; x=1784332872; darn=lists.linux.dev;
        h=message-id:date:cc:to:from:subject:content-transfer-encoding
         :mime-version:content-type:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=KyWDRsZIj5Z9uETLetDorJklN6tra6Qxw1D3tNrcfyQ=;
        b=TUpJpYO0CU7cc4PUROmHXbdR0FogBthcEzNcGOlHC/1A1Kyo/vF6zoem01sMqPsqF3
         ELvg4UVKR3tFQI2pfjG63eElvNPyyz2E1jKHWwosVX7bvzcWsp9RuB17HbSsRv7CuK10
         twUUZQpFWQoMyLOsy8QEg2BZvSeVyRwifoSS/bDPU8zH0DyJNyzGBUgnJ80DzMGfcCgJ
         ILeLTZo+f7b6bvK+K7QJYd6ZLMCJdFzHgfw30cYoQImEy0a3HrS+oleUm/+zo6Z0TdQV
         e6cCyKCVR5lv/HHL7lt+3oj0mFhvRdmERRJMFXODfIaYir8dvX1Iy0xB2rj2uL0gOL4O
         tHxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783728072; x=1784332872;
        h=message-id:date:cc:to:from:subject:content-transfer-encoding
         :mime-version:content-type:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=KyWDRsZIj5Z9uETLetDorJklN6tra6Qxw1D3tNrcfyQ=;
        b=PL6tzQvQk5ltPhxmRq9Sa+uY26GKQ9bpdJXDDbImJz/QR8AF+4OETtRh7ogfV2CpHS
         ePtidhiAk3JM4hTTWL5iFriYIbfz9HvlOSOyiILTOIfCNcO7s5GVKFZuoAAH7bGlwqUR
         AZXCx56/odlw0E48CABUPM7kS88oDzeGPzATrJ0aA0+ci51colNjwQgD8BKWiq9t4bpY
         sxn3m1va65hkZtsbxGhyXBDLMtlDCdOq5OW1I7gS2BBHAaLEQHnw4MhpAlqj8gosnC5R
         H33LBg+25sjJsdJL5+ZstHDRRHKX83QAGhTWithbV1/gy9OI/Rgc7YSB0YFobbvhtRhx
         eaMg==
X-Gm-Message-State: AOJu0Yy6tmNY0y/eYQkm+6GtjYpwXPdO1rYCeAsNUAR/EqfhExjnjiEF
	PK1teZg9of7zI8caNLOvS6wp/v84byd2UQMOPwkrL8oyNhbsRQtN9HmgHebESG3GKTZlr4jkEi+
	c34C2
X-Gm-Gg: AfdE7clWMu2fNjNcljU+gPTapxQazPgyUKoEsHVI5/e41rZhoQ5BwCDDCvzuDNbyq+q
	+vJZoSyAxzPWSY8dijKq6mc5WU4UYKjiYrlfTnsS6nZX4/ahSJL729RCziB299IUxsbfI7H7B2x
	yVkODEAjJjNFwZrCpKSjvYSmglwBGCSiVwhewUetJ4YrQr9A1W9kGASMfqOcjro3elXN4zilAew
	DEdyP30j/Uroyjx/Pgqd5JBYF9kighTZTZYgzna1I/RCWelTM9KrZX5JjhFD8XFdZoin+fNPukm
	bwv/7ZepB3+CNCUB+zkiGPBXiz9JsLGiq7y1CC5gN6uu8G6JAg8hy/O2wEJkBWwSBx27TECoF7d
	IDKo9H6+TI6P5wzQSv+asteS+nBpiEzDgm3SELbhjOdCmuH9Jq+6r90aSiqnUHP80KQu6S71Fkp
	IjDlypmA==
X-Received: by 2002:a05:6a21:9216:b0:3bf:8604:9a3c with SMTP id adf61e73a8af0-3c11029df8fmr1161213637.28.1783728072362;
        Fri, 10 Jul 2026 17:01:12 -0700 (PDT)
Received: from 963b246bc1b3 ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-311747f72a6sm51212275eec.1.2026.07.10.17.01.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 17:01:11 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: KernelCI Metrics Report - 2026-07-11 00:00 UTC
From: KernelCI bot <bot@kernelci.org>
To: kernelci@lists.linux.dev
Cc: kernelci-results@groups.io
Date: Sat, 11 Jul 2026 00:01:11 -0000
Message-ID: <178372807102.8746.11710045474452337044@963b246bc1b3>

KernelCI Metrics Summary
========================
Period: 2026-07-04 00:00 UTC to 2026-07-10 23:59 UTC


  COVERAGE
  --------
                      This week    Last week    Change
                      ─────────    ─────────    ──────
  Trees monitored     41           37           +4
  Checkouts           88,807       28,389       +60,418  (+213%)
  Builds              10,943       9,361        +1,582  (+17%)
  Tests               2,376,759    1,680,912    +695,847  (+41%)


  BUILD REGRESSIONS
  -----------------
  A "regression" is defined as a reported problem affecting 0 or multiple builds.

  Origin    Regressions       Affected           Affected builds by top issues
            (known + new)     Builds (total)     #1      #2      #3
  ─────────────────────────────────────────────────────────────────────────
  maestro   10  + 5   = 15    365                85      65      49      
  redhat    2   + 5   = 7     14                 5       4       1       
  ─────────────────────────────────────────────────────────────────────────
  Total     12  + 10  = 22    379


  TOP REGRESSIONS PER ORIGIN
  --------------------------
  maestro:
    #1 (85 occurrences) -  ‘key_pass’ undeclared (first use in this function) in certs/extrac...
      Dashboard: https://d.kernelci.org/issue/maestro:1bc31bdc5afab00de98efd0c67ef8653e5385a69?iv=1
    #2 (65 occurrences) -  use of undeclared identifier 'key_pass' in certs/extract-cert (cer...
      Dashboard: https://d.kernelci.org/issue/maestro:ba4b3f33d6a10cd9f6dd26c6f8c27fab62ca127a?iv=1
    #3 (49 occurrences) -  'HMAC_Update' is deprecated [-Wdeprecated-declarations] in crypto/...
      Dashboard: https://d.kernelci.org/issue/maestro:cfb7db7bad026f784ab5093df91515e27c634b34?iv=1
  
  redhat:
    #1 (5 occurrences) -  error: target emulation unknown: -m or at least one .o file requir...
      Dashboard: https://d.kernelci.org/issue/redhat:a8b090056d8e6bc4eee9ffa4389946c992a6e989?iv=1
    #2 (4 occurrences) -  openssl/engine.h: No such file or directory in scripts/sign-file (...
      Dashboard: https://d.kernelci.org/issue/redhat:54dfb8887344e76e107b693682922a26eb7678e4?iv=1
    #3 (1 occurrences) -  in /tmp/rpmbuild/BUILD/kernel-7.2.0-build/kernel-7.2-rc1/linux-7.2...
      Dashboard: https://d.kernelci.org/issue/redhat:df85220be8164f89603be31831425d5a66522e62?iv=1
  

  TEST LABS ACTIVITY
  ------------------
  16 labs reported results this week (unchanged from last week).

  Labs marked with an asterisk (*) are new.

  Lab                   Covered builds  Boots    Tests          Change (tests)
  ────────────────────────────────────────────────────────────────────────────────
  broonie               2,361           0        7,849          +766  (+11%)
  lava-broonie          195             579      145,503        -16,598  (-10%)
  lava-cip              216             563      252            -89  (-26%)
  lava-collabora        316             1,612    98,419         -49,138  (-33%)
  lava-foundriesio      13              13       0              0  (0%)
  lava-kci-qualcomm     74              171      242,752        +53,841  (+29%)
  lava-kontron          86              128      0              0  (0%)
  lava-pengutronix      92              211      0              0  (0%)
  linaro                24              24       0              0  (0%)
  maestro               3,512           0        1,772,323      +736,529  (+71%)
  microsoft             37              200      7,474          -3,318  (-31%)
  opentest-ti           38              1,027    441            -56  (-11%)
  pull-labs-aws-ec2     29              29       15             +15
  pull-labs-demo        233             404      92,555         -26,935  (-23%)
  redhat                223             0        4,174          +1,754  (+72%)
  syzbot                34              0        41             +3  (+8%)
  ────────────────────────────────────────────────────────────────────────────────
  Total                 7,483           4,961    2,371,798      +696,774  (+42%)

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
