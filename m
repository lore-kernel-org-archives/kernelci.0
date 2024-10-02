Received: from mail-io1-f42.google.com (mail-io1-f42.google.com [209.85.166.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBDDA78C76
	for <kernelci@lists.linux.dev>; Wed,  2 Oct 2024 18:00:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727892015; cv=none; b=DPihDKU5UqSeIgIkb8qxUuLQ281up/TY5Y6LDQYjAJMDvUKyYTVbF4VCr9e65hECi5YyWFn8/iggjjscy36hBjFR3FmpUIyJnFJyGIoUkanJVJKFgtpUB956F5kaxZgayfp9P70IP7dfJMfDH8FQUvuN34Xu5ICbL/P+u4QZbo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727892015; c=relaxed/simple;
	bh=VXOOUNdnAEhPqciXyVZksZiXTp0bQQtRDANzdI1gkBA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SyTzyjt8jU9l91tN84/1VLkdQcrEjPy8Z0dWU+YK0BwHTWLfa9r3tQ/vADTim0srP1QkIdcbPYcmWqcF7X3chycjOM4DGmn0NHrvAqTC41MX/qfv2HBrmCkkDoqY2JsllBPPwA2hsxvdgmiqblgRat6u/FCB/lBKExRpd4+kYkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=DMifu8Hw; arc=none smtp.client-ip=209.85.166.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="DMifu8Hw"
Received: by mail-io1-f42.google.com with SMTP id ca18e2360f4ac-82cdb749598so4259139f.1
        for <kernelci@lists.linux.dev>; Wed, 02 Oct 2024 11:00:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1727892013; x=1728496813; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=h2ii6GPB8LbcDkdZtu/vEyeCXjQrhQgW3fBbVs7hZZg=;
        b=DMifu8HwLeIjiRouNVE4LeyKpLOlkA1uJYIgCtWL2zNgKbb1/Wsq/vJeapP35v56YY
         OenFjr3+GDIrxr/yqwdhHSXcJUmShuN5hMwret8+KMNM72qWgJybG8kK06ENFDntc+R2
         Kf+Tfod84RLKfs2oDsCvs+i0TEHLQPplOhwA0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727892013; x=1728496813;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=h2ii6GPB8LbcDkdZtu/vEyeCXjQrhQgW3fBbVs7hZZg=;
        b=p3ptJJ48OoQSDt2VTQKko3z6akTFRyK+qfsujsIf1Z908TFdVlpkLRFTEcvzL/7yZU
         eGb/zfTpcWL5Pty+fhGsTlL/vDr9wcApe6lLPnkY4YNLfTSyiVI0cUt1dc2mEKyvPUeZ
         oBzfGLkIpwAzYJvttMkvwEOk5Yw01njyWM/cJ5z43mNEaxIGref7YSIWjL4StQRVhyKc
         O2a/AYCZQb1fIGLn9luF/ptUVBXsNt1jAZWn1btMxt28CFTlwNe4Zav8V0LG76PPIn6L
         8E0Uy8addeF3VRDCGQyFYPfyUpDLWBvBi3TLz4T9V8YfZ8IXoviukIR9+TM7zzgdCRCE
         gP4A==
X-Forwarded-Encrypted: i=1; AJvYcCVmk5frEQvtrm5I7QnSwjEF6kKf1kGjo7XWfYHu/pzPr5WpqaZJdHgC/DinldCS0Zf/SabZLKI46g==@lists.linux.dev
X-Gm-Message-State: AOJu0YzppEaDsQxzI5sNyrmbK2PQXLnYbt83Ehs5M1GCFSnNyKjryxxp
	V97SfgZOU3Yu5ts0lVJbTyCttjrISmi2LteCuCWL17Up6Jab3rL3wzcK62AJsCU=
X-Google-Smtp-Source: AGHT+IFZG+oK4eRQhMYCZ+1EA/WngOtJ5AXbNw+nKvg+PAQy26l2faeXkJTKlKwWhIU/wZbdksh8gQ==
X-Received: by 2002:a05:6e02:1a6c:b0:3a0:9026:3b65 with SMTP id e9e14a558f8ab-3a365954e63mr38914205ab.25.1727892012800;
        Wed, 02 Oct 2024 11:00:12 -0700 (PDT)
Received: from [192.168.1.128] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4d888835090sm3187850173.15.2024.10.02.11.00.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Oct 2024 11:00:11 -0700 (PDT)
Message-ID: <0040a842-de9c-4f9c-9d61-c1bfbd010470@linuxfoundation.org>
Date: Wed, 2 Oct 2024 12:00:10 -0600
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs: dev-tools: Add documentation for the device focused
 kselftests
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Shuah Khan <shuah@kernel.org>, Jonathan Corbet <corbet@lwn.net>
Cc: kernel@collabora.com, linux-kselftest@vger.kernel.org,
 workflows@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernelci@lists.linux.dev,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20241001-kselftest-device-docs-v1-1-be28b70dd855@collabora.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20241001-kselftest-device-docs-v1-1-be28b70dd855@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/1/24 09:43, Nícolas F. R. A. Prado wrote:
> Add documentation for the kselftests focused on testing devices and
> point to it from the kselftest documentation. There are multiple tests
> in this category so the aim of this page is to make it clear when to run
> each test.
> 
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> ---
> This patch depends on patch "kselftest: devices: Add test to detect
> missing devices" [1], since this patch documents that test.
> 
> [1] https://lore.kernel.org/all/20240928-kselftest-dev-exist-v2-1-fab07de6b80b@collabora.com
> ---
>   Documentation/dev-tools/kselftest.rst       |  9 ++++++
>   Documentation/dev-tools/testing-devices.rst | 47 +++++++++++++++++++++++++++++

The new file needs to be added to Documentation/dev-tools/index.rst

Docs make should have warned about this?

>   2 files changed, 56 insertions(+)
> 
> diff --git a/Documentation/dev-tools/kselftest.rst b/Documentation/dev-tools/kselftest.rst
> index f3766e326d1e..fdb1df86783a 100644
> --- a/Documentation/dev-tools/kselftest.rst
> +++ b/Documentation/dev-tools/kselftest.rst
> @@ -31,6 +31,15 @@ kselftest runs as a userspace process.  Tests that can be written/run in
>   userspace may wish to use the `Test Harness`_.  Tests that need to be
>   run in kernel space may wish to use a `Test Module`_.
>   
> +Documentation on the tests
> +==========================
> +
> +For documentation on the kselftests themselves, see:
> +
> +.. toctree::
> +
> +   testing-devices
> +
>   Running the selftests (hotplug tests are run in limited mode)
>   =============================================================
>   
> diff --git a/Documentation/dev-tools/testing-devices.rst b/Documentation/dev-tools/testing-devices.rst
> new file mode 100644
> index 000000000000..ab26adb99051
> --- /dev/null
> +++ b/Documentation/dev-tools/testing-devices.rst
> @@ -0,0 +1,47 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +.. Copyright (c) 2024 Collabora Ltd
> +
> +=============================
> +Device testing with kselftest
> +=============================
> +

Get rid of the extra blank line.

> +
> +There are a few different kselftests available for testing devices generically,
> +with some overlap in coverage and different requirements. This document aims to
> +give an overview of each one.
> +
> +Note: Paths in this document are relative to the kselftest folder
> +(``tools/testing/selftests``).
> +
> +Device oriented kselftests:
> +
> +* Devicetree (``dt``)
> +
> +  * **Coverage**: Probe status for devices described in Devicetree
> +  * **Requirements**: None
> +
> +* Error logs (``devices/error_logs``)
> +
> +  * **Coverage**: Error (or more critical) log messages presence coming from any
> +    device
> +  * **Requirements**: None
> +
> +* Discoverable bus (``devices/probe``)
> +
> +  * **Coverage**: Presence and probe status of USB or PCI devices that have been
> +    described in the reference file
> +  * **Requirements**: Manually describe the devices that should be tested in a
> +    YAML reference file (see ``devices/probe/boards/google,spherion.yaml`` for
> +    an example)
> +
> +* Exist (``devices/exist``)
> +
> +  * **Coverage**: Presence of all devices
> +  * **Requirements**: Generate the reference (see ``devices/exist/README.rst``
> +    for details) on a known-good kernel
> +
> +Therefore, the suggestion is to enable the error log and devicetree tests on all
> +(DT-based) platforms, since they don't have any requirements. Then to greatly
> +improve coverage, generate the reference for each platform and enable the exist
> +test. The discoverable bus test can be used to verify the probe status of
> +specific USB or PCI devices, but is probably not worth it for most cases.
> 
> ---
> base-commit: cea5425829f77e476b03702426f6b3701299b925
> change-id: 20241001-kselftest-device-docs-6c8a411109b5
> 
> Best regards,

thanks,
-- Shuah
