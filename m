Received: from mail-io1-f53.google.com (mail-io1-f53.google.com [209.85.166.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCF8614A4F9
	for <kernelci@lists.linux.dev>; Thu,  1 Aug 2024 21:58:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722549490; cv=none; b=eNqeGclF0YJ7CeIQa1K6hou9B9AbKnioL4qs2M13JAwnG3ErlhVQCjRGe9D459iZaD9Ts92o3ErNLCQ4cs1pfUTvpItrjhIIORaCaAYw+h+VcaIVK9uqmqWpOecyBjdK1r6zjNenS0VpAqqAy5upVa+Udx8bHmtTB7VNx+Xdb40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722549490; c=relaxed/simple;
	bh=RQYItWZwH4Ql8qW2fpp1u02We7daZKEImfw/+wWYyWM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OBBxZnEqRcAIcBlTG+jZs0edWprzYDOMUEkm7pF7zSFZIxV/QwuIjQ6DNt8tQK45ElsBrbAZ6bYaP298mCqvhGMrKQ1q2UGa5Ft14jZM2VfJ6/mQRzFdXv/lPWKmQlHEAmvfbrIav+fjOMD6wVlhjSr0LOR23yePQW8fjDucbJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=KYJX4nPD; arc=none smtp.client-ip=209.85.166.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="KYJX4nPD"
Received: by mail-io1-f53.google.com with SMTP id ca18e2360f4ac-81f7faff04dso48344439f.1
        for <kernelci@lists.linux.dev>; Thu, 01 Aug 2024 14:58:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1722549488; x=1723154288; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NO6nbx+9tiNIKrfqJCv4GTpw+kRZXI/h31Bka4korBg=;
        b=KYJX4nPDbknQ+7E34N2K/BPY680CKijsi88AaUwxgHkHgkemYLSjQ0bCI7BfNg0gP6
         CFzWtD5MPM+HcolwZj8W55Ai9azU/74M/FNTN5vXu1sGS75TiSdaX9e1t93CzqbD299A
         Tdbw7ODImFvFTDSJdlwIPHr2LMtyGGT+5FIhw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722549488; x=1723154288;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NO6nbx+9tiNIKrfqJCv4GTpw+kRZXI/h31Bka4korBg=;
        b=oEaHXcpwI+ynQePd2aY4JyKEuE5Xj4ye5DTI5j2V9SX4J+ZKLUzVh5ae2ucDiT4NrV
         QWBldcqTHfmZOlUGl9sIsm9uyq4f2/VXYXhFnq9PUwgdiQaFKNA3sopaiizeM3fJONmP
         wdlmna/EiLaYZpWxCyg2LZ2qEZtnStY01GY7dysN7vaXpZs0XliJTmGsxCT2VQLPSE/6
         TvDDNxC/JnkLMjKUzmxLhUOSwad7LMosEjlF+PoYMiepGy9ZOex5FmqqvDTZqdagua0j
         oPpc/2vjQyudrEpFXbsXBQkHNSefSvnN2iuhvcFDP4Wak2pb2GJsj4DcGWJ7hYv4GTMV
         q7iw==
X-Forwarded-Encrypted: i=1; AJvYcCUWj651+mX8z6Y82KTKsv4wnlMzxLqzLelHeUOh1a1B9k5R9H+9ji3+j1Wgf6KwejWzxHmRJ85TbzfeYb0wBK10WEHNGGAeRpo=
X-Gm-Message-State: AOJu0YxaRGOjqcI4NsT8lpMW9bj1E+Bx39koptpVqL8wtE18Y05zN03p
	6Yz9aao3aMoRWUIK0Yw5dEb5MxnbZ/mOH3Kof0Jr5FvzzTYfSJ5XcquiE68mvuk=
X-Google-Smtp-Source: AGHT+IH7ya7vdahb7Fg38dGONaREdXofSfWrUYIw0guOf2OCWQESsTl4qSlWseOFrxzw38bCJqnXJQ==
X-Received: by 2002:a92:ca47:0:b0:376:3918:c50 with SMTP id e9e14a558f8ab-39b1f780a14mr12601795ab.0.1722549487874;
        Thu, 01 Aug 2024 14:58:07 -0700 (PDT)
Received: from [192.168.1.128] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-39b20ae3423sm2395595ab.68.2024.08.01.14.58.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Aug 2024 14:58:07 -0700 (PDT)
Message-ID: <928fd388-e714-4e84-bde3-bf684c1ccff0@linuxfoundation.org>
Date: Thu, 1 Aug 2024 15:58:06 -0600
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC] kselftest: devices: Add test to detect missing
 devices
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>
Cc: Shuah Khan <shuah@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Bird, Tim" <Tim.Bird@sony.com>, Laura Nao <laura.nao@collabora.com>,
 Saravana Kannan <saravanak@google.com>, "Rafael J. Wysocki"
 <rafael@kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 kernel@collabora.com, kernelci@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20240724-kselftest-dev-exist-v1-1-9bc21aa761b5@collabora.com>
 <9d0b73ce-704c-4633-bb11-06ca4cb7a9a1@linuxfoundation.org>
 <f9a457c8-f558-4c45-96e0-baa97d143c7b@notapiano>
 <41a912af-4f59-4d54-a072-3de9ee912dee@linuxfoundation.org>
 <22688e55-b611-41b3-9bf0-06691454e3b1@notapiano>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <22688e55-b611-41b3-9bf0-06691454e3b1@notapiano>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 8/1/24 15:03, Nícolas F. R. A. Prado wrote:
> On Thu, Aug 01, 2024 at 02:13:05PM -0600, Shuah Khan wrote:
>> On 8/1/24 13:15, Nícolas F. R. A. Prado wrote:
>>> On Wed, Jul 31, 2024 at 05:19:45PM -0600, Shuah Khan wrote:
>>>> On 7/24/24 15:40, Nícolas F. R. A. Prado wrote:
>>>>> Introduce a new test to identify regressions causing devices to go
>>>>> missing on the system.
>>>>>
>>>>> For each bus and class on the system the test checks the number of
>>>>> devices present against a reference file, which needs to have been
>>>>> generated by the program at a previous point on a known-good kernel, and
>>>>> if there are missing devices they are reported.
>>>>
>>>> Can you elaborate on how to generate reference file? It isn't clear.
>>>
>>> Indeed, I'll make that information clearer in future versions.
>>>
>>> The reference file is generated by passing the --generate-reference flag to the
>>> test:
>>>
>>> ./exist.py --generate-reference
>>>
>>> It will be printed as standard output.
>>
>> How about adding an option to generate file taking filename?
>> Makes it easier to use.
> 
> Sure, we can do that. Another option would be to write it to the filename that
> would be looked for by default. So for your machine just calling
> 
>    ./exist.py --generate-reference
> 
> could write the reference to ./LENOVO,20XH005JUS.yaml.

You could. Do mention this as the default option and to the
help message.

>
>>>
>>> No, that repository would just be a place where people could find pre-generated
>>> reference files (which we'll be using when running this test in KernelCI), but
>>> anyone can always generate their own reference files and store them wherever
>>> they want.
>>>
>>
>> Thanks for the clarification. This might be good addition to the document.
>> I think this test could benefit from a README or howto
> 
> Sure, I can add a README in the next revision.
> 
>>
>>>>
>>>> This is what I see when I run the test on my system:
>>>>
>>>> make -C tools/testing/selftests/devices/exist/ run_tests
>>>> make: Entering directory '/linux/linux_6.11/tools/testing/selftests/devices/exist'
>>>> TAP version 13
>>>> 1..1
>>>> # timeout set to 45
>>>> # selftests: devices/exist: exist.py
>>>> # TAP version 13
>>>> # # No matching reference file found (tried './LENOVO,20XH005JUS.yaml')
>>>
>>> First generate the reference file for your system like so:
>>>
>>> tools/testing/selftests/devices/exist/exist.py --generate-reference > tools/testing/selftests/devices/exist/LENOVO,20XH005JUS.yaml
>>>
>>
>> Worked - I see
>>
>> TAP version 13
>> # Using reference file: ./LENOVO,20XH005JUS.yaml
>> 1..76
>>
>> ---
>> # Totals: pass:76 fail:0 xfail:0 xpass:0 skip:0 error:0
>>
>>
>> Things to improve:
>>
>> - Have the script take a file instead of assuming that the reference file
>>    is in the current directory.
>>    e.g: exist.py -f reference_file
> 
> The script also has another parameter to specify a different directory to look
> for the reference file: --reference-dir
> 
> But the file name is currently fixed and determined from the system's ID (DMI or
> Devicetree compatible).
> 
> We can definitely have another flag to force a different file name if that's
> useful. In theory it shouldn't be needed given the machine name is used as
> filename, but might come in handy if there are machine name clashes or if you
> want to have references for different kernel stable versions for the same
> machine in the same directory.

Providing an option to force is good.

thanks,
-- Shuah
