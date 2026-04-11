Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24BD637F01F
	for <kernelci@lists.linux.dev>; Sat, 11 Apr 2026 00:00:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775865622; cv=none; b=jjgxLBCLDlwTlTdBGeDmqMnjvCXqn4Hvela6Jd32DsLzcudHNaY5Wh93w6FcgQkJfZxd/2ujPfU0vJyXbk7yjQSNV2D7jrmyVfq3DTyr1E9KaU3NgwR4/pEFVOnXu6m43bnv0ngqV3/NDnrgz8pjzr/UZ6xfn8zrKhsFiy2GO/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775865622; c=relaxed/simple;
	bh=AetQlrnjw7hBLtlOABuFwVgn6UqOnl/0s7Qp44xOGCA=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=N7FspZXIuYJphGMgdFpU4sfvhaBRGG/VWs1b4VRnlYK8k7KdPx28ifGq6bC7MWaG3bObuWi70Qb64qWiOKB0uUSUPJ5jDj8MGUOms2RZrtTsRS0WCy9bEuxx+Xqt8uINV8QNWpEPXaCwcJYzg3FJIKzOIZ4HGiQjQGDdxPHM9kA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20251104.gappssmtp.com header.i=@kernelci-org.20251104.gappssmtp.com header.b=h0kmwyQ+; arc=none smtp.client-ip=74.125.82.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20251104.gappssmtp.com header.i=@kernelci-org.20251104.gappssmtp.com header.b="h0kmwyQ+"
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-2d52c7f92b1so1999707eec.0
        for <kernelci@lists.linux.dev>; Fri, 10 Apr 2026 17:00:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20251104.gappssmtp.com; s=20251104; t=1775865620; x=1776470420; darn=lists.linux.dev;
        h=message-id:date:cc:to:from:subject:content-transfer-encoding
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=AB8ZMQN7pR+S7szSvJc7wvYsEdbQRUAZf+dVyortb2w=;
        b=h0kmwyQ+zkwT0kV7U9cQZutIp5InPCWrJ4naWidGVtMY8P5tFNgEtz3EyezIYxiVEb
         wssKeDy7nSyKegMY3ezLUjSdq4XmeDqaSzd3as829TMYYXXCVnbkPg/s2oFJJsbt0K8a
         tdNL3wfE9QuacG4QuDxpd3dHMnPd7evdaZ1v5behpSLVNoOD/ZNCffMcCWRMERhsB272
         JECUEKkC7p/5pO/CAGE7IG6vZWGWacd8pX487+HtHg57+N55mAcBhwc1b5dIu9HPaxOF
         im4MDIgU4KVPQxJSzZJ686lp1/aZOASQtoawM4YJVz/GAeeM97rIKTgZnum/UgnIJTfM
         MLHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775865620; x=1776470420;
        h=message-id:date:cc:to:from:subject:content-transfer-encoding
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AB8ZMQN7pR+S7szSvJc7wvYsEdbQRUAZf+dVyortb2w=;
        b=hCUjff30crESVwhu2PVMGRxaqCEplN3MHdJamiFhFb94DiRw3kyB0raGUQUYDbmp/j
         Fyscs37ShWo5I94mnk+wDb/3WKyiu9m6K0YSlm1bNi5A5iVy4vttiq+3ckKdpY1cTyeo
         e0yEOkYAXQwQ+PF4nkS6p0ZdlX9rcP6YFLnS9YCZuKgGF4YhwvNaDRv/7GVIqtsctiyV
         D1UQNJMU2I1S7eZ6UzdYDqK2kXvHZc/HFfP2ztk++tghLEb/1wHuuhwkpFyNYEKqZG8/
         Ybptir0XQkhiaBnvyBI+kymNGoP/Qcho3Uj+lJUuRIk+lyVvwzpCSDfs62YBASPa9pm4
         +hHQ==
X-Gm-Message-State: AOJu0YyOHCYS0hcXH76Cx8WLQiXF3IK6J6l6kZr62VhELuYh7nOZz4gP
	PWTwVlrqm/k6gzpEP4U0WQH8gOqV1tQZDs0JG2HxYCZGsYnauCcq5rxiFKLUccpbHssZe0p8HmW
	Pjny+
