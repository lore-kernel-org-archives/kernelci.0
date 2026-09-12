Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C1F03515D1
	for <kernelci@lists.linux.dev>; Sat, 12 Sep 2026 00:00:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789171235; cv=none; b=AriepL8gyOf0kLQlEzejxv5ltJkJJlYFj8YXbHNe8FQZdHfavu3hKBHNrv5iaIQuLTp8Yx2l2RE5j1zdZDgGly8CoIi61dN5dfY7UgnW6uYIm3ETGAsRcPLmP84U+SuDVorNnALXdA9sMVIstGgKCE/BA2j79hJChcZdvAyRUaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789171235; c=relaxed/simple;
	bh=6kG9iDn8NDJm16JYBxGxqPrZE9+9u/x++F61gubz3fc=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=heWhC0Bl4EWXbVrVhgYD8lfdj6oIkwRKKdyIy/gLj3FdLkKFV00NMS++mFqoDNJ26EQ94/3pUl33uN6Zs2+rP5xiJKLZHhhiox0AnZ2GejFSQa2tC9bDSBYJ4bBOimjYICXnw0fHd6ylWWSEOyHCcu4FNm09qPPDqIKX71K8AXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org; spf=pass smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b=DYRGgjOL; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b="DYRGgjOL"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-383b4a3755fso1563753a91.3
        for <kernelci@lists.linux.dev>; Fri, 11 Sep 2026 17:00:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci.org; s=google; t=1789171232; x=1789776032; darn=lists.linux.dev;
        h=message-id:date:cc:to:from:subject:content-transfer-encoding
         :mime-version:content-type:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=EXgZIw5cxG6W0nCtwYtIj8/1SD4mFvcCIFrysocD9Xc=;
        b=DYRGgjOLO/yTdf3MiJ4+dx8pxD7hGe0zFrqzldZV701z3qcP81Ayk5CONap1wXoqol
         X7PrOwgknO+0+Ys44sDvLDzS9Uv8X//LyimnpftU0D2eHlzlSkBphsxtMqmfGVjGJZLN
         O0W68e3tTHTwmTpxf5kNY93V4h7AgrRkO10IwiPQzF684guILCOM7KHF/e4bvmZicoHB
         4xU4WwPyZ8VXsketOACorkH6zIhtaNljZzyjL+y+ugoSlg49JCs9Rpv9n8hBSkn56ZR0
         02Y5Fpqh44V6BV7ok4pTGYiUYMb4aSqzCtl6+8aOe2lxzty6r1C7TZu63vTu+TnIu2tu
         nQBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789171232; x=1789776032;
        h=message-id:date:cc:to:from:subject:content-transfer-encoding
         :mime-version:content-type:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=EXgZIw5cxG6W0nCtwYtIj8/1SD4mFvcCIFrysocD9Xc=;
        b=KXclfGJQbM2ZaUWJ6J4CfTpdzxwsTa/MQpAT2SuOg1OQSuP82Ib2OvTr0HwCqN/RPE
         Hk7U/BJrnxJU+RuqBi9rZcLAjqBtUBw/QpzBc9GKvqaZH/8M1bvEK5NNDxmG8q41AKKs
         WAexCcDbV4aUr0Omg+NE5jdl458aIrSiX0J+idEv1cFOakJ06kPb4j4LIKTtujjjgk2R
         xca36YcAwQMGZjXR7N4C+WB39hQ+tbVpBuCk4xGP9m23UtqANCoB4/SC2wOS4UCLwHV6
         S2f6/fyuM5tmYjlwxSeIr90hiJw8ezx4L9dOH1kzhJcQ/mfBIlCVQVfVrMLXWtt5eg+6
         3DBw==
X-Gm-Message-State: AFuF++l71LwJ0Rer8hyZztmGTMsRW3pAe03D4t9rTbO5VMJhkXwKjSPb
	tdTWUnz6wj5V6SZuyJbdXaGapfmmv70IdE/zc67uznC0XHS7oKAhaoBhQERXg6SPI000nEIEWwG
	C+KSA
X-Gm-Gg: AYBFou2rQgGHG+kaFIqbBG0ytHYMqNqZnNteeonVp9SAXgvTBYIab0902axAGb+P0DV
	gMvUkH/gOP17OI1nFDI4Nr6jBL0pd2QvvR1u8SlqibSjk3pmO0PgI/hHlrWUiWX8OD0qTKfSyHk
	k2rvMut24Ev+LYc9K0ODpaxgoZNShzrKFQU8udjJsrDSMOIi5ibquXC8a5+rLUZooiz4f/Dd065
	Wbnw/gWkTq538BvVexf2MBTzfXQS8+wehcPUTD2AvsHu+nax/UyLVOtJSt3VW/4u7h3wgCzCY5h
	rBGA38723hNptBPoh+iG4kHhe9FylgwfDgVVykoqaSnEk5zIU0NV/M0aUCy54Rte+qhr1gta5xr
	eE5W8eFzGtlVpFt89VrJhmUsQ7SqmLDcebCCdnwzLztO39VypuMIKALz620ciyYlJrFUt4n7nQ/
	o4PgQXX9yInO2CAPnpCIkC4YFwxuwZ6W7Ummx9oh885mkQ9ecOtjNor5xFk/2Kb0M=
X-Received: by 2002:a17:90a:da8f:b0:396:6344:3b63 with SMTP id 98e67ed59e1d1-39d9bbee490mr10449430a91.2.1789171232327;
        Fri, 11 Sep 2026 17:00:32 -0700 (PDT)
