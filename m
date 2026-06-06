Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3041C4071F6
	for <kernelci@lists.linux.dev>; Sat,  6 Jun 2026 00:01:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780704063; cv=none; b=DTp+K0ZzUrnDligf+HRfXl+Rzt26sBm70O7jbBYfo9THV8XAIIfAxcbnbXnH5L5wdNgPmeLdn4gvJprVshlvhJOMGp9NzQu/GTzLMUxma+gnrO8ysCUcWtfS4OJgBsvJxRimo9AwvD/AZx3m7V0GU6B8XFY6cYyWtA4tMWnEVQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780704063; c=relaxed/simple;
	bh=2BeFy8+jiJGluyOIKL3oF3Y39WRDig0QwGQjFqrWJU0=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=Xivs3j4QPKSnVhYlKAE6x2m2iHkAYYlo+hnLY6aGLXrs8r5KYIKpka2cGjgiPf5NqVDB5JuNhcepqZBdKEBZV+iZnLTaglOiQpNucXxcUhlmCRDOk38GurjOkXRZjvb2GHQlBv8jQ3OJyTpOdoWkbvor6BDrgt0+wCNAXiRYuxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org; spf=pass smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b=MuF5xGMt; arc=none smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b="MuF5xGMt"
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-304d0ac5e3cso4160529eec.0
        for <kernelci@lists.linux.dev>; Fri, 05 Jun 2026 17:01:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci.org; s=google; t=1780704061; x=1781308861; darn=lists.linux.dev;
        h=message-id:date:cc:to:from:subject:content-transfer-encoding
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=uaY1ouqsQyBifuoRxkuW0z8MilizlDaW0OoFCrMO6eg=;
        b=MuF5xGMtJPTg8LZr+JxPxVH+JVaKL8xFRIKvW77wh7TvQRYRpV9Ps2NAb4r93c3s6r
         wtgA9409RegtRikMuXXRk78JzVNUNscMp80Zwl4fSTuhEYd1DATAm8x4hbXSneyYT3IN
         zzJt5+uoT9+RMbKYTDh0Z+03sSqFBWPJ00W5CH9KBM1aDXKiG64qHxRqhRKowr384i5l
         6/Z1N3AKr0A/iG1OMPj/MiqxRkNBbjrM5Q3Kb9ZR/QZbl4wgQlRoaJ1eFCE3cwM76QyF
         j8hlb7e4sqHm+rc2Ww+22jsUz7rz7IZkV+6/vnQbfUuwhM2OtWoZLt/j4RPs5p4QSymp
         5N6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780704061; x=1781308861;
        h=message-id:date:cc:to:from:subject:content-transfer-encoding
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uaY1ouqsQyBifuoRxkuW0z8MilizlDaW0OoFCrMO6eg=;
        b=dXi/STh1c7IFabi4U9YBWF6x3Ssrq/siHldZwN+AXBrJ6FyUgOjIKRsExPDdU/r9v3
         MkMjaa75GwTCU6j8sXoBDfVTxH6NnaBnUHR8nAUcOf+r+y9tGwiuBW1ekvGyFWobr1mt
         2IPev24KIaZf8OKkNo65CKndSAFP3SBVaUnfa/WTkbJaLPtrUIz253WXJRfl+CzOKfiE
         O6xqhYEp5ek8vi2vh1I2+57A9IH2+Ydb4iz9nfcpVVm4L/UuQb+78/ueoIGtqyFHSBab
         WeGVus+s2dQCIIUrsqXGmAMqm+9pfKGKkvYRizIfi7Y8uhj3ouqrmmTUKg4IZJrYXQSz
         JdUg==
X-Gm-Message-State: AOJu0YzkQbsHeyzxOn8JeTx9rDRy7BRTsmZdwQ3TpBWS95V2kJsGBxvS
	BfD6DSmFN4PygTiiqzwaIsafDwSbyZkvAmMaNfkMs9Gf8HPmx84mJ1XdzX21RQrMnfnR9aIJ894
	yAT9c
X-Gm-Gg: Acq92OES+/AN5vQ39/bRM7FNLUPRUgXuVgAlo+chw5glw6GzaBhMXDR5FG2nkLhUl7d
	2XXgCmpyyz15+cB3yatNI7PfZuKr/DdrUlnpks1GhQEy0kBIRwxq5LJzVLHb0fJMXlOoMTWdY1K
	LCxmCC0ttwcgnBDuqMarxTM62vifdc2LWZ8MFvJgQXVQxbkbxV/TA7pq8KmK99f3+KuUVpb36vW
	7LKw5s02De70y/grji69ucHUVl3xbekvpI6D+fylitOPoPoEsPfqPKmW6SxWcJMGiM1dI642Bua
	GvCu6pzbvEwxV0P4W23ZwHxGlx72wuUraXRY5q/wxMyQAc1Z+Zbj9RD5idumcbii2DXodbC9S1F
	xmO3QGwvWRFiuXlFf2Jl4wTaaLJK4O5WPVTcVJcYhQ4NoiK6ncNxO6foyNz4UjiNJwoQlUs0WgH
	vMCThJDuEkBXO6USHYy2fwsHm1//Q=
