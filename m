Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CD3C1419B5
	for <kernelci@lists.linux.dev>; Thu, 29 Feb 2024 14:16:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709216183; cv=none; b=l7aLXNgHyZWiQFt/W+72rUOT7CoCwBJDT9S/0Dr5A4wc674t0hGIGmr5P5ghEF1y7jxTL79Xx2D8PXlhAIEQaJjMkzq0HYsNtbng5mxjCjLSUncYJGL60WUak1XOa5iSrFc77cadutZLFejReZWay06HRu9UktnZgSEM2d07Wm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709216183; c=relaxed/simple;
	bh=PUK02Cucbp8QURrkbJDRBmCMb/j7fNSM0Xn8Y5zhIkc=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=RIb39mnyI32lzgBHMNFw1x5VdoMENSsZ2JqotEIMjK76xvcwXD4+MM9rqLR9BSGB9bKM3vyWMo8mLQhV1A2IcvMFBvk16yUXmjiG9Me/IleRMPEB07fEiZlOogfSFK12+M2NysCWc1zneGkp15RwohmgkjyGx+7EXw/Na/HTyMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VTXTHpTB; arc=none smtp.client-ip=209.85.219.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VTXTHpTB"
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-68fcedcf8aaso3733966d6.2
        for <kernelci@lists.linux.dev>; Thu, 29 Feb 2024 06:16:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709216180; x=1709820980; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/W/wZXm/lm7nezS3iJK5hhPJV5z7bm8xrMOjN7sfA2c=;
        b=VTXTHpTBVogxJM77hIkNVsdq8sEg23Dxbo8efamV1a053Xv5H2GQDicm8Cy4Rb4J0J
         XxfDvJlK162qi7FJ9rz4xoHB8nY0t7emzDsSLnFmFSTorCmf5suItXWbIh1j2ZgWoCWe
         J/W4R0T7udl+V50BF4i6rHkqJKPx+EQ0F8amGR6xqIS5hEL/VkXSEbVli1GaKEKtqjn1
         4iziO++jqgafHYo41EbsLLd2Ejgpx9n6AJzgfn7xucj5kjJnHLnfcXIYaNBg+rRw/14t
         P0/QMVn38IsZwcOHXAsOJHKpHVhM5dKvhlyw17xx3I15inCjpS48HkN8sO3uYya80Xmg
         XvwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709216180; x=1709820980;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/W/wZXm/lm7nezS3iJK5hhPJV5z7bm8xrMOjN7sfA2c=;
        b=XLcPjPYUzqTodNnsY5yrRAuPGz9nRs0L7xEiay/5OV3YVPRI+yQ1CnhEl5Va3YCbkH
         IXidxfPtdXGmtKuBihO8IPj5um25arqyOPZnDQBTdawrel9QWKJk27K5uW43xbvUzwVj
         Aa+1W+GpFBhV+8H0W8OzaulW34Ie1vwxu1j7L651/mBp6O8m+cX7deZj7zpYxRdZggun
         smjI0Q8xQg3bFRZeWgWLawNg7RjqhmrERoEIVexKgrueVSwwQ7+4AqCX1vTTeF+vIjYd
         BdhQrHXAbnVmt7kKzSlKALumpbtwmTU6XHSLwi4JNTIq7XR6Z7PwQvl5r5QtIJT9o/6p
         ycag==
X-Forwarded-Encrypted: i=1; AJvYcCWGvjPhMM2FMcVxp/Pgm+L+d8jqA2Kw7nSDU/o5OT5j9tyVlvZnRuMxisv5toFnha3lWGejIZ4N1R5rIQDVBVx06/1ulWfukG0=
X-Gm-Message-State: AOJu0YyZhgcWAkSUPLijLc563P+WMA+sRTgC2sbCKBBd2y7RpD9vVQ3X
	Z6opt0xjTtirhFSyBynx26xpYl1PqL6e4Jr6vSYKLVTksV6UnZ4Q
X-Google-Smtp-Source: AGHT+IHs1YnZ0esHs1BMxISmBCDSRJY5ZhDnZqGmDP5+mD/g+W2yrpWgUSNeF5GUTRda4q1JIaSsQQ==
X-Received: by 2002:a0c:e80e:0:b0:68f:3058:a0 with SMTP id y14-20020a0ce80e000000b0068f305800a0mr2481153qvn.41.1709216180406;
        Thu, 29 Feb 2024 06:16:20 -0800 (PST)
