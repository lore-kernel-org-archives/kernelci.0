Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793041555;
	b=eAwy0ka1Rbldv+hkBqLECOYpnFHYyTKqhzF7GUCBjjg9BGaMyau/Fa3eWkWVxK/5V2a7
	 sRHoxEcTjDIGz1KBBFXLc6oqdpcx4k1J72qUzRZf2IBr9qgP+e/o6feYCnKS+xwhOrnUJ
	 uaaLD3rbVhg7j3rRKWvNKSpadaN8byFhJlE1cisKDLptOTFzywOxIfGYlv0xHFi8byQA5
	 vx9htzsmHOPaDFXfcTt8V0L5UnNjV9Zt9pkQ97ouZsAe0/q/so80dZtYBvx3Jz4jtpMQc
	 3aYcxAK43HpzdkuX8O1d6af6SwiT0KlnGr4/ogdcua3+kQqWb088WKC2O0NDZQxSu9g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793041555;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Content-Type;
	bh=BmMpI1pCVZS72EXCDHGzavoTywt2B9H9SqC+XTP1QJ8=;
	b=MF3rtfqhmwS5GiqUQVEo6mFeq+M/DROKQE2nZbB/n5ek8ERMrRhUMWiiNHC1TLNXNGMA
	 a0WNv61ET7B9aQ5+4Wwl74psNTxAm4Z7rLxnqJa7R+yEAFceSHm8+sM2LfL5mUNakSLDq
	 6X+JPgiGMXo5yIGVrLj1KDfGAyGY22i7tBMWfRR4ptr0p+pGM2TnmP41ILlZyRz2qYzVb
	 hPMGkklsotAeTHZDcrTGUy9Hzvdo2c0rWeLQFIhZyKH1/lzSmeOJe6Z12kaYdl8SSrziL
	 uqsaed0X6mWjs8cQOzyqA1CZ2UfK+6k2KUCFCr2I5T+ltPTzeMo5yTDvZtHoOjv813Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=profusion.mobi;
	spf=pass smtp.mailfrom=profusion.mobi;
	dkim=pass header.d=profusion-mobi.20251104.gappssmtp.com header.i=@profusion-mobi.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=qNRmh1ob;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.52
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04954606A31A
	for <kernelci@lists.linux.dev>; Mon, 26 Oct 2026 19:05:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 04954606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=profusion.mobi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=profusion.mobi
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=profusion-mobi.20251104.gappssmtp.com header.i=@profusion-mobi.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=qNRmh1ob
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c411e139259so262480766b.2
        for <kernelci@lists.linux.dev>; Mon, 26 Oct 2026 12:05:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793041553; cv=none;
        d=google.com; s=arc-20260327;
        b=HaKpi3eaUPi9DmHzvfQwx0IDHqL/Dhf/+pskP44PK1mrCFqHcdTNlhDZe/q9ZUXSVB
         1NwTS0FkPmGTvC6aVP2Q0CyDmg6Sjzue5TdaKBww3nzrmEBKFOZqx4pARi8qVpzbSdbo
         +GrLXAQ5QzLn5ReRKhyaQDApeTrEZbTpfOvTP+AjPCuS6cFjY+qDxQ3MZCF5io7v6rpj
         WjGI2vNE3WLHQtTi+h5/wHQTtgm/iwJYv1Qxb+efKKVFxNexOKhQIdQamod4Xzil1YhA
         7X9mFiLkZC0VMr6xmWyJsau431h7NbDd4Yj49kNE82hfETb0CvZ5HHoehLIl+ceN+shT
         sDyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=BmMpI1pCVZS72EXCDHGzavoTywt2B9H9SqC+XTP1QJ8=;
        fh=rmq/YLFzDAglBwji5AmBmtb7cJxq3EZCkg46fu2xnLc=;
        b=TuKJPCkyd06KUj/WOE6IKCCg+TKxah2C3pWcuuaAuBCXZ9lXFTvcI8xG+LU7j5YwWJ
         1zJ71rxqpFV3+SLCntoJyOoYY0VhLLlap3U/lcyxUWRrKt5lwCdQI99o6yjrmqnyWiio
         YrsbUmih6p5d9KVE/anF/SFD2Zmt8C7DzNch0yHU1olmnm2s5ArfJKg0Rek04iqMCvVS
         8+4pqQUEFry5PKEe3dhvUv5qUIr0zePRb1HUxgL/AYejjp4FsJ0ygUqoboSb00/wqAj7
         xz/dzMXMnj1qBFUt+bSXzebOJRi+wAJtdfZ9tIj39y7tLccLmoUVaDTAIlJbU7l56mQ1
         SpgQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=profusion-mobi.20251104.gappssmtp.com; s=20251104; t=1793041553; x=1793646353; darn=lists.linux.dev;
        h=content-type:to:subject:message-id:date:from:mime-version:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=BmMpI1pCVZS72EXCDHGzavoTywt2B9H9SqC+XTP1QJ8=;
        b=qNRmh1obfBweA9knP+YRsdLeI+feBACCcCj3wWf+ZHw/mfy3UNZs/UWDad2YLyTNEj
         3DNWo/ZL7jAN3lDBfiFFGaxXcDNs0f+YIEFlbwXq6MbuDYJnjYMwER+Q9M/qXok0Y0dm
         0cPap+Eu9CmsOkMoRhR4JzvjRR3ElQL8kgf66TkiiP9/NsbrvEuOdYAryOz8au6T9YMb
         H68HpCRRU/htoHyymxMyNRiZQRcTcYibhOlaqATslU7cNUMFFBQXTvvOYwcrAQzAokuO
         dwmBOAO5pn8YYAqoSzLYc8zbT3tjl/Mp7JOEadlylu06j6GczpJZ7E7s8dW0e5ooX/dR
         g4lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793041553; x=1793646353;
        h=content-type:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BmMpI1pCVZS72EXCDHGzavoTywt2B9H9SqC+XTP1QJ8=;
        b=U9WB4+2r6vh7g4BaKvgCTjC20VGhdhrWipFcZgS1NxYVhOcpjoNRzmQXIjq68gHUyK
         CYhaG3dEufZBmU/QB7RW29MtVGcBWLfSJ7oTC/6F/5HIqCFCbDAeM+AJv9bcA+69Pgat
         awcMfcY/Pheb0eWeNaOMu0A0tHM3llR5dcBeUkdgjS9bL5d/O1x9l1IMcxxMdNqdVitX
         ru6iydlfpeK8OYh+zTfObJV0tCkRfy0Kw478hTLpg7vg9MSutFBdU7KabKgwKgzZxxrb
         yxQtnnP0I32z/Yjg/hYt7Ewgrwy3PAJ5tnEZ5On17oWWMnoj1Y8pWBJMp6bD3sZ2rUYL
         WutQ==
