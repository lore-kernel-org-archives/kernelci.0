Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 339AF19D070
	for <kernelci@lists.linux.dev>; Tue, 28 Jan 2025 12:33:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738067602; cv=none; b=Y9WOuyGy1qJYMwLCVkL+zY4j+1AntVDKI/jREvw2zyvyOIqeJpq2x1D6IEwOAaNICV9eGU6Pltj/yU+EMCFebi4MDXGvsUb2Lor1Gow193XbEUfuSluwujQu0hWYoMKb/FGP8fxfmHYNs+SxlfU3EDRvP0Fg5xMK36LhX+tVzLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738067602; c=relaxed/simple;
	bh=UeV+qmglEQODS8xK2P0BHKe5glqL6zf+/MUL5A3QfLU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IDwgU6oAbonzuPlgfsO6dhfX8K0tf1xYmH3jkiuXEb9q3/GO44zwH5+2Uc+mnruGFEX/dG0iTXpj2cCXE3omWR1+35a++RMoRQMN/P31X4er7BioNMNY5MuKOLDE6I6bGNXKXTfRZ5D6dQJpkZsVFIPcN9xpT8vLWot4cwGB+MM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fva1nEPf; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fva1nEPf"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3862a921123so3736221f8f.3
        for <kernelci@lists.linux.dev>; Tue, 28 Jan 2025 04:33:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738067598; x=1738672398; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SaxXlr7JRW0jN1vZqbO+0wpauA50DxpP5DF46ktNdPA=;
        b=fva1nEPfQaMlmwVN3hpbcRDkQirfmKhx/dieArJKJ8M/6phcYYJAEPYS8iKXG2pidm
         ZLv5LsjPlXCe5cPDbu9UPjBzbfYK9xPqa4cp6qddBHM6xNtAxe/1r5CdhVj7SBvTEFTP
         RRc8TXfGIAm88a+XSV+b3q2hF0qfZdJ1+o3twgRp+alBCEhng82/GEuiGGS62r1+lztE
         IuWLZQUrdNN8YJguJh6UtZKK7ppvk4+3vaxV7UCCd70tY9fNuesrBREo/RbNM65bcD78
         MBgDrS3rWbNAgOojPqNS7CimlnisgAO+Tz9GpK5rqsuM8o9zF4ZeBK8xRHV3kyXtNvPz
         NJog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738067598; x=1738672398;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SaxXlr7JRW0jN1vZqbO+0wpauA50DxpP5DF46ktNdPA=;
        b=P42CMvrt+JA7eSq6jwuODBkixkuNdl4JmN4G8jz+VNCG1lYVsZ8eMAl7jTJuuXfGEs
         4kXHox+rxSmtgWjoCb5S1YrXG2NWy+bCfsyUikT3tmltm44pkyzeBpxE/Fic1qziMdfr
         GHREu9HHqw41Yx2pgSlLkA0sPmOwPYPr3trED6ZcRAN6SLDA/eJz13e0ofRFfqXiJ/gc
         3NwWB1k9LO06txnFgZBpGlStx1+KTio926eDFjOhM/cMEMPHOhXj37sW9tYkXfLI+9dE
         QnPke2uGb3plIuvQAeX0CCttXERGIF5v53zR9uwPNdzdr4o7epLNFR5tupDSpg2fZB6q
         VL2w==
X-Forwarded-Encrypted: i=1; AJvYcCVRf3DIcMD+BbF+gG+ey6PHPfqHZCzIaOC7W6jN2xpMkH9ngcFCkvdIfyxSQZZbVbFHoNkGifkoug==@lists.linux.dev
X-Gm-Message-State: AOJu0YyWPIzgFHfOs662AczcnkzxO9+355KbqyPOHZUQ3RrJ0Jgu+r1t
	hW4GMmUbNljvQq5OR0QLIyhLA7R4sHhFuQj6k3CWrchPyceL6Ls2NGTzl07SijU=
X-Gm-Gg: ASbGncslbfqYhPRnGWLdi37sqNQKIS9SEahHVPx/hetXwBbOxcuHEeUvLapRSw2MmSF
	X/8jli/BLzpolYhKoNdtl+ct8rF0ai5SZ/nL34BLOAk8nvbeKg0qMG9sMOsLjE375UAM3huqKVm
	2C443UaPHb3YnaE6DPsKEIu2HbdpViMyBLmmV7gTOsxGqvgU5RaEps72V6Lgr1BbjLVJLOvA9bt
	UmtTeNUH0ZmHTkdPVrvrJBxg/lQJZit1fNHvxRUv70mC9P7AIy0o6hQd2Qn1yOCGjkI3pdfkNse
	HHkHK5+p3n6RfRruR9OJ
X-Google-Smtp-Source: AGHT+IGTjX2lgddlGfDG+Nf9ahpSkkS+kb4WmJBNdZKk20gINg6VWYaHuLdaH0Zbv47E9dr/Gzf9sA==
X-Received: by 2002:a5d:64e4:0:b0:386:3864:5cf2 with SMTP id ffacd0b85a97d-38bf56633cdmr38729880f8f.19.1738067598441;
        Tue, 28 Jan 2025 04:33:18 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c2a17650esm14102499f8f.12.2025.01.28.04.33.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jan 2025 04:33:17 -0800 (PST)
Date: Tue, 28 Jan 2025 15:33:14 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Sasha Levin <sashal@kernel.org>
Cc: Mark Brown <broonie@kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	kernelci@lists.linux.dev, Al Viro <viro@zeniv.linux.org.uk>,
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
	lkft@linaro.org
