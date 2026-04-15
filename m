Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78C5C3DE433
	for <kernelci@lists.linux.dev>; Wed, 15 Apr 2026 15:40:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776267642; cv=none; b=tcr7wTxnZulM25jc8w2gDvuTK9xj57dxa76z8Sm37wCsA7Vy63cYY7TKsrRMPR5vn0g4hzqkJyOTj7BXXIOENhGgY+c4yxXzr3DpIhZkMT8uiHO+LxKRJE7hGLlKySQKSVOsUXaNsdTCZYkGZylieHJWr7PyaqXwkjNRiVzy1b8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776267642; c=relaxed/simple;
	bh=peiaXFopgD2U2+byFyO3EYl1KnMQYZFQdtVvq5N8icM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FflmnAuFnkrAfOTu4Y3bOKt7HjS49hIoMifct3DHNPdvDkElrtDjb5fD0rVRJgccasALAcXWB0xb4FM9DiEeZXUqyz2VdIMOJUeGdect7sGWP6QR0siuK+EzYUKsiswOOS1UfEB8HrHj+uCjH1WmLiBMAgm4xqMSZIvZFvjWOh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=a0m/fBLw; arc=none smtp.client-ip=209.85.210.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="a0m/fBLw"
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-7d55b97f358so4162335a34.3
        for <kernelci@lists.linux.dev>; Wed, 15 Apr 2026 08:40:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1776267639; x=1776872439; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bRbU9EO4HkCghO3rFTcKaAJtXlf84b+M9U+wgEYVq24=;
        b=a0m/fBLwgFb8eAIBNd/sEmQxhn0BFQ7Yqmg81oofPvwoEknHqAr//4l9h049L0iMG7
         ZERT09ChPT9EPaFOfIom8+XuWLaYhGqpkw/NBaQpUijDxzXtoQL7ISjav9PMKCTmFGDc
         N40T4Y6Yet6IhgB4lfhu6bnJETkKKDfYA13pY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776267639; x=1776872439;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bRbU9EO4HkCghO3rFTcKaAJtXlf84b+M9U+wgEYVq24=;
        b=nJfQ0L8xIsLuqAmPMWaElFK3revWC5XVWblyyOK1qBBDYsxBBTx3y7dL5BEql9Swvq
         yKU6zWT7e+yrTw7Ej/7/Yx/LwPfnxlpsSU9w1L/EoSUnvJHN27Y8Cypu3gZNbMN+Lvr2
         3uNi1HWVW4ukfdsdbvkaraSW5c13DJUOR3IgG0jPzoWTKsqdKi8mGZjv5ZsMMbNwtg2t
         Gy4ZkmNT/bW0s5yUaZA7Zzh4Wn8TRI4h/dzxw/CZVExBSLfRBmsv2zIPT7t50QHXxAZx
         W2tsblzjABBozXpo4jsJ0DfyT3cgvElyUvru8jUYt7cFFEmC/fFG7FQYl2tXH1cS4Byf
         Ztuw==
X-Forwarded-Encrypted: i=1; AFNElJ/BNhjznYYas6TpJLpq1P2uLpQia1lFzVpyNyioe3rbjOiuHhdlPSRI08lTFIIi7+QVp2hIczKTsw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxu0bZp5c//+MwpICV2HqQjBqHrWC92iBagz1RMghoREn9Fin8y
	oOewKzL1dm15S3aW3ljGsRwEaLWdxQN7WwE/OO4VLSLfHO7KPWSwBN6VqyLuRxYbtAc=
X-Gm-Gg: AeBDiet+pHhr8QFwlUATul3g4JJZcvKS3VM6c1fZrNf9nq5nRqlXpQD+60dGt9Ldz8U
	KxemN1LJDMXangnsTEI8ZuL5IwHdzo0uWbtvTQsR3DH48LX9rCwbe8WSr6IGBpDO4ecjXtcC441
	rcs+fE5LUByrgBDeNici0nM6GSko3kkQogRq73jgSqs+SiOgXbYSaFAS8K9xcoISw80HySGw9We
	LaHIO5XD1l7lbAGBOvPFtxkN9Zs1YLph8owKD2O7i5Txs8zVT0n5ToFx0CcOcav0AzZezl2dywF
	EIIp0Z56jKzVQeY+ss1N4VmpeEGh+vZCGbpZvJgNknuQJxxAvn34fpNJrpO1IFw95HYQbDKZGJR
	pscLrfbTrHE1a2curcBc8Dl4qxF14ToDxO1wYjmEHSfqmt57FXmc13LSUFZXZZNKK8Yam3pmdi5
	qnqvLAifDkXmmyE7XMWqFDvH6TIPe/dI4=
