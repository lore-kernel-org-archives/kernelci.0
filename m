Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3716175A74
	for <kernelci@lists.linux.dev>; Sat,  8 Aug 2026 00:00:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786147260; cv=none; b=QNyaFCiL5ygezR1R1YAIDWlmFtE/hMagEkdGoywKZNam88Be1EX7LjVkov2v1a3A6rc5r2ZrRO9yjc9Fc17a4YlVoylhbc0OhVL6L7naTnFgZnMzEEKsanO3DEbk7NC4lv6OxDqm4WOv+8HBskTYofPQACLlwLI0hOQ/zIirMwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786147260; c=relaxed/simple;
	bh=q8JNeTamdjJvkRqXZ4YOc34fUf9I4nBO+jeUH5vWnXQ=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=beS3nOBiRLpwQu1s+EGgcuOda9VptoXeFwvT46C/lwmtbzQ/5k3T6g+JkIQS9oDNsFdFmux80mlO/62e1XYikAmLXgt/lRaRseOn6F9phQ/sqZ/B+9lWDtSL5uhnnge+2GRs5UP+bBggPggK0f2XfbzRmrFjGzEknZ7exENRfxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org; spf=pass smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b=SMWrdGPY; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b="SMWrdGPY"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3856d6fbcb3so65671a91.2
        for <kernelci@lists.linux.dev>; Fri, 07 Aug 2026 17:00:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci.org; s=google; t=1786147258; x=1786752058; darn=lists.linux.dev;
        h=message-id:date:cc:to:from:subject:content-transfer-encoding
         :mime-version:content-type:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=HFLZpSCNndZQa7DXJeprS2nGUUYYeoGLwVYr/rBhsMY=;
        b=SMWrdGPYAwHzysXzg3LheOEz4zoWFwT4dchDj9usGTo4YXfponJ7gdD3oSv0aaAbrA
         7n9VTkYLssjJVSv8aSWb6ZmgYk7DAfAOgVSxJnUkmbhSEhM0Ar1Wq7kCp8ybcNihDeyU
         TSiUSQBRPzWToXTL70FA1YLxp1KK/M6tiIYvvAJQVcSNeRE0Mwl3AADt8Dj4z+puuxjB
         tJrQhUPrgdmxe6ABPELYia108/cFPhfaDscZc8UGaf7ahX4S7rmbNEbw93vTT8UtGw33
         IbFno89GBYrpM5cVBGFL3T4Uco9py5t+iv3gZK7GFKMakDSpxiKw53jLCpNF4B40qGP9
         TjpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786147258; x=1786752058;
        h=message-id:date:cc:to:from:subject:content-transfer-encoding
         :mime-version:content-type:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=HFLZpSCNndZQa7DXJeprS2nGUUYYeoGLwVYr/rBhsMY=;
        b=ET2Jht8PdJ4DynHhcllkn7dZxxhdaTqj37jfiKCSHG/3oLSOHOuFa1jUiHpurkb9Aj
         afhkJNk7TgU/yPmMW+e1krlqJq49H6m+/V3yDXip8UfvLr7WfVbkf56k+eiNWFZVkkfP
         ujgJJHnUbIvozKGTTJC9yepN6cnWq1pBEEdcu3RiE75AA7JhVrjxEUHjPx9O/9lp3wi2
         GU75qCGL/YAC0SFhZaPiNhU0ETfwelLLVbx02ESHJ21sB0WQHUO7nFfGvxsfhCvgABCW
         CLhh/jpPshSwWnyLAWj5achD+h8Rcvc2ruSUuIA3wFrLfDPMcgypLrhDflKVWooVLKAw
         k4rQ==
X-Gm-Message-State: AOJu0YxkCFGrMXMSVj42kqnZ3gCV/N/G0o23STzYkP9ewz+nym/3jYfq
	wkJ7oNEfErXmCn+UU12jyTx6P5D3YePgEH/H1CvwQFWOKcR45Zp6Y52zGaoRdshU9n98rJVBITC
	Y1ALD
X-Gm-Gg: AR+sD105FW5r8XUdqxOT54JuUvQ6wWeTod+68OLzhI9cID9poDMp67aulEFr/5T1WdG
	Eb1q37MzmtM9z9g2l7eNgMtWTRpZjckdHChksh+4LvTxE+F0hNxIYnk1lkxPisAFAm0JcYh8kYk
	j1JepXnoSkeIy8X0hTJR1Amk0KRNJ2hAW9ZA9c4gzycuCAM5P8dqh+SJ3/S/kZsWnWfV6PM8D2d
	8kCKDZpb11rFjbk2th/Kf4V7VN5bwjW80K/QcjncwJzv138DHBYXNuVE7MjIXVbiu5VF3SvGwjv
	WLLruZkoZMxmQBSpN2SxvrUwKQpJI5rSihFaVdjTlZ6IKYLiAYAFo+oPxlfFBw3HaUmstpn0UGM
	dcAx8TJ5dVxACsTiTKcFu6ST9quByufozWsb6lxYLHG5yKchfIKZU12XoZLlK+e7DiSvHXLVE2l
	Cj6+jNLNSUxBnLi+GmWLuIatmq1ImchFQHkmU6KirVyrQNeTxJYdsumg==
