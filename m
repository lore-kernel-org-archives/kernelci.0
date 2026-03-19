Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45F8321B1BF
	for <kernelci@lists.linux.dev>; Thu, 19 Mar 2026 11:10:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773918635; cv=pass; b=CEuYcUsVZJ8zo/DaoAHWyAIit/L2bVg/mm4cyhKYxcIc64seNtZA3NITOqy0CdgsCWyeH9bUSxawKETY//ay4vhsA1XH9jq/HTIs4BbGWalBViSqWLa2eswVL7kvgZnKvdjEiFE/5FqQj2sZRf5c2xlvVfpPKXBYMk62Ti9SkRQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773918635; c=relaxed/simple;
	bh=Q28JNE3zOrnDMPOslKlKb31VcOPAQPXKgyip4TutYZs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=i6yskeyQyPkLhxLoxHegq84d3Rpm3N8fRtuCORQsCl3zPlRSYCD34lVArPAM99cmxltaN1IQTI9XKGr1YJnLzGdscx3lcB2sPZikQYWyrqDgYUmy0R9eSZFhKXmmr9yCMEBLBMmzupwsRIBY5yAhCPxtNvpNseFH6wIoJ6SH4WQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N9qbR4kM; arc=pass smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N9qbR4kM"
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-2b8095668ebso51543eec.2
        for <kernelci@lists.linux.dev>; Thu, 19 Mar 2026 04:10:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773918632; cv=none;
        d=google.com; s=arc-20240605;
        b=FYAD97vNBYrd8FFziD6gu6JBtiwMdPPKvI2TFU7ekl6Ru4JmLR+v5dHWmSEk0/8Uhd
         BbblVB/Tvs3rz4x9vGslQYgjxdUBi+BLWprMCZLO7WG2DTFHOoG9gZiUqFShEXJHFa1r
         lo7adgMVLNNbGLYzxsMKWfTAl6iJGX6Yg0ezJAreQmC4nsXz3UqMSs+l8r0sClKjSW3l
         nk+OtyfZzUKohVQqlNalRc3qUej5GmxWthkTarOXQhQRt8/f7ZOnJrguIGwL+BU1jmqr
         9WhMtIdhgkSAMxTRUU5rVZwx6KnPllPTzdNXMMadawW2em58VrS+nhcrMGtsdtcEH3mt
         RZJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Q28JNE3zOrnDMPOslKlKb31VcOPAQPXKgyip4TutYZs=;
        fh=GU/0T8MHPw+k/WUByoR5WcmsBmtaLtmOyMWXFEHW5Dg=;
        b=lp0nPcsEHRjE5DhA/vhsxNZRtOyg2JWt1d0eibPGexSLL/yGb5bk4xg1BHY99vnDGT
         AyGj80QOr8lhV20VbYF6409EHm7O7tJFz3yC/6/RaMjokRp7FK4gBasgyqUyrNVju95s
         MhClK8QJXtwdDzgcMlugjCjv2avAEj5xNKZ8uCd4E5zIwJDyCIO83gVFhelKHLzclQ/T
         c/Ilo2vr2Kv64uMAi4BhVSSgOMwj0uxA2uuVw+OgqxWklGE8JVUryWiaEjYp3l1DeoGw
         A6SsRKUvPkI9TG/rwB6y9yRxYZscQI1YQVur9mvfI8FiY2dWpBMVZnB/5N0+vIVFk7SX
         faWQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773918632; x=1774523432; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q28JNE3zOrnDMPOslKlKb31VcOPAQPXKgyip4TutYZs=;
        b=N9qbR4kMeAzxUXkqMH4QhwfnbMka0RRaWhIpWAQ6zrwJX2v82uP/aqY45FquY3YOBo
         8C7Qpf67TzPHZQwjFZf8T08IbtKqkhMU65qrbEs087Bqs/nsqYxxeE5a0lIfBwGk/xbr
         eYmwcs/YOISc7CmByonkYnvId28scPx9PjDuhD+TNQh7E0EkGV9w3szz84pwSDUPcWe6
         o1MY57NIEOJ9+LKOjh9ts9Ef/xFJRF+aDiG4S5CIcUxbqxjsA8oOtUNXsTWz8hzsvgBK
         TD2JvHu8C8IFkiHiT615IGqFrlHUc0rv1kZJX+q+8OOqbBsr9cEFrq2alCcrSTO09P8C
         Xy3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773918632; x=1774523432;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Q28JNE3zOrnDMPOslKlKb31VcOPAQPXKgyip4TutYZs=;
        b=Po/uIMjZA3bWG6HYgiJQRznjt0PIf+KRnBz+eIUNwOIv0xtlse8tfTECzaQq1PJLLP
         F1iQMs+s14XiF18Jpf7/MlE6F2L5n3znR0MJk0gCfD6MdZoB3hXuwqpa1duYGiF6dGlp
         vjlwuQmokEFXArvMn+z2ZJHuPCFQgbTgZ+m+AnLG1vmYq61rk1zIqCYvOMzOj0TCXxk1
         x2N3HmhqSXG3jXfsRm0qZL8FziPXXvWi5IhFJzRZj+HwW2qvVA2+SKbaUZ3GgGGJ2NuV
         U+j4WuQJbPSTOIOlQCgVucSoO4sTYFdnEiJXr6SMXJxiEltNkkWA8N3/P67F5KGZHlMX
         p1Cg==