X-Received: by 2002:a05:6830:6f85:b0:7db:b7ae:ef0b with SMTP id 46e09a7af769-7dc27e1a8fbmr12524416a34.24.1776267639310;
        Wed, 15 Apr 2026 08:40:39 -0700 (PDT)
Received: from [192.168.1.14] ([38.15.57.99])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7dc76a333e8sm1470984a34.8.2026.04.15.08.40.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Apr 2026 08:40:38 -0700 (PDT)
Message-ID: <3cdf8e79-7c59-4831-9b38-e9c2cef97fe1@linuxfoundation.org>
Date: Wed, 15 Apr 2026 09:40:37 -0600
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] selftests: Preserve subtarget failures in all/install
To: Mark Brown <broonie@kernel.org>, =?UTF-8?Q?Ricardo_B=2E_Marli=C3=A8re?=
 <rbm@suse.com>, torvalds@linux-foundation.org, Shuah Khan <shuah@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kbuild@vger.kernel.org, Aishwarya.TCV@arm.com,
 ben.copeland@linaro.org, kernelci@lists.linux.dev,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20260320-selftests-fixes-v1-0-79144f76be01@suse.com>
 <20260320-selftests-fixes-v1-5-79144f76be01@suse.com>
 <ad-ZdjzQZXNgkpwv@sirena.co.uk>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <ad-ZdjzQZXNgkpwv@sirena.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 4/15/26 07:58, Mark Brown wrote:
> On Fri, Mar 20, 2026 at 03:29:20PM -0300, Ricardo B. Marlière wrote:
>> Track failures explicitly in the top-level selftests all/install loops.
>>
>> The current code multiplies `ret` by each sub-make exit status. For
>> example, with `TARGETS=net`, the implicit `net/lib` dependency runs after
>> `net`, so a failed `net` build can be followed by a successful `net/lib`
>> build and reset the final result to success.
>>
>> Set `ret` to 1 on any non-zero sub-make exit code and keep it sticky, so
>> the top-level make returns failure when any selected selftest target
>> fails.
> 
> This patch, which is now in mainline as 7e47389142b8, is breaking a
> bunch of CI systems - at least KernelCI, our Arm internal CI and my
> personal stuff.  It causes the equivalent of FORCE_TARGETS behaviour in
> the top level Makefile, the prior behaviour where the exit status of the
> top level Makefile ignores failures from individual directories is
> desirable since by default we try to build almost all the selftests but
> between quality issues and build time dependencies it's very common for
> at least one of them to fail.  With this commit unless the user has
> configured a more restricted set of selftests it would be surprising if
> we manage to get a successful build and install.
> 
> As well as being a poor default due to the very high likelyhood of build
> failures this also has the undesirable effect of causing a build failure
> in one selftest to cause the whole install target to fail, meaning that
> the build failure is escallated to a complete lost of coverge for all
> selftests in common CI usage.
> 
> This wasn't showing up in my -next build tests since I set FORCE_TARGETS
> and explicitly choose a restricted set of kselftests which actually
> build with my system and configuration.  It was less obvious than it
> should have been with the other systems since they did not expect there
> to be a complete failure to generate a kselftest tarball and variously
> masked the error or reported it in a manner that looked like an
> infrastructure issue.

I didn't see it when I did test on linux-next and my repo. I did install
to catch problems.

Sorry for not catching this. We can drop this patch.

> 
> It would be really nice to get to the point where we can reasonably do
> this but we're simply not there at the current time.  At the moment if
> people want to see build failures reported at the top level that really
> needs to be opt in, we have FORCE_TARGETS for that.

Good point - I will go look and see if we document this in kselftest doc
and add it.

Mark, would you like to a revert for this?

thanks,
-- Shuah

