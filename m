Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91FF526ADC
	for <kernelci@lists.linux.dev>; Sat, 27 Jun 2026 00:01:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782518489; cv=none; b=e7SQeGzs7xozD6YFPjL+n9X/yeOhmofitBxtm7LN1wl653zPH2VDCv7vMtKa3CMOUcGNaRSK5sBZoqAd3KH2tdqHe4/s4m+rqrKctCFC+vBpBpuXujXviku/Pyj61ErnIM5S22/lLt48rRtaRloJovL2m8PG6AHY4E550lICMxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782518489; c=relaxed/simple;
	bh=82Xz0CURBuRRCFsnS/9cMwJbgqgQPbYuI8NJBdSbxhc=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=gBo2gFDCYoKdXXijkAVu0Z/vbbBe+lyFKU5pTYR5H7sThL5juA0x/KG0LlWVuFP/SkquqojldSJDIedXqbLvFjJuLEDVy7OQ12GQMxZqIy6jTRnQvN3wVWxN0tncDW3R5rTIY61AOWrzGz8FfHHPehaY/T+XAoxBp5XQ10QSqJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org; spf=pass smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b=hbhzu+TH; arc=none smtp.client-ip=74.125.82.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b="hbhzu+TH"
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-30c8b23420bso2554912eec.0
        for <kernelci@lists.linux.dev>; Fri, 26 Jun 2026 17:01:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci.org; s=google; t=1782518486; x=1783123286; darn=lists.linux.dev;
        h=message-id:date:cc:to:from:subject:content-transfer-encoding
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=IgEkzW33Z6IBu8cGnr8KeU5rKyDPrvx+23V6KEcPbhU=;
        b=hbhzu+THPvvu2OIoTfT6EsGgmObi4rEfBrpT/M2eREszeVbSD/7+6CPvyq18hO3Rhy
         znCJL/6XCi+lpjEsnPlajJlX3+oRgaGNBJqTLtYsgPd7/2NBotwOz3AK/O1LQkt0S1Oj
         0bE9Lss1RDfii18Gch+yu5QalofD0VlzgwpBZ6sJ+7qddFhNlD7bCkELWN67KQ3qe8mJ
         OIBzmO1sjBOKr9YjHofQ/iE9Tnzsigxbr8/u3UNP4vQ9IUoZ8J4Gqzc24IVltfFuQDnV
         Sr7QysmgBcg9cZYnJDQzs6HbUSl4jerxKkXbl4PjwjgaEItpMiCepK1Tac4tR4XP11tM
         UPbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782518486; x=1783123286;
        h=message-id:date:cc:to:from:subject:content-transfer-encoding
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IgEkzW33Z6IBu8cGnr8KeU5rKyDPrvx+23V6KEcPbhU=;
        b=Vji3gaKrqZo/d3mM4aQmCovEuhNImBB8ePmJm4Crtv/mY/qhA0M1qWqmFjHSuW5rab
         6dgfjstkC1bIan2RlRXbjUins0e9jF67l48O1vzG0AQSZbWGPg58JWfXzNmxCQJlcjXs
         t/dPsmNamKtVzfUo14VUp9ytvUhpld0eEiuGKA4VEVpMeZTGkyk0cmCynT5TXL1u+lUn
         6Vu7djWl3B8z3w3d2zz7958z+kOsal9clhlocIG/szn67ZQCZV0P2LCtSzbLArBIQAVK
         PCH0s9ONrvNybutRLwBEHY/QG5IiNPXpqVhUPPvo+KqRWKrrnhp/7YBthBQv0ibfTVs4
         BvuQ==
X-Gm-Message-State: AOJu0Yzhaj1xgNy9RxNr9Aal/6WcJWI1yLd+tFj1gPK5S59HgkRBdIm7
	oXh3fV7+KwQp3IfxR+CMCh+cqj5+B80V1D7lssygXJ3dTW/FyHG2GzxDO/rw60sti35gMS4+rhJ
	gUpGC
X-Gm-Gg: AfdE7cn7xi+mhVPlTF6ciyf10gtqYgk5F8qsfGS4RGDNjPwA5FpJkHL0ICfmVhMx37x
	2qn2PmtmTrhd8xYHc392M7cjgZ6Eg3AOs8xII//Q/AkewJKYo+f7rJ4lZYsHcX3ZvtZwLiO94HK
	FoIoFZQ06/NdRHMPuGQGZfvqWF0Ab4zMuE3YYxIEoHjYnlrAbSHh++b7UekAJVLe2X0MbnPZsmJ
	esax/2eNb+g6GLIiARdkq8wrxez3mn8XF7wO4EEQ0g7ttZSk0wcIx+EXYQ44tgT2r/NAKBh26IS
	CPIz9r7Hksiof7Vh7ro1nmXWFNf+kR/+d4fLmgPhuN/aawTA4FQAhbzWN3Y6iYRuZqGSngTKusx
	voZ6fIqqv/F37gaLIkt5e+XsCV1L4HBMxB4/EIZ1JPY9x4G7Y1EHXKv7irs6zc7pU2HMCZOVhsD
	H7zwv3/g==
