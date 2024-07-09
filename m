Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E423241C6D
	for <kernelci@lists.linux.dev>; Tue,  9 Jul 2024 17:02:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720544554; cv=none; b=ZRAJm8mgc+IBfCKNRP/ECOvxH7eYQQM2FyKyTJbAIe/x5VgGy8I1F4MUVd61WHfrZpp35886LLQeQekJaQa2Fbb41Hvva/LvqreiYpmCh95fHJaedJPHbJYWAoj+9Ie5UxYLZkZoEgr/N1CLu5EujjNLoaBWMVivo1RtJ6baD6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720544554; c=relaxed/simple;
	bh=95GnVFM2TR7e5mh1eeAMxO0KjQbq6QZNBL0kscq3T4o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=S+hFEUaOTLjS/RZDVNzF7Bks9FzOJ9e67FjfJZDkPcofc5Mz7OuIYcTsoR94Oa8k/jHsu3yGWfzf4BhoNuWLrMQa3l8/aJXF9UStGqD4ieBj372J1bML43X84xwcXmwuEY71zaWmGE1reFJ++pTF+DogU0kpb+i+gljAvH9QmXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=jNWY3gLE; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="jNWY3gLE"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4266f796e67so2765e9.1
        for <kernelci@lists.linux.dev>; Tue, 09 Jul 2024 10:02:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1720544551; x=1721149351; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xdr8jUX1IfDwk5YcmUpZxhvf7OoBjzo+B5QFyPgD4e8=;
        b=jNWY3gLEtIKuFJz1sz4MaYXNoAQKsNDhPoY5AerPFuhfZIFRdjRkI7mRe7z7qSaSUR
         /kQwN24CVzTxBbQOhUel4bcH3lItaZHXaYfJnj9ovQo16UK1xCppjymaBkxibh/kI8hp
         auSf1zAyC5cLinLiEVQsCHFc6ne+VOtWGA/Vx5ZdKXHkA1tmxo/Q56zp3o+dOzZaxbLd
         HGcAPAD0VN3/Kt13RLn5DGUug/DOXP5fk6JmrT3BLWXQDAynai+wNRWTgx9Pmxgw/zGI
         71Yg5SbIkQFSkbtPAuHspc1IzJWR7kyPvgywyLtpuT5JGDR6d7cd+Zrud4Khe4ZWdCE4
         Tnsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720544551; x=1721149351;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xdr8jUX1IfDwk5YcmUpZxhvf7OoBjzo+B5QFyPgD4e8=;
        b=qmsSl3LSy/ZUVue7bDrJPnXKlsqL9UiXM8+AshXvFV7jG56n2YLvgcDLyJOAISURLz
         kxVEuDbbbiVGa2bJQc3BADd3Cvoqr3aYdga0Duzdi+ARnuBoM3fFwzCAwEgcuo65alRg
         2m+fUAmfgFFqXYz3fiZoKsm0IS65OpFSMhlBOP5xsPREZSgEtcx9adjG1paeNFY/jGeq
         k20Yee3/B3AQwEqW3CW1HtSIbtdfxBaP98iDMnnRZCbqIHY+50LgulnZjfuFEJ+R14v5
         o5A9nungl6cvAwgYVHwBwcbHPGAwHI8TFka6a1FAcHNn0qWXpb5kPP4R6kgJyEiZpz83
         Xw5w==
X-Forwarded-Encrypted: i=1; AJvYcCWnQwjDcOOYYwBkb2QzEanajbhFJDR+C6tFv8KS/vN/RElM0rMxqdqbnbd5f/xZfhq6cT6U3uN5NSNVfXABp/fPgD1VxoFOvlQ=
X-Gm-Message-State: AOJu0YxZRf0SCix1e+WK74xivgE/OIn972hM158MkCjiXJHZFD/4uFSe
	9GA4HTBHXWZ4dd2Eh6UymfYBXgJGYNMl6zuJfQY1SjkfMSvcV4Rm6Nt2Y8NQVlkeI/53GjQN/C3
	ssQMf86GfFq/m108DJ6OYeJwTWyruG5Vhktn1
X-Google-Smtp-Source: AGHT+IHBy3iW7l57l5LyJFmPxFFcY0mesxc7235L54+Uq5gj9cmnak64tgPjhXBrVzCwJiO+gp8F6LEUqzENSjejRkY=
X-Received: by 2002:a05:600c:b4f:b0:426:62a2:dfc with SMTP id
 5b1f17b1804b1-4267318e938mr1964565e9.5.1720544551021; Tue, 09 Jul 2024
 10:02:31 -0700 (PDT)
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
 <95e1943a-d534-4ce4-ba3b-285a52684420@collabora.com>
In-Reply-To: <95e1943a-d534-4ce4-ba3b-285a52684420@collabora.com>
From: Todd Kjos <tkjos@google.com>
Date: Tue, 9 Jul 2024 10:02:16 -0700
Message-ID: <CAHRSSEzRE2ZXui+uiq=eZvDRcdkjo2cKK7qO4nUTEFOo2cz15Q@mail.gmail.com>
Subject: Re: new branch + more recent gcc?
To: Muhammad Usama Anjum <usama.anjum@collabora.com>
Cc: Mark Brown <broonie@kernel.org>, kernelci@lists.linux.dev, 
	Denys Fedoryshchenko <denys.f@collabora.com>, Viktor Martensson <vmartensson@google.com>, 
	Betty Zhou <bettyzhou@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Something isn't right. We've dropped from about 35 builds per android
kernel branch down to only 1-5 builds. Can we get all those other
builds back?

See https://linux.kernelci.org/job/android/


On Wed, Jul 3, 2024 at 11:09=E2=80=AFPM Muhammad Usama Anjum
<usama.anjum@collabora.com> wrote:
>
> On 7/2/24 8:45 PM, Todd Kjos wrote:
> > On Tue, Jul 2, 2024 at 6:12=E2=80=AFAM Mark Brown <broonie@kernel.org> =
wrote:
> >>
> >> On Mon, Jul 01, 2024 at 10:27:24AM -0700, Todd Kjos wrote:
> >>
> >>> 1) use gcc-13 instead of gcc-10 for android kernel builds
> >>
> >> It sounds like you just need an upgrade here rather than specifically
> >> GCC 13?  The reason I ask is that GCC 12 is the standard compiler in
> >> Debian Bookworm so might be easier to update to quickly.
> >
> > GCC 12 would be fine
> >
> >>
> >>> 2) add android15-6.6-lts branch to kernelci testing
> >>
> >> https://github.com/kernelci/kernelci-core/pull/2597
> >>
> >>> 3) discontinue all gki_defconfig builds
> >>
> >> https://github.com/kernelci/kernelci-core/pull/2598
> >>
> >> (not 100% sure I got that one right, have to see how it goes on stagin=
g.)
> >
> > Thanks!
>
> I've opened PR to enable android builds including android15-6.6-lts in ne=
w
> kernelci:
> https://github.com/kernelci/kernelci-pipeline/pull/667
>
> >
>
> --
> BR,
> Muhammad Usama Anjum
