Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3CD3381C4
	for <kernelci@lists.linux.dev>; Fri,  9 Feb 2024 19:38:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707507534; cv=none; b=CKdCW0yD6bQ/skPP7c0kJASA/939POla3w19MG5LEYkvo6YohGi9jbhTpTx8K7jm1USmpksXpyBN11LKAKp4iuUQEcUAvbfl6n+Hl5IN9BogE01Bq9ujVurTHtDRdaJaCpwK8CCUA9IICNp3BzaaWFZlUCVlMBvSp4NoF4Xb17w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707507534; c=relaxed/simple;
	bh=/QT2qTeGJUUomRSSb09gThXaMOV/2DdZ5X4Gs2hiCYU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nDHHNww7KCJsSmfMkcqGxQmtJN9fnJhTzLvxaTTzBlS87LQ91EqNLEKTQqbIwnitFHI3gkz0EubgIUmcVXrV8nasscbQtx4w4MmHIrBGZqprI/jJPz69CGCeHpFdVoRQIXbPaDW/ZPnzvIFFT0epPDn9LLqE8r3mGwkFQdFWHe4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=36UT0f5o; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="36UT0f5o"
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-42a7765511bso25161cf.1
        for <kernelci@lists.linux.dev>; Fri, 09 Feb 2024 11:38:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1707507532; x=1708112332; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/QT2qTeGJUUomRSSb09gThXaMOV/2DdZ5X4Gs2hiCYU=;
        b=36UT0f5oJbd924ML+UCqxRP9Wd3cRgLFjmhtR7TtZ3s0qUdZEjbNurH1hhcc5V2/Q7
         XWO759cSiKys8LWAy5Aj3wYkl4aDSQAg2BPfBkSz3XEhG7/IUAjCCtCh8ROjiu9UwwcN
         7VkA80gZNEBEJEv9LnMe2/f5A52FE5MX+lJkNmRAxLhnAxP0FA9OXKQmSJlV6CZDR44V
         HgFdfOA+gTxWnfR4hbJDpR+8GITYQ0lQYAjRXRoGH08OFrMJGomaz+NtEMQD6gTFAOxL
         pfUKwaA0UNZmWBS1CZ+ZtJM0l2ib5h/A7ausgOBzdZp8ona9U61oxdv2gbZx99FftosL
         pUQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707507532; x=1708112332;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/QT2qTeGJUUomRSSb09gThXaMOV/2DdZ5X4Gs2hiCYU=;
        b=WS8tFj2NfezFrYIaZcKl9rka7Fmt5jmZy/4Nz3Yk/J/Y3XhRj/wYEgCMKiOcgUu/qF
         ebFiedQTXN7SSG6j/RX+ZF5dhaqy3n0B3sWu19QpawPy6nA9Rormb9QnFrG8qVCODM6k
         ICkjAlfIsexRGdA/e8hK2VPdxooMO38bGZ2HKtX+/hgyydZityJn73GfPvVytEri30Dn
         LRDDCzYmYjIsog3wq8m2NehwvVTLjk11UzUjqfqdGKY7zNXhQnMmmbPQIng8ehFPsrId
         fERxlCfh5WBp5WDd+7YvM3bOg1WG/0woXiSsyrG/13h2MHaTtadMscMWNMIXietuAWz/
         ZfRQ==
X-Gm-Message-State: AOJu0YxIY5dIcIGzS1ZHXuiEz1HAk/aQXOnr5cHX+qT23sdgm9blcEcQ
	YusaAOHkPOz15cfeuhFlR9u7e/wnnIpvoBF5mvpq1M2xM1mH3A8EvVY0O3oPtuBjTW5HsFnw4Bs
	pUtdvHv2RB16uQjLVgclCiy+POBmpfxT5Lk3g
X-Google-Smtp-Source: AGHT+IHU3c1rup/ERN9a4kNMsqW35sJUbJdOQFsb7DbzU77MCbHQzc7LNDoBqLVEWz0boeECKLGN8/41YUuWgXJj1ic=
X-Received: by 2002:ac8:1185:0:b0:42c:56ce:1702 with SMTP id
 d5-20020ac81185000000b0042c56ce1702mr237627qtj.10.1707507531703; Fri, 09 Feb
 2024 11:38:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAHRSSEzrL6uPEvrhW692=+=17EJt+6_-p2z0K5esG4Ff57MSpw@mail.gmail.com>
 <CAHRSSEyev9rcYpbe2VtALc9-4zR_Bz6=24yitFTa4U5X8N+S0A@mail.gmail.com> <9f58d16701b61a5fd05db7839f21cb8f0bf15013.camel@collabora.com>
In-Reply-To: <9f58d16701b61a5fd05db7839f21cb8f0bf15013.camel@collabora.com>
From: Todd Kjos <tkjos@google.com>
Date: Fri, 9 Feb 2024 11:38:39 -0800
Message-ID: <CAHRSSEw7T2LMGan3EzwjHTx8hkVLmbZmgByB9c5rgNNXDtSPuQ@mail.gmail.com>
Subject: Re: Please add new Android branches
To: Denys Fedoryshchenko <denys.f@collabora.com>
Cc: kernelci@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I see android15-6.6 on our dashboards now. Thanks!

On Sun, Feb 4, 2024 at 10:03=E2=80=AFPM Denys Fedoryshchenko
<denys.f@collabora.com> wrote:
>
> Hello Todd,
>
> PR created https://github.com/kernelci/kernelci-core/pull/2345
> It will be merged and included in today's production release.
>
> Thanks!
>
> On Sat, 2024-02-03 at 10:43 -0800, Todd Kjos wrote:
> > Please add the following new Android branch to kernelci testing.
> >
> > repo: https://android.googlesource.com/kernel/common
> > branch:
> > - android15-6.6
> >
> > Thanks,
> >
> > -Todd
> >
> > On Mon, Jul 10, 2023 at 3:41=E2=80=AFPM Todd Kjos <tkjos@google.com> wr=
ote:
> > >
> > > Please add the following new Android branches to kernelci testing.
> > >
> > > repo: https://android.googlesource.com/kernel/common
> > > branches:
> > > - android15-6.1
> > > - android14-6.1-lts
> > > - android14-5.15-lts
> > >
> > > Thanks,
> > >
> > > -Todd
> >
>
>
