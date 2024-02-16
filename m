Received: from mail-il1-f182.google.com (mail-il1-f182.google.com [209.85.166.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B775A12FF60
	for <kernelci@lists.linux.dev>; Fri, 16 Feb 2024 20:22:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708114929; cv=none; b=oHvjxssxQ1+aVJDspbzhJMDNREhZEAGLqs9+79IaOVDWBGUMgGpU2vGY/Ut2NYN3LqnQ1/PkZmkmaS2EaSIP5+0JOZRSIhSfHzjjTbI2ztBG2qYftpsr+DnE2Op83kTv9pgEtUcF6uuvYo73vCD2Z5y18FathH3LMojYuevQYkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708114929; c=relaxed/simple;
	bh=hOwLSnzVFDPJu8ihd6kv2D9PXkJD6Kw4XeoYyHOrVeI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uKqAl1456srieAYnLHi8a+P9Dc+//bWRT+oCJooDbmyDtvq/pjeM7s77ACO+9UGaoGcWo8RmHQI/LsYZHiBtbMtWdglBbugdLBNsoQM/ATBcWRqyBQY0nFCaauM2PxTd4XTuICy7RWb+mirgrltRDELN98DlWdEn3fnuvYMT1ZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=N+qVnugN; arc=none smtp.client-ip=209.85.166.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="N+qVnugN"
Received: by mail-il1-f182.google.com with SMTP id e9e14a558f8ab-363acc3bbd8so1280455ab.1
        for <kernelci@lists.linux.dev>; Fri, 16 Feb 2024 12:22:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1708114927; x=1708719727; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pj5YjHydwW9Z6nyunqyPtZAEHmixxC0P+iIphytMKn0=;
        b=N+qVnugNf0tXzOtgp+b2id2SLoO0NINn87kgeOeJkMsXZoxpm/Sp55ICXXp2FNkd8y
         BQZ1x51lQ2GB3HEToKsy8nUVlKo0V7DtsvKMSHrjc8n2aG6JiiOqG5zOtcQfRdHcyLA7
         HDf7uqnaK+I7vMf0mr7XPhi5V0cpV6PVrrWrU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708114927; x=1708719727;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pj5YjHydwW9Z6nyunqyPtZAEHmixxC0P+iIphytMKn0=;
        b=eERaA44Sir340IYTgT1GwuDAG/8uGppSMsohSPUQVkmNKFcCeGGIv6i5uG8hVBdbRW
         4tRb3MlSczoErAvI6Q3AqrYnXkQdV5+Z/FyQ/By3EApPrm9StvLKnc0wuEJrG+9nd4hz
         Syu2lE1cy3Ds3BRo8Cx1+dP0tdIeZgeAixTz0bIlfm9fWuzYsp22OMQdbc7715EDTgXG
         dHTyR9X0NEHNKLlPUJdD0Sva9CAtwOMVHrqyjqChfOdpl+G44qdf8DdGATD7rEryc6d3
         3jepPtXn2ZXYW+TUP+cdxhefpYJJDYzO6VcLcPHqb/582qN+eA8GqTDWcsX4uYjKcYrs
         pZIQ==
X-Forwarded-Encrypted: i=1; AJvYcCXvO2cYVZf7dBzDyAejtY56gHXn2sRyVkUbZHPcrhfSkfBxwmB+RS17BPuPewWYqweCMSCeVtybxJ8PbUwyOHyipoz0NLCq9Iw=
X-Gm-Message-State: AOJu0YxXDGYsubzgXsem2gfzCwKqyi7NIADNbGS7zYVdKJ1vf7WLYohh
	oZDI9mpv4ZvlTpk9STn8MwD/LPjSV/bgtZ6MtZG3ChpAakRmSEh1jH3UF56Kvuc=
X-Google-Smtp-Source: AGHT+IFDb4w0dY1CP3UN5YML/gFRfdytlrVDqWZL9IUdLXZAhSnel+wVYDWEMsvMxKeEthM9/lPoxg==
X-Received: by 2002:a05:6602:2350:b0:7c4:4d50:29 with SMTP id r16-20020a056602235000b007c44d500029mr3236118iot.2.1708114926836;
        Fri, 16 Feb 2024 12:22:06 -0800 (PST)
Received: from [192.168.1.128] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id fh38-20020a05663862a600b0047148f44e27sm150294jab.2.2024.02.16.12.22.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Feb 2024 12:22:06 -0800 (PST)
Message-ID: <6beafef0-60cf-4ab6-b4dc-500ae30c461b@linuxfoundation.org>
Date: Fri, 16 Feb 2024 13:22:06 -0700
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Shuah Khan - Self nomination for KernelCI TSC Chair
Content-Language: en-US
To: Guillaume Tucker <gtucker@gtucker.io>,
 "kernelci@lists.linux.dev" <kernelci@lists.linux.dev>
Cc: kernelci-members@groups.io, kernelci-tsc@groups.io,
 shuah <shuah@kernel.org>, Shuah Khan <skhan@linuxfoundation.org>
References: <db438c3b-05d3-4c9c-9730-b99fec6b2ccf@linuxfoundation.org>
 <5a96f289-c882-4bb9-b274-7a25c0036c5d@gtucker.io>
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <5a96f289-c882-4bb9-b274-7a25c0036c5d@gtucker.io>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/16/24 12:53, Guillaume Tucker wrote:
> Hi Shuah,
> 
> On 15/02/2024 01:04, Shuah Khan wrote:
>> I would like to submit my nomination for KernelCI TSC Chair.
> 
> Let me join others and thank you once again for nominating
> yourself.  The handover process is not complete yet but I must
> say this comes with a degree of relief on my last week as Chair.
> 

Glad to hear it. It is hard to handover a project.

> I trust the current TSC and everyone involved are now all set to
> answer any queries you may have and help onboard you should you
> be elected.  Please also do not hesitate to reach out to me
> directly if there's anything in particular I can help with.
> 

Sounds good to me. Thank you. I will take you up on your offer
to reach out for help.

thanks,
-- Shuah

