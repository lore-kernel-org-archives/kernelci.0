Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCE9F303C8A
	for <kernelci@lists.linux.dev>; Wed, 15 Apr 2026 15:52:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776268357; cv=none; b=dymXz9K/6h+NYUp7hlxWkPxkPKOxuZIMlmCxpUl0J9wULmqzdAFcW/sMU+uSEoWZcJzX8FdAe84OL0tBtO3RdLh0AWV2B/hghGFC4M8Q/AIvCHekXcyR2Onm2bKSqqLLdFzlxJDMo7Vt+lM/7rwMydnpGz7oZqKMoRvone61fJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776268357; c=relaxed/simple;
	bh=U6e3kvNh9KQystEAl0TfrKTSNzunQsW++ByhZy3Guj8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kyWTIgVqume/9aN8wf4OwFttL7xHoEdBKHQNRZF8bCzzqE90YVPCFJZs/pB2LfCFhedhdxkO7mbcWMg6TRTm0LeQgV/qBiH2Ik1/NEcGmtiBC+JYH8H/G0DJiZBjMvcd+Zlb9J7sOa4Iab6lL97zuJoIKA7tJI1d7xUmcL/jqmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=QGauKHuI; arc=none smtp.client-ip=209.85.167.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="QGauKHuI"
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-4764484296eso4247875b6e.3
        for <kernelci@lists.linux.dev>; Wed, 15 Apr 2026 08:52:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1776268355; x=1776873155; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OyU57pKrT+E3A9527zYY3QFwxCUHqAEnIl4mnw9XKdg=;
        b=QGauKHuI3hRwJUeJ2ZXZasFonyVu4TbKuB+sa03gngY7mpud+7R+LF9irqo/Q53ktv
         aerjpbr+D2caXnZ/VnuKbbXn0qvSqJi8B6qIPF6E53TjqvJJZf+QW5KCYBZ4vJn6M8Ar
         X2n7oTL/HwSomI0mkk/Hta/AECPD0KB1EzcH0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776268355; x=1776873155;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OyU57pKrT+E3A9527zYY3QFwxCUHqAEnIl4mnw9XKdg=;
        b=PI6XS84eXSlcQP7HKCg5p0UaWztZJlxw4YPpq7HpT+E+naShCKP9jH94tPTsOSfa4q
         Vob1wibl99vfQReCZdvaWNqmINIyTauUCB8JsMfcxMbn2+lev+f/oP/fpMCgn9HPw8MF
         hsJymTR4g3Fgjn+j9K8cGIiz0TcOiJOSkZfrf2tOtlw7kXpS4JC1f4LPXYn8HYEW2Eia
         4B6tnxMuVyU9qMdmmPB07tF29dP7xF/trt3XTSGhPqdpl03uDNaP3dHWP8itHTEpaND4
         7gNbkaKS03wYxre8Jyc2G+cUkM7Jqkva9Dn8/M8scUuRlEFqVJV5uOBpxZSLHCHQH+6y
         GTTA==
X-Forwarded-Encrypted: i=1; AFNElJ9obhCEnT/RzfvHrnWrPN51JoyUWWTD+nX376yfGydize1FIb3WH8iagzkCGlzIIDbkf6LK4897PA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy1jBNcZR27DAzmNkJqKIYOc9zYnB7Ygl3nQgF1mlJLwm/+K2Qq
	fWANcNCxvregqxPZhAcyPUufDEQGEj73up/+/QtcaqD5ygkUsgFmtISpUGzvw74PpR0=
X-Gm-Gg: AeBDietJrqz/4fmdjMUjyjPuoqbA3YrZ4FAHTnL8sFKEbU7uIlfQu5fF6aBV8JLcbSp
	XSeP042UmaIsqKLkhmSSbCoJVCkPqvTLvRY65B9gu7vQhJORDUa3l20knUPX7rCnNwMUS2gaiS4
	Lo/RX42oBvC3WHAQLdJoIBmcoPSAxQKHdqBZs5LFbt+3YQHPAnvFhewLi9QbhlCmM6KJBfA7uv9
	CByLu8FQVCSt4KvqyQJcO1qy6FeaRRlIjxy8qAYZdDPzUcjYsAr29LeSZFY9ko+xj7QV3g+Il7B
	c8+dxB1WD9bJsU7IpNxRyMrtAwp8BiovIOr05Q9OHI8X6Ktyf4sv/QSla1lU5P/lIgCVNlsCjQS
	A1/yMvfd9hLFZqUR/friwNJXY4cflpxmNpKCGaOphL5RHhPenICkskp5phIJriL4aJP70G/+XaG
	EQKb1d3QTx3ahgscfPmFJnZhWMMuJpjFg=
