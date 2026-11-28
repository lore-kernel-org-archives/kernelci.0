Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795824136;
	b=3SrYH4QvuJRZAictqXCgFya/ElrRXt3LEdsjjS2pmHP+mRiqKwhDH8dsuNxq9j9DV6G5
	 Ixg0wFjT43/wUHhzp/C/dRLN3LpHZRxpGrEZURU8o1p9W6U5xba0LSib5F6tSpse/Im3Y
	 4n/vstxdS0JE/MtJApvtqMM/8fl9kvyQOVeNlAR2M+m2YyEGySKAP4Gog2IEMIX5q3PL6
	 AUbsf5UOS6TDcwY7wwxOV9JIkgFu52ldNyq3QY8xWGNGR6ZXsrMMsDBxbYn8fKDDAPO/4
	 noWNMBZW0izB64694KcMf3wiAihVpxp1Mu3HoaDCxqX8rGtCLSkg8wW7b5xvnhpQnUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795824136;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Content-Type:
	 MIME-Version:Content-Transfer-Encoding:Subject:From:To:Cc:Date:
	 Message-ID;
	bh=ZzTvxE+8i+M5QiItH3rJ97BCt7byB/jLqdniwHr0yi4=;
	b=PI85yK2LzKtI2s7ZWcXli7bQHrxpdUcmSLZ89OCm6Y6zxAP8O0l8KClRv+mKxIwzSha+
	 lpZ75OmXT5Ac/X6OPSV32j6t3FDttYjuy2DQeAZJ84abfMtUEpxi719zaHgXLWa7ocnxt
	 IaankBlXhxQ3FjThwsxNo+RA2rUv7JP2vJ02MykK8KbEriI7ctQy5qUn8NkR177GW7RPS
	 1rONIl8xFpt7Qr33yy4epeisRDAFdNaoJ60/ybOJOhzNbb9lk0ckCgAomD9tj/1VQEvt3
	 yYngPr3hOUFfxdrac+JTcU2SeOdjE0+QjlzhnrjzlNi1G7Xs39R8jDyQ9rqlH+WQ44A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernelci.org;
	spf=pass smtp.mailfrom=kernelci.org;
	dkim=pass header.d=kernelci.org header.i=@kernelci.org header.a=rsa-sha256 header.s=google header.b=OB+ax23d;
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1321606A31C
	for <kernelci@lists.linux.dev>; Sat, 28 Nov 2026 00:02:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C1321606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernelci.org header.i=@kernelci.org header.a=rsa-sha256 header.s=google header.b=OB+ax23d
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-38692f62b22so11874515eec.0
        for <kernelci@lists.linux.dev>; Fri, 27 Nov 2026 16:02:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci.org; s=google; t=1795824135; x=1796428935; darn=lists.linux.dev;
        h=message-id:date:cc:to:from:subject:content-transfer-encoding
         :mime-version:content-type:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ZzTvxE+8i+M5QiItH3rJ97BCt7byB/jLqdniwHr0yi4=;
        b=OB+ax23dDjvEpJkw5B3JXu9vTZcnq9W5+6Ir46e1ZZWE8VTqHkoEyqdld4Zn6SzvBs
         Wh0u8ZMTV/KXgHgAYg/6R3JPdjgFb7quo7IWk7kxFb51izR4NsEw6dnFVG7fTtbo2g5A
         gwcRwK+MFnbRCaTUAVpFnEm756l6sweUBAnntOvgo+Tr/24/+BEgDqc6AH6qxY6ze/ge
         TfWZDnkUvPJ5sBEXSznc83O9HEWUAfPf6PFm6sG8OJbNqYOCFfAi9Zd1fUIpEWvhXHa+
         5Ld07cKtLIyyDEoiC40F0b2EQlEejcNRrDCnlwtIAwwkqmn/br76kV9oqWeeIKC0cvdP
         Mo4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795824135; x=1796428935;
        h=message-id:date:cc:to:from:subject:content-transfer-encoding
         :mime-version:content-type:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ZzTvxE+8i+M5QiItH3rJ97BCt7byB/jLqdniwHr0yi4=;
        b=0WkdmBnhCfRiprX0DFzJvd7lnXiAU4nwQiTN8qrWDykipe8W5DWdMWn30xXIQZlWJj
         PonX6StY+KGkTA9t+7ZvAsJ6YMYHj1QpJHO0dgcxPkEipsMrxy7DbYgYL3EuiDPMtOQ6
         UDXuYZLkuKvrhUT+Hqpp6146BbW2y8FlsMjIpnEW7m9W9tOaK4DXiPVXdlYcLQSLjPCg
         kvj2lY4cT886XXXY+uIxGr/AO/0Eo5ddd831QFQncA9bsfuofQ/gm/1aCbEMIx1gjKKL
         D3ulHvatvtw+LZz8G4na9mbPGTjpQG2lcM98frqqND1utrAD2bxd636jUK3Phigr5dHQ
         vgFg==
