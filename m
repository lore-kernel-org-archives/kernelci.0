Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794614499;
	b=2FOwN6alKDNPOL4nmoqnIDGWP7tsPFWu93xngfyzVAXEq3F6A6ku4DCWYwqF56GLOoNj
	 JHvjgtzoHJbW5cnI7myyYRF3COn1eTF8qJ1dI5007adcmXrWf7ufS/2k5GJJI4XBEHu90
	 NgorGCl9RxiRPt5owjG9lr26zYyo6QDr+yYcUQttc3w9xCWJ8srVtd1SHtomizB3VWjsB
	 oEujJhEkR8/UoNznygzNmN9iqH/dEkiLSL0DH0Bg2ikF+2WOyVzS+1NesNLzyEx3V4+KT
	 JVWFrIW43MUhMMv5/xml75pOL4DU2s/tsZx0k5WymcOQiucgI7MWQkf+N6zOvKgNpWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794614499;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Content-Type:
	 MIME-Version:Content-Transfer-Encoding:Subject:From:To:Cc:Date:
	 Message-ID;
	bh=RdBzMfmfu3JL/A8/QyddJ+Q6l0zI1lvBCkiW09H6Eac=;
	b=LmcLBA1FNDKqpUBnYUPI6q7BngDQKT3V4oGhXYRQbBtFQ9z8VJu+3/7hnI7EWlGotZwk
	 X+yu950fwELQpMPMRcVXI4G0fvTWHzyQWnuRHAa6CyYfeVrQvGt+6entYMv+zbk1RV3us
	 CZqIER+onv8ol/RmAF+iyrdWyhHbVYns2iUrFMKs1TfQ7jxcMQEZ9ytTUgeboP4oOfmap
	 pZ6da5qs785FQczlmv99Oy2au8UtZOK7HDMbLyBxeO/3aDXwStY9lussEvoZ8fb3RPn88
	 N6sGvbCES8WJnKnT5OlbbiEIor7TZ5fqxMVglqsTNywhtwuUR/GeEsCSlY5cwEu3BMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernelci.org;
	spf=pass smtp.mailfrom=kernelci.org;
	dkim=pass header.d=kernelci.org header.i=@kernelci.org header.a=rsa-sha256 header.s=google header.b=WHV5BlD5;
	arc=none smtp.remote-ip=74.125.82.54
Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0EAB606A331
	for <kernelci@lists.linux.dev>; Sat, 14 Nov 2026 00:01:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E0EAB606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernelci.org header.i=@kernelci.org header.a=rsa-sha256 header.s=google header.b=WHV5BlD5
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-1b50a4bd2f3so1760536c88.1
        for <kernelci@lists.linux.dev>; Fri, 13 Nov 2026 16:01:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci.org; s=google; t=1794614498; x=1795219298; darn=lists.linux.dev;
        h=message-id:date:cc:to:from:subject:content-transfer-encoding
         :mime-version:content-type:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=RdBzMfmfu3JL/A8/QyddJ+Q6l0zI1lvBCkiW09H6Eac=;
        b=WHV5BlD5pVDz7EsD/FHyXP72U7GRI6lEgkOVMBBnUKo1fg7NPE9MPf7f9iMstQyc2H
         h474oH79amn0u2cIlyNO6utxmBwFOVITUSl2+2jqGN2RrTbw4FId/H5kPqFHvYm0JZy0
         92DL6+Wv+U9RoTnzULU46eVBzVeATFyj89EdDIcH84CWWDjrPir0nxthsz2nyn+ECaUl
         Ev4m5Xloo6LBI2ir6skhP9jNqvr4nm+YnIZICWsPf0SiQSWHrlTguNBV5VmOAsCZPJ1I
         PeI5ygmNhir09ke2+VVxe6YXEECuyRMLLTEpoEnh1wHY3no+WOkGsL7KcBppu48v7rl9
         fawg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794614498; x=1795219298;
        h=message-id:date:cc:to:from:subject:content-transfer-encoding
         :mime-version:content-type:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=RdBzMfmfu3JL/A8/QyddJ+Q6l0zI1lvBCkiW09H6Eac=;
        b=FpPViO9CeRKcuPR/d0tY+TY9j4vyPXYLHI3LBXAApV/pncm2MSjP6QrDR+OjBU5jGt
         +fPly669tzDky9MZcQFfHk5/RBFv9kkPFSVaGbDkoODE5kmGG1a2FIKwW3T9BS7V1LeW
         JN8IvjDHRea7mhc75hTcr/sZjMp75+YKTCNt9YL0Sy8AE8rh80dS2t8do6sYVNNYWpkl
         vXW+0lLBma+dWZuv9+QC2AdhficvIjAK/ezKyaQRrHitZbwiuBwz2eDr+z/2WojchKQr
         xYxvAuPPB8O472iWlHZBW8mM3Jthz+n2mtc5OYfyZRdnWJbba8mBxgTL/XTnDaBan2Y2
         nh0Q==
X-Gm-Message-State: APuU4Z8v2FOYIUn3RMoiLXLr9v63Hp4wXAI0nhWMwF3C7lTymXOaaUF9
	HvtqN0A7IeI7deomEvCBWLTf5rxNk/YDirIw1rUOkXcjN39Mno1kpcsYYO6HonnjyAl2qrC/YEp
	8re9Q
