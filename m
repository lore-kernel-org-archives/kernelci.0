Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794009742;
	b=Bp1ZX+onlIy5+kbpV90eoB1WtgH0QnhvJJyr5crUofFHepb0bJbrwJk+UDqRjZN/41Pr
	 LrOpZhTSZjytfNamOHLq1KYdHq2uT5LFVQYKaX2XOYnKdyxqMvZFqrKrERAHPLW/C+MTj
	 odXeIKSSxFbc/K6kOqRAhgmoisZLh1PCv7MEpERPeFARQbNfK3r5X6qSALPMPf7sTzsht
	 yG/qab09qSmFIRrH3dawo5Tk3iEvAoeBFNsPhYTc/zRRgnn6CzzjDCfNqNbDKhIgys2O7
	 vT2kqTD3qNqPJiGTkix+jAQjwLSVcD37ZmzTS1WPr8urcQ1ck0cQ1aGFGKgTbtj+SSA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794009742;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Content-Type:
	 MIME-Version:Content-Transfer-Encoding:Subject:From:To:Cc:Date:
	 Message-ID;
	bh=YCZ9eqZ/3SbmdvFWiGmXakjj0il90fz0B+HqgC98Z4w=;
	b=fXwUCPQ4YccvSjlKCNzlpTwlIyPB24kT8FEth3v9/kSV43uPE24OYp+a8b1Sc0jrXjP9
	 jfzaH7cSX/aPVWC1ZH8SrtXoVcNbHcCKNSLN3YpdbP1sRM/fnOF9+ggrqGk/PVLt6/bnu
	 mv2wjTa9bz7Dj4RLp/xHA8vSVP8yC4fbps2TRF4n1YU/pe9SWOGjrbD/2IRbeBlA6g1eC
	 f1zBuaM8cczIo9O9y7chvE+OW7+aU3rSzJ6Q+0AQFRAsMSqv47EOdZAHvWE2UrAh9NFbd
	 bD/GA0j+fzBID3jjLg9y4dbA58ygWWeQNyunE1At1cLBPn4AIHMJB7syllrwDoj5cQg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernelci.org;
	spf=pass smtp.mailfrom=kernelci.org;
	dkim=pass header.d=kernelci.org header.i=@kernelci.org header.a=rsa-sha256 header.s=google header.b=KevwdaTh;
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D9E3606A326
	for <kernelci@lists.linux.dev>; Sat,  7 Nov 2026 00:02:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6D9E3606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernelci.org header.i=@kernelci.org header.a=rsa-sha256 header.s=google header.b=KevwdaTh
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-36cad25b8b0so1912568eec.1
        for <kernelci@lists.linux.dev>; Fri, 06 Nov 2026 16:02:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci.org; s=google; t=1794009740; x=1794614540; darn=lists.linux.dev;
        h=message-id:date:cc:to:from:subject:content-transfer-encoding
         :mime-version:content-type:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=YCZ9eqZ/3SbmdvFWiGmXakjj0il90fz0B+HqgC98Z4w=;
        b=KevwdaThAQEaStfRTj53fmArdJsP7LZ4MDDLgSbpeBkqJ79Z7kDBA9RZJMBadXMV8+
         pVvn1SMnKHgUqjP8CcQg/n5kl10j5avLCJGj9kz11g1avsNxLcX1Yvb8aNQtHOfTphKt
         jBRMeM8nb0vsGR21AcAESLNDNjQ4Klhm0iHRtIkXO7evV4WaEJ8qvUCskMy0I57d5ex/
         sLHdoacsfd/nGTp3jp731AgQnpUZ959J92zo/IKX8wYd8S9K538TUV7S1xCu31bUp5Tm
         xbDfG1/1Tr9USQXO08YA/Gg0/l3GeW1rgx5irKE4+hPn2NcrdGaFaoIao/RGQUhD7Zer
         C4+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794009740; x=1794614540;
        h=message-id:date:cc:to:from:subject:content-transfer-encoding
         :mime-version:content-type:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=YCZ9eqZ/3SbmdvFWiGmXakjj0il90fz0B+HqgC98Z4w=;
        b=Gg4ahBOu6Vwlx9n4JwoBl/PUXua0HEzwOOtbVH/xwA6wgHE6I+rNYkf2Q11OkHEON/
         v+eqLpL/swS5JRUlseHgxSuhUClZUskBuEteXHef6fv1r0neJZJkE2594/sFV2Yh9LHC
         3HFEIeZNFIlBNCgq8cb+ztQgvFNSg4c/KMAlQ5yHciKWvYLvruOKV6DpwTnKi7R17n4F
         aY4UhOZriIdM7OZRIT7e+TF6ntwzXgULD+vU0/SEczlqDT5CYtzBxxLKhVBXCIj1p+XO
         r9Q2bYHd5QMQjTdhQT4S5NWQOgtAUZFtQpH3VQvZtMZ4w3rByIWrD4yZljaHzqmNZbKi
         30EA==
X-Gm-Message-State: APuU4Z+P966hM01OzVCqCMYy8NLBWLw21AO403/G1PhI6caO/in+MC0z
	xEA51zbb+Rda/SLFKOK+Afwts6e8VroATmapJmimQMKzaAKrBWsZreAyculo8Hwg37+/eHnHe6g
	8tdQ1
