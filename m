Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E49417B3CA
	for <kernelci@lists.linux.dev>; Thu, 29 Feb 2024 11:22:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709205740; cv=none; b=g5gRM7qpNSf1ZU6iwMRb/hdqaeNt6OT+3tJUVDPQP2wszaJB/3W4KhZ7kwT7ZU4vhnHoEZX9NnPZKft6gGLSPyVRjp4L8t8O6zH+K+6/gbQHUyNXSEWxKQd+/YuRwfWmxSNbNarsRsEbQRabelB+LUZHHi4rPDCmaiHU0BReRJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709205740; c=relaxed/simple;
	bh=ooRrQfVr9PreoY33xFWg6TmzCLeY2uu5mZACXstZjiM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CaLrvCNg8uIubLAFucNoaPDORVVBiS5nBN2TQ+gagltGZGm4J3amQJbloHCFvg30MXoVHcwKwR95ZYA0GDvwVkKWazyM5XdM/44aZBUTWeyIWrmtRO0iEgqnWHJC7DRapxWpKd+qO62LClEN3Hurd/5QWCwR2L7pcJzoGvRhxu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aJYRtUV6; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aJYRtUV6"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-512e4f4e463so644404e87.1
        for <kernelci@lists.linux.dev>; Thu, 29 Feb 2024 03:22:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709205737; x=1709810537; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DCYVJOxva7cbL0S0SVuUSyy8FG+Nl+cI8gxD3kxwuN8=;
        b=aJYRtUV6j9I2QI0uBlmcibRJONiB0XfVwsSTg8fZxvXlMZ59uvG/pBl3KbWhbdMoXf
         0xLgrKjBoXx/4ygWN0lHlzDc+9mdO374mTGXyju7yg02uMNvpZqAuPtC2Zy3r8Gj90U3
         rYFTx6S0Ep0/wi4+j+JjBnPMu1ufaiJ5keB+zGhyx9HurDm8k3Y4J6v+D2LqYGZz3B1W
         168E4Uwp70uTJA/27YwqdQKauHhnY/+Hx9zuTiRSgR5gfw3vI9tZ0U5TF1YTfXVOLNry
         hVTEMBtzuMnk+QYDvNSkQnPMu9f5HBfuHgEzLF4WhTPuqmnyhq7xttqZcEFTvluirlQ/
         CU7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709205737; x=1709810537;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DCYVJOxva7cbL0S0SVuUSyy8FG+Nl+cI8gxD3kxwuN8=;
        b=HEQiD6TUiLylTS015NGUXaoYgTs5H/Ubk4Koxzm9FLfDxbdTkTW38dSl9mbFwL2W03
         JSlirbz+/a1ckHSd9MKPgUbqmte4zjo88mLaRITYxZv1nPIHJ3XytfQ6TeOZIVHmXeHm
         iEavSh3/TAP2dKK/CRprb0aeUVTJDF1QAa04BaPoiQ79LiNJsNdtJGeAtQgtH5Z/P7+v
         BTJBePlnvLqrbbm6/lAIk/720wh2NswzrezOBrg2i83AEpTvyH7Mrmgmis5MkIBN0jP1
         5MVDntIXFLGrDeWkOlxzCln+Ndl0IkpYdteXlbuV9Tty7tRWFJAHhHO9tP6Xa7HicH9b
         EIcg==
X-Forwarded-Encrypted: i=1; AJvYcCVVZH++dzXtawLrBlZiO93KSSnh8Bc1Q6uYmVVqv+3fyYiSsHoh67pziiWj/ZWwpmzdd1ZVa0K6It7csJsgRVtnyFA5LrzCWLQ=
X-Gm-Message-State: AOJu0YzbN7EbUteVnsrwUU9/ZDk1vp2JXgnQhdujLLdWy8yjKcpJ06CF
	SE5D0LrVLfAWI1hibCqprPCOhQliHDl+OhN1JCvA49Fbqh6TqoOBWY+Apn797xACmw==
