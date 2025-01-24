Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4642F23B0
	for <kernelci@lists.linux.dev>; Fri, 24 Jan 2025 17:04:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737738294; cv=none; b=b77DDn2kkH3yrtoj4xmpprrNR1VjAXywbZpNwVGsTk9J6KBVpXi9MQ2Kg8N7CAgjFojyg/ycDBkHENgzoVTH/FO9DoswfHsUoYgYrOyhTh3zMrfP/8D1pkkNwklqAdXraRCT4bVn5dkVt8yRVMZfDu/X7T82gyD8LcxPNYQxj80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737738294; c=relaxed/simple;
	bh=4fN1uH9lDG5fEfcui8GHEO7QetyS/U+dA8LY00hN1Hk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NKsHJAez956E+lwwsk9+S0a0JD4v1dzs6QffyQgQMGly5T77TIdaP8Ryhb8IwObFn/jhELabUUgCi2jsbPbjbBYt0WV664VXHAPFggak53YBMj4+nVCjo/7kPk+I2MEPwH0/LZ2ZFIJLJ80YVwtzENrnXsKIeiriE+W50dnhPx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=PTZpv7/M; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="PTZpv7/M"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1737738291;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=a3P5t3YOD48EA0EV2RHNoq8geVxugYi56wkyKb35rHg=;
	b=PTZpv7/MjuG8/I7mpB8SmWYv5EXfIlQdUc22C19j1NPT+cdKGv+yfYgp8UiDin7l9VkRKm
	GUM+1Af/mSKznQqMHZO4YzlJgwAyOpl8STQ+AXRWP2VJmQoITRuAbsHIFBb/w8g2jpnVFG
	uFEFexK2ImSv8HAgrnc+Xk+WTn7XP98=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-159-IDjEokayMgWGuOsAJVoHhA-1; Fri, 24 Jan 2025 12:04:49 -0500
X-MC-Unique: IDjEokayMgWGuOsAJVoHhA-1
X-Mimecast-MFC-AGG-ID: IDjEokayMgWGuOsAJVoHhA
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4359eb032c9so16346475e9.2
        for <kernelci@lists.linux.dev>; Fri, 24 Jan 2025 09:04:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737738289; x=1738343089;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=a3P5t3YOD48EA0EV2RHNoq8geVxugYi56wkyKb35rHg=;
        b=bGPNr8pyGABzH1oyAQn0kIYZzMRm2pPd/Va9DPD10jeJ03cUrOMkamDVN6BbO1elk5
         OC533ejWCfKn8+/XgiJjL8FA3eObzIVe5w0LSe3OWuCmUZTbtwf9UH02GQDM/dFef5e7
         XQFGKMpn23x9b7Ng4VKIPYeRst0T4UZBqbbVNBxGM4s4PUnlVPoHfxT6eybak+ye5eHw
         9yhXdlqbFiYXgW+WCU8AhIIaBeKP0Z8wRH9WMT2Zw0uONmoMuqaMMGB5HzCYOLs2ybL7
         XsOqWGtVFd4ywOCtvt13vldziTJlPAv3RRfYiPsugN8zG0baH2cRS27KKd3hwFT4FmBH
         lCiw==
X-Forwarded-Encrypted: i=1; AJvYcCVretTFOibQRYN2sleRrUKl12uJxn2FtImA/vgd/ajPAjExERrndSKbeVUpBLsSI0Kg1JYVlYnQKg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwRQ70i7fwxmL3s0ZrPcFpoXS+S1uo4StyujRjhEdiyJ4OAX2yX
	Cntj4eSv0M/EdxpHER/SckXjiXMVo5br4LrH1asvs5BcU3EjnlAuRwHyHMx80dtO94NdV2J7lXs
	aP87fNYKBYJUpht+e9ElAU/J7uzs3IC9NgJcOGIETp5nXcgF28HFMAPae
