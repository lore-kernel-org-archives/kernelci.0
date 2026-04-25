Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B0C6EEBA
	for <kernelci@lists.linux.dev>; Sat, 25 Apr 2026 00:00:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777075247; cv=none; b=XpEiEnTmRp20ZFB8w4JvIaOLEoXKQVXu6ZkXXQFFcf4zWlFb9afk/sQsIKknI3j4bYCseHjLjpX4+TS0WSg8z0BN1MeDtoW+f5QlZUkZnMNY+0XojTrS8x1+tH4NLryGDeZwt9aPnA3J6FgVQGGXyuVZjhJhtzWz0kw1P5rTEmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777075247; c=relaxed/simple;
	bh=vMClF83DQK+NAzcr415yKI5Fw/XfI4MFGvHC6xClpS8=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=rat61tSSWwB+7Yv1jv9gYtl0gkkN2Ij/EGA2rPx0VzAyzr8oiRDOge0jEGMyiVf8YhzAUj3CDpB+aEm9xvSoIOkFvpen6LpX1pq187MwdFSG/h9a4MkX0/Z5StkrVQkar8bxxlezA7vVvUYhHdh4KYI0mpzJdMI7B8wpeWxfFR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org; spf=pass smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b=hvF8b3/u; arc=none smtp.client-ip=74.125.82.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b="hvF8b3/u"
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-12c6df0b9bbso5866168c88.1
        for <kernelci@lists.linux.dev>; Fri, 24 Apr 2026 17:00:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci.org; s=google; t=1777075245; x=1777680045; darn=lists.linux.dev;
        h=message-id:date:cc:to:from:subject:content-transfer-encoding
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=83f0bwsvCH7qcmYZl+ZFzxpieEVYC6f9YGt3GuFc1ss=;
        b=hvF8b3/u7tI1sXQuCEHq9yqbp/2KEn27BO1F4gIoTbdLqFRNEdFLgqetNgWsrXCzGi
         yVKbuIXqPhAuRjRNfO/WXQNXwaV5g3bny6wck3hZfQb1r71ayNa57oIUQtFt0kja31bG
         v/j8f9I+lHDewkuBzbjbiSUDR4nNds1TjGjaPOxCL92U+xtVh4JqcWI8qCzkT/JC0Xgx
         cVsAx5Cain7F+ZoAbCJEx9SvQXAg3p8hgDYxoujmxs6E8sce3z76SXGwni0VHpttReCJ
         DVjio7C28B3BIl9EdXK+foG/W6pjICvOEhVF8fGRJxwjbbi9k0jIXHOoARU3Smva/MQK
         B0dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777075245; x=1777680045;
        h=message-id:date:cc:to:from:subject:content-transfer-encoding
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=83f0bwsvCH7qcmYZl+ZFzxpieEVYC6f9YGt3GuFc1ss=;
        b=dfaH5yVQBgroUHrqdpYB8xKqDJ4dbw0lz+v/ta7rSlxhJaE/rd05+V9VuHE+1uzii1
         2cY3pcPUw4gPYOBRzZoYeCnHriTn38+iPG8B93e4AAF3txO3jmiSVWRgL139gxGP7ces
         EnE/gQlK8S2OMYWSJtLFebn376x1VX0Zl7ldqwo9OBuXie2RNlBd4I5vIawdnXsH3bWP
         jh0njwmNAY3GOXZNHqu9gtb8KRct9wPzyvJxfZCDsvBuOfYgu1fxpUiMU2Ccizox/1wG
         9B4Dls+0ypoDRBTpRb7I3mROnhlD/X7Koi92Yfnuti8NprAdqz+StlavpB8DWM8b8o7k
         ZEPQ==
X-Gm-Message-State: AOJu0Yx8Tu5GnbwLxEMYyflqDknc6w7YQCseSuPenIlUUAQA/kmXXh5Q
	jgx+TKUJmI7YZUp9fcJ7G0W5s4274PxFOxrsz3LtD0q39/TKOgy+eDTfdCzFp4thTO+TaNP9lVW
	g/3xU
X-Gm-Gg: AeBDiesa7mapYv8YkbYNVlyxQUUjR+CnHtp3loBrhvQ7DUWJxNZTV1oKoOgjJPxpTk5
	gvmtoJw9t1MiR8NN7U3CbUe9Ty2C8EO2FIhfmKAT3UMG08prtD2K+240R+VH7v9vYwgu0WAxeOD
	+IyX2O8XSYUgWdBN6ITDgEI8HJjjn33txW4y9kEksTxJDy4lcH4fmBDncSTpGfsodEHiA9cQiME
	pvnFYsXU+gc+LwZmxVpZPtX+MI9ssrec09DRLTdyupuSaFwDDnGCORGjZ86XR1hl7gQdiJ1YB6G
	A1NI8OZ5fFP0aZi/c/eH/uHL/NeWPAfdPMiaHohIBjuA/ZMDwvriseKf9MtTSJjf0/iQ7eiaBIv
	U6SjmAukLa+85oAnvulC6gpnkvIVI/px+l4GHkwE1V+WyeBFQ1wlTx4L4bWj/AvdNelt736ybBi
	HbgZHHJmbAWbd2KV67+nFiN0mYGZ0=