X-Received: by 2002:a05:7301:1930:b0:30c:639f:ff8f with SMTP id 5a478bee46e88-30c84d75564mr8721741eec.8.1782518486342;
        Fri, 26 Jun 2026 17:01:26 -0700 (PDT)
Received: from 963b246bc1b3 ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-139d90e95c6sm32163753c88.11.2026.06.26.17.01.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2026 17:01:25 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: KernelCI Metrics Report - 2026-06-27 00:00 UTC
From: KernelCI bot <bot@kernelci.org>
To: kernelci@lists.linux.dev
Cc: kernelci-results@groups.io
Date: Sat, 27 Jun 2026 00:01:25 -0000
Message-ID: <178251848510.226.12739329362296868992@963b246bc1b3>

KernelCI Metrics Summary
========================
Period: 2026-06-20 00:00 UTC to 2026-06-26 23:59 UTC


  COVERAGE
  --------
                      This week    Last week    Change
                      ─────────    ─────────    ──────
  Trees monitored     29           34           -5
  Checkouts           25,042       58,570       -33,528  (-57%)
  Builds              6,616        8,862        -2,246  (-25%)
  Tests               1,806,249    2,905,508    -1,099,259  (-38%)


  BUILD REGRESSIONS
  -----------------
  A "regression" is defined as a reported problem affecting 0 or multiple builds.

  Origin    Regressions       Affected           Affected builds by top issues
            (known + new)     Builds (total)     #1      #2      #3
  ─────────────────────────────────────────────────────────────────────────
  maestro   10  + 3   = 13    140                29      21      21      
  redhat    2   + 6   = 8     13                 5       2       1       
  ─────────────────────────────────────────────────────────────────────────
  Total     12  + 9   = 21    153


  TOP REGRESSIONS PER ORIGIN
  --------------------------
  maestro:
    #1 (29 occurrences) -  stack frame size (2088) exceeds limit (2048) in 'dml31_ModeSupport...
      Dashboard: https://d.kernelci.org/issue/maestro:96417cd30041ab8f3153128d0120c6cd70782d99?iv=1
    #2 (21 occurrences) -  ./arch/x86/include/asm/checksum_32.h:149:6: error: inline assembly...
      Dashboard: https://d.kernelci.org/issue/maestro:cda3cc6e84621dd79dcc795d5d11509fe0f841c1?iv=1
    #3 (21 occurrences) -  'HMAC_Update' is deprecated [-Wdeprecated-declarations] in crypto/...
      Dashboard: https://d.kernelci.org/issue/maestro:cfb7db7bad026f784ab5093df91515e27c634b34?iv=1
  
  redhat:
    #1 (5 occurrences) -  error: target emulation unknown: -m or at least one .o file requir...
      Dashboard: https://d.kernelci.org/issue/redhat:a8b090056d8e6bc4eee9ffa4389946c992a6e989?iv=1
    #2 (2 occurrences) -  openssl/engine.h: No such file or directory in scripts/sign-file (...
      Dashboard: https://d.kernelci.org/issue/redhat:54dfb8887344e76e107b693682922a26eb7678e4?iv=1
    #3 (1 occurrences) -  in /tmp/rpmbuild/BUILD/kernel-7.1.0-build/kernel-7.1/linux-7.1.0-9...
      Dashboard: https://d.kernelci.org/issue/redhat:e8464f1eea373ba65c76b7eca7b9730f925d666e?iv=1
  

  TEST LABS ACTIVITY
  ------------------
  17 labs reported results this week (unchanged from last week).

  Labs marked with an asterisk (*) are new.

  Lab                   Covered builds  Boots    Tests          Change (tests)
  ────────────────────────────────────────────────────────────────────────────────
  broonie               1,308           0        9,884          +5,038  (+104%)
  lava-broonie          214             590      209,599        -104,309  (-33%)
  lava-cip              211             593      0              -74  (-100%)
  lava-collabora        405             2,030    249,099        -146,730  (-37%)
  lava-foundriesio      42              42       0              0  (0%)
  lava-kci-qualcomm     114             233      293,770        +19,836  (+7%)
  lava-kontron          106             205      0              0  (0%)
  lava-pengutronix      100             255      0              0  (0%)
  linaro                27              27       0              0  (0%)
  maestro               2,455           0        912,597        -749,002  (-45%)
  microsoft             64              343      10,806         -1,060  (-9%)
  opentest-ti           83              2,179    979            -477  (-33%)
  pull-labs-aws-ec2     59              59       0              0  (0%)
  pull-labs-demo        262             614      107,827        -115,814  (-52%)
  pull-pengutronix      13              13       0              0  (0%)
  redhat                228             0        4,455          -876  (-16%)
  syzbot                41              0        50             -5  (-9%)
  ────────────────────────────────────────────────────────────────────────────────
  Total                 5,732           7,183    1,799,066      -1,093,473  (-38%)

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
