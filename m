Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793404895;
	b=tuGK1emgmNESeuxx/vU8PEsfZEOOLTqqzdrYs1UlsjCMPp+uPMpRFGCks/oc/qymRpya
	 2aYpFqtFLjbsSThrreBOFX1zn66tC6Ns0FRPFjpEZBn5A21Du2rRebRLnv5keWMfD2EtG
	 g6TUVbi1C/1ikGmWzlTeLWq99SwPPF20Xd28seMzf2F8z6rb2fASWwiweV4MNbOCk5M/3
	 zkED0ZQeAPPQT3IcYDffh2USRbUzuwzjZGZnDqvKb7mRJwJVDa3sgaYxU75CiuS+IrEEh
	 RARI3v1Zzg6NdmQStBocmf0gZuF67GCjZ6yaC0yQp0vseDiAPR8Me87JUXIfDJWcnbA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793404895;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Content-Type:
	 MIME-Version:Content-Transfer-Encoding:Subject:From:To:Cc:Date:
	 Message-ID;
	bh=8QL6Ps4dNqo7dwCvbYgK2hjGL168tEYtNT99xNOWLKw=;
	b=JAdp/+S3saCA+ZeQu5PqQEWMNpQmVNRZIiV6794big4z0CGQMcpJHVZ1lCyFeQtTtfek
	 lBU4UdqyrZtAKfD4qkY6cHxGhbBwCuuxt0UljVD2rsQwCPE9GQjw+S755gb/dhCSnvP24
	 QRaPSIZu2Ga1MZJn1SSnwYVWzrUPfh7nlx1ZCtjZCWMF/p6laT9ZXg+/eJpRJg1SjKkSe
	 i4yXtDfPShtRRAwdQtdeqvDS+/Ywe+e5QWLWyk6RBaq9nIDeDLBbY10WbhjiQlM/rT/Dp
	 E59KvtVswHa7tjGZ9YqgNq2I3KsGENhksPKnXVCWYFiIeW7Lh+jwaZdSDvflrwZZUbg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernelci.org;
	spf=pass smtp.mailfrom=kernelci.org;
	dkim=pass header.d=kernelci.org header.i=@kernelci.org header.a=rsa-sha256 header.s=google header.b=Q4H7wDxS;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AC0E606A31A
	for <kernelci@lists.linux.dev>; Sat, 31 Oct 2026 00:01:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3AC0E606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernelci.org header.i=@kernelci.org header.a=rsa-sha256 header.s=google header.b=Q4H7wDxS
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-369f33df08eso2581057eec.0
        for <kernelci@lists.linux.dev>; Fri, 30 Oct 2026 17:01:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci.org; s=google; t=1793404893; x=1794009693; darn=lists.linux.dev;
        h=message-id:date:cc:to:from:subject:content-transfer-encoding
         :mime-version:content-type:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=8QL6Ps4dNqo7dwCvbYgK2hjGL168tEYtNT99xNOWLKw=;
        b=Q4H7wDxSTNQ76B16PH4m7/SgldFSjHYgyNMnSXYvlgBDxz9XS8W2rCw3BJJmpBNX7g
         B9fgLsQfiH1HDrCOFHbWAUYCWGPnwgNfKjMzNirist/SJrGHcf5rODqWEwMAtGZnyoPw
         dLfXdIDQeOVOuYVna7jljRgq4wsDbcpN5eqIbENMR1CM6mKYaJCHOdFERQBAOTRkBHSe
         icS/yiSNaqQXKW8kcbOgsL8lFEUFrM5YqOFFYXX+zM4LZrctigLY/oN0G77nl4ZN6cEg
         9JCdgaLcQGRvhetmkkMp0zcD1FJyYl3Fszf5TfOBR4WBWWqvgLmsqJ7Ggn3vA5HIsw9Z
         GmbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793404893; x=1794009693;
        h=message-id:date:cc:to:from:subject:content-transfer-encoding
         :mime-version:content-type:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=8QL6Ps4dNqo7dwCvbYgK2hjGL168tEYtNT99xNOWLKw=;
        b=DRa/UATe7kKgkbRawdyasSKOXArlBIYbG6thNEKtk5lHZvZInIlk6o/RC42kdriT+X
         5ut2QaaomolXyjzZzyUD3J/xwfDQmFVjd2C/XGAbFGR3ZrZksWeM2i4XTd+e66Z+1H0o
         /tFvLegwzqqdm3RrI1ZPANGcnJw53IDmAyCyJ+ygmhxCHvbM9Gt/Rf0AG8WjldjRNZFH
         UtsHacSD1nkCQU0x9x7BKWOpS7aQL07otNeEPsKKzrLzQMiTpAMdw/XQKbvCACpZbVwH
         jeHeD7xxSF0cwzOH5gdeMoq6xLSdJPB98tPUtG7WsNmFkcLZlh0DiHAQOFlz48+hnOFE
         3XfA==
X-Gm-Message-State: AFq9FYKnLViTxPsC0b6DhLqLXuSkyKgLQyeBfkjg7XVvVKcaVgyg8EEl
	py6OPcG1nKozNjZkXiRUOqnG4TgX8Tn62bRQgKDNa3VppWfEKfSYETYMuFkKGZIjUNPzeRHbpxP
	VmYlX
