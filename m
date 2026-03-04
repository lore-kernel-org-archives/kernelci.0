Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 211E83B7B8F
	for <kernelci@lists.linux.dev>; Wed,  4 Mar 2026 17:28:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772645303; cv=pass; b=FYr8WytVGDEz+pSCLKJ8Hs/znlCZhMGwTouaU8i9jyJd9oaoghsrf4sAc/mLqnFBlrB0DVMRRaIjbKaramJBx4Qd5xzlqIy97mn3fWgBqie/JF0Az8qzFMcltAxtdFOHM7N+3ZF+ZLJCyb8LIGS99tldr/FHbLjNOqvC15hzqi4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772645303; c=relaxed/simple;
	bh=uH3dyodRWX6l0CS35Nog2d2cfHBHutm+BQRSignNsMk=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=izWGx0Wv33e2nQrJXhA79xx0+x6evxgWYoj1rVvORnbpp4k28GdAzYoMFWus27b2HSgMk+igY9ZLouhuzNdKJ4+NCK19BKXAc2RRH1KmYiFpo/9jz/dg+4ZYD/OA2Chp6to3VqZC+VX1JPqUbLZZvbI6d/Oufmi3EWW4zMBQyU4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jLFB1W/2; arc=pass smtp.client-ip=209.85.219.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jLFB1W/2"
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-899efe93d4eso48318356d6.2
        for <kernelci@lists.linux.dev>; Wed, 04 Mar 2026 09:28:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772645298; cv=none;
        d=google.com; s=arc-20240605;
        b=LVrhtqH7XaswKDsyYfcJVzFDWl4xKNUwB7W/lgWewHiW+RaNZXLy0XiDGeptxBDP9v
         7VViY+g+GqTtJHqEywBjjhxdoH5RRwmgyK4WJvzZdjPSv6AT4W4v137pME2sgVdSy9dd
         x5Je/W3EwEyF2qTesHE3y0L7leFtJEiWGLsVU5QtY1LxdIzTPS17q7DdnWlf7VCPHfu8
         wnD8nqUgcN28NbQ/0ynvXSaDiQDOp1D3dC7vgzeB1oQa2yxYSbCyNmeTdYPrLBQgjP/9
         DoO5U3C74aUG3Bbabt92cMLU39C5uuUMbLKczJLyp5g8wtOd3mBjnoGx7x59H54n/D8k
         Cjaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=uH3dyodRWX6l0CS35Nog2d2cfHBHutm+BQRSignNsMk=;
        fh=2bEN4ohAWLRJ39EgE2zG5th/Ng2Ea8wL5ouaqX/aD2k=;
        b=MwSQf0dBOqa09d8s7fJMsYhSnQfbEsg7pIc97yI8FI2bDto1iQtomiRcX56Binpzq2
         pE2/ZFehdDcdTH62BwsuNue4OLOxs2EIXozd7repSn6rJbuZr65sHhsv3lP0XrRldQzf
         VXVDH1C8YNmUvMarBSBKzB06klKlsW0qGP+zAeX8WutMDorDgI5u3g96g206PgG6nBNe
         +d86jMRHejlLhHAmEuFtIxhBD9f9jWyB9qTMuVqZiHiCWEFMrVzjorUNdbluKLsjEk/b
         Mo2vdOBXcYSNsslwZowJJqRNjmL9TqL/M8SugRHvXM/DpIy2yHW6KBqxCvKlk4d872Hc
         f7AA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772645298; x=1773250098; darn=lists.linux.dev;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=uH3dyodRWX6l0CS35Nog2d2cfHBHutm+BQRSignNsMk=;
        b=jLFB1W/2Vk1Cxd1dGGAsaTtbNLBhsLZvKoG090goUeplpprfKxEa76egvapsaWUHdQ
         l3fTmHCyyfNPtnEkixP+Kuz09+v588lghMHzImpmGLPCd0PVa5vt5L+V1MEve/UegMU6
         XKGdS7Vb3d42DKcAS4G3d1gRbEiAPt03FgbRGsq66HRsRgRdcmY8Hw/cKwZ9LV1E06XE
         +kmogKyGb8BbPWkullskqihAOlr+xh38gfY70KAmhqmfCzW6ZJBHVXWBZ8xPrrm0/dLX
         OBg1Y9ysLnP3J9gnJzap8gIQlKueUJEQ9v5s8Mo/L2doc7CQeTrHYitvDC7OD8oo/PsW
         VCYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772645298; x=1773250098;
        h=to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uH3dyodRWX6l0CS35Nog2d2cfHBHutm+BQRSignNsMk=;
        b=sKOv+JVJr8odO9PWwa7fgYsfPC4lqp2crYOM7zOj5PJiNzlXN1OwIZ/W+xcbnh9bmM
         hOSvy4JDL4qBzfoaNkGkvvITNinjWXHeOA6WyOJADcFUoymkUkTg0VSECofAbWa6nYKr
         wq5tK48m9G/tBUSDUeYqRIwWBgJyrV2oY65lkboV/IIGaQZzqNaqya0Ff3oNheIGgJSo
         WDanya9HZEqVnCU2JO4chvo79rONbICAFVA5pBipYxwh0Gy41J0aXj1z97xNjEECO9O/
         qMAvQeGxXeKWdb0hAlnSYTcyNmwSN5DGOxwXQV785bPphF4DFc+XWH+aDNI5YkrsE7p8
         dOSQ==
