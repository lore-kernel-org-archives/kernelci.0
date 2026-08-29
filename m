Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33B291A267
	for <kernelci@lists.linux.dev>; Sat, 29 Aug 2026 00:03:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787961797; cv=none; b=cGD6IHBCyJg/7HF9DYMDo/3rhBVwQOvmKuuxAYsegqPNCLnEJ2vsEMsYgc21jMMpuwgGbjohCigiREfg5tZBGMPAeA4lxC9rV4KP1cwMosZj63GU/frsni0/F8WGmXPrcKWjV0t3jFr+RPXFLMey3IAfuPHaNFiEgoHQpJ7qMvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787961797; c=relaxed/simple;
	bh=Yccx8w7Yg3i4RrerpX+/cpOxGm3UC6C/+lhGian0/TA=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=V+QYNsZqbbdzbqhALHp15JVBOmiOhPRkqUPGp5pgXCKCmORiRLOudN3RdZfyHOEwnT31TrXMi1+EC7ILS2RmTUfhT2szOhsZuUTc26Ih3sPDTkVcMylVv7qvYdbVikaIFT8++BmvLcacJcSnyP68NCjZ3KmLDWk19i7Z3wcHdko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org; spf=pass smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b=ZCAT3ixm; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b="ZCAT3ixm"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2d71a50caa9so19182735ad.0
        for <kernelci@lists.linux.dev>; Fri, 28 Aug 2026 17:03:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci.org; s=google; t=1787961795; x=1788566595; darn=lists.linux.dev;
        h=message-id:date:cc:to:from:subject:content-transfer-encoding
         :mime-version:content-type:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=yCPdGC7r1VGNI9en0HzGYrXUzQpmYMaKgpL4EDfCA78=;
        b=ZCAT3ixmXvaJ1OHZKSNtH/XzSv9pCEo2IHfEZA4YHWnimUVQ0lb8SYdZ7F4Llgo80K
         2H/qZgFS31a4B9cg0nFnImK4JHCHwZgyyH2isugCxpwbfGL4a3RDNeTyQc95ntfQHOGY
         crJf3PWScPcoabFzZ8zqsuaWMl3WyPEkQDY1Rh317sp/5DIVnZuXQK7Vr2HBohbpxjpD
         Ysg4M40ciB/xC9IBnKE8yABtY6wxdeV+SqwH8Tm/dQUJfaI5e0bCwrDY4xywxifkW6uF
         gH6M0QmKJO7eLBS9/3DG+deevZsBoGPuSqeg6ZMRqziHg+mMXqUk8gVc/6IXMZvPGBvY
         6Jnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787961795; x=1788566595;
        h=message-id:date:cc:to:from:subject:content-transfer-encoding
         :mime-version:content-type:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=yCPdGC7r1VGNI9en0HzGYrXUzQpmYMaKgpL4EDfCA78=;
        b=P5Ii8ViywsNAdo+fmbvBQQU9PLReOi6I6nEtFQMhGF6O0OFPuoTOR1DprYz4OmKbA5
         +TBS32wBNLKYeJn9mp50qcKy+qYqbDU+2ew3JlDAd4pbbCG7H6wFNnEXG7y527zhE5Fh
         Nnf4KLG2SvGW0ile9mVQDkKMD/wu44xF6aHm4t+aQix9pYiMOFRNwilbBVV/AqdBbggw
         lbrzNWmGevhnq7BagE4LKXH39Qk2QB8GNtrGYzM0G+pA5JBDjX6nAxfY3FaH0SqzHrEV
         dlsLYN8CiTLQvhQmZf/p+QrTFi6DTwOMd+Rv+bPW45lDTa+zKrTHJ+YwykHuewfrkhk7
         yZ+g==
X-Gm-Message-State: AFuF++nGmPSJrXot/rxb0TIeU1JRHzUhvpbwi1joHCoyepzE4KgHf0Pe
	P0mE3ShniV3oidR5APzrFonnnMysIvfCsge1+hTXY0Rq83FuUysJ5vUZW7nJbmGZcf2lUZF9enh
	HWBPq
X-Gm-Gg: AYBFou2/0dD/oYKy3/zypfjFbssUFmAcXT7VQlQsdu8RLGJePwxPo8DccTl8L3ebn3N
	H49tLq4GgktrnxB2ScIokOJSi+DS08RIlYgSb2a8fbql28wum0Mj9f6VrdILRy8Mn5nmtKTQxEk
	0Iq+1v5zhY8WQErZ6UBW9592e1Nj55jhhQjD+G1x4VtxShUynH4Fq4eO5X63IQsNgFF6LDrFn+5
	UJLrrpDeKIg05w+eekBtzTfRNpeSrz7BOCLND5G4mwp2wL4KGQH/zrGlUC3dCvs8Jyh8TIiAYT2
	3wptvfh+XkFoZt5OG1xbUR3wvtKrbneE8wSk7Y8dfC3r1fmNIV/9zEXoYTC1rOmtUeYbAS7f37Z
	mdGzjGXOO6i1/K2VwJLEhFTn+RkCbIhWefq2d5ldBXjY+LzdminfCRgTZCjjy/Yl+q3H+jrwUUQ
	uAJ+zeoGXWrj0KEDo6ki5so7wtwgQCdTX27WScBU+PVHuP2cApMlbY
