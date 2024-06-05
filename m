Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C2F0192B6B
	for <kernelci@lists.linux.dev>; Wed,  5 Jun 2024 11:05:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717585521; cv=none; b=LC83xLw6i3iiFnLux7i7rva8skmE7MAvAuVR74oJfaU9NlmFAzVnwLSOzaYLho8GtrUxzraXfazJKjLkvxd29f2kvuE5NF7uXeUUunPfMeacmRXjgKGG1o7EcB9cK33frFd4OxS2meZPqxkqXKt6LQhRbAgXc7AfCscPneL3XV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717585521; c=relaxed/simple;
	bh=pX4glVwkda4XhRdV/kQehsla7SyzhNyaSd2fgYoRl/c=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=k0HJ5/2eKuuGYJsBbPi2CoTXQ4shJ+v1kVP6WIoLPcAmIqJmOCNEOSF2QQqUhkoqFtuPhxYyOIV5kEx2gFSSfAI6eycv8zlbpaFjsImoSDOlXS8JAoeOiS21POlHPcLjgId7Lyv8LmV9K2wJY4dXHvnHaQIqaZKXAXeecgf6sE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D/KbtmGC; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D/KbtmGC"
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2eaafda3b90so40867081fa.0
        for <kernelci@lists.linux.dev>; Wed, 05 Jun 2024 04:05:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717585518; x=1718190318; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pX4glVwkda4XhRdV/kQehsla7SyzhNyaSd2fgYoRl/c=;
        b=D/KbtmGCzpuLTBFca2ZPqJ7Vi9TaNwkidU0wOVCzPLp8mzmWqL3VKrm76Nbh0o21Iz
         BPsuX+WjVEanZJH7ytu4cC3s/q4/LpCotbPbbx65VTiQCwcgDiPf7zWW+S/6ABmpE4nH
         /PHP+i/THWqfi+z7vWW8DZwkSNUSNTJFEGAdh5+B1tsmhNzZoz3L+tXqdZgHupCoNZPh
         3/t4IykoOjlWzQEdEmXDPyLecBebntDXAnNibnJcav0970Qdd6JZtx4zeTsAuo3kbtKE
         oY/OiysZ47jZm1inaYhltdxOxIX71Y1DCHHJAN+4BD3xdDovypCFZNgY0kqPLEy/jVtM
         FQYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717585518; x=1718190318;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pX4glVwkda4XhRdV/kQehsla7SyzhNyaSd2fgYoRl/c=;
        b=EPXSEo8nBd5WCv0XyPNhGJ9Ft9Hu7CGGjagm3hgGpb8RHRsbWJEWdq9GlDsiNe1Ocg
         WxYf4cg/js4eYavZki+94wB0qZk+olC4MyloD19ZLo9Hjdtj2iX9436jyLAZciuEYX7w
         PEmyof0U+V/yZ3hJ/hG1QTwMe/tzVcBFfcJFhoIk3BKkbtgUeZVZ88J1icvHJZSWufEP
         PlXWxO4vR2EhL8EEpHTouNmpJGq5jbKP/qdn34jq+1bUzA05FS5iuyol2F8qAg7M+sAf
         mDmkZ+GuqXPgXT+vrP7yxAiAV4MG8fujc1ompbglyt/IDlEc091MntPnq9R/+2ddMShI
         CBHg==
X-Forwarded-Encrypted: i=1; AJvYcCW3MbpHiXI/nUXOf4u0VnaK883J0D1jsf+c1LzeZvMXNTWwvMQa07vMhCxzYUK3vQcGhbdU3svUH4OtXH5W1LrJollki2HZJHY=
X-Gm-Message-State: AOJu0YxqRM5HtKAhDuuMdyBXnsPYpLXJdIzJawWf8PvmIsKsWjpTHlO2
	L0MPv7F3ZdmSQqJKKLxe/OfVIsIazVwb/cBQox+DN6YXO4zSYzTlr+gf0xvV
X-Google-Smtp-Source: AGHT+IFUB5RIjBKzv1vvaJRQRXCXoFjyYW4XCVaOHt/R1ansMmqgEDV56/RN+e7ldntuMAgtT1J2jQ==
X-Received: by 2002:a2e:9993:0:b0:2e9:69ec:f690 with SMTP id 38308e7fff4ca-2eac7a12687mr12045481fa.30.1717585518179;
        Wed, 05 Jun 2024 04:05:18 -0700 (PDT)
Received: from [192.168.0.118] (88-113-27-52.elisa-laajakaista.fi. [88.113.27.52])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ea91cc9da9sm17425111fa.99.2024.06.05.04.05.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Jun 2024 04:05:17 -0700 (PDT)
Message-ID: <78abc55c-c847-4dff-988a-feb829765eba@gmail.com>
Date: Wed, 5 Jun 2024 14:05:16 +0300
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: New name for new "KernelCI"
To: Guillaume Tucker <gtucker@gtucker.io>,
 "kernelci@lists.linux.dev" <kernelci@lists.linux.dev>,
 "kernelci-tsc@groups.io" <kernelci-tsc@groups.io>
References: <b51eab8a-41cd-4439-8434-076d09b60ed4@gmail.com>
 <20f8a3d0-2246-4762-a981-4690bf6afcf7@gmail.com>
 <8db63860-38a5-482e-8ef9-02acdf13c467@gtucker.io>
Content-Language: en-US
From: Nikolai Kondrashov <spbnick@gmail.com>
In-Reply-To: <8db63860-38a5-482e-8ef9-02acdf13c467@gtucker.io>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Guillaume!

On 6/5/24 1:08 PM, Guillaume Tucker wrote:
> On 05/06/2024 12:00, Nikolai Kondrashov wrote:
>> On 5/23/24 6:54 PM, Nikolai Kondrashov wrote:
>>> As you know, we've been developing the new KernelCI API [1], and the
>>> kernelci-pipeline [2] based on it, for quite a while.
>>>
>>> However, by now it seems that too many things are being called "KernelCI": the
>>> project, pieces of the old system, pieces of the new system. We would also
>>> like to give the name of KernelCI the project a wider scope than just a
>>> particular CI system, and accommodate more packages/projects under its name.
>>>
>>> So we would like to propose to call the new system "KernelCI <Something>".
>>>
>>> And this message is about that "<Something>".
>>
> Would this encompass KCIDB or would it remain a separate project?

This would be just the KernelCI API/pipeline. I.e. there will be "KernelCI"
the project, then "KernelCI <Something>" the CI system, and "KernelCI KCIDB".

Nick
