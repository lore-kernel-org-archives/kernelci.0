Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E8395B5D1
	for <kernelci@lists.linux.dev>; Wed, 22 Nov 2023 17:42:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FiCp2cQE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1700674925;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MarbTLh3XC3akBvGpZMrXMEoBFqC5djpe7GsLRqhwNI=;
	b=FiCp2cQEwNQz8vmBhUWa5LiRofAlWkRYQDoxqVbaHZOCGEcXOHxCYsuAcMQ3JA2LVq7l0I
	Fup6BArTFkzT0Zlf5BGpfaGnaNE3PYJdqfE+tJCDV7kx2PBsSdhrvNtQdva05lVil9f38p
	vSgI/whmfHtBIgPcMSAv++wA+8L3w5Y=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-214-DK1IO0I3NyKfmvNH3IIURw-1; Wed, 22 Nov 2023 12:42:04 -0500
X-MC-Unique: DK1IO0I3NyKfmvNH3IIURw-1
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6707401e1aeso781936d6.0
        for <kernelci@lists.linux.dev>; Wed, 22 Nov 2023 09:42:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700674923; x=1701279723;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MarbTLh3XC3akBvGpZMrXMEoBFqC5djpe7GsLRqhwNI=;
        b=VlyJ10S3yImCPFfJLYpcHXmxozdmtSSrLUAjze8TfL52tF9qNRiCSxDY/nf8Z60mdK
         gKd9U9mncgfCeMeCY9j5BYNLCiAWCAwWCqezSd3uYjDRAF9v1e40vfQPz2KsZhipbh0D
         veeVcR4aENTTjY8xPt0RByviYoRnsk/0Tpyw1bsRy38BIL3K7oNnMOv1+3jhbWXnGLH8
         apI2JfdJylSt4UR9V3X5rWIHJN3i7FTlQdSEsVfOArSLjxhqZybm85Uh41n6Jf5eSOYz
         1eQANzXPTildXHBOlQlEYf6o6adn5it7nW/1BvnuHkKfy5+0wfW63PEYYqIb1afbcDHU
         oaQA==
X-Gm-Message-State: AOJu0YxNGXzEUmDBSO0gLOq89l7GnzZsvEXonFvPFKdmPXmlNTvunF8F
	Ry92lqpsZPivU04aXXHYGjHO9jzKslzUCRhgopiqcgaOVTRiiaHnS+lN4a4ti5MoglCUulCdwZU
	OMZdOxitzEUWfQNardg4=
X-Received: by 2002:a0c:a9cf:0:b0:679:f224:e414 with SMTP id c15-20020a0ca9cf000000b00679f224e414mr2822458qvb.19.1700674923630;
        Wed, 22 Nov 2023 09:42:03 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGnp3mO9MK/p4MqbgwWXetap5UPkRVZMVkyW/0mnDJlIe7b4jx1vvOrgUl5ENOEWBqrUW6oeQ==
X-Received: by 2002:a0c:a9cf:0:b0:679:f224:e414 with SMTP id c15-20020a0ca9cf000000b00679f224e414mr2822446qvb.19.1700674923329;
        Wed, 22 Nov 2023 09:42:03 -0800 (PST)
Received: from [192.168.0.118] (88-113-27-52.elisa-laajakaista.fi. [88.113.27.52])
        by smtp.gmail.com with ESMTPSA id ez4-20020ad45904000000b00677fbdab416sm4504540qvb.108.2023.11.22.09.41.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Nov 2023 09:42:02 -0800 (PST)
Message-ID: <220215e5-4a5f-4332-9435-80936d97344a@redhat.com>
Date: Wed, 22 Nov 2023 19:41:58 +0200
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] MAINTAINERS: Introduce V: field for required tests
To: Gustavo Padovan <gustavo.padovan@collabora.com>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
 workflows@vger.kernel.org, Joe Perches <joe@perches.com>,
 Andy Whitcroft <apw@canonical.com>, Theodore Tso <tytso@mit.edu>,
 David Gow <davidgow@google.com>, Steven Rostedt <rostedt@goodmis.org>,
 Mark Brown <broonie@kernel.org>, Shuah Khan <skhan@linuxfoundation.org>,
 "Darrick J . Wong" <djwong@kernel.org>, kunit-dev@googlegroups.com,
 linux-kselftest@vger.kernel.org, Veronika Kabatova <vkabatov@redhat.com>,
 CKI <cki-project@redhat.com>, kernelci@lists.linux.dev,
 kernel@collabora.com, =?UTF-8?Q?Ricardo_Ca=C3=B1uelo_Navarro?=
 <ricardo.canuelo@collabora.com>
References: <1341-655b5400-1-5f647c80@80242238>
From: Nikolai Kondrashov <Nikolai.Kondrashov@redhat.com>
In-Reply-To: <1341-655b5400-1-5f647c80@80242238>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


Hi Gustavo,

On 11/20/23 14:40, Gustavo Padovan wrote:
> On Thursday, November 16, 2023 09:14 -03, Nikolai Kondrashov <Nikolai.Kondrashov@redhat.com> wrote:
> 
>> On 11/15/23 22:38, Konstantin Ryabitsev wrote:
>>> On Wed, Nov 15, 2023 at 07:43:49PM +0200, Nikolai Kondrashov wrote:
>>>> Introduce a new tag, 'Tested-with:', documented in the
>>>> Documentation/process/submitting-patches.rst file. The tag is expected
>>>> to reference the documented test suites, similarly to the 'V:' field,
>>>> and to certify that the submitter executed the test suite on the change,
>>>> and that it passed.
>>>
>>> I'm not sure it should be a tag that stays all the way through git commit.
>>> How about making it a cover letter/first patch footer?
>>>
>>> tested-with: <suite>
>>
>> Yes, that would be better indeed. However, checkpatch.pl doesn't process cover
>> letters, and so we would have no automated way to advertise and nudge people
>> towards testing.
>   
> At this year's LPC, there was quite some discussion around improving testing information, so this patch of yours lands has a great timing. :)

Lucky me :D

> All your are proposing here is pretty interesting both for developers and CI systems, but it seems that a "Tested-with:" tag and checkpatch.pl validation will take quite some time to consolidate.
> 
> Would it make sense to split just the part that adds the V: field to MAINTAINERS and submit that as separate patchset together with its documentation? That way we can enable subsystem to start annotating their test suites already.

Yeah, I'll try to split this along controversy lines in the next version.

> I also wonder how to make for subsystems that will have different test suites (eg something in kselftests and an external test suite). Would an alternative be pointing to a Documentation page with detailed info?

As Mark already noted, you can always just put more V: entries there, but you
can also create a "meta-test" in the catalogue listing all the different test
suites, and reference it from the V: entry, if you'd like.

Nick