X-Gm-Message-State: AFq9FYIYSferjtCzmvfguPNZo/cOql9wJ/fa84jE9jsedodu1PZYQwSk
	n1wmiB72M7vSK6y+snwb1U16qUyDjzUeQKVZSX7msXi/xqDcvTLnRfsuhVBYW3Ha9P/ewafiTS9
	ilV044F/BxxlvLyM5z65XgMe9N36t2dOuhqROlaBM64+VlZQfPqBaARM=
X-Gm-Gg: AYBFou21oeEr47m4F74PtkTlr3H4AJ5NceMFBf4RT5BJEAEzQJ3Dveqm5nBf33bl8cT
	ZOPybd79UVTpnv2sx4Qj0ENLFjGqQcwDsv4LtCMtmjrJFA73KaQ9ixHKKVEwJXqWd/POdd3M21B
	phyhRiV36sMmLohQFKrQNlmKhA2dru9HQY/Yi8fSZctxEmTarPz0hagYYDZmoVAnCWIF3Quk+ek
	uIPGtl0NQPbe1nJCS64VXLlxtuKDSwmNfFqdkJqNmlceKGEZS+6i9W10cDYemb76Enm7fHB8jiV
	LKC2q/7AD1Pwf/E5I+96rH6eY/+fZ1/Ym2nEA1+bqrvP05B1x1GKumTaxN4nnxM2JiMcWb5P7rU
	XbgOMauD+v7cZlR+DsInQjdAyytgfv8XiyjMFGtrPlUfmdIF8IRYDu+o3fluGyjsUzDh81SA4Xj
	92+Fevj0dcOLg7qA==
X-Received: by 2002:a17:906:f59e:b0:c3f:a2f0:6cb with SMTP id
 a640c23a62f3a-c46bdde4fd5mr851509966b.18.1793041553125; Mon, 26 Oct 2026
 12:05:53 -0700 (PDT)
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Post: <mailto:kernelci@lists.linux.dev>
List-Help: <mailto:kernelci+help@lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
List-Owner: <mailto:kernelci+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
From: Felipe Bergamin <felipebergamin@profusion.mobi>
Date: Mon, 26 Oct 2026 16:05:41 -0300
X-Gm-Features: AclHuK9oDmuWxJnM4FbmwqgOgZxmyokP1IrwY3b8SXHEMk7LTTrETSEcolDzBzw
Message-ID: <CACcoU0E-dOkw=G7_JzAPxAWS-oTtEE0Y3SUnTtV92cP=P6FUkQ@mail.gmail.com>
Subject: KernelCI Dashboard changelog
To: kernelci@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi everyone,

Today we are deploying a new version of the KernelCI Dashboard.

Hardware pages:

- Fixed incorrect tree selection on hardware details pages.
- Added guidance for boards missing from the hardware registry (you
will see a banner at the top of the hardware details page with
instructions)
- Added registry synchronization details below the hardware listing so
users can check which registry files the dashboard loaded.

Other fixes:

- Fixed duplicate tests on issue pages when multiple incidents
reference the same test.
- Fixed test table row heights to keep virtual scrolling consistent.
- Fixed ingestion workers to work with Python 3.14.

Other updates:

- Updated CA bundles and container images to address security
vulnerabilities. Thanks to @nuclearcat
- Added database migrations to support features planned for upcoming releases.

Best Regards
Felipe Bergamin - ProFUSION
KernelCI Dashboard Team
