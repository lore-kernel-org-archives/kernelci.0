Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC5B81482F4
	for <kernelci@lists.linux.dev>; Fri, 16 Aug 2024 18:07:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723831662; cv=none; b=O4eF4wPo/nyuyzIQ0Pi9VJg3GxvQnlM66Ew14DHEdCO+QCyQ7W7k335Q056P1TB2pN7aDfWhuo69K13UE2ahSjhZ3ZJbJmwJ8hFmdTXjQO8JkP1gzJx1earNfo4z1bQwEc5zDMFTN7nhiojtG3E/vArNkqNjH43xA0vaOFELvdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723831662; c=relaxed/simple;
	bh=6o22oyKG6XHUtS1r0luiIRNtZWHqxmtyqmr4K4ft52k=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=oNNIwuO/cjjBxWShAit0Z82JEjSBhTyUZ5iZk1ZTMIazX/WskF2IYCTDCYCXtWz17z8MCcS0vKDsgueR6ZWVjl2UYt9BzAxnWdQiEN6euEugH3xv37wt17/1kz4/zhjP3LqVpKjxAzqFsdoIHknItMmU1dSpais4JULWPlIYORA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ciiRsjpK; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ciiRsjpK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1723831659;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2wvuhF+wlA7dO16n27CnPINZOpwdkMH0eiMCj+hBVbw=;
	b=ciiRsjpKOu5pAyxWPUw4+h6TnILKDY3F0lvvQxqbxtZwgtODSAsPrkgaoeHtjwgq5UlIeP
	KHdCcNqr5Uqax/2rh/VL0geW3Ljc+b5JHn4GzW1PrIo1T8kUin6G6kLRk6AXT9v1/GSxB3
	qJmTxwMskJmuPxOyEpSEoMtqek/ea30=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-354-OfY-ROlcO4emZ5ql4AD7Gw-1; Fri, 16 Aug 2024 14:07:38 -0400
X-MC-Unique: OfY-ROlcO4emZ5ql4AD7Gw-1
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-3718c0b4905so830937f8f.2
        for <kernelci@lists.linux.dev>; Fri, 16 Aug 2024 11:07:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723831657; x=1724436457;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2wvuhF+wlA7dO16n27CnPINZOpwdkMH0eiMCj+hBVbw=;
        b=xSTylX+wKxABr/L6h7vBqrrUa/EO15CK9IhSBbEq0qIueu5YGQPythZ0lWTjhVKFuF
         er4ADC3dCvNb5YTjqpeQn4FuONGppDwF/2i7MUQCOCz/ygh0eQCLBlwTn1oGb/h1va7w
         xiY53yk9ch4OtefqxSGcdSD/eigdtEPGygYrRcNbIHgXQCi/Zo+HgvYO3SCanuh274+p
         1zhrusDd01sEBeNZhIhQZfRdTQQFmqBWu/UfH4kiUwG6T7PryGqbFW62+NumvAHRXl9W
         KIhPGoxvr5ejJhPCC+S8o/jzkFOh+BRMQTIo4HGqVMxfTFjzvZ/OS5EgbETmeYP/U0WY
         QFyQ==
X-Forwarded-Encrypted: i=1; AJvYcCWdrHL7dXgtjZH1jG/6f5gq/Rg/RhgpPbnbRK3/904WxjWpVsM99hX9Qtckc7ZaZZooOhhAHVP6SejUqmXbXLgA5rjFq8+ESz0=
X-Gm-Message-State: AOJu0Yz8VCd80Ze/8KuxV/bRRnWv7ecKWp0H5kzw8KRUzpxMsttZO8bI
	RSnR14aZVRNh2MsbXDV1rg89QwwkBBTY/wBIAmiLbqbtCZoTHZFp1TWfruEfd6+N/ykwOSGs5rA
	UlCsIzfaiXyQqnCMKnJJFW0ji0oMbz5T5a2H8zHuTb+ZQsmIfRidVJpZ0
