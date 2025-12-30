Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8502C2C08D5
	for <kernelci@lists.linux.dev>; Tue, 30 Dec 2025 11:37:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767094624; cv=none; b=tZuuxXGNjD/Y8+gyg5SKF1Vg+/WyYsZk+MspssTv/BjvaNkqrq4NYdXYt8gnjOQMHuzKM+kexsBs5L6tBpZSfh08Yv39fz00XRbabp7KsHryS1LhXhdi54ZF5f3ZoohYLaheuf6J2+A4ObocA17cZ8Icq3UhT2mWHdwzNRuYfL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767094624; c=relaxed/simple;
	bh=8n8WP6t0YcDAYZ7kg3FzA+7B5fDmDzd8BrdVQJVpcRs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kZ04g0wut2oNGJPNCGGi+9C8VlOMtytkjofHLLjr9Grw0YbEER35lSUZCJMTcTu4GDtbKcdK3lObTC6WFNvD0mh8sghRyyd2ZvdK3uiXslEyQtFnAbvzJ4QyQxRgRxQddD+kjKuPXXK2o3Me8/2GmazjhYNuEIgqbFSVRC4x2Co=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NM0WnWix; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NM0WnWix"
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-37b97e59520so84900851fa.2
        for <kernelci@lists.linux.dev>; Tue, 30 Dec 2025 03:37:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767094621; x=1767699421; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4CmAFwrYbDuyMoa/BPWjtX3r2mUHX5vgd3DvqkBcFzk=;
        b=NM0WnWixzZJzX6ocgSPBcsi1bDWRrVMmv5ytrCItFKEKCVPoZabK426+DuTRUL6AB6
         j2H0Onuw4qy8DaaZoPDar6DRdumrgp1EdT1gT6syrHCSNSD3Vc1ny+8t194zDguAcvFf
         6AHj8BLTXxy5cGiSOGxJF9WrAmSfLpRk+VzCpqApMmwoxsl2fdkhW6bEQ7DQ0j164xt3
         4c9eFJb90DL9Y7iB+z1BSoA7e9NKMBTk2gC3shsCs50o+YYbSCQ/f1q8CVgTuAXqUYTO
         rHC1TUcBpKzVsDdmL51jWyYL0peoqZQ4J9VDHLcCnqU72HVoAS2dakpafk4rgceTN6u/
         rTFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767094621; x=1767699421;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4CmAFwrYbDuyMoa/BPWjtX3r2mUHX5vgd3DvqkBcFzk=;
        b=wmba2mdgnA/7kTHzCz7Za7bcfoJNPyyv9ge85z3OZvDkWFT8JqSMH+TG633NL856rA
         BnQbjIEkVMq0OzvxwlMsnuGiOVx+6lQ2J9kJx00gOERp33xSwLlo4sumnfWoGKcR+mOf
         8lP2E2HmlFAUlvrKq37Ylt3WR9G8SjgDp0l1vZ33b3l8MozvjQf6/NoL6QXP6B9WxEHp
         cx8OwqNnwJ6cpAATc+TokSSRyl0pBcKVgl8EP2LLOlbkn6wEJ2fGXeMtDizT6XQMiwz6
         ZN0oBw5JSG5M2TbiXIEXUS5v3FnLM0KpGC7RSsTKX/6mjb14q7DIv2oKWZGT4LDnh+tq
         1rng==
X-Forwarded-Encrypted: i=1; AJvYcCVCzIAmJxqlFOJbyPyH2Q97lLTpdHgXkHXz15NMjGd3Z31AGyegOVkJ7k6OY/bQAckhoK/SeLPNEg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yzjy+BTt8BAoyJ6V9RrymKV1ubQkKpyo7BOPLe0qvH71akto3TC
	fz4G6qabzM+qXG9jbKEeGJCauXDiLP3gdTLuqhCUFUr5b4GPCJDk9I2A
X-Gm-Gg: AY/fxX6/kBuApUbCwUavM5jFOOIKDU6fsov2lQdiFZY1+rQZEYkX4SkknF1Rm0Nrotn
	rgiBHc3VrCwL30BTAQasYqvWe8jSP1d5GfACY+fYMFcEtU2Nd8fIGBEXedJ1mffcnQvF9WrBzpo
	WXOjxcm6L/neNjmM1cWNCJa0aQaaRO3IrOxwX/S0O0hTJ304CXdSBdbTSoIbZ7gquPaDsk3fmSl
	FkwErZsrjRaIPoHYVpEAsNVMYXd/uMcc0Emv83wyfmd7TOQUO+OvWYPWdlumg6NL7j+4cfd4tJU
	Kgth5gKl7SMTpsWTs0v48CZBKWxMwZFHeu9l8a5VLv2RE1zwEa76r8x8jThShJUEu7ZDB8Mu+J3
	8DoTBH3Je4wiZiXz55899YG0SFQ7O2nigpTy2OIWWCoFnwc3SPQAKRNXqLf59xStUDjAo7UezGa
	HQKR35521d
