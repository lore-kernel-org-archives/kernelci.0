Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EF671D682
	for <kernelci@lists.linux.dev>; Wed,  6 Dec 2023 16:57:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="AYpWgT9A"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1701881867;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oFeuJtK+zmdF2DRGAJQr++0Z9wdgk0HTu1uHhXoKQ9I=;
	b=AYpWgT9APhYbcdvUtZ2PO+nt5uloYTncpsnQa77VsJTYiNE8gBgi8HaSNaLx2YVeNLmvwk
	ROSHw0b7DCjnOyatdemUIOOAotR++VTOYSxCDS0vjv6bu1j2de34rkSrH6aLYpbaX/KzbZ
	48vRqntzg7rx1pBV5cY5deUNIb2qmno=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-55-SMGpaU2yNFii1D0EFF74kA-1; Wed, 06 Dec 2023 11:57:45 -0500
X-MC-Unique: SMGpaU2yNFii1D0EFF74kA-1
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-333503fd5bdso778106f8f.3
        for <kernelci@lists.linux.dev>; Wed, 06 Dec 2023 08:57:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701881864; x=1702486664;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oFeuJtK+zmdF2DRGAJQr++0Z9wdgk0HTu1uHhXoKQ9I=;
        b=htPgfwY51tZOzbETkeCqC2w1JTrudRH5woecdk1a8Zbj0TuDu3sYmWUEyX/2VZS9Bk
         OqM/lHKr5cZOfr1SGzolpPNuSz797REzm+COdmnBwfaUhRMOaOw3PbzVsVe2ddnJy5q8
         bBoIMIgoBC9ogT7L8T0Ei4Nm3IvNoqaCjzhDRNbkisBZpGVtCvjC4hH06aQ7gAwfsOWQ
         hps8ReHw5N2K9ZOZnb6Wuq7G79Q6aE5XdRTrbXt6VH4tJi4JpskApSDzjpKELM1Q4SBf
         emO7tWFxBa59eEwZZZ105PHxVFIrlUMH2quKKLSTKTI62VNH+4gwzU8kS4uCHQiO/c0z
         AFGg==
X-Gm-Message-State: AOJu0YzncVlcxLZqYT2c3cjr7Dcs7b7YACDW5W+h6gelUi7r/IoBVrjh
	HryL8FGAaQl7NAr8nd7LFNeSwEF+02hp4USUXVPObaYm5BkYIh/7gUMXCF2pvb+G+sEL3aNaPqH
	SNDtNAcRr/gabxmSAweE=
X-Received: by 2002:a5d:56cf:0:b0:333:1adc:a37b with SMTP id m15-20020a5d56cf000000b003331adca37bmr630975wrw.5.1701881864138;
        Wed, 06 Dec 2023 08:57:44 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEP4MRv6FtBdsWsfM6nYWwuBr+Be/E9MbySQYUrXe/MmZeAqmbZdu0rtf327EL+KMbRwVwS1w==
X-Received: by 2002:a5d:56cf:0:b0:333:1adc:a37b with SMTP id m15-20020a5d56cf000000b003331adca37bmr630971wrw.5.1701881863851;
        Wed, 06 Dec 2023 08:57:43 -0800 (PST)
Received: from [192.168.0.118] (88-113-27-52.elisa-laajakaista.fi. [88.113.27.52])
        by smtp.gmail.com with ESMTPSA id g17-20020adfa491000000b003333541a5bdsm119315wrb.80.2023.12.06.08.57.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Dec 2023 08:57:43 -0800 (PST)
Message-ID: <ba60bfe4-939b-4d7b-b7a5-1a8309045767@redhat.com>
Date: Wed, 6 Dec 2023 18:57:41 +0200
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 02/10] MAINTAINERS: Introduce V: entry for tests
To: Joe Perches <joe@perches.com>, David Gow <davidgow@google.com>
Cc: workflows@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 Andy Whitcroft <apw@canonical.com>, Theodore Ts'o <tytso@mit.edu>,
 Steven Rostedt <rostedt@goodmis.org>, Mark Brown <broonie@kernel.org>,
 Shuah Khan <skhan@linuxfoundation.org>, "Darrick J . Wong"
 <djwong@kernel.org>, kunit-dev@googlegroups.com,
 linux-kselftest@vger.kernel.org, Veronika Kabatova <vkabatov@redhat.com>,
 CKI <cki-project@redhat.com>, kernelci@lists.linux.dev
References: <20231115175146.9848-1-Nikolai.Kondrashov@redhat.com>
 <20231205184503.79769-1-Nikolai.Kondrashov@redhat.com>
 <20231205184503.79769-3-Nikolai.Kondrashov@redhat.com>
 <CABVgOSnCNJcEfVp_k3emEHziYx55ecNaEj4fsbcfgrsCN4CrNQ@mail.gmail.com>
 <f64c8105-5373-4dfb-b48c-655221accd19@redhat.com>
 <9b45b0ebce3457c22aa456779aa1a5244b8ef6ad.camel@perches.com>
From: Nikolai Kondrashov <Nikolai.Kondrashov@redhat.com>
In-Reply-To: <9b45b0ebce3457c22aa456779aa1a5244b8ef6ad.camel@perches.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/6/23 18:38, Joe Perches wrote:
> On Wed, 2023-12-06 at 18:23 +0200, Nikolai Kondrashov wrote:
>> On 12/6/23 10:12, David Gow wrote:
>>> I'm pretty happy with this personally, though I definitely think we
>>> need the support for tests which aren't just executable scripts (e.g.
>>> the docs in patch 6).
>>>
>>> The get_maintailer.pl bits, and hence the requirement to not include
>>> '@', feel a little bit 'off': I'd rather get_maintainer.pl kept emails
>>> and tests separate by some other means (either having --test _only_
>>> print tests, not emails at all, or by giving them a prefix like
>>> 'TEST:' or something). But that is diverging more from the existing
>>> behaviour of get_maintainer.pl, so I could go either way.
>>>
>>> Otherwise, this looks pretty good. I'll give it a proper test tomorrow
>>> alongside the other patches.
>>
>> Thanks for the review, David!
>>
>> Yeah, I don't like the '@' bit myself, but it seems to be the path of least
>> resistance right now (not necessarily the best one, of course).
>>
>> I'm up for adding an option to get_maintainer.pl that disables email output,
>> if people like that, though.
> 
> That already exists though I don't understand the
> specific requirement here
> 
> --nom --nol --nor
> 
> from
> $ ./scripts/get_maintainer.pl --help
> []
>      --m => include maintainer(s) if any
>      --r => include reviewer(s) if any
>      --n => include name 'Full Name <addr@domain.tld>'
>      --l => include list(s) if any
> []
>     Most options have both positive and negative forms.
>        The negative forms for --<foo> are --no<foo> and --no-<foo>.
> 

Thanks, Joe!

Yeah, I already explored that way, but it seems to be explicitly forbidden:

$ scripts/get_maintainer.pl --nom --nol --nor 
0001-dt-bindings-mailbox-convert-bcm2835-mbox-bindings-to.patch
scripts/get_maintainer.pl: Please select at least 1 email option

So, I assumed there is a reason and an intention behind this behavior and went 
the other way.

Nick

