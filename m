Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 692651DFD8B
	for <kernelci@lists.linux.dev>; Thu,  4 Sep 2025 19:15:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757013321; cv=none; b=J+lioC21YXsbWMmyTyfke64WUinJDXRjercoyHLx49slMYjtR3CDXSCn4gogDvIyKbnzY9INthGVip3vuqrYjMHx2voEexPh4AE8JSYRXVP2hgUsHB6n8kiC3lJhAVrNtIhrbRl0b9Rx4wB163jWVpng5t85N603EY5VGTUdF4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757013321; c=relaxed/simple;
	bh=72VIeQCXr4qiU6r38G6eLyylT0RDYa+dNJTmbfklGsE=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=NJmvKJoQMzeN8MuwqKdald2BcY/b01V7z7eYOx2Cn0zXju8gKid8VaUN5OQWa6pwtjtTBO3EichMHoLu8+OndATnyAi2dqPIqVb/0nanlb5gt43+54eN6lYxuoldCrM5Gg7DMBB77j3EI30nzHvQNrkFu9QVdGObkgF0Qkc1OsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=profusion.mobi; spf=pass smtp.mailfrom=profusion.mobi; dkim=pass (2048-bit key) header.d=profusion.mobi header.i=@profusion.mobi header.b=Km8GmHwL; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=profusion.mobi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=profusion.mobi
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=profusion.mobi header.i=@profusion.mobi header.b="Km8GmHwL"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-55f75e85dfeso176983e87.3
        for <kernelci@lists.linux.dev>; Thu, 04 Sep 2025 12:15:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=profusion.mobi; s=google; t=1757013317; x=1757618117; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=72VIeQCXr4qiU6r38G6eLyylT0RDYa+dNJTmbfklGsE=;
        b=Km8GmHwLyOIbDCeCHmRVKMZHic3qF66S4S9d86A+jKoMDfsTmV9hFFUqn7RQUZVybE
         YovQ6b9U6nkMsjopO0MaMsVziJ/tWhjYHTAFfsc0ApiiKf2W/fmZyINP3vY6e1bj7d/u
         gCj+Z5cH+wiZiqZyYenvZMNsqLNaIx+ibAp+lbkhdtLD6KBI4RhzTWSEzquB2U3DXfsZ
         4QXTz7lV+3G6fI3RNA2RfLrKnficBEd70pLVN7OcA3g5YAQjauxK30IlP5kn0lsTcjkM
         IH1RbFma9+LKXEANSVSd+nNSWEXOEHyFQCHQU8vfZ9rOJ0IuRpisp+Jq8BUXrqpkpmOM
         uwCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757013317; x=1757618117;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=72VIeQCXr4qiU6r38G6eLyylT0RDYa+dNJTmbfklGsE=;
        b=Wwo1SD6QpkylIguvmc/ZR+L4vhWoiHLH1OzoI7e7uju4e9aqVgbsSqMrC2iM4ENrpw
         M4w4abrXHGq/XX5kj233urauXCthVaTk4LuF+52Oo2OSl8WXcJXRGTOPq12ouBEcFf+H
         /3JJlrOGRItU5INWoM9RsqIZN+V2FiV4OAn5Qbn9CyOsuYiIRkCUiEM9zSpfLwFePV3V
         719T+8xkssb6/FWSk4CwriO5bnGbsSmHAyy4n/YDTsVewy7+ViRl/fzxK7AFPqlm+7Yz
         HDtbKDTPL39RdW/E9CwVifa6m2zAUs2hN7wVtdqhyJ4455BOQxMSTRyQh9NImrJLJ8TG
         0SrA==
X-Gm-Message-State: AOJu0Yyd3/CrCszEmDdeHl3vsfLkj3drEgWN7dsN6Tc7nZcb0/5vQqoG
	uY+dfVeMG+9iSTRqNx9owFoVVhQ32CZNHwiuU8xA679Wh4Z9whQwDFh6U7eb7AhxBqu9iIVGAma
	/hwR0zYqnnqWIiIRztbdWpdrsQXe7IOz2nLcr8ahYsCI/mnijV1jZvB8=
X-Gm-Gg: ASbGncvKYoOLo/c/7OSKg2G8sBv1PLv+867lJaz2st3iQYLRWHA9JUMpqF770/EDhCu
	1oQgzAVI0S7kZSlcW0iU+3+PzDEtigwn2k6zS0306DNQ3u24Ak/c37i4QqvGs6EBHDJA/jj4Un7
	yL0gdxUIKp/I3PXyg3mIzMP8ovgSiEEoPxOqR7D1GeRvi5On43LJwv6SsTnAFGq56zPg/uxNHpC
	/FX1P60ig==
