Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BAD264
	for <kernelci@lists.linux.dev>; Sat,  9 May 2026 00:01:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778284862; cv=none; b=gLL1qzB0Eq/rms8nM/e/LC5jIQzjzMoye9KMUqfx0yQILkhnGUML5Lv/5mYCsvKIg4/94GKeTy5scq4K1Hf5VvkvTLDCmiaAn4E266kt1Mq7HOHID2fyQjuVXhFu3V2BKpUxjvTBWur6GNsIJh3pVjt1m09q5N20gPmHuu//UuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778284862; c=relaxed/simple;
	bh=i5TJ4ZVPuRTD/0a2kN9/aNOasn3Y0PI8nTiMIEbA9es=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=peJv+J1TIeqfS8dCf2AaTgjSdcHXHc0dQ4oW98jC8Yj0sOlFerClOTv1dt0004Oi5Cm6WYqVfEnE/nlSK4e0ae7U8FXLBdeAaZ3YG2P/GBjS4c49Q5R4/oNw5NLjJA4N2Ch6qaU9HZCvhk8V0HxK98khtMUgK21R/DthygddFZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org; spf=pass smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b=i8Z8hXg1; arc=none smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b="i8Z8hXg1"
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-2f03d6cf77bso2856140eec.0
        for <kernelci@lists.linux.dev>; Fri, 08 May 2026 17:01:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci.org; s=google; t=1778284860; x=1778889660; darn=lists.linux.dev;
        h=message-id:date:cc:to:from:subject:content-transfer-encoding
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/ROwByRxH0c7ziESElZJ13tPFOa21lkMNmV6SI9Yxj0=;
        b=i8Z8hXg1kGIisxKAa197vwyLsr7GeV7NR1lWGnYlW4KS0LKcNU9ONqBsHQMysM7KQl
         5El+65H5lAdZMBp7/g4eZKYdLR9pRbNUGIyyAOePwOPCGYnOKCGPD3DcOPQuxpHtiSOJ
         mr4IQ7ZTpE2vA7St5s691VZoRRu/nlFxYSfybo+H+BBkmEBpBAg5kRK2E/KE4QqeVaSp
         iQkZFZxHSSNQzU+xUgh38bWlrhOvKuMQdyQuJWn4thD8fnVd7SKyrJAygijICzFKfxwV
         o1u+wMOIP4M5q6Rnbp6+VQrrNC9gxkRZnHRoH5gv9oSOprUHP2eWUa/sHdEadF89x7tP
         aOrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778284860; x=1778889660;
        h=message-id:date:cc:to:from:subject:content-transfer-encoding
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/ROwByRxH0c7ziESElZJ13tPFOa21lkMNmV6SI9Yxj0=;
        b=Hj0pMZB+wtSJ7m/d6NHv2KSCIeTJ6Qlup6GMeItwC+3Ve6WGwxzfbOrwnJQPpMW7oI
         Of8A/k5ysyXDYADKZBwH6BQZqKo7aL/P8/JZAvMNaYKI2GuFpa0e12DjTKtOm2rRSC8Z
         WkSCphssDC6IrGEyXAZBq6U/F3i9Z8MvHOvQtQIYkudGBpE3FTEHK0ZBZ67yNe29b1CW
         SnVukdjqrVNKzZJJHTdSYRceFlgcm5VoEfldObPfhs+2v6Vvodm/sQ/yy8J6bd9kOrNE
         FfHss7aS9A/DVyv7D5EZmEmC62R0uiRyX5DCYEZgbG7MmexUIGEqIcrYjBpVarvNqwKe
         PJtw==
X-Gm-Message-State: AOJu0YxKzcg5c1T7tlJH2UNrn5Hrk5Wig3wpX7EshpwyOUhuHPbxAVc7
	U5YywyeaTtaovXFtTnWsBsHnaxiPVKejebXFvjbB0WPGpF7ZOUaLJzBdeAEp6R8Oo8FBzfSs+RC
	Pi2kx
X-Gm-Gg: Acq92OHOQRoeLb5DfA8emULxxo1379Q0qfTcOMZryAPvJULwxuoBVlqyLjrtObU8lgH
	Dy5D0oiFlkuAsJ8tBgkD6xrbDbDlvWuMHJwliKP/mY2Yks8s3mNIXAPJPNdHTJk3bvm42ZhOYVL
	LFIyl8lVgLuzkckeT/2mkCxOso9fBVvBOOx8XC9yMsqNM4qaCTyg/+YkL3aO9lphcI7M4Bb43cN
	j8K/tiMBLJz8o1lm6yecSDIomjpi2eBNlFWqx5i9CcQEjPRMyaJ0xxJfNC0imvb7zESLd2pD7Mo
	Bms+9DULvbGGDq5Bl7AtIu84FijhutP1KR1ON2Rcwl4TrBEhL6dGFGu4mFWxNntnBehY4OQxfzz
	8cQPD6XC2X7iEm7u3BQFEv5uZ30ZgLcFgAF1sM3Zr9odQ9L3f3p/QFaYN57L7AB7aIDNzjVt4ZC
	cy533rfqU3i5TGx2E/