X-Received: by 2002:a17:90b:3841:b0:37f:e1b6:4c7d with SMTP id 98e67ed59e1d1-3928225dd9emr3065370a91.6.1786147257718;
        Fri, 07 Aug 2026 17:00:57 -0700 (PDT)
Received: from 9a65d8f5b626 ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315bec26a46sm12002457eec.27.2026.08.07.17.00.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 17:00:57 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: KernelCI Metrics Report - 2026-08-08 00:00 UTC
From: KernelCI bot <bot@kernelci.org>
To: kernelci@lists.linux.dev
Cc: kernelci-results@groups.io
Date: Sat, 08 Aug 2026 00:00:56 -0000
Message-ID: <178614725643.221.867748501209078072@9a65d8f5b626>

KernelCI Metrics Summary
========================
Period: 2026-08-01 00:00 UTC to 2026-08-07 23:59 UTC


  COVERAGE
  --------
                   This week  Last week          Change
                   ─────────  ─────────  ──────────────
  Trees monitored         39         41              -2
  Checkouts          113,655     72,826  +40,829 (+56%)
  Builds              14,314     11,317   +2,997 (+26%)
  Tests            2,814,157  3,004,038  -189,881 (-6%)


  BUILD REGRESSIONS
  -----------------
  A "regression" is defined as a reported problem affecting 0 or multiple builds.

  Origin           Regressions        Affected  Affected builds by top issues
                 (known + new)  Builds (total)         #1        #2        #3
  ───────────────────────────────────────────────────────────────────────────
  maestro     13 +   3 =    16             719        228       178       111
  microsoft    0 +   8 =     8              10          2         2         1
  redhat       2 +   0 =     2               3          2         1
  ───────────────────────────────────────────────────────────────────────────
  Total       15 +  11 =    26             732


  TOP REGRESSIONS PER ORIGIN
  --------------------------
  maestro:
    #1 (228 occurrences) -  ‘key_pass’ undeclared (first use in this function) in certs/extrac...
      Dashboard: https://d.kernelci.org/issue/maestro:c8d36aa6848ceeb5f21060331b3fcc14fe6c4896?iv=1
    #2 (178 occurrences) -  use of undeclared identifier 'key_pass' in certs/extract-cert (cer...
      Dashboard: https://d.kernelci.org/issue/maestro:3f4a6e9267e202205cf56c65e64d2cb3d3f4f4b6?iv=1
    #3 (111 occurrences) -  ‘key_pass’ undeclared (first use in this function) in certs/extrac...
      Dashboard: https://d.kernelci.org/issue/maestro:1bc31bdc5afab00de98efd0c67ef8653e5385a69?iv=1
  
  microsoft:
    #1 (2 occurrences) -  drivers/net/ethernet/huawei/hinic/hinic.ko: final close failed: No...
      Dashboard: https://d.kernelci.org/issue/microsoft:d1680c99afba342e5ce05d9521fdd65335c2d244?iv=1
    #2 (2 occurrences) -  drivers/net/ethernet/intel/e1000/e1000.ko: final close failed: No ...
      Dashboard: https://d.kernelci.org/issue/microsoft:7f36b43830969fc360e5c2c1de06efb78bbcdb91?iv=1
    #3 (1 occurrences) -  in drivers/net/ethernet/intel/libeth/libeth.ko (scripts/Makefile.m...
      Dashboard: https://d.kernelci.org/issue/microsoft:37ea1875843ebe30b4abc409514afe210f2f403a?iv=1
  
  redhat:
    #1 (2 occurrences) -  openssl/engine.h: No such file or directory in scripts/sign-file (...
      Dashboard: https://d.kernelci.org/issue/redhat:54dfb8887344e76e107b693682922a26eb7678e4?iv=1
    #2 (1 occurrences) -  scripts/gcc-plugins/gcc-common.h:460:20: error: ‘CONST_CAST_TREE’ ...
      Dashboard: https://d.kernelci.org/issue/redhat:7f08649b1e8792431505f088d0b2f21f699ba664?iv=1
  

  TEST LABS ACTIVITY
  ------------------
  17 labs reported results this week (1 more than last week).

  Labs marked with an asterisk (*) are new.

  Lab                    Covered builds   Boots       Tests    Change (tests)
  ───────────────────────────────────────────────────────────────────────────
  aspeed *                            1       1           0                 0
  broonie                         2,814       0       9,774     +2,104 (+27%)
  lava-broonie                      420   1,424     263,866      +9,015 (+4%)
  lava-cip                          477   1,123         369         +18 (+5%)
  lava-collabora                    699   4,427     262,239    +53,038 (+25%)
  lava-foundriesio                  120     120           0                 0
  lava-kci-qualcomm                  78     225     189,479   -153,261 (-45%)
  lava-kontron                      269     515           0                 0
  lava-pengutronix                  293     748           0                 0
  linaro                             12      12         144       -216 (-60%)
  maestro                         4,407       0   1,832,662     -67,237 (-4%)
  microsoft                          57     309      11,824     -4,609 (-28%)
  opentest-ti                        72   1,897         834        +85 (+11%)
  pull-labs-aws-ec2                  77      77          76          +2 (+3%)
  pull-labs-demo                    506   1,168     226,110    -28,172 (-11%)
  redhat                            313       0       4,415     -1,012 (-19%)
  syzbot                            119       0         319        +77 (+32%)
  ───────────────────────────────────────────────────────────────────────────
  Total                          10,734  12,046   2,802,111    -190,168 (-6%)

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
