Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C5FD35CBBB
	for <kernelci@lists.linux.dev>; Thu, 13 Nov 2025 19:43:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763062985; cv=none; b=Rx/+OSqAKisYUVPmktc9wcQA01cfCNwn/pEG+ePrluz7Mnu7p5WGDUNKucWsHBCD9s2nPo5Y9BXwqJ6C+F/VM+5/BLtSBUDtyoHJ/8afMSiYEHCNIo/mU5dz0FwoxbgpzMnuCoSOThxZ5kdxJs6osK0h+CBB1AQoZn6mx+JQ534=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763062985; c=relaxed/simple;
	bh=wk3K7nlcOLAQ+KLuqhaLeTDXRMjLPMZbQlTOtNP9Ah0=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=NGAu9Eq4iW6shgBLlJNffhjTo29dm122n6B42pRArn/QqkK8JXwuIPwCdbbkhEmWTsvfH3pH7y/T26yseINP9TslQDdyyfRsyZFfb9R+R3ai3FyG2bGAjw/5u4xgxetwyTuPr0A3ZLB0m0AqjrYeuf9wUOklx4PLIVQoMsF0lr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=profusion.mobi; spf=pass smtp.mailfrom=profusion.mobi; dkim=pass (2048-bit key) header.d=profusion.mobi header.i=@profusion.mobi header.b=UyHBwYi2; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=profusion.mobi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=profusion.mobi
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=profusion.mobi header.i=@profusion.mobi header.b="UyHBwYi2"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-59424b0fabcso175451e87.3
        for <kernelci@lists.linux.dev>; Thu, 13 Nov 2025 11:43:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=profusion.mobi; s=google; t=1763062981; x=1763667781; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=wngkIyhKevT0w1rU+n+t+eJtTwU3GBiH7XXuKu5HSAY=;
        b=UyHBwYi2y3idNBez70kioDv2nSEaAHS62BDs1rFmgjlDxLc/2iXCZlKNGGBtN5MSvJ
         K13e6vrk07b75aL7R1Z3IQYl+EQ/rUonoVJmgH1gGuzuxbpmQMVgQrI4oqh1hZ6zYCxa
         F+GgQCRaeKcOHARGcBHkXz466R1FgP/bxNyNctKNs2+SDkYUFhVidolG4PCmjCP/JpFU
         2/S8WyJF63E8I4Bjji0PcuZwGnVk4+k5lqASY/R/LC6BXmPhygqcU9SVbTBVjtXbAPEQ
         B48pIb2HXNtc/gNu76mMCqZvrXPAJUk7PUNNa0G0yq3FPM37RiYOKwlnG9LShh7W3Eyr
         X9aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763062981; x=1763667781;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wngkIyhKevT0w1rU+n+t+eJtTwU3GBiH7XXuKu5HSAY=;
        b=r0EgwS2T/YmOWIWpQvcoqMtWuvH3/FB/B8bkZ6aFv2lAlRhc42WRdF1gHsSYRtOT0E
         pVFcDc1i80vqyFUPDgMlpAsE1UD/+Rc08/s/Tq37SKKBBwfMYG9B8C/DrSuknd6JCOps
         l5/a4FFGebCarPlib/Y1m6xABH5ICNcUcSTRSsx5tCqmQ35Gd7d2+IvW5zbKLJJBe8zl
         kg9ug0OxLLQ3kr2AmM0j+P0XAxi8Dlmngj4CZmwZvHsyDNS/Cz4MvJsAfX2gOnsXWx7I
         1QuncZbGYwEjoo2uR9vFlSSkiMZ/EVMIrJZxKby5MXIdQrVuV6lILHMkiwqvf19YeWJy
         vI/A==
X-Gm-Message-State: AOJu0YwTVfUzlXKpxS2lIvQibA22vWo+TOysOI7UVVqJ/7PW+I9kL5qK
	IWdZVS2JWeoR03YITzg+jxoFzQWtft1PqRCN9kMi5T9wfDZeBXZokbVZlN2S+8ej80YB+PTatG3
	vSiyPeEmy/m+yiFZo4t8i8f9iES947IhCjCbJiVe0RDcnkjMbJVXAdeU=
X-Gm-Gg: ASbGncuKFH8sLZWlcBeQHkUXecGtyYRzU7AE+uZjmwWTBJZsPBSNokJ+FVpuMwt7o5v
	6ITKnzPO0LNSXJduU67jtlom5Z8xkIEhyNOBk5fqlYtRQmk9pQ08LHmoBV+hryGitK/c08gueGC
	hs5k28MokQXilGzyg6yL5KGLa2wKjHR5fOynNiSmexkG7Pl6uaZ0fN9V+WZGo+hyFKLTFERNSwh
	cug2GhAX21lwGW5FSdq710Yt/1h8rymxJgKSKbd2DC18EJ3si2wfuXuFnLUGX8=
X-Google-Smtp-Source: AGHT+IFg+RwwbHHW3J+P3Uo/0/dOWv3haRtqwpqeV9pW2AZGZuLyAUhmT/Sn2QGgINlfR2JdUF9P3alQWje4+kIditU=
X-Received: by 2002:a05:651c:2101:b0:37a:3076:47de with SMTP id
 38308e7fff4ca-37babd3dcc3mr214171fa.6.1763062981008; Thu, 13 Nov 2025
 11:43:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Marcelo Robert Santos <marcelo.santos@profusion.mobi>
Date: Thu, 13 Nov 2025 16:42:50 -0300
X-Gm-Features: AWmQ_bkYW9rd1iPt2iGwZ-eUVilmb1sRN6K8CjYPnYMkSVNqFfdAqbRqsq3N2k4
Message-ID: <CAMVAkEtf+Mek0yOBEnbTzLG6VKtrH0Ar=Ga8y5DpzUvHH04tww@mail.gmail.com>
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
