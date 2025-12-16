Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59780279DAD
	for <kernelci@lists.linux.dev>; Tue, 16 Dec 2025 01:37:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765849079; cv=none; b=kak2gipVOc38Rcz4yBYITxY2e1DpMBZqbkxM0jp/pK9H2r7No+6Hj+IjzcU/td8xdjizJJAFKt0h0gA0aD+E/5c7faCIRb2X/Tb++L4PBlwELT1TV6fR4uUIPG7haztfPjkXIWbc7bABski5wxyZR15UhoJyayYxcK3UdQuK5LM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765849079; c=relaxed/simple;
	bh=x+RMwbKGsV4PMkD0KkMkba/tk7/2mcKaDGjNa1T7ZjM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GkrU5bW6PEgo1enkzzpCH/cwi+l+3A4A4roYDLsj1mhO0RWgCKqjOp3glteQFQn0iOGZ6WG9SfnRgzTHkUx83orUjJxqnS5UHVmh/gVB36YcCEfCNP+D9Af3Ka4V39fokzCkrl9c/UceOlrdWDjqHfNiFDm6AfKhxeMUdGEBY8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IUVp9jqx; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IUVp9jqx"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4779cc419b2so42299605e9.3
        for <kernelci@lists.linux.dev>; Mon, 15 Dec 2025 17:37:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765849076; x=1766453876; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J/pNAke2nQIdqwnOq2FBv9V/0iQOVyEeIV9hoKI21mk=;
        b=IUVp9jqxE3FpyGQS9sisOtLFOrOp+P+6/MpbN07uokGk7uKSJOwWu5+/dyh0H5BFEa
         3sTe/AolCKCrFgAb0PSvzjB5yA7sADA+p7oAzJJQjzm1yl8MEjhBvuNLLFp7KSCC+hOx
         MsvFTCv0JARn81h3V8dvQdjHpVu//f74goEJpBmvgVGVR6f6zTnWPyvKTviZidNAiD3h
         RrlOzyoRac2qTG5BDyZzWKgaSqET2lBJvZVRGr/1ZC9hTA8WXR8H7Pgr5PTnmlJuYHrR
         h+o9kFfBI85VBaXzXdhBxoCU7IkIolUZ8oFGgpm67ac9rh89AndFk4lNW73phEIhDoD0
         XhPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765849076; x=1766453876;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=J/pNAke2nQIdqwnOq2FBv9V/0iQOVyEeIV9hoKI21mk=;
        b=G46d+w5VrjQTvfUn9/lNd++LLJlwIcoaO0xtU1WDj4lG1nPHKkKojJyiBiIncreEGN
         vIFP+Ss9j/T8MWDfIL9ewsfliMYc1DX4gnU+nEorz8HlUpWj96p+kfl/wu83rJbmwCF8
         awOXDpODuYkryJtrwiMQShDQlApiG9ZQHbBSMXs+ugMcYp5ddomKImC1+sPXZZdvRhv+
         0EbnO9LGKR6EXOeY5zQUil7WQgdPpoTHsVrbS0Ip1MUMTKlxsVughqgG5axVh6nAA36M
         79tCe6jNdVVPiVVtkWRtMmI2ZsHIZuzt+dH3vHNrd0bShflLyWJRbbl+QwWcHFMF8jR/
         BMuA==
X-Forwarded-Encrypted: i=1; AJvYcCVEJ6mG6A2hOJ8r2+f0UmJ3PtFXa6NrbWYbel2hRhvV6f401ycjLxqOS6cyR+UmSsQa7mA1QDsHIA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzSzERyzZW3FvkZweahwpgC6VurCwO9jN4VTiByO+waL5uZW2Zx
	EoQxtw7zhelsOAdsSz9dbowNA7dwUOgQrCPfEVyq4EQ4zeZy5WicsoNWGCRFYwMYoXyxwM3ej5z
	O5ERQeaEHyCB3Gu6adUwGRTgg736x5yM=
X-Gm-Gg: AY/fxX6nHrwHNnPQr8aEXMUx3HnMPHBeiBWGU/v5gJNAXsc1M/YK9wGKLW7yZw9mJkF
	Q1ln0qRk4WZuVxbxj2mRdfsrmjiGxVEUHSCMWIN92lyrORLWj6KZ6l9zQmsctj9/O2//BJXCbki
	pZcBfR7mmYQlKw2JKAkC75AdKcTFJJl2iZK9xeuWQFTf1eKE44FholS+hlLgtSKQDTEIoaHEwrB
	xz7arMADrxKWzVJXJQVjcHr2JaDmgPr2AQxAld1hn4YbFS7X/tsSgcEP0aOGASTt8ruhLKn6Rfd
	zMX9H7OiFW1MysV18kWahCTEZOfB
