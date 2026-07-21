Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EB113783AE
	for <kernelci@lists.linux.dev>; Tue, 21 Jul 2026 11:58:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784635093; cv=pass; b=T+8W+EMR/TAPaYXQxo52xWc4wFk2khKVyiM+wdC+tKvMftzX7PrHTJGVXQF3IiNiOsKmYdicwmygVs2W2JwBc0x02AwJi8t81ab8/shmaNSohf33iJhJm5Oh0AUsqHf9tA/a2eFG30JoCHgnfmW6Yr/OC2nYkewN9iUWWpRmg5Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784635093; c=relaxed/simple;
	bh=DlYq6nGgA5GisNidr0wgF3YYghGbQzHuzP4SG249PpE=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=ELtPoFMIuPlQI0DZBVlUPb2Zm3S7MA+l0Ox6INvwFt19CXGbjAKmN36yJZ5PmSbVdV5g79988ihB4jdcVCKqr1+01iT/OsPYFNY6DSxCsU3QwZMpNfx3hesux+X7uD8nIYA9McogeDKaw3xsZEXcUWqUVTcPiq7KruBcoSzcg6U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=profusion.mobi; spf=pass smtp.mailfrom=profusion.mobi; dkim=pass (2048-bit key) header.d=profusion-mobi.20251104.gappssmtp.com header.i=@profusion-mobi.20251104.gappssmtp.com header.b=GJVWXvJt; arc=pass smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=profusion.mobi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=profusion.mobi
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=profusion-mobi.20251104.gappssmtp.com header.i=@profusion-mobi.20251104.gappssmtp.com header.b="GJVWXvJt"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2caf228a910so88301875ad.2
        for <kernelci@lists.linux.dev>; Tue, 21 Jul 2026 04:58:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784635091; cv=none;
        d=google.com; s=arc-20260327;
        b=h937GOm+3bs928XrH9KvYyD2+PkKFHTed6ucYJXvIiixkGhGPiygUDrPm1dCptmHdl
         6lZm0wJSvmUY4e9XhPdTAutWFYtZacrzuWMveVV0BPrRneRtaRkF2z7if8RJ6l72Pojh
         hfgfjgMXJs6o8JkaXlyIms+GpFjUv74LTPCHtbje+VqlP5Y8eMVSg+IzXJ1h8AaQH0U4
         DhdBl0ewvq8nywyVlqyKdv0SFq6T40TbrbySe7RUfZVQXHuDoB5eE/frFIPq80ZfYxXS
         YJGdhyJlIx61IZs39TyfY+8Do+9Jeqt8nbaQSyMeraWC9vGM+uauCD1hqTSrjGE/Vjt5
         VnBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:dkim-signature;
        bh=VBR4ymMcj4gMbRgUUyDK+PudDeJEhqXCDn52owaUwOo=;
        fh=rmq/YLFzDAglBwji5AmBmtb7cJxq3EZCkg46fu2xnLc=;
        b=Pp23lNnA+VSq0YSN6LEmoVb4mWapDgk1jukmu/yjzkK7MFEVXiyz9mALyNtc5QmiTb
         wdofP/kB2/bXltStRoe/yGUWEdMcgp66q+zDkA0pd97h4+k9orv28COq3EMwYLgH/GPR
         nLBnWJVEMVhRRIQf+b+ZFHZJo0cQa+vVjN9gCIBUJ6bBQWuBC2qQibB2RFfF3TldG2ra
         OG/1ZUHwZkmyaOjIC/Mnyi6E+EjhPLttpdOzA7Pw1rVxMst2F7Wf+9iNQbxppgUqcWwy
         A7IhrxOL6mLP0kaNxV6b1d4KgWH/KEQkm5HEXUdhQNoeEqPDa52AkI6GgmPjayZuvnIw
         nQmg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=profusion-mobi.20251104.gappssmtp.com; s=20251104; t=1784635091; x=1785239891; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:to:subject:message-id:date
         :from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VBR4ymMcj4gMbRgUUyDK+PudDeJEhqXCDn52owaUwOo=;
        b=GJVWXvJtUXhRS8IGQ95te6XOL9FoyX79e3IQx38HFp6FPVHNjSgECs8gt+zBXPLobt
         CDJokkd1lkm9fx/VQOIBUKjJeD62LJqu7Cn9oXym5o2kKNo96tg7A7KmNHKxOgGyWIU8
         Vifee5htZ7XWiRaHno9GJGq/dZOiicvbbAv3ucJb+RhZrFUNt4JJXJEAUDIrz1NGqs3R
         2rocz9cnqXd1vaMrVnGRRnBLouq/9uFh39Wuo0zDy1jat2Ff0eM88cNk6kxbBZkPIPxt
         kW3po6dmjTZemXomt6lWsukvfbsQ0XYm1EWoUQxYxg+o1lZ2Em4MVhzE5yjrmFuNWS6G
         xr0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784635091; x=1785239891;
        h=content-transfer-encoding:content-type:to:subject:message-id:date
         :from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VBR4ymMcj4gMbRgUUyDK+PudDeJEhqXCDn52owaUwOo=;
        b=aThPowBcTwZ+m84Q6Aadxurb0HYF5vq4Ig7WGijMKhnYCFK40YhldB3M01wY42GzGv
         3zuzfLhrqH7D2UYX7tY3Kz6gVO8peOtKjGe2CI4azQSjiBTL+WbSRerJOUorjr4fEvEZ
         XVJib4881JfJ40EdGz1THZCHprhvNHepfq+Cw2jrk/nPyatcz74QVKT/4I0j6G3k4cOt
         qylGsO0O504k+imMljlO7oHlQqzISon3a1SWAnmtPuMeNj6ugMlY7kasGxrkh/4usbPz
         P5lOlubDjXkMsiT1eBzU30ClyDMshA6W3ZShzI03QZ/VeT9HjkGtxlkCP6jVphFO5QRh
         mFeA==
