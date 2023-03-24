Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C85CF3C24
	for <kernelci@lists.linux.dev>; Fri, 24 Mar 2023 09:54:25 +0000 (UTC)
Received: by mail-qv1-f44.google.com with SMTP id q88so1137775qvq.13
        for <kernelci@lists.linux.dev>; Fri, 24 Mar 2023 02:54:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679651664;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1ylxntMwnisjhq7Mh3nsJFP8V2VdsnX73RHmkrDez0w=;
        b=MPgp4pJ4EqmPR9pzNrVJj022/1aPfuiFX1j0T0zYJdmismR6qOfC41wmPCr2SZty59
         8j0tcLhewc/mYa9Nx1s2UoQinWiHTWQIDhF0MDq2HU1M0ZXe9fdOibAlgn2ElSrKGTEv
         pCmAs+/pFUXHf8ESS7A+kykPKAAJf1h7JrQJtR5cuDHfZscp4Pm/4ZPIx/BmqsPtPeLW
         5aIz96HLS04k7IKwOzrXciWpRbIcEyrSztnEiX1PFYThauZL+gB/6Rp1IS3ybYx/Hfc2
         ZSox0HDgnV3jFEwlKXMHADcROGXpOzdxuflhQQTZlDcRLmaEaHMdT0qPZqlPEqN9RAH6
         JFDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679651664;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1ylxntMwnisjhq7Mh3nsJFP8V2VdsnX73RHmkrDez0w=;
        b=INiK6ndRg70x35W+w2WNOJY9RZKCuwS/hKwernS3VJXtGofe1EIq20N63cpDqOt9Lb
         ZGgewbIqT2N1EBagO+KHWNvCSEm6tMaJXy0TBOOwZ+HwMb9NRK8j584cFVSlVq2JLMmw
         7s1u5G1jfkdTbUeFOi/ix8pooYH+Y76gu1QU8YGqD3JWW0/IJCXO2aFqPeWg5v2BfBMD
         58PvZG2OHBSxmuAaDXLs025y1mMOM3pSxfjRvZ12Oim5vQqMBa9RaFNz3bpVOXSWhRvO
         1jLNs3Z0j8MKTtYQhTkU6uS4iulsB5TWL6D4Ut8q0diP4GdLE9ropNM0NTO7Rvgl+9FI
         f7Iw==
X-Gm-Message-State: AAQBX9dKngpFQlgUY/GKBo6RqFBMWldfwxnjDB6E5qwaPXwNVAEwYQ0y
	Lc/MZDOmfl8eTelMOIkaFeU=
X-Google-Smtp-Source: AKy350aKJUKtONGxV8vdsdwwlDWZFJaH1VQYW+fLewl1j+TGaOBCKKVHpb2WsPqo+8gM8sft2dcrXw==
X-Received: by 2002:a05:6214:f67:b0:56b:ee5a:89eb with SMTP id iy7-20020a0562140f6700b0056bee5a89ebmr3898214qvb.19.1679651664617;
        Fri, 24 Mar 2023 02:54:24 -0700 (PDT)
Received: from [192.168.0.118] (88-113-27-52.elisa-laajakaista.fi. [88.113.27.52])
        by smtp.gmail.com with ESMTPSA id l7-20020a0cc207000000b005dd8b9345d0sm555259qvh.104.2023.03.24.02.54.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Mar 2023 02:54:24 -0700 (PDT)
Message-ID: <7d5fb28e-ae17-c3ab-3f6b-e7b8d4f96e7d@gmail.com>
Date: Fri, 24 Mar 2023 11:54:22 +0200
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: Contributing Linux on Power test results to KCIDB
Content-Language: en-US
To: Sachin Sant <sachinp@linux.ibm.com>
Cc: kernelci@groups.io, misbahanjumn@ibm.com, kernelci@lists.linux.dev
References: <26F2B8E1-8A69-42E9-B3DF-A7E7E847756E@linux.ibm.com>
 <aaaa8f94-d901-500f-338d-a39ea8e350eb@gmail.com>
 <D1BDE6C5-D5A9-40EE-95EB-DA0FBEA0EF2A@linux.ibm.com>
From: Nikolai Kondrashov <spbnick@gmail.com>
In-Reply-To: <D1BDE6C5-D5A9-40EE-95EB-DA0FBEA0EF2A@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/24/23 10:24, Sachin Sant wrote:
>> Then decide and tell us what the "origin" of your CI system should be, so that we could identify it in the database, dashboards, and notifications.
> 
> Is there any consideration for the "origin" string?  Any unique value would suffice?

It must match the "[a-z0-9_]+" regular expression, and be something that 
people would easily associate with your CI system. E.g. something you could 
say at a conference and be understood.

Nick

