Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F20852D97AA
	for <kernelci@lists.linux.dev>; Sat, 16 May 2026 00:01:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778889686; cv=none; b=guS9fIY3xK5hHv7wUg3h/ZRIQ4hLi3e8RRln8ViY4V4yAwuH9O3tIoFXZ4UNmSNgCM5nCSarC0E+O3me/GhcwqXNVdyqEFdXTJz+4Vh8demvuLU7BxbZVbsJ2iTRlwcneW3q6HqvSiAnhrgy86yQnk4ygA/+OFHg+8Km8JuLJ2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778889686; c=relaxed/simple;
	bh=wnjFKuCJtMZ7Dn50w0fb0hjHIezOTSVy8RkToG2IXqo=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=ruZJOEqkhBrilMsaCABI686GyV2yGsLSayb46S7NNyDctxhZcNI4pk7xhEF4NsZ+qqU7DeqJhnVbuwZSPFwgWPaCdva9cYRUYlIlfcqF5P72jvleF7oNj2F29tfVsK2kcnXnlvZkEZxhDMQeKxsV4xCDyC8Nva6+7bjhYXHEbS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org; spf=pass smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b=PM0P1+5a; arc=none smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b="PM0P1+5a"
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-2f0ad52830cso536643eec.1
        for <kernelci@lists.linux.dev>; Fri, 15 May 2026 17:01:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci.org; s=google; t=1778889682; x=1779494482; darn=lists.linux.dev;
        h=message-id:date:cc:to:from:subject:content-transfer-encoding
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=aA0x9WJg39zwk+bejP44dFhgmeOU3iLW1pIjIruF7Z4=;
        b=PM0P1+5atAXEbgdJtFNKAnHWQrORYQYXHag6PPuEpH4fW0kBP6ater1R3bTNzESNpv
         BJ3EbNaTSs8VrZljEgzKKe8/H38iDnHZ2OV+ONyw5p9eRUQc0R3TKRDIYePuaKkJ5SEz
         WmVu6Spj4Ry6CQ05kyYN6RiT8n22V9uXMNDPYeiv+FdGOoMp4J8XFXnKvL+VFH7TgF+T
         S7NcBmC5zpvp1c4DBHCowhN9z/QF9MecMRSFRRL5SQ72AKiwK3HzryC/r7bs2gxIlRc0
         HakRGkm59/2K/+Qn8D6c3x6vJ4RGW6aZVGETyeO+B5dyCNnPB/XIu0TsnJEuS2q9yDjg
         niBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778889682; x=1779494482;
        h=message-id:date:cc:to:from:subject:content-transfer-encoding
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aA0x9WJg39zwk+bejP44dFhgmeOU3iLW1pIjIruF7Z4=;
        b=OcDDXj8qoiiKqZIOZzc3rPs1LAqHyM+ZnYKznDD8xrgX2omnyK2Hr5Ib7XNQKaZV0d
         ZrkQJcbOcbRN9Vlof+eznznFjQK3IUE4GjIwW7bAHYm1z7RADpSD3J69oB7haPFhUeld
         2v+gj04zjDcV54/YKbydOqX2NOXDfu4JZXpE0Kgu0DW58dy5ztim51/fq3IxoKGKYTjI
         gttgYcHQ9I0T51Rqh8IaH3vDzCL0GblhuKaGYWcMLPeabX1reHmxMwTXuT01vkLcYOe4
         BNoQHkhWgWfXveRRiunpJLtVpvuS941h4YlBrAKX+4535C9phMzZWRe8nxe84JicP5cN
         fZ/Q==
X-Gm-Message-State: AOJu0YyT1y2yWIecr+Kc9Kzlc6oqyfjzQ2KGHYZrx3uqsS6AomTwlceK
	xtTGrJbe0HTgag7zn8yKweN4XW6ZHGgXFDNOZKLkkkHFrOEgvyUNB0zQgA/TbDYayqgchu2TdtA
	qYsa0
X-Gm-Gg: Acq92OHAllkRVbrIoN65ejk3nKCWRhAZX+bhdqbsrbdMR0PX3M1xqtXFwbZ4K225keg
	UIxE2KeyV917qwcohxMUpAzt9dys9+46ohgvzZYc+ORqo95yqtrQ9F6BSj/DOxlYNRp8K3+gkUn
	bdb9r4tKp4lBBv9BiD3OPzbI5jQfNV1HRngwYPXM5yod+HRHcs1Xjm0En0ubQnBCc5ZNBmXhtbK
	9eQvb9PhPx/6giaiyzlDMcURF/fIvv6HBORHq7z27awDyJufjBoIi6/1c4TROxxX4NVOgm5h9Nr
	pk7Q5cIfPOoG++3Slk7dK9pmblFm0/U4xE0vAtlnl7XDnqjsQtm/701Yvhro91wbf8Otzb5+SFe
	3qcihJXNIKw8weq2lnSx/cJmj1LY96EHCBH67PUQysbxJ6c5dknu9R9Mb6WFodXz+mS/MJ/tkWU
	MOTWU0aQgArm85eIpTkVxSGk/TQDo=
