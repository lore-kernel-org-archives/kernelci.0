Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FE731FC8
	for <kernelci@lists.linux.dev>; Sat, 30 May 2026 00:01:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780099279; cv=none; b=J9wgTvY9vgTos9jnrm2Wbqr7izVwKB6mWrcUNYjK/L0gJ6cmvzauZfPdDLkYtp3LxfHdna5MQHa1PoiivH9C/uz1+s6aQaqyb4qaLkU7wp0JjjsyEjsRgnHDeNg93hStPAsal7iHSbfn6uyyVNpuGr89AbBUe3gJBFe2H8S7bWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780099279; c=relaxed/simple;
	bh=/pTGj+QrKe6kApEnqjgX8UQrky6swz6Iic2ODR9fI00=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=BMGxzxyqfCyxNKPEE54dMrUcNLWIyQ0VzD+XCha6lOicGLM1CIx/1DWxUTuPGcym4H4pfDKRIg4K6KlTxVfRIEqyijlEfxOf6IbMGaahbOcuxLsrOYN0ZxBBKNtXeu6J4DIq8x6jrRppoZRpOOJL0LhkKlZyikHplYobKlDTpNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org; spf=pass smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b=fQjGqdHe; arc=none smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b="fQjGqdHe"
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-304f590dd91so847845eec.0
        for <kernelci@lists.linux.dev>; Fri, 29 May 2026 17:01:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci.org; s=google; t=1780099277; x=1780704077; darn=lists.linux.dev;
        h=message-id:date:cc:to:from:subject:content-transfer-encoding
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+AsRZ+p7/N0tjo5WIGD3BGMJWGLUj4O1w1ufPqFkeJ8=;
        b=fQjGqdHeM9YCxrEDSFG6XnUpDtVTzpV3f4YNyYVvwBP8vtDYxTFkQGf0mTHulCT6b9
         4r7uEfzb/46rL/5eLqu2tArCIOSZRDeJX9TNB2BMiyyuSvqGlU55yXB0pPSMRmiSnCno
         QGknn11R3LlMs0eb4fbupF5i0nn2SX9E+1Yi1h0PEViZLMZJPHki83nl/KZw56HKT5BA
         aaMRdZ4P4WvEPnW0zaVNH9ZpwHT4hhRzXttDFFYsZNQVqLXuIeMq3dG9BF7/cfnBOb1y
         a9CDHwdkLhEGa1BVCzf8ixq/5FNFwnONJ1C1E9i2IPTnDSxhm2sJX2ZsmyPHlm06Fu2j
         DknQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780099277; x=1780704077;
        h=message-id:date:cc:to:from:subject:content-transfer-encoding
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+AsRZ+p7/N0tjo5WIGD3BGMJWGLUj4O1w1ufPqFkeJ8=;
        b=lHlUIMgPiWoHtNKfhPT92kG2UhXKhcmBlnvUJ9HFwNnQMhaGKP80JXGe/1S8Vj7cS7
         AjGke/UHzaDV/eUi4W17MfkNdLaMetiyqNXQKRz6MGlT3XGPE8YbDRbGp+urHg3JxQZa
         RxcwRjXghHTgSKW+45IUt3fTBBcpREELj9YlyOvcbKLtFLg37GLFXZK4HhTZa2eNI1Z9
         dXk2VroO8OCzeI2qmNM6149pODlcZkfl8bkUZYWkXzYsN/mOjfecrgqXXJJ12I0y8+pp
         yn678FYNDrxVCQLG6hruImuEJhE0hRnq3ebUpJXs336tQl536W9CIRotB2uowIJ+Hptp
         2Bgw==
X-Gm-Message-State: AOJu0YynmHD5XoKcimCgoCdMlnRm9wpGI+gSR2TGOTLPFW8Dfra5gtAc
	Sn8050HRoSStBczg+rD9rvguTqOtzExtZK0oH8yL9X9vFEx7xnTbbyOKR/lwl2BvdEMvddskKTb
	L7OXw
X-Gm-Gg: Acq92OFuVa3DGYA9TQbHSKNt4rZ1o8ZkrVEGkxIvp+3l7k2H2MIt3/1ki1Btqeoy9ur
	BzVgI6QgHhyZxGFAM45KqpMekk2ggg4+bJRn8NC80A6Xm0mA0sloKTUN9HfcT9NCfl+UYXCeAdu
	Hd245BGG8KxljB8kHGIqp+TCFWkntcu4xtP0AJh+2vFefG60ROAMRrfHfKNh86IhlDk6t2coCaY
	/1tZTW+TBZSybzLr59P7nMwNXbIz1z9yBjIj437D3ntjTloBSDWHDL6jloMUFkGYK9oXXDm4KRK
	G2oYUPCncoAORQHclGwB8HEG5VWMo3H9fKRiQDzzPuG2YvUW0HHYm1FYEd+0wfQZUBUFxxVUwS/
	IpokjxQ1vRqAniTA/JWAJnOqa9FEGPK5bw/pd92FnSyK0eHdQsc1x525BN4DPdsirBo2ljTTpOc
	COjrLH2OJK/7TJm6qnAJlO4DljAaI=