X-Received: by 2002:a17:90b:2b90:b0:38a:c3f:3b87 with SMTP id 98e67ed59e1d1-396d0fce294mr20886463a91.12.1787961795124;
        Fri, 28 Aug 2026 17:03:15 -0700 (PDT)
Received: from b455de3d9de8 ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-142e0de4de3sm13236733c88.12.2026.08.28.17.03.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 17:03:14 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: KernelCI Metrics Report - 2026-08-29 00:00 UTC
From: KernelCI bot <bot@kernelci.org>
To: kernelci@lists.linux.dev
Cc: kernelci-results@groups.io
Date: Sat, 29 Aug 2026 00:03:14 -0000
Message-ID: <178796179359.6164.1701936555835723508@b455de3d9de8>

KernelCI Metrics Summary
========================
Period: 2026-08-22 00:00 UTC to 2026-08-28 23:59 UTC


  COVERAGE
  --------
                   This week  Last week           Change
                   ─────────  ─────────  ───────────────
  Trees monitored         26         31               -5
  Checkouts           13,742     84,440   -70,698 (-84%)
  Builds               9,875     11,937    -2,062 (-17%)
  Tests            2,388,299  2,671,052  -282,753 (-11%)


  BUILD REGRESSIONS
  -----------------
  A "regression" is defined as a reported problem affecting 0 or multiple builds.

  Origin           Regressions        Affected  Affected builds by top issues
                 (known + new)  Builds (total)         #1        #2        #3
  ───────────────────────────────────────────────────────────────────────────
  maestro     22 +   0 =    22             604        124        97        56
  microsoft    1 +   0 =     1              16         16
  redhat       1 +   0 =     1               2          2
  ───────────────────────────────────────────────────────────────────────────
  Total       24 +   0 =    24             622


  TOP REGRESSIONS PER ORIGIN
  --------------------------
  maestro:
    #1 (124 occurrences) -  ‘key_pass’ undeclared (first use in this function) in certs/extrac...
      Dashboard: https://d.kernelci.org/issue/maestro:c8d36aa6848ceeb5f21060331b3fcc14fe6c4896?iv=1
    #2 (97 occurrences) -  use of undeclared identifier 'key_pass' in certs/extract-cert (cer...
      Dashboard: https://d.kernelci.org/issue/maestro:3f4a6e9267e202205cf56c65e64d2cb3d3f4f4b6?iv=1
    #3 (56 occurrences) -  ‘key_pass’ undeclared (first use in this function) in certs/extrac...
      Dashboard: https://d.kernelci.org/issue/maestro:1bc31bdc5afab00de98efd0c67ef8653e5385a69?iv=1
  
  microsoft:
    #1 (16 occurrences) -  implicit declaration of function ‘macb_alloc_tieoff’ [-Werror=impl...
      Dashboard: https://d.kernelci.org/issue/microsoft:ab342dde3ba45ce2efa0c064a3051aa43ce98e30?iv=1
  
  redhat:
    #1 (2 occurrences) -  openssl/engine.h: No such file or directory in scripts/sign-file (...
      Dashboard: https://d.kernelci.org/issue/redhat:54dfb8887344e76e107b693682922a26eb7678e4?iv=1
  

  TEST LABS ACTIVITY
  ------------------
  16 labs reported results this week (1 fewer than last week).

  Labs marked with an asterisk (*) are new.

  Lab                    Covered builds   Boots       Tests     Change (tests)
  ────────────────────────────────────────────────────────────────────────────
  aspeed                             42      42           0                  0
  broonie                         1,207       0       9,628         -595 (-6%)
  lava-broonie                      279     687     293,254    -106,448 (-27%)
  lava-cip                          302     818         126         -74 (-37%)
  lava-collabora                    550   3,487     265,740    -129,413 (-33%)
  lava-foundriesio                   65      69           0                  0
  lava-kci-qualcomm                  96     394     364,830   +326,364 (+848%)
  lava-kontron                      126     240           0                  0
  lava-pengutronix                  170     410           0                  0
  maestro                         3,834       0   1,210,143    -302,476 (-20%)
  microsoft                          74     391      16,437         -125 (-1%)
  opentest-ti                        79   2,090         946        -296 (-24%)
  pull-labs-aws-ec2                  83      83          83         -27 (-25%)
  pull-labs-demo                    320   1,555     213,457     -65,211 (-23%)
  redhat                            251       0       3,244        -450 (-12%)
  syzbot                            105       0         145         -18 (-11%)
  riscv                               0       0           0     -1,286 (-100%)
  ────────────────────────────────────────────────────────────────────────────
  Total                           7,583  10,266   2,378,033    -280,055 (-11%)

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
