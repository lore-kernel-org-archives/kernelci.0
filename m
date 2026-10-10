Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3488D10F1
	for <kernelci@lists.linux.dev>; Sat, 10 Oct 2026 00:00:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791590435; cv=none; b=TIwkA6QJqLlpCGH9H1MuvkmbjWtlaQYo0XVttax30xGk2OWQzvZMKE200iFsJA2QeZH/iF8ol76l+30cBF3N/ADqdLyc7tjbclWc61GgzSoFVK/lVlSnaKZCPTfKdYYpAfmwuyUl0k/2uQfHtIPIE8xgvGKkpEkl5PNLG41FNAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791590435; c=relaxed/simple;
	bh=1exABp/ClR43SDsG/gTMHYLBaihgXWvhUsROxbrbp0Q=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=VqY42Ld3AXgVfcmVQjWJhwYacDRKCQAbC2E7Aoy1VQZKzpRP3LIQjoRxjPSpLL7CbZS9OBfBh8db+iZPR89X/IXcIrUiAyNi197ykjYy9POsqjMubq0SoUB3Pf5HEtDpaVG1XjWGsPx5icaGan2U5USRJa1xRjZY3hAK5qMm0mk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org; spf=pass smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b=L1+UTz+S; arc=none smtp.client-ip=74.125.82.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b="L1+UTz+S"
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-353804b591eso375831eec.0
        for <kernelci@lists.linux.dev>; Fri, 09 Oct 2026 17:00:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci.org; s=google; t=1791590433; x=1792195233; darn=lists.linux.dev;
        h=message-id:date:cc:to:from:subject:content-transfer-encoding
         :mime-version:content-type:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=25anFo8Rr16bvqcJcXqaysKlEnBQCBS/F5qQylKvxxA=;
        b=L1+UTz+SCmItK+Q+QWJg23nwwPLO0ciXslE2biVYNcYrVuaYRFRHODvFSmx3SR+7F9
         cYBJwcUJoZB0tF9M2KUybKYxvvLiOnfrj7rEJH3wJrY8QBqy1fWor6vkEuWlek2jj2cX
         tOodiQ/7KrVQgL/olzKr6+SsvGtNAOeO3SlZXhNvcTtdhCNoB1cxER3zdUrFfU474SYF
         DtWspLSCJGawbBGT5d2ybGyy6BYH6ewkCrDQSRLfz3t2ELobzEA0T7DRD3YvhU9l0o+5
         4FZRPhtjo6gvixBEsrXI/vNFU/u0Go7JcXaL/bgFss4v7EsYLAm+FybOIohs4Ep1XWTD
         Mbnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791590433; x=1792195233;
        h=message-id:date:cc:to:from:subject:content-transfer-encoding
         :mime-version:content-type:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=25anFo8Rr16bvqcJcXqaysKlEnBQCBS/F5qQylKvxxA=;
        b=isa0YL2NZYiSh6TDPTB0em/JUmYW212YZBbM1MYONB4k3bkaTxgfveZwk6zmrpJb7H
         McHVTYq+/QzLghvnNMk81lvVTU7UOQtEBFWIKGRa/7hfu8zIq/QmxJJyIi9R5DmZKOan
         pD55YX7vYDVAEdN5sA8Bqtkz/tTq3fZPFeiKZPQrcHrGcyBllmnKWHcF6NdFeFaHZ71a
         57KTYAhQXIU2nCFVXkdIgPeLkD0GnWnh1Lk/r3+tsGJfbR2akSX8uDl5RoJ4QuJy2CtD
         kou6ofbFuz9kPbQmQFSLE8LeQlZ2FxyUQZzmelsxXdBwxX/EXGqqKGX6wdJlE1cEkDXo
         QQ1A==
X-Gm-Message-State: AFq9FYLMwekQQ322sOcqFd3HzCVRYLGZhQzUz9m+VypujN14y4pazWhO
	MvFBrlkZeacDezcIQOUhL3xKPwFSiDTlnoHV+ZnZATyazhYm4eCXCQZe9lgOvsulgO88MUQHG1o
	6dme4
X-Gm-Gg: AYBFou3TSlt9vf2F5fsbaa0BfM0pkf2Beag4ZGAYVsLy2cZEOvQHXWBtqrLPm3J79/i
	TSXQRqFkggDUTp6EF6vCjfsnQY6oT0RYz8ZsvWpCq8p87h90aFQv7bxcBTlzsiAXikgCfrWB7FG
	VjNhbSzP4UXAKdi0Gzq898a7lqvxlG1YTb8JT3ZBRPadKbG5mbiqJ/OAo1pZBOf7Eexc9WYXhvj
	cgR+QVYHXkdjMD09XbyiVGeFATQVc/UsiLnbIZOon02yNmTWC+8sWZnQnCOXBWfM0jCtAItAdZE
	ezbN1zhIgmnrgs2PsicXwWNnkyH8HP8E6TqtLxh1p/edezV1Gq8eoqJ1aXKueJJFD0gkADid3OV
	xYQs23HLd29xucnRot1onggmItPir8sKczEZBNDFvZ4aZC4gamkbKHPEpHYn6Qjpb6mn0andMUU
	p+ARCy+C2a3RwfleFyRHX4dnJzK5dYnv6hTezVEvICKe6WeeZoSZNF9h7d4qVXsLA=
