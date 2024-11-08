Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EAB91EABA3
	for <kernelci@lists.linux.dev>; Fri,  8 Nov 2024 13:15:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731071731; cv=none; b=qFDt0K8DSjLVf+Bw//rhX7T6SebNRP4YQMp+oxlH0z2PBHTHLJPHJrWjslevWExnwlRzg8+MqZ8gp0gFFB8b8MXZHT55hvJfB7BNhR8M86ZJKibnjuUIkdxs6CtnL+DhqlVi0s20L1UmXUYisBJjVfJdI+RIrTr2GC8bQmwC+vs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731071731; c=relaxed/simple;
	bh=KdrgIhf04+SxMsygTXygRuUW7DrTY+Gt3t2U2zFmg8M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lps9kIzxRjf1lLbL6jgvgDvwTYaEqx4fUeqhUHH+ccRVC518N9QwHie4C8TCiQVfFBWg/xyrpZlIXeTMCdrjDxKd9e83Lo36WwXmApF8cdsC5TB/L39SeWdB2QoglX3oLEydBmn7lmsec7sqbqilIYswM5mlNEYEj9XG2FkJ5B0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=SfKlwJLD; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="SfKlwJLD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1731071728;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XqSv0BasALwEc87j45L8PzqKE/5S6JoSVQG5TwsNVzo=;
	b=SfKlwJLD6UqWftCAKMrSikAUBkfIzk6Vc78EJR1yBUqz8i3Vea97NokulhWHC4yg1TQoXb
	2QFdqvmNqzYfi/Kd/t0O5ODDHBBGC5d361ha/O6TAgaraVfHn2NK4HN0yDVELu72gkFRT6
	5tsEK9DQGUHaLa869rCvnFac1IorkAA=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-690-X-e5JcIDOJ6xdaQGmgKuBg-1; Fri, 08 Nov 2024 08:15:27 -0500
X-MC-Unique: X-e5JcIDOJ6xdaQGmgKuBg-1
X-Mimecast-MFC-AGG-ID: X-e5JcIDOJ6xdaQGmgKuBg
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-37d563a1af4so1047084f8f.2
        for <kernelci@lists.linux.dev>; Fri, 08 Nov 2024 05:15:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731071725; x=1731676525;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XqSv0BasALwEc87j45L8PzqKE/5S6JoSVQG5TwsNVzo=;
        b=gN1VcTbzZ16/wWb5NGAVWpQYdt03hq17L/zm51GtlDdfd4NvA9sZUwrMeNomY1jlds
         EofYdd1zShW2zQbGZv9w8IJ4gsJ8Hfn3amWJPPNxg2bz9vdEezcJJ90jdVtj5HMWDi8U
         60+227UhC8y2qc41QGvCqGVP+Lb81c7mtLdz2aO00izHbCGncl2LvcnxQOWg1gCXGJ/e
         0ZeH4sMHUlBadel688ylRCLr/sC+AgTEQ0nErYx59z75heX+lhd3peJUE/8OY1YBcAya
         WyC6yscAlAZZyCU/w3tI2WhDsLDwOCkRmLpdSZoNn5FpOah529zWJblTndQSEbDKUZ5H
         qC5w==
X-Gm-Message-State: AOJu0Yyg2aM7Q4kSugtBWX0ntaXUi4emd+B31avGcrjELnDkRhLFUpNG
	pA8a2PM1gqBe3FelWl7hkzi60Fg2SBsDr2phHwvn32Uam1DcSpUSS4cgLWZTa2hcPrMrYoy9UCR
	IScs3ALvhBCwoWH9MlJXmxfSRfXZDxjk82JgFeWvPCgT5EIZNKzeOSnAiS1A8+mUq
X-Received: by 2002:a05:6000:1ac9:b0:37d:461d:b1ea with SMTP id ffacd0b85a97d-381f1885defmr2438822f8f.48.1731071724993;
        Fri, 08 Nov 2024 05:15:24 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH7vrvTZRq2uOKt+UbjASDTd6bHE1HFjtP9B8jl9sFUEGyRevW8zXAPelFrhTfF355SJgH9eA==
X-Received: by 2002:a05:6000:1ac9:b0:37d:461d:b1ea with SMTP id ffacd0b85a97d-381f1885defmr2438794f8f.48.1731071724461;
        Fri, 08 Nov 2024 05:15:24 -0800 (PST)
