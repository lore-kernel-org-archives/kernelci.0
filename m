Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E84AA38F93
	for <kernelci@lists.linux.dev>; Mon, 18 Sep 2023 12:15:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1695039317;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YgU22ay9K/fchRzocURefbLYibXg7TDkDJ7mB55b5Lc=;
	b=JEFa6mjkDOFSRoo742F6xXRMX4mBlhmadHTI9MnzF46wAGNMalEtq2XHgFu1XMO6YInwJY
	nSbUWT82o+KystXGK4TCjaEOe6Zrez2aU3mOgI/AnfW+cHCsMIKxiQFex4bOw3wVGwEbYY
	Gxnq6SEZlC7FRK/pqgPPLDdgGWTQ6CI=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-526-PEwtFGgnOZG-cxg4TuYCCQ-1; Mon, 18 Sep 2023 08:15:15 -0400
X-MC-Unique: PEwtFGgnOZG-cxg4TuYCCQ-1
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-31dc8f0733dso2869268f8f.3
        for <kernelci@lists.linux.dev>; Mon, 18 Sep 2023 05:15:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695039314; x=1695644114;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YgU22ay9K/fchRzocURefbLYibXg7TDkDJ7mB55b5Lc=;
        b=HN45BNg9WzTImlJ2RxJ/2v8/YlxvAnYXYILLtzMuzqio2vlimwriSfAI881xRxKKjx
         K8ZllmMs1/FAHiF3uzsmMo14veSf+E/Wm7kdvl8Bs+DQI+dP35yQ1FMNjy46wva9Dxgv
         OcvizuwaijvciCN/XNDnnFdTOYpdH3kVIKoD9bOaZsnt2juui3F9uODvrKtgEzqsebwA
         0CoQmv9oYsUjA3zTWZ45hP/bzlRbT+Y5Hpxmgy255ZYVo8iIpTke6k03V3F3gGxMKlb2
         UOy7uR6VXc9j/CqQrnhBjK30TBwqiLaIuM+80yjf4PQPXR8TACPottfjJ63Yb4bFvtD9
         0ohQ==
X-Gm-Message-State: AOJu0Yz3cNXUkN49YD/Pv0NN9oZ+EcOzDEp57pS0fopUr+myeAX5Ie1Z
	hI58WSD2tlM315EGX1E5jup8fBDbIfXXp+0zCOWCU90NqjmLM2e2uAEz2DtECWrGQz+5xrn/ivl
	g0Favg5edbbIE9v7gYdeoGPM1zxU=
X-Received: by 2002:a05:6000:23b:b0:31f:fd9c:8ee8 with SMTP id l27-20020a056000023b00b0031ffd9c8ee8mr5957973wrz.38.1695039314209;
        Mon, 18 Sep 2023 05:15:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IER5jZn5Hj2hQNoaqj1JBwnH4ee3Kgj2K9z3fsT2SPO/qlY69y3/Fk3COiehnCJK/5ZWDyRsg==
X-Received: by 2002:a05:6000:23b:b0:31f:fd9c:8ee8 with SMTP id l27-20020a056000023b00b0031ffd9c8ee8mr5957952wrz.38.1695039313849;
        Mon, 18 Sep 2023 05:15:13 -0700 (PDT)
Received: from [192.168.0.118] (88-113-27-52.elisa-laajakaista.fi. [88.113.27.52])
        by smtp.gmail.com with ESMTPSA id y15-20020a5d470f000000b0031981c500aasm12413184wrq.25.2023.09.18.05.15.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Sep 2023 05:15:13 -0700 (PDT)
Message-ID: <e51b9d35-b87b-4f34-b5d8-de20d99aaf4e@redhat.com>
Date: Mon, 18 Sep 2023 15:15:12 +0300
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: KernelCI Database Archive
To: Haichi Wang <wanghaichi@tju.edu.cn>
Cc: kernelci <kernelci@lists.linux.dev>
References: <dcfe8b45-35b9-42d8-93ba-9cee00f50601@redhat.com>
 <APUAfgDnF41WQexLY6Xd24pg.2.1693804031208.Hmail.3014218099@tju.edu.cn>
From: Nikolai Kondrashov <Nikolai.Kondrashov@redhat.com>
In-Reply-To: <APUAfgDnF41WQexLY6Xd24pg.2.1693804031208.Hmail.3014218099@tju.edu.cn>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Haichi,

Sorry, I didn't see your message earlier, and then I was on a sick leave.

Were you trying to pull the data manually, or automatically, from the 
kcidb.kernelci.org website? Because it's not built for automatic 
querying/fetching/scraping. Only for review by humans. If you need the bulk 
data we might be able to get it for you in some other form.

What kind of data are you looking for, and for which period?

Nick

On 9/4/23 08:07, Haichi Wang wrote:
> Hi Nick,
> 
> First, I'd like to apologize for my inappropriate behavior; it appears I may 
> have been at fault. After you provided the link to kcidb, I briefly reviewed 
> it to ensure it was what I needed. However, I couldn't find a direct download 
> link for the archive of history data on the website. As a result, I attempted 
> to gather information directly from the site for further analysis. The 
> structure seemed complex, with multiple nodes (Repo -> revision -> checkout -> 
> build -> test) and an abundance of information to collate. Upon visiting the 
> website today, I encountered the following error: "Templating init failed 
> rateLimitExceeded: Quota exceeded for quota metric 'Requests' and limit 
> 'Requests per day' of service 'bigquery.googleapis.com' for consumer 
> 'project_number:415818378487'." I suspect this may have been caused by my 
> frequent access.
> 
> I apologize for any inconvenience caused.
> 
> Do you have any direct links to access the archive of the historical data?
> 
> Best regards
> Haichi
> 
> 
> 
> From: Nikolai Kondrashov <Nikolai.Kondrashov@redhat.com>
> Date: 2023-08-28 17:18:38
> To:  "王海弛" <wanghaichi@tju.edu.cn>,kernelci@lists.linux.dev
> Subject: Re: KernelCI Database Archive>Hello Haichi,
>>
>>You can also look through the CI data accumulated by the KCIDB project, which 
>>is part of KernelCI, and collects data from multiple CI systems: 
>>https://kcidb.kernelci.org/
>>
>>Tell us if there are any particular questions you would like answered based on 
>>the data we have there and we can perhaps help you with queries or amend the 
>>dashboards to help that answered.
>>
>>I also presented on some of the challenges and the state of CI in general, in 
>>the Linux kernel, this summer: https://www.youtube.com/watch?v=KD0Hk6PghPw
>>
>>You might find something useful there.
>>
>>Don't hesitate to write if you have more questions.
>>Nick
>>
>>On 8/28/23 10:03, 王海弛 wrote:
>>> Hello,
>>> 
>>> My name is Haichi Wang, a PhD student from Tianjin University.
>>> 
>>> KernelCI is really a wonderful CI product for linux kernel.
>>> 
>>> I have been studying some impact of CI on the linux kernel and I wander where can I obtain the archive of the test&build reports of the KernelCI, since I can only find data for only past 14 days on the main page of KernelCI.
>>> 
>>> Is there a public place to store the archive for history? Or could you kindly provide that?
>>> 
>>> That really helps! Thanks a lot!
>>> 
>>> Best regards.
>>> 
>>> Haichi Wang
>>> Tianjin University
>>> 
>>
> 
> 

