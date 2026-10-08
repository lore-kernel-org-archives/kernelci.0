Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBC2834D3B9
	for <kernelci@lists.linux.dev>; Thu,  8 Oct 2026 18:13:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791483192; cv=pass; b=pSwiuH1fYX/5KtW0XC4xStCIAyGldFNSsU6RpCP4eKqAVYrBjjXfSiUf+xa2M1R1x+uuFgjHy4puzpbYwPq8n5uENWc8rpGkTL+AYGB87b5+Aa3GcfEU72qGx+/SbBNr1WM2yH4jEWxHPMHFpBUzDq4CaWlUpBoS1Swas+NEvrk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791483192; c=relaxed/simple;
	bh=4gsfQXgZKIg1gdl/bXfpudjrIZr9Fjm4vM10+or/kew=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=AGxkdeQHOdiPndvEzfcEkIKkgyPUeZ2fe1MLVUPfE47RueJaxxGp4ZeaCuKPa28R5tFz1N17uJq3znahqqQusf0oN6IAJawbHckjNArLlZrofhOVTHh8l0gL8x/4MItCmGP6OY9+1lBv6F+wrndEo9nfdOAm2EmYf5izrmWKayQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=profusion.mobi; spf=pass smtp.mailfrom=profusion.mobi; dkim=pass (2048-bit key) header.d=profusion-mobi.20251104.gappssmtp.com header.i=@profusion-mobi.20251104.gappssmtp.com header.b=Nw3y3+yT; arc=pass smtp.client-ip=74.125.82.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=profusion.mobi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=profusion.mobi
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=profusion-mobi.20251104.gappssmtp.com header.i=@profusion-mobi.20251104.gappssmtp.com header.b="Nw3y3+yT"
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-3518cbe59b0so630756eec.0
        for <kernelci@lists.linux.dev>; Thu, 08 Oct 2026 11:13:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791483190; cv=none;
        d=google.com; s=arc-20260327;
        b=dtcvbQGdCxZOU2oC+5EmtlcBBnF2+DYKAWliSdrWOvYUNWrYRR98ySZIhEoJNzmbMY
         1nW5EXNDyAN1gjdGvsj3NVmM3MN4YZr2FZCZ4Bd7Fc7C+endfEIBJhS6Jykilj2rcW9F
         GQVaVx5+VDKrLpucveHSZiUeB71vZoL+VYdDe3lVcSMvg5ECtR7jndk5baPqYz9IYzeI
         UohRoztFwMUBRh6xru7AVFWb6DNaGK4mgvp7uJtaXvjHOExkNXM5+0jHnLtYz+vFuQuT
         4c7OGypZ3QRg0EeQbd8ZuJj9vHzVkd+LDUFIaHaJyZfELMxKsaHgfUSlMcELDhc78GJA
         4rIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=MmHCgJYi+AO3R4WExg9rTN/WkF/dfEbh5xQPQnITPaU=;
        fh=BEvjPE5PGt5L9Ssiz9KEfLo9aM8ELw+VbImiGaU5pyg=;
        b=YpgtdeecpU9zDRCLZKLWVqYVbcx8cNTJJNff4SV/yB6oseKtOthC/50BpsvS/6bURi
         IwiYJooRIeqnhXssmUMuPHGV35bEnGwzugRTZQx3N7+FPvh9AKyA1BZBtRpmPEX40DeO
         WFQtR/4jVBeDB3VChOFsrd6DsvKxfrftCgTcZ6KyS/7B/cIwpcQX4jkWkI3/hI4YVJz/
         4hMtnOe/cqp0RffWpVMARY6xjBhaU19uT3wq8UkwjWeGSVPcPN5ReiAeQDSQS/WtZAof
         Ra9CYKNKDYLu/1kBeCv/sxR7Ti0JpoWIuStzP3zO7maOeiTw9cOFJFRgCN1VBCJQe1Nr
         +zfA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=profusion-mobi.20251104.gappssmtp.com; s=20251104; t=1791483190; x=1792087990; darn=lists.linux.dev;
        h=content-type:to:subject:message-id:date:from:mime-version:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=MmHCgJYi+AO3R4WExg9rTN/WkF/dfEbh5xQPQnITPaU=;
        b=Nw3y3+yTxNIGVpsyRDfvwyxlFJr1Z0fA1U4eB3ouIGAeq9TzYsQrEkG8HjRN2XszsY
         oG8F2sfoVqJPr64m8rGWFvfvpoOEUb1+/7aHS1oR4yVMXyxbBkD+VcJ79lRr/Rcaall4
         TbvLGdIoR1e5wK0IE5GWMQ9rqHcxDrSy9J5/wrI9aQfYyOYZszsAQSinLsbeplCUJR2p
         xVwyZfo9pp66BDZBuLvs05YHAwtymZ3SM0Mfn5n3h8NzHRKJLRWqcvmGTSZywPFFjUOo
         xVM2VyUKwTugJzK7uOJn6vayzDax8sA8xMRDkUjdK9B+HsjCq548nFZngrGHIJKj6a+z
         EeZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791483190; x=1792087990;
        h=content-type:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MmHCgJYi+AO3R4WExg9rTN/WkF/dfEbh5xQPQnITPaU=;
        b=ci8EdEnLhZMHHLs6jJ/SzYQhwJ79caKimZBGGkM1KPvuBpvNUKmRJvxyFpUG4fWiGR
         JF0G1BlpHdidNAaQoxh47ujgPjzqY4rsFLK00scqVNRbxQ+sIgV//hihRb4niqBu9KGp
         jar5m0flTHgxiIAEd3ITAjbFTBnZYeaFFv0+eFJBQwyCtc9oa7tPuuaFw87y4TtK0RmF
         lv4fyv7oNuMAoXfozNOIayPK+zU671uSCSpqelu5H1tZUiggjo766sp20ZQZQ9c4W1On
         hKk/HNWL6uzLWIISEjYSQpOLNmFuRNeAUIUaPJJkIFPEcKGrAsuetAjwg49sVvTfbGAa
         M60Q==