Received: from [192.168.0.118] (88-113-27-52.elisa-laajakaista.fi. [88.113.27.52])
        by smtp.gmail.com with ESMTPSA id ng8-20020a0562143bc800b0068fa4534070sm770363qvb.83.2024.02.29.06.16.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Feb 2024 06:16:20 -0800 (PST)
Message-ID: <a5726043-1906-44ba-a6ee-a725a2776269@gmail.com>
Date: Thu, 29 Feb 2024 16:16:15 +0200
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] kci-gitlab: Introducing GitLab-CI Pipeline for Kernel
 Testing
Content-Language: en-US
To: Guillaume Tucker <gtucker@gtucker.io>,
 Helen Koike <helen.koike@collabora.com>, linuxtv-ci@linuxtv.org,
 dave.pigott@collabora.com, mripard@kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kselftest@vger.kernel.org,
 gustavo.padovan@collabora.com, pawiecz@collabora.com,
 tales.aparecida@gmail.com, workflows@vger.kernel.org,
 kernelci@lists.linux.dev, skhan@linuxfoundation.org,
 kunit-dev@googlegroups.com, nfraprado@collabora.com, davidgow@google.com,
 cocci@inria.fr, Julia.Lawall@inria.fr, laura.nao@collabora.com,
 ricardo.canuelo@collabora.com, kernel@collabora.com,
 torvalds@linuxfoundation.org, gregkh@linuxfoundation.org
References: <20240228225527.1052240-1-helen.koike@collabora.com>
 <d99d026e-ed32-4432-bab3-db75296e67d8@gtucker.io>
From: Nikolai Kondrashov <spbnick@gmail.com>
In-Reply-To: <d99d026e-ed32-4432-bab3-db75296e67d8@gtucker.io>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/29/24 2:20 PM, Guillaume Tucker wrote:
> Hello,
> 
> On 28/02/2024 23:55, Helen Koike wrote:
>> Dear Kernel Community,
>>
>> This patch introduces a `.gitlab-ci` file along with a `ci/` folder, defining a
>> basic test pipeline triggered by code pushes to a GitLab-CI instance. This
>> initial version includes static checks (checkpatch and smatch for now) and build
>> tests across various architectures and configurations. It leverages an
>> integrated cache for efficient build times and introduces a flexible 'scenarios'
>> mechanism for subsystem-specific extensions.
> 
> This sounds like a nice starting point to me as an additional way
> to run tests upstream.  I have one particular question as I see a
> pattern through the rest of the email, please see below.
> 
> [...]
> 
>> 4. **Collaborative Testing Environment:** The kernel community is already
>> engaged in numerous testing efforts, including various GitLab-CI pipelines such
>> as DRM-CI, which I maintain, along with other solutions like KernelCI and
>> BPF-CI. This proposal is designed to further stimulate contributions to the
>> evolving testing landscape. Our goal is to establish a comprehensive suite of
>> common tools and files.
> 
> [...]
> 
>> **Leveraging External Test Labs:**
>> We can extend our testing to external labs, similar to what DRM-CI currently
>> does. This includes:
>> - Lava labs
>> - Bare metal labs
>> - Using KernelCI-provided labs
>>
>> **Other integrations**
>> - Submit results to KCIDB
> 
> [...]
> 
>> **Join Our Slack Channel:**
>> We have a Slack channel, #gitlab-ci, on the KernelCI Slack instance https://kernelci.slack.com/ .
>> Feel free to join and contribute to the conversation. The KernelCI team has
>> weekly calls where we also discuss the GitLab-CI pipeline.
>>
>> **Acknowledgments:**
>> A special thanks to Nikolai Kondrashov, Tales da Aparecida - both from Red Hat -
>> and KernelCI community for their valuable feedback and support in this proposal.
> 
> Where does this fit on the KernelCI roadmap?
> 
> I see it mentioned a few times but it's not entirely clear
> whether this initiative is an independent one or in some way
> linked to KernelCI.  Say, are you planning to use the kci tool,
> new API, compiler toolchains, user-space and Docker images etc?
> Or, are KernelCI plans evolving to follow this move?

I would say this is an important part of KernelCI the project, considering its 
aim to improve testing and CI in the kernel. It's not a part of KernelCI the 
service as it is right now, although I would say it would be good to have 
ability to submit KernelCI jobs from GitLab CI and pull results in the same 
pipeline, as we discussed earlier.

Nick
