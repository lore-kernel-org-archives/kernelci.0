Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B04B1A6823
	for <kernelci@lists.linux.dev>; Sat, 17 Oct 2026 00:00:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792195252; cv=none; b=Ng271+jLNVkjQz38nM9weQox5aj5/HLdMWVIDmNC6qvDnn289QhRXqK8mjtqZy4gs//RVtbTsv878FWx1SHIcS4Pvh78HRVYfeEEJym7fQwZO3c6xebUaEqGUQdb4IYY/iIm6UmlZGWcfiN+ckh+sSQdnSyNja3Ct21+u7wikBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792195252; c=relaxed/simple;
	bh=Gde+UwFhGuVLbsV7C6IBSVya9QmOuFkVoaumFqOKHyg=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=tfWItKUUaLXzDBreYrA9liJcxz87vsKekLHqHfPFifHWlB4GcQiQVgPBc6r1AgYO+mvQR19dhRo9hAWxHurEn10ME24nBBazJwAO44hXY49D2lbQhtVurJAI+qnwhQz8Vodbgke//7+PFt0h2YkiKmBhveDVNYT5ekmlOovry38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org; spf=pass smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b=KwZbXHfs; arc=none smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b="KwZbXHfs"
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-3550c917fd3so482576eec.0
        for <kernelci@lists.linux.dev>; Fri, 16 Oct 2026 17:00:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci.org; s=google; t=1792195250; x=1792800050; darn=lists.linux.dev;
        h=message-id:date:cc:to:from:subject:content-transfer-encoding
         :mime-version:content-type:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=EDkazF0mhjkyJaTCz4yHcMbAN+V2zHhn6yiJLbClybg=;
        b=KwZbXHfshRX0IZG6VamcC/G7b3a6gv/g10mlx6+vTfkQtP0oIdfEJebeake/d6NYRT
         Gch9qTusI5b90CNPbvHu18rwLiQvneOZHmFAuhY24XMY7eKHvkbgHrRcNwU2XM8TIIdQ
         9PvsXs6LuSwTrvMgtNPTQKsiwzQWes4kTqmeNWfY+H6DZN5mdIXERFQCdBYqNUzAjelG
         2DrPlQ2IQjBZ6Urk3vvB4OiJdJAjk8cTXo2h9khhc2dASzpea6cgXMRrv5MmHe7u8f9T
         GIlAYUNeS59fCJM1UkDZnRZDSFm/C5b+vQrx/60OE68diGjqN1FvXrrAyizyfMCl0+A3
         4B1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792195250; x=1792800050;
        h=message-id:date:cc:to:from:subject:content-transfer-encoding
         :mime-version:content-type:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=EDkazF0mhjkyJaTCz4yHcMbAN+V2zHhn6yiJLbClybg=;
        b=pljYkuxzb+TAnp1dI5X664LioO65/T/AamHMEhKN/FfPOuCYQ6cqHbBfp30BIxOtum
         Vd5grY6h37bi2OcRehEJBx6rGKqgP4OcDQRqTMYbeMhG30XC28a+OtblVogIWByzbqBL
         UdGh/XsLxwJu3RQSGD9uyroumjUbT8a3zNM50qLpfLn5SCGwnIaJOqi4WI2XksdvEZbt
         B0B94xa/RY+kzgpPd3+qdLgIqEqdvXYEy4imFrA6/QzVg8otDUwM51/kDk/a7vUpO5l8
         IrygEKOLJqw1qcU7fypmwdoJND8oaeYh3DHG3PovPlboPYZQaSzXDLzichLDGVOcj+3t
         yCFQ==
X-Gm-Message-State: AFq9FYJzrrpREWr9KijBIkL7ldQqfYjTXWhFf9nBazeAyzWkeMUZakMy
	yTOMkm/wrboU1ffGhRd0sLmyWJnDXFxaEJRcAE8/UGfZNQcmNgRlR+H60gtldBGez9kjSheAjmK
	JYKX8
X-Gm-Gg: AYBFou3Sr/iVvpGT9pW/p3kHTGk5qtPDNKnNPk3rYQLyYEJlvJ8l0LiiXxMXiSat63r
	8UWOld/nAbYCXOl7oxiTehUJ+MVb/sCDjmGcI0PMetepn9Dc05QiIHWoIrle57n7YLUQn90BIgS
	agXmCBW/QJr5lLxjMuseYSL9yKz/KBjSfScfo7AbjQ07BdSg7eTfk7lHqOP/+XlKHxS2P2/3kFZ
	v0Rb2XqQEyPYhuOoje7a0CCnRugIUj4xyC7Wj/dUDZrf59mI5R3q0be8WTvj3w/yijkj0DS1BQR
	ahh1P5nHTvVHHRi1pbwzMhell5RGSYEzUYvacLLEjm10zyfBba96sRhR6hLW3A5/3TCLysAjJlY
	IXgIru2a1eVOBxgeRQXFg5FfrgKkEzSPfrJHW4IKmmDhQgO2Gi0MnHBGSsahNU0qcpStF2Hc1kz
	0Fv65Hv5v+YZ8S56ZkviMEN1Nm6Qr4WTQxaOvZ6GGW3rC+BHMIM0ma/ormuOyn6Xc=
