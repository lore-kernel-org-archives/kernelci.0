Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 892C72882B6
	for <kernelci@lists.linux.dev>; Thu, 16 Apr 2026 21:15:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776374134; cv=none; b=G2xIjI0wOoDgSFbxSR40nVFbuEhQ6MjcH8di4HX+lq10L+Wv/miM1T57mkXGYy+6q52OMAP6A5dwe91Vq9TLL0P//8AyiJrATT6lPAT/risEB6iLrLG5a6vHEFpCDjlbxrn9XztT7BNclQTR9klv4t3wKawBqA9iAYpXCoaLeTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776374134; c=relaxed/simple;
	bh=I1bLt47VSjWaeL4igpmdpjI+SkBgxLH9XmCMOiEEmaw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VzfZFoT2r9PSnNJ2hEM/wUcyFTZR8s0fSCZGPihYMBVdcKWou/mHN+Y2x1/QrIPBZcrohG9DgEyAElqCC1q+wxzDm0T5Kg5PeemMb4Q45ThXgrFxL3pnbfY95+ALH4QwN1fwg135p9dfTe8WaK2IV0PPbSKBvN9FePoHNPIbcVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=SW71Hxcu; arc=none smtp.client-ip=209.85.167.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="SW71Hxcu"
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-467e8aaa865so22166b6e.2
        for <kernelci@lists.linux.dev>; Thu, 16 Apr 2026 14:15:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1776374132; x=1776978932; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fHMQmXQQ5iVP4ZwbqUQmktHmPMGw34HfaBhpS2wli1c=;
        b=SW71HxcuR95YZ59zajBMQn3AVoRwtdl104TtnZdsCEOIcRvcx3kuSF6V+WjVnXSYyH
         6MSjxJcvP4vZfmRDFtaHTPoSn1iDIfhwbMavxLELEfbn2XkZl2B2jUriO5giZ3a4tFj4
         XK504aWKV5JKs8YOXswTFnXMzYU0g1jFRiYZk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776374132; x=1776978932;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fHMQmXQQ5iVP4ZwbqUQmktHmPMGw34HfaBhpS2wli1c=;
        b=Q1PRbTGKTH7nlWhOGrrpXUF4WulsOUeYDK/2KHMwNxtg8/aoNwRgSSa4vvb12sn9il
         XYzuXxhwGbN08ShTXuenwvxSjjBQ7M1CBnF+XbOWBosMCsmEIvWPPe0v0sOn9Fgw5uUI
         TUzqFQrCjECgOeCL0spWnh8Rd7k81g7IwiDVFD7BAHLriQIsSgfdoV09rk282wvQVivV
         wNCEwGUwucq3B1P6HPSovmUlyowhRYE/7U4mFgKgepgTt9OFjAsZ5S5/flfAxI1Iswtk
         Q4vFkpdFUUDgo2//mkiKAcxcv9+OeP2HAD/vywiQrWX0ueIsD50mI2O7pA0EOgYyTrwR
         xNHA==
X-Forwarded-Encrypted: i=1; AFNElJ/z3cqNsEnrvSMAvOzbr/YSLy79TdySI7sDIyarM9YVWm+bdHh7laWBp9ex1oZuZtuus7bZ3QSO9g==@lists.linux.dev
X-Gm-Message-State: AOJu0YxloCGwcvVzq1osJ77hHsBBnXSqp/5JvnVtI+EY2acNa4B23QoJ
	9D1ZMbVzzq8R1yjR/7HPlnlaw3US5uS4gU1h/lEF4kEfMZ3QqWRP/acoTVZq4WL4woY=
X-Gm-Gg: AeBDiesg8489AramiHFdeUbpO20ifwduHVt/LJz+LwZcX2q1/GT8Hd6qsMZDuiO814u
	Dzrd16h6MBmcvSexVrheV1CbkvQdNrrrWyV9ixFe1rwhzXvoc/Qd0m7cFDmrCu2pClhmVgwFnRL
	Q9LBLnzP+WKva2y9YqnpjlKRjG//v8qDAfhlxgO0Wgq6Ts+Ta0ofkShMXFGKQKlKjXstmrDw0ZU
	aoQ9lWS1Y7YG4sEYU6LtyA3LfFxBhkWzmfDkChd6B6fOpwQcCTEhbeoPFhdvoNAcjCqspB4xnRe
	2y1upfj4mDPuqq0lelYIUeRHzBhoZWQFAKOh6OQCDpyu/ob4yM6ndtpS82Fbfr0Y/zHheV8ExGS
	qibrtBppXg4up9A0vJgSYebp1kgfzTxUpMyemreM5DRzN/njCu0d0kp7ybtkhamA0s9254Eb5cl
	oHgo62Zm2gjNbRLESlKxWiDPV7Lp5t6utrLJGUPgsAeQ==
X-Received: by 2002:a05:6808:180b:b0:467:bfa:bd9b with SMTP id 5614622812f47-4799a233197mr375962b6e.21.1776374132495;
        Thu, 16 Apr 2026 14:15:32 -0700 (PDT)
Received: from [192.168.1.14] ([38.15.57.99])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-47997dbaa4bsm771993b6e.5.2026.04.16.14.15.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Apr 2026 14:15:31 -0700 (PDT)
Message-ID: <0420ebf1-2598-4f4f-bd09-95774156b48b@linuxfoundation.org>
Date: Thu, 16 Apr 2026 15:15:30 -0600
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
 <c834846c-96d5-405c-97d9-f182b8fe1569@linuxfoundation.org>
 <a73aa838-d194-4867-86fb-42bc8d057fd9@sirena.org.uk>
 <9c9f9851-5962-4281-9f34-a1f2e012b13e@linuxfoundation.org>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <9c9f9851-5962-4281-9f34-a1f2e012b13e@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 4/16/26 09:21, Shuah Khan wrote:
> On 4/16/26 09:15, Mark Brown wrote:
>> On Thu, Apr 16, 2026 at 09:08:17AM -0600, Shuah Khan wrote:
>>> On 4/16/26 07:16, Mark Brown wrote:
>>
>>>> Sending shortly, FWIW I'm also seeing a buch of issues with:
>>
>>>> ./run_kselftest.sh: 5: ./kselftest/runner.sh: Bad substitution
>>>> ./run_kselftest.sh: 5: .: cannot open ./ktap_helpers.sh: No such file
>>
>>> I will take a look and isolate the two commits that changes
>>> run_kselftest.sh - sorry for the trouble with CI this time
>>> around.
>>
>> Pretty sure it's 2964f6b816c2 (selftests: Use ktap helpers for
>> runner.sh) - I've just put together a fix for that one, will throw it at
>> my testing and send it later today all being well.  It uses readlink -e
>> which isn't implemented by busybox.
> 
> Yes 2964f6b816c2 is my first suspect with ktap_helpers.sh no such file.
> Thank you for fixing this. That way we can patch it and not revert it.
> 

Just a quick note to say I applied all 3 patches and will send pr tomorrow.

thanks,
-- Shuah
