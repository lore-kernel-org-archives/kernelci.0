Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A4AE13AF2
	for <kernelci@lists.linux.dev>; Sat, 15 Aug 2026 00:01:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786752076; cv=none; b=Uq3yQWgik8nyamLreB4tQFW7KdgRkcaObOaWLvVblIijDOdZNID8hJ2dzUNdJ4vdDNq8phxu0Qs/0In0BQQCcamCenr+pqNq9O4gIzSMNXbN6lUlkQSkwHy0CJmVFtTmRrlxZndq1lS0gq92hDd+FtelS+8nBUduO/GH6WMthfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786752076; c=relaxed/simple;
	bh=+hsMkvhIUIXPfDqKUczZ0FdU6HZ6y0JlYo6bdx4AmIg=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=Wn/Bl6YvyLV9QG4/8FlpiviWOtF/XL0T+wBPgTYTsmc/J4nU0FPFaqt6YH8z969aLt7P4MnAiIUWTyFNkXGLDgkYcyhmWAHlvRH9y0HPFJcHvpLgrF1yb883iQgF60WTX7oE+KxcGNoIGKL86vnzdEaO0CkBXPHLujdw33xuluI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org; spf=pass smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b=CMWuePLo; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b="CMWuePLo"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-848743155bcso561070b3a.0
        for <kernelci@lists.linux.dev>; Fri, 14 Aug 2026 17:01:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci.org; s=google; t=1786752074; x=1787356874; darn=lists.linux.dev;
        h=message-id:date:cc:to:from:subject:content-transfer-encoding
         :mime-version:content-type:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=qjNbASWKHy7Q1QXgcy27Dgy8QYnNJ+HEycTQXruW5X0=;
        b=CMWuePLoFEZ0MHBXcBWWORguK4O4nX9vBulty39wdtmREURH1uOcIAUNSFjwCIhkJU
         nIRPKNEucanmuo2fu0TPBVsryLaftuQplJHtUnGRFL883ZNhQJXfe0ZzHGXBqd1ckBIf
         EYbQLP5L3jOr6DvR8WnhBYQgCfrff9wLP/b/wMKC45j0VbPgSlWBubWbE6LXgsoFvb3q
         fWdfqK6MjIKtw5j2ntjlwhyzuFYizzQxJ86WFqqn7QVN3AwyMtUH4kMgs/OLIHbuJirq
         9k05SX+AEQHXcAI5x/lfX4ddECVBa1uyclFAc/Y0M70rZnaaIfudfCaqX1vl8YKzetCI
         7zOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786752074; x=1787356874;
        h=message-id:date:cc:to:from:subject:content-transfer-encoding
         :mime-version:content-type:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=qjNbASWKHy7Q1QXgcy27Dgy8QYnNJ+HEycTQXruW5X0=;
        b=X41/2XgUU+sNoZlg4fhZXuhaHbBgl8Ysis0kymHaWCwiwLw19vMFyNaqiZk0Wu97Hb
         BAu/hMRoAqm1ArvmyEWeZ/GWY795UVlFue+lbxORIJOZLJI/l5aZ4XPiFXNVjQcRwEZ4
         ncJmkja7sbl0MyG2/0ZjmkpXqu+XLLE96u0owZy3GbDtS5tJOxLxwd5pScG8OOXxqvdc
         9qQbk5o4kdO72dw0/aIACOYyBDKKvE8TC6faNStm06gBr0gGY2+pMsgWSEjdt0oofu6H
         qe/FcfM8JZYoJQ/4N6dgCIFDQGaR+VI5CV4stGrZcnf+FkSgbERvHSrw7AODf6XhfHlF
         Jw5Q==
X-Gm-Message-State: AOJu0YymkWtrrl/RqvW2WjYHSLWKQmsYkPY1MBaQsmI6LipwUFoPv+6k
	wQrwrY+u1k0e7WIIyNi7i6lWyM5F1ON74Xi8/WXZ2Xi0tT1WGuOYHJZW0QISUpZuB74UPK6A2aN
	qrWIc
X-Gm-Gg: AR+sD12oQKuWp64GnwP9xhZsYoby3rgDdhYIKlhsa1skuZD5tn5D38tgv9cMYdx74tC
	T5OwTGNFvZWo6cePzStee7KS7nSXN1pEUJePtWJKuDVwvNtYacpHhDd1CZWffGorpdpaCKRoift
	Wf2ncq7P3P7FZ1nGwV+GtLkTDaaHL4dfis5SXGJyZam/DxxdQIJKtLG6nNwTny62TmWXjZzEVhy
	GiNyTD1/WlgsqvswuO3aDqOHgdakCzRWD5Id3loOWga/fMzkFzKq0lS8AP58E/V5LKXvGAn2cyt
	8IlBb/JGGb9dsqnUSGU+LQi4YoxgJ8VTVaWJ+CqCrHMYMgLBCuQjJlZWiYBIfFChW/CFkV9E87P
	guCYu+hZzd3OXXuaY6NksSEF5EIqkdl0+opGyetwfjyLuyXQDNHBtIvU0Lef8xpO6rYki050F7V
	C68d19yVIw6ujqsCcEgh3hDQevj68K3awQqhDulywLs3ilEY5I+CTk
