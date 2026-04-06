Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0304A3368B0
	for <kernelci@lists.linux.dev>; Mon,  6 Apr 2026 12:54:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775480064; cv=none; b=FtbSG42X12KhTsgqzwRprmWnUqhgSklncIOn78MCeaLVzEGEUqyTaZdyff1tC9gzZanpgPlcqkqFFDaWNfgZFNNRD3oVJQEhSvt4OBXgyDcNJC9OJbtJGXyt7mvaOlYF5+tuR/L8tXDbcp5lDJgDAdPIFQyoIZPJvb9IAqo2HbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775480064; c=relaxed/simple;
	bh=U1bvy5bxj2m4roK1DD54+6q3mRXPB1Jz9+tr5txmOyY=;
	h=From:Content-Type:MIME-Version:Subject:To:Cc:Date:Message-ID; b=km/0fbZ7JQMrQoGAJrauue1RO9F9vUKiKclAb88LXEv02b8bkZiPgCa0v9xIJYO6IKIgfhArir5OD4WhnjiUdiSO7wQEFIrTE0msg+xJr0KHUZ8D/+TlXQju95NLqiz36tkw8kUlks4axC1HM1QaUUOV0u4pjgS6id3zB3p/P8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=profusion.mobi; spf=pass smtp.mailfrom=profusion.mobi; dkim=pass (2048-bit key) header.d=profusion-mobi.20251104.gappssmtp.com header.i=@profusion-mobi.20251104.gappssmtp.com header.b=PhYrGAxB; arc=none smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=profusion.mobi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=profusion.mobi
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=profusion-mobi.20251104.gappssmtp.com header.i=@profusion-mobi.20251104.gappssmtp.com header.b="PhYrGAxB"
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-2bd801b4078so395026eec.2
        for <kernelci@lists.linux.dev>; Mon, 06 Apr 2026 05:54:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=profusion-mobi.20251104.gappssmtp.com; s=20251104; t=1775480062; x=1776084862; darn=lists.linux.dev;
        h=message-id:date:cc:to:subject:content-transfer-encoding
         :mime-version:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FQHbd/dAHiEB4p9+Ywbh3mtip53KdhukltFo7NPy7lg=;
        b=PhYrGAxBrLWeTFTWzOYhXuC+0+DVXg8GxB9DgFiZ2dzb5PdW3nQEoAxIIrTLsSK/VU
         T9SdlZwUWjzSvK4mSscYtNODX+vUjUS8tfZdnLH//14kBXnNV7b05OCIdn0PMkzqwJrx
         THzt88kTCADsoPalUUbbPq18erkkAYI5YJj5/hXGUszxqvGbQSaTsBkdQb+AU8TFTpTB
         vEY6OYFr+RC5n/ulxQ5LxO7JjdA/hoVyYUaRj1Zu76F2DxKCjFzJuMM5wQ17Zbw/bW6e
         f/In8zbsgUDA3BtqopuVJoZmNPbCMx4SVhhXWCazoB/t2jrJmzacqK2E2KR9ON7uK+0a
         hCqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775480062; x=1776084862;
        h=message-id:date:cc:to:subject:content-transfer-encoding
         :mime-version:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=FQHbd/dAHiEB4p9+Ywbh3mtip53KdhukltFo7NPy7lg=;
        b=idbq+S6Qwm67bFrRGigo5La5YXsu+k4QvbFOHyqjttHUCUEucxeiongILu0C87ZoMA
         rZh4k06nsStt7Ke7oUAYush/oNe1HqwIpMZArhEgyrvPZ2iFkrfDqkLipwJxK6AZkS65
         Gq23HzP4tGCpg6tS6CbYnkPrZbl8bL1/+DClhGjv5CMru2dWbxCj2ydSeRpxOnJit+YZ
         oVFD7rCH3U3+aqfr5XcaEGZ/jSZfaRxqI7W7hu76jp/zfzEPTxj1C35VhB9k0DTkAhxv
         sOwJRdlPJy/cjkCQQRPpzGBumuTUsPzLoILteJD44D7sBUSQMW4C/ndeDUPQDkJe609y
         aDbg==
X-Gm-Message-State: AOJu0YxSCzhDikVBz8audGoa1kjwD49Ik9wak6a5fnwJ5BiIEjmW6DRh
	b7Xg+mFhV6sZ+k7MNO6ecWnUfGPJLkt2+H7TmrjgWmbbB/KQ1Gufx+AB7VH5LJNcID81+DKkLu1
	sNrqS
