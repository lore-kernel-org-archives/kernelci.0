Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5FC025EFBB
	for <kernelci@lists.linux.dev>; Mon,  1 Dec 2025 20:54:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764622468; cv=none; b=RXI57qeuysPu/XK5Mnhm1IHu/I/xrDnh43gCFdBwU+XYPnzOOREXw8a2yEYWovH3Jl91TiHznWlwiG+d36z6tmsuj1Q5S86mMZcb5eOvL1oTFWH8b3rXCMdhIKg57aXWqAlWZKZT/0gpYHaodVegQPADv5dmjDznQMXrbTvJIhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764622468; c=relaxed/simple;
	bh=kpaAN6+uD6ePMSb81xbgaM3vbQC38y7urjfsX37Yazg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Q82BEgaKyd/rfqcS35fMAXW4uAnUouXfv0WLn0OoVTqO6hLzVzNpGlQr/pbmuytspx+glYhI2TNSKf8spevjFFo7xI1u897fATb+77P6fRtktk1sOcgGDwXkwNoTK/rTBH56nkyKslahN7Yh/XV2QaBiDwd8Vi9qEaJxXoJe6R8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=gpGPH/Xf; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="gpGPH/Xf"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5942bac322dso5153709e87.0
        for <kernelci@lists.linux.dev>; Mon, 01 Dec 2025 12:54:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764622464; x=1765227264; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=kpaAN6+uD6ePMSb81xbgaM3vbQC38y7urjfsX37Yazg=;
        b=gpGPH/XfHUQ9sw5gnlQs6qVMHuyZW/Q6hCSaJs6nNsrtbkWoPHYfRA+iYrsDW3naLt
         0qSKD62iJz1ZTjlcsX2tc7IDvkALWlHkuU0rD22/rP08Thg2Uh650YcXuAQ6hPB/0p/W
         tg9+htaCX/gRSew3OL2xqMz5EtTNGZhGoWw8jgcOs7tEqE4dtO1DrAX5hINKj/c0xUQz
         2vGkoXlT4MXRsB/ANKFncWdXdeiybEOblWZGyDahOAcUNIL2jvQBOMTM16zDBDmXf7Un
         7RjuNlzGpqSz5aP9u+ypwrrVj1nchJNVOwAQRBSHR8BVME9BWICk/dY3t+P2pjMiVcmE
         p6Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764622464; x=1765227264;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kpaAN6+uD6ePMSb81xbgaM3vbQC38y7urjfsX37Yazg=;
        b=fUQuSOQod9wvJTY83iyp7ewSzGlVhKuiuR2r0b11H7yt+xQwoChzlWAsMSbqxAQdcD
         BKR0M3X49lhOA1F0EnC3uV0GVieREzvLh+ZV5S3pvb8JRKP2wgYkiYBzxUrmM2Z9+gIY
         M0aqSNBgwBe/8/KnstubmPLcQ/7kVouG7fcoqHOv4hRsnlI9MVoDNu/DoNro52DZHjLp
         Whe7t1KxRz2s7Mv/jkjRRsUXBij50evCxwftTrBuctwbSzA9/Gf9wJB9U2V3QENpKjBW
         pWGStJPBqMdsK5IQRY34H+qcAZy2vUCF58TKbBsuwZ6QXaOPLdvdvIBmf2WV6d9uFAcH
         hTZA==
X-Gm-Message-State: AOJu0YwLbjYAyhRc7wI0Ndb0SPkzoZN+6WoBhQSc9yH6nPaNyth2DNrk
	lC/OcSBGJ+oa3ZCigfHh/c3fdxv0Rk9dXujssWtiY7S5mZ58+sCo6pDluBRqWqur/hFV+zW4pLQ
	sTD3tiL4p+yt8u13lIfPZDbpHv6kfHn35S2wMb5Yz+yi8LVs7Q1bFWg==
X-Gm-Gg: ASbGncuSE2uvEsvPM8bLExDAopvxphWRi0pKTVxjbikAPZYBz/rcxf0LQGC4Y/iIUoa
	CMWUVuvoWNGGazKdO6nEh4anwMlVsYSFAfzaNMnpPVGtCvyD9/AVWqLZKhWIaEb+r3IiLUYQ3+y
	/8A3KEt5eUBtRQ/OUTWrUbcwMs0ySQBRyISPOB5SmHDCYcF1cTHgbGUoKaXOb2IsDyifgGvnyUi
	HlwsZtZCtmE0edwsqn2t9vqw/WnzCV+yFHAe8sBz4ewCEsmExQfN22dHfw0aPXtcCKlbAMcBjYu
	BvSMGx+IKqQ7TI6tSs9BDaAyfslaA2CzD/QPSQ==
X-Google-Smtp-Source: AGHT+IEu4wX6MOCKkNoHqv7MlFlU+5qQWiAYI0GUc7TA10wTa68Nhlm9qFLIazEe2FIe1t7/qWCl0M/hYNJx02HHG58=
X-Received: by 2002:a05:6512:1395:b0:594:2475:a160 with SMTP id
 2adb3069b0e04-596a3ec427bmr12830895e87.26.1764622464219; Mon, 01 Dec 2025
 12:54:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAHRSSEx3vyonQonF0cXOvnFS4=nZh_G4yRgpf1EsMNnXDrdTsQ@mail.gmail.com>
 <CAHRSSEx21B9g1nO8izBf1aNesfKLj5DcHgHLd7txtZQaysptaw@mail.gmail.com>
In-Reply-To: <CAHRSSEx21B9g1nO8izBf1aNesfKLj5DcHgHLd7txtZQaysptaw@mail.gmail.com>
From: Todd Kjos <tkjos@google.com>
Date: Mon, 1 Dec 2025 12:54:12 -0800
X-Gm-Features: AWmQ_bmornca9tqCDPG2WuRUV_TwObLlMoyzLAyzAKleI9PDiW9-3PZ6H_M7E6w
Message-ID: <CAHRSSEzYxAYwX8N+eLWjtJRpSTKi+CoMYnEDR74V7_K9Dok2Yg@mail.gmail.com>
Subject: please add android17-6.18
To: kernelci@lists.linux.dev
Cc: Betty Zhou <bettyzhou@google.com>, Tiffany Yang <ynaffit@google.com>
Content-Type: text/plain; charset="UTF-8"

Please add the new android17-6.18 branch to kernelci testing:

repo: https://android.googlesource.com/kernel/common
branch: android17-6.18
