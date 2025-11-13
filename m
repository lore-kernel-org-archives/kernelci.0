Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5AED3164A5
	for <kernelci@lists.linux.dev>; Thu, 13 Nov 2025 19:27:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763062078; cv=none; b=LSgmQhlongSuTFQG/IYqYgFDofyrJ37OgYoMuR4K1KWcBFdTbgxxDGIBo0MHAuF0I2dSYVt7rteWouqpd+uokr8ag2l92bv7kvSFiD6Im20e9AlxsXCmRjY+uLVrJzN8bRNpJYaQRoF+rhzuEdjK0QjyzYJOaEfxY5wrKVHCGSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763062078; c=relaxed/simple;
	bh=wk3K7nlcOLAQ+KLuqhaLeTDXRMjLPMZbQlTOtNP9Ah0=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=D2n3K3sIVtF9PPyjtjKDdLKUenLEwiX069tqvimagR9fqaU2Tj6rsPGtyUoWeYfqMe35BnO0bzRP2tfAiJVq7TBfYAaLLwWacGYKSvwUY4pxvRZUecAv25Q/hzAPOFiBuKy/l6ZWMswe1awSyrxKFY4FKHb4OE69UfBiyjNyfYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=profusion.mobi; spf=pass smtp.mailfrom=profusion.mobi; dkim=pass (2048-bit key) header.d=profusion.mobi header.i=@profusion.mobi header.b=NOL9+yza; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=profusion.mobi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=profusion.mobi
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=profusion.mobi header.i=@profusion.mobi header.b="NOL9+yza"
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-71d71bcab6fso12145827b3.0
        for <kernelci@lists.linux.dev>; Thu, 13 Nov 2025 11:27:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=profusion.mobi; s=google; t=1763062075; x=1763666875; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=wngkIyhKevT0w1rU+n+t+eJtTwU3GBiH7XXuKu5HSAY=;
        b=NOL9+yzalXSsWhkyj1SVqQjX/tJYpCHTeX+CDZa4JYLAPakPxefJYclBw7Di1Sh4uB
         fe8MDQFk19dcHFluIBBAAKiG+HHMPCt4p4Q+bP3SeoaTBweoWyogdj5ZGNaZw5IbhCU5
         B1fgS7kuyzk8LrQrGj9epvvFQmVT0XOZR5y6roBmGonlIy4ZWZV2Bk9LM5Vw9OWeuoh2
         ajsjtC2+n8MFoBUSrF3j8uToO6sV2TOYQXZRXVd/SML7MdDimJnGFzpSFKF6MuQKXFEu
         kifjPYL4tllJutvLq+ZCQ/WRK4jaAheZ2eG5qYmmZomxxPjYYnf+yC1tTLB58okslHVA
         dWUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763062075; x=1763666875;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wngkIyhKevT0w1rU+n+t+eJtTwU3GBiH7XXuKu5HSAY=;
        b=dY/AXTXJg64OcJMcorBvQdIZGVk55AvBA59EsUWzIl5ucNEHrSyUj9qNCiT5ftywJq
         J20I+mPb6Qlut2/TK8+r0jQ7B208qkAjPezu+uRcg14o2vdDJko+vIiNMWPddR5q+oVN
         uQp7mhn2RWeNSxht12MBq/uudaYK91ycZOhaxQFQI6Xn0uRBUbQK/AEemq0paxccSTRD
         g/iuA3Iu4ttPPmIlOwiVtF9vLZrbH8l9C8CG3GjEJvCdkXv6IoGJJocy9J7E91N+hGUw
         I2eJg+Y4igZDcM5hrIu+yFFOfwzzmL89hJR39227M8j/3JQTkB1Edb741QOB8vS3pfv1
         cW5w==
X-Gm-Message-State: AOJu0YwWiqPV3cBZue1vYLsbKbtOEknt3mKL4anpLqvwtX8wY5dNBO9t
	i7o19IVOlXVrlTQ+OzB84p+KKlgKecfgHXKwx7iSIfJKj9hn0N+gxItlIClEJbtVwLxo5wjcP4E
	R8o8lNhtFakkNh41DcrkPwzz3i8UVHfpKKsFv++mol7lIrm20MN19Zn9XOA==
X-Gm-Gg: ASbGnctZr0iJdeR74lbA0ZWBA+RIXmYxa4JFimtMPdUZI7qFHleJWFzTLGTwUnkdy+W
	moGa59sEc6gK2bUno6tvpa9g3Z10V4aV8V4G5sMgOCPwTtfG75JJUjuownMrmipSgzpGtg2AHcK
	6hLL1JNaEx/SAahW5S2/MuQkgFBzqRMADjxjLx2xHs2rESWD299B3scioUk1/2xhf9VexQC3Eu/
	psdvGv/m6ZRsCXynjAprIedkOeiCuSs2sp9AGy/Md4ozcUUpSjl48b9lCUrF8VGysTr5vbf
X-Google-Smtp-Source: AGHT+IEYKnYQT5PGtK89tIsCQSB9MHQqJYwk+KTGN2jOqm5piXOHX+G0qPSgrE/hlsoAiY8BSmTAh73TB9j9tuSGTpc=
X-Received: by 2002:a05:690c:a0aa:10b0:786:655e:8641 with SMTP id
 00721157ae682-78929c26eddmr5874807b3.0.1763062075457; Thu, 13 Nov 2025
 11:27:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Gustavo Flores <gustavo.flores@profusion.mobi>
Date: Thu, 13 Nov 2025 16:27:44 -0300
X-Gm-Features: AWmQ_bnd6uOwjUBsrWBi0Td0tj7kbTHGGA97jvzVEKGe_Y_5R46OWJOVSIvIBpE
Message-ID: <CAB31pV=6OZ7VQvZAU8CjdhJww_1RMpH7jZERVMrdBnuqn--mhA@mail.gmail.com>
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
