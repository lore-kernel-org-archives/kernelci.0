Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8990238D3A
	for <kernelci@lists.linux.dev>; Tue, 30 Sep 2025 14:11:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759241483; cv=none; b=APvV8G3HhSO3HvkY3w4QeN5nbin9qpVqp9JX93XZ+xwNDpRvvrbq9VSLRQiW1oLClLqOuyLUXTfFRJxP0hkZb6ixtBy21707KIU5ryHqUdnQq8/+rxkoPrrZ75DTk1XnErqrE8nwj68qPdxQPAMFOOhsmyi7Zf0WjPJRaJ9kJbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759241483; c=relaxed/simple;
	bh=+TLmCVrx2ggdmSyq5fC7IDZBivnDN6hheXndoz73nzo=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=esOUBy4K/jvg0hHdyGLmyA5GsaCnMwlex06nm0Bmzw0UPxP9J0k6ECmLOAiwrYN3dJgEz1qnkoxDCjPZ3djw9DcFO+Br44PLctT7KxetnFSkEhyY0Ob0KXp1Z3zgWheU3tdQrXDHHkBbDoWj1aN55WwsMbYn4KmTum8Wou+dB5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=profusion.mobi; spf=pass smtp.mailfrom=profusion.mobi; dkim=pass (2048-bit key) header.d=profusion.mobi header.i=@profusion.mobi header.b=JB8WmPQ3; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=profusion.mobi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=profusion.mobi
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=profusion.mobi header.i=@profusion.mobi header.b="JB8WmPQ3"
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-3639ddb655bso617371fa.3
        for <kernelci@lists.linux.dev>; Tue, 30 Sep 2025 07:11:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=profusion.mobi; s=google; t=1759241478; x=1759846278; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=+TLmCVrx2ggdmSyq5fC7IDZBivnDN6hheXndoz73nzo=;
        b=JB8WmPQ3+27LNinGPf28LL7jGCoKnU91B34Zesi3rEONqRp5dg6oSRWh6n1RpfPDfk
         6EujeTGPZmpsNgHbCgmWhxHwLGA7tqSTt342vku6qthFd34V558GzjknHFUfSYhyPt6Y
         FKVopTW/YY49mNxujG7rOO2q3qSauPX/hn6RBVUQ91Kk0UVf79RDYpdtpST7pYh54Q/L
         YiRJ66jYKOLOoxv5wqOOG9oAx9f+AzF8dt0fmXvmR++PsbhOwW1A6QC3OnJmEId2H681
         HOofWv9ruYXsnMnvvCdV6Ay0Hnwv8z31pm2f6431ZzKZsvK03s/Z9yWhMB2W0NvBVNg3
         7XXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759241478; x=1759846278;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+TLmCVrx2ggdmSyq5fC7IDZBivnDN6hheXndoz73nzo=;
        b=ARqj8vSLsVPs9KwnsWaQWmDROOpPvNZka4g8UU5bFcMYDJgXqH9yfMIvRC1T0JhP22
         X/hDgThOFTRaw4vHgd2HihY4hlbvZBeIu8MtN5u5A3skXVg106cf6I+RozMQeeMeLyn7
         Vbq+d6ZJwt/aiR8biRUBhkmUiWas1yKORlS93Tj8HpT6pr6ikOcz+ocwLM9CjjIGr800
         KcRzTknRyPWU+JB//4g8bLCUFYGC+i7JkDQ+f4V7d6yTa0uzGXwgE5/ulreHXuz7UH2g
         eybPsmnMBeuba7Tpl8mvvIKkliptOT+wWC5YvJ1Mz6aQT3LSgaG/r9fmS/XTZIOrLUIO
         BzMA==
X-Gm-Message-State: AOJu0YxUMnruOl+UIjaYUAdME3vNT+8YGSUTl68Y78/NGcuPu2nWAADV
	26oCmv1DDBtShi23VdYUvw+3jRdY6ZAM4cLi3GLBr3jbIpH0rZ+slh5f88xSuPuR0cM66DBj5Ks
	nEcZUi6bXTSNctf3it9TYGU/+sTM0UGH1JrTx9xBbnBI4bnIBvoeuqzw=
X-Gm-Gg: ASbGncs0IRKozbkykc4w8zX7/tq76/EfPS0ubQatTkXVRAZTKVXhcQ8zYCd4DklzUZH
	Jh+O2K3vWFaSnSUs39vf9hWOprfi1lSsUjJdegHtq6IrHS2+xRBb2sBdfgyVFo+f31vQ8A1Y+Q2
	3DHiFc8Ops/dDcMc04jdJg+HztYS72BoEEf6cwcMJOhzJjQZszK2jw8yVUTE+T4dTS8+BWjtN8M
	jBeRowLwcVEQ+4q7v2eVRNbQ4QANvDaSLkl3W2f5jg=
X-Google-Smtp-Source: AGHT+IErC3ZXXujBGz4MK+nH6O9ZXsVdBdsTxiGPKj/lSTmYOI7OE82chGhm6tRZISPhZMz1sjfsNsEWWrb9Vv5rWDs=
X-Received: by 2002:a05:651c:505:b0:369:c4cd:1b55 with SMTP id
 38308e7fff4ca-36f7e58a690mr37410151fa.3.1759241478212; Tue, 30 Sep 2025
 07:11:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Marcelo Robert Santos <marcelo.santos@profusion.mobi>
Date: Tue, 30 Sep 2025 11:11:06 -0300
X-Gm-Features: AS18NWDAAlUt4tjkZ4yBlIy5JwR7MOnSHQwSUZe6GPmeyV9kdjcdmCvzzKVuYDM
Message-ID: <CAMVAkEu4VvZfMyfLL9D9rjXOvU0qKA8s2Bbrhfwx761qp=E7xQ@mail.gmail.com>
Subject: KernelCI Dashboard Report - September 15 - September 30, 2025
To: kernelci@lists.linux.dev
Cc: kernelci-webdashboard@groups.io
Content-Type: text/plain; charset="UTF-8"

Hello everyone,

In the last two weeks we had improvements for the stability of the
dashboard, as well as other features and bugfixes. Here are the
changes from our last 2-week sprint, all of them are already available
in production:

## Improvements
- Integration tests now use a local database, putting less strain in
the production database and fixing CI runs on PRs from forks - [1]
- TreeLatest and TreeLatestHash endpoints were combined, making the
commit_hash an optional query parameter - [2]
- Added origin field to the test and build details pages for more
information - [3]
- More unit tests were made to improve our backend coverage, including
several files - [4] [5] [6]
- The legend for the status graph now has a better layout for small
screens - [7]

## Bugfixes
- Issues now show the version of their first incident, and also show
incidents of non existing tests - [8]
- Notifications had stopped working, but were fixed at the beginning
of this sprint

## Future Changes
We plan on giving more stability and performance to the database,
starting with basic improvements such as database indexes and then
experimenting with table denormalization, where what you see in the
frontend will have a direct correlation on the database, making the
queries faster. Apart from that, we will continue working on improving
the test coverage of the backend, on the frontend support for smaller
screen sizes, and on other specific issues.


## References
[1] - https://github.com/kernelci/dashboard/issues/1397
[2] - https://github.com/kernelci/dashboard/issues/1476
[3] - https://github.com/kernelci/dashboard/issues/1490
[4] - https://github.com/kernelci/dashboard/issues/1495
[5] - https://github.com/kernelci/dashboard/issues/1499
[6] - https://github.com/kernelci/dashboard/issues/1518
[7] - https://github.com/kernelci/dashboard/issues/1425
[8] - https://github.com/kernelci/dashboard/issues/1290
