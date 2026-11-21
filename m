Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795219396;
	b=c4cUxRVzLDa6C3ZSRwdHVQbGd1IiTavroOvDGtqnsfaOH5ylSGRujgvREUiHN3vOC7sJ
	 Yj+U8kKRByNpD0AFwWbM2qhSyt3jYe3coArVKzlmTjNuXc1993ykKoqi55IJbu++JwG6b
	 00UrMP6okP7kLIDVLsnaeZZjojybxx+DE34sPoGkpTPWZauOpNVWfQJ4LimdW7rWBk1do
	 kiz589oOTfOjtv/KPfGeyEezxmZmcHRkE2ObvKvO9JBalAWZ6IZhYRTCxJhpsodic0cKl
	 I3pSoIqhF1RumuQ+kqOQO7RYAaGQD0vPDb+bAUjt6D4eufcjOf3d58EAtxMvhOnxveQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795219396;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Content-Type:
	 MIME-Version:Content-Transfer-Encoding:Subject:From:To:Cc:Date:
	 Message-ID;
	bh=0icq6/FhSMr67gfhCTKIY2D77b+ppydhnAwBOQDWJdc=;
	b=RkUZ5LzVd0qjR7xVxCPICir8CQYGQKlrBCpRRNZ6zF55GXb82HgtxdVXkAlLXWkZRF54
	 AkU0BNMw6yjbHbgTiNDzhT/Jih0t4llkbXLVOxlxiaXq7ZA/SCvIuNjW9rm9Ezx1eUkAs
	 mlent0jsLpK8V7e9pQWEedig9x/5cMoCNFX8luL2SEDvtr02gg+XIo/GGPnc5JDnJAbVX
	 gUKn2Y6b/6xyd9Ykhsjx9E4y8gMFQ/S5SBxJe4T84BOah7MUmNfEOhSwFjXyxXfI3kCQZ
	 A5K9EO+ZSRHFIa6ZIAz6o4yPIUVeD40paoh+UCDUmfzTtVYZ5/Z24TuyWMmdtpApB0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernelci.org;
	spf=pass smtp.mailfrom=kernelci.org;
	dkim=pass header.d=kernelci.org header.i=@kernelci.org header.a=rsa-sha256 header.s=google header.b=KSwHsyic;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F3A5606A693
	for <kernelci@lists.linux.dev>; Sat, 21 Nov 2026 00:03:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6F3A5606A693
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernelci.org header.i=@kernelci.org header.a=rsa-sha256 header.s=google header.b=KSwHsyic
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-380b40312e2so2268984eec.1
        for <kernelci@lists.linux.dev>; Fri, 20 Nov 2026 16:03:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci.org; s=google; t=1795219394; x=1795824194; darn=lists.linux.dev;
        h=message-id:date:cc:to:from:subject:content-transfer-encoding
         :mime-version:content-type:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=0icq6/FhSMr67gfhCTKIY2D77b+ppydhnAwBOQDWJdc=;
        b=KSwHsyic+H2YoQ+PpQstP6F17+KU+UJe4E5VZ9ag0XFd0MhOPacmePritau/aN4vM5
         Lz2/jWTzjwCsKkFRcj0gMGT6uTM3VQL1RX05bfUy8hPXYvsR329tRhBPQg7wlwSL9qfI
         xVkXWtH6C3vEIJ2D7z4JByMeji1250eLEM0kT2g45hH1kxWlVkuECWDPuyO9BiIBM3Zb
         vvi1MBVDqjtJ0vC7Q5BrzzN46v0WYSyKfcSN/B3YgUTYJcvOp0LdZayFnYTW7T1eAGxU
         5vXXEYMHqyUhTkn4m6pshuI4KdDxUZ7ZzwfSzfGUWiGe9bcMM2mr1uryBtkaHARDhmBn
         Etng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795219394; x=1795824194;
        h=message-id:date:cc:to:from:subject:content-transfer-encoding
         :mime-version:content-type:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=0icq6/FhSMr67gfhCTKIY2D77b+ppydhnAwBOQDWJdc=;
        b=iw1akD+rdMXTENLdDQye9wdlmlNJdhDZTknh1MKR++KCp6a6P6p3+CEluvuRWO3mrC
         wo7pTTgy0Y+Ziej4FzAYE1eg2iGntZFb3syRPF0+R+UDCOOJofzOwF55ClHC4dGwqMMC
         Hf6/rJmHoFNlt5pJTXgpMdJz8b2piVojkMwo+7U78MfXd7EUJUDkXzA6TYe78tDO05qg
         QRNFURTak0m4lfwpCTetE5cbRP8GJ0EkrKirTzHVwRUfpJhIkl5YpHr0pFbvTVGSUb9+
         919J5cpyuJXIcgcUJTN+a4UAv57ed6Fexv2XFFG/uncPebI3cUYgkNmg0HjeT0g25pBb
         KqgQ==
X-Gm-Message-State: APuU4Z/dINcqtuj8ZMmw4MHwzX6RXIJytO+/kj8NAqap4RZ9HfbezoUw
	gurMx1XqsndFl+A5woYho9Hv2jDBI/YzF8uZ7vURQ9rOqXL9RLpYhhVZq/6lpOf88aAlYT/Gx8g
	CKWHB
