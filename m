Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C812167265
	for <kernelci@lists.linux.dev>; Thu, 11 Jul 2024 17:20:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720718455; cv=none; b=P9rVgdfLxR/k5l0P04/ZpQ46xG9a9sAdWFuOwvBbF3Ms1Km0Z0SNQ+kylgd4jg5tKA1SegEs7aIvzEGdQGUdUwX3yH3ihuaeMe840gpk/t4d2BSQh2QCyezR3iZ+0JrUngS0BSl+U5j8OaqBf4EaNFzwsK2VqY2u7SRUoB30LIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720718455; c=relaxed/simple;
	bh=bQCFHTqUDEGJtrm0PRlAo1VL30xPoARJ7mL9pgncbts=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ghdwJbrllolrXlxL/p1AZXjI6Qa9CIJBBHzJwNmFyBHs+adY5S3L73pL9bjew+KsIgf5/ysoHNPHp1FJ8fjN0Du3MeOdgW1q6j9B7AM35R9BIMZtrXwNDm+OR0Fwh68uskb033xoGNEBl+Ldz7aw2pKMt+x69x0Ue2y/lzLEPYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=F5c5TLiW; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="F5c5TLiW"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-58c92e77ac7so449a12.1
        for <kernelci@lists.linux.dev>; Thu, 11 Jul 2024 10:20:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1720718452; x=1721323252; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8rc8P6/Gkox8hWpcJ8ejJ4CAMX+Fj2WEWkiOfST4VQI=;
        b=F5c5TLiW721FXzB7arhxiZUEJvhmX3UamVnRE6byZTSI4vBk1omYktO8uDFu6o5b4W
         yi8oNyqfH1fRJr9FVggS42+LmKjAAOKA4Ly8ha/t24jsRQUZU5ML427heRDxNTtIGt2A
         BziCrPJk40LEIjYH2n42Um3yBwkyJMrRHwQHOlDKBo3OLxMStDeKlpXYYDJZUcMgLP1s
         0tY3O0pEXnZGH9kk4zuUt0jC3xIkU4v+703lldbfv15Y2kPeIsKKfBsFD+t6dL8zWC4S
         B/0d/Ve62fVBkuW+geKhEqpMmHt2aFkNzmJ1yUZJtGTbynIf943Yh/YhnYLHXb4iQYOR
         jLcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720718452; x=1721323252;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8rc8P6/Gkox8hWpcJ8ejJ4CAMX+Fj2WEWkiOfST4VQI=;
        b=bBJt2bPAoAMGT5Gb50aTZNuIy4KhXhU73nJ7a4/tJL4hgIYey2wxSbuOjYp5NAegm9
         rKXf1DSdP3AMWSp8Pkym2LZb5rkKXlDQhmDdahY3dtNVNsmGzjgYEoLRLqYdLm3c3C3K
         5tdDMsOdm61ywPJGnA1qoXmaQRJAdr8XQQd6r5aRE11Dt5iN5GLkixpE6boKxdkothC/
         5P4rViNP+mkeI40j09kn5mFkhJQtpTgiwjgvaZ/zoEULMf3fT5aC1VS0pOdy6zDHBQmt
         dnGlMhu1c5OS7v3tx3nBOmpkptD8TsMLsLzSnyWqdiOdWQ3wjp+c5NzZ0RWrgUIRwpZv
         oGnw==
X-Forwarded-Encrypted: i=1; AJvYcCW265yeUDl7JC+DamqCHQCRdjYAgeCmkHODbvm/TeFAhbt+iAgGeEUrMniChfZcjuFdI1lWptCteMjloAaIgcwh3gtIhY+y3qU=
X-Gm-Message-State: AOJu0YysUJorrMB9Tw2wUEVDNGbd91tz16yhHza6yZOrLBdIXqc9IY8U
	ghbWUc3tXsT5tIj97RmipiIHWKkiHqvnjzn1kSXGDfrcVcHSx2Y+CIE2bPCX9O909dXYG5KkTXF
	PJ6adSkNFQPTp9UGqQvK+GtyBLvQNocvs9oOw