X-Google-Smtp-Source: AGHT+IGF3gFGUozf4G9zt9Om+vstcNbw0h6yAp0aZ++ChCDii30yTV/4I9FiaTW4YuEjPjrGwT/sFw==
X-Received: by 2002:a05:651c:f02:b0:37f:8bb4:88 with SMTP id 38308e7fff4ca-381216bd8cfmr102647771fa.41.1767094620457;
        Tue, 30 Dec 2025 03:37:00 -0800 (PST)
Received: from localhost ([194.190.17.114])
        by smtp.gmail.com with UTF8SMTPSA id 38308e7fff4ca-381224de728sm89285781fa.5.2025.12.30.03.36.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Dec 2025 03:37:00 -0800 (PST)
From: Askar Safin <safinaskar@gmail.com>
To: nfraprado@collabora.com
Cc: Tim.Bird@sony.com,
	bhelgaas@google.com,
	dan.carpenter@linaro.org,
	davidgow@google.com,
	devicetree@vger.kernel.org,
	dianders@chromium.org,
	gregkh@linuxfoundation.org,
	groeck@chromium.org,
	kernel@collabora.com,
	kernelci@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-usb@vger.kernel.org,
	robh+dt@kernel.org,
	saravanak@google.com,
	shuah@kernel.org
Subject: Re: [PATCH v4 3/3] kselftest: devices: Add sample board file for XPS 13 9300
Date: Tue, 30 Dec 2025 14:36:16 +0300
Message-ID: <20251230113655.1817727-1-safinaskar@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <78b4f1f60563fc854f5f4a54b42e0bac60715070.camel@collabora.com>
References: <78b4f1f60563fc854f5f4a54b42e0bac60715070.camel@collabora.com>
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

"Nícolas F. R. A. Prado" <nfraprado@collabora.com>:
> While I understand it might be inconvenient that this is the only file

As well as I understand, it is intended that more files will be added
to tools/testing/selftests/devices/boards with various vendor names and
product names.

So I did some further research. I grepped Linux source and found some
vendor names and product names with undesirable chars.

Let's go.

/rbt/linux/arch/x86/kernel/apm_32.c:2097:                       DMI_MATCH(DMI_PRODUCT_NAME, "PC-PJ/AX"),
/rbt/linux/arch/x86/kernel/reboot.c:396:                        DMI_MATCH(DMI_PRODUCT_NAME, "PowerEdge 300/"),
/rbt/linux/drivers/platform/x86/samsung-laptop.c:1633:          DMI_MATCH(DMI_PRODUCT_NAME, "R40/R41"),

Here we see / chars, which are simply forbidden in Linux filesystems.

I also found a lot of others undesirable chars, such as "(" ")" "'" "&" "#" "*",
which surely will break a lot of tools. In particular, "'" is used in bash
to quote something verbatim.

Here is extended result of my research:
https://zerobin.net/?d1f2655a979acd3f#oBhwIedQvBL/iB9Src65aRYuyjaye2GQBNL3+6yfvGg=

Unfortunately, I'm not sure which of these names refer to whole "board",
and which of them refer to merely some particular device, such as USB device.

BUT for 3 instances of / chars given in the top of this email I'm totally
sure that they refer to whole "boards", so we have at least 3 totally
legitime cases, where we have / in product name, which simply cannot appear
in UNIX filesystem at all.

So, conclusion: if it is indeed intended that further examples of boards
will be added to tools/testing/selftests/devices/boards, then they
will contain all sorts of undesirable chars and notably "/", which cannot
appear in filename at all.

For all these reasons I ask you to change name convention for this directory.
For example, use some kind of sanitized vendor/product names.

> there are
> tons of dt-binding filenames containing commas in the tree.

Okay, I agree with this point. There already are a lot of files with commas.
But I still don't like spaces and all sorts of characters, which are present
in DMI vendor names and product names ( "(" ")" "'" "&" "#" "*" "/" ).

-- 
Askar Safin
