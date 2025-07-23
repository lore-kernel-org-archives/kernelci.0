Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B973025A34F
	for <kernelci@lists.linux.dev>; Wed, 23 Jul 2025 12:20:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753273262; cv=none; b=bFDZOuOWKydGAg9nDIU8KxFewSsJ53ZjFG+4L1kl1qumpQFPkXfR0uWBWVzIBf0L7GJ9lp9iYBAryxprE3Wy9FO8dYHums8ngeBqIVcy5BFbcmlpQddrbgiOHxgh4pggpQ8ipUOFLgkFqLXpR40IBziM/K90YsWnI1WbAN67f8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753273262; c=relaxed/simple;
	bh=vIMmJBRo8TVQ31FU3D1kT+BWNd2R8ra0pGGn6A2IzxI=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=LHwK6vP3aVJyyuTkLk+/lQInE3CaTBviExfwH+l40Kn+1p9RxwJyZR6LuBLI4wI02z5S9rWwgZhxd0OLbRL3LXo4cMiaId1A3YOjWzHL8SRzzLTrlU8BAzo7Tovr5l//g+AbUUIyp7cj9et9Hlnwl6Zw4cCDb51VVHON81O63SY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=profusion.mobi; spf=pass smtp.mailfrom=profusion.mobi; dkim=pass (2048-bit key) header.d=profusion.mobi header.i=@profusion.mobi header.b=dBeMFtnV; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=profusion.mobi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=profusion.mobi
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=profusion.mobi header.i=@profusion.mobi header.b="dBeMFtnV"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5550bb2787dso290966e87.1
        for <kernelci@lists.linux.dev>; Wed, 23 Jul 2025 05:20:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=profusion.mobi; s=google; t=1753273257; x=1753878057; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=vIMmJBRo8TVQ31FU3D1kT+BWNd2R8ra0pGGn6A2IzxI=;
        b=dBeMFtnVx78WzqUyTk4cW37DHyxh9Nj9oRxC7BuCLFm4jsYn7eZn4AJE2xalask2XE
         HzCNDnLAZTwIlxD5p+GwvaeYEBkYysLJzpxxLa7D1KbfdBxicnZG+vhHn1C18bGvKyR5
         KN7UnVcarjCfCTOOOPoWKVlieHyCoK5eEiZsK1Bu6qMSzWpS89EliqoHJJSCh9QQotpo
         A9DuwOIhKAKiYp68gOdda1wcH9p313dHhWoW2Amh22dqU8QTsQvEqf8VYZ0ZwSUQlcdh
         SqAfcU9QVJ5AAGGBq+TyBRzyUnoMfg7n/RVjsOHWmGl/3b2I2DcmJvErC3QzLRPCvofe
         UV1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753273257; x=1753878057;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vIMmJBRo8TVQ31FU3D1kT+BWNd2R8ra0pGGn6A2IzxI=;
        b=HP19v63vhB4yVTWuay+HmDtiY+uKU+fh/EqhYf8AAQtICPVT2/4s1AQvvAd5AzU6iJ
         ggxSHbSNKeGqFMPBj6bAqETP3eqnjkl1mdmm9N86pzXMiJdsoJihZzw7Fwdp4cWnbL3K
         Ou861aPUUsi1sy+YKL7Pmpd2IJJ3+2s5Bner86IzPHfb4wD+ZlM84AGwRe3nnWv9ZjAh
         aBK5rEOCy8ByTHtEkqqeFbxJDiG+D589JT6aZBjvIjAgPdl6z8C4dZ98IjRlIQfLHNa+
         KydxKdXffgX6zW3VgSRQZ2o+Phdnu4OfsB3/y1YmgEBF1cV53JkONEH6PEimTxbOuqvw
         ycnQ==
X-Gm-Message-State: AOJu0YxAz9BfT1zOzHKE8WLYFPh0jSss45HrR0nj/B9CRChhJH6fSSYs
	Ln4KM1nXDk1otxHfFza7IIXML7e7zsIwJ7bJ4LlW1PC4HEYl/wbkzrOVLbZlTDRWIB4nZk0Cz+J
	3YIteg6CUOYP7kIGz7H8+kVXBP5QLoBmYvF41mDedWtDD7deR1/+4qDsisg==
