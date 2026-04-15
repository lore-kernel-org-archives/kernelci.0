Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ED463D8125
	for <kernelci@lists.linux.dev>; Wed, 15 Apr 2026 16:39:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776271190; cv=none; b=jZhmP2dFK8ALmwy9vDTSt+9FhvLMX0Rfo4WVLXFTWI9UkLBTz6WVVS3ClXU7FFYayJXLHopsCwDRkQFDEt3DO8OHyyR9VTz2Tash+gDdiCyAorZE8B9mZR/DiO3/iwRJSSdR2MSZmieKSgv2CMHBRXl/ALQx0e2JmTLgchnBUyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776271190; c=relaxed/simple;
	bh=f0Xhz36jloHzjGryaVb2w/X3cuD5tHkh/y9qkWJJBQE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cSmB/cQBkgnB4Stb/59hmozZo6oTPUpxZjDpRM2sBGAOwL7q8+tAIQYoNxIHfQMoFwUf9beJsp219SbtBXELg7VHTIwzYI89CyaV6dwEuw2/zc/cV4s4fOkfF5VcA5nw3kWv4iZgJkkahy5LcL9VusJ2AdMaVzKuOgg8qrP6xlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Ii8rHABa; arc=none smtp.client-ip=209.85.210.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Ii8rHABa"
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-7dbd23bc684so4090994a34.2
        for <kernelci@lists.linux.dev>; Wed, 15 Apr 2026 09:39:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1776271188; x=1776875988; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sI6SnmW4yH3OEitrbAs93gP+SdSOTHdc6LjUpuJ7Fnw=;
        b=Ii8rHABalQXeGoor2TzLuYrRUba/ULxdO7MtR62JZ7MSJSeG02LLkEN1km6iasAtcS
         nyplSxg9DKEMyt0aTgWaVVRABnSPrKKtyZHD7il6orkiK3Pq7YUZswatghMpQKXVsSg2
         sJ9NZ6nvN+kjGwciSFOuevIHS/zICx42YTQpU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776271188; x=1776875988;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sI6SnmW4yH3OEitrbAs93gP+SdSOTHdc6LjUpuJ7Fnw=;
        b=j4aNDn0I+XbJ31Ucx266PHBu7JFpLlVfiXDj7MvBU7745uuaD4+AyPZHPF1dawxjdH
         zHN1j+5w/y5hT7HwxNclZSDXArsbXNqWjeOrFWLxYEensNiZVTOZEjGMAo3oy6U/jCeO
         26BFZh8IZcc3ry9IfyLdyTxplr1+Prd42nn21D6UyVcSDis08j09W2gaViLDMfyI4BwR
         1ZHQqjiw8R4zu0aWSlfQAtiZQ6BM7pMxO5kpOgAgvI5VjB4cmkBx2GqE1X9z0NcAncmD
         Glc4W6t2ajaix/+ztJa9A/hU+IEPwNP5eju0lq7TnAHvwu0AySbNKNC3uudxoh7P4REc
         hB1w==
X-Forwarded-Encrypted: i=1; AFNElJ8fDCf7cjTWD8k/bzLgyPB0XxVx3TclHgu9uXDedPMQapER4R5nlkFku57nqY5QnxS7KLhQ7RHe6Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YwdVMuGsUDeAHvaSJbwy5T4a+TN7PfoBpGXtX1IpTiKQ13fR8S2
	msHl1YpEuHkgEQ0ZGEyB35sUDkRL+fK1JXqj+vZGM1pgQ9EfUvEBTF4qYjQeP/HgJgU=
X-Gm-Gg: AeBDiesU57ujTmztKmJQbmZQL2Wo/c6uyRmN6xOGSZLSIup6284GWfOl2d/1YlYQZUx
	gYGRnaz8dq4wKOMGJfGEQ7IIIKGcSStLd3L/3MiNW/I2yMv3QcjiTfb2PBNkLmpXPHi2UJlN+RW
	RUQqaKRuLY6C0TBLjo4CxjyJwJqPX8Z00bKLIhjGRPrCeqgKnU7+LvFYLbUMDCkA3rqOqbq5vCy
	CyHByNTV2hAElhi/LoTRbfhU4G8+F0bu+uF4PqtEN8wuN7/mdePrscI/lzsdMW5GJtS0Bd4dkRZ
	vntBXPgBYXTK7troWBMx9pSpd/0JSA7ZLLJbwjrsjH/EgMsAAZgpmesY4VMLrbWHXfgqbX7ch/u
	u03i4zEhbqeMGFXb5psteV9a66HkZEmbMo2mULNHHVmuFjHADlMTtyzR5cx85x7M8Evsn08aOxj
	RxYpBrLAfHgjjyoYwcBfipbxJCBpfFdFI=
X-Received: by 2002:a05:6830:61c1:b0:7d7:4a7d:fd40 with SMTP id 46e09a7af769-7dc27f23b8cmr12850964a34.22.1776271188347;
        Wed, 15 Apr 2026 09:39:48 -0700 (PDT)
Received: from [192.168.1.14] ([38.15.57.99])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7dc76b2dd7dsm1541449a34.17.2026.04.15.09.39.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Apr 2026 09:39:47 -0700 (PDT)
Message-ID: <b35bc514-5def-4e0c-9260-79bb2ae9da94@linuxfoundation.org>
Date: Wed, 15 Apr 2026 10:39:46 -0600
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
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <ad-8BIkw_ijCLqcF@sirena.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/15/26 10:25, Mark Brown wrote:
> On Wed, Apr 15, 2026 at 09:40:37AM -0600, Shuah Khan wrote:
>> On 4/15/26 07:58, Mark Brown wrote:
> 
>>> This wasn't showing up in my -next build tests since I set FORCE_TARGETS
>>> and explicitly choose a restricted set of kselftests which actually
>>> build with my system and configuration.  It was less obvious than it
>>> should have been with the other systems since they did not expect there
>>> to be a complete failure to generate a kselftest tarball and variously
>>> masked the error or reported it in a manner that looked like an
>>> infrastructure issue.
> 
>> I didn't see it when I did test on linux-next and my repo. I did install
>> to catch problems.
> 
>> Sorry for not catching this. We can drop this patch.
> 
> Yeah, it's easy to miss if you're set up to build everything.
> 
>> Mark, would you like to a revert for this?
> 
> Yes, I'll massage the text from my report into a changelog send
> something - it'll probably be tomorrow now.

Thank you Mark

-- Shuah
