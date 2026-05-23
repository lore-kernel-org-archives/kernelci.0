Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B967BF4F1
	for <kernelci@lists.linux.dev>; Sat, 23 May 2026 00:01:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779494473; cv=none; b=bOFG9zdBuiz+y4zRr/dU6MzIcjIBtZVe0nqaq1DZFHipEDSmqaMq3vSAm/fc30SyfoRYSgV4yKF6UG43+N+ZPjEiT834mDG2lxPEftntJani+kbQMbkLWhqbyCdnFyqiyJCgXmP0xkIyudluKMqiOWJSlpzBWMgdwuDexk5xBXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779494473; c=relaxed/simple;
	bh=WBt/EuMO7Sj0rp/GMXmgxvHP40sXz0UusEJeWJ2D3+s=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=HfECyothDLJifTmX0N+X1GDe0xQrgkECwhKqSiQrMhyNksd+P74syZyX0Xj/BKXmd136IzgJfd4wrc+1tQYTKg9jBcX1GD1yyopoUJ/c1qfyM4EjvEqpIBCjwNvAWApvWj8JIcFuZROpnj0EKxRmwnsHouOtceHCvXkTpYK7AcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org; spf=pass smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b=Iy2BT8gG; arc=none smtp.client-ip=74.125.82.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b="Iy2BT8gG"
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-3044857f09aso2632304eec.1
        for <kernelci@lists.linux.dev>; Fri, 22 May 2026 17:01:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci.org; s=google; t=1779494471; x=1780099271; darn=lists.linux.dev;
        h=message-id:date:cc:to:from:subject:content-transfer-encoding
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=BjJxM2DoKlmGrIdqU7pzaVGD1qr8Ip1iWWd3CPKGSXg=;
        b=Iy2BT8gGWjtT3JLopFGTtrWW3ofGOcsczYGHk1zsffQKdcmIaRYpKWN0sxEoSA+aPr
         f+F3qPJsPsm3MGBHaJbkSddJuI+EIg3qdMtHC+2Me3X8dHGUosa0tCQUZREdEQgOc2xl
         gvGTqorswzagvuwyZt/qol3UT7W8d+/l3ZAvveGymZu9yOYqcxWYzTdonTQqK0qmGzzf
         WHPQ/z9XePl10H9AekbEKGeo+7dCiDEna9JiLuejKhLMizunHcek9+F8y1lJ44iZxWkK
         vI2u0XTDgxzbv/lKoJbcT0x7X2h76uOUFD6+MAex5HBH7BfqHfI4K7jT+JWXwB+jN8tQ
         0M6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779494471; x=1780099271;
        h=message-id:date:cc:to:from:subject:content-transfer-encoding
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BjJxM2DoKlmGrIdqU7pzaVGD1qr8Ip1iWWd3CPKGSXg=;
        b=lWoKIl+K1J6tCpN9FMnaj4NEcg65rsDct8pzY2o9/7rcu2furMOlF+Kc7P6vLd6Amc
         BP/dDVHPPQrANSwrWtgg7cGHcVo2bTipMKZJM8ElnNUMKTqktuOMesI49XvzsBlrQAkV
         7kvdKiLaCeL11WADKHicpfl0bHux9eKV/jTzB4740i+RezOI2mmHjjHoblK8xvgmmIki
         qzXa50xKg1q3uiXF8Iz9JZth92nQA39pUIcZepL8nPpuFpFu/m4eQnDY7KcY6hb8efyZ
         Ty56arOOi8N+E/OJmaq4areE5hy2+ztMUbfZITtaXgrIB4YZ5OwJtzqaE7x3fY2LGtbU
         TdDg==
X-Gm-Message-State: AOJu0YxR9PpqlRGOiMgoPsDdmufvHTMS7REt/Ai+wqSgN9Fv4yKid38x
	rVTX2UUMXCQ+VxFh98iW5QTZnXOtq+RJo3LOQvTdo9RrSSX4QfvPOzvB/8fej1Pfp0rQnctGDqV
	LUIuq
X-Gm-Gg: Acq92OHfh3FEKQevrmlBIGlGX2+eeObVAdZlG6iE+pvEJG8+CMxvQMN6iOzyOXNgfrB
	hkWa2QjKlbG2T/XMNaY9p3AhPmr+QgL37wQwEpc+C3/3/VO8ITrAW2U+7K3dT1wdpZu5vWB/0+x
	XHFbytH+h7506osDYDkdMTRt9gA3EWUT0bc5KoUhSQFhB7e/mm7FfXFTDEE19JYqUIGTr3YLUU/
	apa/1FNU46OY9s69tja9ehBFwx9st8fdlPZ0qbFtBX92SZS+nCMZnjWqvQZmD+LpCjIIhtlQaAM
	1rTfCHqLKgqNloOOXWlbDM96vvyYWC/WyxZj8AmaEWaxOd+s+Soad6UtU4/3DfjwxVoPjqnK3Zf
	Kmx7BrGjxFo6EcQsxLIfXZ6J7cqunM3p1khIOhkQEM4R/5Ugsq33J8aGtkuq7ziY+fCOQhSJe6x
	aFtLjOuuq7oHAOIgY0XY3mVDr4imY=
