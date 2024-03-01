Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92D485B1E2
	for <kernelci@lists.linux.dev>; Fri,  1 Mar 2024 10:27:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709288841; cv=none; b=padu1ZJgvSVOv94BTMHjBjQn/XTgOkqd0Wc5W1SFhf8GOWUv0NB4JfRzoAcZbl8rK3LK464D4UyjpPbCrBI0pgJdtotEAWqTpHtPeVxFI1B9E3ceifSjUaaP5njPyi3RxXea6U94x4cDXc36TMuPiDeC/TwlyQauIkHutMLf2Ik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709288841; c=relaxed/simple;
	bh=+8R8JBu0KnyCCbyrJSAZ0i3n/0DKjztSJha154VV2Vg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Z8WD6Kl5haMOKUM5+1FUtc0bHwCiHQsSkpeFLdI0CMVp/IkW+N1MlL0FLt3ltIwh/lIu4ZMkJzhTU/5t7ihfPMorqKfja88ngQaVmkUj5sB4y7b9eJO8KDJEeYNnGc3T49eCBQsxCOibAeYHJvlRBm9CYdGnp+qwA4Xd48kn39k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VpDgWwQS; arc=none smtp.client-ip=209.85.221.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VpDgWwQS"
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-4d33a041ebbso509606e0c.2
        for <kernelci@lists.linux.dev>; Fri, 01 Mar 2024 02:27:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709288838; x=1709893638; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+8R8JBu0KnyCCbyrJSAZ0i3n/0DKjztSJha154VV2Vg=;
        b=VpDgWwQSBIbh9veo0RPTp4POurZCEf2In4lLY/jTP3Vc01m7n3cUFYYGQX2UsqFe+K
         hj+P4HPVFE78+qJc1E8AmdfYtng7YJrKjADlqCFlkCeH5EjhGq4RQkbpkDG8OelTKJks
         dQBfyR1ByYpKR7tUvzVpON6QgtXnrKfiwWCs++uY501SVZjrq+zHiTLij1hnvJ0GidYB
         X1pzsTgLCyuOQ3VXLd/6sM1+a8MyR/9LXDxdKCNpl98rPju6rzHWJeYml6OMSuWLZKe9
         Y4F1bOD22P7KFL/gLGp+laK0u12+i7B2kc+dq4YXBYGZom+R8x9HsTphjqya1QJREV5f
         Sijg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709288838; x=1709893638;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+8R8JBu0KnyCCbyrJSAZ0i3n/0DKjztSJha154VV2Vg=;
        b=L3yipJx3/txshEGaxoxm/ZToIEK8bIKazeY2yZmvNrL1U1Qbdjc7PIEryWgqFCMHhq
         4igbNHn97V1M06azhIF+2WrSnHoDif78fxCVlwGxTzFyGLXhxfM85suT5BhNsRa9DeqW
         WoSQFe72VmJc3PgIFTzkg+a+DGBeT5ZFuSmKG9AgixbSrH2NdaMYadacixE+9FxfwRd8
         WXizpDGaK/HtGrgyV3Wyc1CQA+UY2BpyMQKiOFP0GusYxT86MRj6IDTToXZU8SyzaDZs
         udZMPcKPNh9YUHQ9Jrgl3iG9VMi7M5b2rETabRXtIFvMBjr+naB9nu86K8pDpncQSni5
         3mIw==
X-Forwarded-Encrypted: i=1; AJvYcCWK+0veZKYIintFRi2BFjXdhKkQXvBprTTWUiZKqEClKBHczli8Ujsc4SkE2NRas6ZuNJLI/x2JIOw5HnAvgaRJU1TvmeOR+1Y=
X-Gm-Message-State: AOJu0YyqgRKWxx7UrWr3MyCdve+ZYSJIJ0LneH+IfT4Z2G4ACQ6/EvvG
	rz7qIlgxyVG6hm+5eHHyvjPHnM5bZrBzzjD7SPdk0RUJEuyPz/zK