X-Gm-Message-State: APuU4Z+byeDett11PTzu9xP89vJo3R0pPoHYpuAsjw0ftT6mqkQTG+fL
	C5Ss8cBEOy7PdNAWgh1Q2/p9FBD7A+6nJEamTTUeLui9jNKs4I+5jsz5hqxYbu3Y2xBIRgXrkjG
	SsMYR
X-Gm-Gg: AZFdTZeIOdeaGEgNMlh2gXXLmh2Wto3ZnmPgafLoEtnh+EFt8SaDaUKeBpT1YdauVXR
	2fudAQlKxsa3vZGeMUha8WesB6Wmyg5tvqbeLuvB3sEZxnwLSdp9wcLeHd8jOMeSpcps9ARz0/U
	6OqOvWnLpWMm8j8q+rj2cr0Md4KtJfCzMJF3gjPqdcQTBZCtKyUiDDqxBoYlpNq+d0AQMWbQswr
	DrzqeORh5DkqQbwACbkoEP63mqfwcYLVyyLHvEho66RiZRVeyVU77pg6ZzPr78EQVBM2LU7nsou
	5y+XkxWRBoUwr6htLXEwGkFqx0wl+Q6iy+7IX7UuWHRDAwcz4lT+A5B/EXPe8EGmNrMFekE6F8F
	p/BwZXhmOh1f+4HwNZU20Xv9KUdZZBVa5mf9E7CSYu7SwooyJnv+gQLj8dgkN/KjJXc6MxKZRGE
	z0muqX1C5wvn9jGuIdjF3kYWD2uF6L7cZ1DQpnlX/4/D4WdbgIOYg1drGkthyZhbRFUannYx+3I
	SSrzMbQIg80Ve7VWCvWU2cECqvuxoCnw25IQSts4lxQXQrVSISL/7YhEbpUlu5qlouLI23d5WV1
	2JmktgTS4dzlhPSbUia/moQ=
X-Received: by 2002:a05:7301:f02:b0:384:ce59:5e21 with SMTP id 5a478bee46e88-3856f6503d8mr24936509eec.32.1795824134699;
        Fri, 27 Nov 2026 16:02:14 -0800 (PST)
Received: from 52d83ede7c60 ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567ea2cc5sm69622405eec.29.2026.11.27.16.02.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 16:02:13 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Post: <mailto:kernelci@lists.linux.dev>
List-Help: <mailto:kernelci+help@lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
List-Owner: <mailto:kernelci+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: KernelCI Metrics Report - 2026-11-28 00:00 UTC
From: KernelCI bot <bot@kernelci.org>
To: kernelci@lists.linux.dev
Cc: kernelci-results@groups.io
Date: Sat, 28 Nov 2026 00:02:13 -0000
Message-ID: <179582413328.230278.7476697746233964586@52d83ede7c60>

