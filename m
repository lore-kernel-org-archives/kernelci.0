Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71EF833F7
	for <kernelci@lists.linux.dev>; Thu,  8 Aug 2024 18:05:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723140329; cv=none; b=ZrUYIeYUzw4vSC9vkyPrzF6FnhJ8vjk5LWzFDMjNY3os2y+LZVV2aInWXw74vPj02SqM220kXSTfCxtvs9ehEjwHwvN4wkKvEspEBKO3QfBvRzSRxmKbiXURmLErrHuqgLN+q4a9XuyloV39VqvTEqKF8xWo4xj4tLb+FZtV1Ho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723140329; c=relaxed/simple;
	bh=Z9vMqQfHnfu6gsQ+N32QvoE3Wo/uxE/u4AlrtsuF+FA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aNAYos+WWnN22mec36g9cpn7Lvw7xnAfnxVTcjleslLdmDQzbICUrQdG6jm+s198UJvjESAzij27I/WNUqYwpTOfwYsvZmy/97sh6dpIbCWAeRqOw/Nx0ks8c6j+K8c9psU36aIzoPysGSq2cKpow6wgKW9xwWr7sAIn/r6p3L0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=eDKKAxEn; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="eDKKAxEn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1723140326;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=coVOFiAYB/0F2/le9BZMlj7zeGtc/N6cdj7RjF9oxOw=;
	b=eDKKAxEn8BRiDLX6B7Gvw6+bcCj2wjxLHjT2BtBvwNnYzelGazs7z2Vc7fcuTMjErdkmna
	ARj3UVITMOklBkWQmT6DkCCGZI8Y3l+LTDA9DiC5D/SjiHj31VJHSQ5IGbmyPdXjTAHzdl
	Z1TL/5b4bkTy1qZmVLjcTdHf49/glWM=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-640-Uj0THvjkOKS30HtgANrphA-1; Thu, 08 Aug 2024 14:05:24 -0400
X-MC-Unique: Uj0THvjkOKS30HtgANrphA-1
Received: by mail-lf1-f72.google.com with SMTP id 2adb3069b0e04-52f0108a53dso1487258e87.0
        for <kernelci@lists.linux.dev>; Thu, 08 Aug 2024 11:05:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723140323; x=1723745123;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=coVOFiAYB/0F2/le9BZMlj7zeGtc/N6cdj7RjF9oxOw=;
        b=Kc85KuYE/IEwKsnbLYRKaL5Ng627xgDkye0az6SbN9fkxIrLr1E3ebWsE1xkayM7RA
         y6LdDbmnqOW82cScE98vSIGS1+W/3Mn+MsehDfkSzJc2atBuLhbs2YxvxmBcraYzb23a
         4o4ZLJK2kY+01iaNhnnyF+xSGtHE6wXMfzsqrFUr4i9omlLkZvn+q9fzTzHOxm17WlHI
         xnhvPG2bR7RLQdq8ORlUAGYNX2q20QINCWwnjb8X8tcE7PNSFIJZw4aSHJZiT4Rmunq9
         39Mg7JGSWeLy2i1Gb3SDumRJE9T9ODblde7j/FnV0t/GNICabXZ1z8n7VzrJ9kAUUJxr
         OVFg==
X-Forwarded-Encrypted: i=1; AJvYcCWuJVvRZNXUFmKU/26047edSOIck92KqM75yZO0Hio4lYoBqT/sBONe6C/EhZC1NlDRspahqHitec+SLqhuklJhj5kg52xhMzw=
X-Gm-Message-State: AOJu0YyszNTL3skZBCCsjadVb3xrDpU8PUrqdQa+Uwy9gYjBd6NAOI9v
	ZekbfxQjCu9zOwguJb06Nj1M0qGQIG+UWVPlqAcukyU41+JKRynoEa6HuOLFtK7/WM4iCyxWOAe
	gvYWC6Sl0hSdCAfpLoa8NgCBod9RI8F4BbPv3KXOJ73jaJ+RBPyNRpRKK
X-Received: by 2002:a05:6512:ad0:b0:52c:9e25:978d with SMTP id 2adb3069b0e04-530e5887963mr1956614e87.45.1723140322910;
        Thu, 08 Aug 2024 11:05:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFyg+GnfdUL3nuhQOt+giTKpQpHSpKdhxLZJ3c0ejzlr0kcszYzK9KMSWp9dVKQLOSHBMT/HA==
X-Received: by 2002:a05:6512:ad0:b0:52c:9e25:978d with SMTP id 2adb3069b0e04-530e5887963mr1956578e87.45.1723140322055;
        Thu, 08 Aug 2024 11:05:22 -0700 (PDT)
