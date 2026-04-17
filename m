Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51E5135C1AE
	for <kernelci@lists.linux.dev>; Fri, 17 Apr 2026 17:27:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776446851; cv=none; b=Qay8YvRw6NSj8AIdRyI8v3ENYNVDAbJgae/LRS4RfwQKXXqyQbNTIWjQGrNzFNUHR7Lx9+LaEgyf4cEVUSSMl+nNOg7zULuHOgw9nyJ1DUuQWF9rps4tr+eMziMmJVIYhpdWuO7hKb+cbH3sybjLmi9CqRfbNpX3RfIlCP7J02o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776446851; c=relaxed/simple;
	bh=7Y+D6KqcYE9lTP7zS5oHeHLOKpJ4jNFqhuy0hQB9z9g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KLAmS3IZM5mFalOXjuX4kJ3YI0TG+DOlhaxxb4ZLLG3RsVFflnhBqSDeLz+Uyhb19WFFoiy9yqM0htEbURYQU6ZB5XSsg0bFtaGJCua4fGprkwDZet50+wbtlDTfh9MBd1lxxlDra4MwjJntZmo74ro3BBGv1xRNZxYnomra9x4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=JGMqecV8; arc=none smtp.client-ip=209.85.210.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="JGMqecV8"
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-7dbff06e4a6so933977a34.1
        for <kernelci@lists.linux.dev>; Fri, 17 Apr 2026 10:27:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1776446845; x=1777051645; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GLn+P2ktPPdEjm49mYZXWZCPIYGUflvOd0GJ7r0DE78=;
        b=JGMqecV8CMwjh5nTYIu/P8i39nvNqKhmjO5rubwjfzEthQS4v6qeVbFJetd+mSOZCX
         sVdtvrZGr+B81x1YQ4GVryhFsIXche6IedgYxeHD8LbkQENcD70K1CCgq9WKBfx26QbJ
         Kqjx2CNnA3N6O46AsslBUDmVT5DksEcKKT1Go=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776446845; x=1777051645;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GLn+P2ktPPdEjm49mYZXWZCPIYGUflvOd0GJ7r0DE78=;
        b=dAd0aAV/t4wroTlzD8A3kV//gFL8AEvevJ2TeGa8kH8SvB7RUrOmX7lEgtuorou2lz
         CWn80xrpjtgqeNK+YQOx2VVTqjOqyJF+2lIl/pAWuMtYJ6OZ3pUjmhh6a1+gHHAH76Xi
         B1et9cfQV8ZuEbBK8Qo//3WHU5kmV172BCAueNNMv8EjJ4Yld+93A42SD/08hX1V8xwe
         BVPPPtNFyK20KlwHh310OoDIR/8y/HUy6qgPwEYFD9w13d79LWP6T+dG8yAjEChZ72wb
         1Crnjv3k/WFF6SdcT0DVoQaJtzMmhfG/hT12v+/I2qc1GxRNFt20zzrMpyts2a24Ko6M
         d57Q==
X-Forwarded-Encrypted: i=1; AFNElJ9m7nRTNwFls6MqLoVnp/0fHhOCAfiW/ROiOeNPO78eqRnliqXLseqd+mT64TRt9AgrwxKYxUlWTA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzPs13UnOfBfYFtDLvPqploNypShI7s1lBm75A8c6guaEeFfnvZ
	TbpzM8r2k8xmy5QCmqw8SURMKB6AL61nZ/xcwtO+8jEZeYwsj17XAnGPQWaL39F6FjI=
X-Gm-Gg: AeBDiesoo7+aEYMI+3MsTwlqFSy967T++VkJwTahs/cstGAk+TkZsRZrH8aW4lh1TGx
	DQLB4UUaEWNj0nW00G3rCQwhrL/stCFOGg1rakDMvdxRIDNuGqjr99zomqWWSEvw1Zt+k9sdMSA
	5N732DyT/Uu3qOPggbjoFipcIWBCYBXnCHcCCvbIUfwk4SzwcAPeQBRacjg8K+QheazJOogdICi
	odDQLpkETfEfimRbsUs2cVLrNQTWiX6eWXsApJeW1CmKbmb3gKT6V25qm5X4cWdqfkf8taN87wN
	BQWORhct4pLUHAFN2Mud4raua7CZHvl2TJKN/Z7qvJxp12DdbSky6yZCLUXRA3PClguP7Dcek/g
	IfBXlCE1a2xEQ83om7Bx+MuR5EtXmbo855eX2QZUzArfdSsDc82L9ZaQuFQrzIxnyoiecbtnM9l
	T4ORGosWSxgi/BL5FjlA4QKdhyUMUR6lww7oAwTVg2uA==
X-Received: by 2002:a05:6830:348c:b0:7d7:cc53:c457 with SMTP id 46e09a7af769-7dc951e22b1mr2523842a34.17.1776446844974;
        Fri, 17 Apr 2026 10:27:24 -0700 (PDT)
Received: from [192.168.1.14] ([38.15.57.99])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7dc975b06d2sm1585184a34.23.2026.04.17.10.27.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Apr 2026 10:27:23 -0700 (PDT)
Message-ID: <edded65a-633e-4891-b4b2-cd85aea20f66@linuxfoundation.org>
Date: Fri, 17 Apr 2026 11:27:22 -0600
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
 <0420ebf1-2598-4f4f-bd09-95774156b48b@linuxfoundation.org>
 <e54a02b1-dd0b-4dd4-93aa-0484bb2cd8fe@sirena.org.uk>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <e54a02b1-dd0b-4dd4-93aa-0484bb2cd8fe@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/17/26 07:30, Mark Brown wrote:
> On Thu, Apr 16, 2026 at 03:15:30PM -0600, Shuah Khan wrote:
> 
>> Just a quick note to say I applied all 3 patches and will send pr tomorrow.
> 
> Confirmed that everything seems to be running fine in -next for me.  I
> am seeing the test number duplicated in the log messages from the
> wrapper:
> 
>    ok 59 59 selftests: arm64: syscall-abi
> 
> which is confusing my parser a little but is less of an emergency, I'll
> take a look.

Just about to send pr when I noticed your patch to fix the above.
I applied it to linux-kselftest next and will send a combined pr
with all 4 patches tomorrow.

Thanks for fixing these regressions.

thanks,
-- Shuah