X-Received: by 2002:a05:6808:4483:b0:46a:701:c549 with SMTP id 5614622812f47-4789c848130mr11887020b6e.3.1776268354674;
        Wed, 15 Apr 2026 08:52:34 -0700 (PDT)
Received: from [192.168.1.14] ([38.15.57.99])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4797a544fc5sm1026816b6e.17.2026.04.15.08.52.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Apr 2026 08:52:34 -0700 (PDT)
Message-ID: <b80e905d-67bf-4c52-9b61-e52f3acc5b35@linuxfoundation.org>
Date: Wed, 15 Apr 2026 09:52:32 -0600
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] selftests: Preserve subtarget failures in all/install
To: =?UTF-8?Q?Ricardo_B=2E_Marli=C3=A8re?= <rbm@suse.com>,
 Mark Brown <broonie@kernel.org>, torvalds@linux-foundation.org,
 Shuah Khan <shuah@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kbuild@vger.kernel.org, Aishwarya.TCV@arm.com,
 ben.copeland@linaro.org, kernelci@lists.linux.dev,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20260320-selftests-fixes-v1-0-79144f76be01@suse.com>
 <20260320-selftests-fixes-v1-5-79144f76be01@suse.com>
 <ad-ZdjzQZXNgkpwv@sirena.co.uk>
 <3cdf8e79-7c59-4831-9b38-e9c2cef97fe1@linuxfoundation.org>
 <DHTUDCIYT34R.3VKGNDGUUKS84@suse.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <DHTUDCIYT34R.3VKGNDGUUKS84@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 4/15/26 09:42, Ricardo B. Marlière wrote:
> On Wed Apr 15, 2026 at 12:40 PM -03, Shuah Khan wrote:
>> On 4/15/26 07:58, Mark Brown wrote:
>>> On Fri, Mar 20, 2026 at 03:29:20PM -0300, Ricardo B. Marlière wrote:
>>>> Track failures explicitly in the top-level selftests all/install loops.
>>>>
>>>> The current code multiplies `ret` by each sub-make exit status. For
>>>> example, with `TARGETS=net`, the implicit `net/lib` dependency runs after
>>>> `net`, so a failed `net` build can be followed by a successful `net/lib`
>>>> build and reset the final result to success.
>>>>
>>>> Set `ret` to 1 on any non-zero sub-make exit code and keep it sticky, so
>>>> the top-level make returns failure when any selected selftest target
>>>> fails.
>>>
>>> This patch, which is now in mainline as 7e47389142b8, is breaking a
>>> bunch of CI systems - at least KernelCI, our Arm internal CI and my
>>> personal stuff.  It causes the equivalent of FORCE_TARGETS behaviour in
>>> the top level Makefile, the prior behaviour where the exit status of the
>>> top level Makefile ignores failures from individual directories is
>>> desirable since by default we try to build almost all the selftests but
>>> between quality issues and build time dependencies it's very common for
>>> at least one of them to fail.  With this commit unless the user has
>>> configured a more restricted set of selftests it would be surprising if
>>> we manage to get a successful build and install.
>>>
>>> As well as being a poor default due to the very high likelyhood of build
>>> failures this also has the undesirable effect of causing a build failure
>>> in one selftest to cause the whole install target to fail, meaning that
>>> the build failure is escallated to a complete lost of coverge for all
>>> selftests in common CI usage.
>>>
>>> This wasn't showing up in my -next build tests since I set FORCE_TARGETS
>>> and explicitly choose a restricted set of kselftests which actually
>>> build with my system and configuration.  It was less obvious than it
>>> should have been with the other systems since they did not expect there
>>> to be a complete failure to generate a kselftest tarball and variously
>>> masked the error or reported it in a manner that looked like an
>>> infrastructure issue.
>>
>> I didn't see it when I did test on linux-next and my repo. I did install
>> to catch problems.
>>
>> Sorry for not catching this. We can drop this patch.
>>
>>>
>>> It would be really nice to get to the point where we can reasonably do
>>> this but we're simply not there at the current time.  At the moment if
>>> people want to see build failures reported at the top level that really
>>> needs to be opt in, we have FORCE_TARGETS for that.
>>
>> Good point - I will go look and see if we document this in kselftest doc
>> and add it.
> 
> It's not documented. It would have solved my issue, sorry for
> overlooking this!

Ricardo, Would you like to send me doc patch for this?

thanks,
-- Shuah