X-Gm-Gg: AYBFou3AvlSLinkwKzrG3W8j9b8ZA7SYE6mRWbvY4OpQ5+ZJXCVdW0K4gTkroNRTxZd
	9UCsUw8845CzuwMq774wsr7FTHFeOIZZj82Boyd/PId/x5e9kBMFhcTkV5kieVTAlot9NE01HMX
	jUS2EQUV4WxlxJYYt2yZX9hpQGOUfXZafoQYSCpwZdyXnsR9pJjv8Z2ngjSOS0/3tL4vem2foOf
	rt4s1hABio0YhQcjVpkQZFA4VtpskFAhedzpzKH0IoELY2F75YC23s0AJ1lIbbWBOu5QlKi1iLe
	1KD+Ysmc2Z2jGmkLYmswTSKdtgukw8kMO2qXn3KbGuWkc0ZGKn5A7ZM9W3FPHH/W55cOgKBEQHe
	4j9KbhQKSfVMW1k99TeIUKzhsgC+7RWKvbdZfaGG40RNxwURORAF9uy3ZOwCcB6C5QgazLT8TDS
	svEWxhHvj3FDpTTIun1MuUNZt1eVSyKOZLLI7qnJuudVxV/3T6E0HLBnCJ1pIpuIxabJFDovmjy
	pa6luT5rd2jMg/GhcqwSDjrHzCYVVGLMElM5TldmtMmqKUTFuYrwV11xbCJqJQoshqyNDNXmfxt
	2jctTjEq45ipNbRuaX135ZanaTbnQnDsUrbGb6mwHRc=
X-Received: by 2002:a05:701b:230c:b0:1ab:fe29:5081 with SMTP id a92af1059eb24-1b5030fc6e2mr3885995c88.20.1794614497301;
        Fri, 13 Nov 2026 16:01:37 -0800 (PST)
Received: from 8439c401ee69 ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b50319e381sm10404977c88.12.2026.11.13.16.01.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 16:01:35 -0800 (PST)
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
Subject: KernelCI Metrics Report - 2026-11-14 00:00 UTC
From: KernelCI bot <bot@kernelci.org>
To: kernelci@lists.linux.dev
Cc: kernelci-results@groups.io
Date: Sat, 14 Nov 2026 00:01:33 -0000
Message-ID: <179461449303.59304.8260849979888007699@8439c401ee69>

KernelCI Metrics Summary
========================
Period: 2026-11-07 00:00 UTC to 2026-11-13 23:59 UTC

  Trees monitored, Checkouts, Builds, and Tests are project-wide.

  COVERAGE
  --------
                   This week  Last week          Change
                   ─────────  ─────────  ──────────────
  Trees monitored         30         31              -1
  Checkouts            5,659      7,178   -1,519 (-21%)
  Builds              16,139     18,857   -2,718 (-14%)
  Tests            4,028,426  4,363,240  -334,814 (-8%)


  BUILD REGRESSIONS
  -----------------
  A "regression" is defined as a reported problem affecting 0 or multiple builds.

  Origin           Regressions        Affected  Affected builds by top issues
                 (known + new)  Builds (total)         #1        #2        #3
  ───────────────────────────────────────────────────────────────────────────
  maestro     18 +  22 =    40             632        155        75        61
  microsoft    0 +   1 =     1               6          6
  ───────────────────────────────────────────────────────────────────────────
  Total       18 +  23 =    41             638


  TOP REGRESSIONS PER ORIGIN
  --------------------------
  maestro:
    #1 (155 occurrences) - suggest parentheses around arithmetic in operand of ‘|’ [-Werror=pa...
      Dashboard: https://d.kernelci.org/issue/maestro:0ac4ca056d408ff08354d1eb5412f842ecb10c06?iv=1
    #2 (75 occurrences) -  shift count is negative [-Werror,-Wshift-count-negative] in driver...
      Dashboard: https://d.kernelci.org/issue/maestro:ce5ec46ecf72462fff1bede413010b22a34a9494?iv=1
    #3 (61 occurrences) - in expansion of macro ‘EXPORT_TRACEPOINT_SYMBOL_GPL’ in kernel/trac...
      Dashboard: https://d.kernelci.org/issue/maestro:2611a38632fab248333ad61cbc967845957aed62?iv=1
  
  microsoft:
    #1 (6 occurrences) -  implicit declaration of function ‘tick_sched_flag_test’; did you m...
      Dashboard: https://d.kernelci.org/issue/microsoft:928bff4a824ee167fd93e5df4e95803634cf3eb5?iv=1
  

  TEST LABS ACTIVITY
  ------------------
  19 labs reported results this week (unchanged from last week).

  Labs marked with an asterisk (*) are new.

  Lab                    Covered builds   Boots       Tests    Change (tests)
  ───────────────────────────────────────────────────────────────────────────
  aspeed                             40      40           0                 0
  broonie                         1,672       0       4,928     -1,416 (-22%)
  lava-broonie                      590   1,105     190,489         +894 (0%)
  lava-cip                          641   1,932         117       +78 (+200%)
  lava-clabbe                        26      46           0                 0
  lava-collabora                    984   3,983     309,916    +33,725 (+12%)
  lava-foundriesio                  167     167           0                 0
  lava-kci-qualcomm                  70     313     266,644    -35,465 (-12%)
  lava-kontron                      333     497           0                 0
  lava-pengutronix                  396   1,005           0                 0
  lava-renesas                       72   1,137           0                 0
  linaro_pull_labs                    0       0           0                 0
  maestro                         6,285       0   2,579,267   -409,087 (-14%)
  microsoft                          56     308      14,112     +2,360 (+20%)
  opentest-ti                        68   1,551         709         +22 (+3%)
  pull-labs-aws-ec2                  68      67          68        +16 (+31%)
  pull-labs-demo                  1,168   2,089     356,313    +32,560 (+10%)
  sasha-lab                          90     328     291,228    +40,655 (+16%)
  syzbot                             39       0          67        -24 (-26%)
  ───────────────────────────────────────────────────────────────────────────
  Total                          12,765  14,568   4,013,858    -335,682 (-8%)

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
