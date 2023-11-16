Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB0092C860
	for <kernelci@lists.linux.dev>; Thu, 16 Nov 2023 13:41:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GN0CTVzm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1700142091;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EsSXUyt/e0sQuOdfCJ7zam0EkNtcBbRjeB4I9K3C2uc=;
	b=GN0CTVzmwy3YlFPF2UIwyGDwWSb2KEydtc4+rvjnFk/fpsGvfalYG3PnmIwFVkDKpse579
	8jZImIIqeLV5xikktfNDP0ynlO8GBu5eq49fX55oH9E/aQXojxd0sjU3x1ENpbZkI7KhEf
	yV7Q9+H1DPzPvkE5R6P591PNyDVd8D0=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-411--XYXtc12MzCvD8J9QTny4w-1; Thu, 16 Nov 2023 08:41:28 -0500
X-MC-Unique: -XYXtc12MzCvD8J9QTny4w-1
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-778a20a16e3so88612285a.2
        for <kernelci@lists.linux.dev>; Thu, 16 Nov 2023 05:41:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700142087; x=1700746887;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EsSXUyt/e0sQuOdfCJ7zam0EkNtcBbRjeB4I9K3C2uc=;
        b=wiB7Ru7876Jm6rhHjt/QKeNS1NDY2EFnew0k4X+UfJmtQ6apG+gEiZQU+37sq5YKV/
         xsrZSnlrcnIT8bfSDTwWT28Ivz8MFJzPxgAQq/xZhmc3MjgbLB0cgXhATOfoHgMv/B1k
         5MSK3ld2fQvlfaSpiDQ32A33NCrxc3Vnz+DBMLBoa97d6AgZ97ME+z6h08tHx1+fPpg9
         Wn+eUyGZBbF71GCCQ5pxXB1Hqsrr58opfxHfeT8JRjRS2oFcqnrj+fZm7jUMUBe4PAdD
         5ia3HFz9CEdYQFdQvGUsq/QHQQhBRgpuWWlQsmZhTlSQIx2ZvBfuG0NfvSszMs0ZCEzI
         CyOQ==
X-Gm-Message-State: AOJu0Yw1DXGxu4Y/HnwlgrJ1NPpT0WizC8NB5ln0VGtqtdyc5kFNG73C
	oS+NkVEEdSPoHDExv7pqU7mjS6Bc9HZ2UE/LEt7cF8ETQC1piA4hbCvTNV0AI24OLQuCp3dlC2r
	g5e+QpbhJqltQemZCsyM=
X-Received: by 2002:a05:622a:488:b0:421:b9cb:933b with SMTP id p8-20020a05622a048800b00421b9cb933bmr9083242qtx.11.1700142087750;
        Thu, 16 Nov 2023 05:41:27 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHP+XXYET5Ab+tO0229Z6CnnoDuA52rBAaPnwBvw0yeaoWDBt8JoZdd6VV2qb69IdSrAAk+nQ==
X-Received: by 2002:a05:622a:488:b0:421:b9cb:933b with SMTP id p8-20020a05622a048800b00421b9cb933bmr9083209qtx.11.1700142087439;
        Thu, 16 Nov 2023 05:41:27 -0800 (PST)
Received: from [192.168.0.118] (88-113-27-52.elisa-laajakaista.fi. [88.113.27.52])
        by smtp.gmail.com with ESMTPSA id bb41-20020a05622a1b2900b0041817637873sm2706590qtb.9.2023.11.16.05.41.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Nov 2023 05:41:26 -0800 (PST)
Message-ID: <0f517de6-9eea-4641-a1dd-4631360fbe5f@redhat.com>
Date: Thu, 16 Nov 2023 15:41:22 +0200
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] MAINTAINERS: Introduce V: field for required tests
To: Bagas Sanjaya <bagasdotme@gmail.com>, workflows@vger.kernel.org,
 Joe Perches <joe@perches.com>, Andy Whitcroft <apw@canonical.com>,
 Theodore Ts'o <tytso@mit.edu>, David Gow <davidgow@google.com>,
 Steven Rostedt <rostedt@goodmis.org>, Mark Brown <broonie@kernel.org>,
 Shuah Khan <skhan@linuxfoundation.org>, "Darrick J . Wong"
 <djwong@kernel.org>, Charles Han <hanchunchao@inspur.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Linux Kernel Unit Tests <kunit-dev@googlegroups.com>,
 Linux Kernel Self Tests <linux-kselftest@vger.kernel.org>,
 Veronika Kabatova <vkabatov@redhat.com>, CKI <cki-project@redhat.com>,
 kernelci@lists.linux.dev
References: <20231115175146.9848-1-Nikolai.Kondrashov@redhat.com>
 <20231115175146.9848-2-Nikolai.Kondrashov@redhat.com>
 <ZVYXEry40HTCis00@archie.me>
From: Nikolai Kondrashov <Nikolai.Kondrashov@redhat.com>
In-Reply-To: <ZVYXEry40HTCis00@archie.me>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/16/23 15:20, Bagas Sanjaya wrote:
> On Wed, Nov 15, 2023 at 07:43:49PM +0200, Nikolai Kondrashov wrote:
>> Make scripts/checkpatch.pl ensure any added V: fields reference
>> documented test suites only, and output a warning if a change to a
>> subsystem doesn't certify the required test suites were executed,
>> if any.
>>
>> If the test suite description includes a "Command", then checkpatch.pl
>> will output it as the one executing the suite. The command should run
>> with only the kernel tree and the regular developer environment set up.
>> But, at the same time, could simply output instructions for installing
>> any extra dependencies (or pull some automatically). The idea is to
>> get the developer into feedback loop quicker and easier, so they have
>> something to run and iterate on, even if it involves installing some
>> more stuff first. Therefore it's a good idea to add such wrappers to the
>> kernel tree proper and refer to them from the tests.rst.
> 
> Does it also apply to trivial patches (e.g. spelling or checkpatch fixes
> as seen on drivers/staging/)?

Do you mean, will checkpatch.pl suggest executing test suites for trivial 
patches as well? If so, then yes, of course. These are inevitable victims of 
such mechanisms in general, and it's hard to make an exception for them, but 
we have to consider the overall benefit of having more uniform testing vs. 
making trivial changes a bit more difficult.

Nick

