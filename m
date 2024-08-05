Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A9583EA64
	for <kernelci@lists.linux.dev>; Mon,  5 Aug 2024 14:26:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722868018; cv=none; b=ZWSORz4YsqvzgIJmAKWR2wXnzmG7uMXwnGGZxN4QyvPvRkerhdcSG5HxKPocDrYa1YxoKeUMg+oBJoJQYYezmIitfwlY2qOVAbeoPBN7KASu/KHW8eFDv6b7lplIX3qzpgJ1A8DZ921XkYWLNpI165XiOSin4xLwBiLLFy4lOio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722868018; c=relaxed/simple;
	bh=NWxG7xSUhsn76UE2aNRSo4gGU3mtPjffa5XfI78Z9AY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ef052FMeDwmyFwWQQ60DuejhHa6SI5HVXvshLBYWj57KwqMXm6UPwPu2zG2IjrSFkxBakshliQLvm3upY3wdHeXTwoMdd+x00LeyIIfP5Q5NYkNn1wcX+6CQI55B+vp0O6B0lg3vRl+eeBRV1ftea/7AuFKRspxGtf6nuhe20y4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LmNwG9Dc; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LmNwG9Dc"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-42808071810so72242065e9.1
        for <kernelci@lists.linux.dev>; Mon, 05 Aug 2024 07:26:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722868015; x=1723472815; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=su/FsHD0ceqTsgM6YDe8zZfz+p7m4T05VbwpoaYLND8=;
        b=LmNwG9DcrYgzi7Qb+JOryjpiMbNZV9kkuqd85miG4DTpchOjcJhoOVE0ZjMemHkGtW
         qAxo7bRnGwOk3JLClis2Iv2dgpGVn7dFRt/Y4hg4yTC6tkLeIZfRrfQkZ4zH4qd7aKAP
         9lkKo9HXPvLMdCFf+ro9QExyGBx2/04wbVdXJuMDR3Mc8QJ1HZ6r2w8Kkn7iDlNgf/pv
         m6iOKvMIRBGzsOvmVpw1rzB0JLjhE4G8ZMoco+2C2w0mXL3NzSBsAc9KpK26+WdntFPM
         SAxRqIJvJdCCVgTyGIHc3YZ6ZRx0gcbnZpI9r8viYux5Mfy/mkH/+ZF17i5tJ9qtY188
         jlmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722868015; x=1723472815;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=su/FsHD0ceqTsgM6YDe8zZfz+p7m4T05VbwpoaYLND8=;
        b=Xp8NwvJoI80XYMgXQCpT5LNXgGs0zFFybQQEfeXIgf6pnwL5fyCg9RAKsMQc9qMyas
         RxI5JX+ZmwSaup4VzbbdKd4Z9jV2mT9PVxFzsQHjJymg7xhZ2b2sSlpvnMQ1fIZYIG3h
         BT5eX1sBkeUqH5bwNqZIp8urkCLNpxYrGRYHdC1dnairDWsIr8nvb6W69/ifHBFG0a1a
         anXCoAsdIJbgdQq71hn1Fet2fTVUJ5a440JvHaQEgVZOuZnovHoXE2jC/bZ+3VgmF1kj
         BkL6h1jNmxmb8STCA5PghPcfZK35TFJ1e+/1JmrOWbO0V2ZctC6+W6O/izu1KH1nP1Kq
         gtXg==
X-Forwarded-Encrypted: i=1; AJvYcCUj9i5cNmGEYGqfojwSrVLvNV0Vby2R2UP/bI6rmLiaZoxu++YbGaQKo1LQfxgkc3V24xpziWJAmTtbYyogSGpXgCDVEEYpkN8=
X-Gm-Message-State: AOJu0YwL1Czhcf7BiapOccbvVnt0zPx7bE3AoptpfIh1XgKpDxVihe2A
	VGTzacQkRYPTr5rJCH5G0+YSzJoiz4Hjewvtxlwa1SffjB3RgcIr
X-Google-Smtp-Source: AGHT+IER1MqDkLZgCvmZplQ3ImFXljjmeq3+nmb2sdFDMGCmyOgmEXkXcoy8pxEnvIqTG09hYcMYUA==
X-Received: by 2002:a05:600c:3b0d:b0:428:387:79ac with SMTP id 5b1f17b1804b1-428e6aea8femr84934935e9.6.1722868015039;
        Mon, 05 Aug 2024 07:26:55 -0700 (PDT)