X-Google-Smtp-Source: AGHT+IGA2EhlSIveghf5fPs7eCJWWBEt2uWG2e0AMbakP0YO1TEMJxKEq/LVB0SDs/hMMY9hmOLxYQ==
X-Received: by 2002:ac5:c923:0:b0:4ca:80c5:7544 with SMTP id u3-20020ac5c923000000b004ca80c57544mr809997vkl.4.1709288838389;
        Fri, 01 Mar 2024 02:27:18 -0800 (PST)
Received: from [192.168.0.118] (88-113-27-52.elisa-laajakaista.fi. [88.113.27.52])
        by smtp.gmail.com with ESMTPSA id b22-20020ac844d6000000b0042ddde7c415sm1586898qto.9.2024.03.01.02.27.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Mar 2024 02:27:18 -0800 (PST)
Message-ID: <44ae0339-daf1-4bb9-a12d-e3d2e79b889e@gmail.com>
Date: Fri, 1 Mar 2024 12:27:13 +0200
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] kci-gitlab: Introducing GitLab-CI Pipeline for Kernel
 Testing
Content-Language: en-US
To: Linus Torvalds <torvalds@linuxfoundation.org>
Cc: Maxime Ripard <mripard@kernel.org>,
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
References: <20240228225527.1052240-1-helen.koike@collabora.com>
 <20240228225527.1052240-2-helen.koike@collabora.com>
 <20240229-dancing-laughing-groundhog-d85161@houat>
 <5d7ed81b-37f9-48e9-ab7e-484b74ca886c@gmail.com>
 <CAHk-=wixVy3WYvjbt43ZSrCqPDsS76QJQSkXFbbPsAOs1MCSAQ@mail.gmail.com>
From: Nikolai Kondrashov <spbnick@gmail.com>
In-Reply-To: <CAHk-=wixVy3WYvjbt43ZSrCqPDsS76QJQSkXFbbPsAOs1MCSAQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Thanks for stopping by, Linus!

On 2/29/24 10:21 PM, Linus Torvalds wrote:
 > On Thu, 29 Feb 2024 at 01:23, Nikolai Kondrashov <spbnick@gmail.com> wrote:
 >>
 >> However, I think a better approach would be *not* to add the .gitlab-ci.yaml
 >> file in the root of the source tree, but instead change the very same repo
 >> setting to point to a particular entry YAML, *inside* the repo (somewhere
 >> under "ci" directory) instead.
 >
 > I really don't want some kind of top-level CI for the base kernel project.
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

I agree, it's hard to imagine even a simple majority agreeing on how GitLab CI
should be done. Still, we would like to help people, who are interested in
this kind of thing, to set it up. How about we reframe this contribution as a
sort of template, or a reference for people to start their setup with,
assuming that most maintainers would want to tweak it? We would also be glad
to stand by for questions and help, as people try to use it.

 > I would suggest the CI project be separate from the kernel.

It is possible to have a GitLab CI setup with the YAML files in a separate
repository. And we can start with that. However, ultimately I think it's
better to have it in the same repo with the code being tested. This way you
could submit code changes together with the required tweaks to the CI to keep
it passing, making development smoother and faster.

With that in mind, and if you agree, where else would you say we could put it?
Under "scripts"? Or "Documentation"? And where it would be best for the
various subsystems to put theirs? Or could we have the top-level "ci" dir and
pile all the different setups there? Or would you like to wait and see how
adoption goes, and then decide?

 > And having that slack channel that is restricted to particular
 > companies is just another sign of this whole disease.

Regarding the Slack channel, we're also on #kernelci on libera.chat, and we
have some people there, but if more people start showing up, we'll be spending
more time there too.

 > If you want to make a google/microsoft project to do kernel CI, then
 > more power to you, but don't expect it to be some kind of agreed-upon
 > kernel project when it's a closed system.

Yes, our Slack is a closed system, unfortunately. However, it's not a part of
the proposed CI setup *at all*, and it doesn't depend on Slack. We just like
using it, but we're also fine with IRC.

GitLab is open-core, and no closed-source software is required for the
proposed setup. There is the public gitlab.com where you can deploy your CI,
there's also the freedesktop.org instance, and it's possible to set up your
own (albeit not easily).

Nick