X-Gm-Gg: ASbGncs+gGvpgQTEziwLusCoyjta+niarqPhAD+aQOT62VNdJStTeABxR8n/fJzdIEM
	iPul0XaxouNFs5cVgaq5HqGRKAp/NdJ0EGYz5aaDzc6q9Tku2Mr3uL6YQqU0eCL4V5UwRA8Y4MN
	RlcirjdNZX6fkqtpzcodTPBbpmCreTz5iUCJsIMY6TAATsXVyJpzAxJKwbRmQh5Iv4mvqskA0qn
	2oicrrGl8fCJqwYP/EGxLmOrJX/5TOZmvn3eWSN1NmLOQYFRYMBhJIzylkSDQi0cOssEc8f5g1J
	OKqnhlUDYGDfHMbXU2QS1cOtkItAnj9Tp2QH8kq6lfVnuw==
X-Received: by 2002:a05:6000:1aca:b0:385:fb8d:8658 with SMTP id ffacd0b85a97d-38bf57b7fbdmr32674039f8f.40.1737738288531;
        Fri, 24 Jan 2025 09:04:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG+G9Ly889nxwWYhEnpSlN2C9XnZE/zqCyWPABsxutMfB8Ly5aCQaffnJgn9avJEiwi5J80pg==
X-Received: by 2002:a05:6000:1aca:b0:385:fb8d:8658 with SMTP id ffacd0b85a97d-38bf57b7fbdmr32673940f8f.40.1737738287978;
        Fri, 24 Jan 2025 09:04:47 -0800 (PST)
Received: from [192.168.0.167] (h-185-57-5-149.na.cust.bahnhof.fi. [185.57.5.149])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c2a1885besm3187760f8f.49.2025.01.24.09.04.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Jan 2025 09:04:47 -0800 (PST)
Message-ID: <8db7c8cf-6976-4dbd-92d1-62ce5288dfb7@redhat.com>
Date: Fri, 24 Jan 2025 19:04:45 +0200
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/5] kci-gitlab: Introducing GitLab-CI Pipeline for
 Kernel Testing
To: Jarkko Sakkinen <jarkko@kernel.org>,
 Vignesh Raman <vignesh.raman@collabora.com>, kernelci@lists.linux.dev
Cc: linuxtv-ci@linuxtv.org, dave.pigott@collabora.com, mripard@kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kselftest@vger.kernel.org, gustavo.padovan@collabora.com,
 pawiecz@collabora.com, spbnick@gmail.com, tales.aparecida@gmail.com,
 workflows@vger.kernel.org, skhan@linuxfoundation.org,
 kunit-dev@googlegroups.com, nfraprado@collabora.com, davidgow@google.com,
 cocci@inria.fr, Julia.Lawall@inria.fr, laura.nao@collabora.com,
 kernel@collabora.com, torvalds@linuxfoundation.org,
 gregkh@linuxfoundation.org, daniels@collabora.com,
 helen.koike@collabora.com, shreeya.patel@collabora.com,
 denys.f@collabora.com, nicolas.dufresne@collabora.com,
 louis.chauvet@bootlin.com, hamohammed.sa@gmail.com, melissa.srw@gmail.com,
 simona@ffwll.ch, airlied@gmail.com, Tim.Bird@sony.com,
 laurent.pinchart@ideasonboard.com, broonie@kernel.org, leobras.c@gmail.com,
 groeck@google.com, rdunlap@infradead.org, geert@linux-m68k.org,
 michel.daenzer@mailbox.org, sakari.ailus@iki.fi
References: <20250123135342.1468787-1-vignesh.raman@collabora.com>
 <D79RU9MHGKJ8.1HG89ZJS4Q5FC@kernel.org>
 <a77f2eea-1793-4e83-92b0-92b5bbd23a5e@redhat.com>
 <D7AG4810MH9U.3SA2YT8ZPY6QF@kernel.org>
From: Nikolai Kondrashov <Nikolai.Kondrashov@redhat.com>
In-Reply-To: <D7AG4810MH9U.3SA2YT8ZPY6QF@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Kc0RBrokVA0kjFezvY_QXcPgrAhCMkKyTeb9Dqcl524_1737738289
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Jarkko,

