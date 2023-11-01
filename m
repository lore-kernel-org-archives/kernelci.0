Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 555CA10A3F
	for <kernelci@lists.linux.dev>; Wed,  1 Nov 2023 11:28:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="J4YGmkpw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1698838106;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xbxyySkB8BUO4lh5HHoHxzvdTF/Z3HmnmV6MnkJEzpE=;
	b=J4YGmkpw8XoEnbVvc2oxf7IZKRVXZBGexdwi5dgunEMv1j/TgC1UDtaxPKbDodUt4vV2p1
	5uF6q0bZ+56qv576SAuYnIfTRDWGaDBuxJ+9PHvGwLDJopWSwDGeYwho5V3GyD9YtmA3F3
	Hu183j3U8caHSMcQ1rXR9/gBKU0s81Q=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-249-91iXboY0OeqF97lGruLdHQ-1; Wed, 01 Nov 2023 07:28:16 -0400
X-MC-Unique: 91iXboY0OeqF97lGruLdHQ-1
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-408534c3ec7so46533105e9.1
        for <kernelci@lists.linux.dev>; Wed, 01 Nov 2023 04:28:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698838094; x=1699442894;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xbxyySkB8BUO4lh5HHoHxzvdTF/Z3HmnmV6MnkJEzpE=;
        b=GBOq6/BMxiVUqpBQbhh7QGmqDuZwdmsnV8boR1A2jIZuubdcE7ywXT+IPZ+uPMr/cP
         Ji8Zgt6dQzBmGCar5z3xwCh8Bb+fKz2Bt63sknVkZj8psgSJl7ZKgabjCU78onVI97BZ
         KFTo4u5VE8kHC8vriyC4tEeUVJM5q19KcPihKVh4FCpvVwN13X2n7iXLbmgWi8/JRnvk
         6zzPoX9EZyqkx6REreViiWZs+7FVLyT4bmiceP7wTvf08Z76SBasEcHFpEboT6tg/Joq
         cAPVYtZZS41kg+jdbm34VSult4hpuv5HPSEGik3FDk/17mR4iIQHQiBhJntvSyyd49BF
         5tsA==
X-Gm-Message-State: AOJu0YyTCp/G36rKP3JjbrWszqq42+neSnp5N0phU7gGlKAccV+ZLBBx
	M7+hgJfNMMEIaIUjFz55SATBvhqdagUT+QtRnxhOkIvknPEpA7XxhdawQrsT6QXgrOhThPIKTHM
	3ruxB9RDLMMCQt9x+rFMzgiba5tc=
X-Received: by 2002:a5d:598a:0:b0:32f:9708:91f with SMTP id n10-20020a5d598a000000b0032f9708091fmr3931712wri.52.1698838094049;
        Wed, 01 Nov 2023 04:28:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFRtVvIjLs1TtZGEHMM0+Nh0L2Fj7ZkcNLMKocdRzDeoMX7ZKT33/5vYFiAqyvJ/IRFDYoB0Q==
X-Received: by 2002:a5d:598a:0:b0:32f:9708:91f with SMTP id n10-20020a5d598a000000b0032f9708091fmr3931697wri.52.1698838093695;
        Wed, 01 Nov 2023 04:28:13 -0700 (PDT)
Received: from [192.168.0.118] (88-113-27-52.elisa-laajakaista.fi. [88.113.27.52])
        by smtp.gmail.com with ESMTPSA id j15-20020adfff8f000000b0032de6f95fb3sm3906351wrr.40.2023.11.01.04.28.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Nov 2023 04:28:12 -0700 (PDT)
Message-ID: <7bd4cd65-95a9-409a-a2a2-807032bcf453@redhat.com>
Date: Wed, 1 Nov 2023 13:28:11 +0200
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: KernelCI Database Archive
To: Haichi Wang <wanghaichi@tju.edu.cn>,
 "kernelci@lists.linux.dev" <kernelci@lists.linux.dev>
References: <6502a6f3-6b06-488c-be6c-c34fa1a75a5a@redhat.com>
 <APUA0ABWGM-Eiawf-7oGyqoA.2.1698127904397.Hmail.3014218099@tju.edu.cn>
From: Nikolai Kondrashov <Nikolai.Kondrashov@redhat.com>
In-Reply-To: <APUA0ABWGM-Eiawf-7oGyqoA.2.1698127904397.Hmail.3014218099@tju.edu.cn>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Haichi,

 > I apologize for the delay in responding. I've been busy with my wedding
 > preparations over the past few days.

Congratulations to you and your partner :D

 > I wanted to let you know that we're considering setting up a Google Cloud
 > Storage, and I'll inform you as soon as it's ready.

