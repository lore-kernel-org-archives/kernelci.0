Received: from mail-il1-f170.google.com (mail-il1-f170.google.com [209.85.166.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A883624
	for <kernelci@lists.linux.dev>; Fri, 10 Feb 2023 01:10:20 +0000 (UTC)
Received: by mail-il1-f170.google.com with SMTP id f10so1616980ilc.7
        for <kernelci@lists.linux.dev>; Thu, 09 Feb 2023 17:10:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=v/rk3szIYpKAIRaNgREy62PBz6/2LxRSXh1DsRADJYU=;
        b=glWpLY4dwbYR6L+EuXgrM7xpnBQwcy4cG8tTl4Iu6S5oeAe9XEeTtFQedpEob1PVsf
         XDhBc6dcvKP5ITbMhU84oC9wLHu4u61U/5Mm5CDuiBGjg1ff+u7y+a6Wx+VivD/VPKcs
         9aWC7QzL9MdRG8WZGfGt+erauZpDeGAPE4C04=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=v/rk3szIYpKAIRaNgREy62PBz6/2LxRSXh1DsRADJYU=;
        b=Gv2BD/N9kg1sgyyWTqJIARls5tUBZrN1Ug2Pul1yj6uDrNKFE72OC5csieW20reLYh
         b6vHkAGzKkh+kNlMZDtlROwy3KAoSYoyYvtf9uJFgzMQATuiJeLMtmdWRV6bWDnazRNl
         mSdWlBHqGrdf16l1ZidgTANXKOm753L20Y0/nPoO6rz3CYL9hN5byD2oYhLlKQGHRiOn
         vIp8jDnqAahfya5R2+j48E/HU8y83CIgz3eXMBKkZXlml6aBdG5b5gG1DM+uxW0406ED
         Deg/OOjTsoLiK9jpilonvRTCeVFwiE8wGm4AiwEQRz5fYCPHo9JAftAvjKacB8rP2YUt
         EXaQ==
X-Gm-Message-State: AO0yUKX/70vv4jX1mkBghdL7t9XIfLc/N3jJqnDFvOkg9ByFCMxD+hjU
	Zrtev2ppPx4P5ydsOcem7d+WAw==
X-Google-Smtp-Source: AK7set/lwVwMrh2gIxWEj3tHiccsh9dwYjh13O3kYY/qcLOTXN81uOX17NqMOY+FJluKLmXrlqXPYA==
X-Received: by 2002:a05:6e02:1d95:b0:314:1579:be2c with SMTP id h21-20020a056e021d9500b003141579be2cmr872204ila.0.1675991419088;
        Thu, 09 Feb 2023 17:10:19 -0800 (PST)
Received: from [192.168.1.128] ([38.15.45.1])
        by smtp.gmail.com with ESMTPSA id o3-20020a02c6a3000000b0038a56594026sm887540jan.66.2023.02.09.17.10.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Feb 2023 17:10:18 -0800 (PST)
Message-ID: <ee7976ca-ea15-e13f-3ea0-1b89eb29e39e@linuxfoundation.org>
Date: Thu, 9 Feb 2023 18:10:17 -0700
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v3] selftests: use printf instead of echo -ne
Content-Language: en-US
To: Guenter Roeck <groeck@google.com>,
 Guillaume Tucker <guillaume.tucker@collabora.com>
Cc: Shuah Khan <shuah@kernel.org>, Gautam <gautammenghani201@gmail.com>,
 David Laight <David.Laight@aculab.com>, kernel@collabora.com,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
 kernelci@lists.linux.dev, Shuah Khan <skhan@linuxfoundation.org>
References: <20230209085536.1076662-1-guillaume.tucker@collabora.com>
 <CABXOdTdnntA=oU4==suO-DP-8S9zb0AhqtwekCRCbpOpku7MQg@mail.gmail.com>
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <CABXOdTdnntA=oU4==suO-DP-8S9zb0AhqtwekCRCbpOpku7MQg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/9/23 09:19, Guenter Roeck wrote:
> On Thu, Feb 9, 2023 at 12:55 AM Guillaume Tucker
> <guillaume.tucker@collabora.com> wrote:
>>
>> Rather than trying to guess which implementation of "echo" to run with
>> support for "-ne" options, use "printf" instead of "echo -ne".  It
>> handles escape characters as a standard feature and it is widespread
>> among modern shells.
>>
>> Reported-by: "kernelci.org bot" <bot@kernelci.org>
>> Suggested-by: David Laight <David.Laight@ACULAB.COM>
>> Fixes: 3297a4df805d ("kselftests: Enable the echo command to print newlines in Makefile")
>> Fixes: 79c16b1120fe ("selftests: find echo binary to use -ne options")
>> Signed-off-by: Guillaume Tucker <guillaume.tucker@collabora.com>
> 
> Reviewed-by: Guenter Roeck <groeck@chromium.org>
> 

Thank you. Applied to linux-kselftest next for Linux 6.3-rc1.

thanks,
-- Shuah

