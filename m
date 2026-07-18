Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C94D11427A
	for <kernelci@lists.linux.dev>; Sat, 18 Jul 2026 00:01:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784332891; cv=none; b=nXPm02SehY5BQsIFkQGWUjviKKslK8KVTni5zCOWGSV41pz3lCjlBDvZmEtD9FY8/eomyJ5u7rom1oC3208aJcK0TdaONZiXkD0byXFitFq/WF3st+mnRch96Wxeqjy9jjnBaqR5G8mw9ls+chYR/0THnbhG49xAyEJQz4vpcxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784332891; c=relaxed/simple;
	bh=ETdPEmhi+xEGqWC81N7h1EFDSOBqj+Z8RYNGGt8BNws=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=h9zz5j/XY0uqfr6iZM8SHf6AgMdcqMf7x6H9uPvbAqYQNGcJ6dUaBH+ayMvDh6tTq1+V7uz5TVa38AjSGjjDTpozvdnogSjitKIacWEmWM6SwKPnyKpNQJeIbO68ytXGYazt0KvN4iAnYaYLb+mPrA73sBcLSjY/jD8ncSQSSO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org; spf=pass smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b=fV/2IhlM; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b="fV/2IhlM"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-38deea72eebso6206681a91.1
        for <kernelci@lists.linux.dev>; Fri, 17 Jul 2026 17:01:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci.org; s=google; t=1784332889; x=1784937689; darn=lists.linux.dev;
        h=message-id:date:cc:to:from:subject:content-transfer-encoding
         :mime-version:content-type:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=swUOhO3ZiKIFlJaSPJ/qLrZVDcZIVRFaudSJ1yPa1G4=;
        b=fV/2IhlMt+Ks/ObYBSw2hluoptf7ifEE6NnIaN908DqC/2+qA1WU3oVvFkBDTOizVL
         q+7/JOwhcI+COT7lJYWFhDC4Qq7oN2Mqi3003qwLBmTsGURGCMTJWKmVveOvAm7H2NjG
         gZOvhg/dYUeNUpFwyX8PQgWqKV9hX+ldipgk9XsE7cgu74LH54zPLVqgQsiNOenXbDDn
         rtxz+w34PZDVfyWP+T6gCkuQ4Kb8h5kpZxj+IToJWf54PC0CsSRZRmJFS6mI4QLMGaFY
         5LwcIUZNghc/cJdWPNNTE9xXKJCdKtHln2nfQwSlcPcTm07CvfbUEiZZYhPWGlMtKB6b
         RiAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784332889; x=1784937689;
        h=message-id:date:cc:to:from:subject:content-transfer-encoding
         :mime-version:content-type:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=swUOhO3ZiKIFlJaSPJ/qLrZVDcZIVRFaudSJ1yPa1G4=;
        b=Ndxk0m92egSnTX3uzdWWUInuEwv1fWU/0gq7gMY2pY/V6PuaxOUkL4c1FrS1W5knfh
         iRhuEge3tCJabt5EOoJ+pjYKPUE6BZLSfikfuIzs7moKjBEybul3RnCooouzX+uoc2Ao
         Kk3NlR17Sq4noXEmvHV/Li7hoqAIrRKyZT9N02zttIIbfW2FkCz6yx6RLHIuyIoKM1LJ
         sRjoS+AWXqhl8OkfZIyJnIW/vsxjYFtGEzEFjYTdYZU9upTVBL3ithPOv8HLYj0UPm8X
         xgVrgaHVzjd1BS/aGo2kokuLgOldHOHANXPp08DMd1vJ8fEPu5e9Oxcp0GgLlr8OfCRY
         PxlQ==
X-Gm-Message-State: AOJu0YzFFKqX18cHSiN1qhFKTDPWO5xInmQUyQEJeWUKM46NErWNCFEZ
	K7WrKpmzZkTnrFfo/miaCSdMsjZ4wtszOOGbFEVRdXPvTEwCFvBhKUYShHiIJkuUQ6sY7gY/UEK
	+eXX5
X-Gm-Gg: AfdE7ckJI/ZLjMrNLcrwf2+S2qqvvetoJimmPMQOSMNNfk3e/iaqJRowd/kdGEZp6PC
	01DRES+YZ99iD+8lSo/R6QO+Y5eexqxhUO/bQLhwwUW4LzKb+TXen7wSJplwEwYOwsvjZcfqnPz
	kaeMGkIfRxriy9rngGEH+bozxqehNWVNadLr7SeleYD8+P/MH4bs7Z2oGUNToVwZqGGsvrq9k29
	aBr1dYLnzt9YbSi8xgbMWePV+BSVY1PQKJ+WCwlhWM3mPQyImw3rx4OhguGk6cSxhCqoHLtzXnt
	jnSmtBgQZOrTWrbAFh7JsS6+tKyjlfTYp4sqQhRtx1i/A639S7ErVeI7XbpwscSI2rCtUXI9ZCO
	a1+zSSgCrlgGxxKNxLhXf6iI/0n6AkCyY6BEqrvxHtaomOy4dvnaCe3I2q73yP/exAB9/mUw=
