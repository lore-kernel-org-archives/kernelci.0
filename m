Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 516313C0A
	for <kernelci@lists.linux.dev>; Mon, 28 Aug 2023 09:18:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1693214324;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HxH8HcpGBMv7eOhxxCru3jo1t/braw6G0X05dtv3l4k=;
	b=YdplzD25cyt5b3irh6jgeeFt7q3pLFwXIn2MLYnbNMTRX1vzMuIzqvl2bvpZUnH+btp6u0
	Yq3ZfyOSnnY9tGO5viw6AGGtV4dklrzByvGAIjYwknk3T1KHRA8DvM0wY528FSClsGE6AV
	lqlzq+rBGlZGgw3bbcewZYHT6La09BI=
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com
 [209.85.208.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-91-AJjhg8FnOjC7zI4tnM6Q2g-1; Mon, 28 Aug 2023 05:18:42 -0400
X-MC-Unique: AJjhg8FnOjC7zI4tnM6Q2g-1
Received: by mail-lj1-f197.google.com with SMTP id 38308e7fff4ca-2bcda0aa7ffso33000621fa.1
        for <kernelci@lists.linux.dev>; Mon, 28 Aug 2023 02:18:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693214320; x=1693819120;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HxH8HcpGBMv7eOhxxCru3jo1t/braw6G0X05dtv3l4k=;
        b=iAHr7jQMnp+g3aXqxrA1pTcEmD2AWvyTIH+Y0dTeXOzgY/0G1n2lDRE3fB6kav5laZ
         gZ+Cjv6emD7BLmiXhWEJiPAZ4AbogXDfL0NBW1/LynTxIUauz3l96P2blF679A0f4BP0
         Ftg7dcPi7Ty3G5qeYBGRstwcxUJQ8JHXgv8JicRdvSgrl1/LKYn8qfCf5ax32gWhA/cr
         f/uXJekqbCWZpucxjTaYwQvpXxdBmWmc7KTI8sYulbPGtcLJ1KtHweiPuVvBDHWAnTZZ
         zZPMEW5no3yFC1MSdZZYbQytYrhdpkX+HXkxUxkWWwXRpUnJPczqSRDeZx+fxNDvALcX
         5+sg==
X-Gm-Message-State: AOJu0YwvzgLMEy9Ew67GXb/gaisD+wcIj/ZwE9yE0EYYPhUrgfAt3hVR
	oC5Dr6NiFHrNpB+3gwtaCsLc3jNZ538mmraDu0CeJi21KL6L3fU4Pk+300Ne4hxYXHeFDewTBUI
	nGk/9yXolqC2GoR3KTQudJ2vzL+I=
X-Received: by 2002:a2e:88cb:0:b0:2bc:be3c:9080 with SMTP id a11-20020a2e88cb000000b002bcbe3c9080mr15785919ljk.27.1693214320472;
        Mon, 28 Aug 2023 02:18:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHX+NZcqcnkRwKCT41eimeKxMEQS1HqAbAeIXIk8Val18nhcpHLqh1qNhwKoFgsPTIDilD4dQ==
X-Received: by 2002:a2e:88cb:0:b0:2bc:be3c:9080 with SMTP id a11-20020a2e88cb000000b002bcbe3c9080mr15785896ljk.27.1693214320062;
        Mon, 28 Aug 2023 02:18:40 -0700 (PDT)
Received: from [192.168.0.118] (88-113-27-52.elisa-laajakaista.fi. [88.113.27.52])
        by smtp.gmail.com with ESMTPSA id c21-20020a2e9495000000b002b9ebbe09d5sm1675514ljh.33.2023.08.28.02.18.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Aug 2023 02:18:39 -0700 (PDT)
Message-ID: <dcfe8b45-35b9-42d8-93ba-9cee00f50601@redhat.com>
Date: Mon, 28 Aug 2023 12:18:38 +0300
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: KernelCI Database Archive
To: =?UTF-8?B?546L5rW35byb?= <wanghaichi@tju.edu.cn>, kernelci@lists.linux.dev
References: <C654D21A-72AD-48DC-88C2-5F0A5EE0AA97@tju.edu.cn>
From: Nikolai Kondrashov <Nikolai.Kondrashov@redhat.com>
In-Reply-To: <C654D21A-72AD-48DC-88C2-5F0A5EE0AA97@tju.edu.cn>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hello Haichi,

You can also look through the CI data accumulated by the KCIDB project, which 
is part of KernelCI, and collects data from multiple CI systems: 
https://kcidb.kernelci.org/

Tell us if there are any particular questions you would like answered based on 
the data we have there and we can perhaps help you with queries or amend the 
dashboards to help that answered.

I also presented on some of the challenges and the state of CI in general, in 
the Linux kernel, this summer: https://www.youtube.com/watch?v=KD0Hk6PghPw

You might find something useful there.

Don't hesitate to write if you have more questions.
Nick

On 8/28/23 10:03, 王海弛 wrote:
> Hello,
> 
> My name is Haichi Wang, a PhD student from Tianjin University.
> 
> KernelCI is really a wonderful CI product for linux kernel.
> 
> I have been studying some impact of CI on the linux kernel and I wander where can I obtain the archive of the test&build reports of the KernelCI, since I can only find data for only past 14 days on the main page of KernelCI.
> 
> Is there a public place to store the archive for history? Or could you kindly provide that?
> 
> That really helps! Thanks a lot!
> 
> Best regards.
> 
> Haichi Wang
> Tianjin University
> 

