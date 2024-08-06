Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3C78381C4
	for <kernelci@lists.linux.dev>; Tue,  6 Aug 2024 17:32:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722965557; cv=none; b=PUSDwqiAA55WR3xnV4/QfLUXwTlYDBXAVTlYcAoU/Rpd/EgK3d2R5o6rk9PtBiNGgXmthJ0rQhmrWtF72Y9mt+KCDOeJmAd/lQiyC0IUT14EOvrNoOS0OOy3DmMwrBmUERwLMGPQM0fCSzdq+JaRWpsLRjfANZxuDSt4qhWio3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722965557; c=relaxed/simple;
	bh=3oEXCvzGsQnpNJkp0b2prIjGxmyqyB8o4xql+8Eh8o8=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=e6X5w6YOJZ1nQH43H0bioV7EhSCqgLtS5ZYFT3bNxFW1ifEtif00gFI36ms/kQEEIgsUy6ABZtS1cjPcym0OPH9rbL4QH2tCN64GcEogZNb+pp32qHK3aB6JCl9x9b+Mw+49iGj6tbI+jYYea6vTbB5A2Rx7q8Qy4e8qlKNaB5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=BVvRRWRP; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BVvRRWRP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1722965555;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4DPG/xBV2pK2C0gZ2NVQD+a/ZF0cmjwbf3bDUu07Cck=;
	b=BVvRRWRPpS3R3icPkYfp9uDST0HLGeEYeNIAU1BR3KHEluWY+fnj6meLAco4FKetjxNF/a
	PW0w/GEmgDrotDbgd+xeiMHkiZ6dZdM8KJeFDEZf2VfuKJIEAteYjDsOuitFO4ddSx1fyF
	lrobFMfsEtwNe1kJWnnV2BbJxFwDC0A=
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com
 [209.85.208.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-86-mR4-kRvUOUiM2JzSP4x9Pg-1; Tue, 06 Aug 2024 13:32:33 -0400
X-MC-Unique: mR4-kRvUOUiM2JzSP4x9Pg-1
Received: by mail-lj1-f197.google.com with SMTP id 38308e7fff4ca-2ef244cdd30so10736411fa.0
        for <kernelci@lists.linux.dev>; Tue, 06 Aug 2024 10:32:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722965552; x=1723570352;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4DPG/xBV2pK2C0gZ2NVQD+a/ZF0cmjwbf3bDUu07Cck=;
        b=NZHMUX1c/mD6dJ9hnO7/ey8LMDpNaWD94CF4ul0UEE/reC212mDj96p0kjbvo44Bfz
         QbnvbuOCudrjn9tkkFHyqH8i6Rwa1ccUktgDVMSDxFz3FGwWgJp4Mfjc1sO1chZZljIy
         GDcYv3yNGFTBFLo8zPuhbgJ4GV9uuQ5cq8gEV7kLz2DeFIj/d4w7GBvYnMpC0KZYxg9u
         Oj/PCpCKC+rBqkTuwRwqh9lsdQF79HtafA0TDEK8/ABbJzahLFTzcn0InXzi8fFT3VpX
         Nb/UJg9dSw063XBkNqs98CkamP5q1qIY9oiGSWhr6+9hR5pjLyLrdzvtH02QGW9IoXZv
         uwtg==
X-Forwarded-Encrypted: i=1; AJvYcCWHx1F4zHeWZ27I1iMKRfWj0BdHPRgPSLUSCS+OV0oWvTkq9tJ3x+LyciNqXlyWw14fjf7rTsgpX8nymbHofqXWE6cHAgKuGoc=
X-Gm-Message-State: AOJu0YyHGFWJvABTkBEyWl80cb+JBDIVPILOZ1nylvdo67w42y0IlaA1
	37TEMKZGuRh2M9wvDADbCu+cb62tSG5+IVXJNOayr259U+qBc3hwf6zPfKgZNCKcp17Ma39ZpwH
	bMDX3s981wv/NvE4iQcCJ+W9qaxLIznhgtc574ZG2JT2g2/PXSHX0kZxX
X-Received: by 2002:a2e:8456:0:b0:2ef:286e:ca68 with SMTP id 38308e7fff4ca-2f15aac2b49mr98506321fa.23.1722965552177;
        Tue, 06 Aug 2024 10:32:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFfilMSw032Pgr4xy9RThqsClEWcHC2kMjUb2ZZsD5b2iy4vmmK7WeJVtMVMcZuCWf8vYQuPQ==
X-Received: by 2002:a2e:8456:0:b0:2ef:286e:ca68 with SMTP id 38308e7fff4ca-2f15aac2b49mr98505681fa.23.1722965550711;
        Tue, 06 Aug 2024 10:32:30 -0700 (PDT)
Received: from [192.168.0.118] (h-185-57-5-67.na.cust.bahnhof.fi. [185.57.5.67])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2f15e27429dsm15552021fa.137.2024.08.06.10.32.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Aug 2024 10:32:30 -0700 (PDT)
Message-ID: <8c91339c-4150-493c-ab73-318ad4f5f238@redhat.com>
Date: Tue, 6 Aug 2024 20:32:29 +0300
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Automated-testing] KCIDB: Support non-binary test outputs
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
 <BN6PR13MB3041F310826A4245F2B04DA9FDBE2@BN6PR13MB3041.namprd13.prod.outlook.com>
