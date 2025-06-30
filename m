Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2135924503E
	for <kernelci@lists.linux.dev>; Mon, 30 Jun 2025 11:27:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751282879; cv=none; b=tPgAM4z1ooSevE8UvUd1p678J7nk+vuXgW65Sk7UrdLGwYczGisilvQETh2aXekWS6xEk9wnDr61eWTM6h1Rctp1PEG3BfnR4GjoTuHkOGn99n74C7xBsZRmJCS17qjlSFmtiHGLn2VwSQVJ/Cn+GdtQ2OLZrYEg41MTlHmGCc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751282879; c=relaxed/simple;
	bh=PkA1sgdMHtl1Uz3A4r28hbWiyGj8MS17LO7uYz3zm2Q=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=qmDnMY2+Ugtr/LM2Wd1iNcD1ETf9xDWlrow/zbr54GDESvGZNueFnCzxbC7rbVRywZo+Eo5QVXK5zMZ+1f1ND2AcodWTqP70T0NEKwaKnHUM7fkO20SRLELHaYfufKxBMqKV0ErWqlLZhkat3MOXXlS+BN7V/euv58XOtGRydMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=profusion.mobi; spf=pass smtp.mailfrom=profusion.mobi; dkim=pass (2048-bit key) header.d=profusion.mobi header.i=@profusion.mobi header.b=MwGDs1+m; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=profusion.mobi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=profusion.mobi
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=profusion.mobi header.i=@profusion.mobi header.b="MwGDs1+m"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-553b7a3af9aso221669e87.2
        for <kernelci@lists.linux.dev>; Mon, 30 Jun 2025 04:27:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=profusion.mobi; s=google; t=1751282875; x=1751887675; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=PkA1sgdMHtl1Uz3A4r28hbWiyGj8MS17LO7uYz3zm2Q=;
        b=MwGDs1+mPM1QzHCJpoiha9BCLrh2Q9ZbAnzA7+OoQcR1jOvufUb8fyWHbjBAdmTOs3
         XiRD218ztcCjQMe3uSeVfuGpxQ6/y+iHPG1HOkDlA0zrHv2TDdC+c0XHgwHcsr+JnC98
         WxsxDTdRlsHy1g+d42pIWyDHGstkpy3WUsX3JSIfZ+qwLTKwgKZNoT3Xqs2E0Qifwd/R
         tq2WPywGJMS2tX5+DyTzyaGNe4E8OFYRKZNT+lHsYJj75CffCQyeb6T+e7VaMhnjqXs2
         yBIBVD4CK1vKKxluBS/8iDhZG41is37oAef5oS43cS8j/Utu3MolitZbdTtUT1Z7ldpw
         On8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751282875; x=1751887675;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PkA1sgdMHtl1Uz3A4r28hbWiyGj8MS17LO7uYz3zm2Q=;
        b=TrzqknlWW5LiH0HjIi5EE7t6bxMX+0X/jCLriA6wt7izEGXQRnUoxvqLl54HltF16l
         YOzjQ4aBd8/ryDewIWGHPVhK60ECVcXQx5lOcD/pmTxQk7hwaBiB7MPIGFL7l8A4ntA7
         f4okjTHZwOkCVQ3hnAmQ5ejXJNGl7xdj0wvniGqBu/8f4sn6icNazkfYVkTPRzKAILjq
         aCDLpjWV8YLt2Bt4cKXOjKv47VK0Cs9QkTvlq1W0OfCaQAN6Iur9AKKxKL4iBjDUx/9O
         hzLIh7NwCU8MxsztOprTG2xofVbdhriNYu0LgtNcrMPlR18BRyP27/tvuaYpugkMxO+f
         MLNg==
X-Gm-Message-State: AOJu0YybyB8b+OZQ6NoOsZ3az47fdatIgmPi1p4PtDU6/aAwbZQNzYou
	Ed45VrofwqwNK0UAErLfGLBV9GyN8XzMviHdJ8gUhb8MqNUxN+omx/WBv7qhZ+bT1WCmmKcIgPB
	rwLhdN2FzNmNSxrWzg+PinrGlFkSR66BKPvwSar3Hh6GxjjA0UGsYxYQ=
X-Gm-Gg: ASbGncshfOqhw93dtuiGPA1GNtw+SVFM8j/B9Ir3iy7yV1qAVYR+NiWD/KOeszrlXJj
	jibz9lr4eDcQNQIZsZN7so07aWzAAeYLNlbtgGabRtXwfWOEgm4TIkhzXb+GQxM447lrqtl/+H9
	3OgvSgE4c2CAF+ouTUSATjUMn5ZfSFUp2AFRlc/+mhUJOClg==
X-Google-Smtp-Source: AGHT+IHVIIfz2J2rJ7fAGS/fVpdzZ5TB/PL5Vwoe/pof13+lGBJC1xsFkCtQysZuCUynfO3bcQskhCA+IdHtYL43yn8=
X-Received: by 2002:a05:6512:1056:b0:553:d12c:feff with SMTP id
 2adb3069b0e04-555133ee18cmr836124e87.9.1751282874398; Mon, 30 Jun 2025
 04:27:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Marcelo Robert Santos <marcelo.santos@profusion.mobi>
Date: Mon, 30 Jun 2025 08:27:41 -0300
X-Gm-Features: Ac12FXwzPxU3W7j6hodjQbJoMfzBW30LabqaeBhfgQeupQrBA7EbbZ39EeiIiJo
Message-ID: <CAMVAkEt8GBiWnh=BUd9oE6pMJU0Leg7vxcX8xDq5RGv-Hs+HgQ@mail.gmail.com>
Subject: KernelCI Dashboard Report - June 11 - June 26
To: kernelci@lists.linux.dev
Cc: kernelci-webdashboard@groups.io
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello everyone, here is another summary of the changes in the KernelCI
web dashboard with the improvements and bug fixes from the last weeks.

One of the big improvements that we have in this new release is that
the urls for the tree pages got much shorter, improving the
readability and shareability of those pages. The previous, long urls
are still supported, so older links will not break. Whenever a tree
has a defined tree_name and git_repository_branch, it will use the
shorter url, so we encourage maintainers to give some care to these
fields.

Other improvements include adding a filter for boot and test result
origins within a single tree, having a more precise origin filter for
hardware, and more.

# Improvements

* The tree details page now has a much shorter url when possible. For
trees that have tree name and branch well defined, you can now access
the details of that tree through
d.kernelci.org/tree/tree_name/branch/commit_hash [1]
* Added origin card by each tab in the tree details page, also
allowing filtering by the origin of each tab [2].
* Reworked hardware listing to make the origin filter affect the tests
themselves, and not the checkout that they relate to [3].
* Added all test origins to the origin selector of hardware pages [4].
* Removed issues where all their incidents are related to nonexistent
checkouts [5].
* Removed the hardware label for the build log viewer sheet [6]

# Bugfixes

* Renamed tree and issue listing endpoint parameters, making them
follow the snake case used in the backend as a whole [7].
* The log excerpt of an issue in the issue details page didn=E2=80=99t have=
 a
height limit, now it has a scroll [8]

References:
[1] https://github.com/kernelci/dashboard/issues/1281
[2] https://github.com/kernelci/dashboard/issues/1251
[3] https://github.com/kernelci/dashboard/issues/1280
[4] https://github.com/kernelci/dashboard/issues/1242
[5] https://github.com/kernelci/dashboard/issues/1279
[6] https://github.com/kernelci/dashboard/issues/1283
[7] https://github.com/kernelci/dashboard/issues/1287
[8] https://github.com/kernelci/dashboard/issues/114