X-Received: by 2002:a17:90b:1c02:b0:38e:2aa8:60d0 with SMTP id 98e67ed59e1d1-38e4b586067mr5019527a91.37.1784332888922;
        Fri, 17 Jul 2026 17:01:28 -0700 (PDT)
Received: from 963b246bc1b3 ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31429fe1014sm11190281eec.7.2026.07.17.17.01.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 17:01:28 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: KernelCI Metrics Report - 2026-07-18 00:00 UTC
From: KernelCI bot <bot@kernelci.org>
To: kernelci@lists.linux.dev
Cc: kernelci-results@groups.io
Date: Sat, 18 Jul 2026 00:01:28 -0000
Message-ID: <178433288762.12245.12612877571931951692@963b246bc1b3>

KernelCI Metrics Summary
========================
Period: 2026-07-11 00:00 UTC to 2026-07-17 23:59 UTC


  COVERAGE
  --------
                      This week    Last week    Change
                      ─────────    ─────────    ──────
  Trees monitored     36           41           -5
  Checkouts           72,080       87,157       -15,077  (-17%)
  Builds              11,383       10,802       +581  (+5%)
  Tests               3,175,992    2,375,235    +800,757  (+34%)


  BUILD REGRESSIONS
  -----------------
  A "regression" is defined as a reported problem affecting 0 or multiple builds.

  Origin    Regressions       Affected           Affected builds by top issues
            (known + new)     Builds (total)     #1      #2      #3
  ─────────────────────────────────────────────────────────────────────────
  maestro   11  + 4   = 15    255                45      33      30      
  redhat    1   + 5   = 6     14                 9       1       1       
  ─────────────────────────────────────────────────────────────────────────
  Total     12  + 9   = 21    269


  TOP REGRESSIONS PER ORIGIN
  --------------------------
  maestro:
    #1 (45 occurrences) -  ‘key_pass’ undeclared (first use in this function) in certs/extrac...
      Dashboard: https://d.kernelci.org/issue/maestro:c8d36aa6848ceeb5f21060331b3fcc14fe6c4896?iv=1
    #2 (33 occurrences) -  use of undeclared identifier 'key_pass' in certs/extract-cert (cer...
      Dashboard: https://d.kernelci.org/issue/maestro:3f4a6e9267e202205cf56c65e64d2cb3d3f4f4b6?iv=1
    #3 (30 occurrences) -  'HMAC_Update' is deprecated [-Wdeprecated-declarations] in crypto/...
      Dashboard: https://d.kernelci.org/issue/maestro:cfb7db7bad026f784ab5093df91515e27c634b34?iv=1
  
  redhat:
    #1 (9 occurrences) -  error: target emulation unknown: -m or at least one .o file requir...
      Dashboard: https://d.kernelci.org/issue/redhat:a8b090056d8e6bc4eee9ffa4389946c992a6e989?iv=1
    #2 (1 occurrences) -  in /tmp/rpmbuild/BUILD/kernel-7.2.0-build/kernel-7.2-rc3/linux-7.2...
      Dashboard: https://d.kernelci.org/issue/redhat:2f8dff08bcf0ceb0eb3008fe0f21056ce4c95783?iv=1
    #3 (1 occurrences) -  in /tmp/rpmbuild/BUILD/kernel-7.2.0-build/kernel-7.2-rc3/linux-7.2...
      Dashboard: https://d.kernelci.org/issue/redhat:6f04d6d258ac586b9cd2acb989247720e59a4d04?iv=1
  

  TEST LABS ACTIVITY
  ------------------
  15 labs reported results this week (1 fewer than last week).

  Labs marked with an asterisk (*) are new.

  Lab                   Covered builds  Boots    Tests          Change (tests)
  ────────────────────────────────────────────────────────────────────────────────
  broonie               1,819           0        6,935          -454  (-6%)
  lava-broonie          356             1,415    297,315        +151,874  (+104%)
  lava-cip              449             1,172    293            +41  (+16%)
  lava-collabora        648             4,236    258,575        +160,156  (+163%)
  lava-kci-qualcomm     77              191      317,754        +76,004  (+31%)
  lava-kontron          247             458      0              0  (0%)
  lava-pengutronix      225             544      0              0  (0%)
  linaro                30              30       0              0  (0%)
  maestro               3,949           0        2,035,590      +263,267  (+15%)
  microsoft             50              274      9,108          +1,634  (+22%)
  opentest-ti           69              1,879    842            +401  (+91%)
  pull-labs-aws-ec2     70              69       68             +53  (+353%)
  pull-labs-demo        504             956      233,474        +140,919  (+152%)
  redhat                291             0        4,778          +604  (+14%)
  syzbot                29              0        36             -5  (-12%)
  lava-foundriesio      0               0        0              0  (0%)
  ────────────────────────────────────────────────────────────────────────────────
  Total                 8,813           11,224   3,164,768      +794,494  (+34%)

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