From: Nikolai Kondrashov <Nikolai.Kondrashov@redhat.com>
In-Reply-To: <BN6PR13MB3041F310826A4245F2B04DA9FDBE2@BN6PR13MB3041.namprd13.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 8/5/24 8:02 PM, Tim Bird wrote:
>> -----Original Message-----
>> From: Nikolai Kondrashov <spbnick@gmail.com>
>> On 8/5/24 12:56 PM, Nikolai Kondrashov wrote:
>> The support for non-binary test outputs introduces a new field to the "test"
>> objects called "value", being an "object" itself. It (and its abstract
>> meaning) are supposed to work together with the "status" field. That is, it
>> should only be considered when the test has actually executed. I.e. with a
>> "FAIL", "ERROR", "PASS", or "DONE" status only. Normally "DONE" should be
>> used, when the value is the test's output, and not an auxiliary value.
>
> I'm not sure I'm reading this correctly, but as I understand it, this
pre-supposes
> that the value and the testcase are synonymous.  Is that right?

Yep. But don't take the meaning of "testcase" too literally. You can report as
many "synthetic" cases as you need, to report your data. They don't actually
have to correspond to actual "testcases". View them as a tool to express your
results. Just make sure you get the agreement of anyone else reporting the
same data on how you're going to do it.

> Are there values that are not assigned to a testcase?

I don't know? I haven't seen the gamut of the data we need. However, we can
always make up a "testcase" and assign them there, if needed, as I say above.

> In my experience, many tests (particularly IO performance tests) produce
> a whole lot of values (basically a matrix for combinations of different IO
sizes,
> IO direction (read/write), patterns (sequential vs random), and scheduling
> classes).  It's quite common to have a tester select only a few values to
> convert into testcases (that is, items that would cause a test to pass or fail).

Sure. To decide which values you want reported explicitly, consider which ones
you want KCIDB to be able to track, graph, and report deviations on
(eventually). You can put the the complete data into our free-form "misc"
field, if you'd still like to be able to get to it (but not query or analyze
it within KCIDB).

>> The meaning of the value itself depends on the particular test, that is the
>> "path" field value. Each property inside the value corresponds to a data type.
>> At least one must be specified, but if more than one type property is set,
>> each is considered a different representation of the *same* value, and not a
>> different value. E.g. these can be specified at the same time: "integer": 1,
>> "number": 1, "boolean": true, "string": "true".
>
> I'm not sure what the intended use is for these different type properties.
> Almost universally, benchmark data is expressed as numeric values (that is,
> numbers).  Are these other types used to hold intermediate formats?
> If so, for what reason?  I would suggest dropping the type field, and just
> making them all numbers.

We don't really have a type field, we just have separate fields for different
types. I don't really know what types we would want. I just showed some types
there, mostly as an illustration. But I think we might need the floating-point
and the integers separately, so different precision requirements could be
satisfied. That alone is enough to require us to support different types.

Regarding the strings, I suppose some tests (perhaps not performance ones)
could produce some discrete categorical outputs, and then we would be able to
graph and track them. But again, I haven't actually seen any.

The boolean was added just to completely cover the atomic types, although I
could probably think of a usecase, we can easily drop it, as well as the
strings, and add them when necessary, no problem.

Nick