X-Gm-Message-State: AOJu0YyM+Z3fRHaxzm54hEqXE21tbxdL625S6U69esFPammhS3WrbAcd
	Dus2slvrVYwA1dypTin8CQzcDfpr5KQVbgal3uDbQmVvo8vpfqCpNZv2gclyVHDs5pjKJF83vZ3
	D652vEXic/f+Adzw9E59FjYwBzQEvfAoeJKsVlaXoSNaEhJxWi4w9O+YP
X-Gm-Gg: ATEYQzy5WpAh1a2CLoT4/thQiynPJkN75KVyDIfe5giFB8npyTz+KcBSR6VdiZo4KhP
	QyEQjnKa051fqqxosceBbI9GTx5pxrVge6DYD1r+JFgg4q1qop9kzL7WzevQ5UR9k75K3YUMAYR
	2X5XzSzSALEDM7Ifr1z4PzNHOSDnS6+4nPLrWJ4d6C1F2pazAAcRqHFrHCbqlGtqjkImMogjLUk
	Uriq1QFL4obZs5XuhK+6mX3jGXwCybWk9Rx9YsVzu5p+GFlBiyqb5zxii+GSpztZMC8SsNj3BJ6
	LW0H7ph6irlIudfJwwVlmz91it198zuHXxTUn8x42OL3Xi9Ji0NDAvIsfA9Tj5nXYlZkqwGbF6U
	lWPYxmVm0xqyHqw==
X-Received: by 2002:a05:6214:1c48:b0:899:f929:d838 with SMTP id
 6a1803df08f44-89a1998740amr38516956d6.1.1772645297435; Wed, 04 Mar 2026
 09:28:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Ben Copeland <ben.copeland@linaro.org>
Date: Wed, 4 Mar 2026 17:28:06 +0000
X-Gm-Features: AaiRm51alIKHces5EfDy0iTxCVCVXoV73uUhqlENjIXLZ5tPF9gW-yim_HeyK-o
Message-ID: <CAL0q8a67TOQVyDMpdFdgqJmyC9snDoTJaG8Fhf2OqKS1wc=S8g@mail.gmail.com>
Subject: Meeting proposal for KernelCI Bisection
To: "kernelci lists.linux.dev" <kernelci@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"

Hello all,

On the KernelCI roadmap, I propose we start a discussion on adding
Automated Bisection into KernelCI.

We have many options and have learnt many lessons from past
experiences. KernelCI today lacks the ability to do automated
bisection. So I would like to put the meeting together to cover

 - What bisection in Kernelci should look like
 - How do we go about Bisection at an efficient computational cost
 - What are the options for automation
 - Put together actions list

Bisection needs to fit into KernelCI V2 tooling (i.e., Kubernetes,
kci-dev). We also want to provide bisected results to the Maestro
mailing list.

I have a list of people to include on a call. If you are interested,
please let me know, and I will add you to the meeting.

I propose the meeting for Thursday, 19 March, at 15:00 UTC.

Regards,

Ben
