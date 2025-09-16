Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B9BE315D3B
	for <kernelci@lists.linux.dev>; Tue, 16 Sep 2025 14:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758034328; cv=none; b=p1LSsgaDh9CSitarZBgycNk/wrfYJksuR690ifk6L+/MnkqgYg36THnsZ24Kj9CIUvxcCPPnWnnCNK5j4ZECSl56XL1LfQlqz3kJ0id7fL8o2md7qk/G2zbG0vNjxwAFoeflO5Ru7VMFA9wQZbF9tLvFy+d96T7FyN4rxAD7IYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758034328; c=relaxed/simple;
	bh=Ov1mFh1LES1qs1zLeDAS9Njc8jwLeFI08Kes1TU4GRo=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=GYcmKl1IhrzGy0NxJNiuNKoW763XoCqHztxW3YY6lPH2NCL0/4BZXb+zLnt0SO9xYaWkbemsynj/k/b5UKPAzX8y5wJ7gK9NLCsGFL13IHkLFoiQCJrlVwO5nhzcEKVj+VI+3lko+z/vhPAJOZNgIo+MfVH7PQUa6+Mb11CL9ZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=profusion.mobi; spf=pass smtp.mailfrom=profusion.mobi; dkim=pass (2048-bit key) header.d=profusion.mobi header.i=@profusion.mobi header.b=TKUL20I4; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=profusion.mobi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=profusion.mobi
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=profusion.mobi header.i=@profusion.mobi header.b="TKUL20I4"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-57179617244so510536e87.1
        for <kernelci@lists.linux.dev>; Tue, 16 Sep 2025 07:52:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=profusion.mobi; s=google; t=1758034324; x=1758639124; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Ov1mFh1LES1qs1zLeDAS9Njc8jwLeFI08Kes1TU4GRo=;
        b=TKUL20I4NBXpn94eOAHDGL3H+UaDGzsB+UVSTXcNPaSs/BYnF+ILEjfsyPkDwV6gSs
         omtDATR4ez6umvKijfS7pssoQbjmgUCZIJONbTzw69JPy3W6x0CRID1H+ZlA7JnepHNk
         NvExQGWPD9n1LEvh09tuoa8tGLih4CJk9uQKRjWffK2n3Oh19kxjq3JRY+cjVV0JB0p/
         ekePziIYcKWkLgKVLr3j0XFEIl2NbzjLsN5uSG+4l+5sLKfCHftWs5lW1K4V0AADNCWr
         hjNHQZCZ7R7xb2kWU+qLMxU+fn30WMB2g8myJ9A40/VgS/xj6eGRNV+sJIFWyl/kjVbe
         rx3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758034324; x=1758639124;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ov1mFh1LES1qs1zLeDAS9Njc8jwLeFI08Kes1TU4GRo=;
        b=gBHF9Q7td9LQSwmN3aNsuiQ5vsE3RYekyTG/fDvjRNrUtJGw6llcfb8gWQooyiycLm
         0MSebVlkSv/3x7zF3uk64cuM8z3qr4AsdYcdloaNXDtX0ryioyhGMSlLBYmQTaUthp60
         9fzbK1RDJhPzzX1ZzixZlZppiixZxglXgnIMPg5yNGIpaE0PHxSkMOHDVu3HwSzk5h0W
         g8t5sCZ2e0NVKnGSzGtEvlGN9S4BmcK3k0aIHrWUaU87GdvzY6QnhytJ69HVQQ7gPHPO
         2MMTYwMyZninBRt5Z8AoFNWU6+AY92irph/UMiRfjfNJu97RSGNF4/hp3TiLVXFBbW3C
         YcCg==
X-Gm-Message-State: AOJu0Yx+4ypwhtniy05qvKx8KS2q8DrczTFaygz7nSI/vwKp2uJR5FO9
	gyp4lufg2mYTt5J7PaTLXq8hN5P+3WVYBYd61pf0rillOdGb0IE8BxYE1r8Il2Cv5KmUWeszgB6
	Sp8YywJN1wYa6/AdSGINCe0e/+wgdOj5pWZoICw93ZJji1xXaXcTe4YI=
