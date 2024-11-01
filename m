Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38FE41553BB
	for <kernelci@lists.linux.dev>; Fri,  1 Nov 2024 07:55:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730447716; cv=none; b=FiUv82jdIv6jts2q4ixm/AZBcfk6G701PFtceHwwAuXxg1fSFxAX/0xAP/kQnfz6Wif1qnBXdqBwfnoiZ47YRkD0t63eMkE18AboBnnQO8uPh8/tuk4OsRHDXEREYD/g7pWrShcpF90FQcy3YD83GiHCnes0VTYO4RP4PBCYglo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730447716; c=relaxed/simple;
	bh=jIjKL4b6SYbqFeKrgXq9YMrJs6AykQJ52x4/MwJmLTc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=S0DxKESjYgD3eKJ3CDfiaDeSShw8CDaq1WPA4My9Aizm17mQs4rC3QvfVbhiHwh6dIove9Djdm/JsI+2LPQ4oyNzu+6bkOPdi13iYDVFGIIkals1KNQPzU0BgZdVvh6YMQivYakEIz/shHbOQUE71YIn9rCQwuK05zTU8haByzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=h3j0+5aL; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="h3j0+5aL"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-539f72c8fc1so2890299e87.1
        for <kernelci@lists.linux.dev>; Fri, 01 Nov 2024 00:55:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1730447710; x=1731052510; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v3scpQG8rDPy7dccdvb0ggPZwR6YQSFTzxlSNspAAiI=;
        b=h3j0+5aLKK+pEjGV7aZWHFI9Sxd3paEYDsSO8OmkwZsoLOiBDSbXfUy64Md0pVYGT7
         D+NML9rMRxTGtC0LkMauZBeKqkvoFDfva5emn9mxGWXmThtNd46gfX+nAHeJ2PrrjhbW
         AuFtcrgRClmJulOyN/JWPm44VINrvyS5Guw5s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730447710; x=1731052510;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v3scpQG8rDPy7dccdvb0ggPZwR6YQSFTzxlSNspAAiI=;
        b=Aorz27lA61v4PrfSzXfFF2sSVipXChOEUgcMZl0F40Oi/j0o25177kRooanS6eIUnR
         kK1OJsqHZS+iZ+hY9O24Z+lkG7nHxH2Nx2mYMyvY1nOVTw2zEu/F4ymlM6g1K9I7daTE
         pF9bQ4nl1rC6fvJBb+EIdpvO+zaTJwQ1floAoH75yCRboBYdzHqRL/zNTe8ptnasCpib
         ICnlueYHBAOoMnzpAUxK0TyFi0c+RourYs7SXN6Aslv7/boEBqW0zFOYwpakqdACB3ep
         HKYx2sSwtxLYtVSPwitGCy8Y3MsKs70ovlLaowxPAmhDpK4O9XiSepN9swzIkRDEpVER
         Wlfw==
X-Forwarded-Encrypted: i=1; AJvYcCWu3uQzuBjxe/IMeoFjcktf8ofKfQAW/l9lAXV62L5AnZaguPadULD6fm6zf/cTVEKsfNvadlhjiw==@lists.linux.dev
X-Gm-Message-State: AOJu0YygqFVKLJoViuB+qmqgGL+DF7RRPCXGxwGuo7XjNx0eHexI3Zrn
	g5Gu8l9U+2aMuZ5acRXbOBc8l42r5bBqPA1AjBMlIgrq7i12093/JVEyJ+iOXuP12P01z+SNbuL
	ISKoUrRRExxJEQHsvCcdfmXMbys6Myyl7LC0l