X-Received: by 2002:a05:7300:b106:b0:34e:f948:d7da with SMTP id 5a478bee46e88-3537e0ce190mr7107673eec.21.1791590432755;
        Fri, 09 Oct 2026 17:00:32 -0700 (PDT)
Received: from 244668f92ec4 ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537c61eaa0sm11692283eec.0.2026.10.09.17.00.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 17:00:32 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: KernelCI Metrics Report - 2026-10-10 00:00 UTC
From: KernelCI bot <bot@kernelci.org>
To: kernelci@lists.linux.dev
Cc: kernelci-results@groups.io
Date: Sat, 10 Oct 2026 00:00:31 -0000
Message-ID: <179159043156.68410.1452923017571768116@244668f92ec4>

KernelCI Metrics Summary
========================
Period: 2026-10-03 00:00 UTC to 2026-10-09 23:59 UTC


  COVERAGE
  --------
                   This week  Last week         Change
                   ─────────  ─────────  ─────────────
  Trees monitored         30         35             -5
  Checkouts            3,839      3,285    +554 (+17%)
  Builds              11,806     14,393  -2,587 (-18%)
  Tests            3,279,594  3,303,158  -23,564 (-1%)


  BUILD REGRESSIONS
  -----------------
  A "regression" is defined as a reported problem affecting 0 or multiple builds.

  Origin           Regressions        Affected  Affected builds by top issues
                 (known + new)  Builds (total)         #1        #2        #3
  ───────────────────────────────────────────────────────────────────────────
  maestro     22 +   5 =    27             741        150       116        67
  ───────────────────────────────────────────────────────────────────────────
  Total       22 +   5 =    27             741


  TOP REGRESSIONS PER ORIGIN
  --------------------------
  maestro:
    #1 (150 occurrences) - Error in defconfig (/tmp/kci/linux/scripts/kconfig/Makefile:95) [lo...
      Dashboard: https://d.kernelci.org/issue/maestro:f2c3a9af64a352cb6c8e900e9cd6c2255f242f24?iv=1
    #2 (116 occurrences) - suggest parentheses around arithmetic in operand of ‘|’ [-Werror=pa...
      Dashboard: https://d.kernelci.org/issue/maestro:26a4fc4f55534d981efb86a089cc89832d270b24?iv=1
    #3 (67 occurrences) -  in vmlinux.unstripped (scripts/Makefile.vmlinux:72) [logspec:kbuil...
      Dashboard: https://d.kernelci.org/issue/maestro:b5ed9b51212f5174ccbd9d812fc43e26fcc5361e?iv=1
  

  TEST LABS ACTIVITY
  ------------------
  20 labs reported results this week (1 more than last week).

  Labs marked with an asterisk (*) are new.

  Lab                    Covered builds   Boots       Tests      Change (tests)
  ─────────────────────────────────────────────────────────────────────────────
  aspeed                             49      49           0                   0
  broonie                         1,126       0       4,454       +1,398 (+46%)
  lava-broonie                      442   1,010     162,217     -259,371 (-62%)
  lava-cip                          472   1,463           0         -99 (-100%)
  lava-clabbe                        26     183           0                   0
  lava-collabora                    740   2,966     324,234      +98,701 (+44%)
  lava-foundriesio                  146     146           0                   0
  lava-kci-qualcomm                  79     121     167,445        -9,652 (-5%)
  lava-kontron                      276     545           0                   0
  lava-pengutronix                  336     872           0                   0
  lava-renesas                       87   1,307           0                   0
  linaro_pull_labs                    0       0           0                   0
  maestro                         5,130       0   2,024,808     -347,710 (-15%)
  microsoft                          62     342      16,360       +7,172 (+78%)
  opentest-ti                        74   1,688         593         +177 (+43%)
  pull-labs-aws-ec2                  74      74          74          +29 (+64%)
  pull-labs-demo                    560     956     191,986    +131,461 (+217%)
  riscv *                             1       0       1,413              +1,413
  sasha-lab                         158     362     373,827   +352,286 (+1635%)
  syzbot                             58       0          99            +4 (+4%)
  ─────────────────────────────────────────────────────────────────────────────
  Total                           9,896  12,084   3,267,510       -24,191 (-1%)

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
