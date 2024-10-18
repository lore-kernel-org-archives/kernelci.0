Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7408718784A
	for <kernelci@lists.linux.dev>; Fri, 18 Oct 2024 13:32:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729258363; cv=none; b=HhgMt26K/eqX1Gedrf62HD1pimMgBi7H0QaZWg+S92wqjAc4DJVvt8Te53cgq21sS1PogxRsbtp3XpguqH29c+fM0r8JLwdamryHWyi1yHPKAEU6WOeBgVuTudguXCv1h9lqyeY5QQayWBd9+a3s08b9reBPnM7aAfDxTHPg1JQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729258363; c=relaxed/simple;
	bh=L1+lwIs7ceJRx+8i5WTazMp1ZsO792WkjaH9GqhvtKQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:Cc:From:
	 In-Reply-To:Content-Type; b=au1/zB9HKJXUxyvKIy2ihllDt54C5rvcVZQxGeaee1ZPQLPao97Ek2C5Ww9lsIEk5Kb6l3R3ZHeVg49zczEGKmLNBEP4+iXxilPZOOEMR2RJjrAIKGsTe6ZhfYClGafm8nHtMhthfUTjGk8SIabUzIYPCBJFvHTObf1uR8PA6Ho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=faI9/iIH; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="faI9/iIH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1729258360;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FU0vZywherdnf3s9Hj1ChHgDMZpIjoW7My8IPDGeo9M=;
	b=faI9/iIHsH/YlB+7XjXgUciXZzOHlfZE5xnk0+nyGF25XgH5NrhOa4KF7kt/dkpjCMP+2O
	ZxleMOCObM4uYOp9D8UUfB5AakerqWFjFvonunC9oUvDR9JwZaJh73fB+0Jaq/g+Cl5Tu/
	HXr5TdSHzuD+twsqeTrU0izLn0PeFWA=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-509-__QW_pE8NoyaJQP67UK7hg-1; Fri, 18 Oct 2024 09:32:38 -0400
X-MC-Unique: __QW_pE8NoyaJQP67UK7hg-1
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4315cefda02so12183265e9.0
        for <kernelci@lists.linux.dev>; Fri, 18 Oct 2024 06:32:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729258358; x=1729863158;
        h=content-transfer-encoding:in-reply-to:from:cc:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FU0vZywherdnf3s9Hj1ChHgDMZpIjoW7My8IPDGeo9M=;
        b=qcnxPh8rKKUWX2h66zfXX/k6H5UMOsR+W1PIoUHFYpKjt/Zo7h/bEG3bLL/rPm7S2a
         X6r9Q0ygtV7Z2Z76aDyvPlhYlyuWgIePReL8Qh8s5D8uLFzbo6YRciYXk0xqzh3EBQL8
         9b6KtCkIFul5RXPRPVmxF+xIHR0qhsZlk28hjVSqrsS6U3MbdQMoLgR9XWBCyszSP7XH
         MbK4NZnpkd6Z4/6OVWCfDnatihm3Lr8yNO6M+WErGW4eiWQxJ7oHaxmk1LyHWCVaCuyk
         hFWhwbe+C8lNbsZn7TIfkfhjWUw2uomtrONP6qM/nAes2JOy/yPgLa81AdgVcuVa48Lp
         N4TA==
X-Gm-Message-State: AOJu0Ywt5xwjOMbovX+76Ks7tVoJAHAbp/aadNYJhN9KaGyJmm8uvCHL
	igvJ3/jhnFzP/P/PB9q2SIA1CVX+famjy1S3F1GEJ6nBBwjHku/sRRyNfNtGLetHXea0n6qBIdl
	yu5raoO1Y/ZxEVfEjJepI+7wLdfEVa1RwcmAeHRz328CffNHCkMNs/rpo
