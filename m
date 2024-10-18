Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4538204953
	for <kernelci@lists.linux.dev>; Fri, 18 Oct 2024 20:44:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729284280; cv=none; b=lsKcYdOYUiEZ9Wb/MflEjju8QUD5I3WNdbTppp1jBLLt3NJpsFQ4fND7MFBWkK7wzlbe4hpqcZtst0XHL5T+vNDzneqQuEECXajxu8pnSNGU71Xw33KSGDxvC1yL2dyus3LH1NiWo6cDNllqpCQQn2jTKG2xWgXYYJutLzpzJwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729284280; c=relaxed/simple;
	bh=69qRsotGQXPciyrpKEn9wE08eXZVkhTmsPipXvaAhuc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tqQ5fPT2ZnCsImJoG69CvH2pI95noOp8bxuqenyeZUcmUGJomjpi3F6xSbFjqivB504EUq0PFwJSpbw99HD6rbCezkkkFxtGj+OAHyTc3YZiTY91JSzZcXO8g9EPj+eCDv8ovzUd7XkJNlI7ly2M+Yv+6RTssTJkSQ3ZtYXUxDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=K/BL8iS9; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="K/BL8iS9"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-2e2e87153a3so1834771a91.3
        for <kernelci@lists.linux.dev>; Fri, 18 Oct 2024 13:44:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1729284278; x=1729889078; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=69qRsotGQXPciyrpKEn9wE08eXZVkhTmsPipXvaAhuc=;
        b=K/BL8iS9Ed4A7iRAKp3s6fL5ewBd9LWpZ/Z+SrmZWWIEA2hW39i9f9x5U2d2IrA88W
         MFb0tEg6X8BoIvwyuQj87nsDK1fu2aHY8rtqYwarSl//ONLkEpqc46bqbQV/y8X5QvwI
         SWdnDRdhkBGkix8XgxtTxuQeCuo2MDZR/g2XcBzKvupuPq4HX3NywvKonuf3V9ndfB7m
         j6snl4XU+ToWKbooxc5vZSF9aePqpRdQ0q9j0sEPCuydsmipvq08RQNp+wuDT4F7M6sE
         iAWy86fBi/Cdqq5kED8u8EkLItkEBb7N2lkoETLx0WOI78RmN2qrho+WSojj5CHiq9jt
         vluw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729284278; x=1729889078;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=69qRsotGQXPciyrpKEn9wE08eXZVkhTmsPipXvaAhuc=;
        b=Ylr1qDK8Ags60l50eSerRr42IeN+Vw00DVNNwEiGaKjO2jYk1QY5EdXhzmUmcHt72U
         wJKOTN3Il7D1W9dcLy3ZRvP1mjg9So3M7lfaPTKAsbFV2j4ZUWlnNDSvoO4cDt4O8a7/
         16nAd1LSpu964BgW/v6uRdNJ1qbJ54y92ZJucKiWMp7PSajUQ9gH5BnHWERilyH5Fnpt
         El1ASR9/TqxQRuwoWmNxCRD9SEylVOFiU+K8Z/s+3in6JofGd/MqHewXJdcDecLWkorB
         s2rN2qeb/pnhGCDxl9H1jyYeM+ap0knQdIBMIMtUK7GyXucUdlMfRKP1YLuh4tCpDnJk
         2GXA==
X-Gm-Message-State: AOJu0YyloY5fd10yx2Pkx7e+Vhb88RTPECfcEFhxab30QHEpWA1u8pFs
	hZBf5sMoW08Naz4fdnNTvzf5KviRJYX8Aro9IkxRMTan0wBE5DBvDxVIwvv+FtkGVm6r8JICXen
	Cv/enPYp+1OIxdJaiOp3R/uqadF6dpGQ584hA
X-Google-Smtp-Source: AGHT+IGKAaD6Cr9KqZ39BEBtjr3cdfgDFwrYGWM3vKO/Ps92Ubmz0jwSfsigpW26faUoD40Q1bCXhuVLV4i1MbIxf7Y=
X-Received: by 2002:a17:90a:cf8e:b0:2e2:bd34:f23b with SMTP id
 98e67ed59e1d1-2e5618d0f5emr3896587a91.32.1729284277561; Fri, 18 Oct 2024
 13:44:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAHRSSEx3vyonQonF0cXOvnFS4=nZh_G4yRgpf1EsMNnXDrdTsQ@mail.gmail.com>
 <CAHRSSEzk6QcBkdA4UhOfQzFxzLy9njSvZ67zgGpw1HZir=42bg@mail.gmail.com> <47-6712c080-3-9f748b0@144132032>
In-Reply-To: <47-6712c080-3-9f748b0@144132032>
From: Todd Kjos <tkjos@google.com>
Date: Fri, 18 Oct 2024 13:44:22 -0700
Message-ID: <CAHRSSEy=5waf9HDH=c-x6O22L9jxY-Wde1afkTkSanfMAk3KHA@mail.gmail.com>
Subject: Re: please add android16-6.12
To: Denys Fedoryshchenko <nuclearcat@nuclearcat.com>
Cc: kernelci@lists.linux.dev, Viktor Martensson <vmartensson@google.com>, 
	Betty Zhou <bettyzhou@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Sorry, I goofed. Yes, the branch is android16-6.12

On Fri, Oct 18, 2024 at 1:08=E2=80=AFPM Denys Fedoryshchenko
<nuclearcat@nuclearcat.com> wrote:
>
> Hello Todd,
>
> I noticed it is mentioned android16-6.12 but then mentioned branch androi=
d16-6.6.
> I guess correct branch is android16-6.12?
>
> On Friday, October 18, 2024 22:48 EEST, Todd Kjos <tkjos@google.com> wrot=
e:
>
>
> Please add the new android16-6.12 branch to kernelci testing:
>
> repo: https://android.googlesource.com/kernel/common
> branch: android16-6.6
>
>
>
>
>
