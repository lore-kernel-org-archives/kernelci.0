Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE70917BCA
	for <kernelci@lists.linux.dev>; Sat, 25 Jul 2026 00:01:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784937671; cv=none; b=W+H5jrbzPLXjYE7c5A48GislGBUl6BWCzvSLbD3toIDlH7V1o1pd6OdLjCzjUKG4lp8IX7dOVSHMgLlt7Ytf+dWcd25Zjs/tbU/a5ULsP7Pf0JwL850lXN2QHxoJo3Cbx0d/5XDTfvYuZvSooxMmKTR/iJ/BHBODI2gsggpO45Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784937671; c=relaxed/simple;
	bh=OhTzJBJDkFTL6cwFJqepKJBHhiqzF9tSevJthMjUqho=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=r4VqqbaAzL8FfpnW7QwmEBfW0gGutc5tOKxv4B7VYcaUUt66EsKOwu5/UuRgD45yj1FwiWHagyObcE0KOeM0NhLUiFp6tTPH1R2k5ZYsKeRaEVnZt9dCsB8yTJ9yNHONnV3puyyga/maSN949NH9aK5apQC2cAEnbBTut4co7Zs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org; spf=pass smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b=Rk000GNd; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b="Rk000GNd"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2cce6a0c9c3so11685865ad.1
        for <kernelci@lists.linux.dev>; Fri, 24 Jul 2026 17:01:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci.org; s=google; t=1784937669; x=1785542469; darn=lists.linux.dev;
        h=message-id:date:cc:to:from:subject:content-transfer-encoding
         :mime-version:content-type:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=w4J3LOAQa/VW3iJuRU4ZBIrAs79+BA5Cwegy7kWjwkE=;
        b=Rk000GNdSDNmYkNDUpjHzL5ycwfB8ClOPO1/AGfkjHxoQFS54FF/IkTIuCE5dfC+kb
         FQtv1jEof8mz9/H9VH/zH67PPF5G5xxXhiqOXtwwPws8hLl8sWJRJO5uH6s0Cs01iy0Q
         Nk1Svve0NK6vrP4y4u5is0xuekWYaKoVW4JzpXlpOVQHJeOA7apG0sUHrjA4/lBLch41
         YdJRi23YuWpRMoOm8Q+Oe9Eh4dgbkzv4hmxTdbyTjjJAGrvfT4QMC/c0Rl6gJvz41kzT
         Y0OqCaBaAveEKUyO+8Ga4yQv8U6lGn85qeyVbh4sfFBUUbUTPCB1iw4McPdaQn9OixFO
         89ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784937669; x=1785542469;
        h=message-id:date:cc:to:from:subject:content-transfer-encoding
         :mime-version:content-type:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=w4J3LOAQa/VW3iJuRU4ZBIrAs79+BA5Cwegy7kWjwkE=;
        b=KXbYlia1Z2kpaKUuuKlmMzwxjsAWaSUbq4AFpVy9NdYtYNH3dgPbnaZfjmUjqVlxGw
         w92NiVRLqHz0ACsY1b5Q1mTfkShHHcVNPUTENfUI9f9Su5HuAizKQDt7CJbpubx9/dCC
         04f/PgXlTaghg8P5NbTciqpuwlabSbpqt8UVCJ3UQNeXnOIDN2xZYD3ycDt0ZmBTtrc8
         t9m1IrWHPdsdLqInw2XW8pl+yUAzA+aVCCS+SiR3hc2Pt4OIwjZrWd64l5SDyuXpgaO4
         7yx9CSs6MJRx3NJ7VQzRxWuVxcjrEqR+tkE6kDg1BrllE9uZPCM2LCRtb3YKB1J+Bz72
         QlzQ==
X-Gm-Message-State: AOJu0YzbarwqKHxleszhcT9CTGFHbRdb9OzyKIfdgfQ3oFiqIpMhwm6B
	vChCFB0I7AYfCLj65b3mWrfiCHvOlGKwVvwzf9xXYBAX9MpbQBgvN/O8dHxd/Hy/sN3SUROrlRs
	gR3CC
X-Gm-Gg: AR+sD12dpCufucngor2tV6ZSKkhd9y32Q0j3LCQ1IAHrhkn0FNPnIwC6LkMOp60pqiA
	AJ9XS2VsnZGUK6pt4s7nhUvup0dqCba+zm9pJdLiMHHcYG3T0x4VfqqT/imPonSqkzAI2j/9S6T
	rZ39ldellcwBgDdpVed1MOovB/vmjkf2h48Cvd4Phrcn1hYU21WmeJgrpGrTQ93JfzXOS+LISlW
	GkqFKlVdPXgKx9BF8t0/6+8zdddl/hQlsCJx3m+XnsPSUtfwSBLTmQD9iplWDOQtVqimXD1SnMJ
	RgFgHNR4O8JMwwFgWwvTqkFIBIJU+6S0epPuVKLpnMuwDWM0cq0H2vpsMrjsLa5ayeU7ldldO4M
	I+xFW+qKsC0Fy3kcBMqGwAlAj0YSA4kDzSH3isMQGbnckKwD1kzfL8EuXtU9x6sMTjcBjDPo=
