Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D6A82207A
	for <kernelci@lists.linux.dev>; Tue,  2 Jul 2024 15:46:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719935166; cv=none; b=baks4XgxHEdiOjoufW9qeDo4wom/Wsy0GzWU2OpQKnSXgXf8tzvOkSDrBXg90j3RXczk+vmbpFKnAF+9ALrZEqrTU2GnyCGQIqGKMBVYOyr/ZTYLeIVGySVJ0O0CH2Pz8TfrCgICi1KGt3PxreXyHUmP4xPXWPPb3DlawDcmI9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719935166; c=relaxed/simple;
	bh=3T9h7Iea6WSp/KQ7L1Vo67lFaDU4FC8FXxVIOnT0CRM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HzSgd975T5p0plnrBYI7tDRxDHcrnrzD9oLDpnpC2xjpfZJ7d34/V9y9ZnKIhFAUp7gBsBxgx2QVOPzGY3+PEQdN2vGVWNwzJzGakjHx9dIhodH3uZUhqIpgydDCK9Ksr8e7QPtJ0s2utqTUXwaUYw+u1jHX3qJZ7m0qAz7xvs0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=WdYmt8oE; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="WdYmt8oE"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-57d119fddd9so25356a12.1
        for <kernelci@lists.linux.dev>; Tue, 02 Jul 2024 08:46:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1719935163; x=1720539963; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9uYvvVT81KIIEM3A/M9BmVphQ4kkUVhqdAqYtHG4al4=;
        b=WdYmt8oEi+XTsrXFvXjHUUBnfVsaJHtgrNoiKsIhlfq0nDFa+Jhbp8rSAZesFKRm8H
         FMTlXbZjnECmTbih5TnFVJ7/H68QbH4YRB5Ad4fCnkJnGjoSTwnxg/fSfM/s/UihbWpx
         mQGvOtw91LaNOSFpgYHaTXfQxW859WzEobtHg0LCFhZU3uxZvMmw49P7n8PsoTeqnNot
         EvbRCZhXfggC58py59UiJlSm+ANyhU4C8fBdk19QU0da7tpwiW86rKyGvcjuaCRGIXYa
         zRFIQWnch1SuzT8MxwQqS/bkfrthrn32c3Ifv4aOFkb7yznm/Ewub5XAS9GBTqi1d6KP
         L3Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719935163; x=1720539963;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9uYvvVT81KIIEM3A/M9BmVphQ4kkUVhqdAqYtHG4al4=;
        b=WttoMf2xKEQ7wGzYk9wn3m8KN2E2kZG8ks1awUYxkijDda+U/U/QFvQeTnfvoB0u8A
         0WV1N/rRxTVPRo6HvX0Dc9Fe0UMtwRXpD47KDGGUaafFVFXBTUN40jxAnYYg1VwQFUKz
         5t+tisyp4YXCHeogxOvmuxBOapV062bXhmLj2RQqVL2i1gYleavLOhVCHwzfQfmmTtA3
         vh1WVzM1xJrcABWJunbqAg04lKS1u6jNqKsmw6JzNJq7PyKaF4qeKrxufVa8eECDjPCt
         XAVSge9SURKNomIht1o53GwRtgQFPZ3fj5aaUWRdCVTVylVmn6MKT29i+qnhHybnTy0k
         8irQ==
X-Gm-Message-State: AOJu0YxxmuGKgPRg31hZR6rHwtXC8pMKN62svViIZGI6etAIhjQQ/OX5
	5+QNuyyffQy/GfYKZkwankmem28SAqi/U9oF7IbArVFYb/xlGiLwSFP210clXaG6IxwvbHLZAhF
	QmFQngwcyHUtVkAmhN7i2y8Ry7f4VwaSCgAX3
X-Google-Smtp-Source: AGHT+IE8E+khrGACmUnP2+ztDYr3tW5D68/HoiH/ZsqMsw7Ds2ibNXP4FyisGC4q8ASmFYNPbXPJR42coJ56tlqWtw8=
X-Received: by 2002:a50:ccd6:0:b0:57d:32ff:73ef with SMTP id
 4fb4d7f45d1cf-58c66efe892mr28167a12.6.1719935160776; Tue, 02 Jul 2024
 08:46:00 -0700 (PDT)
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
 <CAHRSSExXLEaz9GpnBXGE383Rq_rzgxFjWqnsxX_fRGkj4848fA@mail.gmail.com> <bb6b9aba-04d4-4b36-a556-d52f44b12ed6@sirena.org.uk>
In-Reply-To: <bb6b9aba-04d4-4b36-a556-d52f44b12ed6@sirena.org.uk>
From: Todd Kjos <tkjos@google.com>
Date: Tue, 2 Jul 2024 08:45:45 -0700
Message-ID: <CAHRSSEypz9tgdeaFSXvVr=KZZdg=XY32zDkWT-dYi7N3z8Hh3w@mail.gmail.com>
Subject: Re: new branch + more recent gcc?
To: Mark Brown <broonie@kernel.org>
Cc: kernelci@lists.linux.dev, Denys Fedoryshchenko <denys.f@collabora.com>, 
	Viktor Martensson <vmartensson@google.com>, Betty Zhou <bettyzhou@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 2, 2024 at 6:12=E2=80=AFAM Mark Brown <broonie@kernel.org> wrot=
e:
>
> On Mon, Jul 01, 2024 at 10:27:24AM -0700, Todd Kjos wrote:
>
> > 1) use gcc-13 instead of gcc-10 for android kernel builds
>
> It sounds like you just need an upgrade here rather than specifically
> GCC 13?  The reason I ask is that GCC 12 is the standard compiler in
> Debian Bookworm so might be easier to update to quickly.

GCC 12 would be fine

>
> > 2) add android15-6.6-lts branch to kernelci testing
>
> https://github.com/kernelci/kernelci-core/pull/2597
>
> > 3) discontinue all gki_defconfig builds
>
> https://github.com/kernelci/kernelci-core/pull/2598
>
> (not 100% sure I got that one right, have to see how it goes on staging.)

Thanks!
