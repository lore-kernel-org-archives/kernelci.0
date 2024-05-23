Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 230101E504
	for <kernelci@lists.linux.dev>; Thu, 23 May 2024 13:22:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716470524; cv=none; b=D5jea7dNS6ae0NvffrkKqmoqsYRTGfbOAOjqzKdlf08XB/y/SevXnS9+zyY4ZTU1m7iMwT8x1/KcfYUBid4b+7aCOcE672Ubcpi8iHGi5OXE8EPHAZ5S4CNq+xWZO0AnBxguXMTcbPqkHg7Mj2ddSWmxmosXe0Q2OuGpNNXpJ88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716470524; c=relaxed/simple;
	bh=NH24LVGdDYeMPuYOJqA4c6ioraAkWYckArYfePkuphA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NUMBBKaUr4j7+Szr0L/8x9eZl2EkD9NVUDzCDN47lV+sqAiz/rxbtKl71jUe5p/muvV4rIG+qsXvSJXXb7nPFhXLwMQfl+JEJhlk/MiGD/i2/Dr7LXPr5fiUIL8HRwoFiXDnhokkcqMwi8gn6yJciVgEAGfur9JsRrb5sbrpYT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch; spf=none smtp.mailfrom=ffwll.ch; dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b=L/LH0V7B; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="L/LH0V7B"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a59ad24baa2so93760166b.1
        for <kernelci@lists.linux.dev>; Thu, 23 May 2024 06:22:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google; t=1716470521; x=1717075321; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=On9r6HMkgaTSzrnf05gbFZryZJM5WajSuUMiqmrGLOk=;
        b=L/LH0V7Bh05N3CPsOjoGPBtFEgKlAU7kPSXFAGJXLWECIWM/YghQnGbpZibXSlvJxL
         txbtvnvF+ZQFTQZfwfH2hwZjkmzjdP1JwBvzIuPdRPo0rGlOKo6vYwd+z6//UJQqfNts
         EVTaVS2J/xIodNlnUiNWrFCfDU/i1n/ut7q/s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716470521; x=1717075321;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=On9r6HMkgaTSzrnf05gbFZryZJM5WajSuUMiqmrGLOk=;
        b=vCLatYUDLyuLlmY9luL2ZYYzd2tKAOM3RqCAl0vzuJaBYfKkp3P8j7afqbGlEbWWEb
         KJuJz3V06/+efF6QwK+1J5RIE98GrxWpXGWMP/DJp+saCzRryMoIJGr5RRQE1by/wYrz
         6jE4gImoL1aTJ7wg4fT8rKcyh0K+hatjPc2lpXyUlbNgAOD4K7yPclPieLl2NCn8DDgk
         hgh/KCKrZoZYl2RRPkrHl5q72nbjISoZwr112+3X88N6OwInUxw5cwvqTwNc4YCS/tCA
         3pkmT9Llt5L1AEB4SvyME2yujv92JXKsgm67UjMzIXdcATp5OR2C52UuinCuZyQtuC4Z
         7pjg==
X-Forwarded-Encrypted: i=1; AJvYcCVe22yZ0ngGBFFtxd6d2D9nb/tp817QTYlsJ8vZBH0shi9BLYAMaJs6zLKaeavSvFVTi73YwJIzPdpyYfDjXeP4uL/m4AhuO6c=
X-Gm-Message-State: AOJu0YwetJSMBr31oze2+MrdxJWoD2BX+tOkS78QOG9fiTnwr5RW0wOx
	OOWtMwN//Cavl6VWkrKRBNigW0yY1fUWFxecwgnAI+t0p27/jnZa3DgTas7zoR4=
X-Google-Smtp-Source: AGHT+IGR0y2bdIOAPy2UsVNakF0nkcO1SJLtEWKLN+I3EqK+AagX4rPCgY602MbsaeBciZNK5T/aag==
X-Received: by 2002:a17:906:64b:b0:a5c:e20c:8255 with SMTP id a640c23a62f3a-a622814aefamr315661266b.4.1716470521180;
        Thu, 23 May 2024 06:22:01 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a5a1781d350sm1934790766b.23.2024.05.23.06.22.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 May 2024 06:22:00 -0700 (PDT)
Date: Thu, 23 May 2024 15:21:58 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Helen Koike <helen.koike@collabora.com>
Cc: Linus Torvalds <torvalds@linuxfoundation.org>,
	Nikolai Kondrashov <spbnick@gmail.com>,
	Maxime Ripard <mripard@kernel.org>, linuxtv-ci@linuxtv.org,
	dave.pigott@collabora.com, linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linux-kselftest@vger.kernel.org,
	gustavo.padovan@collabora.com, pawiecz@collabora.com,
	tales.aparecida@gmail.com, workflows@vger.kernel.org,
	kernelci@lists.linux.dev, skhan@linuxfoundation.org,
	kunit-dev@googlegroups.com, nfraprado@collabora.com,
	davidgow@google.com, cocci@inria.fr, Julia.Lawall@inria.fr,
	laura.nao@collabora.com, ricardo.canuelo@collabora.com,
	kernel@collabora.com, gregkh@linuxfoundation.org
