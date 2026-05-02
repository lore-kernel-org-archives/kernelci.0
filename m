Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CBE1946A
	for <kernelci@lists.linux.dev>; Sat,  2 May 2026 00:01:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777680073; cv=none; b=aNgu+cuLrhkhyiCqHV5HXAMofdpWaXUlN/d/44lkpIb4kd5E3OsHrb8iDoO+sZRApSIz/kwmtFlYPHXz3X2TnkAMZ54zd24yuvI/B26WWU1HiVkcVdNNzz8nkZO9yj9nhNwIxkqm7CIS4oA5yXmQRCXZz8ZMtuRf8hfg/8fDpLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777680073; c=relaxed/simple;
	bh=fRehshdJNw37rmsdnRWtGi0Vmv/Mp2/wNyByj8WX++k=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=T3zi2DqGPRRG0mNF41DA+5/WwVEs02Uoua0w269KfBKSjsRtXJGsgIb9+hzmRHav17XTTFEwuzHLXYdfF3B4FSxLrjhlieUu/K+1DqIlkJFs/T1x9ikbegiRVB2uwrW/I+eEfwhOck2leWBfpovjnzOXslATSpIOisp7oKLBAIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org; spf=pass smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b=f0zoY0Hn; arc=none smtp.client-ip=74.125.82.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b="f0zoY0Hn"
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-12db7bf1541so3569416c88.0
        for <kernelci@lists.linux.dev>; Fri, 01 May 2026 17:01:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci.org; s=google; t=1777680071; x=1778284871; darn=lists.linux.dev;
        h=message-id:date:cc:to:from:subject:content-transfer-encoding
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=fN1Weq3ktWxNICpLpw0sIMauGEryLsXh/I/wAWtSDeQ=;
        b=f0zoY0Hnm9vBbdLsztoXrWIlv1tiZAEBFnvdsO2IkfjQH6Lr1gJ+OMBEYAT9EzGhPt
         CqkFgo0/Z98srOnmoEKCPRBtRSab2he3NMBznwcr8eduaAjR/gfwCi5DmjS9cdBypzWQ
         zjmY0du+QNrxyD6VDSSxhJSq0AoKi/P/KuMXLLxGQa+AqFnHJV0DQXzCrVaUiGZphdwK
         vHLpRiC3RX8b+MhEguaoYWhO5lJYW2ElKhzKdwep8IZyDqWK+SNq0i/uDT+kpdILmXkx
         yWTkrmKjpmRutNfDEmjgqY7TUWu89UvZ3zXV8NrGBAw8exPhtvdlRNJFAMkVRijILqFR
         a5Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777680071; x=1778284871;
        h=message-id:date:cc:to:from:subject:content-transfer-encoding
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fN1Weq3ktWxNICpLpw0sIMauGEryLsXh/I/wAWtSDeQ=;
        b=CTT8hcMq9UmhhiulV/XW+ZqSGfPsga1THfVhZqxGiT92yAMh2hu/w6WO37GWHbCuN3
         oyS6c3ZOf1iBc6bXq3eFe+/p2XEK6WgCktDmwwl6YjT3W1nySmcaZiiO3IRw4Zgigx6i
         B6qs2Lut5btiDJE+fwaK3XRp1Ek+oPD9lYakzVofc85zmRYXBnS1M/lMKPitlay79cHg
         wpE0Nt9kb7I32rKZ/8xbjvJsF84NQclegz5Ufj+O2yY3hnIEr4TfjAwFbGtBt3YflXHl
         UhCN2c+e12Ljx4zE+7YpeDdg8y+UHYmKpk1FmqkDRGxQ2ykPQyBHc06iuqNa/VPQ7VBQ
         5b+Q==
X-Gm-Message-State: AOJu0Yxn+L9GSvtWJyvZzM9KpURT7P0GWvNjcITWGjLkQ0brEJ+Y/BVT
	ssdqLjK3aVOulZ5RXKzK4y5uOv8xyfQIXWnjCPw6EQvSvFQBqJzZjBT+7yD/MB5smnsevbAO6gj
	pSLmE
X-Gm-Gg: AeBDievk9LwHW955qWIgwrnEW2wP7o6lXSORn1E3LAIElm4vCuWVcCAEyF0TlN0ffvm
	ZM/+lqZVlqr+LHf9EKPP6Ic0VEqxTxjj0J+zIQtVzEorSTcvipyyWD1BSdc3lJaceWVNPygW8Dk
	YA70Fab/m0jtmm0rZfNB9Ba8ZPW4dn5TqvcBzi7LuRsPmR6Y1nb/0l3CgO1ryD2a+kmdzBUtzFp
	twcA8NnS5Vww4SpjQ51ULFJjhHVZ7aotFQFKbkB/4uysb4WLdiAJJ3gxo/SB8jvvZZ+HsDmb4vT
	B8aRLqQSlWnOL9SYzK1WZ1tq82KgvLgV7XkmXRC/y09prak/nwEsYBcmoxedpKUnth3lFKyFkwX
	U9RdFpAr8dI4DyYLtU03XMahZfJ88bY5qPgAQ0/n0MWm6PbSkdutM0CIlUdNBqT4+L2zLHljrrC
	UxsfL168mU5yk9I8TjEK7HITFyBtE=