X-Gm-Gg: ASbGncvoJ1dpgiU6nczL1TgRtA706e+CPu77n8jbUksuQ6Os3xBiWT1DNCnPgM5wsBu
	4RL2FUOuycfCOX/FGKvOil7i+DMHe9zTG5SVRlwBOirMShp1lQBFr/UKQMuGdn61FPVkaRLUr/5
	RCqH9q6+nIlMYxMuz8ZXe0SdjOnsFzAomE2abMAGOcDKU5ow+7Za3nMjriq9OGzUXr9UHEAG6nW
	YBC4RiUmQ==
X-Google-Smtp-Source: AGHT+IGL9utvBlYa4MoGqMLN4SuSpBpdyv0jVPlQ6zS1bWnRHtJgrtSf3vNZmOeI3WRlWzk4DD4mWYtJPhReoddBQgs=
X-Received: by 2002:a05:6512:2513:b0:55e:a69:f4a3 with SMTP id
 2adb3069b0e04-5704dd8eca5mr2386292e87.6.1758034323647; Tue, 16 Sep 2025
 07:52:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Marcelo Robert Santos <marcelo.santos@profusion.mobi>
Date: Tue, 16 Sep 2025 11:51:51 -0300
X-Gm-Features: AS18NWDfdRvXnQooFo0nebW8TWBqF-56hSWoswbuGdSRHivQ2jrFWTroOn1FRrY
Message-ID: <CAMVAkEvPbx9s9BMPOQCH6rGyC9KRkSLyU0CK+LzX+e+i_0h7ow@mail.gmail.com>
Subject: KernelCI Dashboard Report - September 01 - September 15, 2025
To: kernelci@lists.linux.dev
Cc: kernelci-webdashboard@groups.io
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello everyone,

We are back on track with our updates. Our database has been switched
from Google Cloud to Azure, but we are still in the moving process so
we haven=E2=80=99t disabled our use of GCloud yet. Apart from that, we have=
 a
couple of improvements, some bugfixes and we are preparing some
changes to the database already. Here are the changes in the last
weeks:

## Docs
- The documents for onboarding and backend were updated in order to be
clearer. [1]

## Improvements
- The Hardware Details page now has a better way of selecting related
trees, also supporting deselecting all trees in order to pick a
specific one to inspect. [2]
- A test coverage badge was added to the backend readme, showing our
progress towards covering 100% of the functions and methods of the
backend. [3]
- A small UI fix to test, build and issue details pages, where long
titles wouldn=E2=80=99t wrap their text - Thanks to @khanheric2003. [4]

## Bug Fixes
- The cache for tree listing entries was not working correctly,
allowing old checkouts to be shown instead of the most recent one. [5]
- When selecting the specific commit for a tree related to a hardware
in the hardware details pages, some commits were shown repeatedly. [6]
- Some very specific trees had the =E2=80=9C/=E2=80=9D character on their b=
ranch and
weren=E2=80=99t parsing correctly. [7]
- In order to keep our security, we updated a lot of packages on our
frontend, this led to the search bar not working, which was quickly
fixed. [8]
- While fixing the search bar, another bug was fixed where links were
being nested inside other links. [9]
- With our move to a new database, our GitHub CI was missing data for
its integration tests, but it was fixed. [10]

## Future Changes
We have some tests to do with our database now that we can manage it
directly with Django, starting with some simple new fields which might
speed up some endpoints. We are also moving our CI to a local DB
approach, meaning that it will be faster and more reliable to test on
every PR, including ones coming from forks. And on that note, we also
expect to increase our backend test coverage progressively, in order
to have a solid codebase.


## References
[1] https://github.com/kernelci/dashboard/issues/1471
[2] https://github.com/kernelci/dashboard/issues/614
[3] https://github.com/kernelci/dashboard/issues/1443
[4] https://github.com/kernelci/dashboard/issues/1434
[5] https://github.com/kernelci/dashboard/issues/1457
[6] https://github.com/kernelci/dashboard/issues/1445
[7] https://github.com/kernelci/dashboard/issues/1468
[8] https://github.com/kernelci/dashboard/issues/1466
[9] https://github.com/kernelci/dashboard/issues/1470
[10] https://github.com/kernelci/dashboard/issues/1455