X-Google-Smtp-Source: AGHT+IFHp5ntUs0OfBYXAIVSOME07Jq9csDSpjBoDIGPyzJBlFKUtiIHFZznKS39Z4EjVqTm/HlKSNuPkafVheMa5iY=
X-Received: by 2002:a05:6512:3e1a:b0:539:ff5a:7ea5 with SMTP id
 2adb3069b0e04-53b7ecdea88mr6015521e87.15.1730447710300; Fri, 01 Nov 2024
 00:55:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241025-kselftest-gpio-set-get-config-v2-0-040d748840bb@collabora.com>
 <20241025-kselftest-gpio-set-get-config-v2-3-040d748840bb@collabora.com>
In-Reply-To: <20241025-kselftest-gpio-set-get-config-v2-3-040d748840bb@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 1 Nov 2024 15:54:58 +0800
Message-ID: <CAGXv+5H9OTCn033yoi6oxxRKG1G=vbrBK+aw+ZWwGPWbn=uWuA@mail.gmail.com>
Subject: Re: [PATCH RFC v2 3/5] pinctrl: mediatek: common: Expose more
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

On Sat, Oct 26, 2024 at 5:16=E2=80=AFAM N=C3=ADcolas F. R. A. Prado
<nfraprado@collabora.com> wrote:
>
> Currently the set_config callback in the gpio_chip registered by the
> pinctrl-mtk-common driver only supports configuring a single parameter
> on specific pins (the input debounce of the EINT controller, on pins
> that support it), even though many other configurations are already
> implemented and available through the pinctrl API for configuration of
> pins by the Devicetree and other drivers.
>
> Expose all configurations currently implemented through the GPIO API so
> they can also be set from userspace, which is particularly useful to
> allow testing them from userspace.

Missing signed-off-by?

Otherwise,

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

