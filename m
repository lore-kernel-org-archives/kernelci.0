Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF14337144
	for <kernelci@lists.linux.dev>; Wed,  6 Dec 2023 16:46:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="X1U8HjCv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1701881197;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ztLXRobUGlRg7eZ1W79vYwaD7gzoNeRhSy97eRCnmUA=;
	b=X1U8HjCv6Gr5MiDxrfL89EU5rsBvKCZ8RYjEpACXZXNHyT4J0kG3nLSrq6JsiZEAQWR5wz
	XmxqHSJxH24frRTCAODfjymzoHwpMni8e6rtnVQh6uRjpOLGx5G7zUW1t1TQGmrZp30aHu
	GB5bTvTW86GS5wgcThPDwu6JUy0de0Y=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-520-edHPGY1FMrat64XiBGSqFw-1; Wed, 06 Dec 2023 11:46:35 -0500
X-MC-Unique: edHPGY1FMrat64XiBGSqFw-1
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-40b4a837eb8so59803235e9.3
        for <kernelci@lists.linux.dev>; Wed, 06 Dec 2023 08:46:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701881192; x=1702485992;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ztLXRobUGlRg7eZ1W79vYwaD7gzoNeRhSy97eRCnmUA=;
        b=wsBTNsiD2weFLNZ/GLXw/vADno2mztP/veSheCsIkNmx4dyqljWCd0uH8JzVD2Pkbg
         jK0DNwHuG3f/Vfh5ATl3NWM3AKvyQaL7Y44fF2XHahYAFT8j7JsplJYdsjxT5cads4l8
         NODrMwj1If8ss8kSBLIifTjjvDZZjyiuTKkbgNgyLWuatfeEzb1P5OgeVmBqGkCOpnd/
         CuEvMXyBBO775K1AWtZtzrClHpj2Gbt7ten59lm5AtT2LLpmpsW2eOY/UrpfW85ze9GQ
         Xi6aquxxH0QBVrTWD0bK85r41VRXniCDrdEDebAhCTe8s3d1dQetM9RyvIBAumEqMSPL
         fD5g==
X-Gm-Message-State: AOJu0Yy/k3LsCbrEbLUcv4H2YUbYeuBkV4a+fnOs2BydS1DedL8jG9Fw
	qalLDOTQPwZP7Ps4zzGM+qW9dX9MSH3s46eJDvCwgtahba8ZiVS+N5P27neOCGxJ0L03nPOsayC
	grO2uvSZTqMcBEjf8XdY=
X-Received: by 2002:a05:600c:1713:b0:40c:25be:8a99 with SMTP id c19-20020a05600c171300b0040c25be8a99mr209628wmn.180.1701881192163;
        Wed, 06 Dec 2023 08:46:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE6+sJCQ7NPS9J3bWUaCeQ035R0YndFZiH1h1M8dTENxMmIOZL3Iu6YxOH5ePuLcu7bSBwMbw==
X-Received: by 2002:a05:600c:1713:b0:40c:25be:8a99 with SMTP id c19-20020a05600c171300b0040c25be8a99mr209612wmn.180.1701881191880;
        Wed, 06 Dec 2023 08:46:31 -0800 (PST)
Received: from [192.168.0.118] (88-113-27-52.elisa-laajakaista.fi. [88.113.27.52])
        by smtp.gmail.com with ESMTPSA id az40-20020a05600c602800b004064cd71aa8sm131226wmb.34.2023.12.06.08.46.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Dec 2023 08:46:31 -0800 (PST)
Message-ID: <4a5d9c6e-186b-4681-88a6-63c50576adea@redhat.com>
Date: Wed, 6 Dec 2023 18:46:29 +0200
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 04/10] docs: submitting-patches: Introduce
 Tested-with:
To: Joe Perches <joe@perches.com>, Jonathan Corbet <corbet@lwn.net>,
 workflows@vger.kernel.org, Andy Whitcroft <apw@canonical.com>,
 Theodore Ts'o <tytso@mit.edu>, David Gow <davidgow@google.com>,
 Steven Rostedt <rostedt@goodmis.org>, Mark Brown <broonie@kernel.org>,
 Shuah Khan <skhan@linuxfoundation.org>, "Darrick J . Wong"
 <djwong@kernel.org>
Cc: kunit-dev@googlegroups.com, linux-kselftest@vger.kernel.org,
 Veronika Kabatova <vkabatov@redhat.com>, CKI <cki-project@redhat.com>,
 kernelci@lists.linux.dev
References: <20231115175146.9848-1-Nikolai.Kondrashov@redhat.com>
 <20231205184503.79769-1-Nikolai.Kondrashov@redhat.com>
 <20231205184503.79769-5-Nikolai.Kondrashov@redhat.com>
 <87zfyomq5k.fsf@meer.lwn.net>
 <fcc8a2d856dda4afbc85e70a36fc9ea903adc922.camel@perches.com>
From: Nikolai Kondrashov <Nikolai.Kondrashov@redhat.com>
In-Reply-To: <fcc8a2d856dda4afbc85e70a36fc9ea903adc922.camel@perches.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/5/23 21:07, Joe Perches wrote:
> On Tue, 2023-12-05 at 11:59 -0700, Jonathan Corbet wrote:
>> Nikolai Kondrashov <Nikolai.Kondrashov@redhat.com> writes:
>>
>>> Introduce a new tag, 'Tested-with:', documented in the
>>> Documentation/process/submitting-patches.rst file.
> []
>> I have to ask whether we *really* need to introduce yet another tag for
>> this.  How are we going to use this information?  Are we going to try to
>> make a tag for every way in which somebody might test a patch?
> 
> In general, I think
> 	Link: <to some url test result>
> would be good enough.
> 
> And remember that all this goes stale after awhile
> and that includes old test suites.

Yeah, things go stale, for sure. And Link: will work for specifying the test 
results (provided the contents says what the test was), but it doesn't help 
maintainers to know immediately which tests were executed and which weren't.

It also won't allow involving checkpatch.pl in checking the submitter ran all 
the required tests, and telling them to run whatever they didn't.

Nick