X-Received: by 2002:a05:7300:4307:b0:2ce:3aa1:d39b with SMTP id 5a478bee46e88-3077b1e1921mr3108334eec.20.1780704061065;
        Fri, 05 Jun 2026 17:01:01 -0700 (PDT)
Received: from 330cfa3079ca ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30791f9da69sm739692eec.31.2026.06.05.17.01.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 17:01:00 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: KernelCI Metrics Report - 2026-06-06 00:00 UTC
From: KernelCI bot <bot@kernelci.org>
To: kernelci@lists.linux.dev
Cc: kernelci-results@groups.io
Date: Sat, 06 Jun 2026 00:01:00 -0000
Message-ID: <178070406001.10836.17150566593680766076@330cfa3079ca>



KernelCI Metrics Summary
========================
Period: 2026-05-30 00:00 UTC to 2026-06-06 00:00 UTC


  COVERAGE
  --------
                      This week    Last week    Change
                      ─────────    ─────────    ──────
  Trees monitored     34           41           -7
  Checkouts           6,798        6,929        -131  (-2%)
  Builds              9,542        9,050        +492  (+5%)
  Tests               1,886,112    1,624,590    +261,522  (+16%)


  BUILD REGRESSIONS
  -----------------
  A "regression" is defined as a reported problem affecting 0 or multiple builds.

  Origin    Regressions       Affected           Affected builds by top issues
            (known + new)     Builds (total)     #1      #2      #3
  ─────────────────────────────────────────────────────────────────────────
  maestro   10  + 5   = 15    124                33      33      27      
  microsoft 0   + 1   = 1     1                  1       
  redhat    2   + 0   = 2     7                  5       2       
  ─────────────────────────────────────────────────────────────────────────
  Total     12  + 6   = 18    132


  TOP REGRESSIONS PER ORIGIN
  --------------------------
  maestro:
    #1 (33 occurrences) -  'HMAC_Update' is deprecated [-Werror,-Wdeprecated-declarations] in...
      Dashboard: https://d.kernelci.org/issue/maestro:021b40dfd5975368e21597a2c6562227b2764716?iv=1
    #2 (33 occurrences) -  the frame size of 1056 bytes is larger than 1024 bytes [-Werror=fr...
      Dashboard: https://d.kernelci.org/issue/maestro:2d2c5f1e10db58dfd3e3dede1ad14b9b83331a14?iv=1
    #3 (27 occurrences) -  'HMAC_Update' is deprecated [-Wdeprecated-declarations] in crypto/...
      Dashboard: https://d.kernelci.org/issue/maestro:cfb7db7bad026f784ab5093df91515e27c634b34?iv=1
  
  microsoft:
    #1 (1 occurrences) -  passing argument 1 of ‘uuid_copy’ from incompatible pointer type [...
      Dashboard: https://d.kernelci.org/issue/microsoft:4c8385afc9e3b99b6efc8ee57d0f6f34bf5ce4ad?iv=1
  
  redhat:
    #1 (5 occurrences) -  error: target emulation unknown: -m or at least one .o file requir...
      Dashboard: https://d.kernelci.org/issue/redhat:a8b090056d8e6bc4eee9ffa4389946c992a6e989?iv=1
    #2 (2 occurrences) -  openssl/engine.h: No such file or directory in scripts/sign-file (...
      Dashboard: https://d.kernelci.org/issue/redhat:54dfb8887344e76e107b693682922a26eb7678e4?iv=1
  

  TEST LABS ACTIVITY
  ------------------
  16 labs reported results this week (unchanged from last week).

  Labs marked with an asterisk (*) are new.

  Lab                   Covered builds  Boots    Tests          Change (tests)
  ────────────────────────────────────────────────────────────────────────────────
  broonie               1,606           0        7,063          -46  (-1%)
  lava-broonie          328             1,225    249,070        +72,920  (+41%)
  lava-cip              378             1,018    0              -90  (-100%)
  lava-collabora        605             3,343    229,701        +56,551  (+33%)
  lava-foundriesio      87              87       0              0  (0%)
  lava-kci-qualcomm     90              110      1,302          +138  (+12%)
  lava-kontron          206             303      0              0  (0%)
  lava-pengutronix      206             472      0              0  (0%)
  linaro                27              27       0              -72  (-100%)
  maestro               953             0        1,373,518      +121,372  (+10%)
  microsoft *           77              476      8,977          +8,977
  opentest-ti           69              1,974    651            +200  (+44%)
  pull-labs-aws-ec2     54              54       0              0  (0%)
  pull-labs-demo        720             1,194    1,980          +69  (+4%)
  redhat                201             0        3,504          +497  (+17%)
  syzbot                48              0        61             -6  (-9%)
  pull_labs_aws_ec2     0               0        0              0  (0%)
  ────────────────────────────────────────────────────────────────────────────────
  Total                 5,655           10,283   1,875,827      +260,510  (+16%)

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
