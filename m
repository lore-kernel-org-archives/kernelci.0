Received: from mail-io1-f46.google.com (mail-io1-f46.google.com [209.85.166.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E1CB1EB48A
	for <kernelci@lists.linux.dev>; Thu,  1 Aug 2024 20:13:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722543190; cv=none; b=GZgf0PZhhQ1X/7xha3UByemtHHT7WABCQKuerGy3Os83Sbcxun9zpLWkS6rxR4hijmRCOe4yYNCP2p479yLCY1mMhzHGg6YfiCInP47uE8269698+8jPjiRUNUAEb9GCSm+91jppAUVhAurYEAARt9hEM6TLpdMDGDrkizU3h8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722543190; c=relaxed/simple;
	bh=g4KKri552Czw+N6TW+l2gpK+raTHPXjahKbTj/iVB9g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JR4OHrzRk7J6Ip2ABWhCDCC54k92W2wJn0UzIZr/8VzXo4BTHQETm6JaLhXq5k/cMpvqIqWHe0otU8e/nnEnz+eksQNjwz5+1nFPQf93yupVc+fTrklCg31u5Th/8B5ckaaPFiQky7mP8C62gFlPAD4fGXsEnuTlZn0vO/OGTH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=f0c950Py; arc=none smtp.client-ip=209.85.166.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="f0c950Py"
Received: by mail-io1-f46.google.com with SMTP id ca18e2360f4ac-81fd1ea8606so5341839f.0
        for <kernelci@lists.linux.dev>; Thu, 01 Aug 2024 13:13:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1722543187; x=1723147987; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kWKvYxW0DQrC4hdufBNBp7H987pj5vvilCGZqPUz2LY=;
        b=f0c950Py8tPmEM1CjUqS0Evn0a2ybeG/XRMlpQjqgh1EevamrxC6G9owxlllM7WOJy
         jCfpX1QRmpPf9my8NTdj/iPxdI5y9UkyzCvEZeZLblndZCbgbkE6cCVhseJEwGDm/Mm7
         EfjWfNGeS4sLYpJXf5FdmcCFV4Lg4rx8B9RQs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722543187; x=1723147987;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kWKvYxW0DQrC4hdufBNBp7H987pj5vvilCGZqPUz2LY=;
        b=BVToGawmEykij5+uln0I8i9QAQzKshKbDfTqthQEv7rBIV5epeFkAZFvwOJ8pl4aiQ
         iyW+B0Bed3bPnmv3lcqrkxJsCRdbz+N5Id4IdfCfyGh0oxCA3Z/w4gTxKVnO3an4v595
         sW9zT5ZQqs9s33vaIYNuUeJyohxoPUtSuFQfio8lzYOMY1NgrjMB/Gmt+odHIKRyMvwC
         oToFLb3aMyMqIuhm9XBqxupWlBj/1Eb5de+3E1U2TYrMX5J69V6CdrpcnSHfkxx5Ar0C
         RBXL2qaMwTfVoSyzy40bxrJMwcQNSDQ/KDEJ+ua52vZpYiEcwTakex9GZAF8UQR1orvt
         5h8w==
X-Forwarded-Encrypted: i=1; AJvYcCV2ZBHdOZZTX7MV9aS9886ccgDXqC4ZmNMx2P1rXMwAUXZsL0jE2fuQV19zJw5rqWcQE6uV7NTnqaoZMou8+bM2f79ouGUhr4U=
X-Gm-Message-State: AOJu0YyZhTfu6CJXxxXgvXtgD8cvHsOio3DFfcQoarAkJhzEEP3Oa829
	qxdquRQYPvrTySnE1Iui2fRoYpRVtmlpsle0PvpFqpwsHh9t5rpl+EXmP3HUud0=
X-Google-Smtp-Source: AGHT+IEf3RpcS6LYBTonpR8BoLAwN0azj6sDR6wQJDUDRcLyHRwZCJpXzwl0jr2oGZIGY/qJimVcdQ==
X-Received: by 2002:a6b:f415:0:b0:81f:8cd4:2015 with SMTP id ca18e2360f4ac-81fd4395206mr107810539f.2.1722543186703;
        Thu, 01 Aug 2024 13:13:06 -0700 (PDT)
Received: from [192.168.1.128] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4c8d69a6fdcsm101090173.55.2024.08.01.13.13.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Aug 2024 13:13:06 -0700 (PDT)
Message-ID: <41a912af-4f59-4d54-a072-3de9ee912dee@linuxfoundation.org>
Date: Thu, 1 Aug 2024 14:13:05 -0600
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
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <f9a457c8-f558-4c45-96e0-baa97d143c7b@notapiano>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 8/1/24 13:15, Nícolas F. R. A. Prado wrote:
> On Wed, Jul 31, 2024 at 05:19:45PM -0600, Shuah Khan wrote:
>> On 7/24/24 15:40, Nícolas F. R. A. Prado wrote:
>>> Introduce a new test to identify regressions causing devices to go
>>> missing on the system.
>>>
>>> For each bus and class on the system the test checks the number of
>>> devices present against a reference file, which needs to have been
>>> generated by the program at a previous point on a known-good kernel, and
>>> if there are missing devices they are reported.
>>
>> Can you elaborate on how to generate reference file? It isn't clear.
> 
> Indeed, I'll make that information clearer in future versions.
> 
> The reference file is generated by passing the --generate-reference flag to the
> test:
> 
> ./exist.py --generate-reference
> 
> It will be printed as standard output.

How about adding an option to generate file taking filename?
Makes it easier to use.

> 
>>
>>>
>>> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
>>> ---
>>> Hi,
>>>
>>> Key points about this test:
>>> * Goal: Identify regressions causing devices to go missing on the system
>>> * Focus:
>>>     * Ease of maintenance: the reference file is generated programatically
>>>     * Minimum of false-positives: the script makes as few assumptions as possible
>>>       about the stability of device identifiers to ensure renames/refactors don't
>>>       trigger false-positives
>>> * How it works: For each bus and class on the system the test checks the number
>>>     of devices present against a reference file, which needs to have been
>>>     generated by the program at a previous point on a known-good kernel, and if
>>>     there are missing devices they are reported.
>>> * Comparison to other tests: It might be possible(*) to replace the discoverable
>>>     devices test [1] with this. The benefits of this test is that it's easier
>>>     to setup and maintain and has wider coverage of devices.
>>>
>>> Additional detail:
>>> * Having more devices on the running system than the reference does not cause a
>>>     failure, but a warning is printed in that case to suggest that the reference
>>>     be updated.
>>> * Missing devices are detected per bus/class based on the number of devices.
>>>     When the test fails, the known metadata for each of the expected and detected
>>>     devices is printed and some simple similitarity comparison is done to suggest
>>>     the devices that are the most likely to be missing.
>>> * The proposed place to store the generated reference files is the
>>>     'platform-test-parameters' repository in KernelCI [2].
>>
>> How would a user run this on their systems - do they need to access
>> this repository in KernelCI?
> 
> No, that repository would just be a place where people could find pre-generated
> reference files (which we'll be using when running this test in KernelCI), but
> anyone can always generate their own reference files and store them wherever
> they want.
> 

Thanks for the clarification. This might be good addition to the document.
I think this test could benefit from a README or howto

>>
>> This is what I see when I run the test on my system:
>>
>> make -C tools/testing/selftests/devices/exist/ run_tests
>> make: Entering directory '/linux/linux_6.11/tools/testing/selftests/devices/exist'
>> TAP version 13
>> 1..1
>> # timeout set to 45
>> # selftests: devices/exist: exist.py
>> # TAP version 13
>> # # No matching reference file found (tried './LENOVO,20XH005JUS.yaml')
> 
> First generate the reference file for your system like so:
> 
> tools/testing/selftests/devices/exist/exist.py --generate-reference > tools/testing/selftests/devices/exist/LENOVO,20XH005JUS.yaml
> 

Worked - I see

TAP version 13
# Using reference file: ./LENOVO,20XH005JUS.yaml
1..76

---
# Totals: pass:76 fail:0 xfail:0 xpass:0 skip:0 error:0


Things to improve:

- Have the script take a file instead of assuming that the reference file
   is in the current directory.
   e.g: exist.py -f reference_file

thanks,
-- Shuah
