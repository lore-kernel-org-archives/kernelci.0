Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E32F12E410
	for <kernelci@lists.linux.dev>; Thu, 29 Feb 2024 20:21:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709238081; cv=none; b=HRGuZHfofg4vVLgkVbbqjGHpkUXLDG8+airrdcZFiHHvamo5fct7h22qCL478NnotU9xjvajNh2HuEHrwQXuBDmE1cbbciwwuMkpIpjMFxiDpOWepcmdcFeGVwYkU1un48PTDlBlk2SELkQPRZr5fUBrBLnWFJqNWtQIaUZRMWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709238081; c=relaxed/simple;
	bh=uXWrJbshZP7CBnPLaekgrXuRiji+uddEtfNEXyijjLg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=W/jXtvS7qIjMXvmpK/jLCkC1G+pZfTlhN4icLypb52H47V502EU1Ghn9/h01PuH3Smx1IAs2x29nc8B0S7LNPnVMPFuKxdK0IEMXaL/TfAJwRYagBiFELTaxMkRppHc4tM5yFO+nvBDtKB87mpbXmqhblX9FrvJlHfx8PY/UlIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=g213AuX3; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="g213AuX3"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5131316693cso1718252e87.0
        for <kernelci@lists.linux.dev>; Thu, 29 Feb 2024 12:21:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1709238078; x=1709842878; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=k0i0PgDtVBoPSBAUnZ0cg1G8fT87ylUFojqmg8T1gpw=;
        b=g213AuX3Z+UD3SlQC4M2o9j+ZrB06WvT9sbxoIVaD+srMyB6DEBvxhhZ919fimko0Q
         5I/XYS8CdKjIN4i6OznqQZD8fmWtub6VsjxVMlEkwAno3DMTWh7QK5ogLrP320S13/mx
         DqjolgmugjxanA/glQLCyeQDxkLk5QYo1JqVE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709238078; x=1709842878;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k0i0PgDtVBoPSBAUnZ0cg1G8fT87ylUFojqmg8T1gpw=;
        b=exc+/eSeZ+iScDmnnjZQMSDRBN7vScgZGr20QMIxJc5Q32zzCkIFHfoAxEv0tg45Bl
         YSdWPleqkKvfCTFQTZFETYYnZXkfi7pVLF+oaz46xQv5db3WkMFhRgYHWVsm9h1CSopX
         i/Yiyl0Zwu93x9DecXW4lIovwoleNT1JSThVzi9b4tW17k0+YUBWQoeBbaWIcYF1gaBG
         avKeb3i3EXroo5G4I+49j12FoTzMw5lBPAXo78ONQkYtz/gw7/1E2D6LNtC3O0cFyJ2v
         hVVkYds8CUbCWTWpoAgcpHmU/bEIgydeHa+X7ulbgECW0FtBrZi0pjSh3FFIElzNcwqc
         rlCA==
X-Forwarded-Encrypted: i=1; AJvYcCW8F+4O6p2bp7jKPYoW7h0i16kUsxVsOvhCpKLIv+0Rs4p1WhdYCK4a0PtmH39VHwtLbuwEfX94qlke9EFhpNkkKEvOzEKUi7s=
X-Gm-Message-State: AOJu0Yy53TxuFUWB3yW4Zbg5CcQWKCSBOXuSzZdkbDYm5pss3JCBGElu
	A0ixwkLTk1REYqVQJElYUO/I8vZweFnntwMNuuwMriBz8y+vF/DyrcxKGdKV3K71MoldSqwELTB
	Oj+borg==