Great!

 > While analyzing the data on kernel CI, we've come across the term "test plan,"
 > which appears to be a label for a set of test cases. I've found some
 > definitions in the kernelCI Git repository. For instance, the "kselftest" test
 > plan seems to be associated with the configuration file located at
 > 
"https://github.com/kernelci/kernelci-core/blob/main/config/lava/kselftest/kselftest.jinja2". 
In this configuration file, the test cases belonging to the "kselftest" test 
plan are specified as 
"http://testdata.validation.linaro.org/tests/kselftest/{kselftest_armhf.tar.gz}" 
(defined at line 17).
 >
 > I have a couple of questions regarding this:
 >
 > How can I find the test cases for a given test plan? The method I'm currently
 > using seems to work for "kselftest," but not for "baseline," which is widely
 > used in kernel CI. I'm unable to locate the test cases URL in the 
configuration.
 > Based on the test cases website mentioned above, it appears that the test
 > cases are quite outdated compared to the mainline of the kselftest Git
 > repository. Can you confirm if this is the case?
 > I appreciate your assistance in clarifying these matters.

I don't really know how that works exactly, as this relates to the KernelCI 
Native testing system, and I mostly work on KCIDB which aggregates results 
sent by it and other CI systems. In KCIDB there is no notion of a "test plan", 
only test suites and their tests.

However, I'm sure somebody on the kernelci maillist (CC'd) would be able to 
help with understanding how it works.

Nick


