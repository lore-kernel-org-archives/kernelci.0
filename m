Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792800127;
	b=qUXb4LEPJVZPvQv97XYr1c03b63PBcB46dfrIEdNR71p4sR47VqvHMp8dyXpyFGoNBFO
	 btcqoMBgfcMg2EsG2sYoWcjxANNKXTvVDMxPmelg7+maEmVySD1CyNLY0enrtKBV8hvbO
	 KcKU578acZeOESGwBiCKtUdhfa/Hpu4jsyNdhtZ7SLlz3DfcFc66C9cWsrtx+9TrZ0Ldq
	 3Q9CfWtSN7HPbbnXCtE1+HtiPWmxCoOkuONbFCjAtr5Qg4mTzSCXbHULgLawepnsxcAE2
	 q+KcVOyoZT28Iby5LgELQNcd5TW9AwKumIsCAdEgVRHtAX0Zu2yLuOIRMDAVf5Lzevw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792800127;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Content-Type:
	 MIME-Version:Content-Transfer-Encoding:Subject:From:To:Cc:Date:
	 Message-ID;
	bh=Z3Ip/+Iy8+ZLkdO7eEY325Dp3gkIkMEj2ZhuW/Ybgqk=;
	b=z5S/GWhmNF2z4Fis3zOL85nYJ9ctyFX+V5ms4JmD45/Ql0wchKZV5cXXx86/sVDwy1fh
	 9fCdYpY6z594XcnYhAw+it3peYnGa2kKUK8FIVwyHPmXD4vSMKmPFfY+Z5+KQPcoSBSik
	 VOpDekDiJD/3b/apuiv7SFaL5XSjIdG5sIIsd/D8H1ZOLMcd2ohBkWoe5D0AYcObqVi8E
	 zgIK0Y8jE69BpZQ7rZ0cUK07w5jUGuWFS+RbZrZPaBCoa74jPoQe6knmn8b5FYuXHE3ys
	 ajX/qYvaFBDmmmP8BnZjQhUDGcoyXgmiltQo3AxHILCGs9Gh56494b6mZwN/u3i5O7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernelci.org;
	spf=pass smtp.mailfrom=kernelci.org;
	dkim=pass header.d=kernelci.org header.i=@kernelci.org header.a=rsa-sha256 header.s=google header.b="im/qAiLf";
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E749606A31B
	for <kernelci@lists.linux.dev>; Sat, 24 Oct 2026 00:02:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7E749606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernelci.org header.i=@kernelci.org header.a=rsa-sha256 header.s=google header.b=im/qAiLf
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-35b2c599f43so3194938eec.0
        for <kernelci@lists.linux.dev>; Fri, 23 Oct 2026 17:02:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci.org; s=google; t=1792800125; x=1793404925; darn=lists.linux.dev;
        h=message-id:date:cc:to:from:subject:content-transfer-encoding
         :mime-version:content-type:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Z3Ip/+Iy8+ZLkdO7eEY325Dp3gkIkMEj2ZhuW/Ybgqk=;
        b=im/qAiLf6Rw6idKLuDJlWdEJ9z70BZUrdVRgTu2Vn+zlI87o3+tOjvcVKfpB8Sha8E
         IX3QGP5xu9FUayrTt7T+4e82kdNhgUf57kkb9GB7PYwsjRuckNNqxZr+C8uY6hacZ+UA
         w3ef25aDO1Mn4DP7jsueFfLwvQ49UPs0ydrTv4WxMNEfjVn64eis26Ytt+c3rpn49lF8
         Ehu+zia2/SPbAOVVc9q67cEJfTfvT7tbctmh4xq0KCbyPLu9HiQXQC5es7D52he4KDOv
         oE6RX0iDY43G7kIHfszazlsnnmO6cQW+YSX3nGMygaXK+E8VPSmxNwUnLLgR7y+hSnQG
         6tBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792800125; x=1793404925;
        h=message-id:date:cc:to:from:subject:content-transfer-encoding
         :mime-version:content-type:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Z3Ip/+Iy8+ZLkdO7eEY325Dp3gkIkMEj2ZhuW/Ybgqk=;
        b=Vlc2Ff1VbX0xGK7B13XEYt7NLexs8HT4Jryfz/30IsAa1+LzrVPRk4aO/jQTt6KYaH
         Z6IT/0J91qstDTSCUrFYYsXZ9qzbF7XZEdtfXVh7nulcIdL13QE5xPyLDed9wr6huBbP
         wXKzaqZh0GY+IAuPUlXlJsdITxvPUrhfD52z4rJFnN9cZHxd1nzGm1fgvgTEikatYe4E
         7K69ZS/O+PNNrHKqJ6RjMHkTvjl/nYd2BxwqvlAuswkKvLLnp7x8nqh00QY6VcxJrUDr
         jEccpMn1zbhFyD2Y0UQla/csJH5Z3s7xp/ddSnqX47oSsYp6zUhA829N9a5mbpf6YSWS
         L7GQ==
X-Gm-Message-State: AFq9FYJrFCVqjENF0DldT1tt8/caRz20nnjpGMR+068qmUM4W4uKfIMD
	xJy3bKVHHPg5Gnn2w8eQXNio9lxyt0H+0nMwBP+ku4KUkwpHV84MT0AT7D3uT/B76q0aIxHuwTm
	CCHuP
