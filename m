Received: from mail-io1-f48.google.com (mail-io1-f48.google.com [209.85.166.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69FCE450FA
	for <kernelci@lists.linux.dev>; Thu, 11 Jul 2024 19:53:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720727622; cv=none; b=m6fSUR4thrQHR1L1W4tEjyjn+GlECMJGSmTAYDrdGdBKwnvxyigLoxblVZA6WDj/GDlXM3rYOWwNA5daA/NaWTOblDE+jECQDfWlej0TQpUXP8HTLKqrxbpIHcOcn4UuHBw//c9dh0QnXKFLZe2CaYTw36FlLEHwhet4XrUUIVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720727622; c=relaxed/simple;
	bh=AQRPgY7Ta8/25Ij5rCjtyYOD71SttvMXsarPss3wXYw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OWgW356q2VGHDayKwH+QxhmewMVbUaH6bKdP81M0lBcx8aznMwWjUV67JDAnhHdjSELPwm8oSeS/A1TImjp57ytiU2kWChJC7KhtsVeRkSD/j11vMPR6HSlpLXUms/bc4kyl6hK8j4zVXzp0f2d4luicMjku7nUJQdTVkdzAQD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=g5XoArru; arc=none smtp.client-ip=209.85.166.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="g5XoArru"
Received: by mail-io1-f48.google.com with SMTP id ca18e2360f4ac-7f906800b4cso6273439f.3
        for <kernelci@lists.linux.dev>; Thu, 11 Jul 2024 12:53:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1720727618; x=1721332418; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=h7yeQY6SPtfR9A82LK11qYfHKg0VfLZL3MuMX9OJe1U=;
        b=g5XoArrueOdw48UVYQF0NRNsGyYFHftd4ATdVrVHZvpZSj/Z0JepcdyQH+WGP8q2xk
         9nulrLMVo9lSg4j+tzwnqz7zplTkerDXDtNAoyZTxqC8mHdb3X/9Pc6eCE7QIln8aB6x
         ReYzKnXHsByAKW1R/okz++P/DSmJHkqtC7Agc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720727618; x=1721332418;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=h7yeQY6SPtfR9A82LK11qYfHKg0VfLZL3MuMX9OJe1U=;
        b=NNDsvNZzFAOCloBIsYRBXI+BIaOxtmPtTjMuHQtZT9mOqStgnYhbhEVO2hE4A9L4FN
         Zb61vd8z0Ot+W+im80CX/sAUAMcfswoS3lDXXGaA17X5HCj5Fvv9RWTKO96PtFGQVmvv
         fI5hs9fFWqTlqhcSNzRZmBcxra/r/hf8dYLcTbHDtQWV6o330EaKog5t++yAB0tOvTf2
         sgQtCKMU6NKw7vFm16+vaxHGK8LL00+8JOyeBJUyYauKxhIacQ65VA8g5G3jYm15EKz/
         QJPwdNx9OjAJMqmiItwZykfEOz2AErApCkxyONNWtyezhLEeIxK9e6cK+OjKPkJiPMyJ
         phFw==
X-Forwarded-Encrypted: i=1; AJvYcCVjb+U9VnG8mdHlIVA7pN3zFeuKZ8vgYE0Uz3YcO8nmYS2y7ex1/7QHsTVVOdTMDtljWA9EY1jcA2gAbiGD5/eTwFhAxFtoKgs=
X-Gm-Message-State: AOJu0YysmCx5cxtiRTsnnCj9bb1VUFZtMVrVckD4vAcs2zq/X5Rc8KAH
	MHwagugpPqaxb2vzTHPsGOXx3TE2d7YdJH3kT15mfjBUGywqQFJy9Eo6vtd5AZI=
X-Google-Smtp-Source: AGHT+IFrG6tcF3V+I0JwNgxdIK+071GY/2J/P0ieFHoPCC6LxFJ7MDumSBYvlTHYtzu5FY4n8WO7Ag==
X-Received: by 2002:a5d:9c12:0:b0:7f9:3fd9:cbd with SMTP id ca18e2360f4ac-7fff92c5c33mr837862539f.0.1720727618527;
        Thu, 11 Jul 2024 12:53:38 -0700 (PDT)
Received: from [192.168.1.128] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4c0b1c2b576sm1991316173.177.2024.07.11.12.53.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jul 2024 12:53:38 -0700 (PDT)
Message-ID: <e1e32c72-6bd3-4c15-b301-c5670690ba99@linuxfoundation.org>
Date: Thu, 11 Jul 2024 13:53:37 -0600
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/3] kselftest: Add test to report device log errors
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>
Cc: Shuah Khan <shuah@kernel.org>, kernel@collabora.com,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
 kernelci@lists.linux.dev, Shuah Khan <skhan@linuxfoundation.org>
References: <20240705-dev-err-log-selftest-v2-0-163b9cd7b3c1@collabora.com>
 <2024071003-islamist-expediter-a22c@gregkh>
 <71c479fb-cd25-45ec-8dd3-0521ef951f58@linuxfoundation.org>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <71c479fb-cd25-45ec-8dd3-0521ef951f58@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 7/10/24 15:49, Shuah Khan wrote:
> On 7/10/24 07:11, Greg Kroah-Hartman wrote:
>> On Fri, Jul 05, 2024 at 07:29:53PM -0400, Nícolas F. R. A. Prado wrote:
>>> Log errors are the most widely used mechanism for reporting issues in
>>> the kernel. When an error is logged using the device helpers, eg
>>> dev_err(), it gets metadata attached that identifies the subsystem and
>>> device where the message is coming from. This series makes use of that
>>> metadata in a new test to report which devices logged errors.
>>>
>>> The first two patches move a test and a helper script to keep things
>>> organized before this new test is added in the third patch.
>>>
>>> It is expected that there might be many false-positive error messages
>>> throughout the drivers code which will be reported by this test. By
>>> having this test in the first place and working through the results we
>>> can address those occurrences by adjusting the loglevel of the messages
>>> that turn out to not be real errors that require the user's attention.
>>> It will also motivate additional error messages to be introduced in the
>>> code to detect real errors where they turn out to be missing, since
>>> it will be possible to detect said issues automatically.
>>>
>>> As an example, below you can see the test result for
>>> mt8192-asurada-spherion. The single standing issue has been investigated
>>> and will be addressed in an EC firmware update [1]:
>>>
>>> TAP version 13
>>> 1..1
>>>   power_supply sbs-8-000b: driver failed to report `time_to_empty_now' property: -5
>>>   power_supply sbs-8-000b: driver failed to report `time_to_empty_now' property: -5
>>>   power_supply sbs-8-000b: driver failed to report `time_to_empty_now' property: -5
>>>   power_supply sbs-8-000b: driver failed to report `time_to_empty_now' property: -5
>>>   power_supply sbs-8-000b: driver failed to report `time_to_empty_now' property: -5
>>>   power_supply sbs-8-000b: driver failed to report `time_to_empty_now' property: -5
>>>   power_supply sbs-8-000b: driver failed to report `time_to_empty_now' property: -5
>>>   power_supply sbs-8-000b: driver failed to report `time_to_empty_now' property: -5
>>>   power_supply sbs-8-000b: driver failed to report `time_to_empty_now' property: -5
>>>   power_supply sbs-8-000b: driver failed to report `time_to_empty_now' property: -5
>>>   power_supply sbs-8-000b: driver failed to report `time_to_empty_now' property: -5
>>>   power_supply sbs-8-000b: driver failed to report `time_to_empty_now' property: -5
>>>   power_supply sbs-8-000b: driver failed to report `model_name' property: -6
>>>   power_supply sbs-8-000b: driver failed to report `time_to_empty_now' property: -5
>>>   power_supply sbs-8-000b: driver failed to report `energy_full_design' property: -6
>>>   power_supply sbs-8-000b: driver failed to report `time_to_empty_now' property: -5
>>>   power_supply sbs-8-000b: driver failed to report `time_to_empty_now' property: -5
>>>   power_supply sbs-8-000b: driver failed to report `time_to_empty_now' property: -5
>>>   power_supply sbs-8-000b: driver failed to report `time_to_empty_now' property: -5
>>>   power_supply sbs-8-000b: driver failed to report `time_to_empty_now' property: -5
>>> not ok 1 +power_supply:sbs-8-000b
>>>   Totals: pass:0 fail:1 xfail:0 xpass:0 skip:0 error:0
>>>
>>> [1] https://lore.kernel.org/all/cf4d8131-4b63-4c7a-9f27-5a0847c656c4@notapiano
>>>
>>> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
>>
>> Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> 
> Is this dependent on a linux-next?
> 
> Didn't apply to linux-kselftest next.
> 

I tried applying these on top of linux-kselftest next which is at
Linux 6.10-rc7 + other patches.

I am not sure what is wrong - first patch applies and the second
and third don't.

git am fails and manual patch application worked for 2/3, same thing
with 3.3 - these should apply cleanly since they don't have obvious
conflicts.

Please clean this up and send me updated series adding Greg's ack.

thanks,
-- Shuah