X-Gm-Gg: AeBDiesoXnoCqh/iKbwB5IVanzUbdXDOKc9flkCd/KAzxGMJy99cZmlqDOUM1HBlWoi
	wckuZ/BI5qNMvFq+bFNyWdhoyBsbq5uwrOS/5y17WEip9qmQcO2xWFs1KkYWQ1eXVktHmw3on3i
	63L+3LSIDErTPcWYyr+b9bKXcOd9hEftDIVKW6bCLtVNAmZCE6u4Ub/Wuk0P16hvvx76KFnyhbB
	pPYyz8vYqCusAAEjnJjCUwyAxuogx0xkTv04mP4VCXBal27mSi8bNCUNBo8kVzz8f9/dn1BhbFg
	7JEgRZ096Hh9JzxIMna2pzcipbWqyWQWCDe47bYYiKhAfxiriFzNuPwahIGGllVtTpPDdY4AaQ8
	FmqqtVb+ig/2C26LoTjgw0G0Q2XBpX3oUAgTxKsKRH3O2Y4eKecpBszdgeq371l9o4u9qY/mcc2
	svJ0F38ZiETVYZsX7K4z3HAd3TytbA0Ge1Zb/v12g=
X-Received: by 2002:a05:693c:3005:b0:2cb:8d2f:e235 with SMTP id 5a478bee46e88-2cbf9af8b84mr2607275eec.1.1775480061273;
        Mon, 06 Apr 2026 05:54:21 -0700 (PDT)
Received: from marcelorobert-Inspiron-5502 ([186.250.206.93])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ca7c20c0c2sm13391799eec.17.2026.04.06.05.54.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 05:54:20 -0700 (PDT)
From: KernelCI bot <marcelo.santos@profusion.mobi>
X-Google-Original-From: KernelCI bot <bot@kernelci.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Manual Update: KernelCI Metrics Report - 2026-04-06 12:53 UTC
To: kernelci@lists.linux.dev
Cc: kernelci-results@groups.io
Date: Mon, 06 Apr 2026 12:54:19 -0000
Message-ID: 
 <177548005651.22102.3530953552112751511@marcelorobert-Inspiron-5502>



Hello, we have updated the KernelCI metrics report formatting.
It will still run weekly, but here's a manual update to show the new format with the latest data.


KernelCI Metrics Summary
========================
Period: 2026-03-30 12:53 UTC to 2026-04-06 12:53 UTC


  COVERAGE
  --------
                      This week    Last week    Change
                      ─────────    ─────────    ──────
  Trees monitored     42           49           -7
  Checkouts           3,947        4,058        -111  (-3%)
  Builds              7,887        9,336        -1,449  (-16%)
  Tests               481,456      441,854      +39,602  (+9%)


  BUILD REGRESSIONS
  -----------------
  A "regression" is defined as a reported problem affecting 0 or multiple builds.

  Origin    Regressions       Affected           Affected builds by top issues
            (known + new)     Builds (total)     #1      #2      #3
  ─────────────────────────────────────────────────────────────────────────
  maestro   16  + 22  = 38    305                63      28      26      
  redhat    1   + 1   = 2     9                  6       3       
  ─────────────────────────────────────────────────────────────────────────
  Total     17  + 23  = 40    314


  TOP REGRESSIONS PER ORIGIN
  --------------------------
  maestro:
    #1 (63 occurrences) -  ‘done’ is used uninitialized [-Werror=uninitialized] in drivers/cp...
      Dashboard: https://d.kernelci.org/issue/maestro:e84b665ddd4424ed72a8bbede90636bdce186f99?iv=1
    #2 (28 occurrences) -  'HMAC_Update' is deprecated [-Wdeprecated-declarations] in crypto/...
      Dashboard: https://d.kernelci.org/issue/maestro:cfb7db7bad026f784ab5093df91515e27c634b34?iv=1
    #3 (26 occurrences) -  in /tmp/kci/artifacts/build/kselftest/drivers/ntsync/ntsync (../.....
      Dashboard: https://d.kernelci.org/issue/maestro:35ab4ac04ad0aeedaed6c04e99aebaa8954e6ec2?iv=1
  
  redhat:
    #1 (6 occurrences) -  error: target emulation unknown: -m or at least one .o file requir...
      Dashboard: https://d.kernelci.org/issue/redhat:a8b090056d8e6bc4eee9ffa4389946c992a6e989?iv=1
    #2 (3 occurrences) -  ‘at91_default_usrio’ undeclared here (not in a function) in driver...
      Dashboard: https://d.kernelci.org/issue/redhat:e385e5050284ef5d130dbb06ffd633dadfd81c18?iv=1
  

  TEST LABS ACTIVITY
  ------------------
  8 labs reported results this week (unchanged from last week).

  Labs marked with an asterisk (*) are new.

  Lab                   Covered builds  Boots    Tests          Change (tests)
  ────────────────────────────────────────────────────────────────────────────────
  lava-broonie          246             1,096    150,617        -40,853  (-21%)
  lava-cip              320             761      171            +19  (+12%)
  lava-collabora        453             2,655    189,950        +38,340  (+25%)
  lava-foundriesio      79              104      0              0  (0%)
  lava-kci-qualcomm     48              105      74,958         +74,829  (+58007%)
  lava-pengutronix      168             438      0              0  (0%)
  opentest-ti           17              708      35             +35
  pull-labs-demo        284             394      983            -2,668  (-73%)
  ────────────────────────────────────────────────────────────────────────────────
  Total                 1,615           6,261    416,714        +69,702  (+20%)

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