X-Gm-Gg: AYBFou1CkziYKPbi2jVP2PPTInpIR+NTc3HP7vgco/BxtYcVQ1hQ1tQGT/j6sI8D9Vv
	3hDmY/gq8M4BQe0SGM/sA0EtFOV3vMRPz2IhWKSQI72F9mbA49tnfglpNkQPjGbHJbBv3jv6jlR
	tgi1gAAdORZbdg7hHfBD4h8F91crRpA9NwQ4aylAYh4VxKRGlWDzVrAQRjdRJHifUgBAJ1SFrLY
	5NDQSqO+P2eYUaase0EQ12LKc9Q0Sl2BHEgLHQeov7g5jqnEtnMRobgswjVVzWLUYk2O7yrtteX
	02iSu0S2+QuYnFRye5AITvGohAJzDub9EY3ALYsFjcQBkbLh58TqQwVdsOAwOciJfN0oDBw6wlA
	U0zx1zqvdjvMWAZr9Y1vzQN04K67nfNXpwx16i5zbMYpP/gHTwzVeeioOxglzscbg+7QGgyR9gr
	PtZdP/D16q163JswmeQYoY8y7VxOZ1LzuGGFFXrXBmdYZt8BgmITRl0T5Yg7Qyr5MAd2nsyyOG2
	Rw+hvEx0db4fTeCxOWBZ5+mJv7Zi7aolMtmL9s5mvGxkFTm
X-Received: by 2002:a05:7301:fa2:b0:35d:f7f4:bc1c with SMTP id 5a478bee46e88-369e842d1b8mr960232eec.6.1792800124989;
        Fri, 23 Oct 2026 17:02:04 -0700 (PDT)
Received: from 6e52bff8000c ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8d54bd0sm2850724eec.8.2026.10.23.17.02.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 17:02:04 -0700 (PDT)
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
Subject: KernelCI Metrics Report - 2026-10-24 00:00 UTC
From: KernelCI bot <bot@kernelci.org>
To: kernelci@lists.linux.dev
Cc: kernelci-results@groups.io
Date: Sat, 24 Oct 2026 00:02:03 -0000
Message-ID: <179280012355.376027.6137668077457386006@6e52bff8000c>

KernelCI Metrics Summary
========================
Period: 2026-10-17 00:00 UTC to 2026-10-23 23:59 UTC


  COVERAGE
  --------
                   This week  Last week           Change
                   ─────────  ─────────  ───────────────
  Trees monitored         30         29               +1
  Checkouts            1,511      8,364    -6,853 (-82%)
  Builds              13,560     16,114    -2,554 (-16%)
  Tests            3,655,470  2,960,843  +694,627 (+23%)


  BUILD REGRESSIONS
  -----------------
  A "regression" is defined as a reported problem affecting 0 or multiple builds.

  Origin           Regressions        Affected  Affected builds by top issues
                 (known + new)  Builds (total)         #1        #2        #3
  ───────────────────────────────────────────────────────────────────────────
  maestro     23 +  14 =    37           1,359        270       138       110
  microsoft    0 +   1 =     1               4          4
  ───────────────────────────────────────────────────────────────────────────
  Total       23 +  15 =    38           1,363


  TOP REGRESSIONS PER ORIGIN
  --------------------------
  maestro:
    #1 (270 occurrences) - Error in defconfig (/tmp/kci/linux/scripts/kconfig/Makefile:95) [lo...
      Dashboard: https://d.kernelci.org/issue/maestro:f2c3a9af64a352cb6c8e900e9cd6c2255f242f24?iv=1
    #2 (138 occurrences) - suggest parentheses around arithmetic in operand of ‘|’ [-Werror=pa...
      Dashboard: https://d.kernelci.org/issue/maestro:26a4fc4f55534d981efb86a089cc89832d270b24?iv=1
    #3 (110 occurrences) - Error in x86_64_defconfig (/tmp/kci/linux/scripts/kconfig/Makefile:...
      Dashboard: https://d.kernelci.org/issue/maestro:886521a9559398410178dcf75bd3143470a42f5e?iv=1
  
  microsoft:
    #1 (4 occurrences) -  initialization of ‘int (*)(const struct mnt_idmap *, struct dentry...
      Dashboard: https://d.kernelci.org/issue/microsoft:5ee18f6a626423359ce1d797d478513b364c28a5?iv=1
  

  TEST LABS ACTIVITY
  ------------------
  19 labs reported results this week (unchanged from last week).

  Labs marked with an asterisk (*) are new.

  Lab                    Covered builds   Boots       Tests    Change (tests)
  ───────────────────────────────────────────────────────────────────────────
  aspeed                             65      65           0                 0
  broonie                           418       0       2,224     -6,214 (-74%)
  lava-broonie                      447   1,150     483,570    +84,420 (+21%)
  lava-cip                          510   1,628          45       -149 (-77%)
  lava-clabbe                        35     244           0                 0
  lava-collabora                    927   3,716     380,821   +100,748 (+36%)
  lava-foundriesio                  144     144           0                 0
  lava-kci-qualcomm                  65     102     143,990      +9,282 (+7%)
  lava-kontron                      248     425           0                 0
  lava-pengutronix                  315     816           0                 0
  lava-renesas                       90   1,468           0                 0
  linaro_pull_labs                    0       0           0                 0
  maestro                         6,509       0   1,922,202   +355,598 (+23%)
  microsoft                          73     397      17,447        +154 (+1%)
  opentest-ti                        89   2,463         761       +209 (+38%)
  pull-labs-aws-ec2                  81      81          80         +9 (+13%)
  pull-labs-demo                    840   1,776     314,505      +8,507 (+3%)
  sasha-lab                         108     501     374,744   +140,103 (+60%)
  syzbot                             68       0         105        +23 (+28%)
  ───────────────────────────────────────────────────────────────────────────
  Total                          11,032  14,976   3,640,494   +692,690 (+23%)

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