X-Gm-Gg: ASbGnctIs4eaLwpPHlZ0572TGZ6i1Qg5C8PkxrYEw08Bii2MbM/j8TLBeNz7KiSSjgo
	hAWvomqrv/haQeyMZP0e6w9+HDlwX+awbd9IdBnjGSnLyYqbpUdRIFNexe1FwTXT3IUTcsvX9Jy
	UpYV3w/Xdpv/a3sQlTbYByuSmtOc25VEL3WomQDWy3rLsK99qiG8CUKzRsdJN7yLi4Z4u5sDQ8O
	Su3Jmun
X-Google-Smtp-Source: AGHT+IHTkZ6LUTsYufShXLtEnVBqcw8pbIcQ76UdsaVTz9LZ8y1nDhY1UkFE8VZAzE2SpFVCZICR42TgQxXIKmqWS/U=
X-Received: by 2002:a05:6512:4022:b0:553:2dea:705a with SMTP id
 2adb3069b0e04-55a5137a191mr304055e87.11.1753273257246; Wed, 23 Jul 2025
 05:20:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Marcelo Robert Santos <marcelo.santos@profusion.mobi>
Date: Wed, 23 Jul 2025 09:20:46 -0300
X-Gm-Features: Ac12FXwco37jeV5cn-I1EG-nEnu_QUPUPv4qxJF4bdmcYWXc8JW6BKf0fZVanAo
Message-ID: <CAMVAkEt=6dCgg2TtV_kZ-Yi_H1MTS5UWEW+5Sr4FCocUhzWcWA@mail.gmail.com>
Subject: KernelCI Dashboard Report - July 9 - July 23, 2025
To: kernelci@lists.linux.dev
Cc: kernelci-webdashboard@groups.io
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello everyone,

Here are the changes in the last sprint:


## Database changes

- A new dashboard database is being created to replace the current
PostgreSQL deployment from KCIDB. The new database will be used to try
out a better organization and schema for the dashboard. Meanwhile,
*kcidb will continue to be used with no changes, and no data will be
lost*. [1]
- In order to have a smoother transition, the models in the dashboard
were synced to kcidb. [2]
- The test/build log excerpt is already supporting the new format of a
link to the stored excerpt. [3]


## Improvements

- On tree endpoints, it is now possible to use git commit tags instead
of git commit hashes. In the frontend they will respond correctly but
it still defaults to the commit hash. [4]
- The origins endpoint now has a time limit, hiding origins without
any checkouts in the past 30 days, a number which can be changed with
query parameters. [5]
- Kci-summary endpoint was renamed to tree-report. [6]


## Bugfixes

- The breadcrumb component was breaking with the new tree details url,
now it will maintain the shorter url between pages. [7]
- The path parameter in the kci-summary (now tree-report) endpoint was
not parsing strings properly. [8]
- The use of a different query in tree-report was allowing for an exit
without returning any error message. [9]
- Tree listing and issue listing endpoints weren=E2=80=99t grabbing the
default interval_in_days. [10]


## Notifications

- Added test_report action for manual test reporting [11]
- Replaced gmail api with SMTP for email sending [12]
Other improvements in the email structure


## Future changes

As we move forward, we plan on focusing a bit more on the database
changes, providing more solid and faster results to all users. This
will require a careful study of the technologies and interactions
involved, but will lead to a better experience in the dashboard.

References
[1] https://github.com/kernelci/dashboard/issues/1332
[2] https://github.com/kernelci/dashboard/issues/1342
[3] https://github.com/kernelci/dashboard/issues/1331
[4] https://github.com/kernelci/dashboard/issues/1320
[5] https://github.com/kernelci/dashboard/issues/1322
[6] https://github.com/kernelci/dashboard/issues/1344
[7] https://github.com/kernelci/dashboard/issues/1314
[8] https://github.com/kernelci/dashboard/issues/1329
[9] https://github.com/kernelci/dashboard/issues/1328
[10] https://github.com/kernelci/dashboard/issues/1340
[11] https://github.com/kernelci/dashboard/pull/1354
[12] https://github.com/kernelci/dashboard/pull/1348