X-Google-Smtp-Source: AGHT+IFWLaipy7GnGeORQOfTcwRRASu+UDP3ykjau7jsMZQKPyOfyJuVg5F1gOkRed/BOjqwINTB99o7lTgXqjk7iGA=
X-Received: by 2002:a50:cd5b:0:b0:57d:436b:68d6 with SMTP id
 4fb4d7f45d1cf-5984e60d8acmr209035a12.7.1720718451469; Thu, 11 Jul 2024
 10:20:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <962098da-8dfe-8a77-169d-ac1b2902b8b8@collabora.com>
 <CAHRSSEzH+PF92DrbPXKPwpaoqEPhh1hWKL8vio9Ou_-ejcb0Bg@mail.gmail.com>
 <CAHRSSEyp35+k4v-ak1qp0vvUOWJjTnJkWhOtCO5MCS++zL2u6w@mail.gmail.com>
 <CAHRSSEwYk1oGmJEn5xvB91GKSmaJ_ku5D7hvbS00Jb9-piUbOQ@mail.gmail.com>
 <a5fef4b96be3c80aff75eb3b20e1edc90e8bfe42.camel@collabora.com>
 <CAHRSSEzfXJU=GcyC_HfUUnNQdyjT8S68HqhN1bdaB6NE0TPGsA@mail.gmail.com>
 <961641f4-e0ed-48da-8336-186e3b8d23ea@collabora.com> <CAHRSSEx+1=8N6wEDFwiXoR61q+oX-r9tGXJjJ6vtzJ4y21c1uA@mail.gmail.com>
 <CAHRSSEwO4M0KKwdVEwjBDQ4vjMrWcHYKUVX7f4D9P9wTe2LTUQ@mail.gmail.com>
 <CAHRSSExXLEaz9GpnBXGE383Rq_rzgxFjWqnsxX_fRGkj4848fA@mail.gmail.com>
 <bb6b9aba-04d4-4b36-a556-d52f44b12ed6@sirena.org.uk> <CAHRSSEypz9tgdeaFSXvVr=KZZdg=XY32zDkWT-dYi7N3z8Hh3w@mail.gmail.com>
 <95e1943a-d534-4ce4-ba3b-285a52684420@collabora.com> <CAHRSSEzRE2ZXui+uiq=eZvDRcdkjo2cKK7qO4nUTEFOo2cz15Q@mail.gmail.com>
 <01c856716324fd101de893554683c10db35db47e.camel@collabora.com>
In-Reply-To: <01c856716324fd101de893554683c10db35db47e.camel@collabora.com>
From: Todd Kjos <tkjos@google.com>
Date: Thu, 11 Jul 2024 10:20:37 -0700
Message-ID: <CAHRSSEz_=hs_p=u4XCuGx2xpd36rkycOof7sOh0e1cXtnRXODA@mail.gmail.com>
Subject: Re: new branch + more recent gcc?
To: Denys Fedoryshchenko <denys.f@collabora.com>
Cc: Muhammad Usama Anjum <usama.anjum@collabora.com>, Mark Brown <broonie@kernel.org>, 
	kernelci@lists.linux.dev, Viktor Martensson <vmartensson@google.com>, 
	Betty Zhou <bettyzhou@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Denys, it looks like you fixed it. Thanks!

On Tue, Jul 9, 2024 at 10:38=E2=80=AFAM Denys Fedoryshchenko
<denys.f@collabora.com> wrote:
>
> I am investigating cause, likely one of cross-compiler images is broken
> and blocking k8s queue. It is likely will be fixed within few hours and
> few more needed to clean the queue.
>
> Sorry for the hiccup.
>
> On Tue, 2024-07-09 at 10:02 -0700, Todd Kjos wrote:
> > Something isn't right. We've dropped from about 35 builds per android
> > kernel branch down to only 1-5 builds. Can we get all those other
> > builds back?
> >
> > See https://linux.kernelci.org/job/android/
> >
> >
> > On Wed, Jul 3, 2024 at 11:09=E2=80=AFPM Muhammad Usama Anjum
> > <usama.anjum@collabora.com> wrote:
> > >
> > > On 7/2/24 8:45 PM, Todd Kjos wrote:
> > > > On Tue, Jul 2, 2024 at 6:12=E2=80=AFAM Mark Brown <broonie@kernel.o=
rg>
> > > > wrote:
> > > > >
> > > > > On Mon, Jul 01, 2024 at 10:27:24AM -0700, Todd Kjos wrote:
> > > > >
> > > > > > 1) use gcc-13 instead of gcc-10 for android kernel builds
> > > > >
> > > > > It sounds like you just need an upgrade here rather than
> > > > > specifically
> > > > > GCC 13?  The reason I ask is that GCC 12 is the standard
> > > > > compiler in
> > > > > Debian Bookworm so might be easier to update to quickly.
> > > >
> > > > GCC 12 would be fine
> > > >
> > > > >
> > > > > > 2) add android15-6.6-lts branch to kernelci testing
> > > > >
> > > > > https://github.com/kernelci/kernelci-core/pull/2597
> > > > >
> > > > > > 3) discontinue all gki_defconfig builds
> > > > >
> > > > > https://github.com/kernelci/kernelci-core/pull/2598
> > > > >
> > > > > (not 100% sure I got that one right, have to see how it goes on
> > > > > staging.)
> > > >
> > > > Thanks!
> > >
> > > I've opened PR to enable android builds including android15-6.6-lts
> > > in new
> > > kernelci:
> > > https://github.com/kernelci/kernelci-pipeline/pull/667
> > >
> > > >
> > >
> > > --
> > > BR,
> > > Muhammad Usama Anjum
> >
>