X-Received: by 2002:a05:7022:e23:b0:124:9acd:328d with SMTP id a92af1059eb24-12dfd8277d6mr643775c88.22.1777680070916;
        Fri, 01 May 2026 17:01:10 -0700 (PDT)
Received: from 997d03828cfd ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12df84252c0sm6373548c88.10.2026.05.01.17.01.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 17:01:10 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: KernelCI Metrics Report - 2026-05-02 00:00 UTC
From: KernelCI bot <bot@kernelci.org>
To: kernelci@lists.linux.dev
Cc: kernelci-results@groups.io
Date: Sat, 02 May 2026 00:01:09 -0000
Message-ID: <177768006954.1183.4120889943701587763@997d03828cfd>



KernelCI Metrics Summary
========================
Period: 2026-04-25 00:00 UTC to 2026-05-02 00:00 UTC


  COVERAGE
  --------
                      This week    Last week    Change
                      ─────────    ─────────    ──────
  Trees monitored     39           29           +10
  Checkouts           5,426        4,589        +837  (+18%)
  Builds              10,558       11,053       -495  (-4%)
  Tests               1,755,404    1,237,282    +518,122  (+42%)


  BUILD REGRESSIONS
  -----------------
  A "regression" is defined as a reported problem affecting 0 or multiple builds.

  Origin    Regressions       Affected           Affected builds by top issues
            (known + new)     Builds (total)     #1      #2      #3
  ─────────────────────────────────────────────────────────────────────────
  maestro   11  + 8   = 19    328                161     46      34      
  redhat    1   + 0   = 1     7                  7       
  ─────────────────────────────────────────────────────────────────────────
  Total     12  + 8   = 20    335


  TOP REGRESSIONS PER ORIGIN
  --------------------------
  maestro:
    #1 (161 occurrences) -  implicit declaration of function ‘drm_fb_helper_gem_is_fb’; did yo...
      Dashboard: https://d.kernelci.org/issue/maestro:d0858e23012d44ea7b9a8ffe620de278ff702a34?iv=1
    #2 (46 occurrences) -  'HMAC_Update' is deprecated [-Wdeprecated-declarations] in crypto/...
      Dashboard: https://d.kernelci.org/issue/maestro:cfb7db7bad026f784ab5093df91515e27c634b34?iv=1
    #3 (34 occurrences) -  the frame size of 1056 bytes is larger than 1024 bytes [-Werror=fr...
      Dashboard: https://d.kernelci.org/issue/maestro:2d2c5f1e10db58dfd3e3dede1ad14b9b83331a14?iv=1
  
  redhat:
    #1 (7 occurrences) -  error: target emulation unknown: -m or at least one .o file requir...
      Dashboard: https://d.kernelci.org/issue/redhat:a8b090056d8e6bc4eee9ffa4389946c992a6e989?iv=1
  

  TEST LABS ACTIVITY
  ------------------
  15 labs reported results this week (unchanged from last week).

  Labs marked with an asterisk (*) are new.

  Lab                   Covered builds  Boots    Tests          Change (tests)
  ────────────────────────────────────────────────────────────────────────────────
  broonie               1,693           0        7,464          -4,363  (-37%)
  lava-broonie          326             1,432    276,101        +9,948  (+4%)
  lava-cip              350             823      171            +18  (+12%)
  lava-collabora        540             3,274    133,225        -26,269  (-16%)
  lava-foundriesio      84              113      0              0  (0%)
  lava-kci-qualcomm     76              119      79,915         -16,790  (-17%)
  lava-kontron          205             304      0              0  (0%)
  lava-pengutronix      205             546      0              0  (0%)
  linaro                30              59       360            0  (0%)
  maestro               525             0        1,240,623      +559,130  (+82%)
  microsoft             30              156      3,079          -2,569  (-45%)
  opentest-ti           50              1,468    709            -175  (-20%)
  pull-labs-demo        236             289      686            -203  (-23%)
  redhat                250             0        4,130          -2,164  (-34%)
  syzbot                43              0        55             -16  (-23%)
  ────────────────────────────────────────────────────────────────────────────────
  Total                 4,643           8,583    1,746,518      +516,547  (+42%)

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
