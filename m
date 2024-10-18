Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9A772022C2
	for <kernelci@lists.linux.dev>; Fri, 18 Oct 2024 15:05:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729263954; cv=none; b=Gxpf2n8Q6ejbk8F36mTptU9vAksc6IhWOiptuszpMfZ4tg+vuCtFEcCBhA6TRWd1DUclMCfENo3C5Kmnvq0HGAVBThYZ2I2A/4+ecrp98xW/h7reUZugitx4eU+usIyZ+qr0Zqqj5P8N+Q+i+dTAuFdZsUaFJivf+J8gEXa4Qqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729263954; c=relaxed/simple;
	bh=AKm7G0ifzr4sGaGji10dWVypsdeS9xJ4ywqBxUQc4WI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kVf8Ioicj67vKOj+kzveG96VBccjWMwebiklR4xMZrKc7GKQceR9yInXC3odi4bQY/wPjMZWwNFCtzoX7/+gkm4Xn3Aj0ZuRO0qcB3/QuXPWoNDnBndE/Te1vHYzKYexfj9mKKRTcF09ALOWmLZtZwSQOPYu8mA8cTQEFcKi+9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=GTbccIJT; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GTbccIJT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1729263950;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2RUdvY6L1dyhhlZVxingQ1y4kQhxfaxbpD4gG+WUlZ8=;
	b=GTbccIJTt+FdnPedUEcEoDAwXUleY+hCKnEszC8iiarv2kYvEYJY6DM2Z7oK6b+bKHkV2w
	NxITY5FrQQ1FWgFvoTaS1fkg9Ay6SeNOMP7BayR4PqVuytooy0zgvUVN0A6D4FanSd1u9O
	0mTdoHzhTXnIIpa/iCdLaDv8JWmJDtM=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-516-ZZgqqUnPMSyAPkIR8ZPTPA-1; Fri, 18 Oct 2024 11:05:49 -0400
X-MC-Unique: ZZgqqUnPMSyAPkIR8ZPTPA-1
Received: by mail-lf1-f69.google.com with SMTP id 2adb3069b0e04-539e294566dso1771197e87.3
        for <kernelci@lists.linux.dev>; Fri, 18 Oct 2024 08:05:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729263947; x=1729868747;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2RUdvY6L1dyhhlZVxingQ1y4kQhxfaxbpD4gG+WUlZ8=;
        b=Ddp+KYwKNw6irQv0qvwMRbEai6clUVbdYguw0B+x8IvguG6m6m0d6dC5AbIVoibzsZ
         tWs4SET3+82+4jPE5Z4ZD350klnQT80Mv5I0XHAY6K2+w3OWUsK+JUw+WKlBVxeoOJtz
         akmZthNfyEjqHrTKK4iq9CPXZs0tlIIUZEUDatbBfhxOQ6X0B9Q4A4Vo5GwAix1dZGJw
         lCDLfnkpN3o0SalMIdHFaYYxNLQ/ga0O/KlpwBL2cnLPKWnngnBoculpa2UJjmCbI8pw
         a0wSOGhMwrdqNLDFRWvluqEJkhIuaJ0ZIPRouq2blt9sWfGuEq0AWTQN5i/UxV6gp8n8
         +fug==
X-Gm-Message-State: AOJu0YwqC1a4UaZFXANNRM9/rQWcZZ2/vfOQIbrOcFLzQsAt+ZBTa3gK
	rtQyLRKRlBUIIHGMnWn83aQ5x87tAruHE36U8JldZDPNyYZ3GvEyD1a5DgnWWLtr1vRUCgFVKDX
	VIeuuCerAvLH+C7j+bp7sVZrJH8aXYyE5AMkmotZPdzvU9KUT6+wYPrss
X-Received: by 2002:a05:6512:158d:b0:539:f689:3c30 with SMTP id 2adb3069b0e04-53a1546f0fdmr1498809e87.20.1729263947133;
        Fri, 18 Oct 2024 08:05:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFBCjhLFCfqJxEX4wiHlzJnBefDGGFXzVZmyn5sOIpG5mGYQvBXWNelNj7yRzn0gQI3fMgeDQ==
X-Received: by 2002:a05:6512:158d:b0:539:f689:3c30 with SMTP id 2adb3069b0e04-53a1546f0fdmr1498734e87.20.1729263945712;
        Fri, 18 Oct 2024 08:05:45 -0700 (PDT)
