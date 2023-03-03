Received: from mail-il1-f175.google.com (mail-il1-f175.google.com [209.85.166.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F9758F42
	for <kernelci@lists.linux.dev>; Fri,  3 Mar 2023 20:29:17 +0000 (UTC)
Received: by mail-il1-f175.google.com with SMTP id s8so2441093ilv.10
        for <kernelci@lists.linux.dev>; Fri, 03 Mar 2023 12:29:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1677875356;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=e0LzGjIMPosJSmf+/sQBmlwLSdpWvs5gZiiybS0LDqs=;
        b=GYG5pMHfASSwZJbwRW5683/5cOuRhHCi8afcHqjQV/i4zixiw6DGQV9zshhp2737/F
         OGKCM1QFKZinO3EC+KUcCxQ3r22zeyId8R3n13oW2iwCbreGS+00RLeLW2sq6LZ6broi
         d/oHuroYQ4xN6Q+7pDB9B6Nn8tWikD4gzmGlI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677875356;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=e0LzGjIMPosJSmf+/sQBmlwLSdpWvs5gZiiybS0LDqs=;
        b=qNq6IR2h5AzsF73wGhb4zUQF88ImQiGjAWmb/OPQWwsvJ+OcVteagARhg9bK9rXIaC
         uLDYQZNEeYtYL5Y3BliFNxZ07JZtvwIlxMViMxxRmRjFGMJauq/tBopDxqu6MBLEG+Em
         BzgC8HM0wiEXB/04g1Wv1ZnkxoQx+odnPzDrh5OmzYHKPv5iHM2lWuRqV2p/rhC7reiQ
         bSjsp3X5kYWBUOTtkryA1VHpzGa3X6csEZI2xNTc2epQQSWiqtu5bUyF9jJbIf7b+9W+
         sviLEKAVwGczRT8IOaawYlURt4NRdAg9g490eezKHdiiKi2h1lhY6jFTM/rjj6vPev0u
         k3PQ==
X-Gm-Message-State: AO0yUKVzrejHaXAcDxePWr1q1PQDSwMiFymIwymVMSNhb3sMBkfMYgZm
	xwb4C+9Wi3GNs+VWCCWeJGnJtg==
X-Google-Smtp-Source: AK7set+v5vOte2RN0n2pqz7cfxz2xavYFisT3AmMBWRTKSs3pvHhcztEKGHHBlYWdj74NFDldWHoHA==
X-Received: by 2002:a05:6e02:13f4:b0:317:16bc:dc97 with SMTP id w20-20020a056e0213f400b0031716bcdc97mr1753665ilj.3.1677875356468;
        Fri, 03 Mar 2023 12:29:16 -0800 (PST)
Received: from [192.168.1.128] ([38.15.45.1])
        by smtp.gmail.com with ESMTPSA id q22-20020a02cf16000000b0039e89ea68f9sm920025jar.135.2023.03.03.12.29.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Mar 2023 12:29:15 -0800 (PST)
Message-ID: <3d051308-382f-0f90-41b3-e1ffdd6f11f7@linuxfoundation.org>
Date: Fri, 3 Mar 2023 13:29:15 -0700
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] selftests: amd-pstate: fix TEST_FILES
Content-Language: en-US
To: Huang Rui <ray.huang@amd.com>,
 Guillaume Tucker <guillaume.tucker@collabora.com>
Cc: Shuah Khan <shuah@kernel.org>, "Meng, Li (Jassmine)" <Li.Meng@amd.com>,
 Doug Smythies <dsmythies@telus.net>,
 "kernel@collabora.com" <kernel@collabora.com>,
 "linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "kernelci@lists.linux.dev" <kernelci@lists.linux.dev>,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20230204133454.260066-1-guillaume.tucker@collabora.com>
 <ZAGOQznWjSNuhn73@amd.com>
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <ZAGOQznWjSNuhn73@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/2/23 23:05, Huang Rui wrote:
> On Sat, Feb 04, 2023 at 09:34:54PM +0800, Guillaume Tucker wrote:
>> Bring back the Python scripts that were initially added with
>> TEST_GEN_FILES but now with TEST_FILES to avoid having them deleted
>> when doing a clean.  Also fix the way the architecture is being
>> determined as they should also be installed when ARCH=x86_64 is
>> provided explicitly.  Then also append extra files to TEST_FILES and
>> TEST_PROGS with += so they don't get discarded.
>>
>> Fixes: ba2d788aa873 ("selftests: amd-pstate: Trigger tbench benchmark and test cpus")
>> Fixes: ac527cee87c9 ("selftests: amd-pstate: Don't delete source files via Makefile")
>> Signed-off-by: Guillaume Tucker <guillaume.tucker@collabora.com>
> 
> Acked-by: Huang Rui <ray.huang@amd.com>
> 

Thank you both. I will pick this up for 6.3-rc2

thanks,
-- Shuah

