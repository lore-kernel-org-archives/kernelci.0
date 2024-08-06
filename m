Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B69144205D
	for <kernelci@lists.linux.dev>; Tue,  6 Aug 2024 17:03:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722963790; cv=none; b=FMOp+BgtQFOdd54/zsdXpOSrPDGY2aNp3vzs7PzUnUoKd+CU3U0wkDGqOhIk/zWLTHD2tPGmfty6kRXn3eJ3/JDKxAjlndxe94FG5tzis3jVrNTOwU4Qov5jllIsBCt2NoCuONZab5uGP3I5ke5wz+zLO3Z+ZE1hhwjKI0Dzb9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722963790; c=relaxed/simple;
	bh=3K+4mwb2rA4RW1Xcb/LIA7kOHkDcnVRfgEKHsPYnIQc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JiwI342YUgpYdYnj2zmmE5M2uHJuZUlpqcQN8KxgXLqIQ9wpIaXl+r0Fx0IdM++f4bC1LwIrVwyinCxVtYuandpl+afTPtJ5GBsR6WHvYCCNb9A1E+McVAxL5xfeouTvpoAeSAgApou+FbjbPEP6Y83bsSGyZ6dOToz2QMfzfyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=RkOMPGEW; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RkOMPGEW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1722963787;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JrCiAggvm1RiuNtUyChYQ6iKRT1+eA0SNx+Ex0sNyss=;
	b=RkOMPGEW4ROxZPwuMybWmLbrwBV+DSAmrkDhH7sj+mfTTChpLn13r6ohl6BUw338dylATF
	xMrJG9kFTDnoJWj/38IlfoiN+31Q2D+PtxgwTgDOXWy52syb2rlVtBTcw8Jj3TLlbV6yp+
	wi537c5+UrxAzbEx6n3FT80GFcqPvKQ=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-655-iPDpHTfvOb2G6MacH3_mdQ-1; Tue, 06 Aug 2024 13:03:04 -0400
X-MC-Unique: iPDpHTfvOb2G6MacH3_mdQ-1
Received: by mail-lf1-f71.google.com with SMTP id 2adb3069b0e04-52f00c27b9cso972820e87.1
        for <kernelci@lists.linux.dev>; Tue, 06 Aug 2024 10:03:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722963783; x=1723568583;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JrCiAggvm1RiuNtUyChYQ6iKRT1+eA0SNx+Ex0sNyss=;
        b=MGS5pwV5c5qqgwNTxw1ifHeILW1YaXzrSwwVLcZd/vZGpJs/TLqlj+jsOByTt3nDMc
         WL41dSD2JLlhbM+wefTu3k1OTTxQPqtGmXubhhmmHDwqle4OYFTcL2ACrx3kSzksMMfN
         3qQWW1MM8rTGHoww9vfXGpRSWDCFbgUeAm0n6rdLfd7rl/GPrifXY3zIZ2Q7VTUS1IrC
         rI3i65wR5h5rYCPg1xDW/0NYjreyA4ya3Lhy38G8+A/vkySVYFYEdHH3Hf/AZfOfqxGT
         aAsWSyDb9JgQovFIuRC+SZIvh+73ZgmgHVtGRBhAgzM1S4gAq0UdNlbiR0TNVLbHzq/H
         ZidQ==
X-Forwarded-Encrypted: i=1; AJvYcCXbZNFBzZhlsFNI1lxkQ3SmagQP5fZBjKmxa8H6L6KZSb/kJdeMw15YEWzJkNiUENLSGO1BTWwMIvyNw1ZEGJ3hfUbzzOb6I2A=
X-Gm-Message-State: AOJu0YzRQvcmWuiOs7z+Hj8huvtPZFGLhj4ZywaWuEnXqbfNED/j9Skm
	0FhNqMdIKLUC90SfW6EtHMnWS/q3HyyH1F4HqC7ZN+KapgQWRLTzRx9Kk3wctlQz6tytxZU9ZSe
	XRIvXnrb2ckBsIQb0IEXVlejYRHJXf1jNpyRGBnz4fvMDQ7n72IhTI0SY
X-Received: by 2002:a05:6512:3b8c:b0:52d:b150:b9b3 with SMTP id 2adb3069b0e04-530bb3b6fb7mr10201203e87.32.1722963782620;
        Tue, 06 Aug 2024 10:03:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHYCBthisXHhr4MrKCQZwQ42+yTNXDKbIL4RE237iM2AA2N6b/S4ouIBaMRwJ3SgFQwqp5k0g==
X-Received: by 2002:a05:6512:3b8c:b0:52d:b150:b9b3 with SMTP id 2adb3069b0e04-530bb3b6fb7mr10201160e87.32.1722963781666;
        Tue, 06 Aug 2024 10:03:01 -0700 (PDT)