Received: from [192.168.0.166] (h-185-57-5-67.na.cust.bahnhof.fi. [185.57.5.67])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43160e4fd60sm25934835e9.43.2024.10.18.08.05.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Oct 2024 08:05:44 -0700 (PDT)
Message-ID: <fbfed2eb-d4f7-4c56-8549-de32dae29da8@redhat.com>
Date: Fri, 18 Oct 2024 18:05:44 +0300
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: KCIDB database
To: Manoj Kumar <ManojKumar08@arm.com>
Cc: "kernelci@lists.linux.dev" <kernelci@lists.linux.dev>,
 Denys Fedoryshchenko <denys.f@collabora.com>
References: <547ddf99-1b75-c463-e6c7-32389c461468@redhat.com>
 <AS8PR08MB6407FD1D5E33918F5DA6032A9E772@AS8PR08MB6407.eurprd08.prod.outlook.com>
 <PAXPR08MB6813993A4C70BDE277129A76C47D2@PAXPR08MB6813.eurprd08.prod.outlook.com>
 <d9f9111e-9890-4795-9f8a-a6946a8fcbb9@redhat.com>
 <PAXPR08MB68136B5FD6BFD45B2BC1BE2DC47D2@PAXPR08MB6813.eurprd08.prod.outlook.com>
 <9ab1e3c8-9c7f-4657-815a-13a68e0b87f7@redhat.com>
 <PAXPR08MB68139AC2C5DFA28EC9A4CCC6C47E2@PAXPR08MB6813.eurprd08.prod.outlook.com>
 <2626f2ce-adb0-4aad-bbfc-c19f634a4d30@redhat.com>
 <DB9PR08MB68103176F5638C352F410BCBC4402@DB9PR08MB6810.eurprd08.prod.outlook.com>
 <e90b3ccc-fd16-406b-ac8a-7d2bf66abd1f@redhat.com>
 <DB9PR08MB68104499218B100804567075C4402@DB9PR08MB6810.eurprd08.prod.outlook.com>
From: Nikolai Kondrashov <Nikolai.Kondrashov@redhat.com>
In-Reply-To: <DB9PR08MB68104499218B100804567075C4402@DB9PR08MB6810.eurprd08.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

> It is not that straight forward to update python version to python3.

Of course, and you cannot really do that, as KernelCI Legacy needs Python 2.
I was rather suggesting you install Python 3 alongside Python 2, if possible
for your target.

> This upgrade will be disruptive for our testing and deployment unless the
> KCIDB results push can be done with python2.7 which we will prefer at this
> point of time.

If this is hard, one (radical?) way to do this could be running Python 3 on a
different machine (in a container?) and executing kcidb-submit there, via e.g.
ssh (docker run?).

But perhaps others have other ideas.

Nick