X-Received: by 2002:a05:7022:11c:b0:12b:ec67:3523 with SMTP id a92af1059eb24-12c73f726eamr17326883c88.9.1777075240114;
        Fri, 24 Apr 2026 17:00:40 -0700 (PDT)
Received: from 7f5f57871823 ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12da8b8fbc4sm29485675c88.4.2026.04.24.17.00.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2026 17:00:39 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: KernelCI Metrics Report - 2026-04-25 00:00 UTC
From: KernelCI bot <bot@kernelci.org>
To: kernelci@lists.linux.dev
Cc: kernelci-results@groups.io
Date: Sat, 25 Apr 2026 00:00:39 -0000
Message-ID: <177707523878.146.532156086811429249@7f5f57871823>



KernelCI Metrics Summary
========================
Period: 2026-04-18 00:00 UTC to 2026-04-25 00:00 UTC


  COVERAGE
  --------
                      This week    Last week    Change
                      ─────────    ─────────    ──────
  Trees monitored     29           36           -7
  Checkouts           4,602        3,174        +1,428  (+45%)
  Builds              11,085       9,049        +2,036  (+22%)
  Tests               1,237,875    488,941      +748,934  (+153%)


  BUILD REGRESSIONS
  -----------------
  A "regression" is defined as a reported problem affecting 0 or multiple builds.

  Origin    Regressions       Affected           Affected builds by top issues
            (known + new)     Builds (total)     #1      #2      #3
  ─────────────────────────────────────────────────────────────────────────
  maestro   33  + 7   = 40    978                205     146     54      
  redhat    1   + 0   = 1     7                  7       
  ─────────────────────────────────────────────────────────────────────────
  Total     34  + 7   = 41    985


  TOP REGRESSIONS PER ORIGIN
  --------------------------
  maestro:
    #1 (205 occurrences) -  in /tmp/kci/artifacts/build/kselftest/drivers/ntsync/ntsync (../.....
      Dashboard: https://d.kernelci.org/issue/maestro:35ab4ac04ad0aeedaed6c04e99aebaa8954e6ec2?iv=1
    #2 (146 occurrences) -  implicit declaration of function ‘drm_fb_helper_gem_is_fb’; did yo...
      Dashboard: https://d.kernelci.org/issue/maestro:d0858e23012d44ea7b9a8ffe620de278ff702a34?iv=1
    #3 (54 occurrences) -  module configfs uses symbol iunique from namespace ANDROID_GKI_VFS...
      Dashboard: https://d.kernelci.org/issue/maestro:40963bed4a8ddb0f7f18882babcfe876a844f49d?iv=1
  
  redhat:
    #1 (7 occurrences) -  error: target emulation unknown: -m or at least one .o file requir...
      Dashboard: https://d.kernelci.org/issue/redhat:a8b090056d8e6bc4eee9ffa4389946c992a6e989?iv=1
  

  TEST LABS ACTIVITY
  ------------------
  15 labs reported results this week (unchanged from last week).

  Labs marked with an asterisk (*) are new.

  Lab                   Covered builds  Boots    Tests          Change (tests)
  ────────────────────────────────────────────────────────────────────────────────
  broonie               2,038           0        11,837         +7,231  (+157%)
  lava-broonie          246             783      266,153        +103,951  (+64%)
  lava-cip              308             760      153            +16  (+12%)
  lava-collabora        520             2,708    159,872        -58,706  (-27%)
  lava-foundriesio      57              73       0              0  (0%)
  lava-kci-qualcomm     64              113      96,902         +54,960  (+131%)
  lava-kontron          121             185      0              0  (0%)
  lava-pengutronix      125             335      0              0  (0%)
  linaro                30              59       360            -180  (-33%)
  maestro               371             0        681,493        +649,944  (+2060%)
  microsoft             54              277      5,648          -1,917  (-25%)
  opentest-ti           59              1,802    884            +128  (+17%)
  pull-labs-demo        213             225      889            -1,008  (-53%)
  redhat                316             0        6,294          +61  (+1%)
  syzbot                55              0        71             +25  (+54%)
  ────────────────────────────────────────────────────────────────────────────────
  Total                 4,577           7,320    1,230,556      +754,505  (+158%)

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