Received: from [192.168.0.118] (h-185-57-5-67.na.cust.bahnhof.fi. [185.57.5.67])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-530bba355d4sm1538107e87.215.2024.08.06.10.03.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Aug 2024 10:03:00 -0700 (PDT)
Message-ID: <813ff1ba-7d87-4afd-9852-c7ed598869c8@redhat.com>
Date: Tue, 6 Aug 2024 20:03:00 +0300
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: KCIDB: Support non-binary test outputs
To: Mark Brown <broonie@kernel.org>, Nikolai Kondrashov <spbnick@gmail.com>
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
 <e0d90418-5de7-41ed-8aae-872a717c10dd@gmail.com>
 <8c9b63b0-453d-4f2c-8777-66871ad7923d@sirena.org.uk>
From: Nikolai Kondrashov <Nikolai.Kondrashov@redhat.com>
In-Reply-To: <8c9b63b0-453d-4f2c-8777-66871ad7923d@sirena.org.uk>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 8/5/24 7:32 PM, Mark Brown wrote:
> On Mon, Aug 05, 2024 at 05:26:52PM +0300, Nikolai Kondrashov wrote:
>> On 8/5/24 3:33 PM, Mark Brown wrote:
>>> On Mon, Aug 05, 2024 at 02:28:24PM +0300, Nikolai Kondrashov wrote:
> 
>>> Might it be useful to directly specify units for use with "number" to
>>> help with normalising data between different CI systems or hardware -
> 
>> This is a totally valid concern. We could add a "units" field, e.g. beside
>> "value". However, I'm not sure how we could use it. Sure, we can put them next
>> to the value in the dashboard, which would look nice, but then we can also put
>> them into the "comment", as my examples do, and I'm not sure if we would be
>> able to do much with them in the database.
> 
>> Even if we have the exponent separate, I'm not sure we can make use of it
>> (converting units on the fly won't work well with indices). I mean, we can
>> (and should) compare only values with the same unit, but which one, if we have
>> multiple? Both separately?
> 
>> On the one hand I like having the explicit unit, on the other hand we can get
>> a similar result with simply using different test names for different units,
>> and have them specified in the comments, for humans 🤔
> 
> Just thinking out loud here but perhaps what we want is something in the
> ingestion path which either validates a schema that says "Test X must
> have unit Y" or normalises the units on the way in.  I think my concern
> is more on the write side than on the read side (modulo the display
> stuff), or rather making sure that what's available to the read side can
> be joined up.

So far, one of the major principles of KCIDB was "what you send is what you
get back", that is, it doesn't ever modify the data submitted by CI systems
(well, except perhaps some corner cases like floating point or timestamp
precision differences). I'm not saying we should *always* keep to this
principle in the future, but it *does* simplify a lot of reasoning about how
data is processed and queried. Also, the need to preprocess submitted data is
a good sign that your schema needs improving.

In that light, I think validation is the right way here. And validating
submitter-provided units could be the right way. This is actually similar to
the situation with test "paths". Currently we're accepting everything, but our
target is to tighten that down to help correlation. Perhaps by sending
(aggregated) warnings about unknown test paths to submitters.

This looser approach allows us to admit new data to the database faster, as it
doesn't need to undergo cataloguing first. We certainly don't want to spend
time arbitrating *every* test name or a measurement unit at this point, and we
don't want to slow down adoption from CI systems, and introduction of new
tests. But I think letting them know about deviations could work. After all,
it's in the CI system interest to comply, as that improves result quality, and
raises the chance of reaching maintainers, which they're here for.

And then we need to consider how many different test paths there could be. In
the past six months the database has seen 88122 unique test paths. Yep, eighty
eight thousands. Of course, tests reporting a value would be a tiny fraction
of those, but even if it's just 1%, that's still almost nine hundred paths,
seen in six months. Most likely we can do quite well with regular expressions,
as many of those are only a bit different.

So, we can have such a catalog, and for example only validate the matching
entries, instead of requiring an entry to be there before accepting the data.
That would keep it easy to send new data, but with the catalog you would have
tighter control for stuff you care about.

However, I would leave it to the submitter to observe the correct exponent
(e.g. KB vs. MB vs. GB). We can perhaps standardize on units *without* the
metric prefix, and rely on either floating-point exponent, or larger integer
representations (like 8-byte bigints in PostgreSQL, JSON integers have no size
themselves) to handle the required ranges. This way the dashboard would be
able to display the units, *and* apply the prefix as necessary, automatically.
Or perhaps specify the prefix (or exponent) separately from the unit, so the
usual range would fit, but the dashboard could still scale the numbers on
display. OTOH, indices would be no use for separate value/exponent
representation.

So, we could start with adding a string field for the unit, and e.g. an
integer field for the exponent (10^E), both stored in the database, and
combined for display. And we could add the validation later.

Or we can bake in the exponent into the unit, and make use of indexes, but
require people to pay more attention to them.

Oooorr, we could implement as is for the start, and add units later, when we
see the situation better, based on what's actually coming in. This would help
us implement the dashboard support and regression tracking easier. As we would
only need to correlate across test paths (and other parameters, of course),
without the need to add the units to all the queries and considerations. The
submitters would be able to clarify the units in the test paths and the
comments.

And the final question we need to consider is how many people would actually
bother finding out what the units exactly are in their tests, and specifying
them?

Sorry for the wall of text :D
Thanks for reading!
Nick