Received: from [192.168.0.118] (h-185-57-5-67.na.cust.bahnhof.fi. [185.57.5.67])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4282bb9d786sm201495235e9.44.2024.08.05.07.26.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Aug 2024 07:26:54 -0700 (PDT)
Message-ID: <e0d90418-5de7-41ed-8aae-872a717c10dd@gmail.com>
Date: Mon, 5 Aug 2024 17:26:52 +0300
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: KCIDB: Support non-binary test outputs
To: Mark Brown <broonie@kernel.org>
Cc: syzkaller <syzkaller@googlegroups.com>, Dmitry Vyukov
 <dvyukov@google.com>, Vishal Bhoj <vishal.bhoj@linaro.org>,
 Alice Ferrazzi <alicef@gentoo.org>,
 automated-testing@lists.yoctoproject.org,
 Cristian Marussi <cristian.marussi@arm.com>, Tim Bird <Tim.Bird@sony.com>,
 Johnson George <Johnson.George@microsoft.com>,
 Veronika Kabatova <vkabatov@redhat.com>,
 Guillaume Tucker <guillaume.tucker@collabora.com>,
 "kernelci@lists.linux.dev" <kernelci@lists.linux.dev>,
 Don Zickus <dzickus@redhat.com>, Philip Li <philip.li@intel.com>,
 Denys Fedoryshchenko <denys.f@collabora.com>,
 Michael Hofmann <mhofmann@redhat.com>,
 Tales da Aparecida <tdaapare@redhat.com>,
 Aditya Nagesh <adityanagesh@microsoft.com>,
 Jeny Dhruvit Sheth <jeny.sadadia@collabora.com>,
 Sachin Sant <sachinp@linux.ibm.com>, "Hambardzumyan, Minas" <minas@ti.com>
References: <5188d6fe-bd01-402b-a6e6-0fe57ef4d336@gmail.com>
 <bf0befaa-e23e-43f0-996b-d095b7390122@gmail.com>
 <41f4f4df-7587-42c4-b7c4-9e69bbf7d74d@sirena.org.uk>
Content-Language: en-US
From: Nikolai Kondrashov <spbnick@gmail.com>
In-Reply-To: <41f4f4df-7587-42c4-b7c4-9e69bbf7d74d@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 8/5/24 3:33 PM, Mark Brown wrote:
> On Mon, Aug 05, 2024 at 02:28:24PM +0300, Nikolai Kondrashov wrote:
> 
>> Here is the (abbreviated) schema for the new field:
> 
>>     "value": {
>>         "type": "object",
>>         "properties": {
>>             "integer": {"type": "integer"},
>>             "number": {"type": "number"},
>>             "string": {"type": "string"},
>>             "boolean": {"type": "boolean"},
>>         },
>>         "minProperties": 1,
>>         "additionalProperties": False
>>     },
> 
>> The meaning of the value itself depends on the particular test, that is the
>> "path" field value. Each property inside the value corresponds to a data type.
> 
> Might it be useful to directly specify units for use with "number" to
> help with normalising data between different CI systems or hardware -
> for example with boot times both seconds and miliseconds seem like
> reasonable units to use?  It might also be useful for UIs, though we
> could also do that with a separate table for the tests that they can
> query.  Perhaps I'm just worrying too much about specialist cases where
> it's likely that CI systems won't just be picking up an off the shelf
> suite that has standard units.
This is a totally valid concern. We could add a "units" field, e.g. beside
"value". However, I'm not sure how we could use it. Sure, we can put them next
to the value in the dashboard, which would look nice, but then we can also put
them into the "comment", as my examples do, and I'm not sure if we would be
able to do much with them in the database.

Even if we have the exponent separate, I'm not sure we can make use of it
(converting units on the fly won't work well with indices). I mean, we can
(and should) compare only values with the same unit, but which one, if we have
multiple? Both separately?

On the one hand I like having the explicit unit, on the other hand we can get
a similar result with simply using different test names for different units,
and have them specified in the comments, for humans 🤔

Nick
