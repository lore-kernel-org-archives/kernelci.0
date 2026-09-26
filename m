Received: from mail-dy2-f43.google.com (mail-dy2-f43.google.com [74.125.229.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0960282F24
	for <kernelci@lists.linux.dev>; Sat, 26 Sep 2026 00:00:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790380835; cv=none; b=TN3ahaTFymcUyJSO4kZL/CakbYpOczYJUIc0ieZofcZLhS6ycvOB/Nc3FXE0my0YTJHh5sWr2ZN3PhIObuFbIcZUiwGHvLwPivzpfsFaElEulj5RBf9Y+1HrfoM3s/gjRGFsQRfNjrbdroXXJ3x/z5rX4TsH0BknX5VR93pCSbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790380835; c=relaxed/simple;
	bh=n0c9hU5daGzC0RDNoPPS14vghUoWKcH2nPrNxF2WODE=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=l2HEiUr6RQASK6ko8iNx6w7OFu3dpngueKSP0UUrRleCNqIQDe7fQQiUttwV2wQR9FvTA0uQhJ+Get4RNvz/OM/XFDDBi9HXBCklauFQoOZPgyLBj1YceIXuLD/4MFNWfMHB7oTyOKJU2ld7/ee+RxOYk0aRzA/aWG7WMjYQLx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org; spf=pass smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b=h5Gzv6Wo; arc=none smtp.client-ip=74.125.229.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b="h5Gzv6Wo"
Received: by mail-dy2-f43.google.com with SMTP id 5a478bee46e88-328664ef791so795028eec.3
        for <kernelci@lists.linux.dev>; Fri, 25 Sep 2026 17:00:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci.org; s=google; t=1790380833; x=1790985633; darn=lists.linux.dev;
        h=message-id:date:cc:to:from:subject:content-transfer-encoding
         :mime-version:content-type:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=mgqTDv9+8sc7YX9m6Ml6AvUWrux9AikMZQan7ZAJ4es=;
        b=h5Gzv6Wo4swxsxrCbTPxUrVdmSF9xUZdyPg7nPHpDt3X04JUE0rJVUVr4ZIKL9a6yo
         c0Sx1Y3ImUMPa86430Lph4f3VSDPvhCm+I+NXUFN/8ypGqq3i2jz498KV7B6nCyPZU78
         lnUxVfDIgxW5/WD7CR5gXamt5g/Io40tmY3WBC9gi1joE8x4FwTqbBfsQ2IAHalsiGW2
         t9m5onMOed3YbBSueuvoNVGRbg5pKOVue/UN1J6GQWP8NKHGckV17Ux6DKviGn0/1oHT
         xFR0yB1qxQMssTCnNVktOE4pupkEPDpNkr1CmZFv8CB3JVwhpwu2jZUnH1TYWYWwwdgZ
         jDXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790380833; x=1790985633;
        h=message-id:date:cc:to:from:subject:content-transfer-encoding
         :mime-version:content-type:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=mgqTDv9+8sc7YX9m6Ml6AvUWrux9AikMZQan7ZAJ4es=;
        b=EcRMg0jfM078WzQeo5FGOYymC+Clw4GvDa0wTtiMd29A/BkLeEhMz+9PL879kSo1+u
         Fllg2qUIpocsj65gukCpRJwtjO3RoO2kzXGG7YwtAxwpD0dnxVGiTm0mydLO19OSUZy2
         oa1CzcFaCHLSy4Vtw2qHz8ZQQ4cRr+InqMn2arBxG4+EGoOQa7y02J4neK2SpyNgEzj1
         ZVuBkQyLsH3AGE/aKUxTFrasd4oHI3U230sZl6bbqpREskIZ8kYjhbT2JJT5n3i5rpvl
         LElXaVZeX/HGWwIQBKmutWGCwEgUQcYooKksRzbmhh+hHgzOFROqKIUCVF7hmV1vTsmF
         //Mg==
X-Gm-Message-State: AFuF++n/MFg6by73sb71ZX93aHR5K8e9cEoJSh20qoUYuEdATE9xXFHF
	hKwUuYlDZAZoJo4tY9/QZf4vAF/FKhozAHBebip/1y1yGzWkSsKZcrv24+KCA/AzKbMNCfTTwrT
	N4Qb6
X-Gm-Gg: AYBFou1Vu/JkxkhTDX03v4A0C0hcXy4GNox+RNLwCnXu0erFfQi1ogFvbrQXGXSdiBY
	u4chSdrwoTCR/iFSxU9aSnyOUz2yBgEDEgr6N5G9zck/jrjcEY7pe8TREjZFhBmp0SXAukXN1qp
	6bEUj1SNjzmOrecZANXzM8oFXcOZw9rqiOrdiG6vudC2KzN1ZXM+rQAbOSkK27ybKmF4/g+YCvo
	qJANQ/Oatkw00t6yhzxBLnpU9wF8awWCBDW+K73lEWA02g+1H1wcuwEWY7gHRBA5ZnQ8r+OTwMv
	FqdKlsLDLw0ZYV0WP9CVGG8wz0XB6rpLd5rpc6TD3sEnQGJfa5k653gmKtL0ahpNBwnj/1ujlOB
	MMHZaRUpzNXzAfeRrR827ZmGyX18b/hYtxk87exh7WMdRJMaY/pucZFxKx8xyAdimRrBor35VJ3
	GVNvGyzwBXLlpM4paPlhEp1fun8e9d5510ZplGuIIYBV583pWQTpUMStNfD84mik8=
X-Received: by 2002:a05:7300:a986:b0:328:7033:9b8c with SMTP id 5a478bee46e88-342711ac458mr2221989eec.6.1790380831615;
        Fri, 25 Sep 2026 17:00:31 -0700 (PDT)
Received: from ec7b70f3a45c ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3416e4c2f50sm8780933eec.27.2026.09.25.17.00.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 17:00:30 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: KernelCI Metrics Report - 2026-09-26 00:00 UTC
From: KernelCI bot <bot@kernelci.org>
To: kernelci@lists.linux.dev
Cc: kernelci-results@groups.io
Date: Sat, 26 Sep 2026 00:00:30 -0000
Message-ID: <179038083013.588705.2611536769213206266@ec7b70f3a45c>

KernelCI Metrics Summary
========================
Period: 2026-09-19 00:00 UTC to 2026-09-25 23:59 UTC


  COVERAGE
  --------
                   This week  Last week          Change
                   ─────────  ─────────  ──────────────
  Trees monitored         32         38              -6
  Checkouts            4,071      5,623   -1,552 (-28%)
  Builds              10,033     13,414   -3,381 (-25%)
  Tests            2,772,906  2,547,803  +225,103 (+9%)


  BUILD REGRESSIONS
  -----------------
  A "regression" is defined as a reported problem affecting 0 or multiple builds.

  Origin           Regressions        Affected  Affected builds by top issues
                 (known + new)  Builds (total)         #1        #2        #3
  ───────────────────────────────────────────────────────────────────────────
  maestro     27 +   8 =    35             481         90        44        37
  ───────────────────────────────────────────────────────────────────────────
  Total       27 +   8 =    35             481


  TOP REGRESSIONS PER ORIGIN
  --------------------------
  maestro:
    #1 (90 occurrences) - Error in defconfig (/tmp/kci/linux/scripts/kconfig/Makefile:95) [lo...
      Dashboard: https://d.kernelci.org/issue/maestro:f2c3a9af64a352cb6c8e900e9cd6c2255f242f24?iv=1
    #2 (44 occurrences) -  shift count is negative [-Werror,-Wshift-count-negative] in driver...
      Dashboard: https://d.kernelci.org/issue/maestro:ce5ec46ecf72462fff1bede413010b22a34a9494?iv=1
    #3 (37 occurrences) -  in vmlinux.unstripped (scripts/Makefile.vmlinux:72) [logspec:kbuil...
      Dashboard: https://d.kernelci.org/issue/maestro:b5ed9b51212f5174ccbd9d812fc43e26fcc5361e?iv=1
  

  TEST LABS ACTIVITY
  ------------------
  17 labs reported results this week (unchanged from last week).

  Labs marked with an asterisk (*) are new.

  Lab                    Covered builds   Boots       Tests    Change (tests)
  ───────────────────────────────────────────────────────────────────────────
  aspeed                             53      53           0                 0
  broonie                         1,156       0       3,792       -993 (-21%)
  lava-broonie                      221     322     144,814   +85,532 (+144%)
  lava-cip                           71     215           0      -272 (-100%)
  lava-clabbe                         4      16           0                 0
  lava-collabora                    442   1,833     232,043    +29,321 (+14%)
  lava-foundriesio                  129     129           0                 0
  lava-kci-qualcomm                 114     438     368,436   +136,258 (+59%)
  lava-kontron *                     38      75           0                 0
  lava-pengutronix                  277     719           0                 0
  maestro                         3,890       0   1,952,663     -27,255 (-1%)
  microsoft                          49     265      11,842     -8,074 (-41%)
  opentest-ti                        69   1,540         442                 0
  pull-labs-aws-ec2                  72      71          72        -14 (-16%)
  pull-labs-demo                    366     975      30,770      -2,515 (-8%)
  sasha-lab                          51      71      21,196   +16,827 (+385%)
  syzbot                             67       0         114          -2 (-2%)
  redhat                              0       0           0    -2,467 (-100%)
  ───────────────────────────────────────────────────────────────────────────
  Total                           7,069   6,722   2,766,184    +226,346 (+9%)

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