X-Gm-Message-State: AFq9FYJ8jTJXqLSBsBFzKB0NSAQ4BvFgYow36Ct311/zYoQTq14lro85
	nmQYdgqz/wEMyVBjSGidaGAbAE11RuyRloTLMVFYr1P/luGcaoJqdi05rbG29AHJRlKwI2Na7qU
	FWxu834XAqp05PtVudbVkTsf5UYfHkQzne/cWdof4L5xncnxXFJIUrcU=
X-Gm-Gg: AYBFou3oqcvvhyRBqs649Hf0c0dInecxnMRYT/y3u1XxZYb52ChiisAaMcj0VRmECzv
	q7p6Bohz0A25Mx9prSPeon4B1Q4y/TyBCtZGUx+obtjDZPqRxtpI2NqWjxbL5memh43el0V7g69
	MPFuizFW132zHiBiBWp5HdNGF9f/LXMGVjFokLWBcekRQxFSdGh0fMIAeqG/3tWE32xEMotJ6r/
	C510V9fb3ubZy8UQo8xIui335vrIzoUHj28Pj80jsJNCSO9IpZl7aCVN6SUNH4tjQQmQTxhqJz5
	t0L5XyYswzf35RoTnVRFoZMd7P+Nlgk/cJN4qjvGNsV5Xop1Yvtwbd4V5b36Ih5b0JVO40N9q3G
	wt4gdS9UEovU=
X-Received: by 2002:a05:7300:42c5:b0:351:7848:85ca with SMTP id
 5a478bee46e88-3536c4bed2bmr141544eec.7.1791483189368; Thu, 08 Oct 2026
 11:13:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Alan Zanoni Peixinho <alan.peixinho@profusion.mobi>
Date: Thu, 8 Oct 2026 15:12:58 -0300
X-Gm-Features: AclHuK8_F4TcTb8SbCPvGDPSGkM_oVR6lesbONw4dKiayMGKas9wWn50anROLw0
Message-ID: <CAKKBm2v+eoWqh2ojVKYNYcij8g19dLNdaXCHozh6V1y4QqKQ6g@mail.gmail.com>
Subject: KCI Dashboard Updates
To: kernelci <kernelci@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"

Hello KernelCI community,

We have deployed a few updates and fixes to the dashboard. You can
check out the live site here: https://dashboard.kernelci.org.

UX
* Tree compare now calls the two revisions Base and Compare
(range=<base>..<compare>). Base is the older one, so a failure that
starts on Compare is a regression. The Tests tab groups rows by path
and config: a group expands, and a test row opens the detail drawer.
The boots table has a config column. Previous-commit and branch-head
buttons are labeled, and the tooltip shows the short hash, name, tags,
and date.
* A duration of zero, or a blank duration, is no longer applied as a
filter. A bugfix that could cause parsing build duration incorrectly
is fixed.
* The Labs filter now also applies to boots, on tree details, hardware
details, and commit history. It still applies to tests, and not to
builds.

BACKEND
* filter_boot.lab, filter_test.lab, and filter_build.lab each filter
that tab on tree details, hardware details, commit history, and tree
compare. A hardware POST filter body can set those lab keys
    separately.
* GET /api/metrics/ returns per-lab status counts for builds, boots,
and tests, plus covered_builds. The Metrics page still shows one total
per column.

ANALYTICS
* /api/ traffic is labeled dashboard, kci-dev, script (curl, wget, and
python-requests), bot, or unknown. Unknown clients are not counted as
dashboard traffic, and kci-dev is also counted by release version.
* Latency is recorded by endpoint, method, and client. A daily job
publishes how many visitors fell into request-count bands.

Best,
Alan Peixinho
KCI Dashboard Team
