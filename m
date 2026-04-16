Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2392522A1D4
	for <kernelci@lists.linux.dev>; Thu, 16 Apr 2026 15:08:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776352102; cv=none; b=XNF2AJAN/iVrsPU0BI0/A7nYi2wcWkiMHNLx8XxrEm6plcL2Y5CmKOFjzWa/HwVVua0mSmM4B4f36FZMFRRHFu22Fn70etx6Xkgc3rV6n8slWUtgHTLeli7Adyz2qZxK+2TTUjhNx4BIf4DYadSfzW2yxFqHypdH5+fIU67rkJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776352102; c=relaxed/simple;
	bh=dLxLDhZsluEJozasLQ1fGGLtCpEhvnHZVUnXZIn1Mkc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Mhj3D5jCjCILmFS5pmogYzPXhJohnrA/YuVA7G9BoYCnZxk5o5Kh6TZOGZvh48iELq3THVfsh0woPGBRjnXKUuc2rUiPQhT/5Dn2YdR2VbVlLllooZPLbEcQAEbJXhyHhvBDswh21XHadlfKcN484WT7+w9mgnQGLrNWQo2Btfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=KaDCnRNk; arc=none smtp.client-ip=209.85.160.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="KaDCnRNk"
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-415e568a7ecso3086175fac.0
        for <kernelci@lists.linux.dev>; Thu, 16 Apr 2026 08:08:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1776352100; x=1776956900; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2vbhnmRO7MCa9WiQ7reMvzj2c+4J3QkirLTz5X95JsY=;
        b=KaDCnRNkbJG+DfKJMz7+CVHGSkNlQSTfJ/CVl7wbwXtVYz+4hdV1iY3WCRZ0pVgDe9
         MsX2w0M8+rUGZMY9xutq9agQidWGVCSKWacVQKMVKxgTRd2xxY7P/W2qFqxNsh47SJC+
         4XG3dE16LBGNCrGY38Z8lIuXYsZA1/YqhA24M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776352100; x=1776956900;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2vbhnmRO7MCa9WiQ7reMvzj2c+4J3QkirLTz5X95JsY=;
        b=oLJUTOCfQ/ffo4HkeBf3QW93qGCZSUCihqiaekwV6jsYq32fQf3Uuclnowe4v/PBWU
         +Xrm9UtOmxkr6PqU1CVS9fJdkhgBoDBAuQKfKfqcTEpzlXnMotsYqdlxfm9gfMzgi7Nn
         sM+AT1O0Oyc9oXf8lRcGOLlf3TRCph/r2Ura/5JxYgzGVBhu2vLPLWl69DjatEVX513w
         WIH82hKG0+oBqQ/bHkvENYJ5mK4ESrRmjqObU3cNUnkwiyyYdWWzYn6nXk4WYUIz6HRx
         8KnDPm+nnpm4r0ZP4QN1Th+wHRj3ft7h6Z069wrWO516sGkIsXka4frSvbhc+m+baNW9
         qebA==
X-Forwarded-Encrypted: i=1; AFNElJ9lbvPgVjezm+VFRbRq21KZCqhvlSzLASOiOmhvYJx9JnTBdK338GFl6zqwX6m8y6vOA1AQrx7fPw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yzr8d2vQC2d/oYLCjHPA7i1Dbv4xornHm26NbcFm3IxC8GyJZlk
	/M/C/TOYUFPn2m27+iNnKPW5+IRjrBiNpwF7wWQkXVNQtOKYf9Kr2M8rQVn2xpEDUdc=
X-Gm-Gg: AeBDieuWMtqLvoROKgS2RLCajXR8exfmgcefVXCSq+FHjYnFVoiR+SpVK7YE1fN2SCp
	JU8A5/hm949+ViWjnk/risb0WEFXKrOHKid3p2rddidMh2tzk1Q9ynvCFci5mlKunkTpHT12kTp
	UfMdfrI3MHeyE3Fli5rwPe3KcD6kIF2MrQzM4Zm5212FKW+0OKmWW3siN+rNwQ2rjXwzUt6pfBX
	5exrpoEFMPYDaS5YcuxSa/kaYyI+XOgrZmiy6RdYUXYQiNi9cYOfVd/qthH3bj9uLFipdk5RtIx
	gTgL8Iftm4cE6ZjeFKcfF9C1tDzaXF86eiNHu/rKyBr/uvGrviih5H1Xr/SoDvlRko75PMrwC6p
	IXRcJp1MO9ziM8jGiyqF4hvN6XwxJIsO0l/uqfypCBGIEfIa5TGvfIdxdUjF1PGpbgki6Xb/qCL
	pcD9Hk7cfBCZZ9zH9YTqmcNPq83lV9OeY=
X-Received: by 2002:a05:6870:7883:b0:41b:f7f5:e887 with SMTP id 586e51a60fabf-423e100f0afmr16167618fac.24.1776352100022;
        Thu, 16 Apr 2026 08:08:20 -0700 (PDT)
Received: from [192.168.1.14] ([38.15.57.99])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-42666bcbedbsm4045489fac.5.2026.04.16.08.08.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Apr 2026 08:08:19 -0700 (PDT)
Message-ID: <c834846c-96d5-405c-97d9-f182b8fe1569@linuxfoundation.org>
Date: Thu, 16 Apr 2026 09:08:17 -0600
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] selftests: Preserve subtarget failures in all/install
To: Mark Brown <broonie@kernel.org>
Cc: =?UTF-8?Q?Ricardo_B=2E_Marli=C3=A8re?= <rbm@suse.com>,
 torvalds@linux-foundation.org, Shuah Khan <shuah@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kbuild@vger.kernel.org, Aishwarya.TCV@arm.com,
 ben.copeland@linaro.org, kernelci@lists.linux.dev,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20260320-selftests-fixes-v1-0-79144f76be01@suse.com>
 <20260320-selftests-fixes-v1-5-79144f76be01@suse.com>
 <ad-ZdjzQZXNgkpwv@sirena.co.uk>
 <3cdf8e79-7c59-4831-9b38-e9c2cef97fe1@linuxfoundation.org>
 <ad-8BIkw_ijCLqcF@sirena.co.uk>
 <e4b82973-7d9e-454d-8f69-6d2a1a8ec7dc@sirena.org.uk>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <e4b82973-7d9e-454d-8f69-6d2a1a8ec7dc@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/16/26 07:16, Mark Brown wrote:
> On Wed, Apr 15, 2026 at 05:25:40PM +0100, Mark Brown wrote:
>> On Wed, Apr 15, 2026 at 09:40:37AM -0600, Shuah Khan wrote:
> 
>>> Mark, would you like to a revert for this?
> 
>> Yes, I'll massage the text from my report into a changelog send
>> something - it'll probably be tomorrow now.
> 
> Sending shortly, FWIW I'm also seeing a buch of issues with:
> 
> ./run_kselftest.sh: 5: ./kselftest/runner.sh: Bad substitution
> ./run_kselftest.sh: 5: .: cannot open ./ktap_helpers.sh: No such file

I will take a look and isolate the two commits that changes
run_kselftest.sh - sorry for the trouble with CI this time
around.

thanks,
-- Shuah
