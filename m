Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ACC61B78F3
	for <kernelci@lists.linux.dev>; Sat,  1 Aug 2026 00:00:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785542456; cv=none; b=IBBnUeaEXTg541Orp0kZNWpvd9dI0Faw4VmU1UjBJNBKQZtIvnGFO2Zo1m9kFbjGW3fkL/1NhrDIPlnGn1yUH5ufQ+N7q+KFh5jiSp8lkpVJqwE6FlIL9DpUdutjJYK3CMiBZ+qrvKA6xKr3RtrZcWhqOt8EWf/V9Qg6jkiQS6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785542456; c=relaxed/simple;
	bh=XE8OKw4WLlQ0n4qoQ6mQpOWJwqzA0ItDBzYLWDUhGm4=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=PYxQ+RTkjrFJRsZQS3WDUPfr0TXOsWn50Zx/8zdhVkAUdlpJST1AnV/rKd+RyZUjLOlJvt+HCPiAGjKIjSgKfo7+aR9kz5D3Jgv0kD73NSS9YczEpdR0BAalR458prR4t6vp99cmXzQRuppSVokyb4uyfXk53pEWudO0qAGGaFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org; spf=pass smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b=I0yCw6JE; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b="I0yCw6JE"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-8484f229529so1408274b3a.2
        for <kernelci@lists.linux.dev>; Fri, 31 Jul 2026 17:00:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci.org; s=google; t=1785542454; x=1786147254; darn=lists.linux.dev;
        h=message-id:date:cc:to:from:subject:content-transfer-encoding
         :mime-version:content-type:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=kNi+GctfmUAgHd2vaqs/2TQkEeWpy7vKERyJIath7hg=;
        b=I0yCw6JEcYjj0eI2IfQvd5bgRUpzNjPPAG/w09YmBrjS7XVCn6WvgygkqETY4MMoob
         JwoAFJEBPdEr7fDwZn16TmFPPYiZmS+m0I3acfRdJrk8gP1HOC/v3SPH+KJeP3Qh6KV+
         Yr7Bkl8NTZ88jJIjI2KYNAVqMRGQw/xMQGsFJoUBQhvt4yM7DnBitTFL0pxAyEqyT0bU
         4083xVedQhDrTPkFV27XsiU5aE0Zjso8yo3LQtXV847vAxlJsXQEJ/xNch+p+TX9JYFG
         QeizdfirzH7m43MPuyxg9jSMPKJRDCbHw2K6Dnokl3b95o9Wvdgn0X69n5cXhNirStU+
         FlCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785542454; x=1786147254;
        h=message-id:date:cc:to:from:subject:content-transfer-encoding
         :mime-version:content-type:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=kNi+GctfmUAgHd2vaqs/2TQkEeWpy7vKERyJIath7hg=;
        b=gR21ucv63wm04KqnSfeAA13Y5n7WJiyVJecLQmN6+NVDDSBVDoTRrX9cIxJxs4dv15
         8nr8ODAK9umstGotLd5IcPHaFXw1itsP/c7RTQvqDng08Y71FQgU7MG4QgEDk1Dbj0yy
         bvBsNlHMSrpo0XHc6nVAcFmuNT+qKheaf25mNX42Dq8UhSW+VnXWm39z74z6YcdZmLtY
         x9Adglvc1s8FbsBcJdCcMBnIzomWjtq70Oqsfu30Kt+aEc3COFaMtlqLy+nfmt+kvIdQ
         cukin+0zj/gju2C95YgCiSSHtTCGyfASE71TfHemZTVxiT9lMxy40+yVCAwOPUYzI+pK
         RAYg==
X-Gm-Message-State: AOJu0YyggQw5bnITjfXXUhqBf+Jm75lAcYEjm5zFSaasIVLeckFks2b1
	n+c6ZCkmXixeQpX5w6ctvY2dK9AE32MlkNR+DVI1AdzNc3NEm8UDvtgeYRH/WdT3NtD38eea+C+
	ZpJSm
X-Gm-Gg: AR+sD12kDaK1tFQuDlsMbJD3jryue0KRBu839eZO2GK1LKt33drrmTJvunc1ykuuxbg
	F9q+evjpp1/uM/p1eSSjrLHJDnILdQy/ZYyPyZfN835dnTpd7dem5/PKhwZdrOLbdkfVV0hyVRr
	7o3qPJv29C10T23a48kM44y12rR6NSgHKJXA0VrK4xyP/60VPPJEl9+lQbZFebb9yD74iKxUoPT
	++yMEfBXtuPtvpFVCJJzPaXSZs4HozrBsIe8ASXt3M+JZOTXme+Z0VmjGA7T7e8KocLRQA5y6U8
	bXiUCnj8471QYQt9KqgUUEpI7BZmhs4upRtYjn9DXKfonF9wIlQeUNa5X+6hDTsJoZusqOSzvp1
	QwbayDX8hOdlEHkF98oThMCuFghhMN13/s4gtYEsHXzXnNZL1AG1B5117Xf4QQCGg60CvPmDrzv
	mNi5dLnguchaijSHnpabxv1WBeYw1ZpIZK2vPHK4FKqKNAurrCeScXdqAGQ2ZDGJuh