Received: from [192.168.0.166] (h-185-57-5-67.na.cust.bahnhof.fi. [185.57.5.67])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381ed99681csm4878915f8f.49.2024.11.08.05.15.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 Nov 2024 05:15:23 -0800 (PST)
Message-ID: <4f93cd0c-5927-4734-af42-1b6c4f0f8208@redhat.com>
Date: Fri, 8 Nov 2024 15:15:22 +0200
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
 <fbfed2eb-d4f7-4c56-8549-de32dae29da8@redhat.com>
 <DB9PR08MB68109AF608CFB742F567968DC4532@DB9PR08MB6810.eurprd08.prod.outlook.com>
From: Nikolai Kondrashov <Nikolai.Kondrashov@redhat.com>
In-Reply-To: <DB9PR08MB68109AF608CFB742F567968DC4532@DB9PR08MB6810.eurprd08.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 58Fj2n3ftwjbpY7h0g4TW08cd3sZUiEQCCJ5iqh_blM_1731071726
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Manoj,

Glad to hear you managed to make it work!

It looks like KernelCI legacy is sending schema v1 indeed:
https://github.com/kernelci/kernelci-backend/blob/7e7bff2703c73b2a3a3734b7bcd0593cbe657705/app/utils/kcidb.py#L149

Gosh, that's old. However, it's working fine in production.

I suspect this is because production is using an older version of KCIDB, and
in newer versions support for old schemas is broken. I'll work on a fix, which
should be available today. Meanwhile, could you please respond with a complete
JSON you're sending, as an attachment, so I could make sure I reproduce this
correctly.

Thank you!
Nick