On 10/18/24 5:04 PM, Manoj Kumar wrote:
> We used ansible playbooks to deploy backend server https://github.com/
> kernelci/kernelci-backend-config <https://github.com/kernelci/kernelci-
> backend-config>
> 
> Which create virtual environment based on python2.7
> 
> https://github.com/kernelci/kernelci-backend-config/
> commit/52d442759cc29ef2453fa5c9a2c90d3fc2c74071 <https://github.com/kernelci/
> kernelci-backend-config/commit/52d442759cc29ef2453fa5c9a2c90d3fc2c74071>
> 
>  
> 
> It is not that straight forward to update python version to python3.
> 
> This upgrade will be disruptive for our testing and deployment unless the
> KCIDB results push can be done with python2.7 which we will prefer at this
> point of time.
> 
>  
> 
> br,
> 
> Manoj
> 
>  
> 
> *From: *Nikolai Kondrashov <Nikolai.Kondrashov@redhat.com>
> *Date: *Friday, 18 October 2024 at 14:32
> *To: *Manoj Kumar <ManojKumar08@arm.com>
> *Cc: *kernelci@lists.linux.dev <kernelci@lists.linux.dev>, Denys
> Fedoryshchenko <denys.f@collabora.com>
> *Subject: *Re: KCIDB database
> 
> Hi Manoj,
> 
>> I looked at the below link to get installation steps for the kcidb-submit
> command.
>>
>> https://docs.kernelci.org/kcidb/installation/ <https://docs.kernelci.org/
> kcidb/installation/> <https://docs.kernelci.org/
>> kcidb/installation/>
>>
>> This instruction is for Python version V3.9 but our backend is using the
>> Python 2.7.16 at the moment.
>>
>> Do you have instruction for python 2.7.16 to install this package
> 
> KCIDB requires Python 3, and that's why KernelCI Legacy (which requires Python
> 2) is invoking the kcidb-submit command-line tool in a new process instead of
> using the KCIDB library directly.
> 
> You will need to install Python 3 in your deployment, I assume. Perhaps Denys,
> or someone else on the KernelCI maillist (both CC'd) could tell you how we did
> that.
> 
> Nick
> 
> On 10/18/24 4:21 PM, Manoj Kumar wrote:
>> Hi Nikolai,
>> 
>>  
>> 
>> I am planning to push test build data to public KCIDB . I am seeing a failure
>> because of the kcidb-submit command in a thread at backend.
>> 
>>  
>> 
>> The class KcidbSubmit expect the command kcidb-submit installed on the backend
>> system.
>> 
>> /class KcidbSubmit(object):/
>> 
>> /    def __init__(self, kcidb_options):/
>> 
>> /        kcidb_path = kcidb_options.get("kcidb_path", "")/
>> 
>> /        self.kcidb_submit_cmd = os.path.join(kcidb_path, "kcidb-submit")/
>> 
>>  
>> 
>> I looked at the below link to get installation steps for the kcidb-submit command.
>> 
>> https://docs.kernelci.org/kcidb/installation/ <https://docs.kernelci.org/
> kcidb/installation/> <https://docs.kernelci.org/
>> kcidb/installation/>
>> 
>>  
>> 
>> This instruction is for Python version V3.9 but our backend is using the
>> Python 2.7.16 at the moment.
>> 
>> Do you have instruction for python 2.7.16 to install this package
>> 
>>  
>> 
>> Br,
>> 
>> Manoj
>> 
>>  
>> 
>> *From: *Nikolai Kondrashov <Nikolai.Kondrashov@redhat.com>
>> *Date: *Tuesday, 8 October 2024 at 11:46
>> *To: *Manoj Kumar <ManojKumar08@arm.com>
>> *Subject: *Re: KCIDB database
>> 
>> Hi Manoj,
>> 
>> On 10/8/24 1:26 PM, Manoj Kumar wrote:
>>> One additional question regarding the credentials file.
>>>
>>> Attached credentials files was shared with me named  “.kernelci-production-ci-
>>> arm.json” .
>>>
>>> The attached file contains multiple parameters , If I understood correctly all
>>> the contents of this file should be assigned to this variable https://
>>> github.com/kernelci/kernelci-backend/
>>> blob/7e7bff2703c73b2a3a3734b7bcd0593cbe657705/app/utils/kcidb.py#L38 <https://
>>> github.com/kernelci/kernelci-backend/
>>> blob/7e7bff2703c73b2a3a3734b7bcd0593cbe657705/app/utils/kcidb.py#L38>
>> 
>> Not the contents, but a path to the file itself.
>> 
>>> Also , the email ID used by internal kernelCI deployment is different . They
>>> will be “bot@kernelci-dev.oss.arm.com <mailto:bot@kernelci-dev.oss.arm.com <mailto:bot@kernelci-dev.oss.arm.com <mailto:bot@kernelci-dev.oss.arm.com>>>
>>> and bot@kernelci.oss.arm.com <mailto:bot@kernelci.oss.arm.com <mailto:bot@kernelci.oss.arm.com <mailto:bot@kernelci.oss.arm.com>>>”.
>> 
>> That doesn't matter, the email in the JSON credentials is simply a user
>> (service account) ID and is specific to Google Cloud. It identifies a
>> particular submitter to the system.
>> 
>> You don't really need to look into the credentials file at all.
>> 
>> Nick
>> 
>> On 10/8/24 1:26 PM, Manoj Kumar wrote:
>>> Hi Nick,
>>> 
>>>  
>>> 
>>> Thanks for your prompt responses :thumbsup
>>> 
>>>  
>>> 
>>> One additional question regarding the credentials file.
>>> 
>>> Attached credentials files was shared with me named  “.kernelci-production-ci-
>>> arm.json” .
>>> 
>>> The attached file contains multiple parameters , If I understood correctly all
>>> the contents of this file should be assigned to this variable https://
>>> github.com/kernelci/kernelci-backend/
>>> blob/7e7bff2703c73b2a3a3734b7bcd0593cbe657705/app/utils/kcidb.py#L38 <https://
>>> github.com/kernelci/kernelci-backend/
>>> blob/7e7bff2703c73b2a3a3734b7bcd0593cbe657705/app/utils/kcidb.py#L38>
>>> 
>>>  
>>> 
>>> Also , the email ID used by internal kernelCI deployment is different . They
>>> will be “bot@kernelci-dev.oss.arm.com <mailto:bot@kernelci-dev.oss.arm.com <mailto:bot@kernelci-dev.oss.arm.com <mailto:bot@kernelci-dev.oss.arm.com>>>
>>> and bot@kernelci.oss.arm.com <mailto:bot@kernelci.oss.arm.com <mailto:bot@kernelci.oss.arm.com <mailto:bot@kernelci.oss.arm.com>>>”.
>>> 
>>>  
>>> 
>>> Br,
>>> 
>>> Manoj
>>> 
>>>  
>>> 
>>>  
>>> 
>>> *From: *Nikolai Kondrashov <Nikolai.Kondrashov@redhat.com>
>>> *Date: *Tuesday, 8 October 2024 at 05:36
>>> *To: *Manoj Kumar <ManojKumar08@arm.com>
>>> *Subject: *Re: KCIDB database
>>> 
>>> On 10/7/24 7:49 PM, Manoj Kumar wrote:
>>>> I do have some questions if you can help me find answer.
>>>>
>>>>   * Do I need to use the private key from the credential json for this
>>>>     parameter https://github.com/kernelci/kernelci-backend/ <https://github.com/kernelci/
> kernelci-backend/> <https://github.com/kernelci/
>> kernelci-backend/> <https://github.com/kernelci/
>>> kernelci-backend/>
>>>>     blob/7e7bff2703c73b2a3a3734b7bcd0593cbe657705/app/utils/kcidb.py#L38
>>>>     <https://github.com/kernelci/kernelci-backend/
>>>>     blob/7e7bff2703c73b2a3a3734b7bcd0593cbe657705/app/utils/kcidb.py#L38>
>>> 
>>> Yes, that needs to be pointing to the credentials JSON file.
>>> 
>>>>   * As the storage server is internal , I guess we need to open access to
>>>>     storage server for these urls https://github.com/kernelci/kernelci- <https://github.com/kernelci/kernelci->
> <https://github.com/kernelci/kernelci- <https://github.com/kernelci/kernelci->>
>> <https://github.com/kernelci/kernelci- <https://github.com/kernelci/kernelci- <https://github.com/kernelci/kernelci->>>
>>>>     backend/blob/7e7bff2703c73b2a3a3734b7bcd0593cbe657705/app/utils/
>>>>     kcidb.py#L173 <https://github.com/kernelci/kernelci-backend/
>>>>     blob/7e7bff2703c73b2a3a3734b7bcd0593cbe657705/app/utils/kcidb.py#L173>
>>>>     files so the kcidb server can access them . Can you confirm this , please
>>> 
>>> Yes, KCIDB right now will try to download every 256th URL you submit, that is
>>> under 5MB. The artifact caching system is in trial mode still. However, what's
>>> more important, *people* will try to open the URLs you submit.
>>> 
>>> Opening the access to the whole server might be problematic for you guys, as
>>> you want to keep some results secret, IIRC. Maybe you could copy them to some
>>> other web server and translate the URLs as you submit them?
>>> 
>>> Nick
>>> 
>>> On 10/7/24 7:49 PM, Manoj Kumar wrote:
>>>> Hi Nick,
>>>> 
>>>> Nice to meet you too mate, I am going through the code base of kcidb.py to
>>>> push results.
>>>> 
>>>> I will test pushing results to playground with the earlier credentials as you
>>>> mentioned.
>>>> 
>>>>  
>>>> 
>>>> Also , I will be configuring internal kernelci deployment to push results to
>>>> public KCIDB for builds and tests.
>>>> 
>>>>  
>>>> 
>>>> I do have some questions if you can help me find answer.
>>>> 
>>>>   * Do I need to use the private key from the credential json for this
>>>>     parameter https://github.com/kernelci/kernelci-backend/ <https://github.com/kernelci/
> kernelci-backend/> <https://github.com/kernelci/
>> kernelci-backend/> <https://github.com/kernelci/
>>> kernelci-backend/>
>>>>     blob/7e7bff2703c73b2a3a3734b7bcd0593cbe657705/app/utils/kcidb.py#L38
>>>>     <https://github.com/kernelci/kernelci-backend/
>>>>     blob/7e7bff2703c73b2a3a3734b7bcd0593cbe657705/app/utils/kcidb.py#L38>
>>>>   * As the storage server is internal , I guess we need to open access to
>>>>     storage server for these urls https://github.com/kernelci/kernelci- <https://github.com/kernelci/kernelci->
> <https://github.com/kernelci/kernelci- <https://github.com/kernelci/kernelci->>
>> <https://github.com/kernelci/kernelci- <https://github.com/kernelci/kernelci- <https://github.com/kernelci/kernelci->>>
>>>>     backend/blob/7e7bff2703c73b2a3a3734b7bcd0593cbe657705/app/utils/
>>>>     kcidb.py#L173 <https://github.com/kernelci/kernelci-backend/
>>>>     blob/7e7bff2703c73b2a3a3734b7bcd0593cbe657705/app/utils/kcidb.py#L173>
>>>>     files so the kcidb server can access them . Can you confirm this , please
>>>> 
>>>>  
>>>> 
>>>> Br,
>>>> 
>>>> Manoj
>>>> 
>>>>  
>>>> 
>>>> *From: *Nikolai Kondrashov <Nikolai.Kondrashov@redhat.com>
>>>> *Date: *Monday, 7 October 2024 at 12:15
>>>> *To: *Manoj Kumar <ManojKumar08@arm.com>
>>>> *Subject: *Re: KCIDB database
>>>> 
>>>> Hi Manoj,
>>>> 
>>>> Nice to meet you!
>>>> 
>>>> I'm glad to hear there's progress towards resuming KCIDB submissions at ARM!
>>>> 
>>>> The access parameters are out of date, although they will work for
>>>> submissions. Here's more up-to-date info:
>>>> 
>>>> https://docs.kernelci.org/kcidb/submitter_guide/ <https://docs.kernelci.org/
> kcidb/submitter_guide/> <https://docs.kernelci.org/
>> kcidb/submitter_guide/> <https://docs.kernelci.org/
>>> kcidb/submitter_guide/> <https://docs.kernelci.org/
>>>> kcidb/submitter_guide/>
>>>> 
>>>> The credentials I gave ARM before should still work. I'd recommend restarting
>>>> submissions to the "playground" database ("playground_kcidb_new" topic) so you
>>>> can experiment freely without worrying about bothering anyone with invalid
>>>> data. Then when you're ready, switch to production ("kcidb_new").
>>>> 
>>>> Don't hesitate to reach out, if you have any questions. I'll add you as the
>>>> ARM's current contact here:
>>>> 
>>>> https://github.com/kernelci/kcidb/issues/328 <https://github.com/kernelci/
> kcidb/issues/328> <https://github.com/kernelci/
>> kcidb/issues/328> <https://github.com/kernelci/
>>> kcidb/issues/328> <https://github.com/kernelci/
>>>> kcidb/issues/328>
>>>> 
>>>> I think ARM doesn't let employees use Slack, but if I'm wrong, I can invite
>>>> you to our channel, so we can have more interactive Q&A, if needed.
>>>> 
>>>> Nick
>>>> 
>>>> On 10/7/24 12:37 PM, Manoj Kumar wrote:
>>>>> Hi Nikolai,
>>>>> 
>>>>> I wanted to say hello to you and start the initial thread regarding pushing
>>>>> the test results to KernelCI KCIDB.
>>>>> I will be enabling the changes to push kernel test and build results to KCIDB
>>>>> from ARM testing . I was told by Cristian and Mark that you are the POC from
>>>>> kernelCI KCIDB side.
>>>>> 
>>>>> The access parameters shared with me are below , can you confirm they are
>>>>> still valid and not expired / updated .
>>>>> 
>>>>>  
>>>>> 
>>>>>  
>>>>> 
>>>>> The access parameters are:
>>>>> 
>>>>>          Google Cloud project name: kernelci-production
>>>>>            Playground dataset name: playground_kernelci04
>>>>> Playground submission queue topic: playground_kernelci_new
>>>>>            Production dataset name: kernelci04
>>>>> Production submission queue topic: kernelci_new
>>>>> 
>>>>>  
>>>>> 
>>>>> Regards,
>>>>> 
>>>>> Manoj
>>>>> 
>>>>>  
>>>>> 
>>>>> IMPORTANT NOTICE: The contents of this email and any attachments are
>>>>> confidential and may also be privileged. If you are not the intended
>>>>> recipient, please notify the sender immediately and do not disclose the
>>>>> contents to any other person, use it for any purpose, or store or copy the
>>>>> information in any medium. Thank you.
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

