Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D7FA23392A
	for <kernelci@lists.linux.dev>; Sat, 19 Sep 2026 00:00:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789776025; cv=none; b=FhdQDpLezsTPiRNy5dMjH0OONASmnXNe9jLi6E+8DP05VH9SuZD2iHwYSIzLAH4Y+aMt7XVtZf2+HIhMhHa+06xq1GTZAEb9ylr4Khxo6qwnfVFhMMLP/utmCtR36AOnLUR1NY1Jd5HRZSZSqm6WVoNoOeD9VHm1xAERpDi5HFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789776025; c=relaxed/simple;
	bh=V3JiZGGtcVDW3rPvlypDLZ8BpZh3o21tgAiwvdvvDhc=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=IT2YDSOQob68n/ma/ZJAG50G1pRWfHOe3O2PnF/ICrcDBat1Umzclj+keUnx61WtH8ykKHlLzHAYcOivbHpEFG+7At6LybbgY2AOejLsJNrCs5jCEw3ejIKrf/wWH5SxfulUkK56xbvFHbh3lZ4pIJkXUf8dw/xMk2B/s/LPyps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org; spf=pass smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b=LnLUmFh4; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b="LnLUmFh4"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-398c066106cso1111504a91.1
        for <kernelci@lists.linux.dev>; Fri, 18 Sep 2026 17:00:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci.org; s=google; t=1789776022; x=1790380822; darn=lists.linux.dev;
        h=message-id:date:cc:to:from:subject:content-transfer-encoding
         :mime-version:content-type:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ha0aCAto0dP2Blu+xTCOQOoF7hXLLxDYWfE0c75lIJk=;
        b=LnLUmFh455K+RH1FpsyVEZAqGL/E1Dpjf5M7R43fb3CO2hKyoNYgT26NwaUA8bIpJd
         NW9nVkhVKEyUe072Fs4RrzFqK53iTp+RwT1W2N59mo9CgrkWiSf0w1Y4vwVR/YvVVKAd
         JoyYCJHmWudaC9/5V7WcTQvYsaIkJQ9178cVrl63CenMnINQ/Q/ay3w0ZVabnf5U6o8F
         aTOXDOzOnuBThKKW6/S/gssex9WEUpKOqoS5d2oatUofAo7dDF6JD2PtoteIOvkyUAWc
         /BdPPbdSCpZAMNTqjbcsYkI4fgZemjf7z6pYrqw/CCj8H/6v+ag5qqxVNl2Q20P88MG3
         BwOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789776022; x=1790380822;
        h=message-id:date:cc:to:from:subject:content-transfer-encoding
         :mime-version:content-type:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ha0aCAto0dP2Blu+xTCOQOoF7hXLLxDYWfE0c75lIJk=;
        b=ouPtCc2Cw35pr21meyAlAcBPy9FF9AqYYEqkWwwIjaEk3zsgLnPisQR2RQ3JqcWcgC
         3tD3wvv5z9rmLTNFXvFEXR0ee/Rx0F7vhQn09TPD45JRodyA8NdcNzRerIaMHpOibKV2
         xsA2KtgSx2JwhsaHz5MW26jAEmL5wjWAk4X+FbRQqNOgPQm0uUDhCXpPZnZxkW2Be8GM
         ZFdCf7C0JeN6kNxwqYEg8/0/yfIZrNEy96yH/z/oE8Ll+fatts2uDEUEVhmRyzAGdFfr
         PhTJe8fcQvX7W3ix+9+GL2A0316E/fOQllKoTrs1veAMmJCLvyJuDuDFr1Vp/iK+CWpv
         /jsw==
X-Gm-Message-State: AFuF++nScmwGITWMnEXInnAbVMuSf55/rXKk3ruMfRcSuPoeB5JpRSnw
	p+M9pqrpEytKElN3uUl2D7IOD6eleiX9NN7jjlc1F2A/IU/A2ZY14hxgWQKMwW5YWpndXttOXJX
	nLHOM
X-Gm-Gg: AYBFou3JeXDLF6lgvAND+jm5xXicej88LtyFmKApQ44uclVggDT2IKylgeCmgtRXjKT
	7PdgR6q28D134AQbLKV4ZzTa0NfO4C6+SDezp2Pyhk0QatGYV2USBhw0hwOOjfNqol//5/HHqi4
	dKzwNz/8++vvPNM4Fvw997uWGIo5oiT+Srwg7eQQKLHFulVNEGx494wtDpGAKjMQ8z9tSTZ3MhX
	9PUPlz/AoXqwoqUm1FcERDCmRiPEoJTbPqpAXbGH/4HzC4utz1AUSrAJXP8amHZHpAmlYLWGkdp
	gyUQQgSIMyP7iTLmeEScHhxThEn3H2CJEnIRWpWTnHeI5LVEFO5RBGQlorK78UVOygR9XavgdXs
	WPieigMjBCbp3O55la/j/sMuEZ4GwdEtYUBvLVNQvMfUUY96K31muExBRhW5KkFchtdRypxFIrX
	B33yNFcZTzC2LW5muixFeCXDFxUCfXPPcEaVIXpUdsuIHzMECIXtREW7AwrstYXFM=