X-Gm-Gg: AYBFou1VF13XDLlgc1EllljT8Bwb71Iid9eFQAACDkSCrAKMaxzNgTq4AHYeuMjJ1m4
	2vRV+/OnsVb9s63DV30zYMzhpStYLPSA8FnVYki/NAFe36nQg1wBIbgz7fSC17/f7ov1YGuYVYQ
	8/9n2IGvv/WXOGWZyR+XNwkLFc/9IbSYbgvjODFU1gBiPt17+9trDEK6qlX6eSQI1LCnaVg3myr
	8b18+dIKbMFn8teRmJqXSH/eEddXZQIzOcqEgi+//NMrLZXYQQPTvlVPjGoulm/mkSYqBbZr2d3
	WWMZrnPwVOzXBsrAK//+OmPzf+0EKv3ggeozz++nBSsO4D9aXvxhKj94+VsoXETcjzxwJg7fa2x
	zytaGbvJ8A6nhWad8Ss2uI6slD7wayEeL+BDFuFJhe4SqCxSHZeyTLRpTwJLQSalufAvhQAUwfS
	Q71Pqyu84mQzUzwlHNSRcMa2hENRsucIbwk3Fe7jT+EonogMsA6e6DpCBgZZ/ISTWjghQzBp8p6
	S9iW2Lhk6jSNaVMfR9OoRMJs+AIkQe0ZQcHTsctaZG0yStDwomxDhOO+TsXqiPNy2JVIPvEs8mm
	VaGAL4f4wyPi68vsBCS3iQ==
X-Received: by 2002:a05:7301:4716:b0:36c:9fa4:dc5b with SMTP id 5a478bee46e88-36f7671a449mr4788896eec.23.1794009740043;
        Fri, 06 Nov 2026 16:02:20 -0800 (PST)
Received: from 34406640b1f4 ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa651e6b1sm21970517eec.3.2026.11.06.16.02.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 16:02:19 -0800 (PST)
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
Subject: KernelCI Metrics Report - 2026-11-07 00:00 UTC
From: KernelCI bot <bot@kernelci.org>
To: kernelci@lists.linux.dev
Cc: kernelci-results@groups.io
Date: Sat, 07 Nov 2026 00:02:19 -0000
Message-ID: <179400973863.443869.16922252032850804804@34406640b1f4>

KernelCI Metrics Summary
========================
Period: 2026-10-31 00:00 UTC to 2026-11-06 23:59 UTC


  COVERAGE
  --------
                   This week  Last week             Change
                   ─────────  ─────────  ─────────────────
  Trees monitored         31         20                +11
  Checkouts            7,191      1,860     +5,331 (+287%)
  Builds              18,891     12,607      +6,284 (+50%)
  Tests            4,369,803  3,056,633  +1,313,170 (+43%)


  BUILD REGRESSIONS
  -----------------
  A "regression" is defined as a reported problem affecting 0 or multiple builds.

  Origin           Regressions        Affected  Affected builds by top issues
                 (known + new)  Builds (total)         #1        #2        #3
  ───────────────────────────────────────────────────────────────────────────
  maestro     20 +  10 =    30             886        292       130        99
  ───────────────────────────────────────────────────────────────────────────
  Total       20 +  10 =    30             886


  TOP REGRESSIONS PER ORIGIN
  --------------------------
  maestro:
    #1 (292 occurrences) - suggest parentheses around arithmetic in operand of ‘|’ [-Werror=pa...
      Dashboard: https://d.kernelci.org/issue/maestro:0ac4ca056d408ff08354d1eb5412f842ecb10c06?iv=1
    #2 (130 occurrences) -  shift count is negative [-Werror,-Wshift-count-negative] in driver...
      Dashboard: https://d.kernelci.org/issue/maestro:ce5ec46ecf72462fff1bede413010b22a34a9494?iv=1
    #3 (99 occurrences) - in expansion of macro ‘EXPORT_TRACEPOINT_SYMBOL_GPL’ in kernel/trac...
      Dashboard: https://d.kernelci.org/issue/maestro:2611a38632fab248333ad61cbc967845957aed62?iv=1
  

  TEST LABS ACTIVITY
  ------------------
  19 labs reported results this week (unchanged from last week).

  Labs marked with an asterisk (*) are new.

  Lab                    Covered builds   Boots       Tests      Change (tests)
  ─────────────────────────────────────────────────────────────────────────────
  aspeed                             45      45           0                   0
  broonie                         2,038       0       6,344      +4,005 (+171%)
  lava-broonie                      510     977     190,087        +3,243 (+2%)
  lava-cip                          594   1,882          39         -118 (-75%)
  lava-clabbe                        20     120           0                   0
  lava-collabora                    947   3,828     278,104      -94,491 (-25%)
  lava-foundriesio                  162     162           0                   0
  lava-kci-qualcomm                  54     328     302,109    +237,271 (+366%)
  lava-kontron                      309     456           0                   0
  lava-pengutronix                  376     970           0                   0
  lava-renesas                       58     960           0                   0
  linaro_pull_labs                    0       0           0                   0
  maestro                         6,790       0   2,992,512   +1,263,737 (+73%)
  microsoft                          45     247      11,752       -7,514 (-39%)
  opentest-ti                        53   1,560         687         -631 (-48%)
  pull-labs-aws-ec2                  54      54          52          -37 (-42%)
  pull-labs-demo                  1,081   1,787     323,753      +56,006 (+21%)
  sasha-lab                          66     324     250,573     -147,978 (-37%)
  syzbot                             71       0          91            -5 (-5%)
  ─────────────────────────────────────────────────────────────────────────────
  Total                          13,273  13,700   4,356,103   +1,313,488 (+43%)

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
