Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC3BA411661
	for <kernelci@lists.linux.dev>; Mon, 14 Sep 2026 22:15:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789424120; cv=pass; b=oEKHkmheFZG8+m0JCOWMk6eNUo6a/6chT59pwBZhc0guloHDiPEtzUzrNYbfugcB2zhqJt99ZINuI8aXEQKGH6qNfCzhi16a/DhEPG1F5Wf01tLFZxPoCmqqa4YfnqG49RkKcAXSlLUCGqwvffK7BxhzXePuR0b92tgNDuPc4xU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789424120; c=relaxed/simple;
	bh=z3JXGZ0BsGfskV6iI5IQgqYPaENam9XuXuYfkTFKDU0=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=tJLI5PhJzUKAfRoFmyGJ1dZW59HZHIkMqF7C0aTxL9NRKHIKiHWRG5K2G1KK/UvZ8CbiG26I53hirzViTDGgmgjCGjaEtVP+WadPcaN++Xcm7dr0USSsj/ALtcamdKBHCqyJdRwGNz1JYu7QLmXT0wrkjzAFlEHO8ifhDPf2y6A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=profusion.mobi; spf=pass smtp.mailfrom=profusion.mobi; dkim=pass (2048-bit key) header.d=profusion-mobi.20251104.gappssmtp.com header.i=@profusion-mobi.20251104.gappssmtp.com header.b=ybZFYPVG; arc=pass smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=profusion.mobi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=profusion.mobi
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=profusion-mobi.20251104.gappssmtp.com header.i=@profusion-mobi.20251104.gappssmtp.com header.b="ybZFYPVG"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c299de66a99so276233266b.2
        for <kernelci@lists.linux.dev>; Mon, 14 Sep 2026 15:15:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789424117; cv=none;
        d=google.com; s=arc-20260327;
        b=GRqEEV7vVNthUXdYsp3zubeiVR9iJ5M9tS5zJ8mGx7AWhNUDL4C4/uS2ZMQmqG/gwa
         6SagJxhYo3W3LJabvd3TTKhagke7V3zUkvw9XTOeN1oeE/9ElywWz5UT05N0W2DB0LuM
         5/6zJEnOA7Cz9xzU6l0obJ3vZJsrWBMkpiq/Tx53Vit6Ynr1qHBBqCOpjze277itjQdg
         ublapowDQgOIi4mmS5eORbD07yzUp4HCeBikPRfZtg7j1b+5WTxKyBbDb10yEUVGkfrF
         USpyXj+sZlL5iNY5NuwIZcMHVk8c6P8eORPaxQ9SiY/yTUNaYG0rYWbfnhNVNbvuRuKM
         9f7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:dkim-signature;
        bh=z3JXGZ0BsGfskV6iI5IQgqYPaENam9XuXuYfkTFKDU0=;
        fh=rmq/YLFzDAglBwji5AmBmtb7cJxq3EZCkg46fu2xnLc=;
        b=gf6YI5YK9zz6k6+p29djyTDIjOKDEIzsHODQ92DofX9bnqtLtMvGhh6dJG4O7FgXXT
         C6s1fxeV2rceJCG7r0QIOy33PBaRInEKHGoM/eIG0Jipbg68FLW5bG3AmtamcyZCHkSP
         M55uVzRs/whTnKkjc0xKr2ckjC2cQjZnqi8oym2WTLb33G8dYCFC4mCCiQl7kK9xpH3G
         9mAIrV2cF7bUMvon15cFe6XdECEOjTIerTtbYN47JskoaBIyozQhgoprixxvORc10YSn
         PhGnkThmfvGHeHUG2W80E2qvVSAFCgvrSvQDZo3X8BDQdrFvTqU29fUIKe/t5TcuzaSr
         MyFA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=profusion-mobi.20251104.gappssmtp.com; s=20251104; t=1789424117; x=1790028917; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:to:subject:message-id:date
         :from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z3JXGZ0BsGfskV6iI5IQgqYPaENam9XuXuYfkTFKDU0=;
        b=ybZFYPVGhJCAvrEyVDIKCU55/ZMY7rv2N1s6gHkKrjDBdVfHGj8sLufSCcLN1EQLUc
         FbS4m145rWplhcMjwH2n9V9id/1crAIGrxifIsx11jsN+Ux5m0rO6j3jIJ33Ypz4j59Z
         7ARe9Omy1gn8VE+4aGz5W6F2uV8eQP/vR/ztt5A7uw0PXoxbwpIWJ8o3cZvUbS7W+Klg
         VkPCOo/624yMwsaP+UBVXewHqVv3V3OQ/BorpiQnZnP5sknzgdRkv3x/hcvwR3Y8B0q5
         3XeAQ8wcCKrtySwjbT7iG+7rSur65i/NAUOiBPT+uVkS4Xco89+dCRa+OhqyYa+LinO+
         dkbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789424117; x=1790028917;
        h=content-transfer-encoding:content-type:to:subject:message-id:date
         :from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=z3JXGZ0BsGfskV6iI5IQgqYPaENam9XuXuYfkTFKDU0=;
        b=GBMRGauB0H9WK4/p3j4KnDFwM0ccwIMUaEi4qOEfs+SeBncSAcoaVC3DngxnaxfqZn
         yqwUwO8df8ckHT+43GWfoK2TitVlKv3eilryH5koFbHFFXg1GFOQjWzYsu3xwydkWJz3
         B0J7WfbJm9tOe7Y0WBifJjM84/KmJ5fb0nAG7m2qSAP98zcHPFQGdk/N7ePNy8aWNrU8
         6XObEM6WMQaclksP6tIvvIy0piOTkDQE+1qRBIDudBSMciTW0Vvgpxr2FbLG/h4lMa3o
         0IW+ghHSy3fZK1ftFH1iCKYMXtfM2QafrZUwcm6ciAvlZdJ8jxzYwHF1EE8GYyTcSgsk
         W5xQ==
