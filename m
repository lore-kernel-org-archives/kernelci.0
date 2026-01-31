Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D63C822156A
	for <kernelci@lists.linux.dev>; Sat, 31 Jan 2026 00:00:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769817610; cv=none; b=sxONZ+Vs3dGIafgKa77cjxX+H0d/ANROl2OnlvqOLqVRNx1J5HKgZe8Va0198SZ/LLR9yrNVAW6xMQ8gvwskcHUA+5wX4Dm0pQUhjx9eu7VGetsIXg6q2dyLwJ9KOohdAK6F9FHhoB2TNLo++sQ2BsZoAbI+9MP48sbfCjg5gQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769817610; c=relaxed/simple;
	bh=Y62bvWL8xoL7MEHfzLf6jaJJ7lFzD0zcoLb/JEbfqzs=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=i9i5QqNb/EfE4FiPS86vMWzZVkJwW3SqgFFh9mPjTqgyppoAiMgVyqmngADy4PGXzBwgIj66q5cWULWJBGwP9fzrhPE0Bo44bIm5OkKgApqLqAIj9h00eKYeqiPZh/6fp0NOjh4kAEl6YRcCXD0S88QLISWA3vTDM50MVzuKtKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=DIZancNh; arc=none smtp.client-ip=74.125.82.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="DIZancNh"
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-2b72e49776eso4936939eec.1
        for <kernelci@lists.linux.dev>; Fri, 30 Jan 2026 16:00:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1769817607; x=1770422407; darn=lists.linux.dev;
        h=message-id:date:cc:to:from:subject:content-transfer-encoding
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Qg/g5kDOviKQ/b+vPWv5WWyHkVYyWI2CMQPecrGFJu0=;
        b=DIZancNhG9hjrEgF6jkNer2Do4hzWvSQXuf3QvgS1Um6DW/XcUdbOK/W++2ObeB3ES
         vhSIVJMdRBILT2QQmONZVXESzRzCaAexU7Y+0bCBQL7AvMchYl+huC993AOGmgPe4YFX
         omiW0gonrML/1yf6cjSeICAKx/7xePHXMw31VXmoNmhnDLd4f89L6254n4/QIQzTz3q+
         DH2QPAtZxNZQGKAJWYHKz+2ZDPcqC31nvFnqLaCJXMn4b/xZc1MvnYhMmnTxMC+iBxGd
         sPwS4OJtaVwyTRQH6KqXAAFSIIzxNnKTIx7MwbP+ri7YpNxO/uxQrbWUq7vsmr1WNcVD
         PQMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769817607; x=1770422407;
        h=message-id:date:cc:to:from:subject:content-transfer-encoding
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qg/g5kDOviKQ/b+vPWv5WWyHkVYyWI2CMQPecrGFJu0=;
        b=coGMk18JME+2eLKyKyIXpxNdwRFQvsXebNEZugVD0mP6UGldBerPIY8eJFZXyE6xRy
         Rlp8mEKmLYobo7qbjzNA8ZkqfWDxEAR+h6Ix1F+WgP2xRiIBNOjnVvhpv+Q8JhkJx2L2
         5ZcuFrEF/Azsj2P3nTkdUzDK0cS0gAr4UfspxVq8Mh90j2o/CzMsJGhENnt1IgJYl0qk
         fhdNs7FOHLRwaWKgVMXURRZFgjwww4sdMCblFOKcTn+/RiWZvp9Hr/jz4RflpMnalwbk
         TbT5g/ByRx1x2a4eDrzGuji80qPKu1CF18usRbe/CnttiYA4KLHO8m0/Dv2/Xf8Vjmh8
         ZmsA==
X-Gm-Message-State: AOJu0YzGkssgvh4xUFZRAlmkARRFTjPzYWRrpUmhYsjRMpa41nGgDAu1
	U0m/TPbvHrutsjcfqeDSVG/7w0Nn1VsVg55MrB4WYHJv2zOOmYqOW1PulR4HJ+RD1Y5iouE5XL0
	Hz2Mtg7E=
X-Gm-Gg: AZuq6aLYAYdlUSFLM7lKdAyhKjBg3FI8xroRV2g+0ukYCU4M+N9nRPCiy1nU3PZF/bN
	0Kj7+WfC6f91h3g8eYbK/u2MTQpDPanr/3zJIOPc/re4mC9bEAqVZv8d0h/lpMfA2nHBKx4A+Xu
	58N/H2ehb6zcPzjaOgXUkAWV2woYUk6yKYupVa1jjcVR0QcawFM2U3D25tx1tO/BaPpO75FX17V
	v0+pLriGq8da6pk2H9A0LO74j92aqfsFvN6cnFC9/PFtxGEpcjOIbTF8grgpVQDQwIvJuJe+VC4
	RK8zAhFD+Cj74BGCtaLH8UikJeifmtFdx/uo2pcP9jhXVIg5qkJdxD9St08kSN5lcE2r1Q1Ty4R
	lugjYk+2o3NOrDBDTScye/EtGPaT60zvp6KKkTQnpnPv7NA8u1cWqvmhYt86/HM4gmyz7mtc5CL
	9ug2zK
X-Received: by 2002:a05:693c:3944:b0:2b7:24ad:5c56 with SMTP id 5a478bee46e88-2b7c88d9586mr2262248eec.24.1769817607031;
        Fri, 30 Jan 2026 16:00:07 -0800 (PST)
Received: from 22d5995788c3 ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b7a16d01c4sm13253011eec.2.2026.01.30.16.00.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jan 2026 16:00:06 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: KernelCI Metrics Report - 2026-01-31 00:00 UTC
From: KernelCI bot <bot@kernelci.org>
To: kernelci@lists.linux.dev
Cc: kernelci-results@groups.io
Date: Sat, 31 Jan 2026 00:00:06 -0000
Message-ID: <176981760560.4790.1247184820196738391@22d5995788c3>



KernelCI Metrics Summary
========================
Period: 2026-01-24 00:00 UTC to 2026-01-31 00:00 UTC


ACTIVITY
--------
   342 issues
  2067 incidents
  3169 checkouts
 10699 builds
573984 tests


BUILD REGRESSIONS
-----------------
Incidents are any occurrences of an issue.
New regressions are the first incident of an issue.

Origin      Total Incidents    New Regressions
──────────────────────────────────────────────
maestro     540                7
microsoft   2                  1
redhat      5                  0


LAB ACTIVITY
------------
There were 10 labs registered. Incidents reported per lab:

Origin      Lab                    Builds    Boots     Tests
────────────────────────────────────────────────────────────
maestro     k8s-all                7571      0         3438
maestro     k8s-gke-eu-west4       0         0         69691
maestro     lava-broonie           0         313       139274
maestro     lava-cip               0         413       38
maestro     lava-collabora         0         3151      288481
maestro     lava-foundriesio       0         22        0
maestro     lava-kci-qualcomm      0         95        41928
maestro     lava-kontron           0         46        0
maestro     lava-pengutronix       0         83        0
ti          opentest-ti            0         1147      0
────────────────────────────────────────────────────────────
Total                              7571      5270      542850



--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
