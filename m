Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 572C719644B
	for <kernelci@lists.linux.dev>; Fri, 16 Aug 2024 12:58:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723813122; cv=none; b=fzvikZDe2ZpvVRAAERg7Eze2XmuUGlVEVPGm2Ce3+VGTfsIb4bGHqRWUkRuMoUtMr/luYlcpjHbj1Ye3HmtBfKwb0VqKqfiHphdj4nSoUnuOEKRHC+TohBcQMrA9sxAdJAZZfKKwJ0mQ/6gqIb0zu7MxF3c2o68Ec8Z66vp9z+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723813122; c=relaxed/simple;
	bh=Eu9ydjnb0dKAKEN4yvBWMlSfYNXZJRYmYJBuZCOel/I=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=Lf8aqIrhws7tOmbSJDPsgeBL6lQaw9Yrxk3VJshYBj+PlbbWzmZdasMBgtU7KNvn6MjGvsFilcktUuIfUECPfIIrbeKN6sUW3p5dERx+TRmXacYm8+RIllAUUm0xYUH5Pj0A8UoGntdoEtc/nqHsDcQflyySLdKTE5B87ae13do=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fBw7EDOu; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fBw7EDOu"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4280bbdad3dso13570485e9.0
        for <kernelci@lists.linux.dev>; Fri, 16 Aug 2024 05:58:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723813119; x=1724417919; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :to:from:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tRhOo+KJgqjs/NbIumrnCDJMYzEu4v29HFQU9Cy19Kc=;
        b=fBw7EDOuqHSjM8c4YZs7gd9PNldX59NI7ZN0pWK0ywocc7l8uJw+ms3j2WSWZOC5Lo
         GoA6aFlLEptSQbwi5jwgCcZK2mLTxnvtn2/9Cw8oTkbMjvswSvx+KIIL9+LyQWs6eczO
         VPiJzoYWOHLPRJJN8pew3NIvxeeJ/LmznKf1kecRXUyVdtnqu2uR1Hb0QDSDK99ocrKD
         2umK4FEtI/LtoszLA6VY3WSDnNBLjHInB7ZUDDvaawWVvDBGiqTex9y45LZHY3jUUOCv
         Qnlpw0MIUL/dwV+E2TG5i7S2LPbqxv11wPltBzZRSAz2sdwqxsZOId0HOL33BVHmbkDy
         RfPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723813119; x=1724417919;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tRhOo+KJgqjs/NbIumrnCDJMYzEu4v29HFQU9Cy19Kc=;
        b=Ba251L0lqw+qSwqvXvE+4v27x6AxgghPtDkRIBOGVBN/BUrIaUL0pUEzEzCSUyEehn
         D8r8q+BsrrKrwSaszDZ4IIDqq8X2ELUf3cJbb/f5d4WQTShBgo//rnKs6WMYdGSoPc0L
         iR5QhXKKKB9TtZVcKBPrksTnN7Xg3Ng3K6c+IlnYF6eYrg9ylwLdJu8WiXIUebP6pxol
         pAI/OAS3KgXt14Hl9fgcgsKxZwaR0NHn+wobS3uWNi8rC6PvIXna+gXAHsnd2BBSB5Er
         MJ81YE5YmnXRkzybeuCnmGODRmlisE3/LTPRAYAR1Y3pvgX9HSVG8KwPUnhmAnVYJVxi
         y0cg==
X-Forwarded-Encrypted: i=1; AJvYcCWSEuVa2Bu7PUedrQ5yTK3W0gMQwaVoEb7ndhHNNJlNIn/2QCpxqsN8GctRWjCw6BiMZgotvcqfIaznzSK1mDuLrG92rdkpbHE=
X-Gm-Message-State: AOJu0YwggjMWLJYeykg4BHeQdRQuNJVbFHB6zkgffU5GFWFW9i4FBX/n
	pGadlJ0J6vGL6dVrj/CAeja6ZXqBU9CSZtUU9jsh0BLELjdY5TVX
X-Google-Smtp-Source: AGHT+IFivzlCkWJGAuDDrbZOByBTmZl7FS5FhgLOZvN/I7E4uHWQt8o3gf1du90nTyeALDrrAVhfHA==
X-Received: by 2002:a05:600c:3587:b0:426:51dc:f6cd with SMTP id 5b1f17b1804b1-429ed7b8883mr20519635e9.18.1723813119185;
        Fri, 16 Aug 2024 05:58:39 -0700 (PDT)
Received: from [192.168.0.118] (h-185-57-5-67.na.cust.bahnhof.fi. [185.57.5.67])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-371898ac79esm3612873f8f.110.2024.08.16.05.58.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Aug 2024 05:58:38 -0700 (PDT)
Message-ID: <45dc0536-f0a6-4c8f-a953-5424c9920aa7@gmail.com>
Date: Fri, 16 Aug 2024 15:58:37 +0300
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Automated-testing] KCIDB: Support non-binary test outputs V2
From: Nikolai Kondrashov <spbnick@gmail.com>
To: syzkaller <syzkaller@googlegroups.com>, Dmitry Vyukov
 <dvyukov@google.com>, Vishal Bhoj <vishal.bhoj@linaro.org>,
 Alice Ferrazzi <alicef@gentoo.org>,
 automated-testing@lists.yoctoproject.org,
 Cristian Marussi <cristian.marussi@arm.com>, Tim Bird <Tim.Bird@sony.com>,
 Johnson George <Johnson.George@microsoft.com>,
 Veronika Kabatova <vkabatov@redhat.com>,
 Guillaume Tucker <guillaume.tucker@collabora.com>,
 "kernelci@lists.linux.dev" <kernelci@lists.linux.dev>,
 Don Zickus <dzickus@redhat.com>, Mark Brown <broonie@kernel.org>,
 Philip Li <philip.li@intel.com>, Denys Fedoryshchenko
 <denys.f@collabora.com>, Michael Hofmann <mhofmann@redhat.com>,
 Tales da Aparecida <tdaapare@redhat.com>,
 Aditya Nagesh <adityanagesh@microsoft.com>,
 Jeny Dhruvit Sheth <jeny.sadadia@collabora.com>,
 Sachin Sant <sachinp@linux.ibm.com>, "Hambardzumyan, Minas" <minas@ti.com>
References: <5188d6fe-bd01-402b-a6e6-0fe57ef4d336@gmail.com>
 <bf0befaa-e23e-43f0-996b-d095b7390122@gmail.com>
 <c66e960b-0a43-45fd-8220-82a91b0b8523@gmail.com>
Content-Language: en-US
In-Reply-To: <c66e960b-0a43-45fd-8220-82a91b0b8523@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 8/16/24 1:03 PM, Nikolai Kondrashov wrote:
> On 8/5/24 2:28 PM, Nikolai Kondrashov wrote:
>>> I'll follow up with a separate message for each of the changes, going over the
>>> details and the rationale.
>>
>> The support for non-binary test outputs introduces a new field to the "test"
>> objects called "value", being an "object" itself. It (and its abstract
>> meaning) are supposed to work together with the "status" field. That is, it
>> should only be considered when the test has actually executed. I.e. with a
>> "FAIL", "ERROR", "PASS", or "DONE" status only. Normally "DONE" should be
>> used, when the value is the test's output, and not an auxiliary value.
> 
> Alright, I redid support for non-binary test outputs:
> 
> https://github.com/kernelci/kcidb-io/pull/85/commits/040a20db407f2592c28c3797cec9e4118221af9c

Ah, hold it. I think I have a better idea.
Stand by for a new version!

Nick

