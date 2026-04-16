Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B40013DFC75
	for <kernelci@lists.linux.dev>; Thu, 16 Apr 2026 15:21:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776352874; cv=none; b=FGi1IFnlQVBZp/5mx51Nls50BO7IfePpLijZKWyreEA/hEawYIyI9SLji7OlJC95/71cpX1M2mo75oaMT5a5pD0oVcZnTLsqf1/aPBHwdzIxg8cK0Cb8gI0+nVXrlgNHAxFUcsSICLgwCP519lemNUGjNbQrCbm1O2J3xd/+2Kg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776352874; c=relaxed/simple;
	bh=lY8KnyEnww1BaerqB9rUeouJcntcbdG7KfY4D4jc3hQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IaQnWVB2mPN5EM3CeKMwD6awL+zDFLwg9de9Kxy7ZRwzrbWri6OQscyVpjvp9m8MV0ge0eKQ8ZEeIbxkGZnOzKg7OlDu2zAud+7OA4J2Z762OzX+ZTxtb38MFBLQKZPVKmY2tWanZ/SL83ymWf2C4D/BalLC/tJ6L22OtrhTdmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=LGssLLo1; arc=none smtp.client-ip=209.85.210.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="LGssLLo1"
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-7d9b21d1461so800444a34.1
        for <kernelci@lists.linux.dev>; Thu, 16 Apr 2026 08:21:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1776352872; x=1776957672; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7ED7Dtk/V7JNqL6bwm+6sfQAnzfjIa9OPc/3hBimeik=;
        b=LGssLLo1YEpdfMsKPeCnu87adgFDsdhEHfUGYRX3jHTr91FDxMEutBwdcpiAaxke3J
         ibQkFzX4IuQZbDeXIT4HghPSExK1gBZzJKFRJr8c3o/jW8VFxlY1ToMaTUkN6BO+/DYh
         5FVyIpYQGW2pJy7PrLfp5reJJtAwa3hULCgP0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776352872; x=1776957672;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7ED7Dtk/V7JNqL6bwm+6sfQAnzfjIa9OPc/3hBimeik=;
        b=e5eq9q1bxsX1EywDnYwojfmTSbaapXbZownbsRzmiA68PqKdqn5eNtWkg/vCIc4iTy
         4KMjdhlLN89NEpqrXYlQiyPOKxYvOjDHxZdBcpCemS18twP9njHkJj0sir0ZaGKPOKUk
         sJHOT/Brl3khzaL97Hb6KsTs0H4fipWLfNhH9bIpjzVxlWHo5iu6slRa95uVwyxeIIz4
         N3TuWPe79oEybipnVqtYVut/o/yvfPGudv304NWOjKJV/Xc4WiWg23R0UyZJqbD4pfzp
         LGy7FUZzfr87PbJJgTWFRMKxae6EOdpx8VAQBZ7Ch5yC7Ob0QrrqOQhqYkoTpEiqYYW7
         nZfw==
X-Forwarded-Encrypted: i=1; AFNElJ9J6b2VvC1al4RMf2Py2RLzVsG/FXnQZjKsbDyQFKoijYogV6OWesD+whFycJQPGhM+h/+Qk8BLiA==@lists.linux.dev
X-Gm-Message-State: AOJu0YyDMjPO/Sz5Ik3lBtf4C7JJIQW9qh/iHkN701f7wgqFjeOVHA0X
	/DYLbaYhH/4tJhEs/kgK6OPm+Kj8VjxORyiRnfNioJg8lIl2GJcuyeZ192nJT1eNMmg=
X-Gm-Gg: AeBDieuP9sOsuK1gm4b0cis3mTxOIr8ehJgU2OSVbY6dd1edt0UefGB/b++5hWST4aV
	sEiTS8gh0XZdGz9ZaTQK15kmzAWVOO4Ke1Mz32zWIWvbLM6vdSexi3XejBIFJTdCiQEt01M/U3G
	HK5iE6SLHRzI5UAJ/hIw/Zczj4pCsO53L/NfgIljuOLtydZO8k3NR32yFm1ZOd2a8GjMd/ndC7V
	0112xYXBnsDRkNMXk5NEmTpxGD0joiqTNFz2eNt/3me9hStjE8m806rK0H5LQXr3WzQXebJe5G1
	e6tt4dbxmC2/rDCORe9kAcVLWovxr0NIoDpbuVzj8Ia6IYhTjDuXUM2UE3y6+DakVPFjvw6GJtO
	hAt2Gu+lVpy7xKFQiYny7dkeonYWhR+Tl8pqQ/+VwhC0C8cPU5cosBB/Ni3ZOmm4JLMa2qt3SFx
	2i5aagD057eZTkPYtm41LSmoFta8yLhnc=
X-Received: by 2002:a4a:e39a:0:b0:67b:b738:59b4 with SMTP id 006d021491bc7-694249766b9mr1880122eaf.32.1776352871649;
        Thu, 16 Apr 2026 08:21:11 -0700 (PDT)
Received: from [192.168.1.14] ([38.15.57.99])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-42689699dc8sm4149132fac.14.2026.04.16.08.21.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Apr 2026 08:21:11 -0700 (PDT)
Message-ID: <9c9f9851-5962-4281-9f34-a1f2e012b13e@linuxfoundation.org>
Date: Thu, 16 Apr 2026 09:21:10 -0600
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
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <a73aa838-d194-4867-86fb-42bc8d057fd9@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/16/26 09:15, Mark Brown wrote:
> On Thu, Apr 16, 2026 at 09:08:17AM -0600, Shuah Khan wrote:
>> On 4/16/26 07:16, Mark Brown wrote:
> 
>>> Sending shortly, FWIW I'm also seeing a buch of issues with:
> 
>>> ./run_kselftest.sh: 5: ./kselftest/runner.sh: Bad substitution
>>> ./run_kselftest.sh: 5: .: cannot open ./ktap_helpers.sh: No such file
> 
>> I will take a look and isolate the two commits that changes
>> run_kselftest.sh - sorry for the trouble with CI this time
>> around.
> 
> Pretty sure it's 2964f6b816c2 (selftests: Use ktap helpers for
> runner.sh) - I've just put together a fix for that one, will throw it at
> my testing and send it later today all being well.  It uses readlink -e
> which isn't implemented by busybox.

Yes 2964f6b816c2 is my first suspect with ktap_helpers.sh no such file.
Thank you for fixing this. That way we can patch it and not revert it.

thanks,
-- SHuah
