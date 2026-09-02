Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE21637AA7E
	for <kernelci@lists.linux.dev>; Wed,  2 Sep 2026 17:48:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788371324; cv=pass; b=fzIfRpGoVpsE3AeePuXqYs9OkMaQBOOgHSOX5PfhIW0/jMxCU1yhLLrmFEmtZWe+bG05ydEssTAtomDDUuMYMc7QHgS5CNcUOChxosa54agVzU5r5JB5MA3+aifZ4pilxGtVl40mOA/8ugp64MoatfA0Kg/+kiFXoRVsl57avCU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788371324; c=relaxed/simple;
	bh=PzoR5mbA/WHbadcXExhqc5YgIWCAUIVWgUpWGSTZezA=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=j5Mp3mIhNownGIZFe3HxV6a9KK7RVnWu3crd2JzBnYo18y+Fg1PtDb8BytBynxWddqky8TAA39xrVqOleVX3GmXswd/7ByxI2ojOF9rkSzsGrTu5HzVV7H2S5o7dgv2UbfGQ80zLo9+cy5+TYoyRXy9+fycaIt0rnPIApq7pJs0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=profusion.mobi; spf=pass smtp.mailfrom=profusion.mobi; dkim=pass (2048-bit key) header.d=profusion-mobi.20251104.gappssmtp.com header.i=@profusion-mobi.20251104.gappssmtp.com header.b=mi+CvE7S; arc=pass smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=profusion.mobi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=profusion.mobi
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=profusion-mobi.20251104.gappssmtp.com header.i=@profusion-mobi.20251104.gappssmtp.com header.b="mi+CvE7S"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-cc1b838f9b6so1575761a12.3
        for <kernelci@lists.linux.dev>; Wed, 02 Sep 2026 10:48:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788371322; cv=none;
        d=google.com; s=arc-20260327;
        b=iUOV6n+w9vgyN+AEmAZouC2mnPDedh81uF9o3idSurvij4Un+nf8C6l+nzbCy1iir6
         VrRmy5JC+NO+Q59eyIJi2zJ6iNI3yl7NrL83YIeRibxUH6g0BTKzdShFEdkNkeL8jITx
         8b1GiAEiKIuyR0sbO9Tgjol0ETfAq3D7r6dOCxdfhnuUCZVOnwh2B5Y2pntFJcW3Q6sv
         X5P8IZepCUMyeeeWRT8O86WTfbjrpN2ybdQBcqglX32Kf+kl/Bc0PM7poqHl4gcBd0Q0
         wpnvfD6ZilqRRRRR97VibDDiglFBqFUCmW0u7oBptp28ni9WM9qEic+AlA840JpxyDjV
         54KA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:dkim-signature;
        bh=MXLnExoyx4QtEGXUyhYbes6C4++8CIQkkV+ntcYD78c=;
        fh=rmq/YLFzDAglBwji5AmBmtb7cJxq3EZCkg46fu2xnLc=;
        b=HMKOee5Ixtuo43Gu4ami8XNOwQWlif07PqhNHEinEpLxzExMGJLOe73YQaTdvy3Gmz
         y7E0PhUrQM2e57WhUJgj5xmiaYSk1oKziZhIrnW49hfWTOT9cBj6tRcas6HQ3gh1PxfP
         1eBuyBH/XFXhUV3i+OadPNiw9tClNKNE0+Pdw2Qyq9EiVHzwiEMU3pLC1ntBSfx61sPl
         lO6mUj7CEVTWLzI3uG+eurYiYWI0Ggzv/IdpIuedaPgtfIn5o5VAt497w3wQvnYGSLVF
         k9WEyNc+ucg4tynhPha7Txf22A9IDllPqxFdF6MhEaobOjWFGsTwz9PBx9UogBxQFj17
         bEFw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=profusion-mobi.20251104.gappssmtp.com; s=20251104; t=1788371322; x=1788976122; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:to:subject:message-id:date
         :from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MXLnExoyx4QtEGXUyhYbes6C4++8CIQkkV+ntcYD78c=;
        b=mi+CvE7Ssb+vZpnuhNaRYOPF77YQk4vZepnR8s/xzHdJKFE40uOUrfJM2eM/pzsT55
         Jdc1/oAsS9VlDm2R9diFhZAm8O+kcN57EHBK4ixjOYR/u+Qtp6g5zmqEIwdmd/VAJeNc
         izqwnU3b/b2rbAyHOOziUN4CAWdrYlSZZHIIR1WxZ8TrhN7PPcz2gaV1X9L76b/Ln/aO
         1SBV1RLb45Kzw+OYrFToSXk+8vGXPkJpve5hcSW01mQvs/pmmgWKPVAsFyfn5PZ15w14
         cRbCHuE5XqDXAnYssv7qrhZFlayae71Ay6tM9AKcqvU7e2dwRqLGMOzAIqjRaBo3mmRi
         8F0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788371322; x=1788976122;
        h=content-transfer-encoding:content-type:to:subject:message-id:date
         :from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MXLnExoyx4QtEGXUyhYbes6C4++8CIQkkV+ntcYD78c=;
        b=Ls1KpskTbFnURpJuWPDQa08wwKILY/PPGRPbmfnpdpoR2eIA1qajnQfTuWdAT1Fcn0
         e+g79LigBtYQegNqvPSyuS+Y37Tt4JodjcANAusqa4dZMzh/3w7AvczZL2+c/ISmleyc
         qRxka7ds2hqoOfjrVR5Qv6jqVxZGqyqSTRBWKI0fu08h8gqh1avh0didGj8I86O0DrOp
         rcMErwRfHOfA/5QT32icSmPw/SsqxiyyDgpI9b6qCR5i3+VdsCOM34/L8P0Fgw9xtG5g
         UTjZL4u2CLoTJxhiOxekX+54Dz4bHAx/d95CVuBS4tEpuUJmsenfXzeqM0DmQLCC7t/s
         czbw==
