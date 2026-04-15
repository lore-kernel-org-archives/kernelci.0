Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FD6F1DA23
	for <kernelci@lists.linux.dev>; Wed, 15 Apr 2026 15:53:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776268400; cv=none; b=cmO8mIgZ5eKZT5L/zP4Z86jDT2DaGV+Lou0C5y32ApBr0BhCk16870Mvi0FGyKjO6g1bxJnccLmOns/1iEuNku4Q2MOkR/q66lYPRGo+5v8osdsgzzJI1X8RHchhwLRHILv8VqeN9f4foralSpS8TaGmibKua8DkrN7uLI0xAP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776268400; c=relaxed/simple;
	bh=/5ltL6PoBykT0TuZtMt1PN3HrYWzk/ZrMwLqarywdB0=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=H0JB5Wv/hIL1arHfi+Gs0Tt1Kh/5qcCDS1VUajv2nPUZzDb1Ivkym2yYvqWk+85r4U5g/q35DcpTpbujFQ4vl7CDOa9jvQEcWESmig0tcv359Im8g120SZekJeJGxWGf6g6HU22JScwCN59caVo38c+LcmYETNePIA9ppjeqHSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=HndMsw4J; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="HndMsw4J"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-488c21c636dso42690405e9.2
        for <kernelci@lists.linux.dev>; Wed, 15 Apr 2026 08:53:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1776268397; x=1776873197; darn=lists.linux.dev;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IGwIYx0sLKOmJeXxnXDHEsG54pTXYshNLOsLNJZdtXE=;
        b=HndMsw4JcnfkDHK7zKcv8b/Ma11pCWDrdzWcP7xsZko9j1QO6P1wzQD+TgT7rmNnwa
         7Enz3cKxnHJ3fW998fyWpieTEo8GuAePAMNpvxC+IxwPTLZoUeJKOIxJK14ipZnMx3bs
         ZCIAmkgaCCx7SFATaMNwOePw7qqBUGwRY0Lh1OWiQGKXLd220h9Ju27hWVmCZcJf0pu6
         dv3iXXHs2n2pO25+nTTaidxHddnxqLOb8ncX8fEC9dh6cSwW9XyKbWD5OUqON4njQ0Yj
         25UZ5nFmgLFjIvquAkzV4kb9hg8YU7B0hv0ZJxrwP97UfbAS1eKPLVemEZvsov7LMqN4
         9PXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776268397; x=1776873197;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IGwIYx0sLKOmJeXxnXDHEsG54pTXYshNLOsLNJZdtXE=;
        b=bOGWl6hCbtQBHVcFyhOAJpvgRyCghDt6MkbOawOe9ScioXNrGAabYPrqzWIm8f5M0i
         ntriYAsbuVNMb60Y72I8NiZ+HNhfMrRFR3tKGdOTEl67We1luWEO02/8IwFl0Q89jfw/
         fYM/bdJBlXJ9Fd+Oy65X8J9ONSlMaZs3jO4FOVZPfAbpLwWYwWcnTjzUSy9Cmh+UQBkw
         4q6pzqnxzEB3w00xuTi6Q0YO0b8j7kRRRjhLV+P87RcNtwwimSWE1JZ8E+FXzoYr4HxW
         DhCEzGg16QxsDKIS01cE0/CWYRDUuQhsVP2VO6FBRmLjyEgPbKxbhlj8zc4QpdBONv30
         Ryww==
X-Forwarded-Encrypted: i=1; AFNElJ+PfOkUbtaB0/ZG3yTQE2HHDMacKL+TGIza6QfSsccAL9StaFHpVARP4I9E+ddvGoBfcdVI8NT8qg==@lists.linux.dev
X-Gm-Message-State: AOJu0YywZVMa/V8Vm5+74P4t5pHGZxWTkDpmPFwRHWrfmhacijuVlOr/
	/bRU2WNmOFAqPm2ugY0IhjVTfuoT4bhpizcp385CXxIrsyIAOZ9FFgWXvPtI1/vIGdw6w+RmM7N
	PclAtPSs=
X-Gm-Gg: AeBDievSDoIyw7jXiEPKqLpAGbYvGUsgIAKU0OPp7kSEs8PqQi7pm6oXgRqcJSYk5Bz
	ImP/k1sI8UDDJapCMw78Nq5PUf2K4StYNu8EIjPBC8LqdopvgW1TKPDF9Bx26asMavs6hrCxFTY
	cF0gqhSAnX0nPKIvJk49WGWIbVTDSTJSHisjGRdJTE0O3B+i9sVC0xtMH09eGLXwFptzS16HwUm
	1oZe23uO14RcsniWxhwtNrjw1Yf2kB1DXwYcvlCQqCqeoBDsE+UfLlrHWCsr6AYkv3Z+s43rVMx
	ds51kbOxBldplsWKZ6ufQOpfqTQhovcGdFbwO+eSNpKnlDvopjPyizZ0iiWY/M8aDtm9sicZhTh
	v+8LYr/+YBu7I/FhSuleh/7U6LFr0fiH9E9gvi+Wlq4L+On2PhsQwanKizrh4nPf7j7aiaDO808
	s/ml7s8Guhs9xa/FMX+DjI
X-Received: by 2002:a05:600c:a010:b0:471:700:f281 with SMTP id 5b1f17b1804b1-488d68af20cmr300724725e9.25.1776268396965;
        Wed, 15 Apr 2026 08:53:16 -0700 (PDT)
