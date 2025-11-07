Received: from mail-qv1-f73.google.com (mail-qv1-f73.google.com [209.85.219.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0161016F0FE
	for <kernelci@lists.linux.dev>; Fri,  7 Nov 2025 05:29:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762493391; cv=none; b=dN5FPvkPr8VDtW9sqTKS+lQdJzGQ05rEasr86RDyJlq6xMlwF5qVtd2CFcLTFeYFf52W7vck9+r/RXAmL+QUSUjz58YVZxgt41kEWGoubIcVu9Q4zFANkow7TpusmJ/rXg7djdldQ6hJ/5M3cx9i9RPezL8JzE0ie9FjHZiW9Mk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762493391; c=relaxed/simple;
	bh=RV9zvylkghKN55Hz0b0NOWqbwRthFQ9z21H6uAqwdwo=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=G8K/Rv5CkLC47rOkf1Q37vQaHcyNieRqb4unmtrjf1xuuIjaLFtToz7uFfFVILZEr0JJAS2y5N2fEM7Y/ZaDI2UTmpJPqLmDTKf9dTG65Mt5A6hzZav4sejo2cDlY/4nYHrS/7z/d8KBFiHOmtLT8mctmZGdpDDs8WkaCfKlU4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--rmoar.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Htk60fb7; arc=none smtp.client-ip=209.85.219.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--rmoar.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Htk60fb7"
Received: by mail-qv1-f73.google.com with SMTP id 6a1803df08f44-88044215975so14021046d6.1
        for <kernelci@lists.linux.dev>; Thu, 06 Nov 2025 21:29:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762493389; x=1763098189; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=njV6Z7e8AHZ3jv7SEHiGiHSYJwXRJtYkycrQltatJm8=;
        b=Htk60fb754TzKrpIx3USZD0gcTcHXDx1rdU8SkujrnbW4HD/AX0kRfUO9I49hOXimh
         ugm2xlwIKtJwJOvx9mxNfxcz2Jxj4i/gzdyBxdR2X4Sp3ZXooSu6MMyuw+oG2jLTfpMv
         /4KpECDMxbNiSkuHMBMazL7l5fQLZ3KOatG469Ph7EL1AuEgfJJBGPdxrpDIOGUVI/ka
         CJx8v/R0CuMrmF1TYn1lZa69Gret7CIoxBLQMSI358j3CCwfN3g5SRS63SAQJ+ADnxsw
         ztKggsiC0HhTEf7PwEXKWSh3phsY+tcsieaf5+U2xK6HfTgREL5GBHNlwBR6X7CCPv52
         fRKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762493389; x=1763098189;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=njV6Z7e8AHZ3jv7SEHiGiHSYJwXRJtYkycrQltatJm8=;
        b=TuM9sjLDdwsKo837K+oPGjCLxULWSHKb5+kIwQrVo34pyLcatjworMdWABFVukEKoK
         vg7pwXSDgQpk61Y7uhg2Ik4rIDtE4UwPoi6fH4bXQcvTTbUmKQA3iNH+TBEVzhy3rUBN
         X+dO7OZrJX0alFO167QW8uPK+n9qHkeR3UMveYg/Bi2fy8t0Pk1SzCB943/KgMnd854l
         dPQ+aKofJolRh0L1IbOH/nCIy7hDR6sx/lV//4yADwavihrKz/q/oKHu0EiImCP5uxHr
         J42U9Atuni3atGAkGiTtotsxYBp7wN1Qv71UQKnRBtSkWazEdYV+r8QZwwpnwlJOgSbO
         GMbA==
X-Forwarded-Encrypted: i=1; AJvYcCXt/l/cU43VPoegLjSUMbofAokn/NfA+7QWzD8Cl4nYmmWMa3b6K9OWkqzvaTdkfJ8y3izuU2IQug==@lists.linux.dev
X-Gm-Message-State: AOJu0YwpmvkY2zoqXPeoAu4TM1l7Iuh9zFKybjP63uZWVjxCnCne01tF
	Fzeccf4xM2VwnYJP/6O8Ku5AhBIcWlKvVll1C61xBeQ+Y2G/Yt+ebK0Z/c8YquXklr9foZFrzVJ
	DtA==
X-Google-Smtp-Source: AGHT+IEcveD+OrmGuHXxDDibGvZt08sbWYuxuP0sLlsVz06qCZqoaz8Zfmbg2vG1rZ8pO+UwsxKrjpQ2Jg==
X-Received: from qvag28.prod.google.com ([2002:a0c:f09c:0:b0:880:65e3:ffd7])
 (user=rmoar job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6214:5009:b0:87c:2559:fa28
 with SMTP id 6a1803df08f44-881767567f2mr25885676d6.43.1762493388956; Thu, 06
 Nov 2025 21:29:48 -0800 (PST)
Date: Fri,  7 Nov 2025 05:29:21 +0000
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.51.2.1041.gc1ab5b90ca-goog
Message-ID: <20251107052926.3403265-1-rmoar@google.com>
Subject: [PATCH RESEND 0/5] release of KTAP version 2
From: Rae Moar <rmoar@google.com>
To: frowand.list@gmail.com, davidgow@google.com, keescook@chromium.org, 
	raemoar63@gmail.com, Tim.Bird@sony.com, shuah@kernel.org
Cc: tytso@google.com, gustavo.padovan@collabora.com, 
	ricardo.canuelo@collabora.com, corbet@lwn.net, kernelci@lists.linux.dev, 
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Rae Moar <rmoar@google.com>
Content-Type: text/plain; charset="UTF-8"

Hi all! I wanted to resend out this series to respark the discussion
on KTAP version 2. Many of the features proposed are already in use by
KUnit. This would add these features to the KTAP documentation. Note
that all the features of KTAP v2 are backwards compatible. Also, today
is my last day at Google so I will be responding with my personal
email afterwards.

--

This patch series represents the final release of KTAP version 2.

There have been open discussions on version 2 for just over 2
years. This patch series marks the end of KTAP version 2 development
and beginning of the KTAP version 3 development.

The largest component of KTAP version 2 release is the addition of test
metadata to the specification. KTAP metadata could include any test
information that is pertinent for user interaction before or after the
running of the test. For example, the test file path or the test speed.

Example of KTAP Metadata:

 KTAP version 2
 #:ktap_test: main
 #:ktap_arch: uml
 1..1
     KTAP version 2
     #:ktap_test: suite_1
     #:ktap_subsystem: example
     #:ktap_test_file: lib/test.c
     1..2
     ok 1 test_1
     #:ktap_test: test_2
     #:ktap_speed: very_slow
     # test_2 has begun
     #:custom_is_flaky: true
     ok 2 test_2
 # suite_1 has passed
 ok 1 suite_1

The release also includes some formatting fixes and changes to update
the specification to version 2.

Frank Rowand (2):
  ktap_v2: change version to 2-rc in KTAP specification
  ktap_v2: change "version 1" to "version 2" in examples

Rae Moar (3):
  ktap_v2: add test metadata
  ktap_v2: formatting fixes to ktap spec
  ktap_v2: change version to 2 in KTAP specification

 Documentation/dev-tools/ktap.rst | 273 +++++++++++++++++++++++++++++--
 1 file changed, 257 insertions(+), 16 deletions(-)


base-commit: 9de5f847ef8fa205f4fd704a381d32ecb5b66da9
-- 
2.51.2.1041.gc1ab5b90ca-goog

