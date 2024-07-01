Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AF80F4ED
	for <kernelci@lists.linux.dev>; Mon,  1 Jul 2024 17:27:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719854858; cv=none; b=bU7MMtte4QrkRlEgTEVoIyH5QaK3p/IXJS5pqPq02zhAtuJZAKtgfYJGY9hkdUMMqVG3voo/w1REjj2d3D7QglHAZjR+tf6pMoFtw+h/2XplR5If4Lyu0FZ+PNxTyZO468gkd/u18FGoP7RYvxmRGNc/4ks4/8nABNJZ6dfViQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719854858; c=relaxed/simple;
	bh=NMogTgscPPD4XEuTA+R51hNYw1+SDeLa+DMd5+FHJhc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ELs6ilQfCSPut+uLt+vfPoOsL0QfNMjkHr/uWenYH6QFHRIrpGTYwlk3w7ljB0IglR/TgmUlU1xaahuIe2G5LHNDC3wbx+xOl26+Ak3fEj5hiKs5Wy0eGut6bHIjnsGuKpC/L0FDrG32BxED9hoQWlUYORZYJ7A9BSf/ILrf2W0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=BeI9XaZ2; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="BeI9XaZ2"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-57d16251a07so8112a12.1
        for <kernelci@lists.linux.dev>; Mon, 01 Jul 2024 10:27:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1719854855; x=1720459655; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NMogTgscPPD4XEuTA+R51hNYw1+SDeLa+DMd5+FHJhc=;
        b=BeI9XaZ2vZ7Q6UFHlvqbQL+iAy5AffV48ddVUQ6DoS4UH+rmDsgAaW1NXcKIq0Hbca
         x+kU63DlEdTsr2z+8x6nA0lgXGCJIcZ0kq/7nJCdbeNZh1XDUKJGVfl65KVCq2UyELV3
         7OJaZf7vdlVWUKHU9hS+0UoWPdqNlDEsSLucpjbya651vRngMYrc0lCorax1EBY3nbk9
         ec4gm6UgDBMlNEhDo9pYlShrUqU2K06HlX5xPg8+wyK1jt35Eik5Lw6zHli73woF889A
         Fxto/CMZ9Gl/k7QQYLzL+ciVaHtzIwCUrCi3Cu5BGIQvxmLfK0YQS+imq5BO5zaa+VAl
         pRhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719854855; x=1720459655;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NMogTgscPPD4XEuTA+R51hNYw1+SDeLa+DMd5+FHJhc=;
        b=usSGdB3LeQ7gl3G4D/nQlDAqXjD3bSh0snRBkiuxQWdOWdkEGfAcpp1xrlkk9aa3Pl
         LqhmgurvSvJDEBWA06cKS3HVPidlziC2RmHo0ToDWoyax57x+vO7oT20Y0ruGJ+iFj5o
         Bb36a9dB9Hz9aUtNh3mAUwNoTmsPmuulvK+mBnwwQDCKuiVvJeozpDYvNh8WJJerwK7b
         n5o7kltfOiZlRzZtPdWftiZyudOIL1E+XWBZWgygsQW+Fh8iZgTocUW584XIU1QJoukP
         fSJpVSD0/2uhfdL93jCzFqWbiGq9RPJQwObXmP42fff+pElWc4vRSOgVmrVRL0dM4PUV
         7RjQ==
X-Gm-Message-State: AOJu0Yw17OAWeStQ1at0hvwYCV2OCGCWYQM1DEO10ej7VpY+mPeHJp3j
	y8v9HC6GnNd58qQ24ChbR1YKew10rnmS+NwplBqqmFK3Xh0ZoJ9Mw4RTu6ZHikjdAdq4ikbXlxa
	WMLvQTJt33Qg/0ruqE5slW3OSDGTPctAqIKJP/f2ZWRhe7CMIfA==
