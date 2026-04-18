Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2ADC1A9FB7
	for <kernelci@lists.linux.dev>; Sat, 18 Apr 2026 00:00:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776470419; cv=none; b=TatfijChfITrAw3y0SEr+F23GBn6nW6Gm7R8c3eWGLYq89X9AE7Z9qbgS7aEf/RUgp7k1zEqIBDxDvr0bNPLDj1GaaTTjD3nbJR2hcPtnl2xsHTON7HYaXiU4ZxTN44NJBKQK8g2M0cnY82m4p4YODZfUuAVW2uiM2GOOHf/yQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776470419; c=relaxed/simple;
	bh=rpRaMQPKoX/VQvExAyppDJj/Qu7+IGEFulyNHwfHcmE=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=B67XFrMRCis/y/iFTHsufAUp53cymaa1plhM4f760qfDnjVb51IgQIcmqaEwcVkdBstHo6yiMln9az73nLppqwUjnUx3R2a36T+O+MixXeYeeZth/q3mx0ssUgNv6ICoEePjkU/6ozqIBF85LEFddcVlTaAo2Y4leOeMXLYyp9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=pass smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b=gMpisDi7; arc=none smtp.client-ip=74.125.82.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b="gMpisDi7"
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-12c42a23c8eso1420281c88.1
        for <kernelci@lists.linux.dev>; Fri, 17 Apr 2026 17:00:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci.org; s=google; t=1776470416; x=1777075216; darn=lists.linux.dev;
        h=message-id:date:cc:to:from:subject:content-transfer-encoding
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ZuOT8o6ZlkX0YH0hEUCsL8+bqySaNfUQ51bDc0rnADk=;
        b=gMpisDi7RBlQj9KXVF6yY1GPgtAjfPy1TlmEnFheT6yHjgZl+Fq/lN3pBPIMkiv0ez
         7xaAmk5QNMRFimjU9gWoMO77NvZNHflypNTweUoNRQQUi1m+faaIJaZ6OZbWtc3seIxA
         9qlXikBy3sMQYDQDYJUPltrfdy/e3naN7yzcUbKl0+lsIToyM7MyDSfjPZ/MkxE5a13m
         tbHu78B1GdxQ7y1wMgTbTQ0gvHziOQDhbWp0vRROv0rqm2CBWMEVm2ufO6AQYfPRxrYR
         l2O7vCf9arsVZGwToiOCry/5fQQNV47GTYKdY00o4ovtPquTVbyzHVNJt2IYXT0BDaXw
         i5mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776470416; x=1777075216;
        h=message-id:date:cc:to:from:subject:content-transfer-encoding
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZuOT8o6ZlkX0YH0hEUCsL8+bqySaNfUQ51bDc0rnADk=;
        b=h9DzLQzM7LAT0jZ+s3nYhoyaSGbBHuGJuDAGiPcxC7x6wdqBu8AsWb4oSnUcqvnRA6
         qsGFloIhDQjubcDfLsb2R2FXV7Ou7oGSxKsO+LFVSOYUQnE4W+Xixat0BO6Jy5f11U0S
         i4tcu+tVy6tSCYD1Zq4EmA+gmfalEfsIdY0e8JYkfFS9iWJbFCqDj4UR7RyiO+otsx5g
         Dgl4CD8FfACgeCG48ELMCU4ppnPVSB8lygm/kgyvybQVrLVWIvcDakhxhTD7xYUnyE+7
         9gST8DCuKL9MfHd9unAaEgw4RCaKX+m5ouUWptB/9pytC9HRee0kpTXyXORYCJhcpDBS
         ALBg==
X-Gm-Message-State: AOJu0Yw9yF9ZHcbfnCfm7poQ1ssaRQdKlmTq75tfy8/kr2xAXi9Y9v1t
	WJP3Tc5VER8f/ukn0V3NRMVlcMIA3GDXjr8/e5IcjqcwtSQuq5vaWf5UbAlyjUS3xXbLE+58NgF
	YW6j3
X-Gm-Gg: AeBDievle91aOLBHQt3ReU8anjgJ3KRvLBwgOlmjWAp2lR/1C2g43W5736R94OWxrOv
	YYQJZICexZwQ/Y4kSaaMaNLrmXNDvdPumQcDsgsZShDP44/HUulbjkn5ehBCKWjpqWX8XtujwHY
	/+modRgddJjD0T+tTktHarQx9V18V815Qpyt7kI7KYZTq/zhqh95DPJh+8x4pCdFsRgD1yK21Og
	2VpHnF0HQ+u/le/ciGTtDsk+V9UuiWTAvf65JD1UuOcmUrEPRDGDQBb8NFSWgvhwBsJKCI6YucP
	oE5AbgYCw2UtdTf467vjvdQwYjnLmTG5fykNIhu+sgbZb2wmMdHRF/XZlpAa2ic3a2jJrocwptE
	4DyGdNxj/WwabSIxzRlUi70KLihejzz5Cs/LAtecCD3Rsx9L5MAyZZqvS0vAB/tkREGqPAwLsaj
	kcK7kTfD1Q/30PQPnVHX9Gcv5MBGI=
