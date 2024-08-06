Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E0CD52F9B
	for <kernelci@lists.linux.dev>; Tue,  6 Aug 2024 17:18:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722964721; cv=none; b=jIdn6tX8o+053sCnjg6jLisLwLkQDRkmUW0kvzy7Gs5l4dsW1E+K1y3U9KKPHouGaknagMJOaYibhbXBBx7+jRTHzDZg3wsUSsp70S7A2TU21Lo1FoP1N76pY/gKIfOTNR8YJZB4eXSbwt3JXMcNIMcovIhI6L1Rj4Moa/SLpWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722964721; c=relaxed/simple;
	bh=lDmyYDQTwt8iXDykpqqWbmp337OvXVH2Doh47JwZSH4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oUkximpQm56C9q1PUB4JjYPVyYwCnD1Q9njUl12gWpp6JZ1c7oxQ3qGB2T/d5hxf49EXvdgYefK1J4MtRtyZT5/8u7OFZSM7mfnrzSkDFOV4MmT3Z8zuFuLBQgkKLTAWlwobSvYvOVG6voy6D57NhNt36xuhl9JWnHz5VMOIXl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=HqJpTYh9; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HqJpTYh9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1722964719;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ORy6UU0oMut93e/Jk05sbWrNVIKWlQ5m5sr0U1vmiYQ=;
	b=HqJpTYh9U89eVDtO9eunfOaayi8YeKw6C4F2yQBSo3flb1YNgKGKXuQ/tUwnhMrn7qTMhq
	T/E81V7MXr3oVDKESDYES/XM4w0aobzIHHPb0c0uo57+9PUnQgH1xgXh3tTNAKpKzYZzRf
	2NgtL55Q+naYNVPxO+er73xOowebTbg=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-218-MwwgbuaIPc2vzM7lBdeuIQ-1; Tue, 06 Aug 2024 13:18:36 -0400
X-MC-Unique: MwwgbuaIPc2vzM7lBdeuIQ-1
Received: by mail-lf1-f72.google.com with SMTP id 2adb3069b0e04-52efcb739adso1022069e87.2
        for <kernelci@lists.linux.dev>; Tue, 06 Aug 2024 10:18:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722964715; x=1723569515;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ORy6UU0oMut93e/Jk05sbWrNVIKWlQ5m5sr0U1vmiYQ=;
        b=iABasKjtYy9CFuj9wpGvshzZtS+KPfmS1N+/oAHt23sqyVcaNBEx9Nw6RLoQIrenfT
         YmOhZjr31IsOcRCtMBBFsIqKk8KMuFLF/1JOamVGUhHsNF2xVLIHuMr9VD3o81//H5YY
         dy0Iudz77qQvBrGDJTaB3z3cTMMqQUM5swALDFdnb27nI16GltKZXu6xAcvoCPUMbyfP
         22lBWnaecUQIBJfTQm2kcCOiN9+F94kAmA4iE+cK89eoS17yXpXKE6cmjv3WS/+W2Plp
         uZB7tfhNVzXyIsmV+ODJvwCu7JELZTG1C1Hh+Fp2SRojmNIkxZ6bKgHM5VAHrJ8ijxbA
         W7dA==
X-Forwarded-Encrypted: i=1; AJvYcCXiVdyzuQMttIb5MNVqwV5Ho1MZIEmaHdW4pO5XfyhTbaqMm9IXhd6fMPlrgjPQSVDFnuFmxWUcbNAm2JGi7+RK5mRryAR6ySY=
X-Gm-Message-State: AOJu0YyZRHoCeJRePaqCffupXcudYd6JZLuzABMqNIfnjJuI99O+yGRz
	axzZmYfp9/HjFYmYDTlQ6k64oDbWVjTnrTvaMqAip+Nxuxkq8DX1SkZt1UDfvbgcYjRT7cHKACX
	GTUhMeB+PEy6wIGF0/yUJvMUJnTZtI5XZ7g0yJCGoU1LSyh5jeskBC0hw
