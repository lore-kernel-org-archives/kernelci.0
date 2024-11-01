Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B03C55896
	for <kernelci@lists.linux.dev>; Fri,  1 Nov 2024 07:42:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730446930; cv=none; b=U99TtKxMxjeIuc+s6mWGOG833Ke/upkloOLOFZNH4EtXxU4WPNxXjrvLxTdRPnnQ64IpQY4DflCOZjTXJ/F0R0XyzPD3cTcl5pQbQmoV6EGKzKIvbQht9y39s+4YpM41NWIhF4Mh1gd90YCfrJ11xRgrnmxCijhUxrysZWh+XBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730446930; c=relaxed/simple;
	bh=g+B7AVhh8UjWeq4IJJekLF0zC8V8tvpQXB0el9dq2a4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IrzZssKR5uzg4cp+O5P+jx81PYjSmsH+auwp1AbkSupZ2GwQmrNF+g3YZ/5Ej7dzV7XFebENQJJzSTt6eY8pgybTcpkqCC6tmAz9sprAPwGMoEK3Mqc7PkvETF8OTqz73AG+4QCk9bvJ1Dckcea/Ydei6biYWl9fNdFfj/OOWDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=LbW7nbw/; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="LbW7nbw/"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-53a097aa3daso1647333e87.1
        for <kernelci@lists.linux.dev>; Fri, 01 Nov 2024 00:42:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1730446926; x=1731051726; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AIdrzBhxaYOudwVJlEqwarkgMuVinNcfj9JrlrLM6E0=;
        b=LbW7nbw//lfSsNmxoWVqBZLArd7yYSRljak8VtW3837f5W1b/vDDjfzACDDsow0f84
         yO96/veUCO7nE9zUWnUnhoxBqThkSq1Cy+B5Hkt7oxVd9kAfuzdlNoUUuwUypMzb8vtp
         2UX5UbZBwHHvOrY5Y2D71HxiwRogATgQ1VgTc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730446926; x=1731051726;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AIdrzBhxaYOudwVJlEqwarkgMuVinNcfj9JrlrLM6E0=;
        b=jWFRC6pc1AsCO3pJfQ8yvgV6uJIMByMOTrbpphoJ48SBhgmD9xmaU1gZxxKPN75VG5
         hVovYOJtF8/zsi0Q/m/7sJkEon0yo1LEmDGaxd3ixkGecqgfqwA+tlQUsvCp43SL62eZ
         fIAyl08D+5GeFHOv8RRWaJqSPakIUOr3L6gH0zBUsmfJeTaDt/NE1kBNZef+mOZLJgpa
         Vfi/Ta2RSj8m9Br6qsUtMhdAZJFlwPqQYkaXKs8Ok8WbjiTOMS097dbRzDAhdUWxZHvz
         uhpILHJ7Xz/z5yjw5PWTNc/SsjjI7eb58GG2KikMd+u0uRglQfaeIOw++TwTewEQWZye
         eEzA==
X-Forwarded-Encrypted: i=1; AJvYcCU8Y1wgXZnatGCo7oXNx+D/JhH3uqn4bJVmEjNk/huQnpOe5jOCK9ZdLYfc0SOV7aFzZtd0i11fjA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzhsQZWkndhRr+R+IHvu1aFjOCNlLrLlpgq+fmAbh4LfsePYdUK
	UgDLuhyHteGn/Yvkgtnc+k4BUu0l9oirPjlsb2/bJH97CNzm9lSxRmHqoKXKz3Hw1Q7wgkht/uC
	1F6SpL/BlyHVDgKGEAzwXzO9Y7iZr87i3mY/9gI6Qvi9EnYE=
X-Google-Smtp-Source: AGHT+IEH94/fyCantPWg+JSDsdCT1KoXU+c1gdEceLGqvlXMPVHqZ/SsqaDoW07J3kRkVsMcqqlDVlzNv5mQm5MpnK0=
X-Received: by 2002:a05:6512:3e22:b0:536:54df:bff2 with SMTP id
 2adb3069b0e04-53d65e265e8mr1216351e87.54.1730446926248; Fri, 01 Nov 2024
 00:42:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241025-kselftest-gpio-set-get-config-v2-0-040d748840bb@collabora.com>
 <20241025-kselftest-gpio-set-get-config-v2-1-040d748840bb@collabora.com>