X-Google-Smtp-Source: AGHT+IEcyGxv3boJhUbIfcxE4GAXJlXVJLOoxb0MGuYy2YDFLHQehEYV64lneBXAaSEL4H2H7EwLgQ==
X-Received: by 2002:ac2:544f:0:b0:512:b3ef:350f with SMTP id d15-20020ac2544f000000b00512b3ef350fmr1193587lfn.49.1709205736954;
        Thu, 29 Feb 2024 03:22:16 -0800 (PST)
Received: from [10.32.57.243] (yritysnetti-5422ea-26.businessinternet.fi. [84.34.234.26])
        by smtp.gmail.com with ESMTPSA id d5-20020a056512368500b005128d0e2a07sm214031lfs.308.2024.02.29.03.22.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Feb 2024 03:22:16 -0800 (PST)
Message-ID: <2c9e322f-edc9-457b-8c0a-0628c9a5d6f9@gmail.com>
Date: Thu, 29 Feb 2024 13:22:15 +0200
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] kci-gitlab: Introducing GitLab-CI Pipeline for Kernel
 Testing
Content-Language: en-US
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Helen Koike <helen.koike@collabora.com>, linuxtv-ci@linuxtv.org,
 dave.pigott@collabora.com, mripard@kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kselftest@vger.kernel.org,
 gustavo.padovan@collabora.com, pawiecz@collabora.com,
 tales.aparecida@gmail.com, workflows@vger.kernel.org,
 kernelci@lists.linux.dev, skhan@linuxfoundation.org,
 kunit-dev@googlegroups.com, nfraprado@collabora.com, davidgow@google.com,
 cocci@inria.fr, Julia.Lawall@inria.fr, laura.nao@collabora.com,
 ricardo.canuelo@collabora.com, kernel@collabora.com,
 torvalds@linuxfoundation.org, gregkh@linuxfoundation.org
References: <20240228225527.1052240-1-helen.koike@collabora.com>
 <20240228230725.GF1659@pendragon.ideasonboard.com>
 <0a5bf7d1-0a7e-4071-877a-a3d312d80084@gmail.com>
 <20240229093402.GA30889@pendragon.ideasonboard.com>
 <655f89fa-6ccb-4b54-adcd-69024b4a1e28@gmail.com>
 <20240229111919.GF30889@pendragon.ideasonboard.com>
From: Nikolai Kondrashov <spbnick@gmail.com>
In-Reply-To: <20240229111919.GF30889@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/29/24 1:19 PM, Laurent Pinchart wrote:
> On Thu, Feb 29, 2024 at 01:10:16PM +0200, Nikolai Kondrashov wrote:
>> On 2/29/24 11:34 AM, Laurent Pinchart wrote:
>>> On Thu, Feb 29, 2024 at 11:26:51AM +0200, Nikolai Kondrashov wrote:
>>>> On 2/29/24 01:07, Laurent Pinchart wrote:
>>>>> On Wed, Feb 28, 2024 at 07:55:24PM -0300, Helen Koike wrote:
>>>>>> **Join Our Slack Channel:**
>>>>>> We have a Slack channel, #gitlab-ci, on the KernelCI Slack instance https://kernelci.slack.com/ .
>>>>>> Feel free to join and contribute to the conversation. The KernelCI team has
>>>>>> weekly calls where we also discuss the GitLab-CI pipeline.
>>>>>
>>>>> Could we communicate using free software please ? Furthermore, it's not
>>>>> possible to create an account on that slack instance unless you have an
>>>>> e-mail address affiliated with a small number of companies
>>>>> (https://kernelci.slack.com/signup#/domain-signup). That's a big no-go
>>>>> for me.
>>>>
>>>> Yes, it's not ideal that we use closed-source software for communication, but
>>>> FWIW I'd be happy to invite you there. Perhaps if you try logging in e.g. with
>>>> a Google account, I'd be able to see and approve your attempt too.
>>>
>>> I don't use Google accounts to authenticate to third-party services,
>>> sorry. And in any case, that won't make slack free software.
>>
>> Of course. You're also welcome to join the #kernelci channel on libera.chat.
> 
> Isn't that a bit pointless if it's no the main IM channel ?

Yes, it's not ideal, but if more people come there, more discussions will 
happen there too.

Nick


