Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B83462D7DE1
	for <kernelci@lists.linux.dev>; Thu, 13 Nov 2025 19:37:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763062681; cv=none; b=Z8pe6kEXQ4ntJ2hKp3DO4/zLVAqVkRNaILFcVeIDsLXAdVe2Kq4zx8En8WgtI+IAydNxh5l12RsGOKXKuJQVHhItSGwytnYVq9fvxLKYU1nJDelAiBSh9rzMSyhtaCK7yBNW5cC8Mua63Mr088JSyPjP3zPQK4FlSHelA4cdWNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763062681; c=relaxed/simple;
	bh=wk3K7nlcOLAQ+KLuqhaLeTDXRMjLPMZbQlTOtNP9Ah0=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=MztmHSVw7o8PXNG+1okX5eCg0qmSE9Es/Ho+hOQl/ZNTqKeGT3lMRIw6biZfB47qp4rAeC0hbdAsVhhyw2wrbDSHEr4bYO+ImukVidNaUEn2Ib1NyBbmTJItmyVHuZPDpYXXTXjVcC6auQytF3muWETqHfrGCtIfPge3mNO4bYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=profusion.mobi; spf=pass smtp.mailfrom=profusion.mobi; dkim=pass (2048-bit key) header.d=profusion.mobi header.i=@profusion.mobi header.b=doRUW8pp; arc=none smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=profusion.mobi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=profusion.mobi
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=profusion.mobi header.i=@profusion.mobi header.b="doRUW8pp"
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-787eb2d8663so17902897b3.0
        for <kernelci@lists.linux.dev>; Thu, 13 Nov 2025 11:37:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=profusion.mobi; s=google; t=1763062678; x=1763667478; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=wngkIyhKevT0w1rU+n+t+eJtTwU3GBiH7XXuKu5HSAY=;
        b=doRUW8ppooTO/FDZQunvg38LV8kFRi0GZw46hOxGD3BbSUFePM26JZXTL287ryVuT4
         IIf/Hleuwhcy+wzAYhdokCeSIzRtr9ev71ev9mwbEDwFDexCHdf6yp4clfYjr4eUnSch
         8bVetJr5H6gZSdf3Z8pDFMA30fUbhyf4bygM0rhRT25UmTyAR2uQjmTqBfUz+Rt3JhZb
         MwCCR+5Nz94jaXptgUObKg9QtcNYOcsPJcpGSaAlLzgecaXZZwqk9QSQusKD54P62Z4z
         s2tdqhxMwM74WK1cPaUwjpuHqGDWR7MiLQofkia1TyZK5gciMohSiBe+RMYIVtUECNny
         jvOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763062678; x=1763667478;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wngkIyhKevT0w1rU+n+t+eJtTwU3GBiH7XXuKu5HSAY=;
        b=c4xWe7QLduQzW25cAWtm/WSysCcKEHKTYMwH6f8FRaxRJVYn/050yxLk2TmigZRo9L
         4tXmYI4M01pLJpuynuFmf7KpWRMq0UjNWAsfZCQu+/3pdmydIvo/bUZcd7PpRm3J7SzB
         HmTDwocxS7Zzziad2aVG6WAwW+31ghxlXXaYFTR3OXLUmkqB2+YWCrkhRTWEhQtGs921
         gHQNvL1FXqW7KXP52a/y49MgSWnGKR8MvbclZU6Jgo40wGU8mmjvy9S7jm2VofN9PCa/
         bjguDwYNXKPieZoO4eFeGpg59N/UOe8JeFP66LR0XdaQpPbzcZZR/hrhYv5gszqVT3zR
         xRTQ==
X-Gm-Message-State: AOJu0YyKBCdc2gIIgYULv3RI5h04eXmvyu7TNO7d3TSm0xb+Ih/aXo0u
	LyZkt4XE8OORTK0aLnfiiyIwu3OvkaEVBaNyGIhaBIwF/qJ5Oa5pUbUFNszu4rSj88sbDL+Y5gH
	jNxIwnLgIJ25qkaeg+JODC5excTbRCH9626nyXAULYpg19pHscP/vyvtiFg==
