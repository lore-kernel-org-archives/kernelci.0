Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2B11280308
	for <kernelci@lists.linux.dev>; Fri, 26 Sep 2025 18:27:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758911265; cv=none; b=SfbFjwKIcCC6Z6LbAiXpJYwr+pjqdxdbtN0dkTJ93TOfoHsrsAdzqIalbdqy1iigLypOTm7S7e+7tAremy0iVx7ZW7zPKENzUDchWxMlTzmN3UfMxsZZW5sS3qVlthBiDwgMZn+jIT8U1iHJs0I1OyUHX1Eww9aN+C8bL8oDx7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758911265; c=relaxed/simple;
	bh=PKVO/39+ahQdODVClLEB80MH1yuS8DG/EEuVEu2jzgQ=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=e69DXNQ+VBju5Ev0LZdd0Qbf2Mg773w/JQvSFhyC82L6zcjJeyq0iUMhENwXp58CKgyycVsh8mP4gTt/jPJYayGe21wNql1aTU1mdS7FdlhmYLayQ4iHoyO6mXVC7FSuk+2I9FY7reQLMZTwwU1qoRaCryqWtC9MDl9B1GFF0fg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NQr9g/JR; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NQr9g/JR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1758911262;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type;
	bh=omEz+wFdx0ohgIjKJBpTCWSJKIUenOdRLSZclpyDyzE=;
	b=NQr9g/JRNqbxKR6a2xMwyrwijdw3mWvxfK6G3zZCi2kO1ui9EA9k+ps/PLtpbd2CmqGR2g
	X1VAY3XxIu0SzoPsA9azEoWQcJUShOJn+03qa/EhpwfRKyv4f8+/St8sRvI4p43euQpsxz
	b09/vXaEE/Str1y6KI3r4cOyhT++x3g=
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com
 [209.85.166.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-226-VVuVSebwOxqASzrOloYJVw-1; Fri, 26 Sep 2025 14:27:41 -0400
X-MC-Unique: VVuVSebwOxqASzrOloYJVw-1
X-Mimecast-MFC-AGG-ID: VVuVSebwOxqASzrOloYJVw_1758911260
Received: by mail-il1-f197.google.com with SMTP id e9e14a558f8ab-4248d44a345so33234665ab.1
        for <kernelci@lists.linux.dev>; Fri, 26 Sep 2025 11:27:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758911260; x=1759516060;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=omEz+wFdx0ohgIjKJBpTCWSJKIUenOdRLSZclpyDyzE=;
        b=Z2ApUgM0gyNDSz5kwpRb52efucBS1eASu2ckKwPfc2kQvwFEJL9GlSD9nP4hqawwxv
         s3JsZ8Xm1R5Uxnzy6fef7hOkd1DIL7B3kkgKTdE88pESFf4BRAHnR6WsvXI5LK2v5sKo
         rrGdTuNXON+KHIAglZpW/VG4sT0A+K0vCmdkPSI/aJivcjP4lphCW3e1ULltBRMbc45u
         Js9cyzZUC6aAiciFGHLcnYzD/gLql16DUlTYt5+dUQXyGLhtglMEdoZ96SE/aCFKeue3
         le2rUxGm/lux+Z/bYQ5EDE/lokOx64qNKFdTIxMGnV0EgHDgR0904smWmlVswQd0CtXs
         fKjQ==
X-Gm-Message-State: AOJu0YyttbEk6MNbkaQUqlsCVW+lqNez+RFF+pToRlWjNbuAsVoPHwJd
	B2exyiU1A+YMvBhSVUQ2nMjbWPIOI50tpSUiaVUMQSDydrhjK7Sj72ITCU9mnjSfry3uS8VBl1q
	J1q45VFJZeMgRMxs5jL4kbNWC+IWGMfIEt77hEgVaQktces44OQzCntKUn6RcwwzBUaYRLSsOxB
	yev5KtpC5BY5IJjDZXnfKKnRJ8qxRl7eL0AGvlU8HvqDFQMw==
X-Gm-Gg: ASbGncs99PU1IGzIdKNENpQGVCxIeIIWOf/oy/HmvooxvHzQKYkneXUTn6DmFqEhFrD
	xe1thg5E9LnBqdRHmYVxkB8K8HdgaYyTjWICqkwU2v4cCzDevqv+5r8YZyMn87Jds01xQyru2/b
	BahBzSOpx5p8J4/OnhkYA5qWZY2PmGFX9MxLMEaPI/xn92rraCFrJvvA==
X-Received: by 2002:a05:6e02:461b:b0:415:2b3d:651a with SMTP id e9e14a558f8ab-425955d001fmr109560315ab.7.1758911259887;
        Fri, 26 Sep 2025 11:27:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFyANmMYr0UR0wlEaQCqvEXgGlk1W8WvtboYYhluWsi87JcfrsLCfM7T+f4mzk/2G11T1f+EijAn6hWZdDrU58=
X-Received: by 2002:a05:6e02:461b:b0:415:2b3d:651a with SMTP id
 e9e14a558f8ab-425955d001fmr109560035ab.7.1758911259403; Fri, 26 Sep 2025
 11:27:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Tales da Aparecida <tales.aparecida@redhat.com>
Date: Fri, 26 Sep 2025 15:27:02 -0300
X-Gm-Features: AS18NWAugIEYHw1NwVkYIdnQ5Km6zVozy1nIMqe2YsTTbwLHdHQn93ej_r4JPXI
Message-ID: <CAPo4OxTg8BDtPF8wRNJ3PjGW1CC3U12q+2wcPyUwTG2D6TSxsg@mail.gmail.com>
Subject: Invitation: KernelCI Dashboard WG - Bi-weekly meeting
To: kernelci@lists.linux.dev
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: e-V3Q1NTXhwmeIW6z8eBPdrOnkhB9h4z9-ZTlfe5XOo_1758911260
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

Hello kernelci lists.linux.dev,

Next KernelCI Dashboard Working Group meeting: 2025-10-06 14:00 UTC
Repeats: Every 2 weeks on Mondays at 14:00 UTC

In our first meeting we had a lot to discuss about the dashboard performance,
its slow queries and views.

Meeting notes:
https://docs.google.com/document/d/1aoNpi69WRhn1nENbdAY1CPXYVkufbVnG_lFoGfA0aM4/edit?tab=t.0#bookmark=id.yo8r1aphxyzw

Recording:
https://zoom.us/rec/share/ZyuaB3njBSy1BYX0miudgo0ZGTd639dj2UiEFXW1QKtLTUFDckCMaDYTzvNN6fl7.DFG3MjeyXlmcNCeg

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

Senior Software Engineer @ cki-project.org
Red Hat Brasil

