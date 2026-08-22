Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7C0B2AD0C
	for <kernelci@lists.linux.dev>; Sat, 22 Aug 2026 00:00:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787356841; cv=none; b=Nzyj94ufL4BTrgZ8aA6jLpVjhZdfPuXLL36biQNM8/NYDgK9YYk4iUaibo3i05oT7GoXWCcg/cCEXT2anmxkrZPk53RZCTVfxCbTyDprL639e5QQMLyVaXbwoBs4CjOimI8L39qdIyCdMuK2rxdImn9IN4JOOpYW5w6gaF6YK10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787356841; c=relaxed/simple;
	bh=Uu8asgJKY/iacyh6moIulk0Z6bfodYez0Aa7CXI19h0=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=AoCGikrsqIA+vKGIjQlwF7JHTKeQnvpDCBgOuSDMU7OdWmBkFS1iVIl48GvgthYXokKCg4ZD7Lx90nQBLg4u+aOH/m3nzRwCxi2cAd7FSu9so+6jzn/KpNunXpiHRjEQYKrgExTuDhdKfwccuPs+BICZObZ/TAbHYgP62QecyqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org; spf=pass smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b=HCKot0bt; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b="HCKot0bt"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2cf27856f9cso17397045ad.2
        for <kernelci@lists.linux.dev>; Fri, 21 Aug 2026 17:00:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci.org; s=google; t=1787356839; x=1787961639; darn=lists.linux.dev;
        h=message-id:date:cc:to:from:subject:content-transfer-encoding
         :mime-version:content-type:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=h/82hUVOsDo3ityhc4ZF+CW4JQFdNi3+vcpFP7/uITs=;
        b=HCKot0btE5zxK1iq1toI/Ht21rw7sbOLeCih1sVPo3BOYmH0PbpD7vD/36iXSTsnJi
         wKHNTQXXzG3u8qmG+xE/s6/8ou+bFISBxQvdJ0dxQdQzAfXmako4eG0PXWf2qkasWb1z
         hLpR0nAqyJMSeqcnHLlA5vXPaA/2rgDQlsa5/uN5+223C/cJe2gLfR0Q/coRuTp/M9/I
         s91+72I19hJEK1JfeoPwul+TFrG0xm5BO4IXZ52W8dt2NOwcY1j0bR0LiwV1uDU/LNGD
         B5GrOA/Iw3/9Xv56HKTgy1xwhODVsyZG58o8EkqANwjanIUhU3zD7rvSoZokqT35SxDY
         3wzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787356839; x=1787961639;
        h=message-id:date:cc:to:from:subject:content-transfer-encoding
         :mime-version:content-type:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=h/82hUVOsDo3ityhc4ZF+CW4JQFdNi3+vcpFP7/uITs=;
        b=XzIrwBKEvBXW+EEDj8unZFutQ4voz9FC01SLLMmIxtQHa22TyrBumdd2T9+8DD0rsw
         8GAa593cWfT4W7F8swB8PMk1/8HWWw0CcOBRnjUI9kiJDuktGl0XRZLNRYnMdyvjox8l
         5p1BDfparhPegVekauTVlNNz7GjCwZxsyyCsPfx0TKPKctnGUW5VkqJaWly2Qn4lEgAU
         dR7FasTD9GHRpoWJcC7WLYe3DpXWKTRvILnjqC+CPHvLM0g+C0hJVXZCBa4DA53zPrW5
         VyPvyJfnkLeT4NN0EPGhpK1LxEU6w44JgKAWEb4/FscxqQmYX8tm420B9hl0JC+EBeHe
         Dt/A==
X-Gm-Message-State: AFuF++kIB0olStqhi7qZ3T65GmT1n+oRD8Imrv3T1kX2xdGxoLxrS/Gg
	nHhJIGkMWtt5qXXCxjqAyyCMKVbmVUdFjjrZUY3Rpli+WTKjitj1IeRrWkpdsyXebiVXnqTIXa5
	aJFGc
X-Gm-Gg: AR+sD13IgLzBBvTKaRVxCaBV8d6xhIHdpfWrQ0+DmM171RBtTylzkeT8ezZKmKb/JXx
	NEKXoAn9KZ6VkdM7Ge2bJ2LIPEfXwVLcY1PrRCroZ6Jue9G9m/crMIPGdmIdpSS/+0UFJaDw3UD
	Jcrj80YQrfOlJaNsdum8ul9F7yKtm9NTOPdlWN5yJ8+WeAOgPC6UecODcXWEI/RBxEZ5dRB+Qfm
	nmN1WmDObyefUSdeWLNkTwN+uJicwJIitjwHrYyR2g8yp60U49ncBOmb6OcxkmW+z30lwn3gx+Z
	Ds9GdX1iq2Ab+FyG074sm35C7ScEYInPCi7xBnfckALTrQ56Jl5Glcblh3p+BDywFlJHGDI19Re
	i3yRcVe8/BYA1gR1O17yImhnvrYDRHdvzfZA3166uaVmaPsXbGaO9kaJUAInZ+1DVMU+gRrfsp7
	FCvrmXPloYcPZ9OtksOH7+yumlsk0PqC2mjKoPF0uLS4jhERDPt6Rk