X-Received: by 2002:a05:6a20:7f88:b0:3c3:b57b:645e with SMTP id adf61e73a8af0-3cc719fe40fmr10953599637.5.1786752074141;
        Fri, 14 Aug 2026 17:01:14 -0700 (PDT)
Received: from 9a65d8f5b626 ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-320d5bd9679sm9328584eec.3.2026.08.14.17.01.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 17:01:12 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: KernelCI Metrics Report - 2026-08-15 00:00 UTC
From: KernelCI bot <bot@kernelci.org>
To: kernelci@lists.linux.dev
Cc: kernelci-results@groups.io
Date: Sat, 15 Aug 2026 00:01:12 -0000
Message-ID: <178675207168.3648.12354223500601224963@9a65d8f5b626>

KernelCI Metrics Summary
========================
Period: 2026-08-08 00:00 UTC to 2026-08-14 23:59 UTC


  COVERAGE
  --------
                   This week  Last week          Change
                   ─────────  ─────────  ──────────────
  Trees monitored         35         38              -3
  Checkouts          127,439    110,814  +16,625 (+15%)
  Builds              10,522     13,858   -3,336 (-24%)
  Tests            3,012,070  2,812,807  +199,263 (+7%)


  BUILD REGRESSIONS
  -----------------
  A "regression" is defined as a reported problem affecting 0 or multiple builds.

  Origin           Regressions        Affected  Affected builds by top issues
                 (known + new)  Builds (total)         #1        #2        #3
  ───────────────────────────────────────────────────────────────────────────
  maestro     12 +   3 =    15             278         41        38        33
  microsoft    1 +  11 =    12              14          2         2         1
  ───────────────────────────────────────────────────────────────────────────
  Total       13 +  14 =    27             292


  TOP REGRESSIONS PER ORIGIN
  --------------------------
  maestro:
    #1 (41 occurrences) -  ‘key_pass’ undeclared (first use in this function) in certs/extrac...
      Dashboard: https://d.kernelci.org/issue/maestro:c8d36aa6848ceeb5f21060331b3fcc14fe6c4896?iv=1
    #2 (38 occurrences) -  ‘key_pass’ undeclared (first use in this function) in certs/extrac...
      Dashboard: https://d.kernelci.org/issue/maestro:1bc31bdc5afab00de98efd0c67ef8653e5385a69?iv=1
    #3 (33 occurrences) -  use of undeclared identifier 'key_pass' in certs/extract-cert (cer...
      Dashboard: https://d.kernelci.org/issue/maestro:3f4a6e9267e202205cf56c65e64d2cb3d3f4f4b6?iv=1
  
  microsoft:
    #1 (2 occurrences) -  in drivers/net/ethernet/intel/iavf/iavf.ko (scripts/Makefile.modfi...
      Dashboard: https://d.kernelci.org/issue/microsoft:393e434b5065f7da101ddad6c53c19181218e3e3?iv=1
    #2 (2 occurrences) -  drivers/net/ethernet/intel/ixgbe/ixgbe.ko: final close failed: No ...
      Dashboard: https://d.kernelci.org/issue/microsoft:54ea65d5222eaedc74ce2bbd5fe4a5e188cca699?iv=1
    #3 (1 occurrences) -  in drivers/net/ethernet/intel/libeth/libeth_xdp.ko (scripts/Makefi...
      Dashboard: https://d.kernelci.org/issue/microsoft:9b7996b88a2ba5cb4958f918c0dbba36e9ab9886?iv=1
  

  TEST LABS ACTIVITY
  ------------------
  17 labs reported results this week (unchanged from last week).

  Labs marked with an asterisk (*) are new.

  Lab                    Covered builds   Boots       Tests    Change (tests)
  ───────────────────────────────────────────────────────────────────────────
  aspeed                              5       5           0                 0
  broonie                         2,680       0       8,972         -64 (-1%)
  lava-broonie                      431   1,387     285,847     +21,981 (+8%)
  lava-cip                          368     845           0      -369 (-100%)
  lava-collabora                    626   3,914     235,178    -26,881 (-10%)
  lava-foundriesio                   97      97           0                 0
  lava-kci-qualcomm                 108     398     374,692   +185,628 (+98%)
  lava-kontron                      222     419           0                 0
  lava-pengutronix                  223     589           0                 0
  maestro                         3,472       0   1,821,204     -11,458 (-1%)
  microsoft                          45     205       9,365     -2,459 (-21%)
  opentest-ti                        69   1,712         736        -98 (-12%)
  pull-labs-aws-ec2                  73      71          72          -4 (-5%)
  pull-labs-demo                    472   1,616     258,539    +32,444 (+14%)
  redhat                            219       0       3,466       -949 (-21%)
  riscv *                             3       0       2,574            +2,574
  syzbot                            102       0         167       -152 (-48%)
  linaro                              0       0           0      -144 (-100%)
  ───────────────────────────────────────────────────────────────────────────
  Total                           9,215  11,258   3,000,812    +200,049 (+7%)

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
