Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC3335FB9C
	for <kernelci@lists.linux.dev>; Mon,  4 Mar 2024 17:23:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709572995; cv=none; b=AwSSbnVZ7hqt0oDFH8/0LyrdGGpmkJWNStqx4tzUDBaRVeG4he4TGcjx9a+gVCsM3K/ejg3wgwUfeYDAj9ms6wJi6BLonr2ce8QwlJNkg3NTfuv8jJHrN0NNIOIG1LYVBOMonP6uYeJbL8Cu8Gd265rGGvLqaUV0wJak9OGaQpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709572995; c=relaxed/simple;
	bh=2AXGixQ7Gc8HjdKyBY3Whs9KBXsRK1tfn6h6cRM619Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mlgSlA4UzQQq1OhVlqblWtzC26hPc16HfyKfrqNKN9Uh14dxQWpmg4jjnJnWj+WrOZu1oDPc/eeeRoK46vwjgJXuNPNRcdj+1tg7LzlBlbPsbc5HVqU6LIrsSNjin7Hp/we5EvLePpWH7ziTMb+Z7KjTbdPj04hp3VhbEXeNE8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=HT7L/Za1; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="HT7L/Za1"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1dcd07252d9so431185ad.1
        for <kernelci@lists.linux.dev>; Mon, 04 Mar 2024 09:23:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1709572993; x=1710177793; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2AXGixQ7Gc8HjdKyBY3Whs9KBXsRK1tfn6h6cRM619Y=;
        b=HT7L/Za1QVtzkwqCh2LFtQXdxSNCWZuUZysTNLOKqZXQGFi+j5GEXfXMuBIRnnB8df
         7ydI+EPdNFeL8QYalxNM/kMWW32+APX7/bzKrKc0NVuiiKeVxajrAe6CcTVY69QCW5D5
         07RYzE/uomnk6H8uzvKiJK6eqg3bBvp9D6kXIXt4KJl/Khrc0Mt0zH7VwRRuQ17by5SK
         ff7NM/RfY/uCDu6NeVGwfaiwqrGkIqPBoCksZXQYbr73eqP/Z6/8i0RiecUzFI1/mR0c
         Qskb0wVk4AHHNnZRyoKqB7WqBV0wEQebRkW6WNPfl2ktlHxo9qyycK806L28YVpytH6v
         1sZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709572993; x=1710177793;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2AXGixQ7Gc8HjdKyBY3Whs9KBXsRK1tfn6h6cRM619Y=;
        b=Vf0XFJsbRVtxyaTZlfnxHDOC0CvrxPbJDz9ZJ3gXVBCIAuOq+eQjP3eVvIzrSWR0WR
         Gucw0+3Z4Cw8EWNquOqyxxqfPADZI1QLjbM8kSzrhvGUcCGaJDoVw6q6N8G+tJDT20uh
         JPH0NLjw9EWJxmYdLoEc0q/gIsoUbflxxnOykYefAqIhHNh4QgUZ38dpevcKZSD5vHS0
         iQ457Atx8nGelCR+rA6oJZ8xJHME3eEfAdOrtOieWngFRO9L7v16UrYkK2TN9Iya3/aR
         KkBWnG2uyUCExobfdg/Uaa+gK8636Ss+mr8LlcB8yTmzdoznoxumCPawzLAqMbgk385H
         4QxA==
X-Forwarded-Encrypted: i=1; AJvYcCVvDPQaasv5f7APh0zzt4J3usf3VQDB7oVchWWgTPY7dzs/oGYs38IHnm0flR1uahqBZ64qU099jHV3DtwEjQKNFjkOKv83H8g=
X-Gm-Message-State: AOJu0Yw12VyWo4DuuEaIh+Sfws282nq+sdLvqH4t4iDiEYA9sbh232Ml
	dqDCTtOM/bQ4fqAzpa50YdThJEF5Cu68q441tFCR3ItH2uRkHLm7LVtuaSL8Tn3TtJ2WMxirqo1
	Q9jM0jNOwSRx24IcmIY4+nnbWKcBx7dkBbdzF
X-Google-Smtp-Source: AGHT+IFKjskUOj6278amt+2i/iRaGbWnqwH8V8ARQXyWAa4I5jxF0hWUUBHSTDwJLrfzllQF5r4CeHTssO8S/qZNiYE=
X-Received: by 2002:a17:902:ecc5:b0:1dd:7db:69d0 with SMTP id
 a5-20020a170902ecc500b001dd07db69d0mr266118plh.11.1709572993014; Mon, 04 Mar
 2024 09:23:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240228225527.1052240-1-helen.koike@collabora.com>
 <20240228225527.1052240-2-helen.koike@collabora.com> <20240229-dancing-laughing-groundhog-d85161@houat>
 <5d7ed81b-37f9-48e9-ab7e-484b74ca886c@gmail.com> <CAHk-=wixVy3WYvjbt43ZSrCqPDsS76QJQSkXFbbPsAOs1MCSAQ@mail.gmail.com>
 <CABXOdTeT2ip1uS2EG2w8pW7254Tnd=ZDNz-KC61-G-yqDTVgJA@mail.gmail.com>
 <20240304-rigorous-silkworm-of-awe-4eee8f@houat> <CABXOdTc4MXcjwgGuJb4_69-4OFELD37x0B6oMr=4z=nxZ2HPXQ@mail.gmail.com>
 <20240304-ludicrous-grinning-goldfish-090aac@houat> <CABXOdTeDydWO9mf2yxWjjebHZ1bE=R2HPs1P4XYwNhzznNKxmw@mail.gmail.com>
 <20240304-benevolent-brawny-urchin-0af0ad@houat>
In-Reply-To: <20240304-benevolent-brawny-urchin-0af0ad@houat>
From: Guenter Roeck <groeck@google.com>
Date: Mon, 4 Mar 2024 09:22:59 -0800
Message-ID: <CABXOdTeza3ZJRO7eexp8evm8o1B81fw9cDQbE_nHwqhufMCfGA@mail.gmail.com>
Subject: Re: [PATCH 1/3] kci-gitlab: Introducing GitLab-CI Pipeline for Kernel Testing
To: Maxime Ripard <mripard@kernel.org>
Cc: Linus Torvalds <torvalds@linuxfoundation.org>, Nikolai Kondrashov <spbnick@gmail.com>, 
	Helen Koike <helen.koike@collabora.com>, linuxtv-ci@linuxtv.org, 
	dave.pigott@collabora.com, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-kselftest@vger.kernel.org, 
	gustavo.padovan@collabora.com, pawiecz@collabora.com, 
	tales.aparecida@gmail.com, workflows@vger.kernel.org, 
	kernelci@lists.linux.dev, skhan@linuxfoundation.org, 
	kunit-dev@googlegroups.com, nfraprado@collabora.com, davidgow@google.com, 
	cocci@inria.fr, Julia.Lawall@inria.fr, laura.nao@collabora.com, 
	ricardo.canuelo@collabora.com, kernel@collabora.com, 
	gregkh@linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 4, 2024 at 9:09=E2=80=AFAM Maxime Ripard <mripard@kernel.org> w=
rote:

> And singling out DRM because it regularly allegedly breaks things on
> xtensa or m68k and claiming we're not taking CI seriously because of it
> is completely ridiculous. If the all the subsystems were taking CI as
> seriously as DRM, we would be in a much better place.
>

The failure I reported as an example was on arm, not on xtensa or m68k
I'll disable CONFIG_DRM in my build tests for xtensa and m68k going
forward.

Thanks,
Guenter