X-Received: by 2002:a17:903:8c4:b0:2c9:d298:6c06 with SMTP id d9443c01a7336-2cfde82529dmr4521205ad.25.1784937666353;
        Fri, 24 Jul 2026 17:01:06 -0700 (PDT)
Received: from 92650adf53de ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc413766sm3635179eec.8.2026.07.24.17.01.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 17:01:05 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: KernelCI Metrics Report - 2026-07-25 00:00 UTC
From: KernelCI bot <bot@kernelci.org>
To: kernelci@lists.linux.dev
Cc: kernelci-results@groups.io
Date: Sat, 25 Jul 2026 00:01:05 -0000
Message-ID: <178493766503.1283.15736949757443452450@92650adf53de>

KernelCI Metrics Summary
========================
Period: 2026-07-18 00:00 UTC to 2026-07-24 23:59 UTC


  COVERAGE
  --------
                   This week  Last week          Change
                   ─────────  ─────────  ──────────────
  Trees monitored         36         35              +1
  Checkouts           74,749     71,341    +3,408 (+5%)
  Builds              15,063     11,342   +3,721 (+33%)
  Tests            3,475,143  3,175,947  +299,196 (+9%)


  BUILD REGRESSIONS
  -----------------
  A "regression" is defined as a reported problem affecting 0 or multiple builds.

  Origin           Regressions        Affected  Affected builds by top issues
                 (known + new)  Builds (total)         #1        #2        #3
  ───────────────────────────────────────────────────────────────────────────
  maestro     12 +   5 =    17             343         86        64        44
  redhat       1 +   0 =     1               7          7
  ───────────────────────────────────────────────────────────────────────────
  Total       13 +   5 =    18             350


  TOP REGRESSIONS PER ORIGIN
  --------------------------
  maestro:
    #1 (86 occurrences) -  ‘key_pass’ undeclared (first use in this function) in certs/extrac...
      Dashboard: https://d.kernelci.org/issue/maestro:c8d36aa6848ceeb5f21060331b3fcc14fe6c4896?iv=1
    #2 (64 occurrences) -  use of undeclared identifier 'key_pass' in certs/extract-cert (cer...
      Dashboard: https://d.kernelci.org/issue/maestro:3f4a6e9267e202205cf56c65e64d2cb3d3f4f4b6?iv=1
    #3 (44 occurrences) -  ‘key_pass’ undeclared (first use in this function) in certs/extrac...
      Dashboard: https://d.kernelci.org/issue/maestro:1bc31bdc5afab00de98efd0c67ef8653e5385a69?iv=1
  
  redhat:
    #1 (7 occurrences) -  error: target emulation unknown: -m or at least one .o file requir...
      Dashboard: https://d.kernelci.org/issue/redhat:a8b090056d8e6bc4eee9ffa4389946c992a6e989?iv=1
  

  TEST LABS ACTIVITY
  ------------------
  16 labs reported results this week (1 more than last week).

  Labs marked with an asterisk (*) are new.

  Lab                    Covered builds   Boots       Tests   Change (tests)
  ──────────────────────────────────────────────────────────────────────────
  broonie                         2,983       0      10,833    +3,942 (+57%)
  lava-broonie                      529   1,728     365,396   +68,081 (+23%)
  lava-cip                          556   1,351         157      -136 (-46%)
  lava-collabora                    774   5,190     207,494   -51,081 (-20%)
  lava-foundriesio *                 67      67           0                0
  lava-kci-qualcomm                 130     335     414,650   +96,897 (+30%)
  lava-kontron                      313     605           0                0
  lava-pengutronix                  343     739           0                0
  linaro                             30      30           0                0
  maestro                         5,076       0   2,150,741   +115,151 (+6%)
  microsoft                          77     428      16,911    +7,803 (+86%)
  opentest-ti                        59   1,550         681      -161 (-19%)
  pull-labs-aws-ec2                 100     100          99       +31 (+46%)
  pull-labs-demo                    644   1,240     291,039   +57,565 (+25%)
  redhat                            239       0       3,723    -1,055 (-22%)
  syzbot                             40       0          56       +20 (+56%)
  ──────────────────────────────────────────────────────────────────────────
  Total                          11,960  13,363   3,461,780   +297,057 (+9%)

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