X-Gm-Gg: AeBDietOvPUDUHQtOnObE25Et4RK5h+A2rDFieTvhancTJkZPVcSkSRH2q3ZhR1ZhsL
	ibWmLzspjae74tHEnzfbhge+VArnY2I7TZ+qeyt0WeJBWvSjmW1lkp3LvMGMKYXTEUQ83Cic+Px
	lzOUU4f0Bao+8VkRbnJZHEswRgUT+4EG7OHj4Z8dfZLhhMWQwap9CEaMg01fXbEqydQZ/6F1ujt
	E//AJYV9yckaiylXCqSffG9UcE4hrpcztbHU7oomByLdpgJ91IFjtYQWd5pCKM4Ljz8V/+L2AJQ
	RfMrHYKbYf+bFy9h7E+X0UStbRVeXhZcvhdl7Up6qwJKji1HC4AQzFNe0xg0qAqi40xxAda9Lbt
	T2jw4Ml8Sg/gzOrv7HZn6tQ2YQcLzUip5S65ndNdMuW0xedzUdxrh5MDWTLV4IH9RBXTUOThScY
	5zV21X6qZiMTWBixYQ
X-Received: by 2002:a05:7300:8606:b0:2cb:88b5:a93e with SMTP id 5a478bee46e88-2d588e8584dmr3067132eec.17.1775865614681;
        Fri, 10 Apr 2026 17:00:14 -0700 (PDT)
Received: from 8692ffc4d55e ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2d562db64c4sm6370670eec.27.2026.04.10.17.00.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 17:00:13 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: KernelCI Metrics Report - 2026-04-11 00:00 UTC
From: KernelCI bot <bot@kernelci.org>
To: kernelci@lists.linux.dev
Cc: kernelci-results@groups.io
Date: Sat, 11 Apr 2026 00:00:13 -0000
Message-ID: <177586561312.3969.12424919795760711930@8692ffc4d55e>



KernelCI Metrics Summary
========================
Period: 2026-04-04 00:00 UTC to 2026-04-11 00:00 UTC


  COVERAGE
  --------
                      This week    Last week    Change
                      ─────────    ─────────    ──────
  Trees monitored     41           44           -3
  Checkouts           4,273        4,061        +212  (+5%)
  Builds              10,163       8,096        +2,067  (+26%)
  Tests               413,170      560,091      -146,921  (-26%)


  BUILD REGRESSIONS
  -----------------
  A "regression" is a newly detected failure (first occurrence).
  An "occurrence" is each subsequent hit of that same failure.

  Origin      Occurrences    New regressions
  ────────────────────────────────────────────
  maestro     981            17
  redhat      9              0
  ────────────────────────────────────────────
  Total       990            17


  LAB ACTIVITY
  ------------
  9 labs reported results this week (1 more than last week).

  Labs marked with an asterisk (*) are new.
  Labs that stopped reporting are shown with a -100% change.

  Origin            Lab                      Builds   Boots    Tests          Change (tests)
  ──────────────────────────────────────────────────────────────────────────────────────────
  maestro           lava-broonie             0        1,064    138,974        -48,430  (-26%)
  maestro           lava-cip                 0        1,075    373            +202  (+118%)
  maestro           lava-collabora           0        3,290    119,856        -100,462  (-46%)
  maestro           lava-foundriesio         0        127      0              0  (0%)
  maestro           lava-kci-qualcomm        0        89       60,547         -14,451  (-19%)
  maestro           lava-kontron *           0        411      0              0  (0%)
  maestro           lava-pengutronix         0        475      0              0  (0%)
  ti                opentest-ti              0        773      383            +348  (+994%)
  maestro           pull-labs-demo           0        129      87             -34  (-28%)
  ──────────────────────────────────────────────────────────────────────────────────────────
  Total                                      0        7,433    320,220        -162,827  (-34%)

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
