Received: from mail-dy2-f25.google.com (mail-dy2-f25.google.com [74.125.229.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF5FC2F6586
	for <kernelci@lists.linux.dev>; Sat,  3 Oct 2026 00:00:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790985638; cv=none; b=QRkgQ1EHHtnXmLPZAXTJyelFbLLpf9hxE5unGvAXQeqF4khDestIvEUn9crpqA8jxIk71Yqwpy3968KXfMo+zNX2wQj6zniBVgUch5JXIrDKQrvYWYdc25FagF5M6PH7SYj5dLO7+6kvHc0RwG5WM8V1x6cS99J9rEfRYokruso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790985638; c=relaxed/simple;
	bh=uUuV+t/LWcfE59s7uOXxw+2dE56piMP2stLvQSkgAgU=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=l3NMZyrQ7QIFgo8EJe+9zknnhoeKxBQeQ8/OOwQ67tVY9gto1cG4Q/SPj6nkUO5jk+CMGye1OTXbgeCfpeP+v6wOqnEKo7s05bgZ62iLeUTmNonNIAAdzOx1y5JTvLTj5VoW4IpLoxrF22Q7BEab/xQq48FINuK/uWxdjwQvNzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org; spf=pass smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b=FdV8ZLxf; arc=none smtp.client-ip=74.125.229.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b="FdV8ZLxf"
Received: by mail-dy2-f25.google.com with SMTP id 5a478bee46e88-346c612c7a8so61657eec.1
        for <kernelci@lists.linux.dev>; Fri, 02 Oct 2026 17:00:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci.org; s=google; t=1790985636; x=1791590436; darn=lists.linux.dev;
        h=message-id:date:cc:to:from:subject:content-transfer-encoding
         :mime-version:content-type:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=qw1MDMsJQjPYZFJm+6Z1EANEQeM2EKrApDOdv6gI/UE=;
        b=FdV8ZLxfq8q7/Q8kHIsHPrlGq06E3TFZYqsCB2FAMAJP6ORhp+2PblJRjMPbYYytR8
         nGtnO5QAU2ygxLO5rAad26rj14iMXb4xoesjWEDFzFYb+WhC3BsRRgWBaEB8rhB3fFgZ
         /HAnM2x9PmTaFhMtIyTQVOrsP5HTIJLJxyOTnQmn/ldrvgBK5egAVLhXunohJcpuwI04
         YAUfzD2n2zeN0042KFaZjMb/HZz3YjiiUt4gBqfuRF6BsVYuGmGKrs3KbTBez3DxH8g1
         3NNe6JcBeb9OLbh3DaS9X7Lp5nfqAnia1d/pHMlchHyvGnJ2UPnRTy76kyc3Q3v+VdPY
         zyhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790985636; x=1791590436;
        h=message-id:date:cc:to:from:subject:content-transfer-encoding
         :mime-version:content-type:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=qw1MDMsJQjPYZFJm+6Z1EANEQeM2EKrApDOdv6gI/UE=;
        b=ybl3t5dd4EPqXmyKdzTFTr0+5VyVjlYUf2qC/LRC+z0jS6dbYK1AQmcmGa9vEx9sLu
         EhUAOxMsPGcUtOisZQ8ifjFlzWQAiSQoB6/u3tP+t6AiqY3JSVM5iFJs8aAib1U/P7ZO
         3APIEd/aUYO+LZGMRAjcPq0b3v1JrBr0c32PUBruxYriE7KUIS2BmKCESLKi/ALGSTf0
         jZfAliqIzhM7Oc5mcu5EVHMlWDD7s6ioJKIWFeLtACvBcw2QWIt5PKobzfI7saavgziC
         2zEhA3FJh7i7TybgzUA7xVxru0Dh7qJ7aBP0UqvOTV36e90zEO3BRYMM2sgjpaEVVAN+
         UcEQ==
X-Gm-Message-State: AFuF++kfL34FS3hWC/JVHjvjlM8qEkoVEhpp3r+3JKhyMEM5HnJBxYUH
	gzrzsN29dULnVk4XT6PSmlenW6V2VpVQuCFRkdvUe5YpC4O/b+oBPNn3j+CZj/7V4E1f93H6cB1
	0TOp7
X-Gm-Gg: AYBFou12bDj2tf998ln/i+cEfA7ucvIdU4z9+wVi7xzkZIpqEgVnQl92Js5XbDSI9Ug
	ZQpuS0lirHPbEEhL65JjWI1CrNnCzog1cUXqHVLmVYN3Qb0KpiiUswuZlUvy2beRHp/5iGVk4kz
	WdBrjFTNWBot1AXux8E3b9xBbKWi986zduUttQO9CWfsH5U5NDBHWkXeuRbwNnqqYA54kembq+I
	vAAXmW+RCgdjYjvQd+5qSXabOpulSEiMpAEKLdNrdWZRIrAolEBKKZifcfiLzA8nnh1ekNHyiak
	7Oe5gIUyacyE55OvqTTY5TV/EgCibaLbNwQBtCOITuM7sSf9UUruSpGKh1wVxubcTW9tMXFz0Sq
	5zmAPaBWut9jXiHPk4yCLYpkA6HZaxZlye7l46ZpEM0/DxNYBIDEXetG98GXqjpsLvklvuKBp3P
	VgsgopMIlKeP3bcN7yQZAz8gnHgPKCCAkfvpmT64wgQ6p7IlSHaafupbc2p5y3dMs=
X-Received: by 2002:a05:7022:f90c:b0:14d:3c0c:79e9 with SMTP id a92af1059eb24-14f5b9fd40fmr4638183c88.11.1790985635414;
        Fri, 02 Oct 2026 17:00:35 -0700 (PDT)
Received: from 5a6d9a2c18a2 ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-151fce9a619sm748596c88.14.2026.10.02.17.00.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 17:00:34 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: KernelCI Metrics Report - 2026-10-03 00:00 UTC
From: KernelCI bot <bot@kernelci.org>
To: kernelci@lists.linux.dev
Cc: kernelci-results@groups.io
Date: Sat, 03 Oct 2026 00:00:34 -0000
Message-ID: <179098563391.226120.12204142334841423376@5a6d9a2c18a2>

KernelCI Metrics Summary
========================
Period: 2026-09-26 00:00 UTC to 2026-10-02 23:59 UTC


  COVERAGE
  --------
                   This week  Last week           Change
                   ─────────  ─────────  ───────────────
  Trees monitored         35         30               +5
  Checkouts            3,292      4,051      -759 (-19%)
  Builds              14,476      9,954    +4,522 (+45%)
  Tests            3,306,902  2,771,625  +535,277 (+19%)


  BUILD REGRESSIONS
  -----------------
  A "regression" is defined as a reported problem affecting 0 or multiple builds.

  Origin           Regressions        Affected  Affected builds by top issues
                 (known + new)  Builds (total)         #1        #2        #3
  ───────────────────────────────────────────────────────────────────────────
  maestro     21 +  15 =    36           1,001        135       108        92
  ───────────────────────────────────────────────────────────────────────────
  Total       21 +  15 =    36           1,001


  TOP REGRESSIONS PER ORIGIN
  --------------------------
  maestro:
    #1 (135 occurrences) - Error in defconfig (/tmp/kci/linux/scripts/kconfig/Makefile:95) [lo...
      Dashboard: https://d.kernelci.org/issue/maestro:f2c3a9af64a352cb6c8e900e9cd6c2255f242f24?iv=1
    #2 (108 occurrences) -  in vmlinux.unstripped (scripts/Makefile.vmlinux:72) [logspec:kbuil...
      Dashboard: https://d.kernelci.org/issue/maestro:b5ed9b51212f5174ccbd9d812fc43e26fcc5361e?iv=1
    #3 (92 occurrences) - unused variable ‘rev’ [-Werror=unused-variable] in drivers/pci/prob...
      Dashboard: https://d.kernelci.org/issue/maestro:30c0b8077faf4586fdca5fe55e6ebb4b2feeb707?iv=1
  

  TEST LABS ACTIVITY
  ------------------
  18 labs reported results this week (1 more than last week).

  Labs marked with an asterisk (*) are new.

  Lab                    Covered builds   Boots       Tests     Change (tests)
  ────────────────────────────────────────────────────────────────────────────
  aspeed                             43      43           0                  0
  broonie                           934       0       3,056        -735 (-19%)
  lava-broonie                      469   1,412     421,588   +277,120 (+192%)
  lava-cip                          567   1,727          99                +99
  lava-clabbe                        23     168           0                  0
  lava-collabora                    848   2,968     225,681       -6,362 (-3%)
  lava-foundriesio                  154     154           0                  0
  lava-kci-qualcomm                  89     230     177,097    -190,405 (-52%)
  lava-kontron                      311     614           0                  0
  lava-pengutronix                  373     963           0                  0
  lava-renesas *                     24     316           0                  0
  maestro                         6,095       0   2,372,518    +419,855 (+22%)
  microsoft                          40     217       9,188      -2,654 (-22%)
  opentest-ti                        53   1,226         416          -26 (-6%)
  pull-labs-aws-ec2                  46      45          45         -27 (-38%)
  pull-labs-demo                    840   1,243      60,525     +29,755 (+97%)
  sasha-lab                          60     131      25,137      +3,941 (+19%)
  syzbot                             71       0          95         -19 (-17%)
  ────────────────────────────────────────────────────────────────────────────
  Total                          11,040  11,457   3,295,445    +530,542 (+19%)

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
