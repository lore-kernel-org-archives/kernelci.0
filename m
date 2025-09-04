Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E287A2405FD
	for <kernelci@lists.linux.dev>; Thu,  4 Sep 2025 18:29:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757010544; cv=none; b=mE+v0omNoIv4s+3m2gh+XGmLZqtCrYp6rc5EdtbHTzVRswGvSMsv6k+S9F9E3vOm06dh+xQMiQvRgoIiFwp4A1xWmVQWNpPuFjWcjjbncdXGXIXUSp7rDYvD2cSk8xgRkGibS14u6E2uOyE9LCNvmaL/S6Z4OBnlMmPGb5S1SLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757010544; c=relaxed/simple;
	bh=1IhYcwGUl8SSxodcWMgicd9FHdKM5nYuChgkzGF1E/w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hQj4/qxiRuTLIFL3MvfKn1iDZS/SL9CPSHHDBlyU6YGjqOID/jEoCUd5WG4KZ0tFSA2kC0ab0v8oMNeH6UHp+NwXAC0wL8+eJ78JdCpIp9P1gsR1cqjzaOB7IA1yf9h/ll3VARQCyRNPXk/9+Hq4OqfjN6Y0lV2tpKVawtaMFJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=adHniR4n; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="adHniR4n"
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-71d60501806so14001837b3.2
        for <kernelci@lists.linux.dev>; Thu, 04 Sep 2025 11:29:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1757010540; x=1757615340; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CTh8uZKE0aeg+MwTY9xwDMF/m2QVRsKWDeglS1YUU8o=;
        b=adHniR4nMzTzo9I4MBUSFFcnfo19kk2hoOjZGp9QcELKm1ARzv/ULKETmbDyZIdZND
         pDr0NI7SacTR/NE7J3fml6OwLQOX1Eof6YYWNs+9NhSjq671KL9EvylOzMydPDBGSrpX
         0ffjTE2tcwUm0graphtH6lDk+5EpFZlG2tCOENoDB8k/kJ/gFRQwkjeELDHa9PbiEp0c
         1uSk+JD5PIOq12eyWakjWKkZWNzLmtDEigX2DGubWi09wp6R/AGLjQjOtezgcPuT/C7v
         4lfp/SYySimmPifI3suwoVxojpDfAIgQWveGEoZy6+65EZKRXZbtAfsY3p5Wt4ViJdiu
         kiAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757010540; x=1757615340;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CTh8uZKE0aeg+MwTY9xwDMF/m2QVRsKWDeglS1YUU8o=;
        b=ly8uMv4QktdujzCkU742UvS7TBA6zlzlKPJ594NNugd7QvuV/Rmdcd/p1U+bLD5KY7
         WjoN46qsapBbo9RNZ2htN417gF0rPI+gMnk6g6V873qiEddHnUueFAPYOMK5s9Zu24hC
         ybh9IGUd58E4zuNb+AvNWUdyI5HMqnXcnFx4NmHThnhQSekcYwrSO3nDQJlOh4hRtKlo
         zsyuKqIqHjBEJS8lrRlokGpsakxw2oDtWjeHw9s4g1bQiniRSMAb+HvwbWKUw8DyR9Tr
         H0zc1rKDB1UTWXHkZWFdRIHXKi1XwUh3HHdpKfpuIbOmECTlp+H6FhC5v6VrECCtOXFJ
         0wHQ==
X-Gm-Message-State: AOJu0YzFld/fjdHFc+ddeKXz9i83xQgqtd4tRF+YSdCCP+OgduRsYMsg
	gp33wKC0J4Mlcpj6cLq9Jn5qYCWkbGO7KH2+t72TFNlRmkPoqcxB15ZK+m3wcsEreERcTHVAB/n
	AgY+MzWelqvDVsM1a4LQtFu2JEszhYJlqdoGgDoGpsA==
X-Gm-Gg: ASbGncv91dEPQeGX/DgpKmYqsJQj83pGQ2sXixUGXIGNo2t7he4Togl7qxUue/lut1D
	nu4Y8PUokOKZgv14eps0qgKMdZJIEPAnO0J9zrA72BDli6hH0f8aIeSkUVyOOdt4ou840UBqUWq
	bEnjwAULMG0PEIGhBzvrsxMnJMG57w6cczPrOMtWNHXheSOMTumYJopOJx16l2E3iz8cGCBiePt
	X1NpFo5SOZp28MKKnM=
X-Google-Smtp-Source: AGHT+IGKkpr2dFu3ii9jwdTUyRQQly6yeyIIpYHZF49bePfCQjoFUdGzSg8oZYfECsDGzXZuffKf/4RdDYd79TYfWOs=
X-Received: by 2002:a05:690c:4a02:b0:723:b3d4:1cfd with SMTP id
 00721157ae682-723b3d4277amr94497857b3.54.1757010539433; Thu, 04 Sep 2025
 11:28:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <199077d9fe2.7b4205005094745.5898848305828715448@collabora.com>
In-Reply-To: <199077d9fe2.7b4205005094745.5898848305828715448@collabora.com>
From: Kevin Hilman <khilman@baylibre.com>
Date: Thu, 4 Sep 2025 11:28:47 -0700
X-Gm-Features: Ac12FXxCm87TQzeW7Hh8gctSVK153YZGyxgepxb5DrP-PSCG_XiqaJ1Fq2tndZw
Message-ID: <CAOi56cVoV4GoidU=yP8w=p6KXL_8msye3mtmtxJnQFOzcmC6Rg@mail.gmail.com>
Subject: Re: KernelCI Labs Working Group
To: Gustavo Padovan <gus@collabora.com>
Cc: "kernelci lists.linux.dev" <kernelci@lists.linux.dev>, 
	"chris.paterson2" <chris.paterson2@renesas.com>, "ben.copeland" <ben.copeland@linaro.org>, 
	cfi <cfi@pengutronix.de>, broonie <broonie@kernel.org>, sjoerd <sjoerd@collabora.com>, 
	"f.pflug" <f.pflug@pengutronix.de>, =?UTF-8?Q?Pawe=C5=82_Wieczorek?= <pawiecz@collabora.com>, 
	Tim Orling <tim.orling@konsulko.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 1, 2025 at 3:55=E2=80=AFPM Gustavo Padovan <gus@collabora.com> =
wrote:
>
> Based on the interest during the workshop, we=E2=80=99d need to cover the=
 West Coast timezone
> as well. So an initial proposal for these meetings is starting next week =
on Thursday,
> September 11 at 7:30am PDT/4:30pm CEST.

I'll miss the first one due to travel, but generally speaking this
slot works fine for me.

Is the goal for this to be weekly?  bi-weekly?  monthly?

Thanks for organizing this Gustavo!

Kevin
