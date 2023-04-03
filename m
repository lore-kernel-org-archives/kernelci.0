Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 973B52FAF
	for <kernelci@lists.linux.dev>; Mon,  3 Apr 2023 10:03:13 +0000 (UTC)
Received: by mail-qv1-f53.google.com with SMTP id k12so1846508qvo.13
        for <kernelci@lists.linux.dev>; Mon, 03 Apr 2023 03:03:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680516192;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IXBGb/rqJ0TDk3LhQHCmWLCIR64PrpQClttP0ktrSr4=;
        b=HbABVJSiWegoRuoLcBkA6lNK0GSX+g0V4/xYXNCHbilJd5flMoqeCKsb1xoJSMf4Me
         pU19aVwXNkeWkgEoPGtqs3nBWPRcW78lve9yPoyS6fYzlQZ/7NLbOELwbFQiW4gL6Wqe
         leKvjsY+QYZBhzAWEQcLF2DPGwgs6/vcZZOOm3B+TAqfUZlnPAZU2vthzPCU5+0AOXkd
         S2rXXO1oEGYQTOGRV8PqnJGSfwRfLHLHVQylimN1Y7vnUEjd2RkZWo2vCbazij2H6xvO
         IP9Z9kDmm/KuOZdVLZsEG5qDnYRgJQ6Yu3d8Ufx2tsiFFm0JHCIsRTKdrJE4QLCDSDeJ
         v1sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680516192;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IXBGb/rqJ0TDk3LhQHCmWLCIR64PrpQClttP0ktrSr4=;
        b=Su6ow2kNHBWFkGdnyJDAwEersJutRF/P9YR2ufPAoqkxZV6Xh64t2Xt2NVA2eLMVut
         AlMi+679dYkIBJjmFELvrr+bEZ3fV55gFfyFCSzD5X6tGwFJFRJIytJ6bCYt/ErAzZHy
         8Ct85azMMLAZxRwftCFxitHPdlNWA80mKeExlebutaJXLiQZ7l5SHHtHFp9tC97/g2pi
         NPqJ17dZn++GqVvRunkvuoXfSMLZVjoNTnzp7hl0PIxZ0QfBxbx65eYRGs6XTHyiqU9g
         HjZcSQkJIf/Zyuve89lzHyMdbwvoYYPwOS+SE9onm3D1g/30SvwL3hkUD+LNZ7SP80H3
         vJSA==
X-Gm-Message-State: AAQBX9ddMsxS2aITXX4/B5rdY5yHzp/U61V7/hYze8ICYdSAd9A6IJC2
	49pNaywJsxNYINnoqPXShpM=
X-Google-Smtp-Source: AKy350bAnMZnpTpCWmuKOgYU1PNnMSDk7PHXdIRiynDt/DW/wwqJuopnLT1j30DKHWl2EuMot6KP5w==
X-Received: by 2002:a05:6214:230a:b0:5a9:c758:ba0e with SMTP id gc10-20020a056214230a00b005a9c758ba0emr60735321qvb.16.1680516192418;
        Mon, 03 Apr 2023 03:03:12 -0700 (PDT)
Received: from [192.168.0.118] (88-113-27-52.elisa-laajakaista.fi. [88.113.27.52])
        by smtp.gmail.com with ESMTPSA id ny4-20020a056214398400b005e37909a7fcsm1360207qvb.13.2023.04.03.03.03.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Apr 2023 03:03:12 -0700 (PDT)
Message-ID: <fcdc1506-9a54-1f86-a45b-0d5dc56c56ca@gmail.com>
Date: Mon, 3 Apr 2023 13:03:09 +0300
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
Cc: misbahanjumn@ibm.com, kernelci@lists.linux.dev
References: <26F2B8E1-8A69-42E9-B3DF-A7E7E847756E@linux.ibm.com>
 <aaaa8f94-d901-500f-338d-a39ea8e350eb@gmail.com>
 <C9529E6E-E486-4F99-8889-39798857446D@linux.ibm.com>
From: Nikolai Kondrashov <spbnick@gmail.com>
In-Reply-To: <C9529E6E-E486-4F99-8889-39798857446D@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 4/3/23 12:43, Sachin Sant wrote:
> 
> 
>> On 22-Mar-2023, at 12:40 AM, Nikolai Kondrashov <spbnick@gmail.com> wrote:
>>
>> Hello Sachin,
>>
>> We would love to have your data in KCIDB!
>>
>> You can start with reading our Submitter Guide:
>>
>> https://kernelci.org/docs/kcidb/submitter_guide/
>>
>> Then decide and tell us what the "origin" of your CI system should be, so that we could identify it in the database, dashboards, and notifications.
> 
> The value to be used for "origin” is “ibm”. This will be used to identify Linux on Power test results.

Sounds good! I just sent you the credentials with permissions to submit to our 
"playground" setup. Once you got that going nicely and reliably, I'll add the 
permissions for our "production".

Have fun, and don't hesitate to reach out with questions, suggestions, or patches!
Nick
