Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43A4B3446DF
	for <kernelci@lists.linux.dev>; Mon, 24 Nov 2025 22:35:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764023739; cv=none; b=KFxnIpofOkNxnls9aVYUpqwbr/7a5TDJ0Bx3WW0gDuU+h0c7V1ZjjY+DarPPkERnZc4jgZi0nRGeuDeQVRQLMyrjhY/UfPpjzGr2Go3LhInFU+YIvOVq/GuIPaR9qLM30aT/Ej05S1t/msZX9OmGlrZ1WNU3GupvDgsDeEfPaYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764023739; c=relaxed/simple;
	bh=wwn3C6SmwXX7qD1vR5eRR/72OXtljhMYw/HHmwjIllA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Tw4CLvFA26p1YDC7d+/efFUamuco6AXOXsJgw93UZFm21AtZAYhuJ948jgTO40xSHUI8QWs1+9EM22Ds+b/HBOPf4jetjo68s8cr7zFYiL8G1gM5SXHdtGTP6zqmfe18e9hC8TGFxuwXbr3wqsiPNh7CW/tECNPtooVXv6VquVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=qjhsDTCR; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qjhsDTCR"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2980343d9d1so33105ad.1
        for <kernelci@lists.linux.dev>; Mon, 24 Nov 2025 14:35:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764023737; x=1764628537; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0rm7sHRT2eanco6NQl01CJ9NC4dDuPgnR1DJ0V4Elc4=;
        b=qjhsDTCRCGiJ1GiyPLPXQ9pfk/F5e5rw3VODnQastxE+ofiexkuLotZ74WIXp/V4Sc
         vK4g1Zo4NeFraD6ZgJJeBT1CnHmnhfjt0foI2Zm/fI7zqCo4iQJMAXTwJbL1uMo1Vuu8
         CWKiUUntBQfzUlrMEE8wD34Vog61GJhFeEEwJJCbq/Lsn8CbRo//cdGymimscxWXRq6n
         mKh4jqCQfkupiPA2UFvT5ft6MjYdDLLDM+N0tGEEessfV3KogEEBxJ7HyS3Mwr3r+z3O
         WtovLOD6ulPoHimKTCcbzTNR9ZySh1tWoTlZfzW6oL+MqHqLDHhV+MvHBrA9/xfCsfKN
         HzOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764023737; x=1764628537;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0rm7sHRT2eanco6NQl01CJ9NC4dDuPgnR1DJ0V4Elc4=;
        b=Adj+jmAiA3FmkuPzspq6mThHnhBbMYUGRKHpKK3pgMTtkbCAC0n0Xf+zFuXDYovUsH
         OB9c9H94edghFoLsaaDC/Fd/54AWfK1XjnO4rAzUVUVPLDfV6k8Df2GpVqx2EDlqLec2
         iV5uefSa0F0+8TYHvk5O6ZmUMmz/y52+si/iul9fZ9YwPWY4tOCu5AHuIW3dDhXBQL7O
         SahH8qXF/yLlnREdJ98Ubj9YCJiRAVNTkYE/PCZpwSOS8rONYxbTPNcIgkL2r/BbZzdo
         11K8CPFSrW3BThou7p/WS3k681fc4FZKDGErk+/2bgbLmlLDUIxnX2jl7DEa2fapqOjq
         nVBA==
X-Gm-Message-State: AOJu0YwFtO1AmEbeOEVSbKS2ZZHBalTnIg3bsPH2vxd12wSZy6f1YCOD
	bLRuA8kTdM7fIDIsHZDQ3us7PFj2+CpyLWFfKvOIMGq9cibKHjJFPs2QUa69vENnPqydbeoXibN
	HFBafpuTjU0yppOd/q5oNbaknrHuDPHLd0bH60sJ4
X-Gm-Gg: ASbGncuUVDPdqku0BdtN2ky0HBhovAg2whNBaOlV0lFrk6/rewu6YdMI2D5pk74HqMq
	40oq7IaSwEh0HW/HydaLBGsKlDtTeKx9gqVkNGsUU023DY4E1uQjNKoxIbqJ3BOv0EUyUSv+xxk
	wP5qyRgX05v+vjHAbEQn50k4uFhRYMJwwpVxGs4NxCx4qnNax9vJU/WLAJWOoQleFf/fBcRNm19
	DiWnpeL+5/qQ5BlxF3/Af1FZUc15jxEm50b+I2EiFK3d3O6LVzBKkKR3Qyy6zO6juI59paJqe1a
	Wr600YzZ3DpFGMif0vUoUgzkdGQt