X-Received: by 2002:a17:90b:1e0d:b0:395:4e0d:bc60 with SMTP id 98e67ed59e1d1-395c354d7ebmr15385857a91.9.1787356838819;
        Fri, 21 Aug 2026 17:00:38 -0700 (PDT)
Received: from b455de3d9de8 ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14186173199sm1703992c88.9.2026.08.21.17.00.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 17:00:37 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: KernelCI Metrics Report - 2026-08-22 00:00 UTC
From: KernelCI bot <bot@kernelci.org>
To: kernelci@lists.linux.dev
Cc: kernelci-results@groups.io
Date: Sat, 22 Aug 2026 00:00:37 -0000
Message-ID: <178735683723.1431.15415017699300335933@b455de3d9de8>

KernelCI Metrics Summary
========================
Period: 2026-08-15 00:00 UTC to 2026-08-21 23:59 UTC


  COVERAGE
  --------
                   This week  Last week           Change
                   ─────────  ─────────  ───────────────
  Trees monitored         31         35               -4
  Checkouts           84,471    126,837   -42,366 (-33%)
  Builds              12,003     10,234    +1,769 (+17%)
  Tests            2,671,244  3,010,513  -339,269 (-11%)


  BUILD REGRESSIONS
  -----------------
  A "regression" is defined as a reported problem affecting 0 or multiple builds.

  Origin           Regressions        Affected  Affected builds by top issues
                 (known + new)  Builds (total)         #1        #2        #3
  ───────────────────────────────────────────────────────────────────────────
  maestro     16 +  15 =    31             648         97        84        76
  microsoft    0 +   1 =     1              15         15
  redhat       2 +   0 =     2               3          2         1
  ───────────────────────────────────────────────────────────────────────────
  Total       18 +  16 =    34             666


  TOP REGRESSIONS PER ORIGIN
  --------------------------
  maestro:
    #1 (97 occurrences) -  ‘key_pass’ undeclared (first use in this function) in certs/extrac...
      Dashboard: https://d.kernelci.org/issue/maestro:1bc31bdc5afab00de98efd0c67ef8653e5385a69?iv=1
    #2 (84 occurrences) -  ‘key_pass’ undeclared (first use in this function) in certs/extrac...
      Dashboard: https://d.kernelci.org/issue/maestro:c8d36aa6848ceeb5f21060331b3fcc14fe6c4896?iv=1
    #3 (76 occurrences) -  use of undeclared identifier 'key_pass' in certs/extract-cert (cer...
      Dashboard: https://d.kernelci.org/issue/maestro:ba4b3f33d6a10cd9f6dd26c6f8c27fab62ca127a?iv=1
  
  microsoft:
    #1 (15 occurrences) -  implicit declaration of function ‘macb_alloc_tieoff’ [-Werror=impl...
      Dashboard: https://d.kernelci.org/issue/microsoft:ab342dde3ba45ce2efa0c064a3051aa43ce98e30?iv=1
  
  redhat:
    #1 (2 occurrences) -  openssl/engine.h: No such file or directory in scripts/sign-file (...
      Dashboard: https://d.kernelci.org/issue/redhat:54dfb8887344e76e107b693682922a26eb7678e4?iv=1
    #2 (1 occurrences) -  scripts/gcc-plugins/gcc-common.h:460:20: error: ‘CONST_CAST_TREE’ ...
      Dashboard: https://d.kernelci.org/issue/redhat:7f08649b1e8792431505f088d0b2f21f699ba664?iv=1
  

  TEST LABS ACTIVITY
  ------------------
  17 labs reported results this week (unchanged from last week).

  Labs marked with an asterisk (*) are new.

  Lab                    Covered builds   Boots       Tests    Change (tests)
  ───────────────────────────────────────────────────────────────────────────
  aspeed                             44      44           0                 0
  broonie                         2,323       0      10,263     +1,553 (+18%)
  lava-broonie                      358   1,136     399,854   +114,007 (+40%)
  lava-cip                          393     978         200              +200
  lava-collabora                    629   4,382     395,153   +159,975 (+68%)
  lava-foundriesio                   97      97           0                 0
  lava-kci-qualcomm                  19      41      38,466   -336,217 (-90%)
  lava-kontron                      186     353           0                 0
  lava-pengutronix                  205     521           0                 0
  maestro                         4,492       0   1,512,619   -308,585 (-17%)
  microsoft                          82     423      16,562     +7,197 (+77%)
  opentest-ti                       116   3,063       1,242       +506 (+69%)
  pull-labs-aws-ec2                 111     111         110        +38 (+53%)
  pull-labs-demo                    472   1,815     278,668     +20,129 (+8%)
  redhat                            271       0       3,694        +228 (+7%)
  riscv                               1       0       1,286           -2 (0%)
  syzbot                             75       0         163          -4 (-2%)
  ───────────────────────────────────────────────────────────────────────────
  Total                           9,874  12,964   2,658,280   -340,975 (-11%)

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