X-Received: by 2002:a05:693c:2c93:b0:2cf:28e8:d784 with SMTP id 5a478bee46e88-30398655310mr3062427eec.19.1778889681812;
        Fri, 15 May 2026 17:01:21 -0700 (PDT)
Received: from 330cfa3079ca ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30296dcc464sm9024490eec.14.2026.05.15.17.01.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 17:01:21 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: KernelCI Metrics Report - 2026-05-16 00:00 UTC
From: KernelCI bot <bot@kernelci.org>
To: kernelci@lists.linux.dev
Cc: kernelci-results@groups.io
Date: Sat, 16 May 2026 00:01:20 -0000
Message-ID: <177888968034.1180.2360294470400147176@330cfa3079ca>



KernelCI Metrics Summary
========================
Period: 2026-05-09 00:00 UTC to 2026-05-16 00:00 UTC


  COVERAGE
  --------
                      This week    Last week    Change
                      ─────────    ─────────    ──────
  Trees monitored     37           35           +2
  Checkouts           6,206        5,455        +751  (+14%)
  Builds              8,725        9,777        -1,052  (-11%)
  Tests               1,482,025    2,110,144    -628,119  (-30%)


  BUILD REGRESSIONS
  -----------------
  A "regression" is defined as a reported problem affecting 0 or multiple builds.

  Origin    Regressions       Affected           Affected builds by top issues
            (known + new)     Builds (total)     #1      #2      #3
  ─────────────────────────────────────────────────────────────────────────
  maestro   9   + 18  = 27    165                32      27      22      
  redhat    2   + 2   = 4     34                 20      8       4       
  ─────────────────────────────────────────────────────────────────────────
  Total     11  + 20  = 31    199


  TOP REGRESSIONS PER ORIGIN
  --------------------------
  maestro:
    #1 (32 occurrences) -  the frame size of 1056 bytes is larger than 1024 bytes [-Werror=fr...
      Dashboard: https://d.kernelci.org/issue/maestro:2d2c5f1e10db58dfd3e3dede1ad14b9b83331a14?iv=1
    #2 (27 occurrences) -  'HMAC_Update' is deprecated [-Wdeprecated-declarations] in crypto/...
      Dashboard: https://d.kernelci.org/issue/maestro:cfb7db7bad026f784ab5093df91515e27c634b34?iv=1
    #3 (22 occurrences) -  'HMAC_Update' is deprecated [-Werror,-Wdeprecated-declarations] in...
      Dashboard: https://d.kernelci.org/issue/maestro:021b40dfd5975368e21597a2c6562227b2764716?iv=1
  
  redhat:
    #1 (20 occurrences) -  sys/types.h: No such file or directory in usr/include/linux/drbd.h...
      Dashboard: https://d.kernelci.org/issue/redhat:7f61c6c8ded5b3e2900771e9fbbaa5ae7fedd8d7?iv=1
    #2 (8 occurrences) -  error: target emulation unknown: -m or at least one .o file requir...
      Dashboard: https://d.kernelci.org/issue/redhat:a8b090056d8e6bc4eee9ffa4389946c992a6e989?iv=1
    #3 (4 occurrences) -  conflicting types for ‘is_file_epoll’; have ‘bool(struct file *)’ ...
      Dashboard: https://d.kernelci.org/issue/redhat:6f483bf71223f2328c76bdebfd273526b39407d2?iv=1
  

  TEST LABS ACTIVITY
  ------------------
  15 labs reported results this week (unchanged from last week).

  Labs marked with an asterisk (*) are new.

  Lab                   Covered builds  Boots    Tests          Change (tests)
  ────────────────────────────────────────────────────────────────────────────────
  broonie               1,400           0        6,820          +1,153  (+20%)
  lava-broonie          314             1,226    273,074        -72,223  (-21%)
  lava-cip              330             807      81             -40  (-33%)
  lava-collabora        520             3,068    184,579        -87,059  (-32%)
  lava-foundriesio      84              118      0              0  (0%)
  lava-kci-qualcomm     67              36       11,225         -66,116  (-85%)
  lava-kontron          184             275      0              0  (0%)
  lava-pengutronix      184             495      0              0  (0%)
  linaro                18              36       216            -108  (-33%)
  maestro               972             0        984,793        -404,636  (-29%)
  microsoft             55              328      5,928          +1,586  (+37%)
  opentest-ti           46              1,410    608            -221  (-27%)
  pull-labs-demo        387             566      1,436          +1,110  (+340%)
  redhat                359             0        6,184          +1,669  (+37%)
  syzbot                46              0        57             +16  (+39%)
  ────────────────────────────────────────────────────────────────────────────────
  Total                 4,966           8,365    1,475,001      -624,869  (-30%)

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
