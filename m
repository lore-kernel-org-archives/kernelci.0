Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD5E2257843
	for <kernelci@lists.linux.dev>; Thu,  5 Feb 2026 02:50:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770259811; cv=pass; b=rf3VwxuMnXIOFoxw9fFeYWLpB9CAB4/hvwYMSi4USP7S9zTT5aGyh+MCEwh68t9cAi3eUCFEYg/s2i158yz5SBby730blnPGGjWiHkHAPm9syfFe93sdBsYmfzed4MiM6Um0aNoj30/vF+4Rg1u2spc/m9EAzH5B4kVuoQPVqjs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770259811; c=relaxed/simple;
	bh=kOmKKJjfUNJ9GdvD7XwSHYKDtT4mOhGtWZYc5vWpaxk=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=bkRj1rZCIoQ1XDaSKv6LEZIK85v1XhIeQM6XgLJIb/ycvQ/YFFCEfVp3IAXD8iHZ9qSs5AkBHqEtiSgkuaTezvzKlbjD4eFNycIkC7ec4SjFvBhBB7JNUkImIICSIq+e0xfHsXhdBR+q11Ej7L6bq/ws9j9Qt4R9ULsujhGRcgo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pebblebed.com; spf=fail smtp.mailfrom=pebblebed.com; dkim=pass (2048-bit key) header.d=pebblebed-com.20230601.gappssmtp.com header.i=@pebblebed-com.20230601.gappssmtp.com header.b=DK/tsI7f; arc=pass smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pebblebed.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=pebblebed.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pebblebed-com.20230601.gappssmtp.com header.i=@pebblebed-com.20230601.gappssmtp.com header.b="DK/tsI7f"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4801c2fae63so2724545e9.2
        for <kernelci@lists.linux.dev>; Wed, 04 Feb 2026 18:50:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770259809; cv=none;
        d=google.com; s=arc-20240605;
        b=TLJYtCC/EHAFAsiy8+7n4+bWLNW1oavYTsH39vKuq4pMQ4Cdhwv5wNgEU8MqBvihqM
         rWw3gIXKJd9+7sTQmvQXGb5rwqDO+rmLTj6Qo0raD+WhdQxzNhetm8Oh1MNl/vU+oaFr
         20qtYxiU/QWjPxc0oVLM7QJhzppZJY7NwdZ6ibZYVA0Ue0jHzl6WeDG4uneY/4a65r/K
         9Rh5P/oGLzmqD3s4evqU5LpjwPEI9noF6WG5+fpVay/npK80ktQFskOywRf6ecFuvpW9
         eesQwC8ScwMnggY8VNlhaR0xOdXQRCRZdeU8SOCGpBzXSC3WIIHcGVitPmSxenuvP1/0
         X5Ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:dkim-signature;
        bh=kOmKKJjfUNJ9GdvD7XwSHYKDtT4mOhGtWZYc5vWpaxk=;
        fh=rmq/YLFzDAglBwji5AmBmtb7cJxq3EZCkg46fu2xnLc=;
        b=JZHUz5pCvNI4hN4PM0fYNY3Jr/LhtS0OPhQi7jyRok1U0k0kYK0FfUgGP/o3FCM5TM
         2QU4LGZvhotkNO6J44Ej2PeycaIMDzTd0kYzwnWaNeUNWSGgOsj7UrgLOYzpbm7SpbYz
         vfd8nS7WtnwpA3NbZx/jL5TwDeycK/vbOe26T2hjod4GLDeSSccGqbPDUb2K6VqBRx2l
         o+tK3B5WCl3pmlJyKxRp7kQdTP0LnxdpjrKFyEkp/wgW+Lej+24kNymoRYSP6MqTlTi7
         gaFeft+xvMmrmPA8I9E/nFRZBi5yxVWIQxedgcOU/xHoZYRcLBL/LULWvQspe/XbjSh1
         fc2Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pebblebed-com.20230601.gappssmtp.com; s=20230601; t=1770259809; x=1770864609; darn=lists.linux.dev;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=kOmKKJjfUNJ9GdvD7XwSHYKDtT4mOhGtWZYc5vWpaxk=;
        b=DK/tsI7f4XPsZWkhN1F15L8/5Ta/sT4850EzESSFy39RH+smqMw7P9Guv3JB+WjT9X
         4mOljM0JGRQgz27sJ/wVKfS55qL78cE5Eib2i5882Z62nIqiy4FDmdMUojW3dGIOt8PF
         ufeqG9Q+YcTnjey/RDrqX8kW6+nojWI7xiZ0LObWJZjXMBEmHRSYAACHriqY+24N8WLB
         oyEheQ5F7/CT7mTVt/EX+Vmwa/1Ht5f42fB6LG3QyW6qkn9/0OVs06ORzPAnwNNvlQVB
         U8Gh/PQPdxUqkL/N5SbHJRXBdkc17bJgEIuD27XHHrH3JAFb8A9MmXe5zvHZCuVtF7IT
         Hfrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770259809; x=1770864609;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kOmKKJjfUNJ9GdvD7XwSHYKDtT4mOhGtWZYc5vWpaxk=;
        b=vHNPxajMLmnZ8cmWey2vUX423RvtJ6Cgi7Qzc2afhwYDsQFAESzt6dx6UG91CThKCD
         dR4XhQTKLgXnUnURadXY293YiC+psqRvvyCFjaHJ1e4/srgdSiB6ke2KT2inr8SAAhZX
         3wY2R5ewNSjd/C4ww+fbZdlTBTZfCeKibfj6WSMX8PDMAkp41zSUdCbD/c6US7UTeNCL
         lnaP6mKJ/TdxGnYstM90gkxU1W8Rhrgp7cwQkd5sG4aSOQ22DWC1rs6NuhtSt1KbJujz
         vLC+ACLCuQ/lKNUJeJvbN+wSf2Pip3SuEHdBCBaD6Yl5KqMlzyzrfE2RexECrq1j+j2u
         eixg==