X-Google-Smtp-Source: AGHT+IFT/35vScAI2qv76bm+vRMTytrScBB4d6eIqcIhFnwkDmKD1sER362/uKI13EBzPz1eGw1uZjJnwIDsy5dCICE=
X-Received: by 2002:a05:6512:3d17:b0:55f:4bf6:efe8 with SMTP id
 2adb3069b0e04-55f68bc59c4mr3204678e87.4.1757013316859; Thu, 04 Sep 2025
 12:15:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Marcelo Robert Santos <marcelo.santos@profusion.mobi>
Date: Thu, 4 Sep 2025 16:15:05 -0300
X-Gm-Features: Ac12FXwiGUyOfnFdRF9DCbcCohzunQT1Xvu_eajUvKGR9AabvpDoUM-NepHXB3s
Message-ID: <CAMVAkEs2QXM+O_fEphSUp+-y+zkOVQdnK+4UxYYbnPYSwW-+vQ@mail.gmail.com>
Subject: KernelCI Dashboard Report - August 12 - September 01, 2025
To: kernelci@lists.linux.dev
Cc: kernelci-webdashboard@groups.io
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello everyone,

In the past weeks, we have been working on some utility and
configuration changes and because of that we weren=E2=80=99t able to send t=
his
report as frequently as we would like to. Either way, our work is
still strong and we have plenty of updates to report. And with a
better pipeline to deploy our features, we should be able to launch
updates at a better pace in the future.

Here are the changes in the last weeks:

## Docs
- A contributing file is now available, offering guidance for anyone
that is interested on how to contribute to the KernelCI Dashboard.
Thanks to @WilsonNet. [1]

## Improvements
- The endpoints for retrieving builds, boots or tests from a tree now
also have the structure of
api/tree/{tree_name}/{git_branch}/{git_hash_or_tag} followed by
/builds, /boots or /tests. [2]
- The help text for the group_size parameter in the tree-report
endpoint has been improved. [3]
- The cards in the tree and hardware details pages are now ordered
first by fail count, and second alphabetically. This allows users to
see which architecture, configuration, and hardware have the most
failures - Thanks to @giubrocchi. [4]
- Kicking off some UI improvements for a mobile layout, the cards on
tree and hardware detail pages have been refactored to be more
consistent across sizes. [5]
- A better padding was added to the =E2=80=9Cno issues=E2=80=9D message on =
the issues
card for tree details - Thanks to @khanheric2003. [6]
- In order to allow for a better visibility of pass/fails, the
integration and unit tests on Github=E2=80=99s CI were split, now running
separately. [7]

## Bugfixes
- A few endpoints have long processing, which was expected but there
was a short timeout in the way, preventing them from returning
correctly. The timeout has now been increased. [8]
- In the issue listing, if an applied filter returned 0 results it
would incur an error. This was caused by a query that didn=E2=80=99t need t=
o
be run in this situation, and was fixed. [9]
- The commit selector for the trees on the hardware details page had
repeated commits for some trees. Also, the commit history graph was
breaking if the hardware is a test platform. Both of these were fixed.
[10]

## Notifications
- When running the notifications command, it is possible to skip
reports that have already been sent. [11]
- The checkout email notification now includes a summary of the build
issues, showing new issues and reporting the amount of existing ones.
This has also been reflected in the tree-report endpoint. [12]

## Database
- The script for moving data between the old and new database has been
improved with origin and related-data-only options. [13]

## Docker
- The docker environment variables were moved to specific env files,
so that they can be saved, shared, and changed without changing the
docker compose file itself - Thanks to @nuclearcat. [14]

## Future Changes
We are almost ready to move over from kcidb on Google Cloud to a new
database on Azure, only some final configurations are needed. And
again, just remembering submissions sent through the REST API are all
archived, so no data will be lost. On another note, we are starting to
give some attention to a better experience on smaller screens,
starting with some changes to the mobile UI. After we finish the
database transition, we are looking forward to starting to improve its
schema and performance.


## References
[1] https://github.com/kernelci/dashboard/issues/1293
[2] https://github.com/kernelci/dashboard/issues/1309
[3] https://github.com/kernelci/dashboard/issues/1405
[4] https://github.com/kernelci/dashboard/issues/1261
[5] https://github.com/kernelci/dashboard/issues/1411
[6] https://github.com/kernelci/dashboard/issues/1427
[7] https://github.com/kernelci/dashboard/issues/1402
[8] https://github.com/kernelci/dashboard/issues/1392
[9] https://github.com/kernelci/dashboard/issues/1381
[10] https://github.com/kernelci/dashboard/pull/1446
[11] https://github.com/kernelci/dashboard/issues/1216
[12] https://github.com/kernelci/dashboard/issues/1394
[13] https://github.com/kernelci/dashboard/issues/1401
[14] https://github.com/kernelci/dashboard/pull/1399
