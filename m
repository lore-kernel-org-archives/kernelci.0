Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8DDB32D431
	for <kernelci@lists.linux.dev>; Mon, 17 Nov 2025 12:43:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763383433; cv=none; b=LddQG711uwFKKyhPBlFVXHsCbKw//afAWTn1c8lNrpOGGuqTV0otzZacYcMh5yXaubcRWho74l0M5BX+8Wg723wFi6q6sCXjpmQFio1xEH9Gbl5yr5QvEoOiFhD5tSkxkIH0teAzg2rvWL6ToSpVy8yINoqmGeNp+yqXG2Xc9hs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763383433; c=relaxed/simple;
	bh=wIzaulbPLtz5y060BZOeXE/w85C5zdt9jsKSjqvw7Co=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=lPoDp40Wo8xWCm/xU3r9mNUjL6944sGSLOiq5iF+A7HZTg5RZZo25pNrpNbiEXWwTzp1Jaqk11x8MjCfrVBrkAdlZBXHcw80bA9pTlMewKPqY/twFBJ1GO/93bEfThXeLie+2+kyPxMiKIZQQRY/V6Z2sWF6vh4WJo/5JrkUarw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=C+W1bPnS; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="C+W1bPnS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1763383430;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type;
	bh=3Sxns2JY7i00a0ySAT0UFwXplA7eaxDPi1rpVl4/QVQ=;
	b=C+W1bPnSe+mKFyz/4sJ3lFmvYHAbIliNTQ1MZN+8G/p7izOMDRaL4lEmspCRprR1JvomNr
	oDLiZxD4d4Ut0tqGVn6lFLST2/lCQ/sCxE9WMpKgwGFVL9o4BIpw0kwDEM6EJvdjLygxJf
	ZUKJ/0/3T5jMiCz1KVlPSdjwyv3JFBs=
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com
 [209.85.208.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-353-4h9Ae0evMbWAJXX3kL3OxA-1; Mon, 17 Nov 2025 07:43:49 -0500
X-MC-Unique: 4h9Ae0evMbWAJXX3kL3OxA-1
X-Mimecast-MFC-AGG-ID: 4h9Ae0evMbWAJXX3kL3OxA_1763383428
Received: by mail-lj1-f199.google.com with SMTP id 38308e7fff4ca-37bbd644eb0so8852101fa.3
        for <kernelci@lists.linux.dev>; Mon, 17 Nov 2025 04:43:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763383425; x=1763988225;
        h=to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3Sxns2JY7i00a0ySAT0UFwXplA7eaxDPi1rpVl4/QVQ=;
        b=nnNNjk9tEg4StvaUMYhC08uNThyjQOB1H4wt5eEBcDLW1FX594Ed07xuGW1aV7+NLI
         mv2n9JQ4HEKoHLdC2Y9M8+UG6ZL7vvvnhsxd4O168Cb38xesdn62A47k7/X7yhUe5Pcs
         34diCey0Yh/+7vcZY8JN7Fqko785tJ4SFSQNCN14f3pdkpBEZcnzMnfDEExibKsUkhV2
         aya7jBQ787zlYPu9ppIZqLX/UfH91gDadN4CozXViu3v5b3Iv3ykdwP47cIPjOIPp0Ej
         uI7knZZdRLSL0wrN2buP2IlaBTmZAX0kBoNpGinbHlqxsaBPQpFx4nprgR63kHhnr7qD
         VVOQ==
X-Gm-Message-State: AOJu0YxvQBdNwm/Id51WAGMKb5zPERxRzwrwAWb7NpqNGnzh4GKRe/af
	tnP8XAj6e37CSA/fMDJFJFNMdLQv/4OZcWMEgEIoUUjM/LxWITmFqVcTafF39UXCSyrPS7tqlr/
	ypHd5eBoFuPu4nUQ0nKgSaL7qdGk8+vjoRiCnIAf+vdS2Lv4S7nYypee/3592M3wI41DVNYHQSq
	+ZJndjiKp/1o+7A5J2VK2hgygZ+ige4om1owFGsQ/FD1euev9I
X-Gm-Gg: ASbGncsbq0gh4tLL6PijKmOEdVFxLPcq9oPQ1CkFxLmwoGlEZ2RChQle4wC8ZSxhXzZ
	YRdDaHrq9WSOIL9WenkP3MlKqwCu4KD55Rpd4iYm83yowkWvDI2fnsNYPz5P2jCyLmglsFfbvVy
	2wmaPzRweH47XGFXNBtXUTWJr2uir2ZOa2/QHUwFbujE4bTZtjIRq/h4JYdzpPMyNKgkZkcVgMF
	mboAkP8EVBQsxOAQxFDYQhfeg==
X-Received: by 2002:a05:651c:2155:b0:37b:a429:1288 with SMTP id 38308e7fff4ca-37babb6d3e8mr22412761fa.18.1763383424908;
        Mon, 17 Nov 2025 04:43:44 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE/41bRbSiJpnKK2jsVowqnzVOGXl3lBfeu0giFkby9ZsPP4/j315U+0B3MFXf0JNfEb1fQeLlS5wPNyTZcGZs=
X-Received: by 2002:a05:651c:2155:b0:37b:a429:1288 with SMTP id
 38308e7fff4ca-37babb6d3e8mr22412681fa.18.1763383424185; Mon, 17 Nov 2025
 04:43:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Tales da Aparecida <tales.aparecida@redhat.com>
Date: Mon, 17 Nov 2025 09:43:06 -0300
X-Gm-Features: AWmQ_bklG8nVF8UsPhFqpL9Tp59EnmXjZtv6DaiJxz4iPH4HGdRYtJQACHj_9Hk
Message-ID: <CAPo4OxRcmQ6uRp9Siv4k3tWRVZMtFcHJtV_aLCpDKOBa2TMWvQ@mail.gmail.com>
Subject: Invitation: KernelCI Dashboard WG - Bi-weekly meeting
To: kernelci@lists.linux.dev
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: xpXBJWtcLyGkljMzTTbj3YGMhvePgkNcPXPR0NbG8PE_1763383428
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

Hello kernelci lists.linux.dev,

In today's KernelCI Dashboard Working Group meeting (7 AM PDT; 15:00
UTC) we plan to talk about metrics, inspired by last week's TSC
meeting.