X-Received: by 2002:a05:6512:3403:b0:52c:8979:9627 with SMTP id 2adb3069b0e04-530bb39d224mr10413624e87.3.1722964714752;
        Tue, 06 Aug 2024 10:18:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEBt6tov/hZ3mrrepDPl2W4vOmsWRLUI3A1Rx0qR3Lkf1bRKJK7TTRQ9HrbZgYISDmETVqCNA==
X-Received: by 2002:a05:6512:3403:b0:52c:8979:9627 with SMTP id 2adb3069b0e04-530bb39d224mr10413584e87.3.1722964713797;
        Tue, 06 Aug 2024 10:18:33 -0700 (PDT)
Received: from [192.168.0.118] (h-185-57-5-67.na.cust.bahnhof.fi. [185.57.5.67])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-530bba111ccsm1561147e87.108.2024.08.06.10.18.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Aug 2024 10:18:33 -0700 (PDT)
Message-ID: <9d4a252b-ad58-4d38-bd4e-35e8edd1f704@redhat.com>
Date: Tue, 6 Aug 2024 20:18:32 +0300
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Automated-testing] KCIDB: Support non-binary test outputs
To: Tim Bird <tim.bird@sony.com>, Mark Brown <broonie@kernel.org>,
 Nikolai Kondrashov <spbnick@gmail.com>
Cc: syzkaller <syzkaller@googlegroups.com>, Dmitry Vyukov
 <dvyukov@google.com>, Vishal Bhoj <vishal.bhoj@linaro.org>,
 Alice Ferrazzi <alicef@gentoo.org>,
 "automated-testing@lists.yoctoproject.org"
 <automated-testing@lists.yoctoproject.org>,
 Cristian Marussi <cristian.marussi@arm.com>,
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
 <BN6PR13MB3041EF1CCE58C02289F9AE6FFDBE2@BN6PR13MB3041.namprd13.prod.outlook.com>
From: Nikolai Kondrashov <Nikolai.Kondrashov@redhat.com>
In-Reply-To: <BN6PR13MB3041EF1CCE58C02289F9AE6FFDBE2@BN6PR13MB3041.namprd13.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

(Sorry, re-sending, as I lost all recipients accidentally on the last try)

Hi Tim,

Thank you for your responses!

On 8/5/24 8:11 PM, Tim Bird wrote:
>> -----Original Message-----
>> From: Mark Brown <broonie@kernel.org>
>> Sent: Monday, August 5, 2024 6:33 AM
>> To: Nikolai Kondrashov <spbnick@gmail.com>
>> On Mon, Aug 05, 2024 at 02:28:24PM +0300, Nikolai Kondrashov wrote:
>>
>>> The meaning of the value itself depends on the particular test, that is the
>>> "path" field value. Each property inside the value corresponds to a data type.
>>
>> Might it be useful to directly specify units for use with "number" to
>> help with normalising data between different CI systems or hardware -
>> for example with boot times both seconds and miliseconds seem like
>> reasonable units to use?  It might also be useful for UIs, though we
>> could also do that with a separate table for the tests that they can
>> query.  Perhaps I'm just worrying too much about specialist cases where
>> it's likely that CI systems won't just be picking up an off the shelf
>> suite that has standard units.
>
> I'll second this.  A number of benchmarks output their values in different
> units, depending on the performance of the system, and it's valuable
> to be able to detect that different units are being used, in order to
> compare results effectively.  For example, some IO tests will report KB/s
> on a slow machine and MB/s on a fast machine, for the same measurement.
>
> Tests sometimes need a policy for which unit to be the canonical one for the
> test (and to express reference values  in that canonical unit format).  This
> might require a test results parser to do units conversion, before comparison
> with reference values in order to detect testcase results.

JSON doesn't really have an integer or floating-point size, so I would prefer
that the submitting CI system stuck to a single exponent / metric prefix in
their reports, and scaled the values itself, to help us avoid (complicated)
pre-processing, and help the database indexes improve query performance. And,
after all, they know their tests best to pick the right unit/scale.

If we agree on prefix-less units, for example, then the dashboards would be
able to scale the data and apply their own prefix, as needed, automatically.

Please also see my response to Mark, for more considerations.

Thanks!
Nick