Subject: Re: [git pull] d_revalidate pile
Message-ID: <6400eae4-1382-450d-a7b8-66f9e9a61021@stanley.mountain>
References: <20250127044721.GD1977892@ZenIV>
 <Z5fAOpnFoXMgpCWb@lappy>
 <CAHk-=wh=PVSpnca89fb+G6ZDBefbzbwFs+CG23+WGFpMyOHkiw@mail.gmail.com>
 <804bea31-973e-40b6-974a-0d7c6e16ac29@sirena.org.uk>
 <Z5gJcnAPTXMoKwEr@lappy>
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z5gJcnAPTXMoKwEr@lappy>

On Mon, Jan 27, 2025 at 05:32:18PM -0500, Sasha Levin wrote:
> [ Adding in the LKFT folks ]

Ugh...  The website is pretty difficult to navigate.  I've filed a
ticket to hopefully avoid this going forward.  It's a bit late for
the line numbers to be any use but here they are:

Debian GNU/Linux comes with ABSOLUTELY NO WARRANTY, to the extent
permitted by applicable law.
<3>[   62.179009] ==================================================================
<3>[ 62.180289] BUG: KFENCE: out-of-bounds read in d_same_name (include/asm-generic/rwonce.h:86 fs/dcache.c:243 fs/dcache.c:295 fs/dcache.c:2129)
<3>[   62.180289]
<3>[   62.182647] Out-of-bounds read at 0x00000000eedd4b55 (64B right of kfence-#174):
<4>[ 62.184178] d_same_name (include/asm-generic/rwonce.h:86 fs/dcache.c:243 fs/dcache.c:295 fs/dcache.c:2129)
<4>[ 62.184717] d_lookup (fs/dcache.c:2292)
<4>[ 62.185378] lookup_dcache (fs/namei.c:1654)
<4>[ 62.185980] lookup_one_qstr_excl (fs/namei.c:1678)
<4>[ 62.186523] do_renameat2 (fs/namei.c:5167)
<4>[ 62.186948] __arm64_sys_renameat (fs/namei.c:5264)
<4>[ 62.187484] invoke_syscall (arch/arm64/include/asm/current.h:19 arch/arm64/kernel/syscall.c:54)
<4>[ 62.188220] el0_svc_common.constprop.0 (include/linux/thread_info.h:135 (discriminator 2) arch/arm64/kernel/syscall.c:140 (discriminator 2))
<4>[ 62.189031] do_el0_svc_compat (arch/arm64/kernel/syscall.c:159)
<4>[ 62.189635] el0_svc_compat (arch/arm64/include/asm/irqflags.h:82 (discriminator 1) arch/arm64/include/asm/irqflags.h:123 (discriminator 1) arch/arm64/include/asm/irqflags.h:136 (discriminator 1) arch/arm64/kernel/entry-common.c:165 (discriminator 1) arch/arm64/kernel/entry-common.c:178 (discriminator 1) arch/arm64/kernel/entry-common.c:888 (discriminator 1))
<4>[ 62.190018] el0t_32_sync_handler (arch/arm64/kernel/entry-common.c:933)
<4>[ 62.190537] el0t_32_sync (arch/arm64/kernel/entry.S:605)
<3>[   62.190946]
<4>[   62.191399] kfence-#174: 0x0000000012d508d5-0x0000000023355f7e, size=64, cache=kmalloc-rcl-64
<4>[   62.191399]
<4>[   62.192260] allocated by task 1 on cpu 0 at 62.177313s (0.014839s ago):
<4>[ 62.193504] __d_alloc (fs/dcache.c:1678)
<4>[ 62.193925] d_alloc (fs/dcache.c:1737)
<4>[ 62.194204] lookup_one_qstr_excl (fs/namei.c:1689)
<4>[ 62.194741] filename_create (fs/namei.c:4083)
<4>[ 62.195129] do_symlinkat (fs/namei.c:4690)
<4>[ 62.195657] __arm64_sys_symlinkat (fs/namei.c:4710)
<4>[ 62.195954] invoke_syscall (arch/arm64/include/asm/current.h:19 arch/arm64/kernel/syscall.c:54)
<4>[ 62.196461] el0_svc_common.constprop.0 (include/linux/thread_info.h:135 (discriminator 2) arch/arm64/kernel/syscall.c:140 (discriminator 2))
<4>[ 62.197053] do_el0_svc_compat (arch/arm64/kernel/syscall.c:159)
<4>[ 62.197411] el0_svc_compat (arch/arm64/include/asm/irqflags.h:82 (discriminator 1) arch/arm64/include/asm/irqflags.h:123 (discriminator 1) arch/arm64/include/asm/irqflags.h:136 (discriminator 1) arch/arm64/kernel/entry-common.c:165 (discriminator 1) arch/arm64/kernel/entry-common.c:178 (discriminator 1) arch/arm64/kernel/entry-common.c:888 (discriminator 1))
<4>[ 62.197849] el0t_32_sync_handler (arch/arm64/kernel/entry-common.c:933)
<4>[ 62.198422] el0t_32_sync (arch/arm64/kernel/entry.S:605)
<3>[   62.198857]
<3>[   62.199577] CPU: 0 UID: 0 PID: 1 Comm: systemd Not tainted 6.13.0 #1
<3>[   62.200435] Hardware name: linux,dummy-virt (DT)
<3>[   62.201130] ==================================================================
[?2004hroot@runner-vwmj3eza-project-40964107-concurrent-3:~#

regards,
dan carpenter