X-Received: by 2002:a17:90b:4b86:b0:39e:21a7:5dfe with SMTP id 98e67ed59e1d1-39e54c5a1ecmr13681969a91.3.1789776021602;
        Fri, 18 Sep 2026 17:00:21 -0700 (PDT)
Received: from ec7b70f3a45c ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33c33140f7fsm1914557eec.13.2026.09.18.17.00.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 17:00:20 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: KernelCI Metrics Report - 2026-09-19 00:00 UTC
From: KernelCI bot <bot@kernelci.org>
To: kernelci@lists.linux.dev
Cc: kernelci-results@groups.io
Date: Sat, 19 Sep 2026 00:00:20 -0000
Message-ID: <178977602024.219483.12377595042107850610@ec7b70f3a45c>

KernelCI Metrics Summary
========================
Period: 2026-09-12 00:00 UTC to 2026-09-18 23:59 UTC


  COVERAGE
  --------
                   This week  Last week           Change
                   ─────────  ─────────  ───────────────
  Trees monitored         38         32               +6
  Checkouts            5,642      6,136       -494 (-8%)
  Builds              13,512     11,412    +2,100 (+18%)
  Tests            2,548,302  2,285,578  +262,724 (+11%)


  BUILD REGRESSIONS
  -----------------
  A "regression" is defined as a reported problem affecting 0 or multiple builds.

  Origin           Regressions        Affected  Affected builds by top issues
                 (known + new)  Builds (total)         #1        #2        #3
  ───────────────────────────────────────────────────────────────────────────
  maestro     34 +  27 =    61             728         73        64        52
  redhat       0 +  22 =    22              24          2         2         1
  ───────────────────────────────────────────────────────────────────────────
  Total       34 +  49 =    83             752


  TOP REGRESSIONS PER ORIGIN
  --------------------------
  maestro:
    #1 (73 occurrences) - Error in defconfig (/tmp/kci/linux/scripts/kconfig/Makefile:95) [lo...
      Dashboard: https://d.kernelci.org/issue/maestro:f2c3a9af64a352cb6c8e900e9cd6c2255f242f24?iv=1
    #2 (64 occurrences) -  shift count is negative [-Werror,-Wshift-count-negative] in driver...
      Dashboard: https://d.kernelci.org/issue/maestro:ce5ec46ecf72462fff1bede413010b22a34a9494?iv=1
    #3 (52 occurrences) - incompatible pointer to integer conversion initializing 'u16' (aka ...
      Dashboard: https://d.kernelci.org/issue/maestro:589dd74353ed355c3d244d9938073a4aa60735bc?iv=1
  
  redhat:
    #1 (2 occurrences) -  bpf_testmod.ko: symbol 'mutex_lock' undefined! bpf_testmod.ko: sym...
      Dashboard: https://d.kernelci.org/issue/redhat:b45a5a7b13813f04d16113ef586fe2755fd49a56?iv=1
    #2 (2 occurrences) -  bpf_testmod.ko: symbol 'mutex_lock' undefined! bpf_testmod.ko: sym...
      Dashboard: https://d.kernelci.org/issue/redhat:3c9ae2ca386ea741a17b3ad7ae6af27cdb1825cd?iv=1
    #3 (1 occurrences) -  gcc: internal compiler error: Segmentation fault signal terminated...
      Dashboard: https://d.kernelci.org/issue/redhat:3d8046a51e082ab1786179feef5c580e32804275?iv=1
  

  TEST LABS ACTIVITY
  ------------------
  17 labs reported results this week (unchanged from last week).

  Labs marked with an asterisk (*) are new.

  Lab                    Covered builds   Boots       Tests    Change (tests)
  ───────────────────────────────────────────────────────────────────────────
  aspeed                              9       9           0                 0
  broonie                         1,761       0       4,785     +2,062 (+76%)
  lava-broonie                      367   1,115      59,414           +59,414
  lava-cip                          247     563         272              +272
  lava-clabbe                        14      69           0                 0
  lava-collabora                    548   2,280     202,726    -24,024 (-11%)
  lava-foundriesio                  135     135           0                 0
  lava-kci-qualcomm                  82     227     232,541    +57,675 (+33%)
  lava-pengutronix                  313     759           0                 0
  maestro                         4,635       0   1,979,918   +314,744 (+19%)
  microsoft                          74     399      19,916     +9,750 (+96%)
  opentest-ti                        64   1,339         442        -85 (-16%)
  pull-labs-aws-ec2                  87      87          86        +12 (+16%)
  pull-labs-demo                    352     920      33,285   -159,196 (-83%)
  redhat                            203       0       2,467       -351 (-12%)
  sasha-lab                          40      63       4,369            +4,369
  syzbot                             68       0         116        +16 (+16%)
  ───────────────────────────────────────────────────────────────────────────
  Total                           8,999   7,965   2,540,337   +264,658 (+12%)

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