X-Gm-Message-State: AFuF++nUHXKh31DJOgui9xyfubdRun/TSbv9xjVTqkGhMSQ8IdRI7LWF
	NE02qhqLUkc0pn1/Vpk1KXrIuB7PZp4/ccu3NX/DxzUaVeRtBlByto2k+RE17+lJpSdEVf5TFZ4
	cIDEVrJU0KyuMnG5LYHVchbejtqkgN6VLVI3F3zENqgFkRTPh8NnSMZI=
X-Gm-Gg: AYBFou0g6FhpIzFFONRJbRX2bxP2HtmJWwvvql6REvGSWR0hLB3U0uF4k3prn9Si/e/
	w0Rmw8HpACkRU3rCL8eKGzQTGeG3xzu+e/BChn8K6TAmDzp0ufff9HQzU/zoPcPP1f3eHVTJBd3
	M2blecc3qutjXLD0QWxPBvmKq1REGArlaQGN/DI/fSTb43QivuKjUSeaMc6nAdyaTUa3NedLaDh
	7yt5zZDA4xp/MSZcHYaJJUZJI+eUF35txEmHuq8ATLDnge4MXAzJ0zmU63Ys+1xtBg2r7zyqtTN
	GUbL6RAZ1VQPk9MQIulRcj8hKmJ/axYb+mxsewjT6C8d+vRoWLE+RFNvMt+f2pxeJP4/s2Q/g61
	ZlhqnkCapLv4=
X-Received: by 2002:a17:907:980b:b0:c29:8a0e:4458 with SMTP id
 a640c23a62f3a-c29b861ef65mr312786366b.7.1789424116983; Mon, 14 Sep 2026
 15:15:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Felipe Bergamin <felipebergamin@profusion.mobi>
Date: Mon, 14 Sep 2026 19:15:06 -0300
X-Gm-Features: AcwNN1UMoi_8GKZR2BaHkXrgTva2TG1fFbzS5k64suSupZq1Tf8TpE_MJ7WViiA
Message-ID: <CACcoU0GRMBuzXYFyc=crqB3eDQ=9-QDZzBRVgf5eYeJthMsnfw@mail.gmail.com>
Subject: KCI Dashboard updates
To: kernelci@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello KernelCI community,

We have deployed a few updates and fixes to the dashboard.

UX

 =E2=80=A2 There is a new Labs listing page, so you can browse labs and the=
ir
origins instead of inferring them only from hardware and tests.

 =E2=80=A2 Tree Compare now filters by exact From/To status pairs. The old
change-type chips remain as shortcuts, shared URLs keep the pairs, and
the last edited list is remembered locally when the URL has none.

 =E2=80=A2 Issue details show the next checkout after last seen on the same
tree, and include a lore.kernel.org search link for related discussion.

 =E2=80=A2 Hardware listing and details now use the selected time window: b=
oards
tested on older checkouts still appear, and the trees on a board are
the ones that actually ran it in that window.

 =E2=80=A2 Listing pages that crash on a stale saved URL now recover with a
full-page error UI, including cache reset and report links.

 =E2=80=A2 The metrics coverage cards wrap to a 2x2 layout on small screens=
.

 =E2=80=A2 Collapsed test-path groups and leaf links in the tests table are
reachable from the keyboard, with focus rings that stay visible inside
the cells.

BACKEND

 =E2=80=A2 Hardware details summary queries are substantially faster.

 =E2=80=A2 We updated frontend and backend dependencies to address
high-severity Dependabot alerts.

Best,
Felipe Bergamin
KCI Dashboard Team