- Count submitters, labs, builds, tests, regressions, platforms
- Show those metrics in the homepage or in periodic reports

In our last meeting, we talked about lab monitoring, and how
implementing SSO through the LFX platform would unblock some ideas
regarding user profiles. We also discussed the progress in improving
the performance of the hardware listing.

Meeting notes (Search for "KernelCI Dashboard WG - bi-weekly"):
https://docs.google.com/document/d/1aoNpi69WRhn1nENbdAY1CPXYVkufbVnG_lFoGfA0aM4/edit?tab=t.0

If you are also interested in discussing the future of the [KernelCI Dashboard],
new features, bugs, and general enhancements, feel free to join!

The KernelCI Dashboard is a web platform (Django + React) which aims
at providing an easy way for the community to look at the test
results. Its API also powers [kci-dev] - our cmdline tooling - for
results visualization in the terminal. It is still under active
development and we are open to your feedback and feature requests!

[KernelCI Dashboard]: https://dashboard.kernelci.org/
[kci-dev]: https://github.com/kernelci/kci-dev/

Ways to join meeting:

1. Join from PC, Mac, iPad, or Android

https://zoom-lfx.platform.linuxfoundation.org/meeting/97717382678?password=4cdaf4f9-f132-4d79-94a6-56f8f03d22fb

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

-- 
Kind regards,
Tales da Aparecida (He, Him)

Principal Software Engineer @ cki-project.org
Red Hat Brasil

