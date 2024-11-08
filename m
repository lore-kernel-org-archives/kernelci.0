Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 909001EABDC
	for <kernelci@lists.linux.dev>; Fri,  8 Nov 2024 14:51:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731077475; cv=none; b=NKVMAA5cgl44T3Fd9L2KcjvDHjiwJ//W2vE6QKvj5to87DLRsJVUoUoXU8i9JCeRxsO/JnGX/zBY/TiTp2quhmrZX9vIrFGmm0Vu3Aj+ZDCoZ6ybLLKembr/56QzV8qh0Rwd5msOdpH3WLo+VTnzjmfLmb5vQ3UHFguu3ubPR3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731077475; c=relaxed/simple;
	bh=g9f9VYDh5KqiCW0GMM+yhkML1SAl/Q0ejYGluhYHlbo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LOefeO3Gj90qpLKnUGHVqvesbsNRvuqfeKaztGPuzRA4RYfsCuIWZT2Lq8KxqcyhiOGOySlQHBc+vA70wffTJrxXOlfkibaM64ccnfpIVZzt3PvC62yqQGRcJonBMh90H3rV4olWVK/VNQbvbLK6EFRx3CYgVvNto1JDJfSLjTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fC7jxu66; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fC7jxu66"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1731077471;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uVBgfKt6NIsjc4HL0HX+WjJaJArKxM+t+Xr8pGSmxRo=;
	b=fC7jxu66R72dbpZoFTupecRiwN4+UNdWiFZ+rdg7B87CH5/seaQoGTmfl2Sdqzym0ufbaw
	Pyxbrk5wT0fqWZ+LW3LhaayPIPLKEkx6SRPqTJT8bgbWyP7KfY9Ku2WGOu/+irpjUWNuBZ
	3GTWJwmS3sNOqjZDGgplgyiKodemUhw=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-608-gocPQyZWM-WcGQY2C2UPUQ-1; Fri, 08 Nov 2024 09:51:10 -0500
X-MC-Unique: gocPQyZWM-WcGQY2C2UPUQ-1
X-Mimecast-MFC-AGG-ID: gocPQyZWM-WcGQY2C2UPUQ
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4316300bb15so14519805e9.2
        for <kernelci@lists.linux.dev>; Fri, 08 Nov 2024 06:51:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731077468; x=1731682268;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uVBgfKt6NIsjc4HL0HX+WjJaJArKxM+t+Xr8pGSmxRo=;
        b=QgHfD59Bw3fHYiwuowyCytdHmGA/dUpdewIZvD2Qr7cBgWc+noIw3FOgAOBxZ+Jf1i
         keFIYarbrGH3cl5A9gB+2KNaWz4AhPx++QitoCXJTsok4le73GbrXz6JEFjP5zYu3XMA
         ATi0edpV/+QYZ4rfRiEJB424R2sh3uKDqQg4PCwHyf5JSb/8+wUZpGlH0npow5ocJwcL
         1nlguVU8m3D+PVkcZFSXa+DePgVWRD260VcrjGc3m3e+EIk9VVst4b62w5g8s41SEInV
         7VzbqwNl68QuWT0V6X+qL/fF3NNcxnTeWmH3jYth14SWlp/GZzdwBf2FD4FDXGsDJz9k
         8YtQ==
X-Gm-Message-State: AOJu0YwEzmtRiztyZHxdr4nfUcl+zJn6D/aaUT0wb8Eo7RwCcsK+xCLm
	ZggxsAl8xlIdv7phFer3PZQXLP6v58U/0z+2A2Ni7BU3YogtIsplUNj+XaKfM1p+ueVsJJG95Km
	Q4MfxbF9xe5RrdPFiBqOi6rI1TnvqLdbKndGFdYVs2sgm5Bcl8zHgcnRPchJhyM6r
X-Received: by 2002:a05:600c:4f87:b0:42f:823d:dde9 with SMTP id 5b1f17b1804b1-432b75182b2mr24214355e9.21.1731077468131;
        Fri, 08 Nov 2024 06:51:08 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHAWEaR11Yu4HK9JrbLAkeeXCyQjtnCSZG/+f6ZPrKQgO7LmSfDG3L72UhKfRlia9TK6Onc2A==