X-Received: by 2002:a05:7022:6725:b0:12b:fa3d:e03c with SMTP id a92af1059eb24-12c73f70e92mr2164244c88.8.1776470411297;
        Fri, 17 Apr 2026 17:00:11 -0700 (PDT)
Received: from 062ea10430ee ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12c74a20eb5sm5531753c88.14.2026.04.17.17.00.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2026 17:00:10 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: KernelCI Metrics Report - 2026-04-18 00:00 UTC
From: KernelCI bot <bot@kernelci.org>
To: kernelci@lists.linux.dev
Cc: kernelci-results@groups.io
Date: Sat, 18 Apr 2026 00:00:10 -0000
Message-ID: <177647041005.179.527924923580090915@062ea10430ee>



KernelCI Metrics Summary
========================
Period: 2026-04-11 00:00 UTC to 2026-04-18 00:00 UTC


  COVERAGE
  --------
                      This week    Last week    Change
                      ─────────    ─────────    ──────
  Trees monitored     36           41           -5
  Checkouts           3,184        4,266        -1,082  (-25%)
  Builds              9,058        10,138       -1,080  (-11%)
  Tests               488,944      413,168      +75,776  (+18%)


  BUILD REGRESSIONS
  -----------------
  A "regression" is defined as a reported problem affecting 0 or multiple builds.

  Origin    Regressions       Affected           Affected builds by top issues
            (known + new)     Builds (total)     #1      #2      #3
  ─────────────────────────────────────────────────────────────────────────
  maestro   37  + 7   = 44    1,490              524     81      73      
  redhat    2   + 0   = 2     7                  5       2       
  ─────────────────────────────────────────────────────────────────────────
  Total     39  + 7   = 46    1,497


  TOP REGRESSIONS PER ORIGIN
  --------------------------
  maestro:
    #1 (524 occurrences) -  in /tmp/kci/artifacts/build/kselftest/drivers/ntsync/ntsync (../.....
      Dashboard: https://d.kernelci.org/issue/maestro:35ab4ac04ad0aeedaed6c04e99aebaa8954e6ec2?iv=1
    #2 (81 occurrences) -  implicit declaration of function ‘drm_fb_helper_gem_is_fb’; did yo...
      Dashboard: https://d.kernelci.org/issue/maestro:d0858e23012d44ea7b9a8ffe620de278ff702a34?iv=1
    #3 (73 occurrences) -  in testcases/fake_sigreturn_bad_magic (Makefile:31) [logspec:kbuil...
      Dashboard: https://d.kernelci.org/issue/maestro:5220c2e06a566676f041c198857665ab175b9ef8?iv=1
  
  redhat:
    #1 (5 occurrences) -  error: target emulation unknown: -m or at least one .o file requir...
      Dashboard: https://d.kernelci.org/issue/redhat:a8b090056d8e6bc4eee9ffa4389946c992a6e989?iv=1
    #2 (2 occurrences) -  openssl/engine.h: No such file or directory in scripts/sign-file (...
      Dashboard: https://d.kernelci.org/issue/redhat:54dfb8887344e76e107b693682922a26eb7678e4?iv=1
  

  TEST LABS ACTIVITY
  ------------------
  15 labs reported results this week (6 more than last week).

  Labs marked with an asterisk (*) are new.

  Lab                   Covered builds  Boots    Tests          Change (tests)
  ────────────────────────────────────────────────────────────────────────────────
  broonie *             877             0        4,606          +4,606
  lava-broonie          240             782      162,202        +23,228  (+17%)
  lava-cip              328             805      137            -236  (-63%)
  lava-collabora        540             3,048    218,578        +98,722  (+82%)
  lava-foundriesio      70              97       0              0  (0%)
  lava-kci-qualcomm     27              66       41,942         -18,605  (-31%)
  lava-kontron          155             303      0              0  (0%)
  lava-pengutronix      153             361      0              0  (0%)
  linaro *              30              60       540            +540
  maestro *             929             0        31,549         +31,549
  microsoft *           65              417      7,565          +7,565
  opentest-ti           49              1,510    756            +373  (+97%)
  pull-labs-demo        355             498      1,897          +776  (+69%)
  redhat *              293             0        6,233          +6,233
  syzbot *              38              0        46             +46
  ────────────────────────────────────────────────────────────────────────────────
  Total                 4,149           7,947    476,051        +154,797  (+48%)

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