Received: from 41049dfc76e5 ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14365b347e6sm8406639c88.4.2026.09.11.17.00.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 17:00:31 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: KernelCI Metrics Report - 2026-09-12 00:00 UTC
From: KernelCI bot <bot@kernelci.org>
To: kernelci@lists.linux.dev
Cc: kernelci-results@groups.io
Date: Sat, 12 Sep 2026 00:00:31 -0000
Message-ID: <178917123077.4572.15973742425730205806@41049dfc76e5>

KernelCI Metrics Summary
========================
Period: 2026-09-05 00:00 UTC to 2026-09-11 23:59 UTC


  COVERAGE
  --------
                   This week  Last week         Change
                   ─────────  ─────────  ─────────────
  Trees monitored         34         39             -5
  Checkouts            6,168      6,298     -130 (-2%)
  Builds              11,455     12,599   -1,144 (-9%)
  Tests            2,286,148  2,341,788  -55,640 (-2%)


  BUILD REGRESSIONS
  -----------------
  A "regression" is defined as a reported problem affecting 0 or multiple builds.

  Origin           Regressions        Affected  Affected builds by top issues
                 (known + new)  Builds (total)         #1        #2        #3
  ───────────────────────────────────────────────────────────────────────────
  maestro     17 +  60 =    77             880        173       132       114
  microsoft    0 +   4 =     4               8          3         3         1
  redhat       1 +   7 =     8              11          4         1         1
  ───────────────────────────────────────────────────────────────────────────
  Total       18 +  71 =    89             899


  TOP REGRESSIONS PER ORIGIN
  --------------------------
  maestro:
    #1 (173 occurrences) -  ‘key_pass’ undeclared (first use in this function) in certs/extrac...
      Dashboard: https://d.kernelci.org/issue/maestro:1bc31bdc5afab00de98efd0c67ef8653e5385a69?iv=1
    #2 (132 occurrences) -  use of undeclared identifier 'key_pass' in certs/extract-cert (cer...
      Dashboard: https://d.kernelci.org/issue/maestro:ba4b3f33d6a10cd9f6dd26c6f8c27fab62ca127a?iv=1
    #3 (114 occurrences) -  ‘key_pass’ undeclared (first use in this function) in certs/extrac...
      Dashboard: https://d.kernelci.org/issue/maestro:c8d36aa6848ceeb5f21060331b3fcc14fe6c4896?iv=1
  
  microsoft:
    #1 (3 occurrences) -  in vmlinux (scripts/Makefile.vmlinux:34) [logspec:kbuild,kbuild.ot...
      Dashboard: https://d.kernelci.org/issue/microsoft:35cde1a01734118c6b52274afdf25ae5a8a9dbb2?iv=1
    #2 (3 occurrences) -  in fs/ext4/bitmap (ld) [logspec:kbuild,kbuild.compiler.linker_error]
      Dashboard: https://d.kernelci.org/issue/microsoft:f4bc30d8e5f6b517dfd5386d8b9a25bade392079?iv=1
    #3 (1 occurrences) -  ‘index’ undeclared (first use in this function)

 in arch/arm64/kv...
      Dashboard: https://d.kernelci.org/issue/microsoft:7f1e5b06aea9944b15c1fc81e0b2f6ad84109509?iv=1
  
  redhat:
    #1 (4 occurrences) -  redefinition of ‘consumed’ in io_uring/net.o (io_uring/net.c) [log...
      Dashboard: https://d.kernelci.org/issue/redhat:f40586a7659c860ed66411e238a264e9f27e693a?iv=1
    #2 (1 occurrences) -  in trace/beauty/generated/statx_mask_array.c (trace/beauty/Build:2...
      Dashboard: https://d.kernelci.org/issue/redhat:8c6dcfc22c3019b577e3b3e9c4da9570f4060cfa?iv=1
    #3 (1 occurrences) -  in usr/include/linux/dvb/dmx.h (scripts/Makefile.headersinst:63) [...
      Dashboard: https://d.kernelci.org/issue/redhat:b213e4b4b47e77c12396ee9f10e26ce3fffa7af7?iv=1
  

  TEST LABS ACTIVITY
  ------------------
  17 labs reported results this week (1 more than last week).

  Labs marked with an asterisk (*) are new.

  Lab                    Covered builds   Boots       Tests     Change (tests)
  ────────────────────────────────────────────────────────────────────────────
  aspeed                             25      25           0                  0
  broonie                           957       0       2,724      -4,548 (-63%)
  lava-broonie                      328   1,083           0    -62,563 (-100%)
  lava-cip                          416   1,002           0                  0
  lava-clabbe *                       7      31           0                  0
  lava-collabora                    629   3,418     226,841     +95,399 (+73%)
  lava-foundriesio                  116     117           0                  0
  lava-kci-qualcomm                  52     164     175,336   +154,563 (+744%)
  lava-pengutronix                  261     624           0                  0
  maestro                         3,864       0   1,665,174    -290,327 (-15%)
  microsoft                          41     238      10,166      -3,107 (-23%)
  opentest-ti                        63   1,662         527        -146 (-22%)
  pull-labs-aws-ec2                  74      74          74        +41 (+124%)
  pull-labs-demo                    450   1,459     192,487     +52,775 (+38%)
  redhat                            246       0       2,818          +15 (+1%)
  sasha-lab *                         2       4           0                  0
  syzbot                             69       0         100         -23 (-19%)
  lava-kontron                        0       0           0                  0
  ────────────────────────────────────────────────────────────────────────────
  Total                           7,600   9,901   2,276,247      -57,921 (-2%)

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