X-Gm-Message-State: AFuF++kkA/G13IaUOJDhYzMc8iAZtWGTUn805TWQYk8dMKAluk/PK/KX
	XyyHq5WxOk99sJHPt2+xfmvdr9TitE5RWfdARuXhcCNHnAky18O9W+n7r3uVFvBwHL/drpFJcRW
	9k5ldsoWQAZG+JEGBAsiWlbKd5jrD4gTCJ9EM4H4xw+Bk15cuUq/z4a2xgQ==
X-Gm-Gg: AYBFou1HKPHvMkIThmk+azhLATmazpPfP+rqASE+Jz+SbPOBtrmXYvJwtvvcDeYCVgd
	yuBhnl1uAkSO9vuyVcL2U0Qxwwqa2cVKWcjqcFXu6lRiQcFYoxZhhkT9FaSJVZ8g9c/YzIKt0pf
	zxH3d9cKQwQiipwxAbE9wDyxEwZEHf5jDPFNorrOWBs5IcP9G5S/zpJvOtJqVgntEmAWR0jbITr
	Tn1UPIulsfUZolB+Vjl4Ceej1ztArxOqOuHy7N8r4rfjrSO2+wwVN/VNGXKd5+8Nuvvz78Pvjet
	lKYw1uZP3eDStCeJjVO9R1Jt6jURd5NDfdtJLGVRkFTA+A==
X-Received: by 2002:a17:90b:528b:b0:398:b88c:2b7b with SMTP id
 98e67ed59e1d1-39aedfb9a0bmr10826173a91.8.1788371320150; Wed, 02 Sep 2026
 10:48:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Alan Zanoni Peixinho <alan.peixinho@profusion.mobi>
Date: Wed, 2 Sep 2026 14:48:28 -0300
X-Gm-Features: AcwNN1UwZbybEY0Ijs97DQAZk7_jl_Nw-yCRvkR7cWPzu3M3Q0ICoJprzktQDs4
Message-ID: <CAKKBm2tcCasKYq72u=dBxzKxPUhK7tJWtxThEht2Hpd+bG9FrA@mail.gmail.com>
Subject: Dashboard Updates: UX / CI improvements and Lab consistency.
To: kernelci@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello KernelCI community,

We have deployed a few updates and fixes to the dashboard. You can
check out the live site here: https://dashboard.kernelci.org.

 UX
    =E2=80=A2 Trees now have a Compare page: pick two checkouts and see sta=
tus
summary counts, plus builds, boots, and tests that were added,
removed, or changed status between A and B.
    =E2=80=A2 Issue details now show first/last seen per tree, and a link t=
o
the first good checkout after the issue appeared, so you can tell
whether a failure is tree-specific and where it cleared.
    =E2=80=A2 Cosmetic enhancements on the commit history plot.
    =E2=80=A2 Bugfix on tests table to keep column widths stable while sort=
ing
and paging.
    =E2=80=A2 Bugfix on stale frontend cache. Avoiding frontend crash on sc=
hema updates.
    =E2=80=A2 Hardware revision selectors work correctly for cross-origin b=
uilds/tests.

  BACKEND
    =E2=80=A2 Builds and tests are now tied to labs in the database, so lab
filtering and display should be more consistent as data backfills.

CI
    =E2=80=A2 Schema migrations are safer on large shared Postgres, a timeo=
ut
for lock avoid that new deploys cause a lock contention on production
database.

  Best,
  Alan Peixinho
  KCI Dashboard Team