X-Received: by 2002:a05:7301:3d1a:b0:2d9:6f2f:9f6f with SMTP id 5a478bee46e88-2f54ae73308mr6213175eec.24.1778284859674;
        Fri, 08 May 2026 17:00:59 -0700 (PDT)
Received: from 997d03828cfd ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f888c469b6sm4351395eec.24.2026.05.08.17.00.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 17:00:59 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: KernelCI Metrics Report - 2026-05-09 00:00 UTC
From: KernelCI bot <bot@kernelci.org>
To: kernelci@lists.linux.dev
Cc: kernelci-results@groups.io
Date: Sat, 09 May 2026 00:00:58 -0000
Message-ID: <177828485850.4406.10898006250155915653@997d03828cfd>



KernelCI Metrics Summary
========================
Period: 2026-05-02 00:00 UTC to 2026-05-09 00:00 UTC


  COVERAGE
  --------
                      This week    Last week    Change
                      ─────────    ─────────    ──────
  Trees monitored     36           39           -3
  Checkouts           5,647        5,416        +231  (+4%)
  Builds              9,850        10,531       -681  (-6%)
  Tests               2,110,391    1,755,101    +355,290  (+20%)


  BUILD REGRESSIONS
  -----------------
  A "regression" is defined as a reported problem affecting 0 or multiple builds.

  Origin    Regressions       Affected           Affected builds by top issues
            (known + new)     Builds (total)     #1      #2      #3
  ─────────────────────────────────────────────────────────────────────────
  maestro   12  + 16  = 28    224                51      35      27      
  redhat    2   + 0   = 2     9                  5       4       
  ─────────────────────────────────────────────────────────────────────────
  Total     14  + 16  = 30    233


  TOP REGRESSIONS PER ORIGIN
  --------------------------
  maestro:
    #1 (51 occurrences) -  implicit declaration of function ‘drm_fb_helper_gem_is_fb’; did yo...
      Dashboard: https://d.kernelci.org/issue/maestro:d0858e23012d44ea7b9a8ffe620de278ff702a34?iv=1
    #2 (35 occurrences) -  the frame size of 1056 bytes is larger than 1024 bytes [-Werror=fr...
      Dashboard: https://d.kernelci.org/issue/maestro:2d2c5f1e10db58dfd3e3dede1ad14b9b83331a14?iv=1
    #3 (27 occurrences) -  format specifies type 'long' but the argument has type 'u64' (aka ...
      Dashboard: https://d.kernelci.org/issue/maestro:10dd158d173bc4514d7fb980677e6b205796fa91?iv=1
  
  redhat:
    #1 (5 occurrences) -  error: target emulation unknown: -m or at least one .o file requir...
      Dashboard: https://d.kernelci.org/issue/redhat:a8b090056d8e6bc4eee9ffa4389946c992a6e989?iv=1
    #2 (4 occurrences) -  openssl/engine.h: No such file or directory in scripts/sign-file (...
      Dashboard: https://d.kernelci.org/issue/redhat:54dfb8887344e76e107b693682922a26eb7678e4?iv=1
  

  TEST LABS ACTIVITY
  ------------------
  15 labs reported results this week (unchanged from last week).

  Labs marked with an asterisk (*) are new.

  Lab                   Covered builds  Boots    Tests          Change (tests)
  ────────────────────────────────────────────────────────────────────────────────
  broonie               1,334           0        5,724          -1,736  (-23%)
  lava-broonie          371             1,601    345,386        +69,285  (+25%)
  lava-cip              440             1,031    121            -50  (-29%)
  lava-collabora        648             3,786    271,736        +138,512  (+104%)
  lava-foundriesio      108             145      0              0  (0%)
  lava-kci-qualcomm     100             121      77,341         -2,574  (-3%)
  lava-kontron          246             365      0              0  (0%)
  lava-pengutronix      247             660      0              0  (0%)
  linaro                27              54       324            -36  (-10%)
  maestro               721             0        1,389,429      +148,806  (+12%)
  microsoft             49              284      4,342          +1,263  (+41%)
  opentest-ti           70              2,038    829            +120  (+17%)
  pull-labs-demo        180             190      328            -358  (-52%)
  redhat                273             0        4,515          +385  (+9%)
  syzbot                28              0        41             -14  (-25%)
  ────────────────────────────────────────────────────────────────────────────────
  Total                 4,842           10,275   2,100,116      +353,603  (+20%)

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
