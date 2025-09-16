Received: from mail-il1-f175.google.com (mail-il1-f175.google.com [209.85.166.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49AEA28467B
	for <kernelci@lists.linux.dev>; Tue, 16 Sep 2025 23:21:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758064915; cv=none; b=q2n6QFMk64RHjkifDqXzz066ANNMxMsT09dOanyN0HMLuQ9pNhM6bAYEPhB7YDjdqdEIynQgogZIfwUFi9Sclpri262zy59g8PKMw7uMfoSirUuUdsZ4IK7Hgjbfgxe8Wfl0xbifVhhPk9L+Xla801nxfkIi3ejyabmQDTSPI04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758064915; c=relaxed/simple;
	bh=hS2lYl1vq+n57Znc0ND4700qlIu3P3Zvma4mr/AhvhI=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=j0Rc7t4nZHd2Lwa5xqWYXpgqNFiSDG4SyXHfDKNGmnnAHU18woh46o3t04g1N9lpofTA9eqQRB0kJVyxLRl3JljyrMFHARYVzam62+GgsJexEMlXZ7HWzTMkedgRTaCE6wNrkfQ9bEqRnEhxKnY9mCNvw3+PCm+p1uB2U4DhDgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ap5gRCUs; arc=none smtp.client-ip=209.85.166.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ap5gRCUs"
Received: by mail-il1-f175.google.com with SMTP id e9e14a558f8ab-424081ae9f2so11935265ab.0
        for <kernelci@lists.linux.dev>; Tue, 16 Sep 2025 16:21:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758064912; x=1758669712; darn=lists.linux.dev;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=hS2lYl1vq+n57Znc0ND4700qlIu3P3Zvma4mr/AhvhI=;
        b=Ap5gRCUs74cQtugAZHXgUKTiLZZHU/Xn/Iis59WmpTXS7Mf30OfI0Kv1GlsIuPE8lK
         AcBNXC6JyZHUgrN3kwfvrDYQnYstwnPPZvF39bYmByDdYGdAgg6KUPQlBa8+q2L6CRk5
         wgPL5X8uLvQWhvK2WMNBjDOokXd8/JB3C5WEq8eoF3JFromzmQxOX/b9WN//ixOgSYjs
         u4TXzjpzXEaIQbOrghKJRKkaWJ/uMgX18HEa5s8OPtuRpcr/VQG/OuhTg/fnustjVDhP
         P6dLSzZwTR1XflF5KNE9EC6mHGAzPK8ZaVu8L8zN0ADmbEt2Tos50h+tJKIQW83wt7eH
         bBbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758064912; x=1758669712;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hS2lYl1vq+n57Znc0ND4700qlIu3P3Zvma4mr/AhvhI=;
        b=J05wKKEVU6Y3Bd/cduI0qoMPCT/HTQ3exs2FnVQ/qwO3XYgOxBzUtjqsPYQ020BVR0
         quXfqzi+oTX14GUSKw+j7KaE7E+Q/B6RqmbzIgpw3w5P7eo3+SJrfT2TwKml5iFYwKHH
         p5SqSJU6SI20YQAhrKlUPEKabUedx55IT53DCb5ZTlIjVOc+lv7TB0Cm2NzgFUpNosKj
         Af+ogFHkqTIf+NbJQ4Y7n8eBcFZI4UcJx3CwpnMkygspRKqffYLDRQOM5m8pYi6m8aY4
         +KsSWrQAU5Xlv1w6J0E/qVRFTXS5ZS01i2kFjeK4klL8ais8x92OpWu7Ta2EWGnuINZW
         u4tA==
X-Gm-Message-State: AOJu0Yx1Q6BSAAWKG4PtBsDupDW5omh6LJAq362ivk9X5uib99uV0Cft
	Da/9O27oLCms1xEkrcd+kV9uSS4pTqCnxjYkCcaf1aqNtsJicg/uBAIylDarwQ==
X-Gm-Gg: ASbGnctypljHfHAun7D3SxZ0l7sCj7zrn6KFaF6ZjJfgb1VlUbd4b7XNA9ntx6f7yTx
	KmIqxy/VSX2fS8Rp8eXebQMBtUu6RPaEW/WoES97h7V0b+MAXmfJNElNexsoHQoqUb0rVZHCJLK
	Q6HxE/KF02ful/F3VUwzaoNghZIZlxca5Qcd/qD/jFkhIQ6hoP6eaRhRI1sTj+Bt85Pp3RTsVjQ
	VIWkycO+4qNzyOnPr8zn5pBJPQG0I4tMO2oqzCv2cvX7UthhFWJQpngjy2PAoD/CLzVH8VLpTZJ
	7lC7GEKS9222UaYG320OETC3rYTCfjTZIcjhLx41A6iicyUAYrPb3ArhrKZXtv6JAqKPp8K8jbI
	d2QqfBfhV1LjNgQZRO2sxZKUCfoygwbWRUwBnCfAlputcl7/6kds0KeAArkxyCt/xPWbtGTo=
X-Google-Smtp-Source: AGHT+IGpD12mTSXXUEkDz3RiEN/406S1a6Ykt8j/gP2wwkLKkLekMnfTxNppUpokI/Mv6MA9+U7+8w==
X-Received: by 2002:a05:6e02:1aa3:b0:40b:db4:839b with SMTP id e9e14a558f8ab-4241a4b9a0bmr1451495ab.5.1758064912015;
        Tue, 16 Sep 2025 16:21:52 -0700 (PDT)
Received: from mail-il1-f174.google.com (mail-il1-f174.google.com. [209.85.166.174])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-5120adc0feesm4793021173.73.2025.09.16.16.21.51
        for <kernelci@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Sep 2025 16:21:51 -0700 (PDT)
Received: by mail-il1-f174.google.com with SMTP id e9e14a558f8ab-423fbb45255so15631985ab.3
        for <kernelci@lists.linux.dev>; Tue, 16 Sep 2025 16:21:51 -0700 (PDT)
X-Received: by 2002:a05:6e02:1fc8:b0:423:fbff:5e6d with SMTP id
 e9e14a558f8ab-4241a533afcmr1427695ab.23.1758064910327; Tue, 16 Sep 2025
 16:21:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Tales da Aparecida <tales.aparecida@gmail.com>
Date: Tue, 16 Sep 2025 20:21:13 -0300
X-Gmail-Original-Message-ID: <CAPo4OxSPZXF+6syLrTQydnpTY-26sEHK03D7Tz=TH88F61+VHw@mail.gmail.com>
X-Gm-Features: AS18NWC0UNfTfUJK2___BPJX7rmQ-5o1SBDra0DzDyNrySEj3H6w0VIyoF6sHcs
Message-ID: <CAPo4OxSPZXF+6syLrTQydnpTY-26sEHK03D7Tz=TH88F61+VHw@mail.gmail.com>
Subject: Invitation: KernelCI Dashboard WG - Bi-weekly meeting
To: kernelci@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello kernelci lists.linux.dev,

TL;DR: You have been invited to a recurring meeting for KernelCI
Dashboard Working Group
Next Meeting: Monday, September 22nd, 14 UTC
Repeats: Every 2 weeks on Mondays at 14 UTC

I=E2=80=99d like to invite anyone interested in discussing the future of th=
e
[KernelCI Dashboard], in regard to new functionality, bug fixes and
overall enhancement of usability, following the success we had in the
first meeting of the [KernelCI Labs Working Group], about how KernelCI
integrates with and manages hardware testing laboratories.

The KernelCI Dashboard is a web platform (Django + React) which aims
at providing an easy way for the community to look at the test
results. Its API also powers [kci-dev] - our cmdline tooling - for
results visualization in the terminal. It is still under active
development and we are open to your feedback and feature requests!

We have some promising ideas in our roadmap, like
- kernel test coverage
- hardware information of the test host
- test/build aggregation (Define common fields to compare historical data)
- personalized notifications
- improved regression reporting

If you=E2=80=99re interested in contributing ideas or simply learning more,
please feel free to join the discussions live every 2 weeks on Monday
at 14:00 UTC, starting 2025-09-22

Meeting notes will be available at:
https://docs.google.com/document/d/1aoNpi69WRhn1nENbdAY1CPXYVkufbVnG_lFoGfA=
0aM4

[KernelCI Labs Working Group]:
https://lore.kernel.org/kernelci/010101992a9a3b51-fdf26386-9ac2-4716-9e5c-1=
2cf21bd1800-000000@us-west-2.amazonses.com/T/#u
[KernelCI Dashboard]: https://dashboard.kernelci.org/
[kci-dev]: https://github.com/kernelci/kci-dev/

Ways to join meeting:

1. Join from PC, Mac, iPad, or Android

https://zoom-lfx.platform.linuxfoundation.org/meeting/97717382678?password=
=3D4cdaf4f9-f132-4d79-94a6-56f8f03d22fb

2. Join via audio

One tap mobile:
US (iOS): +12532158782,,97717382678#,,,,*911276# or
+13462487799,,97717382678#,,,,*911276#
US (Android): +12532158782;97717382678#;911276# or
+13462487799;97717382678#;911276#

Or dial:
US: +1 253 215 8782 or +1 346 248 7799 or +1 669 900 6833 or +1 301
715 8592 or +1 312 626 6799 or +1 646 374 8656 or 877 369 0926 (Toll
Free) or 855 880 1246 (Toll Free)
Canada: +1 647 374 4685 or +1 647 558 0588 or +1 778 907 2071 or +1
204 272 7920 or +1 438 809 7799 or +1 587 328 1099 or 855 703 8985
(Toll Free)

Meeting ID: 97717382678

Meeting Passcode: 911276


International numbers: https://zoom.us/u/alwnPIaVT

--=20
Kind regards,
Tales da Aparecida (He, Him)

Software Engineer @ cki-project.org