X-Received: by 2002:a05:7300:6417:b0:304:29dd:70b6 with SMTP id 5a478bee46e88-30448f5173amr2774162eec.13.1779494470573;
        Fri, 22 May 2026 17:01:10 -0700 (PDT)
Received: from 330cfa3079ca ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30452230f1bsm2075135eec.14.2026.05.22.17.01.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 17:01:09 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: KernelCI Metrics Report - 2026-05-23 00:00 UTC
From: KernelCI bot <bot@kernelci.org>
To: kernelci@lists.linux.dev
Cc: kernelci-results@groups.io
Date: Sat, 23 May 2026 00:01:09 -0000
Message-ID: <177949446915.4398.14566578930665046103@330cfa3079ca>



KernelCI Metrics Summary
========================
Period: 2026-05-16 00:00 UTC to 2026-05-23 00:00 UTC


  COVERAGE
  --------
                      This week    Last week    Change
                      ─────────    ─────────    ──────
  Trees monitored     39           36           +3
  Checkouts           5,746        6,192        -446  (-7%)
  Builds              11,456       8,690        +2,766  (+32%)
  Tests               2,344,779    1,471,576    +873,203  (+59%)


  BUILD REGRESSIONS
  -----------------
  A "regression" is defined as a reported problem affecting 0 or multiple builds.

  Origin    Regressions       Affected           Affected builds by top issues
            (known + new)     Builds (total)     #1      #2      #3
  ─────────────────────────────────────────────────────────────────────────
  maestro   15  + 7   = 22    234                39      34      33      
  redhat    2   + 0   = 2     10                 8       2       
  ─────────────────────────────────────────────────────────────────────────
  Total     17  + 7   = 24    244


  TOP REGRESSIONS PER ORIGIN
  --------------------------
  maestro:
    #1 (39 occurrences) -  'HMAC_Update' is deprecated [-Wdeprecated-declarations] in crypto/...
      Dashboard: https://d.kernelci.org/issue/maestro:cfb7db7bad026f784ab5093df91515e27c634b34?iv=1
    #2 (34 occurrences) -  implicit declaration of function ‘drm_fb_helper_gem_is_fb’; did yo...
      Dashboard: https://d.kernelci.org/issue/maestro:d0858e23012d44ea7b9a8ffe620de278ff702a34?iv=1
    #3 (33 occurrences) -  the frame size of 1056 bytes is larger than 1024 bytes [-Werror=fr...
      Dashboard: https://d.kernelci.org/issue/maestro:2d2c5f1e10db58dfd3e3dede1ad14b9b83331a14?iv=1
  
  redhat:
    #1 (8 occurrences) -  error: target emulation unknown: -m or at least one .o file requir...
      Dashboard: https://d.kernelci.org/issue/redhat:a8b090056d8e6bc4eee9ffa4389946c992a6e989?iv=1
    #2 (2 occurrences) -  openssl/engine.h: No such file or directory in scripts/sign-file (...
      Dashboard: https://d.kernelci.org/issue/redhat:54dfb8887344e76e107b693682922a26eb7678e4?iv=1
  

  TEST LABS ACTIVITY
  ------------------
  18 labs reported results this week (3 more than last week).

  Labs marked with an asterisk (*) are new.

  Lab                        Covered builds  Boots    Tests          Change (tests)
  ────────────────────────────────────────────────────────────────────────────────
  broonie                    1,516           0        6,942          +122  (+2%)
  lava-broonie               418             1,881    363,056        +93,349  (+35%)
  lava-cip                   477             1,155    98             +17  (+21%)
  lava-collabora             766             4,402    276,137        +93,059  (+51%)
  lava-foundriesio           127             173      0              0  (0%)
  lava-kci-qualcomm          101             74       3,122          -8,103  (-72%)
  lava-kontron               281             419      0              0  (0%)
  lava-pengutronix           281             740      0              0  (0%)
  linaro                     27              42       324            +108  (+50%)
  maestro                    1,208           0        1,669,319      +691,444  (+71%)
  microsoft                  47              277      5,250          -678  (-11%)
  opentest-ti                72              2,141    669            +61  (+10%)
  pull-labs-aws-ec2 *        53              53       0              0  (0%)
  pull-labs-demo             799             1,233    1,912          +476  (+33%)
  pull_labs_aws_ec2 *        6               5        1              +1
  pullab_cloud_aws_arm64 *   11              0        11             +11
  redhat                     310             0        5,277          -907  (-15%)
  syzbot                     57              0        65             +8  (+14%)
  ────────────────────────────────────────────────────────────────────────────────
  Total                      6,557           12,595   2,332,183      +868,968  (+59%)

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
