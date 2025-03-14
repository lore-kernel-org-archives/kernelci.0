Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86AED3BBE5
	for <kernelci@lists.linux.dev>; Fri, 14 Mar 2025 18:21:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741976495; cv=none; b=tosxNFXLq9SEXrPnrh1HibtIYWxxzSVxTQrux2zF2r5TCcQiZzFBham/J9YWvD0eSQzdCf146RwvDjIyPfGbspuYR8F9JuBZjeQa+hlMXNBRF3/m5V8QdkxvHoPIS1KMjIkjhYdNMoeSdjzrUMhvK1NUmgWZ32h81er8Nme+uKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741976495; c=relaxed/simple;
	bh=LAhDvdhf5K4gNvgaeGroh8T6IoG4Wk91LDNrjm2qV1k=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Content-Type; b=qqHsFEYrLGb4iu4MpkrcQ1DMIt70wD1n0Eei0fvRo3lxzpehWtdybXi8jFZNhpp8y5GnVue4etKuN3F1nKYLuUraB2AU6DfQbtj4a6EbsgXTa6NhwBg4pZl2yf2x38qKLwmpnvYZavok9sF7iXK2AmXdDEr5KtkOkuhIhQ0jIIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dm2rrgDT; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dm2rrgDT"
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-30bfe0d2b6dso25571311fa.3
        for <kernelci@lists.linux.dev>; Fri, 14 Mar 2025 11:21:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741976491; x=1742581291; darn=lists.linux.dev;
        h=content-transfer-encoding:content-language:to:subject:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LAhDvdhf5K4gNvgaeGroh8T6IoG4Wk91LDNrjm2qV1k=;
        b=dm2rrgDTMSzytDgnjjAmMSdmjRgzMjt2okWtpemx9TAYuFYaFosZ/ofbxlMok1ITrg
         /ai9xkVXXEWg46GOOcSRqAswc+05aPL4QGAgEISif50TdyFIRSvr2lZNqBCyxlp5gwXg
         vb2DVo9HlVDPE5144gd16JSJO8sLvTN7oXczYVOBKbVaezudPtSpOUENHSIhRQDSB40v
         mdTeHoQIGDJ/d4WjHavcSjY4QlFnFKxDHkPMPGTMSphjwOuUbsOdVLk7tNz/0iJFKWtQ
         tpEcRBotL5ns/7ABYHfltcw4W/173tMaxnRHo6AjlZhkfPGOXWspdz+OFGQcbEsmS1Ky
         WuYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741976491; x=1742581291;
        h=content-transfer-encoding:content-language:to:subject:from
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LAhDvdhf5K4gNvgaeGroh8T6IoG4Wk91LDNrjm2qV1k=;
        b=nZY7D/xf+LD66lBr4/TjzHpj2NczsMCukCB3JeIpL3bNFGs+8VY1eQLWdwRPmo4R59
         XfXrD3AJH4dffVtNaCmog8eG7uobtMUF1KLAFB9CFkuI1NmkYljH2tlhQQ2Yyjfjzr9w
         exSAmgn1Fsw8y1hMBxapHASizH6JQOTivBsPqcscNNRm+Mm43FjXZmhcck0aO5Ebk3Gs
         kWH2m7CD7MwdmlrgAcY81e5dW/U5CdU5wrwk2bYVwlHQ/0VsNVHlt1IVQbCD+obvVoXv
         Cz9z881G1btYSOeXiI6JtyyqRBqv3eHCQnUhfcgLcPkb6AXEDYuXQ4QU7oxYG4oKl/4M
         U7Uw==
X-Forwarded-Encrypted: i=1; AJvYcCXh1nW2aWYEFHiA+8MrJUPFmrWXVjciHdVXaf8uzM0e6SiHIAXJI7jQLNozF8omP3jf8pzHaa0m6g==@lists.linux.dev
X-Gm-Message-State: AOJu0YyKF2Ke/AV8hR4pP/dGQFMtYhetMUtLbbRp7eatcOwQyJekGyMX
	gxur1lwIhE9Z3OHkJOuvAP8qGN18SJLJ18f1PdRaN5CvNL2wsV+b