X-Gm-Message-State: AOJu0Ywy2XphJ7pKxUGxRHSl/gfJImfIw0nAemySlXEruXvx6kK2H/sw
	PugQqOhvKLF4Oojfv4Iq9dF1p5SOFQnygcM8ZjzQU8kQoshxC1++QItxO3PTI7vIUXKAtZidkes
	/k8VfAN0KCLiwmfv/JggSz6p8hgq/m8CU00i9B56Q8C9QsMCvPOhXt52RUg==
X-Gm-Gg: AR+sD11OoBlvxrtlgUREbgFYaUoolWkHBPBz3dcj/vRI/SXF/Mh1V5YueIjzWqtfsKa
	SZpUtMFKfD6VclBslCUMkOyobeB2U+tX9TbrodyYggRbQWcSYNqSUZhp6sOq7aVJBFMSQof9bs5
	V32SQc1rSAwSPCgYTSPDyBmo9VxLQA/1DOCUgBaxmSzPWCE5fVcQVb6S8usIxJMIJ5je7nqI0Sz
	jqkAAZEc7lS7h3YkbBEAYdQijJBBTLTsanyHtMVcyUVNA6EMkxUfJ5rFd65TZwOi3qi0a/MdA==
X-Received: by 2002:a17:902:e944:b0:2cc:f7c6:8320 with SMTP id
 d9443c01a7336-2cf34a28988mr178840685ad.46.1784635091402; Tue, 21 Jul 2026
 04:58:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Alan Zanoni Peixinho <alan.peixinho@profusion.mobi>
Date: Tue, 21 Jul 2026 08:57:58 -0300
X-Gm-Features: AUfX_mw63EIZywpG0V_jE-YVbM7S4HNWfg6M8C7X9Jn1xg0CBVHamnirCd0EqAI
Message-ID: <CAKKBm2vPkJdmem=0p6uA7G3J4v2S5wX7puCK8Yd1-=Q4ogxb1g@mail.gmail.com>
Subject: Dashboard Updates: Fixed Crashes, Smarter Logs, and Better Sorting
To: kernelci@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello KernelCI community,
We have deployed a few updates and fixes to the dashboard. You can
check out the live site here: https://dashboard.kernelci.org

Here is a breakdown of what has changed:

ISSUES
=E2=80=A2 New Default Sorting: The Issues listing table now defaults to
sorting by First seen, newest first. This means the most recently
observed issues, saving unnecessary interaction.

TREE DETAILS / LOGS
=E2=80=A2 Crash Fix: Resolved a bug where the UI could crash if you deselec=
ted
a tree while a build, boot, or test log was actively open.
=E2=80=A2 Auto-Closing Logs: If you have a log open for something that is n=
o
longer in your current selection, that log will now close
automatically instead of leaving the UI in a broken state.

REGRESSION REPORT EMAILS
=E2=80=A2 Targeted Regzbot Tracking: regzbot tags and lore links are now
included only for the upstream trees that regzbot actually tracks:
mainline, next, and stable.
=E2=80=A2 Cleaner Reports for Other Trees: Reports for other trees will sti=
ll
feature the usual Reported-by attribution, but we have removed the
regzbot tags and lore links since they wouldn't be meaningful there.

BACKEND
=E2=80=A2 Stable Cache Key Hashing: Cache key hashing is more stable now,
which should help significantly reduce intermittent cache misses and
smooth out any odd metrics behavior.

  Thanks to everyone who flagged these issues! As always, feel free to
reply to this thread if you spot any bugs or have feedback on these
updates.

Best,
Alan Peixinho
KCI Dashboard Team
