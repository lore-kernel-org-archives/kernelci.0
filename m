Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49EA323A0
	for <kernelci@lists.linux.dev>; Thu, 24 Nov 2022 08:16:15 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id z4so1330204wrr.3
        for <kernelci@lists.linux.dev>; Thu, 24 Nov 2022 00:16:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WmproySKvmsu/Bb7+7aKJnhaSub8x59fT5GOPEWiz3c=;
        b=JMssCKy3bN1t4REnr6QGzFMlTMPsZ4zHGfjFfsGzP74+LLva+hJcvvr47APBsXtUgE
         XzRKONI1oN876idX3mQl1P4Wd5ktuzNBcj5JbIX8lkJoLWnq+lykYPxQpDCHqKnfvGH2
         9mxZuVjdTCxqxTnFsUZPg9cOuIn8MoZTTsnoVDjjzCTz5OSHyIqzpIxmXy4IvHzEWls2
         riQgCNr8NKzWC6dMyq+ddn/rf6+VRe4DCVvGx199pY2DM0eqzJSZntGb9MyqLNmi0jFP
         W10W6KnFr1gOUYiKmAYpX/nDKeiqV0YF3RYksXd+56WmO8OwDbNYN78pbkrp8Ft/gL93
         D9zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WmproySKvmsu/Bb7+7aKJnhaSub8x59fT5GOPEWiz3c=;
        b=LrLlcSnS2X6ouMoqUwbuqGqBTzpRx4O4dhd3ZI+Ymtq2DtdbIJAjlVpjkxTkLpECgL
         i1fauLAgpogATw8X9GvhCZr4ZD4rf+IvKOSUj1QBm4BhaxA81wcSy+0QPFSRKglx+oYq
         phQaxd5LcmrcBLH8wzSp5nDgd5uppEo7LGYLDWVkcbKtOdJQmoxShhQ6j+sBXbBAT8Et
         tv5aCH4DtyfLEWdr7rmTzkzDVXGi3CVy9WmazWYgBnlDU0YZvDSy/Gzvildl4EWaLZ9J
         ktwEGFCNI7mhepPVxt3Yihzv52xBzgg0RSwvjoX2uTvAyVqeV1z4C2VX7J0RFw9szejl
         wXpg==
X-Gm-Message-State: ANoB5ploSk6RcJX7RyaaMQcS2BBdUBtg8dAd35zy2tTlsK0SN0t1bY81
	nY7gJ68rQaL6vQXWvW80UG8=
X-Google-Smtp-Source: AA0mqf73poKL56Bt29FehfeQ7fJSRM6o2kR70v9J25MX8xOkD6pgldvmem6g2nrccGBsIDph/uzt/Q==
X-Received: by 2002:adf:ee84:0:b0:241:e3b9:388a with SMTP id b4-20020adfee84000000b00241e3b9388amr7064100wro.252.1669277773261;
        Thu, 24 Nov 2022 00:16:13 -0800 (PST)
Received: from [192.168.0.118] (88-113-27-52.elisa-laajakaista.fi. [88.113.27.52])
        by smtp.gmail.com with ESMTPSA id w10-20020a05600c474a00b003b435c41103sm5968590wmo.0.2022.11.24.00.16.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Nov 2022 00:16:12 -0800 (PST)
Message-ID: <02ee0a81-6bbd-baaa-e577-15338bf44279@gmail.com>
Date: Thu, 24 Nov 2022 10:16:11 +0200
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
From: Nikolai Kondrashov <spbnick@gmail.com>
To: "Hambardzumyan, Minas" <minas@ti.com>,
 "kernelci@lists.linux.dev" <kernelci@lists.linux.dev>
References: <3a8d00c074504fcba308e1f212e5a1d4@ti.com>
 <90b1557e-2f26-f0dc-02bb-12b65eb2e27c@gmail.com>
 <b454141f3c3e494ba09236c1e050069f@ti.com>
 <fd4e2637-aef0-5d1b-26b9-10b28a0ff151@gmail.com>
In-Reply-To: <fd4e2637-aef0-5d1b-26b9-10b28a0ff151@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/23/22 20:13, Nikolai Kondrashov wrote:
> Hi Minas,
> 
>  > Yes I understand we will need to provide the kernel source information, 
> this should not be difficult.
> 
> Glad to hear that! This is a major requirement, so I wanted to get it out of 
> the way first thing.
> 
>  > Can I get a credential for accessing the playground environment? I want to 
> experiment with commands to better understand changes we need to start pushing 
> data to production.
> 
> Of course! I just sent you the credentials in a separate message.

Oh, and I picked the "ti" origin name for you, but we can change that if you'd 
like.

Nick