X-Received: by 2002:a05:6a20:7348:b0:3bf:6ac8:8d29 with SMTP id adf61e73a8af0-3c92a73a59fmr1576490637.21.1785542453687;
        Fri, 31 Jul 2026 17:00:53 -0700 (PDT)
Received: from 92650adf53de ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153e04506csm10599452eec.17.2026.07.31.17.00.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 17:00:52 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: KernelCI Metrics Report - 2026-08-01 00:00 UTC
From: KernelCI bot <bot@kernelci.org>
To: kernelci@lists.linux.dev
Cc: kernelci-results@groups.io
Date: Sat, 01 Aug 2026 00:00:52 -0000
Message-ID: <178554245201.4687.11581401080960077425@92650adf53de>

KernelCI Metrics Summary
========================
Period: 2026-07-25 00:00 UTC to 2026-07-31 23:59 UTC


  COVERAGE
  --------
                   This week  Last week           Change
                   ─────────  ─────────  ───────────────
  Trees monitored         41         36               +5
  Checkouts           74,705     73,559     +1,146 (+2%)
  Builds              11,625     14,893    -3,268 (-22%)
  Tests            3,007,201  3,473,366  -466,165 (-13%)


  BUILD REGRESSIONS
  -----------------
  A "regression" is defined as a reported problem affecting 0 or multiple builds.

  Origin           Regressions        Affected  Affected builds by top issues
                 (known + new)  Builds (total)         #1        #2        #3
  ───────────────────────────────────────────────────────────────────────────
  maestro     12 +   7 =    19             394         97        76        55
  redhat       2 +   0 =     2               5          3         2
  ───────────────────────────────────────────────────────────────────────────
  Total       14 +   7 =    21             399


  TOP REGRESSIONS PER ORIGIN
  --------------------------
  maestro:
    #1 (97 occurrences) -  ‘key_pass’ undeclared (first use in this function) in certs/extrac...
      Dashboard: https://d.kernelci.org/issue/maestro:1bc31bdc5afab00de98efd0c67ef8653e5385a69?iv=1
    #2 (76 occurrences) -  use of undeclared identifier 'key_pass' in certs/extract-cert (cer...
      Dashboard: https://d.kernelci.org/issue/maestro:ba4b3f33d6a10cd9f6dd26c6f8c27fab62ca127a?iv=1
    #3 (55 occurrences) -  ‘key_pass’ undeclared (first use in this function) in certs/extrac...
      Dashboard: https://d.kernelci.org/issue/maestro:c8d36aa6848ceeb5f21060331b3fcc14fe6c4896?iv=1
  
  redhat:
    #1 (3 occurrences) -  error: target emulation unknown: -m or at least one .o file requir...
      Dashboard: https://d.kernelci.org/issue/redhat:a8b090056d8e6bc4eee9ffa4389946c992a6e989?iv=1
    #2 (2 occurrences) -  openssl/engine.h: No such file or directory in scripts/sign-file (...
      Dashboard: https://d.kernelci.org/issue/redhat:54dfb8887344e76e107b693682922a26eb7678e4?iv=1
  

  TEST LABS ACTIVITY
  ------------------
  16 labs reported results this week (unchanged from last week).

  Labs marked with an asterisk (*) are new.

  Lab                    Covered builds   Boots       Tests    Change (tests)
  ───────────────────────────────────────────────────────────────────────────
  broonie                         2,379       0       8,285     -2,048 (-20%)
  lava-broonie                      410   1,427     256,366   -108,315 (-30%)
  lava-cip                          461   1,053         351      +194 (+124%)
  lava-collabora                    636   4,195     209,394      +1,900 (+1%)
  lava-foundriesio                  114     114           0                 0
  lava-kci-qualcomm                 122     376     343,580    -70,508 (-17%)
  lava-kontron                      267     515           0                 0
  lava-pengutronix                  289     717           0                 0
  linaro                             30      30         360              +360
  maestro                         4,049       0   1,899,899   -250,842 (-12%)
  microsoft                          71     395      16,433        -478 (-3%)
  opentest-ti                        64   1,745         749        +68 (+10%)
  pull-labs-aws-ec2                  74      74          74        -25 (-25%)
  pull-labs-demo                    556   1,118     254,282    -36,757 (-13%)
  redhat                            331       0       5,427     +1,704 (+46%)
  syzbot                            103       0         242      +186 (+332%)
  ───────────────────────────────────────────────────────────────────────────
  Total                           9,956  11,759   2,995,442   -464,561 (-13%)

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