On 1/24/25 6:32 PM, Jarkko Sakkinen wrote:
> On Fri Jan 24, 2025 at 2:58 PM EET, Nikolai Kondrashov wrote:
>> Of course we could keep it outside the kernel tree. However, the point of this
>> contribution is to provide kernel maintainers and developers with an easy way
>> to setup their CI pipeline on a GitLab instance (the main one, FreeDesktop
>> one, or any other). Basically this is like a template or a library, if you
>> wish, which helps you do that. Approved by Linus too.
> 
> With all due respect, "approved by Linus" is not an argument :-) I get
> that Linus can make the "ultimate decision" but in argumentation I'm not
> a strong believer of authority based decision making process. Not
> downplaying this more than that I knowingly ignore this comment.

Sure, fair enough!

>> Why GitLab? Because it's one of the best, if not *the* best CI system these
>> days, with lots of flexibility, and it's Open-Source too (well, at least
>> open-core, which is still very capable). And also because a number of
>> maintainers and companies are already using it.
> 
> There's also Github Runners and Woodpecker CI used by Codeberg. To add,
> some companies and other organizations prefer Jenkins. This one fit for
> all strategy is somewhat short-sighted.

We're not suggesting everyone should use this. We've just been using it, know
it well, know it works, and so are trying to help people use it. Please feel
free to use something else, and of course contribute the corresponding CI
setup to the kernel repo! Not that I can stop anyone, of course, but that's
the idea behind this. Note the "/ci/gitlab-ci/" path. Anything which could
help maintainers/developers integrate testing with their development workflow
cango under "/ci/", I think.

> Also running Gitlab tasks locally is possible but is heavy-lifting.

Yeah, it's not perfect.

> Can we then agree that any CI changes can be sent untested to LKML if
> a patch set needs to reflect on those? It's not reasonable to except
> local runs Gitlab from individuals for patch sets. It makes our lives
> more difficult, not easier.

This is not really for individual contributors, but for maintainers/subsystems
to help automate their team's (and contributor's) testing.

And this is not saying you're required to run GitLab CI for your contribution.
It's up to a particular subsystem to decide their policies: whether to just
have the maintainers send contributions off to a GitLab CI instance during
review, or larger merges, give co-maintainers access to it, or require
contributors to submit an (automatically-tested) MR.

If you send patches changing CI, then of course you're expected to test it, as
with any contribution to any project. But if you're not running it, why would
you do that? And if you or the recipient maintainer run it, then you get it
tested automatically.

> All maintainers I know test their patches for the most part with
> BuildRoot, distro VM's and stuff like that. Not claiming that they
> don't exist, but never heard of kernel maintainer who uses Gitlab
> as their main kernel testing tool.

Well, some of the people in this discussion do that, and more are mentioned in
that talk I linked. But sure, I think contributing their setups to the kernel
tree would help others who want to automate their testing.

>> Sure, a script could be contributed too, but the value of this contribution is
>> a ready-made integration. And we want to make it easily discoverable, and
>> easily contributed to.
> 
> This is definitely NOT "lots of flexibility".
> 
> Are you dead seriously claiming that DevOps engineers could not handle
> well defined CI scripts and bind to whatever CI makes sense to them?
> o_O

No, of course not. This is simply to make life easier for maintainers, who are
not necessarily DevOps engineers themselves, and want to try it out, or have
it setup.

Of course, having well-defined CI scripts would be great, and we enjoy e.g.
well-defined make interface in CI, for example. I assume engineers who
implemented this (Helen et al.) would be happy to use such a script, if it
existed and was suitable. The problem is that it would still need to interface
with GitLab CI, which is while flexible, suffers the flip-side problem of
being complex. And that's where the devil is, and this contribution is trying
to help defeat it.

>> BTW, here's the talk we gave at last year's LPC regarding current use of
>> GitLab in the kernel and surrounding community:
>>
>> https://lpc.events/event/18/contributions/1728/
> 
> This patch set should make the case, not an old presentation.

Well, I'm sure there are angles not covered by the cover letter and commit
messages of this contribution, and I'm partially to blame, as I was one of the
pre-reviewers. However, I'm sure we have left more stuff uncovered than we
discuss here, even considering the discussion of the first version. And so I
provided the link to the talk as a rectification. But if it would help, I can
provide a summary of it here too.

Nick

