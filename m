Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0505044C87
	for <kernelci@lists.linux.dev>; Sat,  2 Mar 2024 22:11:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709417466; cv=none; b=duSMz8rlZ9+pDrjpZVoRb3+5nR0D3KY8N45ITcil36hmXrPWzlB9ff7+ngsA8atjeVxY4ExuemxVzlCSsfZmeSambZfPSbsnvnGV6S4mz0cZ0GyzP+imMIgqFrzH1e/L+hBphULjVKIOdhZGEibuc/pifAkrj/gC2+WAy7AiT9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709417466; c=relaxed/simple;
	bh=0ALp7TDIJwRAUZcjpLYIfdcASuV8IswcwZ6HVohQkd0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=c1U38vNgwKSIV5BKIROoiin4S+K55UMbRmXoR+s7MO+PRug6+9ba4C69DQW7e+4hto4U3Xpn35hfKVAOkNjv87Cv4aRKMCVc3VuCqefQOvkOUkA5L3DMRgPU/0PGPriSQs39cbdt210S2u1kSd4SgSUq/BfzvNT0YIDsVeUTSaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=EhjfPENz; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="EhjfPENz"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-428405a0205so553541cf.1
        for <kernelci@lists.linux.dev>; Sat, 02 Mar 2024 14:11:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1709417464; x=1710022264; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wTM56c3VIZxbBTne5xJnHplyY03OBsavmsip+EQ4Ouw=;
        b=EhjfPENzHIOrHllPKHW3LK5UfjypokqBJDcF+eAMum0iHMH3rfZrlzOkR6b0pUcw+w
         kiD7LkWiIWGbFItSoZ9M7j2144i7a6ylnmd+l491AnJX2q9iz2JaVJImkGnyE3bFUbLb
         6fNrrgkc+h/9l4QJ/6+pmcKr13uYqvM0JmOMGATsjOc5UNm0R+oTlYTf4bjQDRa4Oe/E
         ROElLSv/+lVJG+WvzGa5j0l6pIjihI+ZSAW53IN8AbHiQC/TQdXmorwN/j7SxKyJGft7
         c1VltumIeUEZLfXar0vZBtT8v1avZ2c7IH+yUuRZGLuVg4TQf96zaKEuDV8uyd8/rGMN
         Qp2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709417464; x=1710022264;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wTM56c3VIZxbBTne5xJnHplyY03OBsavmsip+EQ4Ouw=;
        b=A8CviMqwrTJWsE3yUmFHWhlaUEDPzUbCUA8k+BxPz5LllMHj4X55zFZMsuXcCVwz7P
         B9xboe9j5oqYNxuJlH0B2A9vM+X8GshGZPLWRMqEC8r35Stpmx+UlzAB8vPB7m4/Lmob
         Ew/Hf9/zBSleWRDBVkli99dsefN0SeIskZy9jgpE6bVbffkAXZRoWJaN7NJsbjBUPR4A
         fEHi1HSXogAbJMqEHowgIxvswW9y+PP0x67XR9jeUhQ/CnmvOs1dEC47GY51sWk59Ouw
         u6Exsb/D4UREnQEuTC6fDQZFVW1DzfWZszB6kUzzkg3+lFu+2Rpvx3vS9oUbIStrIzvu
         DU3w==
X-Forwarded-Encrypted: i=1; AJvYcCVFXUGjTzH6ZjOJey7k28F665jzGgfbNJAtm6nzts2e69VQQhOYwk0IBjVUK5ZJSThZE7SJpbo/I5QTUNiAbJYc20MvmXgPAjA=
X-Gm-Message-State: AOJu0YxFIZfd3+O8pRLGg03GTby4FVX8ucSegRdMejDYYa7b//ILghmF
	JXLHACyjQFsSDUVnav+WcZv3cwfzoDVDlYtwSc9LMXRVjVkUCkGuftuy46BpJYTqbthNpL92SUn
	+sTMDUD983HEvZ43M7DqqlmIh/xwPneE6uH/K
X-Google-Smtp-Source: AGHT+IH9sc7BkUOA/MoUZBJgDctjPHOF2trLohxTQjAjH4xi/HZsF8GyNQXPUzk/gDR+MwNciAkndO1CuKQxBDT3R0k=
X-Received: by 2002:a05:622a:1989:b0:42e:e1d9:6df8 with SMTP id
 u9-20020a05622a198900b0042ee1d96df8mr52100qtc.23.1709417463845; Sat, 02 Mar
 2024 14:11:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240228225527.1052240-1-helen.koike@collabora.com>
 <20240228225527.1052240-2-helen.koike@collabora.com> <20240229-dancing-laughing-groundhog-d85161@houat>
 <5d7ed81b-37f9-48e9-ab7e-484b74ca886c@gmail.com> <CAHk-=wixVy3WYvjbt43ZSrCqPDsS76QJQSkXFbbPsAOs1MCSAQ@mail.gmail.com>
In-Reply-To: <CAHk-=wixVy3WYvjbt43ZSrCqPDsS76QJQSkXFbbPsAOs1MCSAQ@mail.gmail.com>
From: Guenter Roeck <groeck@google.com>
Date: Sat, 2 Mar 2024 14:10:51 -0800
Message-ID: <CABXOdTeT2ip1uS2EG2w8pW7254Tnd=ZDNz-KC61-G-yqDTVgJA@mail.gmail.com>
Subject: Re: [PATCH 1/3] kci-gitlab: Introducing GitLab-CI Pipeline for Kernel Testing
To: Linus Torvalds <torvalds@linuxfoundation.org>
Cc: Nikolai Kondrashov <spbnick@gmail.com>, Maxime Ripard <mripard@kernel.org>, 
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

On Thu, Feb 29, 2024 at 12:21=E2=80=AFPM Linus Torvalds
<torvalds@linuxfoundation.org> wrote:
>
> On Thu, 29 Feb 2024 at 01:23, Nikolai Kondrashov <spbnick@gmail.com> wrot=
e:
> >
> > However, I think a better approach would be *not* to add the .gitlab-ci=
.yaml
> > file in the root of the source tree, but instead change the very same r=
epo
> > setting to point to a particular entry YAML, *inside* the repo (somewhe=
re
> > under "ci" directory) instead.
>
> I really don't want some kind of top-level CI for the base kernel project=
.
>
> We already have the situation that the drm people have their own ci
> model. II'm ok with that, partly because then at least the maintainers
> of that subsystem can agree on the rules for that one subsystem.
>
> I'm not at all interested in having something that people will then
> either fight about, or - more likely - ignore, at the top level
> because there isn't some global agreement about what the rules are.
>
> For example, even just running checkpatch is often a stylistic thing,
> and not everybody agrees about all the checkpatch warnings.
>

While checkpatch is indeed of arguable value, I think it would help a
lot not having to bother about the persistent _build_ failures on
32-bit systems. You mentioned the fancy drm CI system above, but they
don't run tests and not even test builds on 32-bit targets, which has
repeatedly caused (and currently does cause) build failures in drm
code when trying to build, say, arm:allmodconfig in linux-next. Most
trivial build failures in linux-next (and, yes, sometimes mainline)
could be prevented with a simple generic CI.

Sure, argue against checkpatch as much as you like, but the code
should at least _build_, and it should not be necessary for random
people to report build failures to the submitters.

Guenter

> I would suggest the CI project be separate from the kernel.
>
> And having that slack channel that is restricted to particular
> companies is just another sign of this whole disease.
>
> If you want to make a google/microsoft project to do kernel CI, then
> more power to you, but don't expect it to be some kind of agreed-upon
> kernel project when it's a closed system.
>
>                Linus
>
