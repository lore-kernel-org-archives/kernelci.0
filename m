Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC3A96351C
	for <kernelci@lists.linux.dev>; Thu, 29 Feb 2024 11:10:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709205022; cv=none; b=KbRy1brCScFlKEJHjLkhxNjrOQOozz83qCbVWX6OhAFbSK5pKzzaxuwS0odVKXoMYdJTjAbt7JLfru/yGzH7/RFz5SRiJXtjSuRbnUl+YQzdAKnL64S/DhA7rF9KeUs2OP3PSsDKIVi/iNzDf9Vl1jbls7+bQ/j9foQyzbV/bj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709205022; c=relaxed/simple;
	bh=pN/tSJjuwssSSwy9xAYBREIgl/Vm4/Oz1DWXTc9me3k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pSL6AjN8V5PCedPq9KoJXIVj5VP9C00s7Ys+qFHzGrwJEISwr4XKmOn2AgCYFOk1LpRDkf+FWWrjvAltwx/ktq2icMOplX2A7LIo3IT31MAlI5sTFe2c+LXFDS7oSGDyWnGa+30vgQDtFyU9nuUTRVbAhg7ksAyrjU9VXfPxGJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UyHyD2ms; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UyHyD2ms"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-513235b5975so943440e87.2
        for <kernelci@lists.linux.dev>; Thu, 29 Feb 2024 03:10:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709205019; x=1709809819; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GIBPoOk+1kYrUDtUJWUP6LK4VMtPXxz+WnWICgzvGsc=;
        b=UyHyD2msCf3hSazA9fU7PqHMNk3uw56JlizvwBWa2QAaCe3OBcSzAjhOymvq3yF2lx
         Y1R/MGl0BpmLgMkLwW1PfN0umiunbXmQAsalEtgsRhHeVD+OqT/WlyUFCuFHCUbd3Wqk
         nmmgjB8Ymo8lAvuR8OrDPyNbW7sRIzaKOD6kzETJ1J5tWdJOYsmQapT+nutxwGNixQcR
         6UrukhsUL8pyBvofMQ+KNe4TPr4DgCNs2TC2HjU3p0xyZ5mAW+Kgy9wFF9oypco5krXt
         xpyAkk5qa0VWtlNplbbKuTZPc1Hi4p+dzHcM8a8fm0pMjkWNvoIeASSbbycREGR0jpHu
         9nxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709205019; x=1709809819;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GIBPoOk+1kYrUDtUJWUP6LK4VMtPXxz+WnWICgzvGsc=;
        b=GI3Brc3AynO7P3XCVWxqIY6z2NGk+QBSgb86b/Cb51Y6FyEF7Y2vMlYEXpE5yBeJ15
         GR+nEHpa/b58LJT1gin7mr4MemUetpJ3M7FtdMcAS3azMjURPBZ3jbRQdjHwGaSJ3zHZ
         GhA0/ppJFOtli2AQF2vpAomJkVxYYLnDGnPKvhkScxVtBOQQVZJ9fTtNEzLknUUQrVaw
         3mdZhoZZovhVHAZUo3n6u+4HgvwmhukRt9ldqNx0nkJ4WYxXiGADwPkcrb+qcUEDCE3A
         qEqnFQegB6+TWUeWEuNcz6VC0cdB8t9oMRZJZnZJKVTjvhllwsE2sQ1TXjxtuWZXu6qd
         Ksow==
X-Forwarded-Encrypted: i=1; AJvYcCVzP2K762SlZhJDORm4DHMNMAFLHCKrYHxbeSsW/5dp+pOMPdaB+GCdC3Ck17gxYneyDw+V+j2xZnafR6axp4VrcLP2bCHPaG4=
X-Gm-Message-State: AOJu0YyrADEOQlrlRTW4CMqfIpnP2Kz1BYM8DW7PaTmO1Wk8qF3Q4K4P
	sZCVb92rOrxw71bF6ntmUvQIrVwFrioXKb4wiNBss/maDIQhqSBh
X-Google-Smtp-Source: AGHT+IE1rn1IKpuRyvo4Opm0Zt3B82O24f9hp/M7IbQ1wdOiuJCWMOZg3kcfpBECPXoLQ+BpqOoHNg==
X-Received: by 2002:ac2:547a:0:b0:513:22d2:ede8 with SMTP id e26-20020ac2547a000000b0051322d2ede8mr1329851lfn.39.1709205018795;
        Thu, 29 Feb 2024 03:10:18 -0800 (PST)
Received: from [10.32.57.243] (yritysnetti-5422ea-26.businessinternet.fi. [84.34.234.26])
        by smtp.gmail.com with ESMTPSA id m17-20020ac24ad1000000b005128d91b9f2sm210079lfp.161.2024.02.29.03.10.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Feb 2024 03:10:18 -0800 (PST)
Message-ID: <655f89fa-6ccb-4b54-adcd-69024b4a1e28@gmail.com>
Date: Thu, 29 Feb 2024 13:10:16 +0200
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] kci-gitlab: Introducing GitLab-CI Pipeline for Kernel
 Testing
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
Content-Language: en-US
From: Nikolai Kondrashov <spbnick@gmail.com>
In-Reply-To: <20240229093402.GA30889@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/29/24 11:34 AM, Laurent Pinchart wrote:
> On Thu, Feb 29, 2024 at 11:26:51AM +0200, Nikolai Kondrashov wrote:
>> On 2/29/24 01:07, Laurent Pinchart wrote:
>>> On Wed, Feb 28, 2024 at 07:55:24PM -0300, Helen Koike wrote:
>>>> **Join Our Slack Channel:**
>>>> We have a Slack channel, #gitlab-ci, on the KernelCI Slack instance https://kernelci.slack.com/ .
>>>> Feel free to join and contribute to the conversation. The KernelCI team has
>>>> weekly calls where we also discuss the GitLab-CI pipeline.
>>>
>>> Could we communicate using free software please ? Furthermore, it's not
>>> possible to create an account on that slack instance unless you have an
>>> e-mail address affiliated with a small number of companies
>>> (https://kernelci.slack.com/signup#/domain-signup). That's a big no-go
>>> for me.
>>
>> Yes, it's not ideal that we use closed-source software for communication, but
>> FWIW I'd be happy to invite you there. Perhaps if you try logging in e.g. with
>> a Google account, I'd be able to see and approve your attempt too.
> 
> I don't use Google accounts to authenticate to third-party services,
> sorry. And in any case, that won't make slack free software.

Of course. You're also welcome to join the #kernelci channel on libera.chat.

It's much quieter there, though.

Nick