X-Received: by 2002:a05:600c:3b89:b0:42c:a574:6360 with SMTP id 5b1f17b1804b1-4316168f6f8mr21306205e9.29.1729258357514;
        Fri, 18 Oct 2024 06:32:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFBGNtP2o0/SYBb+uPt8hh6D0ZJQ7zIU7SBVFEYBSxg1PlyIt21qmOTvgyaOWdx22zIWNOyRA==
X-Received: by 2002:a05:600c:3b89:b0:42c:a574:6360 with SMTP id 5b1f17b1804b1-4316168f6f8mr21305205e9.29.1729258355525;
        Fri, 18 Oct 2024 06:32:35 -0700 (PDT)
Received: from [192.168.0.166] (h-185-57-5-67.na.cust.bahnhof.fi. [185.57.5.67])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43160dc9365sm24219795e9.11.2024.10.18.06.32.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Oct 2024 06:32:34 -0700 (PDT)
Message-ID: <e90b3ccc-fd16-406b-ac8a-7d2bf66abd1f@redhat.com>
Date: Fri, 18 Oct 2024 16:32:33 +0300
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: KCIDB database
To: Manoj Kumar <ManojKumar08@arm.com>
References: <547ddf99-1b75-c463-e6c7-32389c461468@redhat.com>
 <AS8PR08MB6407FD1D5E33918F5DA6032A9E772@AS8PR08MB6407.eurprd08.prod.outlook.com>
 <PAXPR08MB6813993A4C70BDE277129A76C47D2@PAXPR08MB6813.eurprd08.prod.outlook.com>
 <d9f9111e-9890-4795-9f8a-a6946a8fcbb9@redhat.com>
 <PAXPR08MB68136B5FD6BFD45B2BC1BE2DC47D2@PAXPR08MB6813.eurprd08.prod.outlook.com>
 <9ab1e3c8-9c7f-4657-815a-13a68e0b87f7@redhat.com>
 <PAXPR08MB68139AC2C5DFA28EC9A4CCC6C47E2@PAXPR08MB6813.eurprd08.prod.outlook.com>
 <2626f2ce-adb0-4aad-bbfc-c19f634a4d30@redhat.com>
 <DB9PR08MB68103176F5638C352F410BCBC4402@DB9PR08MB6810.eurprd08.prod.outlook.com>
Cc: "kernelci@lists.linux.dev" <kernelci@lists.linux.dev>,
 Denys Fedoryshchenko <denys.f@collabora.com>
From: Nikolai Kondrashov <Nikolai.Kondrashov@redhat.com>
In-Reply-To: <DB9PR08MB68103176F5638C352F410BCBC4402@DB9PR08MB6810.eurprd08.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Manoj,

> I looked at the below link to get installation steps for the kcidb-submit
command.
>
> https://docs.kernelci.org/kcidb/installation/ <https://docs.kernelci.org/
> kcidb/installation/>
>
> This instruction is for Python version V3.9 but our backend is using the
> Python 2.7.16 at the moment.
>
> Do you have instruction for python 2.7.16 to install this package

KCIDB requires Python 3, and that's why KernelCI Legacy (which requires Python
2) is invoking the kcidb-submit command-line tool in a new process instead of
using the KCIDB library directly.

