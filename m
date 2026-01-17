Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0750500943
	for <kernelci@lists.linux.dev>; Sat, 17 Jan 2026 00:00:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768608010; cv=none; b=SUJcfxl+2ixF6dFh+IgxBwG1PjiCenfJD/SAKjR0z5qliLIsXw9QxYzKKl5LWSvDA/5uU2QYguUy1UJe7hdZaKc4JLjsi77uucjxE5NWBYdOwiU4EGb8pwAKv6oFohAQdAxr5VUdduuEyfZySWxbsLezNkdEdkjvCvu1LQr48rc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768608010; c=relaxed/simple;
	bh=Y+mfweUnj6edkcQA3ZBAwM3BqzzVMVl7qSnkaEqHJjs=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=jofmBXlbyATD36ZMThGFt82nGHalNtD3ql+kLhUZMcIuDnmqYkDQUSY2WurBlbVekM65qlXY54T6AhncYjg2VaHld1erq4QLPsREsKqrt7Ukpiq8cLF4g+qsj0rh4AmkLJCnNSFXOMCXFQNLNS673eFDOJ81BXwEbSRcrR6r9mo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=a7Wkrk2d; arc=none smtp.client-ip=74.125.82.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="a7Wkrk2d"
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-2b6bb644e8eso2282928eec.1
        for <kernelci@lists.linux.dev>; Fri, 16 Jan 2026 16:00:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1768608007; x=1769212807; darn=lists.linux.dev;
        h=message-id:date:cc:to:from:subject:content-transfer-encoding
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=HfffY6VPdEdLVPxN1O8SwE1JH3PRpXk9Cn43VLbfHy4=;
        b=a7Wkrk2d8SKEHCIVa391CKDjZn29/ti9fjVuTe/mJQOtZ+RcI+xxyF/39LoLi6+37y
         t301hI4yAv/vL9wqsWNLtzxNyXvZ4lIZ1A47kVRZTMSgvNp5fTG8TXghUrvaG2r8bGAP
         1oZoG/dUDOyO5sqcS0NuLbJ+Io/FIrFf2N+xDaiNGR6Nv4OsJGpmeuqnUzk+26nXfaeV
         UeYqu7fmSeAf4jrQ+gLUMwdjQhAJ+v07fjtnUiIJaQKAUn28HcgGEpedZ1Uy4GQ6+/8l
         8vIpyjA29yLZhAKaBnQW9w0swx0I0WvlrSN8WvFBPY1zK2tV9qPCjf3gIVhSLJ0WakSe
         wrrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768608007; x=1769212807;
        h=message-id:date:cc:to:from:subject:content-transfer-encoding
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HfffY6VPdEdLVPxN1O8SwE1JH3PRpXk9Cn43VLbfHy4=;
        b=nzlsF5XN0vbOqy+2yWGY+5SlP1NaC5Zx5vzmd9xmj/lakvHSBUJB8e0yiUcpJipcuy
         glgRt19XGW9V+WvZKEZb+Boa9Zp2++X0u47Bz+jE5mNMp8oxii5R0R7B3g1pDxBD8cen
         PisJd4+ybybaaKI/6SVhk0xeEeRC3jmMI4VtPAcaQP6N+gA/qVRjJkottSL0jGkBuhLu
         7nUa9YbJVLttvm77G2MgjllD4L/C3A73pNyLZ69mgY2sbgeTlLStqacMxwqbdgWb4ZNR
         VeTgYcAcJyC3kidQEu/x96u53lTxq5orftg6k6cEnwdM90UMq8XyX8b8BBRTihjbtpKX
         sJLw==
X-Gm-Message-State: AOJu0YwMMBLu57cTAhUmRHzpobCY/gETk2nBx/mUEKiuR3zC7PNroCtx
	UPYkkUX9Shyo//cSpq3SrlklbpKqd9aMoftQ4JW03Z9zdWTYMuEhq3/u6uhs94HIKlPbO9DVJRP
	ynaZ7
X-Gm-Gg: AY/fxX6U8lziEA7jYvCCagTMQxfaWmFZCEKj5JCNUXQNrEKKyKWgIwEwn68ZME2iqy4
	MoO+mQQioNib76FpJX3NgL/0lahP+xeM1dFpx/MmcK9zYGq5AS6jCR5NQnYNpR544kfLgdiC8IG
	0MTlVXrjKJsOMHWPuNy8e+vnx4NPnVNbyJMzfsI1eKxjIeIiNBUYGLA0f1JZu5uLBKGzVspXxGG
	WCZGxG14U2G3h5InIuyLu2Su/UPAKL+0PVDhfLUNmgVOXLwNgeGG/rRuvvo6fPeJ6LDPezZCzxU
	AAJp2OdrWYrhFmTNyoCTHPXLhiNXshYIdrd5S42sBOTbd5m7/aE8umIVByv395oXuPx9E+DQh70
	9I9baF+WKO3Q2uGRFrmh5V2KTfa/uwyNKNEzvJvDyjxzGa248HBzb+XSJQ/OMda4eSpkTzI5Et9
	a5F4SLbyYykzc/ncU=
X-Received: by 2002:a05:7300:6ca1:b0:2b0:5079:d3c8 with SMTP id 5a478bee46e88-2b6b3f139f5mr3073763eec.4.1768608007291;
        Fri, 16 Jan 2026 16:00:07 -0800 (PST)
Received: from 1c5061884604 ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b6b3502c91sm3908043eec.9.2026.01.16.16.00.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jan 2026 16:00:06 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: KernelCI Metrics Report - 2026-01-17 00:00 UTC
From: KernelCI bot <bot@kernelci.org>
To: kernelci@lists.linux.dev
Cc: kernelci-results@groups.io
Date: Sat, 17 Jan 2026 00:00:06 -0000
Message-ID: <176860800588.4398.11475966674067794086@1c5061884604>



KernelCI Metrics Summary
========================
Period: 2026-01-10 00:00 UTC to 2026-01-17 00:00 UTC


ACTIVITY
--------
   343 issues
  2961 incidents
  3815 checkouts
 14261 builds
1084577 tests


BUILD REGRESSIONS
-----------------
Incidents are any occurrences of an issue.
New regressions are the first incident of an issue.

Origin      Total Incidents    New Regressions
──────────────────────────────────────────────
maestro     976                15
redhat      7                  0


LAB ACTIVITY
------------
There were 11 labs registered. Incidents reported per lab:

Origin      Lab                    Builds    Boots     Tests
────────────────────────────────────────────────────────────
maestro     k8s-all                10488     0         4156
maestro     k8s-gke-eu-west4       0         0         116803
maestro     lava-broonie           0         2541      357841
maestro     lava-cip               0         1743      200
maestro     lava-collabora         0         8361      438709
maestro     lava-foundriesio       0         241       0
maestro     lava-kci-qualcomm      0         3         3561
maestro     lava-kontron           0         541       0
maestro     lava-pengutronix       0         781       0
ti          opentest-ti            0         568       0
maestro     shell                  0         0         12
────────────────────────────────────────────────────────────
Total                              10488     14779     921282



--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
