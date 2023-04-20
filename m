Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06B288C04
	for <kernelci@lists.linux.dev>; Thu, 20 Apr 2023 16:50:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1682009451;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ze4U+AaVaaD23g4h3Y5TAfSMyEVk93jF38ZDEnjX1+c=;
	b=BVVHk5c4J15D9xeuSBj7fmTPmiko6QSEeus0Hanmkaojwq8HyM7A4k/infuJW10LcSq3Zg
	xoqs3JnhCG+9I0/VzO/ZfOX2slJJMUSliX+rLkGCcvTUC9ZYAgc/4K21kEKsfTg8f3PZmI
	dleloir3kccA5yrbT1xg2mIs/MW0of8=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-504-eX1rBE4qNe6HF_WwA8larw-1; Thu, 20 Apr 2023 12:50:50 -0400
X-MC-Unique: eX1rBE4qNe6HF_WwA8larw-1
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-3f08900db79so3152935e9.2
        for <kernelci@lists.linux.dev>; Thu, 20 Apr 2023 09:50:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682009449; x=1684601449;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ze4U+AaVaaD23g4h3Y5TAfSMyEVk93jF38ZDEnjX1+c=;
        b=TNRW3hGU04zC/trgsdkVjQQ/z6AXqCGX5oBpnMTG06X0cSXBlNtFf1viYVtSe6JJB5
         nuWG9ajZcMOdW/o8G02/P8+8uFmspQNAPMz5cNlwMnl1XbR3x5xObij7ZusWZPYyWgbo
         wijS29qLVt2aJTACBgFw0Jy4BssNpo/kDFuC3kKKTTERMjInCQN+bqktpBTivoA1azUS
         Rqa8Y6F4RVX+Q1bMwc0FFwh7FWUdwGQPTySGSTBDnaijFZYibakd7gM+GgA6wC8V9siL
         kUmISka3KWIOePeyVx72b2dm04WT1ozViGLfCLvnxxDzYZ0JRyGPhl/XJg9nqh5OARmm
         +ESw==
X-Gm-Message-State: AAQBX9cJybHDWj45v3fC89ihxFUrdZj2EXhzomOwft6uc6ysUl+41h2F
	5/B2tCCSXRv6U5qvXJXVo8jAhJhWa44U7FZBjIXtVnEf0wbPF4NvY5UpjLb2oUkXdSpwzGAmR5P
	vjkzDocgY9HculakajUk=
X-Received: by 2002:adf:dfc3:0:b0:2ef:b3ef:9e82 with SMTP id q3-20020adfdfc3000000b002efb3ef9e82mr1636918wrn.57.1682009449471;
        Thu, 20 Apr 2023 09:50:49 -0700 (PDT)
X-Google-Smtp-Source: AKy350aGs8QIt4TILAdpSheIedsL76OmkfLA6ZNMArLVezXWB3K+PlJb34FVkg0SdKPGJXBawAddxg==
X-Received: by 2002:adf:dfc3:0:b0:2ef:b3ef:9e82 with SMTP id q3-20020adfdfc3000000b002efb3ef9e82mr1636900wrn.57.1682009449203;
        Thu, 20 Apr 2023 09:50:49 -0700 (PDT)
Received: from [192.168.0.118] (88-113-27-52.elisa-laajakaista.fi. [88.113.27.52])
        by smtp.gmail.com with ESMTPSA id m6-20020a5d6246000000b002feea065cc9sm2331745wrv.111.2023.04.20.09.50.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Apr 2023 09:50:48 -0700 (PDT)
Message-ID: <2f19261c-1545-9c35-fcea-1b777407d235@redhat.com>
Date: Thu, 20 Apr 2023 19:50:47 +0300
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: KCIDB: Support one more test status
To: Mark Brown <broonie@kernel.org>
Cc: kernelci@lists.linux.dev, Dmitry Vyukov <dvyukov@google.com>,
 Cristian Marussi <cristian.marussi@arm.com>,
 Alice Ferrazzi <alicef@gentoo.org>, Philip Li <philip.li@intel.com>,
 Vishal Bhoj <vishal.bhoj@linaro.org>,
 automated-testing@lists.yoctoproject.org, Tim Bird <Tim.Bird@sony.com>,
 CKI <cki-project@redhat.com>, Johnson George <Johnson.George@microsoft.com>,
 Sachin Sant <sachinp@linux.ibm.com>
References: <45be6714-b818-0be7-3e95-9f69af65096c@redhat.com>
 <6d6cabd3-92e6-48b1-bd8b-b23fb09933c8@sirena.org.uk>
From: Nikolai Kondrashov <Nikolai.Kondrashov@redhat.com>
In-Reply-To: <6d6cabd3-92e6-48b1-bd8b-b23fb09933c8@sirena.org.uk>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/19/23 20:49, Mark Brown wrote:
> On Wed, Apr 19, 2023 at 08:08:03PM +0300, Nikolai Kondrashov wrote:
> 
>> I would like to make KCIDB I/O schema accept one more test status string:
>> "MISS" (preliminary name), meaning the test was supposed to run, but didn't
>> because of a harness/framework/infrastructure/CI system failure.
> 
>> This would be distinct from the "SKIP" status, meaning the test was supposed
>> to run, but didn't (or didn't complete), because it was not applicable.
> 
>> Here's the PR in question: https://github.com/kernelci/kcidb-io/pull/74
> 
>> I'll merge it in two weeks, on Wed, May 3, if there are no unresolved
>> objections by that time.
> 
>> Read on for details, and respond either to this message, or in the PR.
> 
> This makes sense to me, it corresponds to how my own testing inteprets
> results - I have a list of tests I expect to pass, and if any of them
> return any result other than pass then that's an issue.  I also picked
> the name "missing" for that in my code.

Yeah, it's kinda like that. Only KCIDB defines explicit statuses for a bunch 
of specific failures, and I propose to make "MISS" represent 
harness/framework/CI system mess-ups/"misses" only.

Nick

