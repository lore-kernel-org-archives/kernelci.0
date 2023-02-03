Received: from mail-il1-f171.google.com (mail-il1-f171.google.com [209.85.166.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6F8279C6
	for <kernelci@lists.linux.dev>; Fri,  3 Feb 2023 16:26:38 +0000 (UTC)
Received: by mail-il1-f171.google.com with SMTP id g16so2284095ilr.1
        for <kernelci@lists.linux.dev>; Fri, 03 Feb 2023 08:26:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jzLSTilkTqHv5zqJq4XrgBlNDh4B17SJN2rgulEb5xk=;
        b=d7kPQhIauFu7vhvmYuzzHJii3z93jbo8da5vvEAJvij6FF2hHODbovtTwaR//XIqB6
         IDIvXVPISW0bwGn6f/uwmd8dHTwDSn2kOobXOqmYAgqMSghpBvDM48pRn5IzbuO+8qvj
         YLDPv1eR3uAXHCfCs/3lhe8N2TuQC4ReiAR7M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jzLSTilkTqHv5zqJq4XrgBlNDh4B17SJN2rgulEb5xk=;
        b=wsjnu5CWconc76F3IfAK1x1gVXxqeZHtLR/To34zRloB4WEPauHuRze5EAqd3ll0k9
         WyHzVk0CDLoSpyBIajhLEm2xRVzip/MKfX7MKbmZLghhqh82xaGu5OMBZcNygL4TxuUt
         vQNTJU17nao+WjCdv1z+0iIRCxA9dBhzUiYRknugS+OYDRNVZGH6QBjrY8zyrRl3TF/2
         DpRCR8/egVYiwmrYhenxNd/0xI8d/nW8kkdjp88Oa5mPFQ0XqOBB4QfQvoT2DMHrPx23
         f21QXlfCDF4awBhtB0yyW4hZG0T4y4wwReOLxBX7vWnMc6ih3ejverr9HRPSZicodtzy
         Mhiw==
X-Gm-Message-State: AO0yUKUTHr+De7soFyxx8BZvG6D3sTgIYucD3RfaCA83wFQbwp5Pc8eR
	71x783ap/bEutLTvS4URPpQGdw==
X-Google-Smtp-Source: AK7set+SWBkzsLF7SwKMgA+I+wyLq5+0NPN1Gmn1itfKTHMLjlocRZMy3fHFcQDgtVDC6mqhqZ7xwg==
X-Received: by 2002:a05:6e02:1ba7:b0:310:b84b:c893 with SMTP id n7-20020a056e021ba700b00310b84bc893mr7862837ili.1.1675441597740;
        Fri, 03 Feb 2023 08:26:37 -0800 (PST)
Received: from [192.168.1.128] ([38.15.45.1])
        by smtp.gmail.com with ESMTPSA id q21-20020a056638345500b003af38f526aesm943667jav.81.2023.02.03.08.26.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Feb 2023 08:26:37 -0800 (PST)
Message-ID: <ebaaa261-84db-c118-2c2b-d8a31c90a1aa@linuxfoundation.org>
Date: Fri, 3 Feb 2023 09:26:36 -0700
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] selftests: find echo binary to use -ne options
Content-Language: en-US
To: Guillaume Tucker <guillaume.tucker@collabora.com>,
 Guillaume Tucker <guillaume.tucker@gmail.com>, Shuah Khan
 <shuah@kernel.org>, Gautam <gautammenghani201@gmail.com>
Cc: kernel@collabora.com, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernelci@lists.linux.dev,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20230203152603.11450-1-guillaume.tucker@collabora.com>
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20230203152603.11450-1-guillaume.tucker@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/3/23 08:26, Guillaume Tucker wrote:
> Find the actual echo binary using $(which echo) and use it for
> formatted output with -ne.  On some systems, the default echo command
> doesn't handle the -e option and the output looks like this (arm64
> build):
> 
> -ne Emit Tests for alsa
> 
> -ne Emit Tests for amd-pstate
> 
> -ne Emit Tests for arm64
> 
> This is for example the case with the KernelCI Docker images
> e.g. kernelci/gcc-10:x86-kselftest-kernelci.  With the actual echo
> binary (e.g. in /bin/echo), the output is formatted as expected (x86
> build this time):
> 
> Emit Tests for alsa
> Emit Tests for amd-pstate
> Skipping non-existent dir: arm64
> 
> Only the install target is using "echo -ne" so keep the $ECHO variable
> local to it.
> 
> Reported-by: "kernelci.org bot" <bot@kernelci.org>
> Fixes: 3297a4df805d ("kselftests: Enable the echo command to print newlines in Makefile")
> Signed-off-by: Guillaume Tucker <guillaume.tucker@collabora.com>
> ---

Thank you - will appear shortly in linuxk-selftest next.

thanks,
-- Shuah