> ---
>  drivers/pinctrl/mediatek/pinctrl-mtk-common.c | 48 ++++++++++++++++-----=
------
>  1 file changed, 28 insertions(+), 20 deletions(-)
>
> diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common.c b/drivers/pinc=
trl/mediatek/pinctrl-mtk-common.c
> index 91edb539925a49b4302866b9ac36f580cc189fb5..7f9764b474c4e7d0d4c3d6e54=
2bdb7df0264daec 100644
> --- a/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
> +++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
> @@ -62,13 +62,12 @@ static unsigned int mtk_get_port(struct mtk_pinctrl *=
pctl, unsigned long pin)
>                         << pctl->devdata->port_shf;
>  }
>
> -static int mtk_pmx_gpio_set_direction(struct pinctrl_dev *pctldev,
> -                       struct pinctrl_gpio_range *range, unsigned offset=
,
> -                       bool input)
> +static int mtk_common_pin_set_direction(struct mtk_pinctrl *pctl,
> +                                       unsigned int offset,
> +                                       bool input)
>  {
>         unsigned int reg_addr;
>         unsigned int bit;
> -       struct mtk_pinctrl *pctl =3D pinctrl_dev_get_drvdata(pctldev);
>
>         reg_addr =3D mtk_get_port(pctl, offset) + pctl->devdata->dir_offs=
et;
>         bit =3D BIT(offset & pctl->devdata->mode_mask);
> @@ -86,6 +85,15 @@ static int mtk_pmx_gpio_set_direction(struct pinctrl_d=
ev *pctldev,
>         return 0;
>  }
>
> +static int mtk_pmx_gpio_set_direction(struct pinctrl_dev *pctldev,
> +                       struct pinctrl_gpio_range *range, unsigned int of=
fset,
> +                       bool input)
> +{
> +       struct mtk_pinctrl *pctl =3D pinctrl_dev_get_drvdata(pctldev);
> +
> +       return mtk_common_pin_set_direction(pctl, offset, input);
> +}
> +
>  static void mtk_gpio_set(struct gpio_chip *chip, unsigned offset, int va=
lue)
>  {
>         unsigned int reg_addr;
> @@ -363,12 +371,11 @@ static int mtk_pconf_set_pull_select(struct mtk_pin=
ctrl *pctl,
>         return 0;
>  }
>
> -static int mtk_pconf_parse_conf(struct pinctrl_dev *pctldev,
> +static int mtk_pconf_parse_conf(struct mtk_pinctrl *pctl,
>                 unsigned int pin, enum pin_config_param param,
> -               enum pin_config_param arg)
> +               u32 arg)
>  {
>         int ret =3D 0;
> -       struct mtk_pinctrl *pctl =3D pinctrl_dev_get_drvdata(pctldev);
>
>         switch (param) {
>         case PIN_CONFIG_BIAS_DISABLE:
> @@ -381,15 +388,15 @@ static int mtk_pconf_parse_conf(struct pinctrl_dev =
*pctldev,
>                 ret =3D mtk_pconf_set_pull_select(pctl, pin, true, false,=
 arg);
>                 break;
>         case PIN_CONFIG_INPUT_ENABLE:
> -               mtk_pmx_gpio_set_direction(pctldev, NULL, pin, true);
> +               mtk_common_pin_set_direction(pctl, pin, true);
>                 ret =3D mtk_pconf_set_ies_smt(pctl, pin, arg, param);
>                 break;
>         case PIN_CONFIG_OUTPUT:
>                 mtk_gpio_set(pctl->chip, pin, arg);
> -               ret =3D mtk_pmx_gpio_set_direction(pctldev, NULL, pin, fa=
lse);
> +               ret =3D mtk_common_pin_set_direction(pctl, pin, false);
>                 break;
>         case PIN_CONFIG_INPUT_SCHMITT_ENABLE:
> -               mtk_pmx_gpio_set_direction(pctldev, NULL, pin, true);
> +               mtk_common_pin_set_direction(pctl, pin, true);
>                 ret =3D mtk_pconf_set_ies_smt(pctl, pin, arg, param);
>                 break;
>         case PIN_CONFIG_DRIVE_STRENGTH:
> @@ -421,7 +428,7 @@ static int mtk_pconf_group_set(struct pinctrl_dev *pc=
tldev, unsigned group,
>         int i, ret;
>
>         for (i =3D 0; i < num_configs; i++) {
> -               ret =3D mtk_pconf_parse_conf(pctldev, g->pin,
> +               ret =3D mtk_pconf_parse_conf(pctl, g->pin,
>                         pinconf_to_config_param(configs[i]),
>                         pinconf_to_config_argument(configs[i]));
>                 if (ret < 0)
> @@ -870,19 +877,20 @@ static int mtk_gpio_set_config(struct gpio_chip *ch=
ip, unsigned offset,
>         struct mtk_pinctrl *pctl =3D gpiochip_get_data(chip);
>         const struct mtk_desc_pin *pin;
>         unsigned long eint_n;
> -       u32 debounce;
> +       enum pin_config_param param =3D pinconf_to_config_param(config);
> +       u32 arg =3D pinconf_to_config_argument(config);
>
> -       if (pinconf_to_config_param(config) !=3D PIN_CONFIG_INPUT_DEBOUNC=
E)
> -               return -ENOTSUPP;
> +       if (param =3D=3D PIN_CONFIG_INPUT_DEBOUNCE) {
> +               pin =3D pctl->devdata->pins + offset;
> +               if (pin->eint.eintnum =3D=3D NO_EINT_SUPPORT)
> +                       return -EINVAL;
>
> -       pin =3D pctl->devdata->pins + offset;
> -       if (pin->eint.eintnum =3D=3D NO_EINT_SUPPORT)
> -               return -EINVAL;
> +               eint_n =3D pin->eint.eintnum;
>
> -       debounce =3D pinconf_to_config_argument(config);
> -       eint_n =3D pin->eint.eintnum;
> +               return mtk_eint_set_debounce(pctl->eint, eint_n, arg);
> +       }
>
> -       return mtk_eint_set_debounce(pctl->eint, eint_n, debounce);
> +       return mtk_pconf_parse_conf(pctl, offset, param, arg);
>  }
>
>  static const struct gpio_chip mtk_gpio_chip =3D {
>
> --
> 2.47.0
>
>
