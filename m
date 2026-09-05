Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3832F3BB57
	for <kernelci@lists.linux.dev>; Sat,  5 Sep 2026 00:03:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788566617; cv=none; b=XC3IsQH8Dg7ya2zNqUJrc86IrOlUK4aCR4Gin53gcPnA+D0GSIAmoXNw4ScMe1VF3hyfEW0UKC9ZkoZTEC5WXoEoRPaxsVmHHMOhRkvpzXbLyG333u67jp5wjkCQ6/tq6qadwKWKGhy+n2e4SOCyxae7tgiHcRN1e3itwFHvYkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788566617; c=relaxed/simple;
	bh=ji1wagfSkLFFyZ600ZjZ32VQ1WwW6oc9fQNSGnQU0Kk=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=IR23w0XepETW2Nj9MyahHrvy/2/X0cFlj1XW1TQGy0xnJWAsy9mmOR9NoHhhIgfMVLla1TbV7LEmTJwhqdYoIp6hWuCY+YW2nvHpwQI8eZFloEW17iwDgdnPD1Kxe4iQDWPANpUf+dhdzvci/I+xQEYGz9qk3HcDo+GX6YWhMu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org; spf=pass smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b=fg2B3B89; arc=none smtp.client-ip=209.85.161.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b="fg2B3B89"
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-6b1b1cb72d0so890532eaf.1
        for <kernelci@lists.linux.dev>; Fri, 04 Sep 2026 17:03:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci.org; s=google; t=1788566614; x=1789171414; darn=lists.linux.dev;
        h=message-id:date:cc:to:from:subject:content-transfer-encoding
         :mime-version:content-type:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=TeCiHIgNohwzkkabYxT9H0+RdQGFt24yNcyZ61X26Rc=;
        b=fg2B3B89nqwQqjA1rOuJ/l6Q0OqQMkBpgZz5AhdMR6eaECdO9hsMkF2S3vKu4+aY3Q
         IWsjqxTNMbBsKcHFySWZY729vQry3MGDofHtwXi2FbxCqlNixobLprSz2PopG8cnPbNW
         iEeTAYU52Z4CeYmXMyZOufvn59ix/cRq3oGSIcG9GiFfB5/lhKTz+lp1NA3eJ2HR18Uf
         E22Xcm2xvELvqdAtAWcCcw3FUja0OaLyrUArTPkV/vl76BbyGxNFp3Lq1YvoYoadjVz5
         7D2l/f5KfVTtZfuqbCFowplnjBc1L/EdpMNj/6k53Qhvxk2ZLTG8jnrTJLLVfF0kVVKK
         W+3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788566614; x=1789171414;
        h=message-id:date:cc:to:from:subject:content-transfer-encoding
         :mime-version:content-type:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=TeCiHIgNohwzkkabYxT9H0+RdQGFt24yNcyZ61X26Rc=;
        b=rmJ20N5MyIlRrSBLdvXQbG2khLMshfosIehRffrqrYJ2AdVVLoem7Y4/w5exwY/8tF
         O6z0t25WiLb9JwNoRAaXsdoFYxgVdfC7PCJhfnyDrlzWFqbsx19l+Bbb9jR94b4WIXAU
         z1QWkjktdYhSiN8uxwzTqhcjfCq7djqLFS737Yo4Oa2WRpjfE5OKMFs17YpnaANQiTFc
         4ff/+DyUz7vGoOrs0yty+jJaobLdYhqMybzDZ2TfVeObW3L4a8o0FnMGH50XiPXv4tSN
         /xP845HittkF5lniNfn6i83FIO6kj0gdRjEYZ8l9bVtoWC5LgvgiNT22hLmgxVl4w2I0
         P01g==
X-Gm-Message-State: AFuF++mwFD41j1HKHCpaYAYLjMs0ipH8mNUQ1XL9BORip4hUFAd4rj1G
	zHY+q5xKHcvA8SMFUg09qXxLrVe33Ji6SyNLrchLkaz89+zmHBc53FWZqtv7SIje/Sn9ARWrS+i
	lccpe
X-Gm-Gg: AYBFou2RxLSR6Q/qSgfmKbualTgnVViDeQ9SAXDb7b/odsGxYUJfeeCC686xBlBt/3g
	T7rf/F4ZFT2YPrtxoBGEuusB4sv1Wq4UMe2Xi71bJ6kSc889pmd+sE0ydGEO+zZ1arXtOlx+UdZ
	hKsMjdwYcTLTS+/+k63DCm+yUB4UjCuQscw7kJpFD7SDt6QB8nBD0NG9Fw3Jz/FBtjfOO6nNCGh
	rxSvuFMhd3teKYRD6U16/Tczyzd3E1v6j83/rDSpVlDnMuarR642ofLriwqzdr+rswvkrCEVvKG
	JdyoSvv+M9ILuNG5+FQEMT3+eEFe2P4gtLYwT2wOZ38AQaKKseJaaBMLJcRdkWgd8zxiG/HS82t
	4usXNJ+O2bsbHBAqIJtTWMakCfWVFzZH4C5CQi4g7/uQ0qlvuCteNPhtB+BivUzW43VuXC5ws8C
	CFK9MsQVdwpACri5GF6DUhfg/WeD5ZAXd6iaavheV/DC194/iJ7VFs