X-Google-Smtp-Source: AGHT+IH1MfLO7prHs/euAMZpSkGxTuSqqORTgQ0j8NZuLWSNzQb08DST9R7GbHDVTBr1rKEEwueDTg==
X-Received: by 2002:a19:2d11:0:b0:512:bdd3:153c with SMTP id k17-20020a192d11000000b00512bdd3153cmr2137270lfj.18.1709238077970;
        Thu, 29 Feb 2024 12:21:17 -0800 (PST)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com. [209.85.218.44])
        by smtp.gmail.com with ESMTPSA id m13-20020aa7d34d000000b0056486eaa669sm901268edr.50.2024.02.29.12.21.17
        for <kernelci@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Feb 2024 12:21:17 -0800 (PST)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a443d2b78caso175526266b.1
        for <kernelci@lists.linux.dev>; Thu, 29 Feb 2024 12:21:17 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWH66AMIbfAv7T4sP1MdKUP3CZj5T6Qab2KuNaC9ZuuoVN9y+T79+KjdcgwRQL26CA11kwBzui25QCMaY1WJaGzhB6WdPSZmrk=
X-Received: by 2002:a17:906:d9c9:b0:a3f:1cb6:fb00 with SMTP id
 qk9-20020a170906d9c900b00a3f1cb6fb00mr12394ejb.69.1709238077400; Thu, 29 Feb
 2024 12:21:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240228225527.1052240-1-helen.koike@collabora.com>
 <20240228225527.1052240-2-helen.koike@collabora.com> <20240229-dancing-laughing-groundhog-d85161@houat>
 <5d7ed81b-37f9-48e9-ab7e-484b74ca886c@gmail.com>
In-Reply-To: <5d7ed81b-37f9-48e9-ab7e-484b74ca886c@gmail.com>
From: Linus Torvalds <torvalds@linuxfoundation.org>
Date: Thu, 29 Feb 2024 12:21:00 -0800
X-Gmail-Original-Message-ID: <CAHk-=wixVy3WYvjbt43ZSrCqPDsS76QJQSkXFbbPsAOs1MCSAQ@mail.gmail.com>
Message-ID: <CAHk-=wixVy3WYvjbt43ZSrCqPDsS76QJQSkXFbbPsAOs1MCSAQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] kci-gitlab: Introducing GitLab-CI Pipeline for Kernel Testing
To: Nikolai Kondrashov <spbnick@gmail.com>
Cc: Maxime Ripard <mripard@kernel.org>, Helen Koike <helen.koike@collabora.com>, 
	linuxtv-ci@linuxtv.org, dave.pigott@collabora.com, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-kselftest@vger.kernel.org, gustavo.padovan@collabora.com, 
	pawiecz@collabora.com, tales.aparecida@gmail.com, workflows@vger.kernel.org, 
	kernelci@lists.linux.dev, skhan@linuxfoundation.org, 
	kunit-dev@googlegroups.com, nfraprado@collabora.com, davidgow@google.com, 
	cocci@inria.fr, Julia.Lawall@inria.fr, laura.nao@collabora.com, 
	ricardo.canuelo@collabora.com, kernel@collabora.com, 
	gregkh@linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 29 Feb 2024 at 01:23, Nikolai Kondrashov <spbnick@gmail.com> wrote:
>
> However, I think a better approach would be *not* to add the .gitlab-ci.yaml
> file in the root of the source tree, but instead change the very same repo
> setting to point to a particular entry YAML, *inside* the repo (somewhere
> under "ci" directory) instead.

I really don't want some kind of top-level CI for the base kernel project.

We already have the situation that the drm people have their own ci
model. II'm ok with that, partly because then at least the maintainers
of that subsystem can agree on the rules for that one subsystem.

I'm not at all interested in having something that people will then
either fight about, or - more likely - ignore, at the top level
because there isn't some global agreement about what the rules are.

For example, even just running checkpatch is often a stylistic thing,
and not everybody agrees about all the checkpatch warnings.

I would suggest the CI project be separate from the kernel.

And having that slack channel that is restricted to particular
companies is just another sign of this whole disease.

If you want to make a google/microsoft project to do kernel CI, then
more power to you, but don't expect it to be some kind of agreed-upon
kernel project when it's a closed system.

               Linus