Subject: Re: [PATCH 1/3] kci-gitlab: Introducing GitLab-CI Pipeline for
 Kernel Testing
Message-ID: <Zk9C9mCj15hVWUyL@phenom.ffwll.local>
Mail-Followup-To: Helen Koike <helen.koike@collabora.com>,
	Linus Torvalds <torvalds@linuxfoundation.org>,
	Nikolai Kondrashov <spbnick@gmail.com>,
	Maxime Ripard <mripard@kernel.org>, linuxtv-ci@linuxtv.org,
	dave.pigott@collabora.com, linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linux-kselftest@vger.kernel.org,
	gustavo.padovan@collabora.com, pawiecz@collabora.com,
	tales.aparecida@gmail.com, workflows@vger.kernel.org,
	kernelci@lists.linux.dev, skhan@linuxfoundation.org,
	kunit-dev@googlegroups.com, nfraprado@collabora.com,
	davidgow@google.com, cocci@inria.fr, Julia.Lawall@inria.fr,
	laura.nao@collabora.com, ricardo.canuelo@collabora.com,
	kernel@collabora.com, gregkh@linuxfoundation.org
References: <20240228225527.1052240-1-helen.koike@collabora.com>
 <20240228225527.1052240-2-helen.koike@collabora.com>
 <20240229-dancing-laughing-groundhog-d85161@houat>
 <5d7ed81b-37f9-48e9-ab7e-484b74ca886c@gmail.com>
 <CAHk-=wixVy3WYvjbt43ZSrCqPDsS76QJQSkXFbbPsAOs1MCSAQ@mail.gmail.com>
 <44ae0339-daf1-4bb9-a12d-e3d2e79b889e@gmail.com>
 <CAHk-=wiccniE=iZDC_e7T+J8iPVQbh1Wi5BaVee9COfy+ZaYKg@mail.gmail.com>
 <17341b96-5050-4528-867a-9f628434e4e6@collabora.com>
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <17341b96-5050-4528-867a-9f628434e4e6@collabora.com>
X-Operating-System: Linux phenom 6.8.9-amd64 

On Mon, Mar 04, 2024 at 06:45:33PM -0300, Helen Koike wrote:
> Hi Linus,
> 
> Thank you for your reply and valuable inputs.
> 
> On 01/03/2024 17:10, Linus Torvalds wrote:
> > On Fri, 1 Mar 2024 at 02:27, Nikolai Kondrashov <spbnick@gmail.com> wrote:
> > > 
> > > I agree, it's hard to imagine even a simple majority agreeing on how GitLab CI
> > > should be done. Still, we would like to help people, who are interested in
> > > this kind of thing, to set it up. How about we reframe this contribution as a
> > > sort of template, or a reference for people to start their setup with,
> > > assuming that most maintainers would want to tweak it? We would also be glad
> > > to stand by for questions and help, as people try to use it.
> > 
> > Ack. I think seeing it as a library for various gitlab CI models would
> > be a lot more palatable. Particularly if you can then show that yes,
> > it is also relevant to our currently existing drm case.
> 
> Having it as a library would certainly make my work as the DRM-CI maintainer
> easier and  also simplify the process whenever we consider integrating tests
> into other subsystems.

Kinda ignored this thread, just wanted to throw my +1 in here.

To spin it positively, the kernel CI space is wide open (more negatively,
it's a fractured mess). And I think there's just no way to force top-down
unification. Imo the only way is to land subsystem CI support in upstream,
figure out what exactly that should look like (I sketched a lot of open
questions in the DRM CI PR around what should and should not be in
upstream).

Then, once we have a few of those, extract common scripts and tools into
tools/ci/ or scripts/ci or whatever.

And only then, best case years down the road, dare to have some common
top-level CI, once it's clear what the actual common pieces and test
stages even are.

> > So I'm not objecting to having (for example) some kind of CI helper
> > templates - I think a logical place would be in tools/ci/ which is
> > kind of alongside our tools/testing subdirectory.
> 
> Works for me.
> 
> We  can skip having a default .gitlab-ci.yml in the root directory and
> instead include clear instructions in our documentation for using these
> templates.

I'd go a few steps more back and start with trying to get more subsystem
CI into upstream. And then once that dust has settled, figure out what the
common pieces actually are. Because I'm pretty sure that what we have for
drm ci or kernelci right now won't be it, but likely just a local optimum.

Cheers, Sima

> 
> Thanks,
> Helen Koike
> 
> > 
> > (And then perhaps have a 'gitlab' directory under that. I'm not sure
> > whether - and how much - commonality there might be between the
> > different CI models of different hosts).
> > 
> > Just to clarify: when I say "a logical place", I very much want to
> > emphasize the "a" - maybe there are better places, and I'm not saying
> > that is the only possible place. But it sounds more logical to me than
> > some.
> > 
> >              Linus

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