You will need to install Python 3 in your deployment, I assume. Perhaps Denys,
or someone else on the KernelCI maillist (both CC'd) could tell you how we did
that.

Nick

On 10/18/24 4:21 PM, Manoj Kumar wrote:
> Hi Nikolai,
> 
>  
> 
> I am planning to push test build data to public KCIDB . I am seeing a failure
> because of the kcidb-submit command in a thread at backend.
> 
>  
> 
> The class KcidbSubmit expect the command kcidb-submit installed on the backend
> system.
> 
> /class KcidbSubmit(object):/
> 
> /    def __init__(self, kcidb_options):/
> 
> /        kcidb_path = kcidb_options.get("kcidb_path", "")/
> 
> /        self.kcidb_submit_cmd = os.path.join(kcidb_path, "kcidb-submit")/
> 
>  
> 
> I looked at the below link to get installation steps for the kcidb-submit command.
> 
> https://docs.kernelci.org/kcidb/installation/ <https://docs.kernelci.org/
> kcidb/installation/>
> 
>  
> 
> This instruction is for Python version V3.9 but our backend is using the
> Python 2.7.16 at the moment.
> 
> Do you have instruction for python 2.7.16 to install this package
> 
>  
> 
> Br,
> 
> Manoj
> 
>  
> 
> *From: *Nikolai Kondrashov <Nikolai.Kondrashov@redhat.com>
> *Date: *Tuesday, 8 October 2024 at 11:46
> *To: *Manoj Kumar <ManojKumar08@arm.com>
> *Subject: *Re: KCIDB database
> 
> Hi Manoj,
> 
> On 10/8/24 1:26 PM, Manoj Kumar wrote:
>> One additional question regarding the credentials file.
>>
>> Attached credentials files was shared with me named  “.kernelci-production-ci-
>> arm.json” .
>>
>> The attached file contains multiple parameters , If I understood correctly all
>> the contents of this file should be assigned to this variable https://
>> github.com/kernelci/kernelci-backend/
>> blob/7e7bff2703c73b2a3a3734b7bcd0593cbe657705/app/utils/kcidb.py#L38 <https://
>> github.com/kernelci/kernelci-backend/
>> blob/7e7bff2703c73b2a3a3734b7bcd0593cbe657705/app/utils/kcidb.py#L38>
> 
> Not the contents, but a path to the file itself.
> 
>> Also , the email ID used by internal kernelCI deployment is different . They
>> will be “bot@kernelci-dev.oss.arm.com <mailto:bot@kernelci-dev.oss.arm.com <mailto:bot@kernelci-dev.oss.arm.com>>
>> and bot@kernelci.oss.arm.com <mailto:bot@kernelci.oss.arm.com <mailto:bot@kernelci.oss.arm.com>>”.
> 
> That doesn't matter, the email in the JSON credentials is simply a user
> (service account) ID and is specific to Google Cloud. It identifies a
> particular submitter to the system.
> 
> You don't really need to look into the credentials file at all.
> 
> Nick
> 
> On 10/8/24 1:26 PM, Manoj Kumar wrote:
>> Hi Nick,
>> 
>>  
>> 
>> Thanks for your prompt responses :thumbsup
>> 
>>  
>> 
>> One additional question regarding the credentials file.
>> 
>> Attached credentials files was shared with me named  “.kernelci-production-ci-
>> arm.json” .
>> 
>> The attached file contains multiple parameters , If I understood correctly all
>> the contents of this file should be assigned to this variable https://
>> github.com/kernelci/kernelci-backend/
>> blob/7e7bff2703c73b2a3a3734b7bcd0593cbe657705/app/utils/kcidb.py#L38 <https://
>> github.com/kernelci/kernelci-backend/
>> blob/7e7bff2703c73b2a3a3734b7bcd0593cbe657705/app/utils/kcidb.py#L38>
>> 
>>  
>> 
>> Also , the email ID used by internal kernelCI deployment is different . They
>> will be “bot@kernelci-dev.oss.arm.com <mailto:bot@kernelci-dev.oss.arm.com <mailto:bot@kernelci-dev.oss.arm.com>>
>> and bot@kernelci.oss.arm.com <mailto:bot@kernelci.oss.arm.com <mailto:bot@kernelci.oss.arm.com>>”.
>> 
>>  
>> 
>> Br,
>> 
>> Manoj
>> 
>>  
>> 
>>  
>> 
>> *From: *Nikolai Kondrashov <Nikolai.Kondrashov@redhat.com>
>> *Date: *Tuesday, 8 October 2024 at 05:36
>> *To: *Manoj Kumar <ManojKumar08@arm.com>
>> *Subject: *Re: KCIDB database
>> 
>> On 10/7/24 7:49 PM, Manoj Kumar wrote:
>>> I do have some questions if you can help me find answer.
>>>
>>>   * Do I need to use the private key from the credential json for this
>>>     parameter https://github.com/kernelci/kernelci-backend/ <https://github.com/kernelci/
> kernelci-backend/> <https://github.com/kernelci/
>> kernelci-backend/>
>>>     blob/7e7bff2703c73b2a3a3734b7bcd0593cbe657705/app/utils/kcidb.py#L38
>>>     <https://github.com/kernelci/kernelci-backend/
>>>     blob/7e7bff2703c73b2a3a3734b7bcd0593cbe657705/app/utils/kcidb.py#L38>
>> 
>> Yes, that needs to be pointing to the credentials JSON file.
>> 
>>>   * As the storage server is internal , I guess we need to open access to
>>>     storage server for these urls https://github.com/kernelci/kernelci- <https://github.com/kernelci/kernelci->
> <https://github.com/kernelci/kernelci- <https://github.com/kernelci/kernelci->>
>>>     backend/blob/7e7bff2703c73b2a3a3734b7bcd0593cbe657705/app/utils/
>>>     kcidb.py#L173 <https://github.com/kernelci/kernelci-backend/
>>>     blob/7e7bff2703c73b2a3a3734b7bcd0593cbe657705/app/utils/kcidb.py#L173>
>>>     files so the kcidb server can access them . Can you confirm this , please
>> 
>> Yes, KCIDB right now will try to download every 256th URL you submit, that is
>> under 5MB. The artifact caching system is in trial mode still. However, what's
>> more important, *people* will try to open the URLs you submit.
>> 
>> Opening the access to the whole server might be problematic for you guys, as
>> you want to keep some results secret, IIRC. Maybe you could copy them to some
>> other web server and translate the URLs as you submit them?
>> 
>> Nick
>> 
>> On 10/7/24 7:49 PM, Manoj Kumar wrote:
>>> Hi Nick,
>>> 
>>> Nice to meet you too mate, I am going through the code base of kcidb.py to
>>> push results.
>>> 
>>> I will test pushing results to playground with the earlier credentials as you
>>> mentioned.
>>> 
>>>  
>>> 
>>> Also , I will be configuring internal kernelci deployment to push results to
>>> public KCIDB for builds and tests.
>>> 
>>>  
>>> 
>>> I do have some questions if you can help me find answer.
>>> 
>>>   * Do I need to use the private key from the credential json for this
>>>     parameter https://github.com/kernelci/kernelci-backend/ <https://github.com/kernelci/
> kernelci-backend/> <https://github.com/kernelci/
>> kernelci-backend/>
>>>     blob/7e7bff2703c73b2a3a3734b7bcd0593cbe657705/app/utils/kcidb.py#L38
>>>     <https://github.com/kernelci/kernelci-backend/
>>>     blob/7e7bff2703c73b2a3a3734b7bcd0593cbe657705/app/utils/kcidb.py#L38>
>>>   * As the storage server is internal , I guess we need to open access to
>>>     storage server for these urls https://github.com/kernelci/kernelci- <https://github.com/kernelci/kernelci->
> <https://github.com/kernelci/kernelci- <https://github.com/kernelci/kernelci->>
>>>     backend/blob/7e7bff2703c73b2a3a3734b7bcd0593cbe657705/app/utils/
>>>     kcidb.py#L173 <https://github.com/kernelci/kernelci-backend/
>>>     blob/7e7bff2703c73b2a3a3734b7bcd0593cbe657705/app/utils/kcidb.py#L173>
>>>     files so the kcidb server can access them . Can you confirm this , please
>>> 
>>>  
>>> 
>>> Br,
>>> 
>>> Manoj
>>> 
>>>  
>>> 
>>> *From: *Nikolai Kondrashov <Nikolai.Kondrashov@redhat.com>
>>> *Date: *Monday, 7 October 2024 at 12:15
>>> *To: *Manoj Kumar <ManojKumar08@arm.com>
>>> *Subject: *Re: KCIDB database
>>> 
>>> Hi Manoj,
>>> 
>>> Nice to meet you!
>>> 
>>> I'm glad to hear there's progress towards resuming KCIDB submissions at ARM!
>>> 
>>> The access parameters are out of date, although they will work for
>>> submissions. Here's more up-to-date info:
>>> 
>>> https://docs.kernelci.org/kcidb/submitter_guide/ <https://docs.kernelci.org/
> kcidb/submitter_guide/> <https://docs.kernelci.org/
>> kcidb/submitter_guide/> <https://docs.kernelci.org/
>>> kcidb/submitter_guide/>
>>> 
>>> The credentials I gave ARM before should still work. I'd recommend restarting
>>> submissions to the "playground" database ("playground_kcidb_new" topic) so you
>>> can experiment freely without worrying about bothering anyone with invalid
>>> data. Then when you're ready, switch to production ("kcidb_new").
>>> 
>>> Don't hesitate to reach out, if you have any questions. I'll add you as the
>>> ARM's current contact here:
>>> 
>>> https://github.com/kernelci/kcidb/issues/328 <https://github.com/kernelci/
> kcidb/issues/328> <https://github.com/kernelci/
>> kcidb/issues/328> <https://github.com/kernelci/
>>> kcidb/issues/328>
>>> 
>>> I think ARM doesn't let employees use Slack, but if I'm wrong, I can invite
>>> you to our channel, so we can have more interactive Q&A, if needed.
>>> 
>>> Nick
>>> 
>>> On 10/7/24 12:37 PM, Manoj Kumar wrote:
>>>> Hi Nikolai,
>>>> 
>>>> I wanted to say hello to you and start the initial thread regarding pushing
>>>> the test results to KernelCI KCIDB.
>>>> I will be enabling the changes to push kernel test and build results to KCIDB
>>>> from ARM testing . I was told by Cristian and Mark that you are the POC from
>>>> kernelCI KCIDB side.
>>>> 
>>>> The access parameters shared with me are below , can you confirm they are
>>>> still valid and not expired / updated .
>>>> 
>>>>  
>>>> 
>>>>  
>>>> 
>>>> The access parameters are:
>>>> 
>>>>          Google Cloud project name: kernelci-production
>>>>            Playground dataset name: playground_kernelci04
>>>> Playground submission queue topic: playground_kernelci_new
>>>>            Production dataset name: kernelci04
>>>> Production submission queue topic: kernelci_new
>>>> 
>>>>  
>>>> 
>>>> Regards,
>>>> 
>>>> Manoj
>>>> 
>>>>  
>>>> 
>>>> IMPORTANT NOTICE: The contents of this email and any attachments are
>>>> confidential and may also be privileged. If you are not the intended
>>>> recipient, please notify the sender immediately and do not disclose the
>>>> contents to any other person, use it for any purpose, or store or copy the
>>>> information in any medium. Thank you.
>>> 
>>> IMPORTANT NOTICE: The contents of this email and any attachments are
>>> confidential and may also be privileged. If you are not the intended
>>> recipient, please notify the sender immediately and do not disclose the
>>> contents to any other person, use it for any purpose, or store or copy the
>>> information in any medium. Thank you.
>> 
>> IMPORTANT NOTICE: The contents of this email and any attachments are
>> confidential and may also be privileged. If you are not the intended
>> recipient, please notify the sender immediately and do not disclose the
>> contents to any other person, use it for any purpose, or store or copy the
>> information in any medium. Thank you.
> 
> IMPORTANT NOTICE: The contents of this email and any attachments are
> confidential and may also be privileged. If you are not the intended
> recipient, please notify the sender immediately and do not disclose the
> contents to any other person, use it for any purpose, or store or copy the
> information in any medium. Thank you.

