Received: from mail-yx1-f43.google.com (mail-yx1-f43.google.com [74.125.224.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23AEA231C91
	for <kernelci@lists.linux.dev>; Tue, 25 Nov 2025 19:54:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764100468; cv=none; b=ffugOGQy86t3spEHjzRNyfk3RxXAYtZeAkkhZ502yOJYPWMuTzd3xdg+5zfA7tG5YVccuLqOCBb1qExR3pcyDshgjHeh8PtFscLvY1EUm9rFx+utyjXwpgH+64DFyGfLsIuMG5Z3eEZPoIxeTcx0tlSxJB66IlK+du/wDyyRfbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764100468; c=relaxed/simple;
	bh=vFDNG/h/X7DPhivwyU6itGgeAXTDimGTAwKewzeyZYk=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=INmBWjdyR/YPvMWYpdQbSxLgHnDvg9WFyE5yx4fRC79PAATinoMN2RbPmBVuN3cRm7MzZ2ikOs18QkDPqguB4dcDjQkGXRPLgc9q5y1UY7sGLaHXxBMGDCfMQxb6qF5wiRCaFfFJ7zJq/r+Ew3XfM5PIFuLVAyF1yrxgUV7njn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=profusion.mobi; spf=pass smtp.mailfrom=profusion.mobi; dkim=pass (2048-bit key) header.d=profusion.mobi header.i=@profusion.mobi header.b=G1sBA+9K; arc=none smtp.client-ip=74.125.224.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=profusion.mobi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=profusion.mobi
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=profusion.mobi header.i=@profusion.mobi header.b="G1sBA+9K"
Received: by mail-yx1-f43.google.com with SMTP id 956f58d0204a3-63fc8c337f2so5733256d50.0
        for <kernelci@lists.linux.dev>; Tue, 25 Nov 2025 11:54:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=profusion.mobi; s=google; t=1764100465; x=1764705265; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=vFDNG/h/X7DPhivwyU6itGgeAXTDimGTAwKewzeyZYk=;
        b=G1sBA+9KtZ8O9jABWwfN3T9+Ubpm3CC5XaT68Fif80G+B8iA5gMZmDGkNvJvqIufPn
         rIJdYTLi3YTAG7Ap2Mgcyo5S20bRDIyK+sXOLYvuaNfkn5+plsaRpj0GOLrYSXEmlftF
         HzjPDM7SaNtWE1UYHsoZ2r+A/B4ZWVF3tjd5ZixkRJrou2pr5c0VB2+x7UMeV48O4gtd
         Ic9LYdbQYVGGEZ0aUqwRxV7Tj+AcHSzVreg54JBIZsCLQlX48Qw8aEIhd9MH4orSQxyx
         MeQkJBkAbaVYu4iFFFPsa5sGS/vVdLYNEbLuBm0td4EvENYCcDwyX25nVORSwX2JJqCj
         Mvzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764100465; x=1764705265;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vFDNG/h/X7DPhivwyU6itGgeAXTDimGTAwKewzeyZYk=;
        b=Z/EiE8eKwSckp6jsxUlz1L+qgMhRQqzufQiNscZd9KnqzvrLvwZ+aks/Las5c6xdQD
         y110p4mf9aYH3883Qm2ygYYEnn5jIxKkXpy8jipuuQ0XsvoPau00Yjb3i6tJCFclRjGZ
         OivMwxwVf/cgorFOyleuLlZ+FVAK4fVgxOcPoqfGFS6zFS4QL0ZtUGq4BIKdQmx9iLCr
         IqL1Xn6EbceLZlUBSLbcPlzKmGVB0VYGTlaOUnZvAYk0EtnjlKGUzQZmLiJeeWM8tYD3
         bVvBo10ho8iYpCNRvp5QcP/8EEQ61Lf7NUIhhFWr2Lbd84P4TUrGp/sNyJA0CWJSoaY8
         kWVA==
X-Gm-Message-State: AOJu0Yyiooq/gUeEtrR6r4phZgz5Tgpz/ZN741RcaynlAWF0Opa+yb3B
	1bpkzynJI7JZLNZoLqN8FUDUZpTXe/fA2/j8rz7JY3rx4+aRBncQ3XVOZo01drPBdw32hL7eyJF
	MW7J6xAhILBVQ0KCAKNaD1m1UoeWdhOcbvbS+blcwsdFdU2s5FC1NqB2VjA==
X-Gm-Gg: ASbGncuEch/ViHJfXrgaKcb4rp1o7BYy2cAQ/RpSqxHgwJmOemFDqJiG2/NTOoApQeZ
	3Dsw4kapXq7v1mB6Sj8L/zx1kgz/YaqmN4Kj3AlP0vNW/8pKtbEFtimOzC8wqZCTzFVb1YoszHS
	IhrvlMBDDNn8eeoLJ/qZc5a/oW3NtDMFs66ZuvsFmxZ1GHdqOUlBAV92eIwwBYg5oQ4ePYOxcBG
	7umaIDSTOmGrR/HkMwGKc9M1hxYnrnd24HaIQvyytgSmUfjESUQo1ei5VwF9IbPgjf6q7TLkwKX
	tUC/1jU=
X-Google-Smtp-Source: AGHT+IHneWw0rhdcoY8OmZ+TbOesa96xCeZV9eC95CR1Ty+GnKhxo9cSlsaPQWIuRdIyy3bvwA2CCq++xL37oc6qccc=
X-Received: by 2002:a05:690c:a9e:b0:786:5712:46b8 with SMTP id
 00721157ae682-78ab6d6cefdmr66746917b3.5.1764100464876; Tue, 25 Nov 2025
 11:54:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Gustavo Flores <gustavo.flores@profusion.mobi>
Date: Tue, 25 Nov 2025 16:54:13 -0300
X-Gm-Features: AWmQ_bnR4NrGXciUiYnhevxpiBEQQqWc_in3EKKghnulUGSkT99DuNGZeseWSr0
Message-ID: <CAB31pVny9f8afDoCb7qUGQsCk4tEWPEiQvfd1F5SJYnHYK9qgQ@mail.gmail.com>
Subject: KernelCI Dashboard Report - November 10 - November 21, 2025
To: kernelci@lists.linux.dev
Cc: kernelci-webdashboard@groups.io
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello everyone,

Over the last two weeks we focused on extending Labs visibility in the
dashboard, improving notifications and reporting around hardware
activity, and continuing to strengthen our test coverage across
backend helpers, ingester flows, and query functions. We also invested
in performance benchmarking for the ingester. Here are the changes
from the last two weeks:

## Notifications

- Added a new `hardware_summary` notification action. [1]

## Labs

- Added a test lab column across hardware and test related details and
tables. [2]
- Added a build lab column to the builds table. [3]

## Testing

- Added unit tests for multiple query functions (builds, checkouts,
hardware, issues, notifications, tests, and trees). [4]
- Introduced performance benchmarking tests for the ingester. [5]
- Added unit tests for process_submissions helpers, ingester main
functions, and log_excerpt utilities with fixtures. [6][7][8]

## Improvements

- Removed old Grafana references from documentation, management
command templates, and the dashboard side menu to reflect the current
monitoring setup. [9]

## Bugfixes

- Corrected the cache refresh interval used by the tree view. [10]

## Future Changes

For the next weeks we=E2=80=99ll be working on improving Django ingester
reliability through end-to-end tests and extending KernelCI metrics


## References

[1] - https://github.com/kernelci/dashboard/pull/1610
[2] - https://github.com/kernelci/dashboard/pull/1612
[3] - https://github.com/kernelci/dashboard/pull/1608
[4] - https://github.com/kernelci/dashboard/pull/1609
[5] - https://github.com/kernelci/dashboard/pull/1606
[6] - https://github.com/kernelci/dashboard/pull/1607
[7] - https://github.com/kernelci/dashboard/pull/1598
[8] - https://github.com/kernelci/dashboard/pull/1593
[9] - https://github.com/kernelci/dashboard/pull/1621
[10] - https://github.com/kernelci/dashboard/pull/1628
