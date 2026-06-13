Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 169461C01
	for <kernelci@lists.linux.dev>; Sat, 13 Jun 2026 00:02:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781308947; cv=none; b=DiuawzTrZkd+DlEmdQtTZRwPnTQqFJpLoszo4HtLJByraT1RFKVKWL1vRayLf0fO4eJ6UvrAQP/fqsENv7LwQenoS+hx1fShOLmQD2rw/W/tbG9blGgMIxVbv21DfhkVKuXMO0U/X5uFMwljNRd8MYXj6NIJu2bLnhnRRudppv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781308947; c=relaxed/simple;
	bh=Rhg7jyJ/OlIdpJgLNRqXFdM0YAzWdBjkjWy83mWtgKQ=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=SNWkU2gyQjwqiASQIQv093j9BDLtJFZnM84T5h8uix8gnGj1hXNWgeBPLsK96esDmWIVMQh4PZcOv6Z/HDYdyxgUOWLv/BScApJ1ElIj8OoW68GqoXgO5vhF+YH/Y16puYAL/LYQOIkBq0EtTR1K06i7wypFY+CkXuSqzVqDEdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org; spf=pass smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b=gWERR1s8; arc=none smtp.client-ip=74.125.82.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b="gWERR1s8"
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-1384eb94d20so1795187c88.1
        for <kernelci@lists.linux.dev>; Fri, 12 Jun 2026 17:02:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci.org; s=google; t=1781308945; x=1781913745; darn=lists.linux.dev;
        h=message-id:date:cc:to:from:subject:content-transfer-encoding
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=n7jI3mADF60tP+0hD4nf+e8lzj3NOjAdbheaesXKrCo=;
        b=gWERR1s8PXH0FhfLpsoaqSenlt2+DaPF833PMoU8eRFFx4KI4uegI5tgNuxnhTYlaE
         XJAt0a5fK4QhjL7aFNmD4MVCVIclgnYHE2wjOnyWAZRa/rvG47zqwDMozjsUCH3qb479
         HArmHGFNkNAQylkLejtHrwHBJm6r7VaaO9QTHz014m/0YHyzemDo58x4DIBQ41m/9JRr
         hF0m9g4ZZ9jM24aJHOFqbp1Gi9PlOm2SUHd2HiAVzPZ74GRWsQnl5CoaGwKLRbpdwoR8
         EvzxxCTDaqYkP4lN2+UqEEyS5ycVliVu8JPdxGyB+gmf7H66k68vaqB+fEadtbydqVCT
         ZIQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781308945; x=1781913745;
        h=message-id:date:cc:to:from:subject:content-transfer-encoding
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n7jI3mADF60tP+0hD4nf+e8lzj3NOjAdbheaesXKrCo=;
        b=sgQT+x0rI6HDowO4oU+n5lH/V8Qua/QuY18qnA0A3wxg2ONdsZsOyIVmOt7NB7ys2X
         KjDy2zYzUUtO30unRH49JkaUHRgBLcOpAZ44CgAjqCJa5jKdDPvBNoZITXfGP7RrKegx
         F3ElJeu88F8hqiZ3mdhM3dil9TQkjoHsoVezfCXQz4Mfc3yYbNyGUvzZ7i94xMAf7/1z
         lZhQi/vNgy0lIQOG4BWJs/evDE+/1ceqNLJj0x6L/U6nre5SvC3NhZWOkxas7ZiuWQYV
         qNYB7vnThpmMWH6//AgM9mvoWOUQh4I0OaRvbdbUq4Sa2V54NO+7wNF36eLs2JCaEkQm
         4skQ==
X-Gm-Message-State: AOJu0YxF2PDK9PA12bx7SzJsPt//rvr9yjtveXV1nXsPg/4AjowicReV
	oYdQFaxr/+z15GgHD8hj+KofHQslWhzJl4BrFChX65p1WO0EVgkPFrAo3E4qlOStSBeIvC3TGH5
	C31hT
X-Gm-Gg: Acq92OEI/9DZ75o2LLAyAqVl+Km+YLF0y0A5zgAM665VAwxIqmBAJelJJ9V+bQwuzv7
	s2TIaqGIqZ0JL9h3X/jITMbh82mJZniz/HUy6s0hctL2u+Wu9G2Bpvp9l/K30OJyZ2hjv4SsV5u
	TLFR0jjxR2wfxZI/q4AeGv3Drgj6WI5/maRJ8S7oLq8+QlClnNg52yjMSdQhdPDARuACQ6I9TZa
	AyW0fAzv3ejLtAKjU32PmSq9qaH0WcUMWFRe4yyPOysGHG38evbR7RYjOrFoTUy7By98xC9AvJQ
	GrSEiygrdsn5gUzmUL+3kttXwFwWDr5CbfDaR5pXcwVKx+DrFzzZ0NqltFUI0dgGadtgHbGC8UH
	2EmjtiN3VZ8fHqNZ9iAPoVKsx2X1qw3iWys8TnVukcX3e6EY71n90gqfPo2n7FAyzrzCia3gR20
	WfgMztDVMuzxaFtKcx
