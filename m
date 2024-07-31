Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0785116D31F
	for <kernelci@lists.linux.dev>; Wed, 31 Jul 2024 23:19:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722467990; cv=none; b=a3najxrTOpw5zj+s+Y7btstWSiAypS+ywPNSV24e/vJ3D2/PL08fYnsjkvJ+rYsJSZasgh9TK92JIAaBOsvBnQ9DxP6CJjmTJ53aLjNun7DdZW8cQ/RKpiOFk8SRoEZQGBZ0HGRH7+ezaMQIrUL6/OM1XAE8vx6EUOYgQzj+pAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722467990; c=relaxed/simple;
	bh=4GwoRzclfzlo85zAvolfapd+CWdm9DU8Te+Ql1cnl+0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PyLHqzjGW1n3sAJyxoUWms6NbWFeajWWqOK9Um/9dYik3MWgSFqQbwg+TaBDkyItKL5j7ysHYi9SEu2CLFgqPCTvvPOEB0/cucSJuQZPaJlfg71NNt952qABO6dWyql9lLkSdmIKfHV5+AHj6W+Wm0LcrW/h4XyIdzW6mJjifb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=FL1q1IKJ; arc=none smtp.client-ip=209.85.160.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="FL1q1IKJ"
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-2644f7d0fb2so936536fac.0
        for <kernelci@lists.linux.dev>; Wed, 31 Jul 2024 16:19:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1722467987; x=1723072787; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=etMvppMi7evDPjhbMsnAWhZBTxb0fCzMenZG1uh9MDE=;
        b=FL1q1IKJFx+uAD/0l0iLfk/zG9sgqBYynVzLIDwoOkMqIt6W4shDE5yowEqvGgdMd8
         3M4NMkattd6qt9wgREmu6A8tlY158A3GhjX15EaaH1L2E78+NluBJDik1ChLUHDS93D3
         GdI62N5VG2/0XQCJECGXYzFSSYd0ApTc22aIo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722467987; x=1723072787;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=etMvppMi7evDPjhbMsnAWhZBTxb0fCzMenZG1uh9MDE=;
        b=NHELS7N3U7UgeutaHH5jrS8UeABosZUrP4zO2b4BAqc2w6Omusk8vhckLinBZ5KojY
         di4sI/TpamzH5tV/XGgyFoqmf/7g5VC0aqboI6/Fqf2JI6VTIPD+owXpGAGHo468/xx7
         kVon21R8crVFk8h5erKMw9B2DoHyEbF+k81VII0gIa8fGPUqyjMwzDAOMplq7UWJewfQ
         0/AgJaWpIj4yAty/wkR9Z6gbglH2rIULu2x+7Tw+4M+KQ+4Hyblc8Dj7GjkmAoZFFRs+
         2evcu4oNqu4Ve+0oY8AsBoP4EXONgE/EuJ3RYC9EnvmaulKuCNrzoMN4LIJMaQGE9MkA
         VYGg==
X-Forwarded-Encrypted: i=1; AJvYcCXODFZrGbOAIT4D/DnCPPiaWt3SdxjiAg0G31lAy0WqeX8rxgayIBc0CL4AoPOdGKCbRnynUeYmAQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxGHyUUFhIqwzbnTfcJSJ1aVGEn3MKg6bGKhmkWAoHu+ZqW2H4R
	X5C61xmh6ANYDsYatYQa+XjJk3gGgmlwGLqXOV+qORLKPu6yT5SQy3yloWgK3gw=
X-Google-Smtp-Source: AGHT+IGrdIeXgyWgztwjLDx8NrHnJ/zPFKpv/zS8lGiCJLsiszTxwKrySbmn38HXtASjPox9Bk+Ljw==
X-Received: by 2002:a05:6808:2205:b0:3db:42d0:7387 with SMTP id 5614622812f47-3db5122ed5cmr360052b6e.5.1722467986996;
        Wed, 31 Jul 2024 16:19:46 -0700 (PDT)
Received: from [192.168.1.128] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3db417ee4a9sm878004b6e.10.2024.07.31.16.19.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 Jul 2024 16:19:46 -0700 (PDT)
Message-ID: <9d0b73ce-704c-4633-bb11-06ca4cb7a9a1@linuxfoundation.org>
Date: Wed, 31 Jul 2024 17:19:45 -0600
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC] kselftest: devices: Add test to detect missing
 devices
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Shuah Khan <shuah@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: "Bird, Tim" <Tim.Bird@sony.com>, Laura Nao <laura.nao@collabora.com>,
 Saravana Kannan <saravanak@google.com>, "Rafael J. Wysocki"
 <rafael@kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 kernel@collabora.com, kernelci@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20240724-kselftest-dev-exist-v1-1-9bc21aa761b5@collabora.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20240724-kselftest-dev-exist-v1-1-9bc21aa761b5@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 7/24/24 15:40, Nícolas F. R. A. Prado wrote:
> Introduce a new test to identify regressions causing devices to go
> missing on the system.
> 
> For each bus and class on the system the test checks the number of
> devices present against a reference file, which needs to have been
> generated by the program at a previous point on a known-good kernel, and
> if there are missing devices they are reported.

Can you elaborate on how to generate reference file? It isn't clear.

> 
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> ---
> Hi,
> 
> Key points about this test:
> * Goal: Identify regressions causing devices to go missing on the system
> * Focus:
>    * Ease of maintenance: the reference file is generated programatically
>    * Minimum of false-positives: the script makes as few assumptions as possible
>      about the stability of device identifiers to ensure renames/refactors don't
>      trigger false-positives
> * How it works: For each bus and class on the system the test checks the number
>    of devices present against a reference file, which needs to have been
>    generated by the program at a previous point on a known-good kernel, and if
>    there are missing devices they are reported.
> * Comparison to other tests: It might be possible(*) to replace the discoverable
>    devices test [1] with this. The benefits of this test is that it's easier
>    to setup and maintain and has wider coverage of devices.
> 
> Additional detail:
> * Having more devices on the running system than the reference does not cause a
>    failure, but a warning is printed in that case to suggest that the reference
>    be updated.
> * Missing devices are detected per bus/class based on the number of devices.
>    When the test fails, the known metadata for each of the expected and detected
>    devices is printed and some simple similitarity comparison is done to suggest
>    the devices that are the most likely to be missing.
> * The proposed place to store the generated reference files is the
>    'platform-test-parameters' repository in KernelCI [2].

How would a user run this on their systems - do they need to access
this repository in KernelCI?

This is what I see when I run the test on my system:

make -C tools/testing/selftests/devices/exist/ run_tests
make: Entering directory '/linux/linux_6.11/tools/testing/selftests/devices/exist'
TAP version 13
1..1
# timeout set to 45
# selftests: devices/exist: exist.py
# TAP version 13
# # No matching reference file found (tried './LENOVO,20XH005JUS.yaml')
# # Totals: pass:0 fail:0 xfail:0 xpass:0 skip:0 error:0
not ok 1 selftests: devices/exist: exist.py # exit=1
make: Leaving directory '/linux/linux_6.11/tools/testing/selftests/devices/exist'

thanks,
-- Shuah