X-Received: by 2002:adf:ec83:0:b0:371:8cc1:2024 with SMTP id ffacd0b85a97d-371942a060cmr2940691f8f.0.1723831656679;
        Fri, 16 Aug 2024 11:07:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGsCbSHLaV+ZTSYtcro+vTfSRR1+MyY160s+aZePrjngXqYrlCJD6M5zqAzneS/KxlMlEBwIA==
X-Received: by 2002:adf:ec83:0:b0:371:8cc1:2024 with SMTP id ffacd0b85a97d-371942a060cmr2940644f8f.0.1723831655728;
        Fri, 16 Aug 2024 11:07:35 -0700 (PDT)
Received: from [192.168.0.118] (h-185-57-5-67.na.cust.bahnhof.fi. [185.57.5.67])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3718985d9d6sm4097844f8f.64.2024.08.16.11.07.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Aug 2024 11:07:35 -0700 (PDT)
Message-ID: <065fda9d-83ea-458f-87da-4f8c0b17f11a@redhat.com>
Date: Fri, 16 Aug 2024 21:07:33 +0300
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Automated-testing] KCIDB: Support non-binary test outputs V3
To: Tim Bird <tim.bird@sony.com>, Nikolai Kondrashov <spbnick@gmail.com>,
 syzkaller <syzkaller@googlegroups.com>, Dmitry Vyukov <dvyukov@google.com>,
 Vishal Bhoj <vishal.bhoj@linaro.org>, Alice Ferrazzi <alicef@gentoo.org>,
 "automated-testing@lists.yoctoproject.org"
 <automated-testing@lists.yoctoproject.org>,
 Cristian Marussi <cristian.marussi@arm.com>,
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
 <944bf5c2-6914-4c28-86d9-6dbbab450363@gmail.com>
 <BN6PR13MB3041F60A657804ACDEB94409FD812@BN6PR13MB3041.namprd13.prod.outlook.com>
From: Nikolai Kondrashov <Nikolai.Kondrashov@redhat.com>
In-Reply-To: <BN6PR13MB3041F60A657804ACDEB94409FD812@BN6PR13MB3041.namprd13.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 8/16/24 7:43 PM, Tim Bird wrote:
>> -----Original Message-----
>> From: automated-testing@lists.yoctoproject.org <automated-testing@lists.yoctoproject.org> On Behalf Of Nikolai Kondrashov
>> On 8/16/24 1:03 PM, Nikolai Kondrashov wrote:
>>
>>     "number": {
>>         "type": "object",
>>         "properties": {
>>             "value": {"type": "number"},
>>             "unit": {"type": "string"},
>>             "prefix": {
>>                 "type": "string",
>>                 "enum": ["metric", "binary"],
> 
> What is the purpose of the metric/binary enum?  Is it to disambiguate the meaning
> of K and M in unit prefixes?  Is it only for display?

Yep! Only for display. For those people who prefer **real** kilobytes :D

Taking the previous example:

    "value": 5.12e5,
    "unit": "B",
    "prefix": "binary",
    # Display: 500 KiB

And changing the prefix to "metric", produces this:

    "value": 5.12e5,
    "unit": "B",
    "prefix": "metric",
    # Display: 512 KB

Which could make some old-school people feel robbed.

>> And the rewritten examples:
>>
>>     "value": 42,
>>     # Display: 42
>>
>>     "value": 3.14159,
>>     # Display: 3.14159
>>
>>     "value": 720,
>>     "unit": "KB",
>>     # Display: 720 KB
>>
>>     "value": 145000,
>>     "prefix": "metric"
>>     # Display: 145 K
>>
>>     "value": 1.6e-7,
>>     "unit": "s",
>>     "prefix": "metric",
>>     # Display: 160 ns
>>
>>     "value": 5.12e5,
>>     "unit": "B",
>>     "prefix": "binary",
>>     # Display: 500 KiB
> 
> 
> Looks good to me!!

Awesome!

Thanks, Tim.
Nick

