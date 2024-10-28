Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03B121DB956
	for <kernelci@lists.linux.dev>; Mon, 28 Oct 2024 14:36:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730126212; cv=none; b=WzE9hDJz/YTA7D802ZRf4gbikp4EmmK9mRFahPkmkvdMgWAU/u+/twH9j5UYgqEh9M6NDseqQsh9kfPpnXdecFOUw5HroRRPfMu1HwhEcY3v7p2MR/H8Y2G5g2GnbLIEexhXXvXu/6VCKcNnV7y8Sea3Gm7WK23YRtzhd2vnYts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730126212; c=relaxed/simple;
	bh=AuCV83JNF5xt/o7+RdWbgGzw1E9aI+J1rqqbiHJI0pk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mvfJK8DOhxr5WK2d9yzntXKn6L4MrwWCgkwD8DvLarIql7GWt2u7QNZd44o1A4CTmviXNwfksYBEqZH99oygtmSNIs4P12x5dcnrQsJWE2E2KlpO5fw3p/LSoi9S2IikmdK2oxvaOcG2N0qZG02uxm2Vg5P2XOy5WP/bK/lM/mY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QXq16YIg; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QXq16YIg"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-539e6c754bdso3859839e87.2
        for <kernelci@lists.linux.dev>; Mon, 28 Oct 2024 07:36:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730126208; x=1730731008; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AuCV83JNF5xt/o7+RdWbgGzw1E9aI+J1rqqbiHJI0pk=;
        b=QXq16YIgMP7vY+2d3+arsFsvT1nckQoL3aQKvaii1rYSjVLFzeDbwOB3R6PHZQKfhJ
         B/BO+CL6/QSyU7AStgFRALASPVHZ+wFGO6iptp2bMnVll9/p2DgWPUHyrf1tT9Mms9Tg
         4Hv92QNGddGevi4ONKJJssDWLlHYTSRt3+5KIePzCU44VlrGAuG526EsAdpqZDpmDxoX
         YnICrcr0rTa9iztU6SJnm8nM5EGGnpxXmwC2CJAunUL0ON9Zi9Y2d9snfZwfahS6mZtf
         DV00FZ0pOFAB+ZAq8IubWWKvHZUsnaMIHqKtiasgfmCqi25iQYZlMu1S4msQeA8WbuDU
         jB1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730126208; x=1730731008;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AuCV83JNF5xt/o7+RdWbgGzw1E9aI+J1rqqbiHJI0pk=;
        b=ZdsjxEAqMxAdfTmqaw5SSY+1l8v+6e+FSU3TOFt3Gw9+ly4xFZ0FdIVnT1D5V++OQG
         nVMg/LeaD4oKHEF/XcEfYNFi9ywZWZRbeuB6s8kPq5+vyV2sKbfV18cG/ps0SPsl9RbY
         SX5JqXiQparnBPbtSIAF+VUWj7YM77dVgqYI34QPJ9E/ZfqHa6L+rfWFMqendUyzgNrt
         fvUXmKW0buFh8fQgJhHsHtavAXPrbUO2WOr93L+K7uTE2Ujq0cBn4N23T11yQYhb3WkL
         t5FGuu10jb+lrwnsBJBs0TCYYEAMUjAhfi/+zfiyLDW3zH2lOSmwHfBUcXDJBGnS2gHg
         jYHg==
X-Forwarded-Encrypted: i=1; AJvYcCWXFzqSHUeVl6L01cVgDRdns+69biQya7UyWD8TfkIunHkKlk9grjQHzfdjtCHDoexBpMLS+rfEoQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YytAD9McxaDGGocUY0HYBYOZ5Bw20mA9u4dj+O76GGPREfrZOvv
	6IA5HCC/KHL2CtXrqmK/o60HnqX3TCHShPGwfHYw0vkn9QG/VsdmVFoI3DsP5DlcV9OsP/3H5a1
	5KwcnHbvZEdSU9nByWrYoVFsQDVX/VDXdiJIgkg==
X-Google-Smtp-Source: AGHT+IFMXRyPb+X0jTeOQPVKekZJqG3FwwMxDwb4pHs5ttD6aPRHRy5s8zoMSwymv42X/0WESdQov/Yws8ZdNY7ZJJI=
X-Received: by 2002:a05:6512:3c8f:b0:539:8fcd:524 with SMTP id
 2adb3069b0e04-53b348e576amr3463522e87.30.1730126208152; Mon, 28 Oct 2024
 07:36:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241025-kselftest-gpio-set-get-config-v2-0-040d748840bb@collabora.com>
 <20241025-kselftest-gpio-set-get-config-v2-4-040d748840bb@collabora.com>
In-Reply-To: <20241025-kselftest-gpio-set-get-config-v2-4-040d748840bb@collabora.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 28 Oct 2024 15:36:37 +0100
Message-ID: <CACRpkdbBAa5piO8BJoxx04spOc22CBJ-zbi82BT9sG54c=csNw@mail.gmail.com>
Subject: Re: [PATCH RFC v2 4/5] selftest: gpio: Add wait flag to gpio-mockup-cdev
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: Sean Wang <sean.wang@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Bamvor Jian Zhang <bamv2005@gmail.com>, Shuah Khan <shuah@kernel.org>, kernel@collabora.com, 
	linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kselftest@vger.kernel.org, kernelci@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 25, 2024 at 9:46=E2=80=AFPM N=C3=ADcolas F. R. A. Prado
<nfraprado@collabora.com> wrote:


> Add a -w flag to the gpio-mockup-cdev utility that causes the program to
> wait until a signal is received before exiting, even when its behavior
> is to retrieve the GPIO value of the line. This allows using this
> utility to keep a GPIO line configured even when in input mode, which
> will be relied on in other tests.
>
> Signed-off-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>

Bartosz has to look at this patch!

But overall the idea looks sound to me.

Yours,
Linus Walleij
