Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2BA91391
	for <kernelci@lists.linux.dev>; Sat, 29 Nov 2025 09:56:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764410185; cv=none; b=OfOd/K2lfERF3sJyfyKacKlFvAlkbFlIEydtlhnJgs/ibKthbzKH/vdaPzrYeT8vbD4FNDByK89/ah4+0QX3GtGGTdLpvoHktIFoznoaY7ruwpLuGfFLSC6941DT8gX+r050PZvCvwBvhQv4zv2H02GZ+LyTbQJRbw6Rp/mQ5RU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764410185; c=relaxed/simple;
	bh=Q2Y3IPmwBn5oD4B92Exd9qbDGmi7LPEOGdwRf/VLEqU=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=r9V6qQ126DUVY6NcOEgyw9J0tHbzn006U0SxMfUYx354vdz+bE6de9EliEmBs+5WrL63+dHX5gwSvZEgxPmAdE7Ri8Ufznrjl2F7eaMjoFat6whnNyG155xyW4CbFRicT5NsRGKDO7/DjB4+D0H8F9j/QEMOoGMFRtHKDQQ+l0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=miraclelinux.com; spf=pass smtp.mailfrom=miraclelinux.com; dkim=pass (2048-bit key) header.d=miraclelinux-com.20230601.gappssmtp.com header.i=@miraclelinux-com.20230601.gappssmtp.com header.b=TNF7HIl4; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=miraclelinux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=miraclelinux.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=miraclelinux-com.20230601.gappssmtp.com header.i=@miraclelinux-com.20230601.gappssmtp.com header.b="TNF7HIl4"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3437c093ef5so2766745a91.0
        for <kernelci@lists.linux.dev>; Sat, 29 Nov 2025 01:56:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=miraclelinux-com.20230601.gappssmtp.com; s=20230601; t=1764410181; x=1765014981; darn=lists.linux.dev;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=FZ+4n7TrCCrIhsz/ZxnczyxMY49o6E2jMnRyBh4r488=;
        b=TNF7HIl4YlRZSBvLqHl1dBVPN6gJN1Z1Vl5+/DDHDExgucHLfxGgLUS71t/i1BpdkZ
         vvZlfvvgxt8GZFvawojOg4py5EtRGJoJ4APLgYdCizZ2MMhQ+ck8StmupuPr1rEMPBlt
         esHdYAGpMkb/H1HvNsYCkFz3ClAsvQvdhkM7O+rdUhrIhx0JkCpsaQWYlqjeGIkoeHv6
         e6AoWAACG95klySuN7nV02p3PbBE1MDki9hxNj0QtYD76ZBBaphRfjRJEWGlddSEscgs
         yOoCf/t6UhtwfG82RvYsVmNS2vuIEELSFRT6YvUEFEvWA2Mjuh7UsTp1Cj6yb3Y12ds/
         ElUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764410181; x=1765014981;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FZ+4n7TrCCrIhsz/ZxnczyxMY49o6E2jMnRyBh4r488=;
        b=HYeg83p6bDgALsbFSiaVaj44yjkR/MLLv4LaSNMzPpuqZf152Vtb3h3nY32LnH0Vqg
         Q3LFJ30iYEEfrTFESylyzIuLAVpPPAfuFpcer0mU80Wc0vbSYKDnSQHnAbq4+80W2VoU
         ltXv5cUnJRcA80GFqjZ5qP8dc/M0MKDhQUoYPWbnvVWXgk1XSASmyMMIDLbeGE5juMcT
         NY3Qy1MjfqJyppFyI5Sy+HKJS8fhQkZKgIUGOlCVb1sP8U6X3OwVdTQNUWAaB5S2VX6h
         FOuO43FnHupGauraI+i5DOueAdq86WsAp00ugQGlL8qWOIcD5epvTu6x3WXjl6CqCk0S
         fSIQ==
X-Gm-Message-State: AOJu0Yx3XkMzRRZRfQy+O5ix9d80Z1DdN7A3nK/w8UEPx92YJ/Xa06OX
	Vj3qf43XyocFPl+Emw/x4YPBy1MgPfIkv8vtXk7yW4AEhjmFAkO4Eunn2s8zaouOmNbxsbYC8fK
	QU/caMg3WdzdtECtu8Fzux1SpcUI4tV1yyjQ8BGaVQPqjUvbGjuI/zw==
X-Gm-Gg: ASbGncvfXTX+DcH7yfg5wxqy3+ABmpqUXfdvlKqQnm9/nAehSy+vfwyCf/cdysGCR+L
	CJKznZ7K+uSsrxkVIh7yXehhp4lhIXurH/k1+oeuEonpqahXvlRxjn7ekk6QvfBRfGnX8hrwS9r
	L/rv6hoSFKC2pFdkIrgWDPIAj0wI1kEpw4H322/cBldSKp4VS4HAYQs7uMlX11fPC+PzzZFoMZD
	uIqizAd7dgA+fJLr/s+y2VzPykNQJI6TWkg65jGoUkEq9mPug3EXhk+AHp53P0adFhPWvc=
X-Google-Smtp-Source: AGHT+IHLg+lZLkXXTOcfTIlMDbE5mk/B7Kywc8sZ8HY6nIQf8xn2mQXrmd/+kZaPDvzhCBlT+14ALt0eaxpxtlyUQ4I=
X-Received: by 2002:a17:90b:3c91:b0:340:be4d:8980 with SMTP id
 98e67ed59e1d1-34733e4dcd2mr32690165a91.14.1764410180051; Sat, 29 Nov 2025
 01:56:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Arisu Tachibana <arisu.tachibana@miraclelinux.com>
Date: Sat, 29 Nov 2025 18:55:43 +0900
X-Gm-Features: AWmQ_bkI6Tgfh9F3IchaeAnFW52jfLvNWzSWRAWXIGu9OnjUf7TQARa2I1eSI5U
Message-ID: <CANgtXuNsJwWHerEwbjPocFHF_ydaPtS-Ojn+3rCfJFPXt9RWAA@mail.gmail.com>
Subject: kci-dev real usage examples
To: kernelci@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

I=E2=80=99m giving a talk at OSS Japan 2025  about the new KernelCI CLI too=
ls
(kci-dev and kci-deploy), and I=E2=80=99d like to include a few short
real-world examples of how people are using kci-dev.

If you or your team are using kci-dev, could you share a quick reply on:
- Your context (e.g. vendor kernel team, distro, lab, etc.)
- Which kci-dev commands / workflows you actually use
- What it replaced (manual web UI, curl+jq, custom scripts, etc.)
- If it is possible the repository/code using kci-dev
- Anything that still feels painful or missing

--=20
thanks,
arisut