Received: from localhost ([2804:7f0:b765:e41:8620:c31f:89a6:1fe0])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6932ac8b8fbsm1091791eaf.1.2026.04.15.08.53.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 08:53:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 15 Apr 2026 12:53:13 -0300
Message-Id: <DHTULEYO8FZN.2ED1TKXOSFJ1Y@suse.com>
Subject: Re: [PATCH 5/6] selftests: Preserve subtarget failures in
 all/install
Cc: "Nathan Chancellor" <nathan@kernel.org>, "Nicolas Schier"
 <nsc@kernel.org>, <linux-kselftest@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-kbuild@vger.kernel.org>,
 <Aishwarya.TCV@arm.com>, <ben.copeland@linaro.org>,
 <kernelci@lists.linux.dev>
To: "Shuah Khan" <skhan@linuxfoundation.org>,
 =?utf-8?b?UmljYXJkbyBCLiBNYXJsacOocmU=?= <rbm@suse.com>, "Mark Brown"
 <broonie@kernel.org>, <torvalds@linux-foundation.org>, "Shuah Khan"
 <shuah@kernel.org>
From: =?utf-8?b?UmljYXJkbyBCLiBNYXJsacOocmU=?= <rbm@suse.com>
X-Mailer: aerc 0.21.0-120-g22b95d38161f
References: <20260320-selftests-fixes-v1-0-79144f76be01@suse.com>
 <20260320-selftests-fixes-v1-5-79144f76be01@suse.com>
 <ad-ZdjzQZXNgkpwv@sirena.co.uk>
 <3cdf8e79-7c59-4831-9b38-e9c2cef97fe1@linuxfoundation.org>
 <DHTUDCIYT34R.3VKGNDGUUKS84@suse.com>
 <b80e905d-67bf-4c52-9b61-e52f3acc5b35@linuxfoundation.org>
In-Reply-To: <b80e905d-67bf-4c52-9b61-e52f3acc5b35@linuxfoundation.org>

On Wed Apr 15, 2026 at 12:52 PM -03, Shuah Khan wrote:
> On 4/15/26 09:42, Ricardo B. Marli=C3=A8re wrote:
>> On Wed Apr 15, 2026 at 12:40 PM -03, Shuah Khan wrote:
>>> On 4/15/26 07:58, Mark Brown wrote:
>>>> On Fri, Mar 20, 2026 at 03:29:20PM -0300, Ricardo B. Marli=C3=A8re wro=
te:
>>>>> Track failures explicitly in the top-level selftests all/install loop=
s.
>>>>>
>>>>> The current code multiplies `ret` by each sub-make exit status. For
>>>>> example, with `TARGETS=3Dnet`, the implicit `net/lib` dependency runs=
 after
>>>>> `net`, so a failed `net` build can be followed by a successful `net/l=
ib`
>>>>> build and reset the final result to success.
>>>>>
>>>>> Set `ret` to 1 on any non-zero sub-make exit code and keep it sticky,=
 so
>>>>> the top-level make returns failure when any selected selftest target
>>>>> fails.
>>>>
>>>> This patch, which is now in mainline as 7e47389142b8, is breaking a
>>>> bunch of CI systems - at least KernelCI, our Arm internal CI and my
>>>> personal stuff.  It causes the equivalent of FORCE_TARGETS behaviour i=
n
>>>> the top level Makefile, the prior behaviour where the exit status of t=
he
>>>> top level Makefile ignores failures from individual directories is
>>>> desirable since by default we try to build almost all the selftests bu=
t
>>>> between quality issues and build time dependencies it's very common fo=
r
>>>> at least one of them to fail.  With this commit unless the user has
>>>> configured a more restricted set of selftests it would be surprising i=
f
>>>> we manage to get a successful build and install.
>>>>
>>>> As well as being a poor default due to the very high likelyhood of bui=
ld
>>>> failures this also has the undesirable effect of causing a build failu=
re
>>>> in one selftest to cause the whole install target to fail, meaning tha=
t
>>>> the build failure is escallated to a complete lost of coverge for all
>>>> selftests in common CI usage.
>>>>
>>>> This wasn't showing up in my -next build tests since I set FORCE_TARGE=
TS
>>>> and explicitly choose a restricted set of kselftests which actually
>>>> build with my system and configuration.  It was less obvious than it
>>>> should have been with the other systems since they did not expect ther=
e
>>>> to be a complete failure to generate a kselftest tarball and variously
>>>> masked the error or reported it in a manner that looked like an
>>>> infrastructure issue.
>>>
>>> I didn't see it when I did test on linux-next and my repo. I did instal=
l
>>> to catch problems.
>>>
>>> Sorry for not catching this. We can drop this patch.
>>>
>>>>
>>>> It would be really nice to get to the point where we can reasonably do
>>>> this but we're simply not there at the current time.  At the moment if
>>>> people want to see build failures reported at the top level that reall=
y
>>>> needs to be opt in, we have FORCE_TARGETS for that.
>>>
>>> Good point - I will go look and see if we document this in kselftest do=
c
>>> and add it.
>>=20
>> It's not documented. It would have solved my issue, sorry for
>> overlooking this!
>
> Ricardo, Would you like to send me doc patch for this?

Sure, thanks!

>
> thanks,
> -- Shuah