X-Gm-Gg: AYBFou246+E0yu9ayjxQCHK3q/UYZiMr2Te3M0/PlgybE5OpM1kr1I3e3KEz/dbGGdl
	TBRb0y3DgJsfcL245a8hJNV0hMDr0PQ7wekqmpWVUcYV4eeU+9OoC+XHjGr4n2SvRPRs+pEU7oz
	iOC3rK8f29r+TiEnkvVsgKBO2skUQIpKcndSyxhB+joZmCYIStfdxpUNqIEh5cPm+9cAZ8cJ31o
	HWvlaItm2rXM2uwYe2WM3+8Bk3VOovsrYIhZZvT/EYc+2AQVFFeCm/CU8su++CZhFOWZuK1g+8+
	7exKlQciypwEy90xPg+H3fFiZ/QT8uW/SkzxOVMciSrKT4uis36+s0DuXgzogbphMeasF/Fs8RZ
	Hd1LgEdL6rf0xmIVrSdzBjoqQHbslHND1ENGt6SgCQxtc2/vDpAB+pfEKJrz7h6Nk3zbGujP/Ne
	F7u74SkIykr8+1J1KP+GSugA9xpFsF5XgCe71LV4idyT3RoAk17OJNgsVLJEfg0O+Lmq7zy7pmi
	bsWUnfBAJLJrkRMCnz920jnId10GHkdi6+q1UsAhe7/UeZcWNRBeZakLMLCjTPl52yvucary5wm
	gsS4mV+skK2qER4zhXEyNA==
X-Received: by 2002:a05:7301:b10:b0:368:a825:bf7f with SMTP id 5a478bee46e88-36a42368932mr5002237eec.13.1793404892800;
        Fri, 30 Oct 2026 17:01:32 -0700 (PDT)
Received: from 34406640b1f4 ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42a5fb97sm12175091eec.23.2026.10.30.17.01.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 17:01:32 -0700 (PDT)
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
Subject: KernelCI Metrics Report - 2026-10-31 00:00 UTC
From: KernelCI bot <bot@kernelci.org>
To: kernelci@lists.linux.dev
Cc: kernelci-results@groups.io
Date: Sat, 31 Oct 2026 00:01:31 -0000
Message-ID: <179340489134.65000.885510787901465629@34406640b1f4>

KernelCI Metrics Summary
========================
Period: 2026-10-24 00:00 UTC to 2026-10-30 23:59 UTC


  COVERAGE
  --------
                   This week  Last week           Change
                   ─────────  ─────────  ───────────────
  Trees monitored         21         29               -8
  Checkouts            1,869      1,503      +366 (+24%)
  Builds              12,635     13,470       -835 (-6%)
  Tests            3,056,633  3,652,159  -595,526 (-16%)


  BUILD REGRESSIONS
  -----------------
  A "regression" is defined as a reported problem affecting 0 or multiple builds.

  Origin           Regressions        Affected  Affected builds by top issues
                 (known + new)  Builds (total)         #1        #2        #3
  ───────────────────────────────────────────────────────────────────────────
  maestro     17 +  20 =    37             646        148        65        58
  microsoft    0 +   1 =     1               2          2
  ───────────────────────────────────────────────────────────────────────────
  Total       17 +  21 =    38             648


  TOP REGRESSIONS PER ORIGIN
  --------------------------
  maestro:
    #1 (148 occurrences) - suggest parentheses around arithmetic in operand of ‘|’ [-Werror=pa...
      Dashboard: https://d.kernelci.org/issue/maestro:0ac4ca056d408ff08354d1eb5412f842ecb10c06?iv=1
    #2 (65 occurrences) -  shift count is negative [-Werror,-Wshift-count-negative] in driver...
      Dashboard: https://d.kernelci.org/issue/maestro:ce5ec46ecf72462fff1bede413010b22a34a9494?iv=1
    #3 (58 occurrences) -  'HMAC_Update' is deprecated [-Wdeprecated-declarations] in crypto/...
      Dashboard: https://d.kernelci.org/issue/maestro:cfb7db7bad026f784ab5093df91515e27c634b34?iv=1
  
  microsoft:
    #1 (2 occurrences) -  in expansion of macro ‘guard’

 in kernel/pid_namespace.o (kernel/...
      Dashboard: https://d.kernelci.org/issue/microsoft:a809b5da947dd631b012d49eed40f6a9314ced31?iv=1
  

  TEST LABS ACTIVITY
  ------------------
  19 labs reported results this week (unchanged from last week).

  Labs marked with an asterisk (*) are new.

  Lab                    Covered builds   Boots       Tests    Change (tests)
  ───────────────────────────────────────────────────────────────────────────
  aspeed                             57      57           0                 0
  broonie                           517       0       2,339        +116 (+5%)
  lava-broonie                      302     571     186,844   -295,303 (-61%)
  lava-cip                          455   1,468         157      +112 (+249%)
  lava-clabbe                        32     213           0                 0
  lava-collabora                    855   3,291     372,595      -6,341 (-2%)
  lava-foundriesio                  113     113           0                 0
  lava-kci-qualcomm                  11      56      64,838    -79,152 (-55%)
  lava-kontron                      204     304           0                 0
  lava-pengutronix                  267     657           0                 0
  lava-renesas                       98   1,532           0                 0
  linaro_pull_labs                    0       0           0                 0
  maestro                         6,042       0   1,728,775   -193,427 (-10%)
  microsoft                          82     446      19,266     +1,819 (+10%)
  opentest-ti                        91   2,649       1,318       +557 (+73%)
  pull-labs-aws-ec2                  91      91          89         +9 (+11%)
  pull-labs-demo                    759   1,982     267,747    -46,758 (-15%)
  sasha-lab                         124     588     398,551     +23,807 (+6%)
  syzbot                             63       0          96          -9 (-9%)
  ───────────────────────────────────────────────────────────────────────────
  Total                          10,163  14,018   3,042,615   -594,570 (-16%)

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
