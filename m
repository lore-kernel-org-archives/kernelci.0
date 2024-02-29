Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 465CA5CDE5
	for <kernelci@lists.linux.dev>; Thu, 29 Feb 2024 09:26:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709198816; cv=none; b=a43yNUITNXIrnpjUdFoYLPAWNptiMZzOvwEo587dQ19KRmw8AIvL4kBp2jn6VuUA60r/loJRH4v/lTGiUtCfKWFQ9NksApem2rzVrR32vNx7vvp5EQP+ud0F8Gj9bbXJ02Vo/560XFFUcTe6G7EApROPlxKPFjLvhTFE+ucsP2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709198816; c=relaxed/simple;
	bh=H3DVOzLmQ6k1aiZNO64pehrcmvGMoPGpzkMsjPLddA4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZsFMRi7Zl50LVVtWrxmMX/HrjUXkOOZY7oQZD+3h1bjoay/WCIDHCqtpGKpVO7PW8iGESk6YAvbSDupCb4oipdc/vRYAL5G3r5KMtlx/OT2edrwjsgTs70YC/Q7RNfzwgOfS9QEgkNbwgebCyGQ/jTWaFkHUQk7/upDbXcN0RLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BUMDUdFD; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BUMDUdFD"
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2d275e63590so7671681fa.2
        for <kernelci@lists.linux.dev>; Thu, 29 Feb 2024 01:26:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709198813; x=1709803613; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MUGoQKrYI+CUGIzYiMWNWVHuIqGWUhSm1DPKxOOJHWY=;
        b=BUMDUdFDZckE9gxHET4PLAlataxmhar4Ha5Y1sRBw7IwsgIIuvEd/CmfjqLjgD5S0L
         8aLKbfbY10B02sUreGXS9t8DY4QsV3++1XUVO/1YGy8mfofTULyShJFAUnD9YRz9dOUN
         ri12s2eCc+st8J8M/aTHcWKE7hYN+JDlGcvT5hOqzNSf5Hb12vm11nQWgVnOK6Wb4mM9
         KIDHO+skWa2m1O4ZdcRnx3b9391wj3m85ky4CC2xSxMIfQqPOYEJrowng3KueLPJlJ/d
         WRHLQoAoJHKdDg8Ox1vbcnQLIkybM3quHessw8BclM2O3riEXo+wNhhwAH56t/euZpOi
         V0Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709198813; x=1709803613;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MUGoQKrYI+CUGIzYiMWNWVHuIqGWUhSm1DPKxOOJHWY=;
        b=EALfRrawaYsR5VdfkRvUz81ICfUPyEJI1eoXNkO6PcciSF2+r/i6lwbELGV6FrQs2c
         BnkE3GTfvANBwSTqQr1PQ0zC8rd5knFi/KaBWjpWs/fYlEEkuVtZ/72WGImSkAEIbygK
         6ShfVFAk2yDUxUPuZhJYuM1OqaDeoR1YLRywkUyyLoLACF+SWLnepypnuBFhaKTLXO7P
         VB6TnOvOL7KxwdC/59cco6a+qqOIDQyu/9lkKSo+sXrpuzMTIYU5f3Q9m4gXhFuBOzIs
         M6cGffyDFDdzVlKCLDGclcGqKbQj667IGiXx1mHIGgr+sjAu2iTuaRQ3BxIaNRMjPbCV
         zgjw==
X-Forwarded-Encrypted: i=1; AJvYcCUZzISsE0GroRH9ARlW0+9x3V19a3M4RGhsE9HrZrojhi5j6hvwaNkL1YWM7Y3UscjanijVPLi4Rr7uPYTHgQ0fvsR/EuOlov4=
X-Gm-Message-State: AOJu0Yzv6D+CwHqmc53kw24j4ACZEsaxwIUp7bQlZo2zU5CY3qw4MO+9
	yXyom047oMuaJx21gBv8zH8JDXJmd2P2Ldr17W1TvTH9oLFqB88H
X-Google-Smtp-Source: AGHT+IEQQGvEUUUJJE0Q32Q1dWpicjPYOMb4ktp8tTjoWEWQsJczQ+GYRu123pV36LqzQ6iLRlTmxA==
X-Received: by 2002:a2e:9496:0:b0:2d2:e704:77a8 with SMTP id c22-20020a2e9496000000b002d2e70477a8mr987605ljh.3.1709198813316;
        Thu, 29 Feb 2024 01:26:53 -0800 (PST)
Received: from [192.168.0.118] (88-113-27-52.elisa-laajakaista.fi. [88.113.27.52])
        by smtp.gmail.com with ESMTPSA id v2-20020a2e9902000000b002d0f905ddf9sm151234lji.18.2024.02.29.01.26.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Feb 2024 01:26:53 -0800 (PST)
Message-ID: <0a5bf7d1-0a7e-4071-877a-a3d312d80084@gmail.com>
Date: Thu, 29 Feb 2024 11:26:51 +0200
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
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Helen Koike <helen.koike@collabora.com>
Cc: linuxtv-ci@linuxtv.org, dave.pigott@collabora.com, mripard@kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kselftest@vger.kernel.org, gustavo.padovan@collabora.com,
 pawiecz@collabora.com, tales.aparecida@gmail.com, workflows@vger.kernel.org,
 kernelci@lists.linux.dev, skhan@linuxfoundation.org,
 kunit-dev@googlegroups.com, nfraprado@collabora.com, davidgow@google.com,
 cocci@inria.fr, Julia.Lawall@inria.fr, laura.nao@collabora.com,
 ricardo.canuelo@collabora.com, kernel@collabora.com,
 torvalds@linuxfoundation.org, gregkh@linuxfoundation.org
References: <20240228225527.1052240-1-helen.koike@collabora.com>
 <20240228230725.GF1659@pendragon.ideasonboard.com>
From: Nikolai Kondrashov <spbnick@gmail.com>
In-Reply-To: <20240228230725.GF1659@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/29/24 01:07, Laurent Pinchart wrote:
> On Wed, Feb 28, 2024 at 07:55:24PM -0300, Helen Koike wrote:
>> **Join Our Slack Channel:**
>> We have a Slack channel, #gitlab-ci, on the KernelCI Slack instance https://kernelci.slack.com/ .
>> Feel free to join and contribute to the conversation. The KernelCI team has
>> weekly calls where we also discuss the GitLab-CI pipeline.
> 
> Could we communicate using free software please ? Furthermore, it's not
> possible to create an account on that slack instance unless you have an
> e-mail address affiliated with a small number of companies
> (https://kernelci.slack.com/signup#/domain-signup). That's a big no-go
> for me.

Yes, it's not ideal that we use closed-source software for communication, but 
FWIW I'd be happy to invite you there. Perhaps if you try logging in e.g. with 
a Google account, I'd be able to see and approve your attempt too.

Otherwise, our video meetings are generally open to everyone and run in Jitsi.

Nick