X-Received: by 2002:a05:600c:4f87:b0:42f:823d:dde9 with SMTP id 5b1f17b1804b1-432b75182b2mr24214045e9.21.1731077467557;
        Fri, 08 Nov 2024 06:51:07 -0800 (PST)
Received: from [192.168.0.166] (h-185-57-5-67.na.cust.bahnhof.fi. [185.57.5.67])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432aa6bf546sm110652365e9.21.2024.11.08.06.51.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 Nov 2024 06:51:07 -0800 (PST)
Message-ID: <082b77f2-5088-41b4-96e1-0d700e09d9bb@redhat.com>
Date: Fri, 8 Nov 2024 16:51:06 +0200
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
 <DB9PR08MB68105069590B2A3A065DEBC2C45D2@DB9PR08MB6810.eurprd08.prod.outlook.com>
From: Nikolai Kondrashov <Nikolai.Kondrashov@redhat.com>
In-Reply-To: <DB9PR08MB68105069590B2A3A065DEBC2C45D2@DB9PR08MB6810.eurprd08.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: BcJvScUAB14cL18f6I7tugtaJn47TcsVGAdu-uz7vCw_1731077469
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Manoj,

OK, the bug is now fixed: https://github.com/kernelci/kcidb-io/pull/91

Please update your local copy of kcidb-io.

> Below is the code snippet for test message at kernelCI backend.

Thank you. I can see a few problems with that data:

* The `duration` is a string, and it should be a number
* The `log_url` is a `none` string, and should either be a URL, or missing
  from the data.
* Same for the `config_url`.

Whenever you want to test your data sample, you can simply pipe it to
`kcidb-validate` and it will validate it for you, without needing to go
through the whole submission process.

Nick

On 11/8/24 4:01 PM, Manoj Kumar wrote:
> Hi Nick,
> 
> I created a test data structure in the file https://github.com/kernelci/
> kernelci-backend/blob/7e7bff2703c73b2a3a3734b7bcd0593cbe657705/app/utils/
> kcidb.py#L149 <https://github.com/kernelci/kernelci-backend/
> blob/7e7bff2703c73b2a3a3734b7bcd0593cbe657705/app/utils/kcidb.py#L149>
> 
>  
> 
> The same structure is converted to Json and being pushed to upstream as shown
> below.
> 
> Below is the code snippet for test message at kernelCI backend.
> 
>  
> 
> kcidb_build = {
> 
>         'revision_origin': 'arm',
> 
>         'revision_origin_id': '2f87d0916ce0d2925cedbc9e8f5d6291ba2ac7b2',
> 
>         'origin': 'arm',
> 
>         'origin_id': 'kernelci.org:670fa3e1e5905849ba40dabe',
> 
>         'start_time': '2024-10-16T11:30:41.592000+00:00',
> 
>         'description': 'v6.12-rc3-44-g2f87d0916ce0',
> 
>         'duration': '1224.9012200832367',
> 
>         'architecture': 'x86_64',
> 
>         'compiler': 'gcc (Debian 12.2.0-14) 12.2.0',
> 
>         'log_url': 'none',
> 
>         'config_name': 'x86_64_defconfig',
> 
>         'config_url': 'none',
> 
>         'output_files': [],
> 
>         'valid': True,
> 
>         'misc': {
> 
>             'kernel_image_size': '',
> 
>         },
> 
>     }
> 
>     kcidb_data = {
> 
>         'version': '1',
> 
>     }
> 
>     kcidb_data['builds'] = [kcidb_build]
> 
>  
> 
>     json_data = json.dumps(kcidb_data, indent=2)
> 
>     utils.LOG.info(json_data)
> 
>     kcidb_submit.write(json_data)
> 
>  
> 
> br,
> 
> Manoj
> 
> *From: *Manoj Kumar <ManojKumar08@arm.com>
> *Date: *Friday, 8 November 2024 at 09:59
> *To: *Nikolai Kondrashov <Nikolai.Kondrashov@redhat.com>
> *Cc: *kernelci@lists.linux.dev <kernelci@lists.linux.dev>, Denys
> Fedoryshchenko <denys.f@collabora.com>
> *Subject: *Re: KCIDB database
> 
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

