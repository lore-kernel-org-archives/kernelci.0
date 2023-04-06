Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3227EA3
	for <kernelci@lists.linux.dev>; Thu,  6 Apr 2023 08:40:25 +0000 (UTC)
Received: by mail-qv1-f42.google.com with SMTP id g9so27877748qvt.8
        for <kernelci@lists.linux.dev>; Thu, 06 Apr 2023 01:40:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680770424;
        h=content-transfer-encoding:in-reply-to:cc:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AAiKR3xx1TA2bll65xNSFWp+TaTaWv/wwAZtB7YVCps=;
        b=FeSSfb5w5901aOvxR6kWIXOF+Vw5qiRONioOr8q33/3/PZX09cRA38bTa3Ggb08OKC
         V5oSfm9RYgYq+pZOG9YZvx2FXH/+BxV/wuL149CnYy2827UEM7CuxwqSz+7xHcmlM5i0
         El1IuxLhV3zFYmOHv4WcZJpAqm0VXu5XefPsiIdFFBJ2L+MqelJmgJGQ/QGm+GYOX4zB
         Lgw1wPp0ZtWVNf6fRj/dZWOuByr4Me3KFEw2CmEXP7Pk4zC6kBbb8OHEW4UvlyZUktfE
         m2plc343eJsY6fR05pXsiydZRxIGXX0jima8Azax2Gm/TUOeq4fedtfgZp8jT0zCcrAi
         DS8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680770424;
        h=content-transfer-encoding:in-reply-to:cc:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AAiKR3xx1TA2bll65xNSFWp+TaTaWv/wwAZtB7YVCps=;
        b=fASIEmrgRRpPUTAaRPxEN/uwJatxoRvMbh1IPVv5elwjtN9AIOWqvFqV2nA7AJWZDf
         L3yaL1sJy5sqEFHVwYvuEgICMr5iks+zsIenpQCEaycO6F9DohiZEOKaTN7M1llsu2gy
         CaSRRXD79FB5uA6+ggioTQP+uV7R0ye5XQXJJixYmJWThEF9Txve3aM0Yb4efXUI+93E
         gU9Hi64yfxOOTLOG3YIHWeNpKqzmROu49pQ4vjVzxcZCj8O+dVd54FJMR9P7NEKqQpz/
         lL1lQ1uEdWGYAnWt4fQDEA2JMkkp8b9Dr5YKetoT6o7Za8X6J0RSldTbr8Vm8jedPaGR
         g6kQ==
X-Gm-Message-State: AAQBX9d5JaRnDw3lc6tMrGuELINgY+fgcDGO6zRD2q8cX8kvTp2NAeqC
	9hHTfDyE3rdHH6T8z8LZt6JjLSRkFZ8x8Q==
X-Google-Smtp-Source: AKy350boUoYJcqa4kWjkl7ojIdQwFFJzBtw8+CCsL/dkyvB7m74lflkNByQaoP8eTm6D0Q+Ygr9VhA==
X-Received: by 2002:a05:6214:23cd:b0:5e0:5ea6:69d4 with SMTP id hr13-20020a05621423cd00b005e05ea669d4mr3509918qvb.0.1680770424501;
        Thu, 06 Apr 2023 01:40:24 -0700 (PDT)
Received: from [192.168.0.118] (88-113-27-52.elisa-laajakaista.fi. [88.113.27.52])
        by smtp.gmail.com with ESMTPSA id c4-20020a0cfb04000000b005dd8b9345ecsm343754qvp.132.2023.04.06.01.40.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Apr 2023 01:40:24 -0700 (PDT)
Message-ID: <d03f72ca-1efe-6912-1468-b8582dbbc2d8@gmail.com>
Date: Thu, 6 Apr 2023 11:40:22 +0300
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: kcidb vs KernelCI APIs
Content-Language: en-US
To: "Hambardzumyan, Minas" <minas@ti.com>
References: <ec413cbe0205479b8beb25f3d1c6dfc1@ti.com>
From: Nikolai Kondrashov <spbnick@gmail.com>
Cc: "kernelci@lists.linux.dev" <kernelci@lists.linux.dev>,
 Guillaume Tucker <guillaume.tucker@collabora.com>