X-Google-Smtp-Source: AGHT+IEvA8d/tes341pYVwfvG5w7JYfrKXszTFNpK95gXKemJVaDaZml8nzLkZsHA7yM8KvhAf2HiKyxbQ9t/OMpykg=
X-Received: by 2002:a17:902:dac1:b0:271:9873:80d9 with SMTP id
 d9443c01a7336-29bac26a085mr212105ad.7.1764023737246; Mon, 24 Nov 2025
 14:35:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <176398914850.89.13888454130518102455@f771fd7c9232> <20251124220404.GA2853001@ax162>
In-Reply-To: <20251124220404.GA2853001@ax162>
From: Guenter Roeck <groeck@google.com>
Date: Mon, 24 Nov 2025 14:35:26 -0800
X-Gm-Features: AWmQ_bkxc4I8qhn5g5WZJ0gfV7C1dK0WPhgr9qMe0bfuYOJKDNVyUvJJdliHFtE
Message-ID: <CABXOdTfbsoNdv6xMCppMq=JsfNBarp6YyFV4por3eA3cSWdT7g@mail.gmail.com>
Subject: Re: [REGRESSION] stable-rc/linux-6.12.y: (build) variable 'val' is
 uninitialized when passed as a const pointer arg...
To: Nathan Chancellor <nathan@kernel.org>
Cc: kernelci@lists.linux.dev, kernelci-results@groups.io, gus@collabora.com, 
	stable@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 24, 2025 at 2:04=E2=80=AFPM Nathan Chancellor <nathan@kernel.or=
g> wrote:
>
> On Mon, Nov 24, 2025 at 12:59:08PM -0000, KernelCI bot wrote:
> > Hello,
> >
> > New build issue found on stable-rc/linux-6.12.y:
> >
> > ---
> >  variable 'val' is uninitialized when passed as a const pointer argumen=
t here [-Werror,-Wuninitialized-const-pointer] in drivers/staging/rtl8712/r=
tl8712_cmd.o (drivers/staging/rtl8712/rtl8712_cmd.c) [logspec:kbuild,kbuild=
.compiler.error]
> > ---
> >
> > - dashboard: https://d.kernelci.org/i/maestro:5b83acc62508c670164c5fceb=
3079a2d7d74e154
> > - giturl: https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-=
stable-rc.git
> > - commit HEAD:  d5dc97879a97b328a89ec092271faa3db9f2bff3
> > - tags: v6.12.59
> >
> >
> > Log excerpt:
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
> > drivers/staging/rtl8712/rtl8712_cmd.c:148:28: error: variable 'val' is =
uninitialized when passed as a const pointer argument here [-Werror,-Wunini=
tialized-const-pointer]
> >   148 |                 memcpy(pcmd->rsp, (u8 *)&val, pcmd->rspsz);
> >       |                                          ^~~
> > 1 error generated.
>
> This comes from a new subwarning of -Wuninitialized introduced in
> clang-21:
>
>   https://github.com/llvm/llvm-project/commit/00dacf8c22f065cb52efb14cd09=
1d441f19b319e
>
> This driver was removed upstream in commit 41e883c137eb ("staging:
> rtl8712: Remove driver using deprecated API wext") in 6.13 so this only
> impacts stable.
>
> This certainly does look broken...
>
>   static u8 read_rfreg_hdl(struct _adapter *padapter, u8 *pbuf)
>   {
>       u32 val;
>       void (*pcmd_callback)(struct _adapter *dev, struct cmd_obj *pcmd);
>       struct cmd_obj *pcmd  =3D (struct cmd_obj *)pbuf;
>
>       if (pcmd->rsp && pcmd->rspsz > 0)
>           memcpy(pcmd->rsp, (u8 *)&val, pcmd->rspsz);
>
> Presumably this is never actually hit? It is rather hard to follow the
> indirection in this driver but it does not seem like _Read_RFREG is ever
> set as a cmdcode? Unfortunately, the only maintainer I see listed for
> this file is Florian Schilhabel but a glance at lore shows no recent
> activity so that probably won't be too much help. At the very least, we
> could just zero initialize val, it cannot be any worse than what it is
> currently doing and copying stack garbage?
>

Or backport the patch removing the driver ? It is in staging, after
all, so I don't know if there is value in trying to keep it alive in
6.12.y.

Guenter

> Cheers,
> Nathan
>
