Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA5BA4699
	for <kernelci@lists.linux.dev>; Wed, 23 Nov 2022 18:13:06 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id c65-20020a1c3544000000b003cfffd00fc0so2119040wma.1
        for <kernelci@lists.linux.dev>; Wed, 23 Nov 2022 10:13:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wuYHH7s+d4JFNXo8NnRtBZFB0dhBGtlgxFktIzHP2nw=;
        b=i6RSbouubahGMtIWS/rKYx2roxvzpihxU3Sta4J8JOk4omglvEZUAv8KYHh/ABZG/8
         hwhFMwyqONRFPgdhVcKmqdwqKCsu7xZC4wjaCO2lKS1+y5Jw5vVKEzukfE9IXoIw6aEv
         NCd6CKjuWJWBH6d3DCGdws9sQAFavGxZVlM+nMpnebrEwCWLVeUpQM1ZC1+w6rXZeQX3
         F8txFtfEbrsptfUdpwQm2Tk293R0kYxJMh6Vb6gyrrv85BqmUx9iSmaoSE1Hu6+A67kC
         jJTc7kE6quA7SsztrncBDGm0bLbqGHaxkGnRWGsaYQ2CeYbpmqVioXGjcJQHDXpQK1GK
         k2lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wuYHH7s+d4JFNXo8NnRtBZFB0dhBGtlgxFktIzHP2nw=;
        b=6/QX3F449faZuvSoewsqKfVy142XqnZobjF574PU4HUeFvz0LTeGnZgISLagKNM8bO
         PTJDmG5c2Xji4xa5hHeFWENbGotx5tEwFk0JMuqPpO7IRoONFuX6q7Cd3iKDFBnRL5dS
         fodrD4QHareFJCuNlLLMapHLrsSGyr04+Yboj6ROx7V3s/cw451wcPtPXt8eOmYDpERW
         ySKMrf0Y/9KO8J411NJzDUK6n/ZMK2XGdNnWV5MDaC0KKdTKEQdKMOTSZ5srq3AOiBlX
         FhlhG74qxsxFHzzuLx2cdakG7vgu/bW19y1ZVc8JgpMmc9nKp7os6nJqkgvTLDkLRibJ
         P14g==
X-Gm-Message-State: ANoB5pkv0uWPXDEpqeQBWj7gG6cryjHsGNlVYUqLcOax8iDxz4CXvWbt
	BWPVmvVSFSJ3Y2jM8yalqas=
X-Google-Smtp-Source: AA0mqf4owjGDD5tTLRYhHx7MPtZzdrLoymbaKvaLD7a3m6ShLa+Wy6xIjMoEhxt/N5Zc/+jp3m+EBg==
X-Received: by 2002:a05:600c:600c:b0:3cf:81b1:bc7b with SMTP id az12-20020a05600c600c00b003cf81b1bc7bmr11824141wmb.121.1669227184782;
        Wed, 23 Nov 2022 10:13:04 -0800 (PST)
Received: from [192.168.0.118] (88-113-27-52.elisa-laajakaista.fi. [88.113.27.52])
        by smtp.gmail.com with ESMTPSA id k21-20020a05600c1c9500b003cfa3a12660sm9109461wms.1.2022.11.23.10.13.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Nov 2022 10:13:03 -0800 (PST)
Message-ID: <fd4e2637-aef0-5d1b-26b9-10b28a0ff151@gmail.com>
Date: Wed, 23 Nov 2022 20:13:02 +0200
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: Request for KCIDB access credentials
Content-Language: en-US
To: "Hambardzumyan, Minas" <minas@ti.com>,
 "kernelci@lists.linux.dev" <kernelci@lists.linux.dev>
References: <3a8d00c074504fcba308e1f212e5a1d4@ti.com>
 <90b1557e-2f26-f0dc-02bb-12b65eb2e27c@gmail.com>
 <b454141f3c3e494ba09236c1e050069f@ti.com>
From: Nikolai Kondrashov <spbnick@gmail.com>
In-Reply-To: <b454141f3c3e494ba09236c1e050069f@ti.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Minas,

 > Yes I understand we will need to provide the kernel source information, 
this should not be difficult.

Glad to hear that! This is a major requirement, so I wanted to get it out of 
the way first thing.

 > Can I get a credential for accessing the playground environment? I want to 
experiment with commands to better understand changes we need to start pushing 
data to production.

Of course! I just sent you the credentials in a separate message.

Don't hesitate to reach out, you know where to find us now :)

We can also have a video call to go over any details you're interested in, if 
you'd like.

Nick

On 11/23/22 18:16, Hambardzumyan, Minas wrote:
> Hi Nick, thanks for the feedback!
> 
> Yes I understand we will need to provide the kernel source information, this should not be difficult.
> 
> Can I get a credential for accessing the playground environment? I want to experiment with commands to better understand changes we need to start pushing data to production.
> 
> Thanks,
> Minas.
> 
> -----Original Message-----
> From: Nikolai Kondrashov <spbnick@gmail.com>
> Sent: Wednesday, November 23, 2022 3:31 AM
> To: Hambardzumyan, Minas <minas@ti.com>; kernelci@lists.linux.dev
> Subject: Re: Request for KCIDB access credentials
> 
> Hello Minas,
> 
> On 11/23/22 01:23, Hambardzumyan, Minas via groups.io wrote:
>> My name is Minas Hambardzumyan, I lead the Linux Core SDK test automation team at Texas Instruments. We are looking into publishing TI Linux Core SDK CI test results to Kernel CI. These results would be based on test reports we currently publish here:
>>
>> https://software-dl.ti.com/linux-cicd-report/index.html
>>
>> Let me know if you need additional info to approve this request.
> 
> Wonderful! We'd be happy to receive your contributions.
> 
> I took a look at your published results, they look good and have most of what we need, except any direct reference to the kernel source code you're building and testing. Only the OpenEmbedded  instructions. Do you think you'd be able to provide us with a URL pointing to the kernel git repository, branch name, and the commit hash for each build?
> 
> Please take a look at our Submitter Guide for the other (minimal) data requirements and ways to submit it:
> 
> https://kernelci.org/docs/kcidb/submitter_guide/
> 
> Don't hesitate to send any questions you have to our new maillist (kernelci@lists.linux.dev, or just reply-all to this message) or reach out to us on the #kernelci channel on libera.chat.
> 
> Thank you!
> Nick

