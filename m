Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1168578B60
	for <kernelci@lists.linux.dev>; Mon, 23 Sep 2024 10:44:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727088280; cv=none; b=HLC+HVf62IORH1hYtJhYwVWcYs5koQ5PtGl3DOE4QyzuzhGAVZGwnC3LUrNTXsD99cu/FA68dBAVgzRbJVVt6VUL2K0IXmHvRskGROeja28McblZtECb9ZrvuEd60dPYdqL5FSfrBJE7mop731QV8zRvy0m3t6LmNUDsaOM7kbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727088280; c=relaxed/simple;
	bh=t+gJTsJTX2/QqXQSXbfh00w9GuEotgXPm06OpofZ028=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZCg83JXVJ+aA/leAhNh3WR0ma0QQ576dS6VvzFEvvAQ5Jtq1Pz4IFfZJbjPQ7Da1F0WLnf6LdByyQn1Oy8oY04TghuFWotUtLsHurWgHaO/zM1lnYwlPrPxB6mz86pKqyrt5iMPO3jg02TKvaYLMz07dYjdIy12ZxPbY2nPwVmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Mh0ZHLUt; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Mh0ZHLUt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1727088278;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ErLXtrXOXGPduj3xBPIZSgWTiWUJMwLP4DM2bARSSqI=;
	b=Mh0ZHLUthymTDFutQQKuxHVBDTWSVmwMCai5MSmpwXYLvKTwdFfnx3aw0a/Xc5vroNxOUv
	GKWeS+wziSh2RKi/ZWD8sHShhU/YcUjLh2wDfTXIQPW85YI1W3QclTLUmVJRVdZad2wAK9
	x3nV2/9Tx7wYTXUQ4yzMFtIcFuSvV70=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-385-6WvOtF9gMFKo_4VyvGlcQQ-1; Mon, 23 Sep 2024 06:44:36 -0400
X-MC-Unique: 6WvOtF9gMFKo_4VyvGlcQQ-1
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-42e8bf0f5e8so3528135e9.2
        for <kernelci@lists.linux.dev>; Mon, 23 Sep 2024 03:44:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727088275; x=1727693075;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ErLXtrXOXGPduj3xBPIZSgWTiWUJMwLP4DM2bARSSqI=;
        b=e5Jxx4UfkjjOusH69h48h/ANn6mH49EKvpGOSxcikZr5qvU+Ptfu/s0trkmQmFLDW7
         uJzfGapb+xRRdPzsn5G8/Hs0LoEkxUcARw+pKv1McrFFuoxtxPqeSEM+FhVAchdTgaNe
         ckYUx4Iuez90j/0FdXnSii0XRC/7/wuK8fKka1hTKi3mILU/M09dJzklCwzPRx0JOJfW
         qKPdV96qdtQEbFvORxR0BxRTqrJzHKbz70OTWk8hOXif6Kn1VjYa1hxHOKVPWnXBwJwG
         K9I0XpuWWuHXnUd/tNLAtTqRumTddiC9iYCFy9+ZeydLl0pIu3KZRIhf3TGIiKR6fsZw
         05lw==
X-Forwarded-Encrypted: i=1; AJvYcCW8vdB3FQtZQzS4Vyjlx9jtCtAVFE5mtkW+kmxroQsjKwgWGE0049XzkGGsHrrppwwD4Z4m4Fx6ew==@lists.linux.dev
X-Gm-Message-State: AOJu0Yziht4wDQLNg0Gmfu5RzxZTi7Sk+qx3oJZ1ezQPsI/3HgAOKrq6
	34kZKeaUUnSZed/p2hWFPESJ5Zx2D+tNRcwGOMazpynfRESrjM1Bce2M6N/GFSMoemXfUvXQx3M
	/dpLXezKSFFaNQdTcVwpq5Of0jnKqTaC2No81i+tMpM1RAupC89jP+nV/
X-Received: by 2002:a05:600c:3115:b0:42c:b949:328e with SMTP id 5b1f17b1804b1-42e7add1478mr75680855e9.31.1727088275570;
        Mon, 23 Sep 2024 03:44:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHZbqI9mcuWamxL10+bS4VdGc0K0aN8K20u9h6hvj58zBE+dIZGfqzoMi4tpuR3CdzzBWC9AA==
X-Received: by 2002:a05:600c:3115:b0:42c:b949:328e with SMTP id 5b1f17b1804b1-42e7add1478mr75680725e9.31.1727088275154;
        Mon, 23 Sep 2024 03:44:35 -0700 (PDT)
Received: from [192.168.0.166] (h-185-57-5-67.na.cust.bahnhof.fi. [185.57.5.67])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42e75450114sm123457005e9.23.2024.09.23.03.44.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Sep 2024 03:44:34 -0700 (PDT)
Message-ID: <60b94fd6-b185-428e-8ce2-c1c1a2b5a4d9@redhat.com>
Date: Mon, 23 Sep 2024 13:44:33 +0300
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: KernelCI DB credentials
To: Thierry Reding <thierry.reding@gmail.com>, kernelci@lists.linux.dev
Cc: Jon Hunter <jonathanh@nvidia.com>
References: <gw7roxtasg6njfj7xzhgglbbomwuy7ipintlzd2iojpsvlflpp@6vj4aqcoekst>
From: Nikolai Kondrashov <Nikolai.Kondrashov@redhat.com>
In-Reply-To: <gw7roxtasg6njfj7xzhgglbbomwuy7ipintlzd2iojpsvlflpp@6vj4aqcoekst>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Thierry,

On 9/23/24 1:07 PM, Thierry Reding wrote:
> Hi everyone,
> 
> I've been looking into ways to contribute the test results from our
> internal Tegra test farms to the KernelCI DB. Following the process
> outlined in the documentation, I'd like to request submission
> credentials.
> 
> We usually run build and boot tests on various Tegra-based boards on
> linux-next and various stable and mainline builds. In addition, some
> sanity testing beyond just booting is also performed, such as boot log
> analysis and several system-specific tests.

Awesome!

As long as the kernel and test sources you're running are open, you can send
any kernel build and test results.

> Initially these would be manually submitted, but once this process is
> mature enough we may want to set up our system to automatically send.
> Can we reuse one set of credentials for both or is it better to request
> separate credentials at that time?

Sure, you can use the same credentials!

I just sent them to you. I gave you access to submit to playground for now, so
you can figure out how it works. Once you're ready I'll add the production
permissions.

Nick

