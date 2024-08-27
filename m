Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 227D419E80A
	for <kernelci@lists.linux.dev>; Tue, 27 Aug 2024 09:42:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724751751; cv=none; b=rANBM3IPqDFtJYcR7vyc9tpAeTrdMW1AzJF/x5oruZPCKiBHLEAaEyN/k5Jq8/LUkQk2a99E0Tkg/fertQYi74Fb2fpEXLr2bbjfsbL/r0CXJyQYpmGy0QLQxEzIyLL7O+wqylblbfXlglIDK73v+UTrA8kesNO9z4pq8lMiGwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724751751; c=relaxed/simple;
	bh=ttMj7XeSfB8DfmnUClZEAZVItK6fyJ42OsdwOIy7GN8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=s9yczz1+AMMAFu2IrlUV8vblP3AexKPeQ/8oq1NHLu9FY0rAL0rFHtmC/EOMBzcoFPoPAXu3AHOQHqCPA9sCfDYNYzwsexMCHzTbayLUuDqa85VcGoHMfqUhpzRALKXL00ECypFB1i+Zzln2BNVrv1LrK+Bsc7Px0xtVAuWC+T4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=XnKu2eBX; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XnKu2eBX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1724751747;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GxzTHtMMoL3TVhhx7SXu9FINxiwoE4OmQyH1dDeefFE=;
	b=XnKu2eBX4rPTa1fAY7fjBB6SfHdjHyRomnJPtr2RVcybWYvVrly8692XlEE6qHcg8w6g4L
	0KpTFCfimhNtRjVhltt7hfj4r6WHjv3dWlHFGRmKeC642z5PXNetUb/DLA3Yz6LtIY6JjA
	aazopR+sLLNqfLUvXqaRJBzo3oKIXhY=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-48-o8mW6aTmNtaXPgUDAs2nsQ-1; Tue, 27 Aug 2024 05:42:24 -0400
X-MC-Unique: o8mW6aTmNtaXPgUDAs2nsQ-1
Received: by mail-lf1-f69.google.com with SMTP id 2adb3069b0e04-53440ff1ecfso356245e87.3
        for <kernelci@lists.linux.dev>; Tue, 27 Aug 2024 02:42:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724751742; x=1725356542;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GxzTHtMMoL3TVhhx7SXu9FINxiwoE4OmQyH1dDeefFE=;
        b=apiSEuSn4BMLEfF5zEYyOYY5FWgrLmh/2IiXbO3b8XHO8Zz+sSFkD4bcaDsWzY55QD
         4V3wdvYiqREGPz2jO0X0sRKDBz0rzF+iVpB1IoN13Gr8qsuxyFu0Kbi1/KarxwXoI4H2
         c2bktx86Xi37aLzu+vFGoLchMBDG0RtaxixsPIbCn5sQUt3WuL0nFfBsR3YVbKzJn8fi
         qkgGhzpsppLyAGOFSSs+QTDlX1aRdSQ1L9ezYa7Jk2Ih0IO+0U74rnvzC9iaT7OBag8o
         5O2l9/kSd9gG1sIA9tp378vXqpL5WvcB9WrHaRHKPCHM0JXqdjNq6PlFXu2G/a7uI8bN
         tIFQ==
X-Gm-Message-State: AOJu0YybsVF4roo1vYvKtnmGWRG+Fo+s0zwLRV8zsrPPO80/37sWeG6n
	5PrfYzOLS5zG/rQqmo6bAw6zqSQVB3gZymvYrFV+G7ic+tMOrXow95dtqxb7y8uRVBEbvyuBahs
	gBWDMQOp7whfH36IiyIyAGtfX8DV9PgMcQd9woSB3pnG0VDQIcOUcMYrD
X-Received: by 2002:a05:6512:3ba3:b0:52e:74d5:89ae with SMTP id 2adb3069b0e04-534387bbf0amr8119316e87.39.1724751742467;
        Tue, 27 Aug 2024 02:42:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF/225nfEIGt1MPCI6yaM+rmpsCoF+XbbUDHGXBZW/e/e2pgao3dWxNz/dUtcEyuLdMKYPAcw==
X-Received: by 2002:a05:6512:3ba3:b0:52e:74d5:89ae with SMTP id 2adb3069b0e04-534387bbf0amr8119292e87.39.1724751741634;
        Tue, 27 Aug 2024 02:42:21 -0700 (PDT)
Received: from [192.168.0.118] (h-185-57-5-67.na.cust.bahnhof.fi. [185.57.5.67])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a86e54875c8sm87427566b.7.2024.08.27.02.42.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Aug 2024 02:42:21 -0700 (PDT)
Message-ID: <85c76e9d-0c60-4771-9ae6-12ea511c495e@redhat.com>
Date: Tue, 27 Aug 2024 12:42:19 +0300
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Kcidb access request
To: Bjorn Andersson <andersson@kernel.org>
Cc: kernelci@lists.linux.dev
References: <66qpsiapmqcpnbajfi34oxympjqk7svtygkdtdcby3yirijbvp@pesxnvj6qhhb>
 <3351c08b-7594-43ea-80f1-e0f35271115f@redhat.com>
 <4fqub2pii3v6lwasvuzbyyviqgv76aycwhbfcgvxbgjk5h6qdc@25jqm7ubkqyg>
From: Nikolai Kondrashov <Nikolai.Kondrashov@redhat.com>
In-Reply-To: <4fqub2pii3v6lwasvuzbyyviqgv76aycwhbfcgvxbgjk5h6qdc@25jqm7ubkqyg>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Bjorn,

On 8/26/24 7:01 PM, Bjorn Andersson wrote:
> On Thu, Aug 08, 2024 at 08:56:12PM GMT, Nikolai Kondrashov wrote:
>> Hi Bjorn,
>> However, we don't have APIs, just the direct access to PostgreSQL, which keeps
>> six months of data. See the attached (abbreviated) schema dump. It largely
>> mirrors the JSON I/O schema, which you can see here:
>>
>> https://github.com/kernelci/kcidb-io/blob/main/kcidb_io/schema/v04_03.py
>>
> 
> The guide talks about PubSub interface, perhaps I'm misunderstanding
> this portion?

That Pub/Sub interface is a Google API for sending your testing results to
KCIDB. It doesn't allow querying data.

> No real concern with the direct SQL interface.

Great!

>> Note, that at the moment we have no way to query for "Qualcomm boards", but we
>> have a schema change proposal being discussed to address that.
>>
> 
> How do you associate device-specific tests (or any test that pass/fail
> due to device-specific regressions) with a particular device then?

Last week we have deployed support for submitting the `compatible` values from
the top of the device tree of the machine executing a test, as part of test
environment's information. Here's the I/O JSON schema for that:

https://github.com/kernelci/kcidb-io/blob/40f6d20f4e76d8d2b7288390003082f77d0aabb2/kcidb_io/schema/v04_04.py#L577-L602

In the database that is stored in a string array column. We're still
researching how to best query it and which indexes we would need, so a query
like "give me all tests which executed on Quallcomm boards (`qcom`?)" might be
very slow.

Here's a sample of vendors we're getting in the test results in our
"playground" database (from Maestro only so far), on our WIP dashboards:

https://fresh2-kcidb-grafana-m6io3uhhiq-uc.a.run.app/goto/R9b0F5qIg?orgId=1

And no, we don't have the "vendor" dashboard yet :D

> That would be great, and would allow me to make an attempt to tie this
> into my local dashboard...

Great! Could you give me a Google account email, so I could give it access to
the server?

Nick