KernelCI Metrics Summary
========================
Period: 2026-11-21 00:00 UTC to 2026-11-27 23:59 UTC

  Trees monitored, Checkouts, Builds, and Tests are project-wide.

  COVERAGE
  --------
                   This week  Last week          Change
                   ─────────  ─────────  ──────────────
  Trees monitored         33         34              -1
  Checkouts            5,832      5,820        +12 (0%)
  Builds              16,884     15,959      +925 (+6%)
  Tests            4,218,258  4,460,434  -242,176 (-5%)


  BUILD REGRESSIONS
  -----------------
  A "regression" is defined as a reported problem affecting 0 or multiple builds.

  Origin           Regressions        Affected  Affected builds by top issues
                 (known + new)  Builds (total)         #1        #2        #3
  ───────────────────────────────────────────────────────────────────────────
  maestro     16 +  31 =    47             675         82        72        68
  microsoft    1 +   0 =     1               8          8
  ───────────────────────────────────────────────────────────────────────────
  Total       17 +  31 =    48             683


  TOP REGRESSIONS PER ORIGIN
  --------------------------
  maestro:
    #1 (82 occurrences) - in expansion of macro ‘EXPORT_TRACEPOINT_SYMBOL_GPL’ in kernel/trac...
      Dashboard: https://d.kernelci.org/issue/maestro:2611a38632fab248333ad61cbc967845957aed62?iv=1
    #2 (72 occurrences) - implicit declaration of function ‘init_flush_fput’ [-Wimplicit-func...
      Dashboard: https://d.kernelci.org/issue/maestro:2ec7f95b047127b9345e8aa6c45946115752003e?iv=1
    #3 (68 occurrences) - shift count is negative [-Werror,-Wshift-count-negative] in drivers...
      Dashboard: https://d.kernelci.org/issue/maestro:387e4029f9bd25161adf07834959ca20e200368d?iv=1
  
  microsoft:
    #1 (8 occurrences) -  implicit declaration of function ‘tick_sched_flag_test’; did you m...
      Dashboard: https://d.kernelci.org/issue/microsoft:928bff4a824ee167fd93e5df4e95803634cf3eb5?iv=1
  

  TEST LABS ACTIVITY
  ------------------
  19 labs reported results this week (unchanged from last week).

  Labs marked with an asterisk (*) are new.

  Lab                    Covered builds   Boots       Tests     Change (tests)
  ────────────────────────────────────────────────────────────────────────────
  aspeed                             36      36           0                  0
  broonie                         1,385       0       5,506         +138 (+3%)
  lava-broonie                      614   1,211     227,641      +18,573 (+9%)
  lava-cip                          698   2,022         135        -206 (-60%)
  lava-clabbe                        28      28           0                  0
  lava-collabora                  1,081   4,620     354,565        +1,739 (0%)
  lava-foundriesio                  198     198           0                  0
  lava-kci-qualcomm                 152     370     340,111      -28,445 (-8%)
  lava-kontron                      168     168           0                  0
  lava-pengutronix                  436   1,149           0                  0
  lava-renesas                       94   1,613           0                  0
  linaro_pull_labs                    0       0           0                  0
  maestro                         6,700       0   2,842,285      -81,713 (-3%)
  microsoft                          64     352      17,099      -2,356 (-12%)
  opentest-ti                        99   2,596         980        +115 (+13%)
  pull-labs-aws-ec2                  81      81          81         -11 (-12%)
  pull-labs-demo                  1,300   2,365     381,175     -45,714 (-11%)
  riscv *                            32      34      31,744            +31,744
  syzbot                             65       0          93           -1 (-1%)
  sasha-lab                           0       0           0   -136,334 (-100%)
  ────────────────────────────────────────────────────────────────────────────
  Total                          13,231  16,843   4,201,415     -242,471 (-5%)

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