X-Received: by 2002:a05:7022:6ba4:b0:138:2a54:f6d9 with SMTP id a92af1059eb24-1386f38e674mr855401c88.25.1781308945011;
        Fri, 12 Jun 2026 17:02:25 -0700 (PDT)
Received: from 330cfa3079ca ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1384b97bf09sm3868288c88.14.2026.06.12.17.02.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 17:02:24 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: KernelCI Metrics Report - 2026-06-13 00:00 UTC
From: KernelCI bot <bot@kernelci.org>
To: kernelci@lists.linux.dev
Cc: kernelci-results@groups.io
Date: Sat, 13 Jun 2026 00:02:24 -0000
Message-ID: <178130894388.14053.11570807505247459259@330cfa3079ca>



KernelCI Metrics Summary
========================
Period: 2026-06-06 00:00 UTC to 2026-06-13 00:00 UTC


  COVERAGE
  --------
                      This week    Last week    Change
                      ─────────    ─────────    ──────
  Trees monitored     36           34           +2
  Checkouts           8,742        6,782        +1,960  (+29%)
  Builds              10,653       9,496        +1,157  (+12%)
  Tests               2,447,880    1,885,455    +562,425  (+30%)


  BUILD REGRESSIONS
  -----------------
  A "regression" is defined as a reported problem affecting 0 or multiple builds.

  Origin    Regressions       Affected           Affected builds by top issues
            (known + new)     Builds (total)     #1      #2      #3
  ─────────────────────────────────────────────────────────────────────────
  maestro   11  + 7   = 18    172                34      24      23      
  redhat    2   + 0   = 2     11                 7       4       
  ─────────────────────────────────────────────────────────────────────────
  Total     13  + 7   = 20    183


  TOP REGRESSIONS PER ORIGIN
  --------------------------
  maestro:
    #1 (34 occurrences) -  'HMAC_Update' is deprecated [-Wdeprecated-declarations] in crypto/...
      Dashboard: https://d.kernelci.org/issue/maestro:cfb7db7bad026f784ab5093df91515e27c634b34?iv=1
    #2 (24 occurrences) -  'HMAC_Update' is deprecated [-Werror,-Wdeprecated-declarations] in...
      Dashboard: https://d.kernelci.org/issue/maestro:021b40dfd5975368e21597a2c6562227b2764716?iv=1
    #3 (23 occurrences) -  the frame size of 1056 bytes is larger than 1024 bytes [-Werror=fr...
      Dashboard: https://d.kernelci.org/issue/maestro:2d2c5f1e10db58dfd3e3dede1ad14b9b83331a14?iv=1
  
  redhat:
    #1 (7 occurrences) -  error: target emulation unknown: -m or at least one .o file requir...
      Dashboard: https://d.kernelci.org/issue/redhat:a8b090056d8e6bc4eee9ffa4389946c992a6e989?iv=1
    #2 (4 occurrences) -  openssl/engine.h: No such file or directory in scripts/sign-file (...
      Dashboard: https://d.kernelci.org/issue/redhat:54dfb8887344e76e107b693682922a26eb7678e4?iv=1
  

  TEST LABS ACTIVITY
  ------------------
  16 labs reported results this week (unchanged from last week).

  Labs marked with an asterisk (*) are new.

  Lab                   Covered builds  Boots    Tests          Change (tests)
  ────────────────────────────────────────────────────────────────────────────────
  broonie               1,654           0        7,808          +754  (+11%)
  lava-broonie          353             1,296    189,795        -59,275  (-24%)
  lava-cip              425             1,153    130            +130
  lava-collabora        663             3,572    209,244        -19,818  (-9%)
  lava-foundriesio      98              98       0              0  (0%)
  lava-kci-qualcomm     88              138      52,640         +51,341  (+3952%)
  lava-kontron          227             386      0              0  (0%)
  lava-pengutronix      227             587      0              0  (0%)
  linaro                30              30       0              0  (0%)
  maestro               3,705           0        1,848,958      +475,440  (+35%)
  microsoft             46              281      5,331          -3,646  (-41%)
  opentest-ti           61              1,587    523            -128  (-20%)
  pull-labs-aws-ec2     62              62       0              0  (0%)
  pull-labs-demo        668             1,182    117,112        +115,134  (+5821%)
  redhat                345             0        6,413          +2,909  (+83%)
  syzbot                38              0        48             -13  (-21%)
  ────────────────────────────────────────────────────────────────────────────────
  Total                 8,690           10,372   2,438,002      +562,828  (+30%)

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
