Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1C241DB350
	for <kernelci@lists.linux.dev>; Mon, 28 Oct 2024 14:37:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730126273; cv=none; b=Lbndl0cqG/jYQJ52rgEwBMl3UfSLsBX5LBS8ospVTFKi9Qm5Kod4ZrhVsljttVrnXKcIanY2yTJLvdOOoLhfvL5Ei3GgwDaU2KM7UU3nzYG40q2GdSMqubrvk6T+eGuPG3Ol36xTcufhaN9aiOLU974db2pFCxs2s1uff4Zn3AU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730126273; c=relaxed/simple;
	bh=PJVoaxehblCKmdHBph6FbwKv7y3g2I/GW3hKFWio3YI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OeZXIQhVG0j3nhvypLy8aUY5uDY3aaPUu2OEWJ3Aq+lr13dMNgvxB4FkMltzmEQeykKr1bqxmDCJuRZlcByCIWoz5MztXfoXfEt42FCNLHJ0GP+/0EzqvgIN2zXBrdH2WpjH6nmQchAqbreaHZzSr0MO0TFdxUlKwG5RKVXy6dY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VM08o95L; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VM08o95L"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-539983beb19so5215054e87.3
        for <kernelci@lists.linux.dev>; Mon, 28 Oct 2024 07:37:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730126270; x=1730731070; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PJVoaxehblCKmdHBph6FbwKv7y3g2I/GW3hKFWio3YI=;
        b=VM08o95LAUhojgewdg2rOqCBwn/sRMwahn+PFavBuFT+yXOLaP3SmvLuszkKpbbRh+
         ylb+In+raYzO9YsVyOQMxaqmTDRRZQlo1qYanf/cAVMdKhSBVAH6gs0i1jiVrIq6XwCl
         RpTLs4wi90qsQaIeFaophgRiQyoONRVeGkp8xtGN949mAgnotX7NhksmAbqB06xcViXg
         xe/Y8mWDRtEx0V2ooR/nenzkKz90UJ1NUr11Wzidkox9HmV1AwD6cXbUad9aZbOXKqon
         d1yX45hKRpc/G834D9kRbXcz6z+d240z0OdSjSPjrfnwhH8PhCzHu1cfivGwsOsubndh
         jWcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730126270; x=1730731070;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PJVoaxehblCKmdHBph6FbwKv7y3g2I/GW3hKFWio3YI=;
        b=sG9BKpf+RZhceJRZ+oz3h+nigTSI9ca/NRJHYZYQc5yGyGNvUoE7cVsuTbpfCzTrKn
         Nfr79y0rcWvPMqEwckgrbKrgYn3qCZu5K34zBQ/r8jSsOKT6MR6uXnkACBHnLlPMevrN
         8JXpoZHukIW3iaL0Sb5uZhPOplUaSPoou3T1U2ThbQlQ9iutdo4bksZZHzTeqRm/hohJ
         i+REizS3N8rjVl92/vWVPkBd6sY7oJiyth/nTLRLtaHrxucmbD4dtMFgqQmpLrSpGVpU
         +6pYNeJCabpBSF38mfuh1Upr8f2WKK/HTlER7fi3MGdHw5vAng71aE6+AH3dIUINIX0S
         6KCA==
X-Forwarded-Encrypted: i=1; AJvYcCWJTc42t2j1A231US5/8PcgnA3RJfTtO2ZqaByBSCxOX+nRIoPrVKhi9FCfiIYd1mCVsR1WHHk0kA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxtA5V5FGL2xAjPrhLX94LucYPl21tiArbOVrp4whObLekq4U5x
	uEV6AxvEvufS4HHMsBZGoJzE3F3eSB1d1HU5Q10okiJOHjYYh3v9ixKRBuHEzKyXLjIn7zhyoYt
	nlrp2f4xj+RhZCq4nBsLDlKyGsROT+X4u4DPbTg==
X-Google-Smtp-Source: AGHT+IFM0/yV2rcX60bAr1jwz7/ljMj4gRvX4g1B3bqoWSs6hvQQ1s7ThycVBCr4zTDLzqa054swjVaA1m5A272EI3Y=
X-Received: by 2002:a05:6512:3f03:b0:535:6992:f2cb with SMTP id
 2adb3069b0e04-53b3490efc1mr3742461e87.42.1730126270080; Mon, 28 Oct 2024
 07:37:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241025-kselftest-gpio-set-get-config-v2-0-040d748840bb@collabora.com>
 <20241025-kselftest-gpio-set-get-config-v2-5-040d748840bb@collabora.com>
In-Reply-To: <20241025-kselftest-gpio-set-get-config-v2-5-040d748840bb@collabora.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 28 Oct 2024 15:37:39 +0100
Message-ID: <CACRpkdZONPzUOzYiN0+kd_wFdiF-2Vk+wKC1psmR8P9zF2c=AA@mail.gmail.com>
Subject: Re: [PATCH RFC v2 5/5] selftest: gpio: Add a new set-get config test
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

> Add a new kselftest that sets a configuration to a GPIO line and then
> gets it back to verify that it was correctly carried out by the driver.
>
> Setting a configuration is done through the GPIO uAPI, but retrieving it
> is done through the debugfs interface since that is the only place where
> it can be retrieved from userspace.
>
> The test reads the test plan from a YAML file, which includes the chips
> and pin settings to set and validate.
>
> Signed-off-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>

Bartosz needs to review this too.

It also looks good though, thanks for expanding the tests!

Yours,
Linus Walleij