Received: from [192.168.0.118] (h-185-57-5-67.na.cust.bahnhof.fi. [185.57.5.67])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-530de481efesm711482e87.286.2024.08.08.11.05.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Aug 2024 11:05:21 -0700 (PDT)
Message-ID: <43e16520-5a04-42b2-91ef-e25b435af179@redhat.com>
Date: Thu, 8 Aug 2024 21:05:20 +0300
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: KCIDB: Support non-binary test outputs
To: Mark Brown <broonie@kernel.org>
Cc: Nikolai Kondrashov <spbnick@gmail.com>,
 syzkaller <syzkaller@googlegroups.com>, Dmitry Vyukov <dvyukov@google.com>,
 Vishal Bhoj <vishal.bhoj@linaro.org>, Alice Ferrazzi <alicef@gentoo.org>,
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
 <e0d90418-5de7-41ed-8aae-872a717c10dd@gmail.com>
 <8c9b63b0-453d-4f2c-8777-66871ad7923d@sirena.org.uk>
 <813ff1ba-7d87-4afd-9852-c7ed598869c8@redhat.com>
 <7aebe4a6-fdea-4774-83bc-b293012db052@sirena.org.uk>
From: Nikolai Kondrashov <Nikolai.Kondrashov@redhat.com>
In-Reply-To: <7aebe4a6-fdea-4774-83bc-b293012db052@sirena.org.uk>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 8/6/24 10:20 PM, Mark Brown wrote:
> On Tue, Aug 06, 2024 at 08:03:00PM +0300, Nikolai Kondrashov wrote:
>
>> In that light, I think validation is the right way here. And validating
>> submitter-provided units could be the right way. This is actually similar to
>> the situation with test "paths". Currently we're accepting everything, but our
>> target is to tighten that down to help correlation. Perhaps by sending
>> (aggregated) warnings about unknown test paths to submitters.
>
> TBH as a submitter getting specific stuff back immediately (or at least
> the option for it) is really helpful.

Do you mean that you would like to know if you submitted something wrong
immediately?

Could you elaborate a bit here?

>> This looser approach allows us to admit new data to the database faster, as it
>> doesn't need to undergo cataloguing first. We certainly don't want to spend
>> time arbitrating *every* test name or a measurement unit at this point, and we
>> don't want to slow down adoption from CI systems, and introduction of new
>> tests. But I think letting them know about deviations could work. After all,
>> it's in the CI system interest to comply, as that improves result quality, and
>> raises the chance of reaching maintainers, which they're here for.
>
> Perhaps per test schemas of some kind (not sure how exactly you'd go
> about doing it) could help here, if the test is unknown then just let it
> in but if it's a test we know about and we've defined the units for then
> enforce those units?  That way there's the looser stuff and reporting
> that shows what we could work on standardising, and things that have
> been standardised are hopefully going to be more joined up?

Yes, that's the approach I was thinking about.

I'm not sure if we would be able to implement this kind of checking in JSON
schema, not likely. But we can certainly always implement a higher-order
check, which we can run on database data after it's updated.

>> However, I would leave it to the submitter to observe the correct exponent
>> (e.g. KB vs. MB vs. GB). We can perhaps standardize on units *without* the
>> metric prefix, and rely on either floating-point exponent, or larger integer
>> representations (like 8-byte bigints in PostgreSQL, JSON integers have no size
>> themselves) to handle the required ranges. This way the dashboard would be
>> able to display the units, *and* apply the prefix as necessary, automatically.
>> Or perhaps specify the prefix (or exponent) separately from the unit, so the
>> usual range would fit, but the dashboard could still scale the numbers on
>> display. OTOH, indices would be no use for separate value/exponent
>> representation.
>
> Putting the exponent in as a number does seem like it'd be much more
> helpful for machine processing.

It's helpful for normalizing to a single exponent, so data can be compared,
but that's not something that a database can do fast. So, not helpful in the
end.

>> And the final question we need to consider is how many people would actually
>> bother finding out what the units exactly are in their tests, and specifying
>> them?
>
> I suspect there's going to be a fair amount of stuff where there's a
> fairly clear specific unit for one reason or other that's commonly used
> when talking about the test (eg, things like I/O benchmarks, run times,
> or temperatures) so it'll be immediately obvious and also a bunch of
> things where the number is just a number for the benchmark and nobody
> cares about whatever the units actually are anyway.

Yeah, if we make the unit optional, and validate it only if it's specified in
requirements, then we can both have the cake and eat it too. That is have more
alignment where we want, and more freedom, where we want to experiment.

I'll post a new version of the schema with the optional unit string, which
would be expecting people to maintain it uniform, use wider data types, so
they don't need to switch the prefix/exponent, but would keep them constant,
and we can add validation later.

Thank you everyone for the feedback!

Nick

