Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D60411C2B
	for <kernelci@lists.linux.dev>; Wed, 23 Nov 2022 09:30:47 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id x17so15016173wrn.6
        for <kernelci@lists.linux.dev>; Wed, 23 Nov 2022 01:30:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nKII/2QQ0mvACqmGn5uX4+1e8o9tQQIDenEUDJRuCDs=;
        b=ByCrC7n08Fs7W+HjfyNDOFNF2fR/GLptzEaqSb1V0gZJR6qC31lD5tOjjjObmtc9nK
         WeAvGp5CS9LIkyJCVTX3QcUN+b1lrxVQlXPk/ckaP4ArLiTxtSXnDOC7nQx8VIoNL7PF
         oMc+CVQ4QLn/DfNj+z87lwglQqimkXLLBoA+x0IiXkKWUxOI9jxBCjkf2DwvS6PLbjzN
         o63fEsCIgTvq9F97GE/hZLY+on1y2+lcQZftjZYrpoAazEp3tK8IDs9jMEdWq7Ys+kRC
         aSdIxWtRuZlynECpOu5RKB94XYUE2Tyrjj/fyTjijh+VSrVVUF3Tigj0s3+N/OTMgfLV
         1rIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nKII/2QQ0mvACqmGn5uX4+1e8o9tQQIDenEUDJRuCDs=;
        b=EsRV5gYPhWAThjJWSTcOtNqrqxhq3GWp8MJ/eZSWY9ItpVCfhUwt2Vdxmd6NUOVpPR
         8oKKgyDgGNa+8sPsZRcWb/Uk571KLizLGI0mDm/YHZzV2a9/0sAALlgI83OkmChQfb6r
         PUWZgqzA8HrgrlLpa1BH1t7NhyHJjQaRDxbWNN6d0ntKeWebSdiulBgs4em9XqABpKdZ
         jxI8n5GESYmsW36RBFVYK7ugyq/ck6WUdRfi1VLVrazwEMjRS3BSXy9AIFd4VDlqWzuW
         2jzAzcZCgtfUvoHdYr+2CUmug2Nc7gLA2e/kgXleMl5Jb4w+zQt9bSRfTc0FNDms30XC
         9rPw==
X-Gm-Message-State: ANoB5pk3+9G7NTcb6uAG5uksmZwYTynNG180LtPbIP6N4lEbmrICCKv6
	E+oUQcRSPkysyYqKXlKIwuI=
X-Google-Smtp-Source: AA0mqf7OR4QWiMeNPiPo8zXjWZEPJvcCrs1C83eXXONQTYTgoqv/3rMBIO7yx6NcvUCXCKwl7ziWEg==
X-Received: by 2002:a5d:6f0f:0:b0:236:5b81:1daa with SMTP id ay15-20020a5d6f0f000000b002365b811daamr7552434wrb.17.1669195846056;
        Wed, 23 Nov 2022 01:30:46 -0800 (PST)
Received: from [192.168.0.118] (88-113-27-52.elisa-laajakaista.fi. [88.113.27.52])
        by smtp.gmail.com with ESMTPSA id y10-20020a5d620a000000b002366dd0e030sm16140049wru.68.2022.11.23.01.30.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Nov 2022 01:30:45 -0800 (PST)
Message-ID: <90b1557e-2f26-f0dc-02bb-12b65eb2e27c@gmail.com>
Date: Wed, 23 Nov 2022 11:30:44 +0200
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
To: minas@ti.com, kernelci@lists.linux.dev
References: <3a8d00c074504fcba308e1f212e5a1d4@ti.com>
From: Nikolai Kondrashov <spbnick@gmail.com>
In-Reply-To: <3a8d00c074504fcba308e1f212e5a1d4@ti.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello Minas,

On 11/23/22 01:23, Hambardzumyan, Minas via groups.io wrote:
> My name is Minas Hambardzumyan, I lead the Linux Core SDK test automation team at Texas Instruments. We are looking into publishing TI Linux Core SDK CI test results to Kernel CI. These results would be based on test reports we currently publish here:
> 
> https://software-dl.ti.com/linux-cicd-report/index.html
> 
> Let me know if you need additional info to approve this request.

Wonderful! We'd be happy to receive your contributions.

I took a look at your published results, they look good and have most of what 
we need, except any direct reference to the kernel source code you're building 
and testing. Only the OpenEmbedded  instructions. Do you think you'd be able 
to provide us with a URL pointing to the kernel git repository, branch name, 
and the commit hash for each build?

Please take a look at our Submitter Guide for the other (minimal) data 
requirements and ways to submit it:

https://kernelci.org/docs/kcidb/submitter_guide/

Don't hesitate to send any questions you have to our new maillist 
(kernelci@lists.linux.dev, or just reply-all to this message) or reach out to 
us on the #kernelci channel on libera.chat.

Thank you!
Nick
