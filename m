Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC79B313552
	for <kernelci@lists.linux.dev>; Mon, 27 Oct 2025 16:32:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761582764; cv=none; b=BHkiX2CO/x3lvZAF52hPZnflrl2nHCu0E1NA52Wm6Rg9eBJWrHlu2UKdvUfzGeoct2ZJaIqDNfxOIftjkgyUthkBLro88/c/z3MAp2x0NcT9Qjg1eiVg1alq44Ko5W4LI5pjutQzPdlAMq1nU2dmAMwCs9bXyIFvq/bKtMWrP9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761582764; c=relaxed/simple;
	bh=spVLbbXm0mJN6uCFwaHu1Ex2WgMxTx9RR09K0MspXKU=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=ucbYqCTzbkLNzfUH033Ry25lVbwsusKduEE9Pkz9s8CMPQByQHJhGAho04Fn07Fc3ILadIvgpSdaCFfUvkbsJ9Yt+2LEQ9QAiw2A0QhuU2j9nu8e0M4igeh1i0gncNG+2SsWiTmRRxgJPgpbszruG5UaSQU8keMawRufNySnUj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=profusion.mobi; spf=pass smtp.mailfrom=profusion.mobi; dkim=pass (2048-bit key) header.d=profusion.mobi header.i=@profusion.mobi header.b=eZnxHhB2; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=profusion.mobi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=profusion.mobi
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=profusion.mobi header.i=@profusion.mobi header.b="eZnxHhB2"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-592f2f08168so370813e87.0
        for <kernelci@lists.linux.dev>; Mon, 27 Oct 2025 09:32:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=profusion.mobi; s=google; t=1761582760; x=1762187560; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=spVLbbXm0mJN6uCFwaHu1Ex2WgMxTx9RR09K0MspXKU=;
        b=eZnxHhB2D3tslQg/S166xvn+ITw5lS9RHkNqdKr4N3FFtznqwOjlO1078pen3m3FfO
         ha66lDcyuA91t3KNB8UQcahfzuMgeNEKP7vPo/hID//s0Y/HlLGXcNcufAjKFKpr+yVe
         3ZNS0glBC9sEZYCXE2+HynNmPmqDPtTk8LiwBm6tH3YtaAyHUufKtLTDydwJXfZZ/p0g
         OOP8lrac3UBu7TDpXWX7o+zkykp+Mgto86c6/IqlLLHaPxfIaO9PlJkbe9b26DfSepfY
         RTYXtVREnYGgBoztJBRC7tw0gIilakqYuUjTLhIdM86aWUrfCYjipGA5BaTnPPb2a6i8
         lsDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761582760; x=1762187560;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=spVLbbXm0mJN6uCFwaHu1Ex2WgMxTx9RR09K0MspXKU=;
        b=fvE+Pu5+XFw6AJJpT6uhEjKQ14feYcQ3zY9TCZhudLcEdRVy82mE/MDDpyhBZw1L/9
         B9xO6UlCaKVj+LRjck2i34WRc8klHcPtSN5Bo5GD3FUteV8Z2I2rMr49TGQDlCphO9W1
         HqPH1P1FAFNGyAPNjw7GNCWBZpJrjA8D2w1KoTmBgsYLGMwiKoXbL+lAaQVyQwVNeImi
         gbEcItF173QIHf1UP13OXxRAP6WTE1FFGO4OeuOdZhJeCz0GLikrd9C51aYt26+DbwnY
         FzOcMcBZb0PVewL0Kll0Yeq381eTzWqtCTbY6QxR2AHdsELbKBkkTzw3BzeX3KJgTV+x
         izNA==
X-Gm-Message-State: AOJu0Yz5Lsor+5ilCC9qnJsAZZkqhKbbuRjQKFev2dW68WhxxC7FmOAi
	+2FXQnSQ+fSnOa5F1fk2az/j15zEGvpTbWIfucoH53HlGj+8j+8vS93ia+6JJf5M/Ng78Ug9Iwm
	D5XCSp1hCeqUogZMjubIQxCLzW9p1W9Kybin0b+TSb9tjLfUWm5AoruE=
X-Gm-Gg: ASbGncvIXGFWL+Ji/8fpK72cGx5ZCWs1DwdgT2Lmpanj0bx0WLkzfCvJ13DkR3WQ57R
	6I8Ze/stv+UUuX18QsjIvMF0qpEBHjlzQkmxPQkUdMzqOT7QJYuvu/CqTzOr9/iYqH4RePZQvVN
	AAVpdqUSnGekurEUjmf7CcLXtHMWnzzq3Et+RX9je+AgRRuxLKLj1SWs57+E056W9fcj2SC83eL
	dTTeDrTJ/j/YlDjYPOgHQJUyNYp4TK0dpmDes6zZoE1DhDyMk2nk+Wrxkt8CS760JObcibU
X-Google-Smtp-Source: AGHT+IGhzMhxMKu184SX/jceHV1X6WkH2aFixzJV4ZT1Yb0WotZxYgXH/KEQvSaNAt7NtJSDm5ipfrsoJyAyh6H20lU=
X-Received: by 2002:a05:6512:ea6:b0:592:fe48:8df with SMTP id
 2adb3069b0e04-5930e99238fmr116708e87.1.1761582760114; Mon, 27 Oct 2025
 09:32:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Marcelo Robert Santos <marcelo.santos@profusion.mobi>
Date: Mon, 27 Oct 2025 13:32:29 -0300
X-Gm-Features: AWmQ_bnlwxUuLj_JTuLDmqDvKMrMHf_zGHi4vwXM9hsLoIrbIbK-qrly4verUjg
Message-ID: <CAMVAkEsZR04eR4D7BrzViDYi63eZysg4PnBci2Yksx3FuWX_pg@mail.gmail.com>
Subject: KernelCI Dashboard Report - October 14 - October 27, 2025
To: kernelci@lists.linux.dev
Cc: kernelci-webdashboard@groups.io
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello everyone,

In the last two weeks we have improved the performance of the
dashboard and paved the way for some more performance changes, apart
from that we also had a couple of bugfixes and improvements. Here are
the changes from our last 2-week sprint:

## Database
- Some hardware listing changes were tested, mainly about materialized
views, and they soon will be finished. [1]
- The Postgres index that was added manually for hardware listing is
now also added in the Django models. [2]

## Improvements
- Our Prometheus + Grafana performance dashboard now allows an
interval-based summary along with all-time metrics. [3]

## Bugfixes
- The backend coverage badge was not showing, but it was fixed and we
are currently at 53% coverage. [4]
- Microsoft=E2=80=99s email notification issue was a matter of not having
data. In order to prevent such issues in the future, its notifications
are now sent to the main mailing list as well. [5]

## Future Changes
We have better plans on how to improve the performance of the slowest
pages in the dashboard. We will still keep track of the coverage tests
and layout responsiveness. And in the future, we are having plans to
add more functionality to labs description and filtering.


## References
[1] - https://github.com/kernelci/dashboard/issues/1568
[2] - https://github.com/kernelci/dashboard/issues/1578
[3] - https://github.com/kernelci/dashboard/issues/1580
[4] - https://github.com/kernelci/dashboard/issues/1534
[5] - https://github.com/kernelci/dashboard/issues/1564