In-Reply-To: <20241025-kselftest-gpio-set-get-config-v2-1-040d748840bb@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 1 Nov 2024 15:41:55 +0800
Message-ID: <CAGXv+5HNwk2B_01_o90nZ1smDcZoFf3O-4-+n+E7vKtLTS9-rQ@mail.gmail.com>
Subject: Re: [PATCH RFC v2 1/5] pinctrl: mediatek: paris: Expose more
 configurations to GPIO set_config
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>
Cc: Sean Wang <sean.wang@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Bamvor Jian Zhang <bamv2005@gmail.com>, Shuah Khan <shuah@kernel.org>, kernel@collabora.com, 
	linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kselftest@vger.kernel.org, kernelci@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 26, 2024 at 4:06=E2=80=AFAM N=C3=ADcolas F. R. A. Prado
<nfraprado@collabora.com> wrote:
>
> Currently the set_config callback in the gpio_chip registered by the
> pinctrl_paris driver only supports configuring a single parameter on
> specific pins (the input debounce of the EINT controller, on pins that
> support it), even though many other configurations are already
> implemented and available through the pinctrl API for configuration of
> pins by the Devicetree and other drivers.
>
> Expose all configurations currently implemented through the GPIO API so
> they can also be set from userspace, which is particularly useful to
> allow testing them from userspace.
>
> Signed-off-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

> ---
>  drivers/pinctrl/mediatek/pinctrl-paris.c | 26 +++++++++++++-------------
>  1 file changed, 13 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/pinctrl/mediatek/pinctrl-paris.c b/drivers/pinctrl/m=
ediatek/pinctrl-paris.c
> index 87e958d827bf939aa6006794287698be4936f25e..c9455de266a447ab7f5446c15=
11bef0ef9c9128e 100644
> --- a/drivers/pinctrl/mediatek/pinctrl-paris.c
> +++ b/drivers/pinctrl/mediatek/pinctrl-paris.c
> @@ -255,10 +255,9 @@ static int mtk_pinconf_get(struct pinctrl_dev *pctld=
ev,
>         return err;
>  }
>
> -static int mtk_pinconf_set(struct pinctrl_dev *pctldev, unsigned int pin=
,
> -                          enum pin_config_param param, u32 arg)
> +static int mtk_paris_pin_config_set(struct mtk_pinctrl *hw, unsigned int=
 pin,
> +                                   enum pin_config_param param, u32 arg)
>  {
> -       struct mtk_pinctrl *hw =3D pinctrl_dev_get_drvdata(pctldev);
>         const struct mtk_pin_desc *desc;
>         int err =3D -ENOTSUPP;
>         u32 reg;
> @@ -795,9 +794,9 @@ static int mtk_pconf_group_set(struct pinctrl_dev *pc=
tldev, unsigned group,
>         int i, ret;
>
>         for (i =3D 0; i < num_configs; i++) {
> -               ret =3D mtk_pinconf_set(pctldev, grp->pin,
> -                                     pinconf_to_config_param(configs[i])=
,
> -                                     pinconf_to_config_argument(configs[=
i]));
> +               ret =3D mtk_paris_pin_config_set(hw, grp->pin,
> +                                              pinconf_to_config_param(co=
nfigs[i]),
> +                                              pinconf_to_config_argument=
(configs[i]));
>                 if (ret < 0)
>                         return ret;
>
> @@ -937,18 +936,19 @@ static int mtk_gpio_set_config(struct gpio_chip *ch=
ip, unsigned int offset,
>  {
>         struct mtk_pinctrl *hw =3D gpiochip_get_data(chip);
>         const struct mtk_pin_desc *desc;
> -       u32 debounce;
> +       enum pin_config_param param =3D pinconf_to_config_param(config);
> +       u32 arg =3D pinconf_to_config_argument(config);
>
>         desc =3D (const struct mtk_pin_desc *)&hw->soc->pins[offset];
>
> -       if (!hw->eint ||
> -           pinconf_to_config_param(config) !=3D PIN_CONFIG_INPUT_DEBOUNC=
E ||
> -           desc->eint.eint_n =3D=3D EINT_NA)
> -               return -ENOTSUPP;
> +       if (param =3D=3D PIN_CONFIG_INPUT_DEBOUNCE) {
> +               if (!hw->eint || desc->eint.eint_n =3D=3D EINT_NA)
> +                       return -ENOTSUPP;
>
> -       debounce =3D pinconf_to_config_argument(config);
> +               return mtk_eint_set_debounce(hw->eint, desc->eint.eint_n,=
 arg);
> +       }
>
> -       return mtk_eint_set_debounce(hw->eint, desc->eint.eint_n, debounc=
e);
> +       return mtk_paris_pin_config_set(hw, offset, param, arg);
>  }
>
>  static int mtk_build_gpiochip(struct mtk_pinctrl *hw)
>
> --
> 2.47.0
>
>
