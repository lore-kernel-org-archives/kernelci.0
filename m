Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B784C23182D
	for <kernelci@lists.linux.dev>; Sat, 24 Jan 2026 00:00:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769212810; cv=none; b=ipTTWGv7tIj2ylseN6mO2vHz45/o3NGnRfbaKlJSQ6XA/OUlFXYJbDyjHtemub8pHPddExHf2e4qi2uvGv/y1GGLjHPTP+vRq5aZZU122MjGfzHCqOSAqXZz4PXoLn8gsMt7nuujkxCumVdKQh0h9M+E2At2Q2QUsTturpcEZKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769212810; c=relaxed/simple;
	bh=WCI1aVxsi2krqmf9uQohbvZdbkkGcMMmzATKTXP2kIo=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=u3Bw7GOEr50gTjIeiNAiyc+rVsVBgvB8uz5u0U4phHJo3EhSwnlAPsxLvZGnV0vByG2S0MR9D2HMze1XVjszvlxC/N1Y7mhbn25X7b/LZbTJvkZmc2k9vv5GxX+Fp5Di8uu+cpOHQGHYTw8X8E7DFyETLbXjZpIquP+opHVBjEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=OQ2rnVpK; arc=none smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="OQ2rnVpK"
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-2b1981ca515so3186593eec.1
        for <kernelci@lists.linux.dev>; Fri, 23 Jan 2026 16:00:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1769212807; x=1769817607; darn=lists.linux.dev;
        h=message-id:date:cc:to:from:subject:content-transfer-encoding
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4zCvHdP1Sg3IgfgHbJ8nuMRNbUcWbgD13tXlVIPxZJ0=;
        b=OQ2rnVpKheFy0MQuKhqUMTRMv6YNy3Rxm1l39HpBnQ0PbuI2IPhgkcl5marr/UF6Jq
         qfjXv70TVxWwCSEIRASWJRj2hYcxJfHNcg98HV6oI8COodVkShtW0ZF/q0dKC0JIVveo
         MvWxdiLMJDm2ayXaX7UKkYdWtLLHEr17nGI0rv1Kjq6JlLZ1u+ey+4P8uFJLPiCNqmdf
         jCkrnQGezRb7nE1rgRJ0wwSLXW8oKIi8uBha50ucRIgZphFgyvEUSDNa2BNkFbiXYi3W
         o9U/v5s1zkDpyMyTuj8u5x+B/B85Bg6O8z7MiViPRv6KEdJ2anJSD90K/MuDN+lFgV9s
         NtCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769212807; x=1769817607;
        h=message-id:date:cc:to:from:subject:content-transfer-encoding
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4zCvHdP1Sg3IgfgHbJ8nuMRNbUcWbgD13tXlVIPxZJ0=;
        b=luKTPe93ZiAVXNr3v9GnwBriw505IfcEubEW7iRuS9Hv87DdH9gHSwwOSVRkFka864
         bWfnpXeBP8/ka/ctsq4L4bTuxisLnGS3n0VnbHHG27B1tHkMQK4AOswcd1tDUjxJ+cnQ
         61FmpGanFk4Oc8+TtkmJPT43FcKuX/7VTUX7iNDyaajongIgMJagUH0e2JhPUXuwuBou
         8MZ9bFVxWAlBA8MTkDANSoKGD71koBzhPTNbhqfYk2j52W8HATFwJJ5UYWeyKH8FKGUd
         pwSR42OigzJpUY/GunRmIt1H4HWLORERermYP7lni78QMflZR4Z3UguaQs1L+Q2ox9H2
         36/w==
X-Gm-Message-State: AOJu0YyONVPpNigu3Yk0hE80bGm9SRKTSiO4/JKFmGpjj2QfLFuO9MWn
	3uuwaApjC/6Np8FkZ79rflYSvGdpQvZV7vi1468SUGNZdcZLBKd84fgueBvDtFe4Z9XH7i+ZE2Y
	eJa6t
X-Gm-Gg: AZuq6aKgWc8mcMrchYwzdeDIn5YE1YScxpeIMkdXRtKM2F7FipL0i6LZZwkMznUuKGU
	WqQwdj3+mX5W5OU4bevAmxiCSN74DIfjkLaO/17e3gRVYlVZQZJgEJFhVBC0v/tVNFGKiV7UMza
	uvKG9uNl3Gxr0sWAEszuXNAs2JhLrzIvLI9+QcpTsyqXfR/ySbPiVr/c/LZm+om7GsHJqt9v8M6
	mfswhAS7KHMJtIbBYETBnlJI7VOzWNXmZYa9G6utmTAi/RDVt1AUxL80ATEXWh+Ydj16OxyC2Co
	rF6ptMRWxcAbAf/cn5orIwSCSb0MLfGPasXx4QwHMPGJ2iKy4O4xQ9arBsCZvkZ+nn6Yos08jCi
	G7tvT2AwPTcn1flBreZWTY2vclVAtzLUTx50D4g86RTg8Zgj3RvjNqxGUgh1tv0UBA/qtR2UJiM
	r7BXcD
X-Received: by 2002:a05:7301:4188:b0:2b0:6a03:b597 with SMTP id 5a478bee46e88-2b73995aa1amr2223350eec.8.1769212807224;
        Fri, 23 Jan 2026 16:00:07 -0800 (PST)
Received: from 22d5995788c3 ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b73a9e1bc8sm4876536eec.22.2026.01.23.16.00.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jan 2026 16:00:06 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: KernelCI Metrics Report - 2026-01-24 00:00 UTC
From: KernelCI bot <bot@kernelci.org>
To: kernelci@lists.linux.dev
Cc: kernelci-results@groups.io
Date: Sat, 24 Jan 2026 00:00:06 -0000
Message-ID: <176921280598.1565.15936636002336699606@22d5995788c3>



KernelCI Metrics Summary
========================
Period: 2026-01-17 00:00 UTC to 2026-01-24 00:00 UTC


ACTIVITY
--------
   387 issues
  1929 incidents
  2517 checkouts
  9485 builds
683149 tests


BUILD REGRESSIONS
-----------------
Incidents are any occurrences of an issue.
New regressions are the first incident of an issue.

Origin      Total Incidents    New Regressions
──────────────────────────────────────────────
maestro     700                17
redhat      3                  0


LAB ACTIVITY
------------
There were 11 labs registered. Incidents reported per lab:

Origin      Lab                    Builds    Boots     Tests
────────────────────────────────────────────────────────────
maestro     k8s-all                7018      0         5288
maestro     k8s-gke-eu-west4       0         0         82725
maestro     lava-broonie           0         1379      185780
maestro     lava-cip               0         1152      231
maestro     lava-collabora         0         5683      354670
maestro     lava-foundriesio       0         159       0
maestro     lava-kci-qualcomm      0         45        19071
maestro     lava-kontron           0         253       0
maestro     lava-pengutronix       0         538       0
ti          opentest-ti            0         964       0
maestro     shell                  0         0         9
────────────────────────────────────────────────────────────
Total                              7018      10173     647774



--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
