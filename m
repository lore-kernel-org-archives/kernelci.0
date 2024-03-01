Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 097DF39ACE
	for <kernelci@lists.linux.dev>; Fri,  1 Mar 2024 20:10:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709323857; cv=none; b=Q0OE9vyyK2FLGg/7hknWDzZs3QlTikgOSBc/4YV4JtofKycOaD97EfQFyrmnE5daMljSRJCQJl0EzJhBkJjREV1tr9+0zVKB/pqV/bbOOqyqgmCSatm4SnU7a6j5gYmL0E/tviTcVvDQyyHqwKvf1af3pQzhIpc+WNDoNXi7wrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709323857; c=relaxed/simple;
	bh=eIlmeeWJ+q21jvedK7al42fEAfG42vJONf3MXPx/cRg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Vxl7T4Emi3CmhYrkMoQGIi+GxuOpJUQ3wmbsFIKoBdh4fCXbxwncAfWNDMR8s6Ygb8+g+M/Uw4gEVvNqP0/Cu9hH9cfpEDhIK085P+Yph0yWTBwDksWY44iKNoEbz6ggP017DaHts9AwFat6GTBADOXvKUMwKgjbfeQ1BZJ7nng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Ucux93Dr; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Ucux93Dr"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-56648955ac5so3580225a12.3
        for <kernelci@lists.linux.dev>; Fri, 01 Mar 2024 12:10:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1709323853; x=1709928653; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=GjHlLe8ifOuwGHIPhGu9Px14t+AYIlwm+A28Gp3fNW8=;
        b=Ucux93Dr01K0KksK7hE0GmUTjiIm5Gj3zRZSo/g6ftpV+sHXDnGP/t283v/9LGb9iN
         +nQEu+kzi2dq0hAlFlnEkG3e0p9z/Abf5o058P+8stbPToXjQf+GhEPdwna6KlHPpC+d
         oUYtZa7ezVYQ47SgT3TBR8nmymEQ3wPSOtNVg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709323853; x=1709928653;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GjHlLe8ifOuwGHIPhGu9Px14t+AYIlwm+A28Gp3fNW8=;
        b=p2q32j5LPdUXexKlS4G44+PTOa3HDMBTRfwkDbfe3FUcnRG8rd3++mrJ4A+Mng5lPm
         m6GVGkzuR3FMeYJbkE493KaMBFhlafR6KO2mWwhcECsNvfWQV7K0IT6aaUUPNnlqcXU9
         SG7pJhgDhpqRcjeECO5BiVFaWvyYuG4mQWqXWKcBXuQWzIcVzv/tXElpfz3KYWU4Nhdk
         SPiP61p/eYKO/P3Ez9zkJWXx/u9cuIXcjJJ8WlHA7zCfUhGOxXGCBlyADcSDWmyMfdAB
         sOsbycacZdmzRbDOg9VNQND8SYX57PoERU9aJoElPty1BDEQt5oqrkYs18tbdPqpFFmG
         tyNA==
X-Forwarded-Encrypted: i=1; AJvYcCXGCZnZ8A8U8D+dueiQTjoiYYLb/Ricop1ThEHwbNhpM1F6RosTzVIRJEcjhr+Y9W9mz6jk0nv/tlByTto6vRHrqESD8moZC3I=
X-Gm-Message-State: AOJu0Yw1og8gG6Df9/NieLFoj3WhkRg98X05rHJMoNLpQd6k7l0k9JQW
	egocZS+z3n4wHdNVWk9JTb/effrKkiM3kaKg7v+glTm0USZmG3gCl7eR1v58x6BruEX8Q4bWGFZ
	1XAOFXw==
X-Google-Smtp-Source: AGHT+IG4/OB5omohPMuxm3fWC08wjJpNdYHufxTQlMxHmACvKcOkvvP09nPTRzt+L3kaO5WzEKSfPQ==
X-Received: by 2002:a17:906:e211:b0:a3e:3a1d:f4b5 with SMTP id gf17-20020a170906e21100b00a3e3a1df4b5mr2142816ejb.65.1709323853409;
        Fri, 01 Mar 2024 12:10:53 -0800 (PST)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com. [209.85.218.44])
        by smtp.gmail.com with ESMTPSA id t9-20020a17090616c900b00a42e4b5ab00sm1990047ejd.41.2024.03.01.12.10.52
        for <kernelci@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Mar 2024 12:10:52 -0800 (PST)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a3e552eff09so350921166b.3
        for <kernelci@lists.linux.dev>; Fri, 01 Mar 2024 12:10:52 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXtRc2xIh2RBwm/7zb/EkFEsT8zW9jz3eARtzNOnEGbEHEawmL44V5088L6wOyzf3pZUCCrIcxjcJtyBUXQqIDjjaqfnFT8a/E=
X-Received: by 2002:a17:906:e08d:b0:a44:731c:bace with SMTP id
 gh13-20020a170906e08d00b00a44731cbacemr2324717ejb.35.1709323852310; Fri, 01
 Mar 2024 12:10:52 -0800 (PST)
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240228225527.1052240-1-helen.koike@collabora.com>
 <20240228225527.1052240-2-helen.koike@collabora.com> <20240229-dancing-laughing-groundhog-d85161@houat>
 <5d7ed81b-37f9-48e9-ab7e-484b74ca886c@gmail.com> <CAHk-=wixVy3WYvjbt43ZSrCqPDsS76QJQSkXFbbPsAOs1MCSAQ@mail.gmail.com>
 <44ae0339-daf1-4bb9-a12d-e3d2e79b889e@gmail.com>
In-Reply-To: <44ae0339-daf1-4bb9-a12d-e3d2e79b889e@gmail.com>
From: Linus Torvalds <torvalds@linuxfoundation.org>
Date: Fri, 1 Mar 2024 12:10:35 -0800
X-Gmail-Original-Message-ID: <CAHk-=wiccniE=iZDC_e7T+J8iPVQbh1Wi5BaVee9COfy+ZaYKg@mail.gmail.com>
Message-ID: <CAHk-=wiccniE=iZDC_e7T+J8iPVQbh1Wi5BaVee9COfy+ZaYKg@mail.gmail.com>
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

On Fri, 1 Mar 2024 at 02:27, Nikolai Kondrashov <spbnick@gmail.com> wrote:
>
> I agree, it's hard to imagine even a simple majority agreeing on how GitLab CI
> should be done. Still, we would like to help people, who are interested in
> this kind of thing, to set it up. How about we reframe this contribution as a
> sort of template, or a reference for people to start their setup with,
> assuming that most maintainers would want to tweak it? We would also be glad
> to stand by for questions and help, as people try to use it.

Ack. I think seeing it as a library for various gitlab CI models would
be a lot more palatable. Particularly if you can then show that yes,
it is also relevant to our currently existing drm case.

So I'm not objecting to having (for example) some kind of CI helper
templates - I think a logical place would be in tools/ci/ which is
kind of alongside our tools/testing subdirectory.

(And then perhaps have a 'gitlab' directory under that. I'm not sure
whether - and how much - commonality there might be between the
different CI models of different hosts).

Just to clarify: when I say "a logical place", I very much want to
emphasize the "a" - maybe there are better places, and I'm not saying
that is the only possible place. But it sounds more logical to me than
some.

            Linus