X-Received: by 2002:a05:6820:2219:b0:6b1:56cd:3aba with SMTP id 006d021491bc7-6b6fc9d05b3mr6499398eaf.18.1788566613794;
        Fri, 04 Sep 2026 17:03:33 -0700 (PDT)
Received: from 41049dfc76e5 ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1432435ec2bsm8664793c88.3.2026.09.04.17.03.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 17:03:33 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: KernelCI Metrics Report - 2026-09-05 00:00 UTC
From: KernelCI bot <bot@kernelci.org>
To: kernelci@lists.linux.dev
Cc: kernelci-results@groups.io
Date: Sat, 05 Sep 2026 00:03:32 -0000
Message-ID: <178856661234.1240.8461457295946386494@41049dfc76e5>

KernelCI Metrics Summary
========================
Period: 2026-08-29 00:00 UTC to 2026-09-04 23:59 UTC


  COVERAGE
  --------
                   This week  Last week         Change
                   ─────────  ─────────  ─────────────
  Trees monitored         40         26            +14
  Checkouts            6,328     13,721  -7,393 (-54%)
  Builds              12,667      9,849  +2,818 (+29%)
  Tests            2,351,115  2,388,284  -37,169 (-2%)


  BUILD REGRESSIONS
  -----------------
  A "regression" is defined as a reported problem affecting 0 or multiple builds.

  Origin           Regressions        Affected  Affected builds by top issues
                 (known + new)  Builds (total)         #1        #2        #3
  ───────────────────────────────────────────────────────────────────────────
  maestro     16 +  10 =    26             687        113       110        88
  redhat       1 +   0 =     1               2          2
  ───────────────────────────────────────────────────────────────────────────
  Total       17 +  10 =    27             689


  TOP REGRESSIONS PER ORIGIN
  --------------------------
  maestro:
    #1 (113 occurrences) -  ‘key_pass’ undeclared (first use in this function) in certs/extrac...
      Dashboard: https://d.kernelci.org/issue/maestro:c8d36aa6848ceeb5f21060331b3fcc14fe6c4896?iv=1
    #2 (110 occurrences) -  ‘key_pass’ undeclared (first use in this function) in certs/extrac...
      Dashboard: https://d.kernelci.org/issue/maestro:1bc31bdc5afab00de98efd0c67ef8653e5385a69?iv=1
    #3 (88 occurrences) -  use of undeclared identifier 'key_pass' in certs/extract-cert (cer...
      Dashboard: https://d.kernelci.org/issue/maestro:3f4a6e9267e202205cf56c65e64d2cb3d3f4f4b6?iv=1
  
  redhat:
    #1 (2 occurrences) -  openssl/engine.h: No such file or directory in scripts/sign-file (...
      Dashboard: https://d.kernelci.org/issue/redhat:54dfb8887344e76e107b693682922a26eb7678e4?iv=1
  

  TEST LABS ACTIVITY
  ------------------
  16 labs reported results this week (unchanged from last week).

  Labs marked with an asterisk (*) are new.

  Lab                    Covered builds   Boots       Tests    Change (tests)
  ───────────────────────────────────────────────────────────────────────────
  aspeed                             24      24           0                 0
  broonie                           927       0       7,274     -2,339 (-24%)
  lava-broonie                      172     347      62,563   -230,691 (-79%)
  lava-cip                          216     679           0      -126 (-100%)
  lava-collabora                    322   2,847     131,442   -134,298 (-51%)
  lava-foundriesio                   63     101           0                 0
  lava-kci-qualcomm                  18      20      20,773   -344,057 (-94%)
  lava-kontron                        5       8           0                 0
  lava-pengutronix                  136     525           0                 0
  maestro                         4,310       0   1,964,826   +754,683 (+62%)
  microsoft                          54     310      13,273     -3,164 (-19%)
  opentest-ti                        72   1,873         673       -273 (-29%)
  pull-labs-aws-ec2                  33      33          33        -50 (-60%)
  pull-labs-demo                    266     853     139,712    -73,745 (-35%)
  redhat                            275       0       2,803       -441 (-14%)
  syzbot                             77       0         123        -22 (-15%)
  ───────────────────────────────────────────────────────────────────────────
  Total                           6,970   7,620   2,343,495     -34,523 (-1%)

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