On 11/8/24 11:59 AM, Manoj Kumar wrote:
> Hi Nikolai,
> 
>  
> 
> I managed to create virtual environment python3.9 on kernelci backend and
> worked my way up to push a build message to the kcidb database.
> 
> The backend code is generating data structure with schema version “1”.
> 
> Below is the content of the message after adding a debug print.
> 
>    "builds": [
> 
>      {
> 
>        "origin": "arm",
> 
>        "config_name": "x86_64_defconfig",
> 
>        "architecture": "x86_64",
> 
>        "start_time": "2024-10-16T11:30:41.592000+00:00",
> 
>        "revision_origin_id": "2f87d0916ce0d2925cedbc9e8f5d6291ba2ac7b2",
> 
>        "log_url": "",
> 
>        "duration": "1224.9012200832367",
> 
>        "origin_id": "kernelci.org:670fa3e1e5905849ba40dabe",
> 
>        "description": "v6.12-rc3-44-g2f87d0916ce0",
> 
>        "misc": {
> 
>          "kernel_image_size": ""
> 
>        },
> 
>        "valid": "true",
> 
>        "compiler": "gcc (Debian 12.2.0-14) 12.2.0",
> 
>        "revision_origin": "arm",
> 
>        "config_url": "",
> 
>        "output_files": []
> 
>      }
> 
>    ],
> 
>    *"version": "1"*
> 
>  
> 
>  
> 
> In response to the above , I got a validation failure from the KCIDB server
> which is expecting structure/ schema version to be high
> 
> ValidationError: '1' is not of type 'object'
> 
> Failed validating 'type' in schema['properties']['version']:
> 
>      {'type': 'object',
> 
>       'properties': {'major': {'type': 'integer',
> 
>                                'const': 4,
> 
>                                'description': 'Major number of the schema '
> 
>                                               'version.\n'
> 
>                                               '\n'
> 
>                                               'Increases represent '
> 
>                                               'backward-incompatible '
> 
>                                               'changes. E.g. deleting or '
> 
>                                               'renaming a property, '
> 
>                                               'changing a property type, '
> 
>                                               'restricting values, making a '
> 
>                                               'property required, or adding '
> 
>                                               'a new required property.'},
> 
>  
> 
> My question to you , what is the expected schema version on the Kernelci
> legacy backend code so that the message will be accepted by KCIDB database
> 
>  
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
> *Date: *Friday, 18 October 2024 at 16:05
> *To: *Manoj Kumar <ManojKumar08@arm.com>
> *Cc: *kernelci@lists.linux.dev <kernelci@lists.linux.dev>, Denys
> Fedoryshchenko <denys.f@collabora.com>
> *Subject: *Re: KCIDB database
> 
>> It is not that straight forward to update python version to python3.
> 
> Of course, and you cannot really do that, as KernelCI Legacy needs Python 2.
> I was rather suggesting you install Python 3 alongside Python 2, if possible
> for your target.
> 
>> This upgrade will be disruptive for our testing and deployment unless the
>> KCIDB results push can be done with python2.7 which we will prefer at this
>> point of time.
> 
> If this is hard, one (radical?) way to do this could be running Python 3 on a
> different machine (in a container?) and executing kcidb-submit there, via e.g.
> ssh (docker run?).
> 
> But perhaps others have other ideas.
> 
> Nick
> 
> On 10/18/24 5:04 PM, Manoj Kumar wrote:
>> We used ansible playbooks to deploy backend server https://github.com/ <https://github.com/>
>> kernelci/kernelci-backend-config <https://github.com/kernelci/kernelci-
>> backend-config>
>> 
>> Which create virtual environment based on python2.7
>> 
>> https://github.com/kernelci/kernelci-backend-config/ <https://github.com/
> kernelci/kernelci-backend-config/>
>> commit/52d442759cc29ef2453fa5c9a2c90d3fc2c74071 <https://github.com/kernelci/
>> kernelci-backend-config/commit/52d442759cc29ef2453fa5c9a2c90d3fc2c74071>
>> 
>>  
>> 
>> It is not that straight forward to update python version to python3.
>> 
>> This upgrade will be disruptive for our testing and deployment unless the
>> KCIDB results push can be done with python2.7 which we will prefer at this
>> point of time.
>> 
>>  
>> 
>> br,
>> 
>> Manoj
>> 
>>  
>> 
>> *From: *Nikolai Kondrashov <Nikolai.Kondrashov@redhat.com>
>> *Date: *Friday, 18 October 2024 at 14:32
>> *To: *Manoj Kumar <ManojKumar08@arm.com>
>> *Cc: *kernelci@lists.linux.dev <kernelci@lists.linux.dev>, Denys
>> Fedoryshchenko <denys.f@collabora.com>
>> *Subject: *Re: KCIDB database
>> 
>> Hi Manoj,
>> 
>>> I looked at the below link to get installation steps for the kcidb-submit
>> command.
>>>
>>> https://docs.kernelci.org/kcidb/installation/ <https://docs.kernelci.org/
> kcidb/installation/> <https://docs.kernelci.org/
>> kcidb/installation/> <https://docs.kernelci.org/
>>> kcidb/installation/>
>>>
>>> This instruction is for Python version V3.9 but our backend is using the
>>> Python 2.7.16 at the moment.
>>>
>>> Do you have instruction for python 2.7.16 to install this package
>> 
>> KCIDB requires Python 3, and that's why KernelCI Legacy (which requires Python
>> 2) is invoking the kcidb-submit command-line tool in a new process instead of
>> using the KCIDB library directly.
>> 
>> You will need to install Python 3 in your deployment, I assume. Perhaps Denys,
>> or someone else on the KernelCI maillist (both CC'd) could tell you how we did
>> that.
>> 
>> Nick
>> 
>> On 10/18/24 4:21 PM, Manoj Kumar wrote:
>>> Hi Nikolai,
>>> 
>>>  
>>> 
>>> I am planning to push test build data to public KCIDB . I am seeing a failure
>>> because of the kcidb-submit command in a thread at backend.
>>> 
>>>  
>>> 
>>> The class KcidbSubmit expect the command kcidb-submit installed on the backend
>>> system.
>>> 
>>> /class KcidbSubmit(object):/
>>> 
>>> /    def __init__(self, kcidb_options):/
>>> 
>>> /        kcidb_path = kcidb_options.get("kcidb_path", "")/
>>> 
>>> /        self.kcidb_submit_cmd = os.path.join(kcidb_path, "kcidb-submit")/
>>> 
>>>  
>>> 
>>> I looked at the below link to get installation steps for the kcidb-submit command.
>>> 
>>> https://docs.kernelci.org/kcidb/installation/ <https://docs.kernelci.org/
> kcidb/installation/> <https://docs.kernelci.org/
>> kcidb/installation/> <https://docs.kernelci.org/
>>> kcidb/installation/>
>>> 
>>>  
>>> 
>>> This instruction is for Python version V3.9 but our backend is using the
>>> Python 2.7.16 at the moment.
>>> 
>>> Do you have instruction for python 2.7.16 to install this package
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
>>> *Date: *Tuesday, 8 October 2024 at 11:46
>>> *To: *Manoj Kumar <ManojKumar08@arm.com>
>>> *Subject: *Re: KCIDB database
>>> 
>>> Hi Manoj,
>>> 
>>> On 10/8/24 1:26 PM, Manoj Kumar wrote:
>>>> One additional question regarding the credentials file.
>>>>
>>>> Attached credentials files was shared with me named  “.kernelci-production-ci-
>>>> arm.json” .
>>>>
>>>> The attached file contains multiple parameters , If I understood correctly all
>>>> the contents of this file should be assigned to this variable https://
>>>> github.com/kernelci/kernelci-backend/
>>>> blob/7e7bff2703c73b2a3a3734b7bcd0593cbe657705/app/utils/kcidb.py#L38 <https://
>>>> github.com/kernelci/kernelci-backend/
>>>> blob/7e7bff2703c73b2a3a3734b7bcd0593cbe657705/app/utils/kcidb.py#L38>
>>> 
>>> Not the contents, but a path to the file itself.
>>> 
>>>> Also , the email ID used by internal kernelCI deployment is different . They
>>>> will be “bot@kernelci-dev.oss.arm.com <mailto:bot@kernelci-dev.oss.arm.com <mailto:bot@kernelci-dev.oss.arm.com <mailto:bot@kernelci-dev.oss.arm.com <mailto:bot@kernelci-dev.oss.arm.com>>>>
>>>> and bot@kernelci.oss.arm.com <mailto:bot@kernelci.oss.arm.com <mailto:bot@kernelci.oss.arm.com <mailto:bot@kernelci.oss.arm.com <mailto:bot@kernelci.oss.arm.com>>>>”.
>>> 
>>> That doesn't matter, the email in the JSON credentials is simply a user
>>> (service account) ID and is specific to Google Cloud. It identifies a
>>> particular submitter to the system.
>>> 
>>> You don't really need to look into the credentials file at all.
>>> 
>>> Nick
>>> 
>>> On 10/8/24 1:26 PM, Manoj Kumar wrote:
>>>> Hi Nick,
>>>> 
>>>>  
>>>> 
>>>> Thanks for your prompt responses :thumbsup
>>>> 
>>>>  
>>>> 
>>>> One additional question regarding the credentials file.
>>>> 
>>>> Attached credentials files was shared with me named  “.kernelci-production-ci-
>>>> arm.json” .
>>>> 
>>>> The attached file contains multiple parameters , If I understood correctly all
>>>> the contents of this file should be assigned to this variable https://
>>>> github.com/kernelci/kernelci-backend/
>>>> blob/7e7bff2703c73b2a3a3734b7bcd0593cbe657705/app/utils/kcidb.py#L38 <https://
>>>> github.com/kernelci/kernelci-backend/
>>>> blob/7e7bff2703c73b2a3a3734b7bcd0593cbe657705/app/utils/kcidb.py#L38>
>>>> 
>>>>  
>>>> 
>>>> Also , the email ID used by internal kernelCI deployment is different . They
>>>> will be “bot@kernelci-dev.oss.arm.com <mailto:bot@kernelci-dev.oss.arm.com <mailto:bot@kernelci-dev.oss.arm.com <mailto:bot@kernelci-dev.oss.arm.com <mailto:bot@kernelci-dev.oss.arm.com>>>>
>>>> and bot@kernelci.oss.arm.com <mailto:bot@kernelci.oss.arm.com <mailto:bot@kernelci.oss.arm.com <mailto:bot@kernelci.oss.arm.com <mailto:bot@kernelci.oss.arm.com>>>>”.
>>>> 
>>>>  
>>>> 
>>>> Br,
>>>> 
>>>> Manoj
>>>> 
>>>>  
>>>> 
>>>>  
>>>> 
>>>> *From: *Nikolai Kondrashov <Nikolai.Kondrashov@redhat.com>
>>>> *Date: *Tuesday, 8 October 2024 at 05:36
>>>> *To: *Manoj Kumar <ManojKumar08@arm.com>
>>>> *Subject: *Re: KCIDB database
>>>> 
>>>> On 10/7/24 7:49 PM, Manoj Kumar wrote:
>>>>> I do have some questions if you can help me find answer.
>>>>>
>>>>>   * Do I need to use the private key from the credential json for this
>>>>>     parameter https://github.com/kernelci/kernelci-backend/ <https://github.com/kernelci/
> kernelci-backend/> <https://github.com/kernelci/
>> kernelci-backend/> <https://github.com/kernelci/
>>> kernelci-backend/> <https://github.com/kernelci/
>>>> kernelci-backend/>
>>>>>     blob/7e7bff2703c73b2a3a3734b7bcd0593cbe657705/app/utils/kcidb.py#L38
>>>>>     <https://github.com/kernelci/kernelci-backend/
>>>>>     blob/7e7bff2703c73b2a3a3734b7bcd0593cbe657705/app/utils/kcidb.py#L38>
>>>> 
>>>> Yes, that needs to be pointing to the credentials JSON file.
>>>> 
>>>>>   * As the storage server is internal , I guess we need to open access to
>>>>>     storage server for these urls https://github.com/kernelci/kernelci- <https://github.com/kernelci/kernelci->
> <https://github.com/kernelci/kernelci- <https://github.com/kernelci/kernelci->>
>> <https://github.com/kernelci/kernelci- <https://github.com/kernelci/kernelci- <https://github.com/kernelci/kernelci->>>
>>> <https://github.com/kernelci/kernelci- <https://github.com/kernelci/kernelci- <https://github.com/kernelci/kernelci- <https://github.com/kernelci/kernelci->>>>
>>>>>     backend/blob/7e7bff2703c73b2a3a3734b7bcd0593cbe657705/app/utils/
>>>>>     kcidb.py#L173 <https://github.com/kernelci/kernelci-backend/
>>>>>     blob/7e7bff2703c73b2a3a3734b7bcd0593cbe657705/app/utils/kcidb.py#L173>
>>>>>     files so the kcidb server can access them . Can you confirm this , please
>>>> 
>>>> Yes, KCIDB right now will try to download every 256th URL you submit, that is
>>>> under 5MB. The artifact caching system is in trial mode still. However, what's
>>>> more important, *people* will try to open the URLs you submit.
>>>> 
>>>> Opening the access to the whole server might be problematic for you guys, as
>>>> you want to keep some results secret, IIRC. Maybe you could copy them to some
>>>> other web server and translate the URLs as you submit them?
>>>> 
>>>> Nick
>>>> 
>>>> On 10/7/24 7:49 PM, Manoj Kumar wrote:
>>>>> Hi Nick,
>>>>> 
>>>>> Nice to meet you too mate, I am going through the code base of kcidb.py to
>>>>> push results.
>>>>> 
>>>>> I will test pushing results to playground with the earlier credentials as you
>>>>> mentioned.
>>>>> 
>>>>>  
>>>>> 
>>>>> Also , I will be configuring internal kernelci deployment to push results to
>>>>> public KCIDB for builds and tests.
>>>>> 
>>>>>  
>>>>> 
>>>>> I do have some questions if you can help me find answer.
>>>>> 
>>>>>   * Do I need to use the private key from the credential json for this
>>>>>     parameter https://github.com/kernelci/kernelci-backend/ <https://github.com/kernelci/
> kernelci-backend/> <https://github.com/kernelci/
>> kernelci-backend/> <https://github.com/kernelci/
>>> kernelci-backend/> <https://github.com/kernelci/
>>>> kernelci-backend/>
>>>>>     blob/7e7bff2703c73b2a3a3734b7bcd0593cbe657705/app/utils/kcidb.py#L38
>>>>>     <https://github.com/kernelci/kernelci-backend/
>>>>>     blob/7e7bff2703c73b2a3a3734b7bcd0593cbe657705/app/utils/kcidb.py#L38>
>>>>>   * As the storage server is internal , I guess we need to open access to
>>>>>     storage server for these urls https://github.com/kernelci/kernelci- <https://github.com/kernelci/kernelci->
> <https://github.com/kernelci/kernelci- <https://github.com/kernelci/kernelci->>
>> <https://github.com/kernelci/kernelci- <https://github.com/kernelci/kernelci- <https://github.com/kernelci/kernelci->>>
>>> <https://github.com/kernelci/kernelci- <https://github.com/kernelci/kernelci- <https://github.com/kernelci/kernelci- <https://github.com/kernelci/kernelci->>>>
>>>>>     backend/blob/7e7bff2703c73b2a3a3734b7bcd0593cbe657705/app/utils/
>>>>>     kcidb.py#L173 <https://github.com/kernelci/kernelci-backend/
>>>>>     blob/7e7bff2703c73b2a3a3734b7bcd0593cbe657705/app/utils/kcidb.py#L173>
>>>>>     files so the kcidb server can access them . Can you confirm this , please
>>>>> 
>>>>>  
>>>>> 
>>>>> Br,
>>>>> 
>>>>> Manoj
>>>>> 
>>>>>  
>>>>> 
>>>>> *From: *Nikolai Kondrashov <Nikolai.Kondrashov@redhat.com>
>>>>> *Date: *Monday, 7 October 2024 at 12:15
>>>>> *To: *Manoj Kumar <ManojKumar08@arm.com>
>>>>> *Subject: *Re: KCIDB database
>>>>> 
>>>>> Hi Manoj,
>>>>> 
>>>>> Nice to meet you!
>>>>> 
>>>>> I'm glad to hear there's progress towards resuming KCIDB submissions at ARM!
>>>>> 
>>>>> The access parameters are out of date, although they will work for
>>>>> submissions. Here's more up-to-date info:
>>>>> 
>>>>> https://docs.kernelci.org/kcidb/submitter_guide/ <https://docs.kernelci.org/
> kcidb/submitter_guide/> <https://docs.kernelci.org/
>> kcidb/submitter_guide/> <https://docs.kernelci.org/
>>> kcidb/submitter_guide/> <https://docs.kernelci.org/
>>>> kcidb/submitter_guide/> <https://docs.kernelci.org/
>>>>> kcidb/submitter_guide/>
>>>>> 
>>>>> The credentials I gave ARM before should still work. I'd recommend restarting
>>>>> submissions to the "playground" database ("playground_kcidb_new" topic) so you
>>>>> can experiment freely without worrying about bothering anyone with invalid
>>>>> data. Then when you're ready, switch to production ("kcidb_new").
>>>>> 
>>>>> Don't hesitate to reach out, if you have any questions. I'll add you as the
>>>>> ARM's current contact here:
>>>>> 
>>>>> https://github.com/kernelci/kcidb/issues/328 <https://github.com/kernelci/
> kcidb/issues/328> <https://github.com/kernelci/
>> kcidb/issues/328> <https://github.com/kernelci/
>>> kcidb/issues/328> <https://github.com/kernelci/
>>>> kcidb/issues/328> <https://github.com/kernelci/
>>>>> kcidb/issues/328>
>>>>> 
>>>>> I think ARM doesn't let employees use Slack, but if I'm wrong, I can invite
>>>>> you to our channel, so we can have more interactive Q&A, if needed.
>>>>> 
>>>>> Nick
>>>>> 
>>>>> On 10/7/24 12:37 PM, Manoj Kumar wrote:
>>>>>> Hi Nikolai,
>>>>>> 
>>>>>> I wanted to say hello to you and start the initial thread regarding pushing
>>>>>> the test results to KernelCI KCIDB.
>>>>>> I will be enabling the changes to push kernel test and build results to KCIDB
>>>>>> from ARM testing . I was told by Cristian and Mark that you are the POC from
>>>>>> kernelCI KCIDB side.
>>>>>> 
>>>>>> The access parameters shared with me are below , can you confirm they are
>>>>>> still valid and not expired / updated .
>>>>>> 
>>>>>>  
>>>>>> 
>>>>>>  
>>>>>> 
>>>>>> The access parameters are:
>>>>>> 
>>>>>>          Google Cloud project name: kernelci-production
>>>>>>            Playground dataset name: playground_kernelci04
>>>>>> Playground submission queue topic: playground_kernelci_new
>>>>>>            Production dataset name: kernelci04
>>>>>> Production submission queue topic: kernelci_new
>>>>>> 
>>>>>>  
>>>>>> 
>>>>>> Regards,
>>>>>> 
>>>>>> Manoj
>>>>>> 
>>>>>>  
>>>>>> 
>>>>>> IMPORTANT NOTICE: The contents of this email and any attachments are
>>>>>> confidential and may also be privileged. If you are not the intended
>>>>>> recipient, please notify the sender immediately and do not disclose the
>>>>>> contents to any other person, use it for any purpose, or store or copy the
>>>>>> information in any medium. Thank you.
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