X-Google-Smtp-Source: AGHT+IG9WizXRq7p9NZdMrP8fq7nu4flGz0MqXxHOBMpc509sT4kPp3aQs18kgW4GHEvrtC4uMqYcusKPaFvnBXTZwA=
X-Received: by 2002:aa7:cd04:0:b0:58b:21f2:74e6 with SMTP id
 4fb4d7f45d1cf-58b21f27566mr10156a12.0.1719854855317; Mon, 01 Jul 2024
 10:27:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAHRSSEzrL6uPEvrhW692=+=17EJt+6_-p2z0K5esG4Ff57MSpw@mail.gmail.com>
 <a94cd4e0-7092-04fb-9b89-da236bfec57f@collabora.com> <CAHRSSEzMo=-eS8KRqHjSMcBqWCsK2mU4zWg=5KFYx2XyL29Z0w@mail.gmail.com>
 <CAHRSSEzasi7ZRSe3t_ij26cYCc_58eALNn_mMn6B5HFqEbU9EQ@mail.gmail.com>
 <ffab5719-e6f4-4e21-1095-c129928076af@collabora.com> <CAHRSSEzo0cSQCp_zk4h2BP2EGdqVHSbZOLC-3gf7c6+uOK9R4g@mail.gmail.com>
 <CAHRSSEw6Vv+3R0OOva8qY3pF-00TZdQku3MxN2OFSaZkN2di+Q@mail.gmail.com>
 <962098da-8dfe-8a77-169d-ac1b2902b8b8@collabora.com> <CAHRSSEzH+PF92DrbPXKPwpaoqEPhh1hWKL8vio9Ou_-ejcb0Bg@mail.gmail.com>
 <CAHRSSEyp35+k4v-ak1qp0vvUOWJjTnJkWhOtCO5MCS++zL2u6w@mail.gmail.com>
 <CAHRSSEwYk1oGmJEn5xvB91GKSmaJ_ku5D7hvbS00Jb9-piUbOQ@mail.gmail.com>
 <a5fef4b96be3c80aff75eb3b20e1edc90e8bfe42.camel@collabora.com>
 <CAHRSSEzfXJU=GcyC_HfUUnNQdyjT8S68HqhN1bdaB6NE0TPGsA@mail.gmail.com>
 <961641f4-e0ed-48da-8336-186e3b8d23ea@collabora.com> <CAHRSSEx+1=8N6wEDFwiXoR61q+oX-r9tGXJjJ6vtzJ4y21c1uA@mail.gmail.com>
 <CAHRSSEwO4M0KKwdVEwjBDQ4vjMrWcHYKUVX7f4D9P9wTe2LTUQ@mail.gmail.com>
In-Reply-To: <CAHRSSEwO4M0KKwdVEwjBDQ4vjMrWcHYKUVX7f4D9P9wTe2LTUQ@mail.gmail.com>
From: Todd Kjos <tkjos@google.com>
Date: Mon, 1 Jul 2024 10:27:24 -0700
Message-ID: <CAHRSSExXLEaz9GpnBXGE383Rq_rzgxFjWqnsxX_fRGkj4848fA@mail.gmail.com>
Subject: Re: new branch + more recent gcc?
To: kernelci@lists.linux.dev
Cc: Denys Fedoryshchenko <denys.f@collabora.com>, Viktor Martensson <vmartensson@google.com>, 
	Betty Zhou <bettyzhou@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 1, 2024 at 10:05=E2=80=AFAM Todd Kjos <tkjos@google.com> wrote:
>
> On Mon, Jul 1, 2024 at 10:03=E2=80=AFAM Todd Kjos <tkjos@google.com> wrot=
e:
> >
> > Our kernelci builds are currently use gcc-10 and clang-17. We have 1
> > allmodconfig failure [1] that appears to be caused by the old gcc-10
> > compiler and doesn't reproduce with gcc-11 or later. Can we switch the
> > android builds to gcc-13 instead?
> >
> > [1] https://linux.kernelci.org/build/android/branch/android14-6.1/kerne=
l/android14-6.1.84_r00-129-g87fb1f2f1e795/
> >
> > Also, we have a new kernel branch that we'd like to add to the testing:
> >
> > repo: https://android.googlesource.com/kernel/common
> > branch: android15-6.1
>
> I specified the wrong branch. Please do not add android15-6.1. The
> branch to add is android15-6.6-lts

One more thing... can we disable the builds for gki_defconfig? Those
always fail with no logs (probably because of pahole). We test that
heavily internally so we don't need kernelci to build it.

Recap of the asks on this thread:

1) use gcc-13 instead of gcc-10 for android kernel builds
2) add android15-6.6-lts branch to kernelci testing
3) discontinue all gki_defconfig builds

Thanks.

>
> >
> > Thanks.
> >
> > -Todd