On 10/24/23 09:11, Haichi Wang wrote:
> Hi Nick,
> 
> I apologize for the delay in responding. I've been busy with my wedding 
> preparations over the past few days.
> 
> I wanted to let you know that we're considering setting up a Google Cloud 
> Storage, and I'll inform you as soon as it's ready.
> 
> While analyzing the data on kernel CI, we've come across the term "test plan," 
> which appears to be a label for a set of test cases. I've found some 
> definitions in the kernelCI Git repository. For instance, the "kselftest" test 
> plan seems to be associated with the configuration file located at 
> "https://github.com/kernelci/kernelci-core/blob/main/config/lava/kselftest/kselftest.jinja2". In this configuration file, the test cases belonging to the "kselftest" test plan are specified as "http://testdata.validation.linaro.org/tests/kselftest/{kselftest_armhf.tar.gz}" (defined at line 17).
> 
> I have a couple of questions regarding this:
> 
> How can I find the test cases for a given test plan? The method I'm currently 
> using seems to work for "kselftest," but not for "baseline," which is widely 
> used in kernel CI. I'm unable to locate the test cases URL in the configuration.
> Based on the test cases website mentioned above, it appears that the test 
> cases are quite outdated compared to the mainline of the kselftest Git 
> repository. Can you confirm if this is the case?
> I appreciate your assistance in clarifying these matters.
> 
> Best regards,
> Haichi Wang
> 
> 
> 
> 
> From: Nikolai Kondrashov <Nikolai.Kondrashov@redhat.com>
> Date: 2023-09-28 19:58:20
> To:  Haichi Wang <wanghaichi@tju.edu.cn>
> Subject: Re: KernelCI Database Archive>Hi Haichi,
>>
>>Sorry for the late reply, it took me a while to find time for this.
>>
>>We have data for these repos, not sure for how long, but at least a year.
>>
>>We won't have the logs/artifacts for most of those results, except the most 
>>recent. Or to be exact, the CI systems sending the data won't have those logs, 
>>because until recently KCIDB didn't store the logs itself and relied on the 
>>submitters to take care of them.
>>
>>We have hit a big problem with financing recently, and I cannot run queries on 
>>our data anymore. We will be transitioning to a public BigQuery dataset 
>>(https://cloud.google.com/bigquery/public-data) at some point, so it will be 
>>possible to query it, but you would have to pay for that yourself, and I 
>>cannot say when that's going to happen.
>>
>>Meanwhile I can offer you an export of our database to JSON or other formats, 
>>as described here: https://cloud.google.com/bigquery/docs/exporting-data
>>
>>The size is likely to be under 10GB, but it's hard to predict.
>>
>>If you'd like that, provide me with the name of an existing Google Cloud 
>>Storage bucket you own, or can access, with appropriate permissions setup (as 
>>described in the link above), so that I can export the data. You would have to 
>>pay for storage of the result, and for accessing it yourself.
>>
>>Nick
>>
>>On 9/18/23 17:08, Haichi Wang wrote:
>>> Hi Nick,
>>> 
>>> Thanks for you reply. It really helps! Cause collecting data from kernelCIDB 
>>> website is quite complicated due to the limitation of the api.
>>> 
>>> Actually, I want to analysis the history of the CI for several repositories, 
>>> like main repository of kernel and the next-version of the kernel. The repo 
>>> git are:
>>> https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git
>>> https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git 
>>> <https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git>
>>> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git 
>>> <https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git>
>>> 
>>> These three repos are mainly under consideration. But if possible, more data 
>>> is better that includes other kernel repos' CI data .
>>> The time period can be as longer as possible. At least the last two years.
>>> 
>>> The detailed data can be the same as those showed in the website. Like each 
>>> test status, log file, build status, build log, build config, arch, etc. The 
>>> file link will be enough.
>>> 
>>> Can you provide the data as mentioned? Thanks a lot ! It is really important 
>>> for me!
>>> 
>>> Best wishes,
>>> Haichi Wang.
>>> 
>>> 
>>> 
>>> From: Nikolai Kondrashov <Nikolai.Kondrashov@redhat.com>
>>> Date: 2023-09-18 20:15:12
>>> To:  Haichi Wang <wanghaichi@tju.edu.cn>
>>> Cc:  kernelci <kernelci@lists.linux.dev>
>>> Subject: Re: KernelCI Database Archive>Hi Haichi,
>>>>
>>>>Sorry, I didn't see your message earlier, and then I was on a sick leave.
>>>>
>>>>Were you trying to pull the data manually, or automatically, from the 
>>>>kcidb.kernelci.org website? Because it's not built for automatic 
>>>>querying/fetching/scraping. Only for review by humans. If you need the bulk 
>>>>data we might be able to get it for you in some other form.
>>>>
>>>>What kind of data are you looking for, and for which period?
>>>>
>>>>Nick
>>>>
>>>>On 9/4/23 08:07, Haichi Wang wrote:
>>>>> Hi Nick,
>>>>> 
>>>>> First, I'd like to apologize for my inappropriate behavior; it appears I may 
>>>>> have been at fault. After you provided the link to kcidb, I briefly reviewed 
>>>>> it to ensure it was what I needed. However, I couldn't find a direct download 
>>>>> link for the archive of history data on the website. As a result, I attempted 
>>>>> to gather information directly from the site for further analysis. The 
>>>>> structure seemed complex, with multiple nodes (Repo -> revision -> checkout -> 
>>>>> build -> test) and an abundance of information to collate. Upon visiting the 
>>>>> website today, I encountered the following error: "Templating init failed 
>>>>> rateLimitExceeded: Quota exceeded for quota metric 'Requests' and limit 
>>>>> 'Requests per day' of service 'bigquery.googleapis.com' for consumer 
>>>>> 'project_number:415818378487'." I suspect this may have been caused by my 
>>>>> frequent access.
>>>>> 
>>>>> I apologize for any inconvenience caused.
>>>>> 
>>>>> Do you have any direct links to access the archive of the historical data?
>>>>> 
>>>>> Best regards
>>>>> Haichi
>>>>> 
>>>>> 
>>>>> 
>>>>> From: Nikolai Kondrashov <Nikolai.Kondrashov@redhat.com>
>>>>> Date: 2023-08-28 17:18:38
>>>>> To:  "王海弛" <wanghaichi@tju.edu.cn>,kernelci@lists.linux.dev
>>>>> Subject: Re: KernelCI Database Archive>Hello Haichi,
>>>>>>
>>>>>>You can also look through the CI data accumulated by the KCIDB project, which 
>>>>>>is part of KernelCI, and collects data from multiple CI systems: 
>>>>>>https://kcidb.kernelci.org/
>>>>>>
>>>>>>Tell us if there are any particular questions you would like answered based on 
>>>>>>the data we have there and we can perhaps help you with queries or amend the 
>>>>>>dashboards to help that answered.
>>>>>>
>>>>>>I also presented on some of the challenges and the state of CI in general, in 
>>>>>>the Linux kernel, this summer: https://www.youtube.com/watch?v=KD0Hk6PghPw
>>>>>>
>>>>>>You might find something useful there.
>>>>>>
>>>>>>Don't hesitate to write if you have more questions.
>>>>>>Nick
>>>>>>
>>>>>>On 8/28/23 10:03, 王海弛 wrote:
>>>>>>> Hello,
>>>>>>> 
>>>>>>> My name is Haichi Wang, a PhD student from Tianjin University.
>>>>>>> 
>>>>>>> KernelCI is really a wonderful CI product for linux kernel.
>>>>>>> 
>>>>>>> I have been studying some impact of CI on the linux kernel and I wander where can I obtain the archive of the test&build reports of the KernelCI, since I can only find data for only past 14 days on the main page of KernelCI.
>>>>>>> 
>>>>>>> Is there a public place to store the archive for history? Or could you kindly provide that?
>>>>>>> 
>>>>>>> That really helps! Thanks a lot!
>>>>>>> 
>>>>>>> Best regards.
>>>>>>> 
>>>>>>> Haichi Wang
>>>>>>> Tianjin University
>>>>>>> 
>>>>>>
>>>>> 
>>>>> 
>>>>
>>> 
>>> 
>>
> 
> 