X-Google-Smtp-Source: AGHT+IFPU0s3bOPB3rQAta6oFL313UAj3hIJMxw2uWb7NN2NlEfaIUbg6fQFPzAZXBnRUdVenFhgkatm/4QgRmmEnDE=
X-Received: by 2002:a05:6000:24c8:b0:430:ff0c:35fb with SMTP id
 ffacd0b85a97d-430ff0c3838mr4510125f8f.52.1765849075664; Mon, 15 Dec 2025
 17:37:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <176584314280.2550.10885082269394184097@77bfb67944a2>
 <20251216122514.7ee70d5f@canb.auug.org.au> <3cd2c37e-458f-409c-86e9-cd3c636fb071@linux.dev>
In-Reply-To: <3cd2c37e-458f-409c-86e9-cd3c636fb071@linux.dev>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Mon, 15 Dec 2025 17:37:44 -0800
X-Gm-Features: AQt7F2q0Rsxh6xewkzWqNTcgEYzDxngWg4m_SWh3bFIyuupfaMDEEJZmkhGJV1k
Message-ID: <CAADnVQKB1Ubr8ntTAb0Q6D1ek+2tLk1yJucLOXouaF_vMqP3GA@mail.gmail.com>
Subject: Re: [REGRESSION] next/pending-fixes: (build) error: unknown warning
 option '-Wno-suggest-attribute=format'; did...
To: Ihor Solodrai <ihor.solodrai@linux.dev>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Daniel Borkmann <daniel@iogearbox.net>, 
	Alexei Starovoitov <ast@kernel.org>, Andrii Nakryiko <andrii@kernel.org>, KernelCI bot <bot@kernelci.org>, 
	kernelci@lists.linux.dev, kernelci-results@groups.io, 
	Linux Regressions <regressions@lists.linux.dev>, gus@collabora.com, 
	Linux-Next Mailing List <linux-next@vger.kernel.org>, bpf <bpf@vger.kernel.org>, 
	Networking <netdev@vger.kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 15, 2025 at 5:32=E2=80=AFPM Ihor Solodrai <ihor.solodrai@linux.=
dev> wrote:
>
> On 12/15/25 5:25 PM, Stephen Rothwell wrote:
> > Hi all,
> >
> > On Mon, 15 Dec 2025 23:59:03 -0000 KernelCI bot <bot@kernelci.org> wrot=
e:
> >>
> >> Hello,
> >>
> >> New build issue found on next/pending-fixes:
> >>
> >> ---
> >>  error: unknown warning option '-Wno-suggest-attribute=3Dformat'; did =
you mean '-Wno-property-attribute-mismatch'? [-Werror,-Wunknown-warning-opt=
ion] in kernel/bpf/helpers.o (scripts/Makefile.build:287) [logspec:kbuild,k=
build.compiler.error]
> >> ---
> >>
> >> - dashboard: https://d.kernelci.org/i/maestro:32e32983183c2c586f588a4a=
3a7cda83311d5be9
> >> - giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-n=
ext.git
> >> - commit HEAD:  326785a1dd4cea4065390fb99b0249781c9912bf
> >>
> >>
> >> Please include the KernelCI tag when submitting a fix:
> >>
> >> Reported-by: kernelci.org bot <bot@kernelci.org>
> >>
> >>
> >> Log excerpt:
> >> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
> >>   CC      kernel/bpf/helpers.o
> >> error: unknown warning option '-Wno-suggest-attribute=3Dformat'; did y=
ou mean '-Wno-property-attribute-mismatch'? [-Werror,-Wunknown-warning-opti=
on]
> >>
> >> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
> >>
> >>
> >> # Builds where the incident occurred:
> >>
> >> ## defconfig on (arm64):
> >> - compiler: clang-21
> >> - config: https://files.kernelci.org/kbuild-clang-21-arm64-mainline-69=
4097d2cbfd84c3cdba292d/.config
> >> - dashboard: https://d.kernelci.org/build/maestro:694097d2cbfd84c3cdba=
292d
> >>
> >>
> >> #kernelci issue maestro:32e32983183c2c586f588a4a3a7cda83311d5be9
> >>
> >> --
> >> This is an experimental report format. Please send feedback in!
> >> Talk to us at kernelci@lists.linux.dev
> >>
> >> Made with love by the KernelCI team - https://kernelci.org
> >>
> >
> > Presumably caused by commit
> >
> >  ba34388912b5 ("bpf: Disable false positive -Wsuggest-attribute=3Dforma=
t warning")
>
> Hi Stephen,
>
> A potential hotfix is here:
> https://lore.kernel.org/bpf/d80c77cf-c570-4f3b-960f-bbd2d0316fac@linux.de=
v/
>
> Needs acks/nacks.

I removed the offending patch from bpf tree.
