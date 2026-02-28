Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9851B274671
	for <kernelci@lists.linux.dev>; Sat, 28 Feb 2026 00:00:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772236812; cv=none; b=tBs9tdafRm6h8LlgUcijKLaO5I3RcAScqPoORaIZqb7I2CrIWjDE1ffIFYO8Nnre61DSm6JMy/KHoefywL4W0R2D6ZG1cl7UExklVC+uqYHNfuT//tVtD8mtQ2sYw7hWm9cTKay//D5WC7XxB7j3FX8TDk+Qe/VscF2c8Gs2suI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772236812; c=relaxed/simple;
	bh=Ds7+V6sre2LI/JNUnFKTGF/Jrzdp4FGsFoLw8s/kAWs=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=meOGX/zzvp78e1WFhJKFPNsx4dSdn7QZ775QYSoozeD9r5xXNauDA8dIZcvx+B6LSfvy9RFqm+kUgTxPrzs9zfngiSe1sRmY2lmYqquSsYe+tHIgjtIlhFGcDZ70Zd6Os8b20ImeDXnVpVcFq6/V7WvFQHsItjDVe2EnXhBc8rM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=SM+e1hSw; arc=none smtp.client-ip=74.125.82.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="SM+e1hSw"
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-2bd9a485bd6so5113400eec.1
        for <kernelci@lists.linux.dev>; Fri, 27 Feb 2026 16:00:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1772236809; x=1772841609; darn=lists.linux.dev;
        h=message-id:date:cc:to:from:subject:content-transfer-encoding
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=FkM5TUsjkM5VZt5rgsIkIulM538zPkA0tYcOkqCHuVs=;
        b=SM+e1hSwKX1TpS2evhthAJYR5OWrS2GNzdiJaHg41n48WsmQoUgpZ7hpep5BgUCfbY
         UrD+QBZ/hFvWzF5PPD5o3XviXMX+89QAxtspkO83gsXNYtbFLgKAfvA3KfH+cwKkhY3q
         tBbNL0EDAiDB7IaKl+i6NTa7cSTxrykXqQZDb8aeJtsK+HBazJ6YPI3JTOos9XYeT5LY
         FfLQ/4VnUcI/q6nf3gQY1GOUQnO95jlk6IfkD5R/wF2HmMtqlREFrz1h3LQWRZzySImS
         T9h8MctjJ2/zQdagcDKiEIqgm9HTCQ65nNvq/vmSJ+c2//Jpw4cWWBIpEzzdbEVJ23zy
         YuWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772236809; x=1772841609;
        h=message-id:date:cc:to:from:subject:content-transfer-encoding
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FkM5TUsjkM5VZt5rgsIkIulM538zPkA0tYcOkqCHuVs=;
        b=GMwFdO2UeyQ5mDaXNYNjQyTtvoKQx7N1BF7ynZju6MDtQhJMbL35yYxpNauxlVhWqf
         a0ojRCwDpeuOz1CwteZahgY9BaiZrFXmUP6FiXnuh3e0zBBoMPmxUK5jKwDH8tru3eT7
         0CwQQ+fx6q7aFzTzX7UZHLgZyjwpphgrtLT8s2SK2VPLgC6hhiWYhCRso9WBgOL5EJOU
         7m+irFne4CpiEuo9zQ7PNE2QNE8t5jx9EgkFo/5Rtux7x9tNzbqeSNlKRAKycZIhDMn3
         tos8GQHOU2fh7He6B5etaffnxUI2Hdll5DxoH1tNmJpdWzDCHIRkFsZTvzkCg1Jhcn86
         mEhg==
X-Gm-Message-State: AOJu0YwTGEkdKMhao6FjU4LZkfwQlH8dZnvG7jWkUPsflDEwo3STdU/U
	6InAPUxlpJerxhxnSgTQMoO7CCiKB3fFoa8S8KQcmn5nGUldkoMMWZOTt8ZIi3mUOZSTpaQgHQM
	P8TcT
X-Gm-Gg: ATEYQzyEfoYALN86h9QpViMbz5iswDsj1NmOuMNBF13oFrKHJRWFeca5/gU4M3V6OD6
	6NOzrTE4Qt7b7p2mv4O4eJ8kA8cxLOCbk2bxXrcEXDo/XL9huz42zplu/BQyZ6dw0RixX23sZlX
	uSNzMJg4FVHG1ERl7W+nJoOMtBhjRm+2brP2PIt6QhD5+RiPLJ77h1ikVbPQmGe8jzekiQnfEsN
	lT6fxZJQPrkaaUNETL7GM19f2nLkLx16rArq7ZjVqnyPNfG8/LB1MRE76fZeLVCa1clCckIZvVo
	mIdGJ8uj+madWHsBfl5P6ibrU9gRDmT4bPbWwtc/oYnxX43ERB5I3TF7iYKgErAgy/vIDMSREFj
	gUNfKrL5VO1HI8RnWGlAtO0GPvPWj2BmandN9F/TvDcBEQSEVhBQp/7LLv7eDBpI9SdGdsN7Bls
	AnLyEzHdPb08hGwtMF
X-Received: by 2002:a05:7300:d518:b0:2ba:7b0b:e205 with SMTP id 5a478bee46e88-2bde1c98c8amr2230157eec.20.1772236808874;
        Fri, 27 Feb 2026 16:00:08 -0800 (PST)
Received: from d14e337afe00 ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2bdd1f7ee87sm4698428eec.31.2026.02.27.16.00.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Feb 2026 16:00:08 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: KernelCI Metrics Report - 2026-02-28 00:00 UTC
From: KernelCI bot <bot@kernelci.org>
To: kernelci@lists.linux.dev
Cc: kernelci-results@groups.io
Date: Sat, 28 Feb 2026 00:00:08 -0000
Message-ID: <177223680761.3973.13035585569960338193@d14e337afe00>



KernelCI Metrics Summary
========================
Period: 2026-02-21 00:00 UTC to 2026-02-28 00:00 UTC


ACTIVITY
--------
   315 issues
  2009 incidents
  5010 checkouts
 11908 builds
775632 tests


BUILD REGRESSIONS
-----------------
Incidents are any occurrences of an issue.
New regressions are the first incident of an issue.

Origin      Total Incidents    New Regressions
──────────────────────────────────────────────
maestro     556                21
microsoft   4                  2
redhat      15                 6


LAB ACTIVITY
------------
There were 9 labs registered. Incidents reported per lab:

Origin      Lab                    Builds    Boots     Tests
────────────────────────────────────────────────────────────
maestro     lava-broonie           0         1441      310230
maestro     lava-cip               0         1158      179
maestro     lava-collabora         0         5343      317144
maestro     lava-foundriesio       0         106       0
maestro     lava-kci-qualcomm      0         123       76140
maestro     lava-kontron           0         102       0
maestro     lava-pengutronix       0         438       0
ti          opentest-ti            0         1158      5
linaro_pull_labspull-labs-demo         0         0         1804
────────────────────────────────────────────────────────────
Total                              0         9869      705502



--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