In-Reply-To: <ec413cbe0205479b8beb25f3d1c6dfc1@ti.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Minas,

Nice to hear from you again!
Please see my answers below.

On 4/5/23 19:30, Hambardzumyan, Minas wrote:
> Hi Nikolai,
> 
> I am a bit confused between kernel-ci api (https://api.kernelci.org/schema-test.html) and kcidb interfaces, can you help me better understand this? Let me know if my questions are too convoluted or I am not asking the right questions :) -- I'll try to clarify.
> 
> 1. Do kernel-ci api and ckidb interfaces operate on the same database? Based on #3 below I assume the answer is yes, but want to get your confirmation.

No. Rather both the current KernelCI Native API and the new KernelCI API 
systems are submitting their testing results to KCIDB, just like the rest of 
CI system participants.

In addition, KernelCI Native (and, I assume, the new KernelCI API in the 
future) support communicating with third-party labs maintaining their own 
hardware pools, accepting tests for execution, and reporting results.

Guillaume (CC'd) would be able to tell you much more about the latter two.

 From POV of KCIDB things look something like shown on this (somewhat 
outdated) slide:

https://docs.google.com/presentation/d/1dLs6SZfoNQ4BYYd-XfhWSqoJeYFBEUbiUYaQeVYj3EA/edit#slide=id.g1fb506119f1_0_91

I assume that the KernelCI (Native) API you were using accesses "KernelCI 
Backend" on that slide. You could also see there that its data is forwarded to 
KCIDB, to mix with the data coming from all other CI systems there.

> 
> 2. kernel-ci api defines schemas for "test_group" and "test_case" object types, while kcidb defines "tests" only. Can you tell me what is the relationship between these?

There's no direct relationship. However, the structure described by test 
group/case objects in KernelCI Native can be described by the universal "test" 
object in KCIDB, to an extent.

> 3. I am able to extract job/build/test_group/test_case objects using kernel-ci api interfaces. I was also able to testcase ids returned from kernel-ci api using a kcidb-query command like this (the downloaded object is attached):
> 
> kcidb-query -d bigquery:playground_kcidb_01 -t kernelci:staging.kernelci.org:642d52183d363bbbfd0b9bd3
> 
> Looking at the retuned json, I see the "id" is "kernelci:staging.kernelci.org:642d52183d363bbbfd0b9bd3".
> 	a) Where did this id string come from, and how do I create such an ID if I want to submit my own test result using kcidb?

This string was generated by KernelCI Native backend when submitting its data 
to KCIDB. I assume it took its internal test result ID 
"642d52183d363bbbfd0b9bd3", added "staging.kernelci.org:" to indicate it's 
coming from the staging instance, and to differentiate it from production 
results, and then added "kernelci:" to indicate this test result is coming 
from KernelCI itself, and to differentiate it from other CI systems.

The code doing that is likely here:
https://github.com/kernelci/kernelci-backend/blob/main/app/utils/kcidb.py

> 	b) Does it have to follow this syntax to be accessible from the  staging.kernelci.org web page?

I assume you can get your data on staging.kernelci.org (and 
linux.kernelci.org), only if you connect a pool of your machines as a 
KernelCI-controlled lab, but I'd leave it to Guillaume, or others to clarify.

> 	c) Do I need to first use kernel-ci api to create test_group/test_case with and get their ids, and then update it using kcidb?

If you simply want to have your testing results published in KCIDB, you don't 
need to talk to KernelCI Native API at all. You only need to follow the KCIDB 
Submitter Guide:

https://kernelci.org/docs/kcidb/submitter_guide/

to format your results as JSON and then push them to KCIDB.

Here's an example of what Syzkaller/Syzbot does:
https://github.com/google/syzkaller/blob/master/pkg/kcidb/client.go

Here's how GKernelCI does their submissions:
https://github.com/GKernelCI/Ghelper/tree/main/kcidb

However, if you want to have tests executed on your hardware by KernelCI, then 
you need to integrate with KernelCI Native API (I hope I'm not spouting total 
nonsense in this last part, Guillaume 🙈).

If you'd like, we can have a video call and go over all the questions you 
have, and hopefully clarify things. Perhaps Guillaume could join as well, 
depending on what you want to do.

Hope this helps!
Nick