X-Gm-Gg: ASbGncurAQuxmWwbQJ5bDMBLEoyk3861HsnIEb27gIgh4DJJkpiCqxyN6YUzUKimbag
	IgrfaRHQ16QmqX2OgwWtSDHx1BGR+exjL70il7FUC8240DfdpcB0OLoBAx8UuLBUFZy6qDjEkiT
	+hAvj4/5vDy0x4t2rmhRmFF1X9KwfM31WiWe7lVPisUXmwHgU1tBk5UkWdiITP7AN0L3pZZNqTE
	L/qO/WWRlwnndygyxj8j1AwSVRd0Vk1md7zgfKBeYDi1rUIkKnw2fga1hAaZUZ4Fm8KFJQ0QOGA
	24svnbpsfhcw8SlrBv3WeOiQbkDrxGchyoIsRh4fYCm7mKMsItJALIifGmlJQC2MIRlftZ/wXUX
	sSLkCQfvsHUEdBAU=
X-Google-Smtp-Source: AGHT+IFQUFYRm/mbpTK/t2pikQAT0Xubt4Vy23FhfzyX4B3TcSCdh/+VHIDQ30vvqjxq6OR+ruaVOA==
X-Received: by 2002:a2e:a9a4:0:b0:30b:a20d:1c06 with SMTP id 38308e7fff4ca-30c4a658bcfmr15277411fa.0.1741976491109;
        Fri, 14 Mar 2025 11:21:31 -0700 (PDT)
Received: from [192.168.0.167] (h-185-57-5-149.na.cust.bahnhof.fi. [185.57.5.149])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30c3f10ab4bsm6507941fa.50.2025.03.14.11.21.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Mar 2025 11:21:29 -0700 (PDT)
Message-ID: <4697ff8f-7d97-4bcc-938f-958662289ba0@gmail.com>
Date: Fri, 14 Mar 2025 20:21:29 +0200
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Nikolai Kondrashov <spbnick@gmail.com>
Subject: KCIDB: v5.1 - origin's build/test finish timestamps
To: syzkaller <syzkaller@googlegroups.com>, Dmitry Vyukov
 <dvyukov@google.com>, Vishal Bhoj <vishal.bhoj@linaro.org>,
 Alice Ferrazzi <alicef@gentoo.org>,
 automated-testing@lists.yoctoproject.org,
 Cristian Marussi <cristian.marussi@arm.com>,
 Johnson George <Johnson.George@microsoft.com>,
 "kernelci@lists.linux.dev" <kernelci@lists.linux.dev>,
 Mark Brown <broonie@kernel.org>, Philip Li <philip.li@intel.com>,
 Denys Fedoryshchenko <denys.f@collabora.com>,
 Tales da Aparecida <tdaapare@redhat.com>,
 Aditya Nagesh <adityanagesh@microsoft.com>,
 Sachin Sant <sachinp@linux.ibm.com>,
 Benjamin Copeland <Benjamin.Copeland@linaro.org>,
 Manoj Kumar <ManojKumar08@arm.com>, Michael Hofmann <mhofmann@redhat.com>,
 marcelo.santos@profusion.mobi, kernelci-webdashboard@groups.io
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hello again, everyone involved with sending data to KCIDB,

We've mostly finished implementing support for v5.0, so it's time for another
update. This time backwards-compatible.

We would like to add two fields to checkouts: "origin_builds_finish_time" and
"origin_tests_finish_time". They're supposed to contain the time the CI system
which sent the checkout has finished running the builds/tests it planned for it.

These fields are requested by the KernelCI Webdashboard team to help implement
marking a CI system's checkout as "done building" and "done testing". Note
that each revision can have multiple checkouts, from one, or more CI systems.

The new fields duplicate the general (but harder to implement) mechanism
supported thus far: sending individual planned builds/tests without their
status, and then sending their status when they're done.

Here's the corresponding PR:

https://github.com/kernelci/kcidb-io/pull/97

Please comment there, or in response to this message.

As the change is minor and backwards-compatible, I'd like to set the feedback
deadline to Wed, Mar 19. If there are no objections by that time, I'll merge
this change to the schema and database support on that day.

Nick