X-Forwarded-Encrypted: i=1; AJvYcCVj9/+5/yHA4I6VtXAxqP5aOtODuQFM9Ph8qT3PhtsMIHF/4i1N1AcCJjPEJajduvzxOfg7rgA58w==@lists.linux.dev
X-Gm-Message-State: AOJu0Yzt/os2Iv5Al1xfJrAMxVxmlBVFmYSt4zoyRG3lqQ6Ssk3CdQif
	J7P85yp6dXfs7OOf8XR5gmm5n4Rmsa1eU9jJALEg7t/9ruubuJ9mBB6keBDMdr/d5TCNiw0LaGn
	svIgN3gkbyOAgDzz9homQkUhdFzaVMTg=
X-Gm-Gg: ATEYQzwL13Ocy8WV4CtOj5eWhLokpCGlLtir21hfR3mfbw4uUB/KxIBzVj9gPxpe8Bn
	fP0icOCjAFrkUGM7EOAUH0Vr89WhbVrqAJJqiaxNGTfzSb16rSJQU1jzRrymVGuIA7Pcr9tItSl
	q3/uP5xfTHIcoJ6GMLGnabGbk7Ce3il5B2aj+IdaF5KNYRYU0j8YK877R0b4tFybEsAnHqF+vTr
	iTuihgZw6PLKHar/fvqIp+VyaYSVsrTX8O6W0w7BwLp1S1/OexCMXzW8W0fn2r17eGMp6HzXShP
	2bYu1Cm7nXUsAZxeQkhvW0tccrknavUJ2vcpRVd+/pzWrTdu+hGH/EbpGYr8TD085gMR92Tx5cT
	O7iwg/ptFs6Lfm/3xc8yjOIg=
X-Received: by 2002:a05:7301:1285:b0:2bd:db75:c28b with SMTP id
 5a478bee46e88-2c0e528a5d4mr1401381eec.7.1773918632327; Thu, 19 Mar 2026
 04:10:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cc737636-2a43-4a97-975e-4725733f7ee4@gtucker.io>
 <CAL0q8a7mepGUdgrLsQhCUdLVP8VcxB9x_oBRCWAYNeoVAUb=7A@mail.gmail.com> <78adef0e-81b0-47d4-be20-32f42ab8ec04@gtucker.io>
In-Reply-To: <78adef0e-81b0-47d4-be20-32f42ab8ec04@gtucker.io>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 19 Mar 2026 12:10:19 +0100
X-Gm-Features: AaiRm50fomumEtRa1rcztbB8_A65g2UTx_UuAfqMwTNqyrG_bjS2Jj1Lf32hxKs
Message-ID: <CANiq72=t=q4__vwTFjg+gQyjKLUEJrZBngr3cAnnKiTNM5uteg@mail.gmail.com>
Subject: Re: Hosting first-party kernel.org container images
To: Guillaume Tucker <gtucker@gtucker.io>
Cc: Ben Copeland <ben.copeland@linaro.org>, 
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, workflows@vger.kernel.org, 
	automated-testing@lists.yoctoproject.org, 
	"kernelci@lists.linux.dev" <kernelci@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 25, 2026 at 3:44=E2=80=AFPM Guillaume Tucker <gtucker@gtucker.i=
o> wrote:
>
> Nathan, Nicolas, Miguel - what are your thoughts on this?

I agree with Nathan that `Containerfile`s on git.kernel.org sounds good.

While many kernel developers may not use them (mostly because everyone
has their own setup already), if we had a set of "base" images that
are maintained by someone trusted (including publishing them in the
usual registries for easy use), then I think a bunch of us would
actually use them for CI and possibly other tasks; just like some of
us already use the kernel.org toolchains "manually" anyway etc.

It could serve as an entry point to discover the different toolchains
and software offered by kernel.org, i.e. not just the GCC and LLVM and
LLVM+Rust toolchains, but also perhaps `b4` pre-installed and so on.
Even things like `tc-build` or the latest and greatest set of AI
context text files could be considered too.

It could also perhaps simplify a tiny bit giving quick reproducers
compared to giving the instructions for a distro base image + extra
things to install. It could also be a good thing to give newcomers
(i.e. how to set up all the development environment is a common
question) and LLMs.

I mean, all this is nothing new of course, but sometimes trust and
convenience go a long way.

I hope that helps!

Cheers,
Miguel