X-Gm-Message-State: AOJu0YzWTsf7QSoluN1VF5oFxymRTuaErgi7e3LXKmVwu9f/cXzg9gvt
	n6tdEW/Tb7dGLFUAk76blwWPV54vzWCTOkzBTFlR2mNWHmCYyzgfLmD6r8E8Hf3Cln726toEkWI
	VYq5Yy/AiPWAoGUNoAWkEXOlprA3W/zRXORvG36lZUHOqs+DOS9CmwABz9g==
X-Gm-Gg: AZuq6aJbZgeIqob0StuaMq7FCfEZ6eojc/JOkX015z5CO0holG6iMaYAXHC3v1Ua8yK
	AO+ak0bojNPnMN22smH8N0CmKEnq2gugNL8tB1woG0gkIaFgXLfcdVQ8Hj1h+IlwKsBcya6c2rB
	2/EvHQGSDWcCokK8F/8DNxqxNBqGR7aSI1gOZOOXxZvCiIQoR2B2Spll9ghXNcvIGBzQsO3wjsA
	9B5i2l0VSjds2ZhUWsKEqJjnZNkns6Nb6sEdVRfLKdZLtkmxmTcJyJTG0JzDEBffSnpWnDSr8HG
	afCMkvfGZv1TTrdlnox76/4rhRo=
X-Received: by 2002:a05:600c:8712:b0:480:4be7:4f53 with SMTP id
 5b1f17b1804b1-4830e99333amr83394245e9.31.1770259808798; Wed, 04 Feb 2026
 18:50:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Jenny Qu <jenny@pebblebed.com>
Date: Wed, 4 Feb 2026 18:49:57 -0800
X-Gm-Features: AZwV_Qh4bDRb2aM4c1xZXSIJtqPV_qDrmKVXKujqw4NSb18pqwNG5yIZvAbBpvE
Message-ID: <CAPBP3tRAnaV=NmTZ_yFK+w3GtfTTXtZ3XtpyK+AzvfnCHb8AxQ@mail.gmail.com>
Subject: Talk proposal: What 125K kernel bugs tell us about testing gaps
To: kernelci@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

I'm a security researcher working on automated kernel vulnerability
detection. I'd love to present at an upcoming Thursday call if there's
interest.

I analyzed every Fixes: tag in the kernel's 20-year git history (125K
bug-fix pairs) and built a model to catch vulnerabilities at commit
time. Some findings that might be relevant to KernelCI's testing
strategy:

- Security bugs hide for 2.1 years on average; race conditions persist 5.0 =
years
- 117 "super-reviewers" (including Dan Carpenter, who invented the
Fixes: tag) catch bugs 47% faster
- Subsystems like CAN bus (4.2 years) and SCTP (4.0 years) have
dramatically longer bug lifetimes than gpu/i915 (1.4 years)
- Weekend commits are 8% less likely to introduce bugs, but take 45%
longer to fix (review coverage effect)

The model (VulnBERT) achieves 92% recall at 1.2% false positive rate
on held-out 2024 data. I'm also working on SmartKuang, an RL-based
system that has reproduced CVE-2022-34918 autonomously.

Happy to do 15-20 min on whatever slice would be most useful=E2=80=94the
dataset findings, the detection approach, or how this could complement
KernelCI's coverage.

Writeups:
- https://pebblebed.com/blog/kernel-bugs
- https://pebblebed.com/blog/kernel-bugs-part2

Jenny
jenny@pebblebed.com