X-Received: by 2002:a05:7300:6427:b0:304:5db8:da95 with SMTP id 5a478bee46e88-304fa67ad4amr908238eec.23.1780099276985;
        Fri, 29 May 2026 17:01:16 -0700 (PDT)
Received: from 330cfa3079ca ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-304ed3358b1sm2563528eec.13.2026.05.29.17.01.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 17:01:16 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: KernelCI Metrics Report - 2026-05-30 00:00 UTC
From: KernelCI bot <bot@kernelci.org>
To: kernelci@lists.linux.dev
Cc: kernelci-results@groups.io
Date: Sat, 30 May 2026 00:01:16 -0000
Message-ID: <178009927554.7615.13450759526737453056@330cfa3079ca>



KernelCI Metrics Summary
========================
Period: 2026-05-23 00:00 UTC to 2026-05-30 00:00 UTC


  COVERAGE
  --------
                      This week    Last week    Change
                      ─────────    ─────────    ──────
  Trees monitored     42           39           +3
  Checkouts           6,965        5,691        +1,274  (+22%)
  Builds              9,085        11,392       -2,307  (-20%)
  Tests               1,624,713    2,344,654    -719,941  (-31%)


  BUILD REGRESSIONS
  -----------------
  A "regression" is defined as a reported problem affecting 0 or multiple builds.

  Origin    Regressions       Affected           Affected builds by top issues
            (known + new)     Builds (total)     #1      #2      #3
  ─────────────────────────────────────────────────────────────────────────
  maestro   13  + 6   = 19    146                28      25      19      
  redhat    1   + 3   = 4     14                 6       5       2       
  ─────────────────────────────────────────────────────────────────────────
  Total     14  + 9   = 23    160


  TOP REGRESSIONS PER ORIGIN
  --------------------------
  maestro:
    #1 (28 occurrences) -  omitting the parameter name in a function definition is a C23 exte...
      Dashboard: https://d.kernelci.org/issue/maestro:2f5f68fe5a378a5f91c53b2ded9eaca026d2608c?iv=1
    #2 (25 occurrences) -  'HMAC_Update' is deprecated [-Wdeprecated-declarations] in crypto/...
      Dashboard: https://d.kernelci.org/issue/maestro:cfb7db7bad026f784ab5093df91515e27c634b34?iv=1
    #3 (19 occurrences) -  'HMAC_Update' is deprecated [-Werror,-Wdeprecated-declarations] in...
      Dashboard: https://d.kernelci.org/issue/maestro:021b40dfd5975368e21597a2c6562227b2764716?iv=1
  
  redhat:
    #1 (6 occurrences) -  error: aborting due to 1 previous error in rust/kernel.o (rust/Mak...
      Dashboard: https://d.kernelci.org/issue/redhat:65310db61f8d901156865282994ce95019ccfd72?iv=1
    #2 (5 occurrences) -  error: target emulation unknown: -m or at least one .o file requir...
      Dashboard: https://d.kernelci.org/issue/redhat:a8b090056d8e6bc4eee9ffa4389946c992a6e989?iv=1
    #3 (2 occurrences) -  omitting the parameter name in a function definition is a C23 exte...
      Dashboard: https://d.kernelci.org/issue/redhat:931153e2ea213b1a5318cf283954080400b7886e?iv=1
  

  TEST LABS ACTIVITY
  ------------------
  16 labs reported results this week (2 fewer than last week).

  Labs marked with an asterisk (*) are new.

  Lab                   Covered builds  Boots    Tests          Change (tests)
  ────────────────────────────────────────────────────────────────────────────────
  broonie               1,673           0        7,234          +416  (+6%)
  lava-broonie          274             1,096    176,150        -186,905  (-51%)
  lava-cip              408             993      90             -8  (-8%)
  lava-collabora        587             3,393    173,150        -102,985  (-37%)
  lava-foundriesio      99              99       0              0  (0%)
  lava-kci-qualcomm     81              80       1,164          -1,958  (-63%)
  lava-kontron          235             352      0              0  (0%)
  lava-pengutronix      233             592      0              0  (0%)
  linaro                27              27       72             -252  (-78%)
  maestro               623             0        1,252,146      -417,173  (-25%)
  opentest-ti           49              1,369    451            -218  (-33%)
  pull-labs-aws-ec2     67              67       0              0  (0%)
  pull-labs-demo        739             1,199    1,913          +1  (0%)
  pull_labs_aws_ec2     8               8        0              -1  (-100%)
  redhat                184             0        3,007          -2,270  (-43%)
  syzbot                49              0        67             +2  (+3%)
  microsoft             0               0        0              -5,250  (-100%)
  pullab_cloud_aws_arm640               0        0              -11  (-100%)
  ────────────────────────────────────────────────────────────────────────────────
  Total                 5,336           9,275    1,615,444      -716,612  (-31%)

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
