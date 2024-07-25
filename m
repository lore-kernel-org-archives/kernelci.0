Received: from mail-io1-f51.google.com (mail-io1-f51.google.com [209.85.166.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2008219CD05
	for <kernelci@lists.linux.dev>; Thu, 25 Jul 2024 15:50:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721922645; cv=none; b=vCg6ka4UbAHX24AF1c+ni3LmgSZ5utej1KTbBr3oL38ZOUQyp2ZaTm5+vDpmsgKvqbtj3F4KSxvd/G/VKplc/rfsvBDR9HL+jBv1xId/Q7Ppv+aFu4ehM/76tfutGTmb+a5pMkSsvrprY9SfSAfrMtLLYiVyBL2QB9kRTP1uXrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721922645; c=relaxed/simple;
	bh=6m3+FHyJ+AmEj6vS4AHygVqkSGsQfYiClcdMM+4uSyQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IcFhDE/fASEz8l3gqOP83Mx6TeJnR/EvneAhC98qWXi6brE8Kurh02x4GLS8vp+cBjZvbTuoqJy3ZBtoO1vwSVbrA9tbR0aukXXHFHN+75tFlNhtPJpPR85s7Hhw7HbjtGxFda2JR1mq9nmTgzcyKQ9iqhWZkrKDEKXm1Zqvq1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=P/x8z/ky; arc=none smtp.client-ip=209.85.166.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="P/x8z/ky"
Received: by mail-io1-f51.google.com with SMTP id ca18e2360f4ac-8075313cc7aso2198339f.0
        for <kernelci@lists.linux.dev>; Thu, 25 Jul 2024 08:50:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1721922642; x=1722527442; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Aggvme3xKg7i4TrOmjlKCfE2kTRYsrbbuWQJNB9R3qE=;
        b=P/x8z/kyNeXK/T+amyP62usVINJtyCrh/Rt+o87/ds//FDATVV7oo8BtLvee4kntRZ
         Xy4LJ1t/p3Uh84FHABscaDu6R5Vh0u8Ffhze5CqNhy1sQvrZoTvo+xLaYoI6cddVP6/b
         j6EFgzu1rMoGRWZ+kLsnrDNDjvFkhvsYesz48=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721922642; x=1722527442;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Aggvme3xKg7i4TrOmjlKCfE2kTRYsrbbuWQJNB9R3qE=;
        b=FqhHkhpn7eX27iYK8K0PKEmHhVyJjDcd2Jremnpm62cUXORb5TVz16PebX6jyRVs7v
         dY/QYAh/Ak4NMsVbt0Eh4FnomWK5bbJGDHl/5XRT6a9GuuTXhW4JD1E2I1Q9RmR4xUhs
         gU0/Yl4juH3smq+gIuzb12tquQZXjHEH32/Skny9tdAnJjUOCwCTSsOWKoVzjLB1wjqs
         mrk8x3r08yGJ85s3vqv5Rn6EgkCIm+uFAVumf2biY7sjmpMK4MdJ4TC9HW64nOatBfFE
         Qmv5Q9OS5qK4s+/9oHA05xtFnL4LhvpmfI2GPDLci9UazEd8ykpwnhRntUIO3nyVGtxu
         BFoQ==
X-Forwarded-Encrypted: i=1; AJvYcCUA86Y1TyEW8n2UlxOtXGWxl0zpbXgqAHq+PgZwxp/pFMyFt1xROBe24gjhMc7QiJD4d0Y+K9+x7hC94o2Un9koF7qWg7L7i4A=
X-Gm-Message-State: AOJu0Yxycczs6lF4xXGeM0T8GcO0dP9+cuYCm6FYQd/tUmpj6a8X8L6S
	53DQTN6HrnAKWZ0meZ1ThaB1VGgbIzW8eed08QxTFKbt2YQLx1sOPrONa6BaFOk=
X-Google-Smtp-Source: AGHT+IFEHsFN0I8fUwEQhH9FG5DtAKwnOj8OaKgLxrdAaSfCNz0gvGEdpltGEFJdn8E7GWzFxI4Qyw==
X-Received: by 2002:a6b:e810:0:b0:7eb:2c45:4688 with SMTP id ca18e2360f4ac-81f7d016818mr216157639f.2.1721922642214;
        Thu, 25 Jul 2024 08:50:42 -0700 (PDT)
Received: from [192.168.1.128] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4c29fbd9b8asm382241173.108.2024.07.25.08.50.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Jul 2024 08:50:41 -0700 (PDT)
Message-ID: <65c59f75-3810-4490-991e-62b5aafe1f5a@linuxfoundation.org>
Date: Thu, 25 Jul 2024 09:50:40 -0600
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 1/1] kselftests: Add test to detect boot event
 slowdowns
To: Laura Nao <laura.nao@collabora.com>, shuah@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 kernel@collabora.com, kernelci@lists.linux.dev, tim.bird@sony.com,
 mhiramat@kernel.org, Shuah Khan <skhan@linuxfoundation.org>
References: <20240725110622.96301-1-laura.nao@collabora.com>
 <20240725110622.96301-2-laura.nao@collabora.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20240725110622.96301-2-laura.nao@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/25/24 05:06, Laura Nao wrote:
> Introduce a new kselftest to identify slowdowns in key boot events.
> The test uses ftrace to track timings for specific boot events.
> The kprobe_timestamps_to_yaml.py script can be run once to generate a
> YAML file with the initial reference timestamps for these events.
> The test_boot_time.py script can then be run on subsequent boots to
> compare current timings against the reference values and check for
> significant slowdowns over time.
> The test ships with a bootconfig file for ftrace setup and a config
> fragment for the necessary kernel configurations.
> 
> Signed-off-by: Laura Nao <laura.nao@collabora.com>

I am repeating the same comments I made on the cover letter here as
well.

What are the dependencies if any for this new test to work?
Please do remember that tests in default run needs to have
minimal dependencies so they can run on systems that have
minimal support.

As mentioned earlier take a look at the tools/power/pm-graph
bootgraph.py and sleepgraph.py to see if you can leverage
them - bootgraph detects slowdowns during boot.

We don't want to add duplicate scripts if the other one
serves the needs. Those can be moved to selftests if it
make sense.

I will review this once we figure out if bootgraph serves
the needs and I understand the dependencies for this test
to work.

thanks,
-- Shuah