X-Received: by 2002:a05:7301:fc09:b0:34b:5ab2:e200 with SMTP id 5a478bee46e88-361a1860934mr1537693eec.14.1792195249591;
        Fri, 16 Oct 2026 17:00:49 -0700 (PDT)
Received: from 6e52bff8000c ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-360813b684dsm9690672eec.10.2026.10.16.17.00.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 17:00:48 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: KernelCI Metrics Report - 2026-10-17 00:00 UTC
From: KernelCI bot <bot@kernelci.org>
To: kernelci@lists.linux.dev
Cc: kernelci-results@groups.io
Date: Sat, 17 Oct 2026 00:00:48 -0000
Message-ID: <179219524831.10495.18180175814422592946@6e52bff8000c>

KernelCI Metrics Summary
========================
Period: 2026-10-10 00:00 UTC to 2026-10-16 23:59 UTC


  COVERAGE
  --------
                   This week  Last week           Change
                   ─────────  ─────────  ───────────────
  Trees monitored         29         30               -1
  Checkouts            8,374      3,831   +4,543 (+119%)
  Builds              16,129     11,757    +4,372 (+37%)
  Tests            2,960,973  3,274,793  -313,820 (-10%)


  BUILD REGRESSIONS
  -----------------
  A "regression" is defined as a reported problem affecting 0 or multiple builds.

  Origin           Regressions        Affected  Affected builds by top issues
                 (known + new)  Builds (total)         #1        #2        #3
  ───────────────────────────────────────────────────────────────────────────
  maestro     20 +  16 =    36             808        159       116        75
  ───────────────────────────────────────────────────────────────────────────
  Total       20 +  16 =    36             808


  TOP REGRESSIONS PER ORIGIN
  --------------------------
  maestro:
    #1 (159 occurrences) - suggest parentheses around arithmetic in operand of ‘|’ [-Werror=pa...
      Dashboard: https://d.kernelci.org/issue/maestro:26a4fc4f55534d981efb86a089cc89832d270b24?iv=1
    #2 (116 occurrences) - Error in defconfig (/tmp/kci/linux/scripts/kconfig/Makefile:95) [lo...
      Dashboard: https://d.kernelci.org/issue/maestro:f2c3a9af64a352cb6c8e900e9cd6c2255f242f24?iv=1
    #3 (75 occurrences) -  shift count is negative [-Werror,-Wshift-count-negative] in driver...
      Dashboard: https://d.kernelci.org/issue/maestro:ce5ec46ecf72462fff1bede413010b22a34a9494?iv=1
  

  TEST LABS ACTIVITY
  ------------------
  19 labs reported results this week (1 fewer than last week).

  Labs marked with an asterisk (*) are new.

  Lab                    Covered builds   Boots       Tests     Change (tests)
  ────────────────────────────────────────────────────────────────────────────
  aspeed                             21      21           0                  0
  broonie                         2,710       0       8,439      +3,985 (+89%)
  lava-broonie                      416   1,220     399,216   +237,279 (+147%)
  lava-cip                          504   1,573         194               +194
  lava-clabbe                        24     165           0                  0
  lava-collabora                    774   3,315     280,073     -39,960 (-12%)
  lava-foundriesio                  145     145           0                  0
  lava-kci-qualcomm                  66     102     134,708     -32,471 (-19%)
  lava-kontron                      247     490           0                  0
  lava-pengutronix                  309     799           0                  0
  lava-renesas                       77   1,155           0                  0
  linaro_pull_labs                    0       0           0                  0
  maestro                         4,717       0   1,566,604    -458,204 (-23%)
  microsoft                          65     359      17,293         +933 (+6%)
  opentest-ti                        65   1,476         552          -41 (-7%)
  pull-labs-aws-ec2                  72      71          71           -3 (-4%)
  pull-labs-demo                    785   1,720     305,998    +114,012 (+59%)
  sasha-lab                          83     428     234,704    -139,069 (-37%)
  syzbot                             55       0          82         -17 (-17%)
  riscv                               0       0           0     -1,413 (-100%)
  ────────────────────────────────────────────────────────────────────────────
  Total                          11,135  13,039   2,947,934    -314,775 (-10%)

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
