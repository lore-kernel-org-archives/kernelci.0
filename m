Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A27D41AC8B8
	for <kernelci@lists.linux.dev>; Thu, 15 Aug 2024 15:30:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723735807; cv=none; b=rgpUD/Q337ZkGAJ9unac74ZL9nfH0qniQszPBNLR02mGnYWYsKIdmWfljvi8ILGSsdlQVMTSyoERyd+hJwIFnoyJOZfL0UbKvqTeRnUw1i4TEugBUShfa6nLWtf0R68fZeGDupeC5/kA/XRLz+her8tSM8+hpo6GMqPJYWk5h0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723735807; c=relaxed/simple;
	bh=W786KEu2A0ItWIuUuC7JKoUykld2sc1W79+8t6KU25w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IwM81PS1sK97FT4TUY2va8LcFSWrxGGFcQvkdBzUYL3xSdywlCtTKsHAFlpXE9Ll6mgzSOO0v+4lqlF4vIky6ywBSK+RplYo7qVPBP94Gn64Q6/JDnsX1TselNjKlUcXLVJI+85+9euqEfN/MCeoWrdlSKgdW5rRUYtUBX2wqqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Hz6gJHG4; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Hz6gJHG4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1723735803;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gy4uzwPqxfStcetdFFsRFK1bMGhSX1ZHcLjxWA8KAsc=;
	b=Hz6gJHG4apV3szi+k3c8Ya7OZ8ov8JsfiHZTfcjRY04GHlKo1mh+rvPssG10/mWkey2cs2
	eV6d5bZwSy49BqHSkEwDgmrTQS1M48LarHpcjsMsYjTeTZmUsQkK6s3/pRXowbb5mUPwoD
	o+tihZKKv8vUxeljMPoOCpOupnCrZnA=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-154-d4ORlzyKMTeZIyDI1u5bbg-1; Thu, 15 Aug 2024 11:30:01 -0400
X-MC-Unique: d4ORlzyKMTeZIyDI1u5bbg-1
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-371845055aaso538364f8f.3
        for <kernelci@lists.linux.dev>; Thu, 15 Aug 2024 08:30:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723735799; x=1724340599;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gy4uzwPqxfStcetdFFsRFK1bMGhSX1ZHcLjxWA8KAsc=;
        b=o/ytOszXNv3gOO8191m0KjJHHXdi7OfZspMo6Iv5iuh3XonREuoqloJN6Nv2ke4dzi
         c29XRRJD5tBu4fmlgaZjLy33z34DGYx2YKDuBeisEylcUPbnVZ3GGraKRWH3sx0Aj8LO
         xTMhOSLnubgvtLeyFaH4+Dbda/J3Wd3RIGfKJkmQE1UzPFjldyVJqC/tKhmTzaVj0ZYR
         TMqr1EiyvXEiT0BJEfpnA/SPB7gPdGsxLInVRD+iA8QS+QCT/j+jpAAF6uEdyCY0mGut
         f7qsbpsoUbuH67tQcqLcK6JlcqjyJ8Kermyf1TjSsrWxhTX4xWCqtaJaF3GmSBr25H9i
         i1bg==
X-Forwarded-Encrypted: i=1; AJvYcCX/dWTvYAYnghWHbBYiAUOAjz7yDTpw/2rmpxJlhddO/bjOpbuZRkcV0DrojPZV9Uh1vn+c9aHwGYroNYwgfyQD9cdo3oDU9XQ=
X-Gm-Message-State: AOJu0YwS8T7otT3AcUAOazJtA/PLOKv34PxR32guMapeUevspvVv5tfe
	JnliVWvttHtS9x12pHrncDTdNwTKBfidpHri7wUcdjPQU8H8FhaDEtxweXB9vUmFWsgUlXMzkie
	43loP0P/0mKzgtvBlbUABTj+Qijkd+jHGMgasnzOHVTJin446oWm1g/eW
X-Received: by 2002:a05:6000:2ab:b0:362:8201:fa3 with SMTP id ffacd0b85a97d-371777918afmr6135181f8f.34.1723735799359;
        Thu, 15 Aug 2024 08:29:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFdoQNnS6NClN36LcZdszWN2S+0urTI+VeoaZ85SOv9d80Wgap/bMLd5D+NuSylI2Oo6piRPQ==
X-Received: by 2002:a05:6000:2ab:b0:362:8201:fa3 with SMTP id ffacd0b85a97d-371777918afmr6135136f8f.34.1723735798547;
        Thu, 15 Aug 2024 08:29:58 -0700 (PDT)
Received: from [192.168.0.118] (h-185-57-5-67.na.cust.bahnhof.fi. [185.57.5.67])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-429e7bfdcd5sm22466695e9.1.2024.08.15.08.29.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Aug 2024 08:29:57 -0700 (PDT)
Message-ID: <bab88745-535f-4cb8-81b2-ad1e906b8e53@redhat.com>
Date: Thu, 15 Aug 2024 18:29:56 +0300
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
 <43e16520-5a04-42b2-91ef-e25b435af179@redhat.com>
 <ZrUg0MoK6g3yLQfG@finisterre.sirena.org.uk>
From: Nikolai Kondrashov <Nikolai.Kondrashov@redhat.com>
In-Reply-To: <ZrUg0MoK6g3yLQfG@finisterre.sirena.org.uk>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 8/8/24 10:47 PM, Mark Brown wrote:
> On Thu, Aug 08, 2024 at 09:05:20PM +0300, Nikolai Kondrashov wrote:
>> On 8/6/24 10:20 PM, Mark Brown wrote:
> 
>>> TBH as a submitter getting specific stuff back immediately (or at least
>>> the option for it) is really helpful.
> 
>> Do you mean that you would like to know if you submitted something wrong
>> immediately?
> 
>> Could you elaborate a bit here?
> 
> The whole workflow where you push data in and then check to see if it
> appeared in the dashboard can be a bit obscure if you're trying to get
> things right.

Makes sense. How would you prefer it to work? Throw an exception with details
of the problem when submitting using the Python API, and abort the
kcidb-submit with an error message when using command-line tools?

Do you validate your data before sending? We can add something on top of the
schema there.

I think there would always be "soft failures" of one nature or another, that
shouldn't prevent the data getting in, but would warrant eventual resolution.
Would you like to receive them as e.g. a daily digest, via email?

>>> Putting the exponent in as a number does seem like it'd be much more
>>> helpful for machine processing.
> 
>> It's helpful for normalizing to a single exponent, so data can be compared,
>> but that's not something that a database can do fast. So, not helpful in the
>> end.
> 
> It might be helpful on the read side though (ie, doing it as part of
> rendering rather than in the database itself)?  Not so good for queries
> but useful for UIs.

OK, I'll send a new version of the schema with units and exponent added, and
we'll just see how it goes.

Thanks for all the comments!
Nick

