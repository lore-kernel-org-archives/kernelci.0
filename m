Received: from mail-il1-f177.google.com (mail-il1-f177.google.com [209.85.166.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5288E13D509
	for <kernelci@lists.linux.dev>; Wed, 10 Jul 2024 21:49:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720648160; cv=none; b=psAPu0e9/7JExaGV7oo+5ZObhX2/kYgjMMvpMyM+a2IkYLMb79AqLn8wC5SBtFqzAAMwKmoCMRBGKsInUHuGu9V2eEsUqGODy3jAr2HZJR55DgPBrOQ43DBGo3pXNSIBrasO48beMV48/8Ts6XogLQv44uu8q9bQfk3uut1rkZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720648160; c=relaxed/simple;
	bh=brE4XTSJWhbb88xBaNooE0Ex2C70boV3laaSm4tuuVA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=a4yZZtsTBU0kPb4LSCwgf2FuCoX8jWHWUL0as7QZlijXeeE7wSYMP0KXc2AjPyIB5YutJUxat5o1TPgdxUg1Uzg0YRsrdD6wsfbV3wi7MYHNql+g+KqVDkjY5fTgXITvqdm0TpYBLwxnHfh7m1KfvKWcTS2u1yyW9luIXyIQsBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=NtOQJYn9; arc=none smtp.client-ip=209.85.166.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="NtOQJYn9"
Received: by mail-il1-f177.google.com with SMTP id e9e14a558f8ab-38252b3a90eso170485ab.0
        for <kernelci@lists.linux.dev>; Wed, 10 Jul 2024 14:49:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1720648157; x=1721252957; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TtSBaQwe1ySQPE3Nxg4vQj+bxphEtyrHawYS7S+O8iQ=;
        b=NtOQJYn9pH6Q12T9wDGcsBTSnHcs0IZOFQRvD6TfqpLiPcC0lgDe7ztRlPLGsPD93D
         B7p7kUFhAT4ECkez9RA8a9vZCxwrXYSVpMk0gE6Q6F4njGVslw58snZcKn/KEXAEBtLb
         KvPMsHEaNiTtaElbd8HQbBYRP6rotiUzB1w1w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720648157; x=1721252957;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TtSBaQwe1ySQPE3Nxg4vQj+bxphEtyrHawYS7S+O8iQ=;
        b=ISgydmaxvTsaAb2e7wj/8M+207Z0pW9wecn77SKbFdnXw4dLw99va7YtwkL0T12PFd
         kI3rtKFQ9Y4HZlw7OSIxV3QRD/4UNDD5lbMSA63k4ggJtUV/xj6k9YDvr/bItCacaqzl
         57XE/s9gHv4y/uylOSDpbu0oGmdw1PNvl6uo5X2x+5wY560Lrri6+ecX15MuLrNPcdK3
         Ipu/z80sZdc+nszkgbCjyypNG8vxK0v05lekGZ9LRa4BomOynGfLfdbeoLWvbPjtyeop
         TbNAl4bTI3uBG2jl9PEnHfXJZySQer/IS4geG8FdtZAeEjvc4eC6zy3yEnfzjG+3J93N
         k9fw==
X-Forwarded-Encrypted: i=1; AJvYcCUS5MGNR1yjHvqMTQb/z+O1G/ZYE6a/PHbm8YuoCbUcob8CecTkBvc9uOSTdHQDZchEZiZnnMm0vKOqlrKvkBSA1CCKOIBD9kk=
X-Gm-Message-State: AOJu0Yyp/qe7p20Zqv6wLkAZetGzAaaV4+MQs/kMTMYwX8pwuDf89oKN
	wPLABE5VW6/9NOuDeZqghXlQ7Jv1eFRTCrI6b8OeJOuSywxEzqXa1JcbEFNl0hs=
X-Google-Smtp-Source: AGHT+IEFRDfD1vEXZq26Y1M1yoffjEsK1KsWIIpjMxCah/7ryd/I5EyLoysc8wgc41iMeh+sQYyfyA==
X-Received: by 2002:a05:6e02:eea:b0:378:cf86:357b with SMTP id e9e14a558f8ab-38d19c2c612mr7398515ab.3.1720648157443;
        Wed, 10 Jul 2024 14:49:17 -0700 (PDT)
Received: from [192.168.1.128] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-38a4907578bsm11992935ab.11.2024.07.10.14.49.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jul 2024 14:49:16 -0700 (PDT)
Message-ID: <71c479fb-cd25-45ec-8dd3-0521ef951f58@linuxfoundation.org>
Date: Wed, 10 Jul 2024 15:49:15 -0600
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
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <2024071003-islamist-expediter-a22c@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 7/10/24 07:11, Greg Kroah-Hartman wrote:
> On Fri, Jul 05, 2024 at 07:29:53PM -0400, Nícolas F. R. A. Prado wrote:
>> Log errors are the most widely used mechanism for reporting issues in
>> the kernel. When an error is logged using the device helpers, eg
>> dev_err(), it gets metadata attached that identifies the subsystem and
>> device where the message is coming from. This series makes use of that
>> metadata in a new test to report which devices logged errors.
>>
>> The first two patches move a test and a helper script to keep things
>> organized before this new test is added in the third patch.
>>
>> It is expected that there might be many false-positive error messages
>> throughout the drivers code which will be reported by this test. By
>> having this test in the first place and working through the results we
>> can address those occurrences by adjusting the loglevel of the messages
>> that turn out to not be real errors that require the user's attention.
>> It will also motivate additional error messages to be introduced in the
>> code to detect real errors where they turn out to be missing, since
>> it will be possible to detect said issues automatically.
>>
>> As an example, below you can see the test result for
>> mt8192-asurada-spherion. The single standing issue has been investigated
>> and will be addressed in an EC firmware update [1]:
>>
>> TAP version 13
>> 1..1
>>   power_supply sbs-8-000b: driver failed to report `time_to_empty_now' property: -5
>>   power_supply sbs-8-000b: driver failed to report `time_to_empty_now' property: -5
>>   power_supply sbs-8-000b: driver failed to report `time_to_empty_now' property: -5
>>   power_supply sbs-8-000b: driver failed to report `time_to_empty_now' property: -5
>>   power_supply sbs-8-000b: driver failed to report `time_to_empty_now' property: -5
>>   power_supply sbs-8-000b: driver failed to report `time_to_empty_now' property: -5
>>   power_supply sbs-8-000b: driver failed to report `time_to_empty_now' property: -5
>>   power_supply sbs-8-000b: driver failed to report `time_to_empty_now' property: -5
>>   power_supply sbs-8-000b: driver failed to report `time_to_empty_now' property: -5
>>   power_supply sbs-8-000b: driver failed to report `time_to_empty_now' property: -5
>>   power_supply sbs-8-000b: driver failed to report `time_to_empty_now' property: -5
>>   power_supply sbs-8-000b: driver failed to report `time_to_empty_now' property: -5
>>   power_supply sbs-8-000b: driver failed to report `model_name' property: -6
>>   power_supply sbs-8-000b: driver failed to report `time_to_empty_now' property: -5
>>   power_supply sbs-8-000b: driver failed to report `energy_full_design' property: -6
>>   power_supply sbs-8-000b: driver failed to report `time_to_empty_now' property: -5
>>   power_supply sbs-8-000b: driver failed to report `time_to_empty_now' property: -5
>>   power_supply sbs-8-000b: driver failed to report `time_to_empty_now' property: -5
>>   power_supply sbs-8-000b: driver failed to report `time_to_empty_now' property: -5
>>   power_supply sbs-8-000b: driver failed to report `time_to_empty_now' property: -5
>> not ok 1 +power_supply:sbs-8-000b
>>   Totals: pass:0 fail:1 xfail:0 xpass:0 skip:0 error:0
>>
>> [1] https://lore.kernel.org/all/cf4d8131-4b63-4c7a-9f27-5a0847c656c4@notapiano
>>
>> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> 
> Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

Is this dependent on a linux-next?

Didn't apply to linux-kselftest next.

thanks,
-- Shuah