X-Gm-Gg: ASbGncsUGorvnAcokzIV0LkynomUXQPYomlW/XJJKqkLncRCrq2lz8z23REN9hIFLNb
	FAwVEJGQMgcUlyglAMrF+I85mlwHmC7aIM3zcwEavO9YZ62TKuOGsApx3A7+PjAdKFFweTjiT7L
	iGN/ndxMmwJKhLUGiNJs8+5tjLY5nBuTrbqqfg22Dqn1bI+ad9aYWsvSwZ+0yzhgM1sMSqRYdHC
	Up1+lylpSNYvOB54QmSA8iombys+h/p5oJq9V70tcbUWGX3qBBLG4HP5KhoBA==
X-Google-Smtp-Source: AGHT+IGnF+e9+yicPBbYgCZM0jF5EWaW0HeuVqQdOHq92A2rK+8TGHA4+hw7VFmBc+GmMfQl9KUoOavKOYBUJ7ot+fI=
X-Received: by 2002:a05:690c:dd3:b0:781:4c5a:8d35 with SMTP id
 00721157ae682-788205ab132mr41800647b3.3.1763062678563; Thu, 13 Nov 2025
 11:37:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Gustavo Flores <gustavo.flores@profusion.mobi>
Date: Thu, 13 Nov 2025 16:37:47 -0300
X-Gm-Features: AWmQ_bl36OFhFyPetta7jCOk0GfCiLtIO5QXEDg8e5Z2jjUhGeyM5OJzZB9E07Q
Message-ID: <CAB31pVmyK_p=MWiLniMNKyeAH3NCYf2pGeDKHNG1Bg1wAFRkwA@mail.gmail.com>
Subject: KernelCI Dashboard Report - October 24 - November 13, 2025
To: kernelci@lists.linux.dev
Cc: kernelci-webdashboard@groups.io
Content-Type: text/plain; charset="UTF-8"

Hello everyone,

In the last sprint we continued focusing on reliability and ingester
improvements/refactors, while also increasing our unit test coverage
across backend helpers. Alongside this, we have been working on
approaches to address the performance bottleneck in the hardware
listing. Two PoCs have been prepared and RFC discussions are ongoing,
comparing a Materialized View solution vs Denormalizing and
aggregating hardware tables to reduce query complexity and latency.
Here are the changes from the last two weeks:

## Performance & Architecture
- We worked on PoCs and RFCs for two alternative solutions to improve
the hardware listing performance:
  - Materialized View approach, aggregating data to reduce the need
for multiple joins. [1]
  - Denormalized, aggregated tables, shifting the heavy aggregation
cost to Python/VM rather than query time. [2]

## Ingester & Backend
- Refactoring and additional improvements to the ingester data
processing. [3] [4]

## Testing & Reliability
- Added unit tests for functions used in the ingester tool. [5] [6]
- Added performance tests for the ingester. [7]
- Added unit tests for hardware details and filters helper functions. [8] [9]

## Improvements
- Modified hardware listing to return tuples to improve performance. [10]

## Future changes
Now that we have the plans for performance improvements laid out, we
will work towards the implementation of the best option. Additionally,
we will also start working on Labs features, such as showing them in
the dashboard and creating a filter for them, among other changes.

## References
[1] - https://github.com/kernelci/dashboard/issues/1584
[2] - https://github.com/kernelci/dashboard/issues/1585
[3] - https://github.com/kernelci/dashboard/pull/1574
[4] - https://github.com/kernelci/dashboard/pull/1588
[5] - https://github.com/kernelci/dashboard/issues/1569
[6] - https://github.com/kernelci/dashboard/issues/1601
[7] - https://github.com/kernelci/dashboard/issues/1572
[8] - https://github.com/kernelci/dashboard/pull/1544
[9] - https://github.com/kernelci/dashboard/pull/1543
[10] - https://github.com/kernelci/dashboard/pull/1582