X-Gm-Gg: AZFdTZfpU4YHBIcvVWyqJ4Ld4tOtj3+v4x7Nvm14JvYM0/LE3Bhowr5gBNSkPBtir+9
	YZjle/bLi/lPhmOStO0EFK9x1+rYzz9QR/hjCj7uBrKzNpmEBEzMhsA5hQK7zm00BgRBrrfDlix
	Zb4J33JhENPbtFEhN3bzaP24WG99QqJaYkvq1ui5/ds9KhLT1fOruH1qq1aUpTEkKpI+FJ0EXfc
	Gkxgq7D9Kla5AmXOaa1CWw4JmT8/waNZom3KQkS/7wr1AGvartpXWKbyknzRg0wBHKt8J3UrlJR
	sqyMeFnvd541nn+s/QmzaFgUWRcK31IM9bIffrMKpixq3v8ugYcxGHWZF2pOeuiS61hhAjrBQX3
	YX60KYYKKN9Pt0S0JkofDyABFte1vCCm9SLLspe8NlxsHwTU5uXbQAJWXHnSX7e8dHl2uso24gq
	PwvfhJEODILVHGuWGPjAqfYUBBzzY4MNwoEdk/0sQyPmjvOz6whaQK6aL9vmqujG66yJdW8hi1E
	zz0iMGVhLi6SIsOeKTgGRRqRk0FbDxIStSeE7Uf6rOTeuQGCNAoLv9EOy5hAR4iRvv5dGb5IGQ5
	Lq8SqjONQPcC/2qx8fRqfw==
X-Received: by 2002:a05:693c:41d1:10b0:386:9d4b:9403 with SMTP id 5a478bee46e88-3869d4b9723mr23833eec.19.1795219394047;
        Fri, 20 Nov 2026 16:03:14 -0800 (PST)
Received: from ccc7006dfe57 ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385665f21aesm14762608eec.4.2026.11.20.16.03.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 16:03:13 -0800 (PST)
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
Subject: KernelCI Metrics Report - 2026-11-21 00:00 UTC
From: KernelCI bot <bot@kernelci.org>
To: kernelci@lists.linux.dev
Cc: kernelci-results@groups.io
Date: Sat, 21 Nov 2026 00:03:12 -0000
Message-ID: <179521939252.65951.14443348038507698535@ccc7006dfe57>

KernelCI Metrics Summary
========================
Period: 2026-11-14 00:00 UTC to 2026-11-20 23:59 UTC

  Trees monitored, Checkouts, Builds, and Tests are project-wide.

  COVERAGE
  --------
                   This week  Last week           Change
                   ─────────  ─────────  ───────────────
  Trees monitored         36         29               +7
  Checkouts            5,827      5,634       +193 (+3%)
  Builds              15,996     16,069         -73 (0%)
  Tests            4,460,751  4,023,808  +436,943 (+11%)


  BUILD REGRESSIONS
  -----------------
  A "regression" is defined as a reported problem affecting 0 or multiple builds.

  Origin           Regressions        Affected  Affected builds by top issues
                 (known + new)  Builds (total)         #1        #2        #3
  ───────────────────────────────────────────────────────────────────────────
  maestro     17 +  26 =    43             459         71        61        55
  ───────────────────────────────────────────────────────────────────────────
  Total       17 +  26 =    43             459


  TOP REGRESSIONS PER ORIGIN
  --------------------------
  maestro:
    #1 (71 occurrences) -  shift count is negative [-Werror,-Wshift-count-negative] in driver...
      Dashboard: https://d.kernelci.org/issue/maestro:ce5ec46ecf72462fff1bede413010b22a34a9494?iv=1
    #2 (61 occurrences) - in expansion of macro ‘EXPORT_TRACEPOINT_SYMBOL_GPL’ in kernel/trac...
      Dashboard: https://d.kernelci.org/issue/maestro:2611a38632fab248333ad61cbc967845957aed62?iv=1
    #3 (55 occurrences) -  in expansion of macro ‘GENMASK’ in drivers/irqchip/irq-gic-v3-its....
      Dashboard: https://d.kernelci.org/issue/maestro:9aa37cb390addf0d4b5787634c9287370adbb407?iv=1
  

  TEST LABS ACTIVITY
  ------------------
  19 labs reported results this week (unchanged from last week).

  Labs marked with an asterisk (*) are new.

  Lab                    Covered builds   Boots       Tests    Change (tests)
  ───────────────────────────────────────────────────────────────────────────
  aspeed                             40      40           0                 0
  broonie                         1,560       0       5,372        +450 (+9%)
  lava-broonie                      557     915     209,068    +18,934 (+10%)
  lava-cip                          698   2,157         341      +224 (+191%)
  lava-clabbe                        26      26           0                 0
  lava-collabora                  1,030   4,481     352,826    +43,247 (+14%)
  lava-foundriesio                  203     203           0                 0
  lava-kci-qualcomm                 124     365     368,869   +105,544 (+40%)
  lava-kontron                      174     207           0                 0
  lava-pengutronix                  453   1,166           0                 0
  lava-renesas                       96   1,737           0                 0
  linaro_pull_labs                    0       0           0                 0
  maestro                         6,737       0   2,923,998   +344,731 (+13%)
  microsoft                          75     414      19,455     +5,343 (+38%)
  opentest-ti                        85   2,249         865       +156 (+22%)
  pull-labs-aws-ec2                  92      92          92        +24 (+35%)
  pull-labs-demo                  1,412   2,371     426,889    +71,174 (+20%)
  sasha-lab                          40     125     136,334   -154,894 (-53%)
  syzbot                             67       0          94        +27 (+40%)
  ───────────────────────────────────────────────────────────────────────────
  Total                          13,469  16,548   4,444,203   +434,960 (+11%)

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
