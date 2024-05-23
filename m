Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92254125DE
	for <kernelci@lists.linux.dev>; Thu, 23 May 2024 15:54:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716479697; cv=none; b=Ky1GLxrYqCzkv5cXyB1GKAFtzlObV6ITl7Gwr9Tw0a04oQsmOyiJWjRW0xv6Jmwi28NNvJznG8Mn4QrymAmPrQggga499x1iSOdfrOdDzGhz8EppYVZYw09qwVTUV+K2/YAuMcFFP50r85NQZr600HNXjewUQWlqwxP6epN/UIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716479697; c=relaxed/simple;
	bh=DjstJn/LTRW/jX63eihKG5DNVFMAueG8ywtnpAdZViA=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=ds+AIJhEh9r7df/XUYQU9b4R5BOxEf6IMFCE6LoF7BBc/JTjSE4qj9CHQSd6JgPdeJ5B1LF24Pj6vU+GP+S9iwbQ0dTfibpoHI//B+YiM/wH/f2HvUl4C0qqFVitFLV0UWaj68ZH11DL4nSkq9fAVrnpDEPJBFgCaNnipUGIp/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TEqBXoXX; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TEqBXoXX"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-42100fa9dd6so6276505e9.1
        for <kernelci@lists.linux.dev>; Thu, 23 May 2024 08:54:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716479694; x=1717084494; darn=lists.linux.dev;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DjstJn/LTRW/jX63eihKG5DNVFMAueG8ywtnpAdZViA=;
        b=TEqBXoXXuWs3YG8MaOagPpMsyo00Cmg2FWA0Mo/D/4hocGLSPH6tudZnFCAQbV5Ain
         /phK+8CXeRpCXkGcGRhpxOV/GOYhCFCMYHcr39k2BfhysOFhAmCrjPbpAYt/E9TFmByt
         ZzAQNvhLYPbPWJP/iYR34ZbJOsxs45UD/TSwUUnSne06LneDSINyFH93BZLXkYedllbU
         bHXH7OThropPlumbEOQjp6VK1r6p4Q/ciGyITF+oaH8qItfOqWDBlC6IWLKT7gXPulwn
         KjsV8tXoE4CkfLdmY6YGoAV6AW3x587Rmez5y5SyCuJSMY9BNY3EyZT2bRu47kia0NxC
         n6Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716479694; x=1717084494;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DjstJn/LTRW/jX63eihKG5DNVFMAueG8ywtnpAdZViA=;
        b=nVyQLyYRf/SQgr7Z/jbEXJVBP71nVmMZ70zwiUzChFSqcJrzTm0zeutA+a9P5q8AbD
         02h2ZPf2InGSmBy1TYFMqV2tB06ivUUqPCzmZqmVxA/M6DBGEDa4xWcAsY0rN9kBNcmY
         rh8qqKw6v1wHRzfHBMctRlU0HwGCqiMBP2o73zIrILLK1otszW45yocba4NWUCBs1J2m
         c16kE83KIw1Qok1hXqjVDHcSuCsElJCXv4FbuQO1WkR2SHkJ6aV9oqUC/w1rbUfGPDgD
         bs4BgSGz0ViXLPN8i59YS41ATJOF+qUngBPJgDnLby/6P3oTgSWctYiU0aWbW/Xz3wgc
         cthA==
X-Gm-Message-State: AOJu0YxzEAo3h9AE1XFEGowvu8EiPQaygiMo//vG5N9MrWwWsBuM4Od1
	nl1ZaLuQaP8b/zCD2mD4pURYpsblb55EtVK5zw1T5fN8oajrHBKMWj9s6Q==
X-Google-Smtp-Source: AGHT+IHunxpUsLwV4KwSqE5iH2xKT/kTc1SqBHRxhV6/SXzfWIKLkTFZbovGf2FRg1kUlfJUaekx+w==
X-Received: by 2002:a05:600c:4695:b0:41a:4623:7ee9 with SMTP id 5b1f17b1804b1-421015b3ccemr24098965e9.10.1716479693659;
        Thu, 23 May 2024 08:54:53 -0700 (PDT)
Received: from [192.168.0.118] (88-113-27-52.elisa-laajakaista.fi. [88.113.27.52])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-421010b9f45sm28308595e9.48.2024.05.23.08.54.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 May 2024 08:54:53 -0700 (PDT)
Message-ID: <b51eab8a-41cd-4439-8434-076d09b60ed4@gmail.com>
Date: Thu, 23 May 2024 18:54:52 +0300
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "kernelci@lists.linux.dev" <kernelci@lists.linux.dev>,
 "kernelci-tsc@groups.io" <kernelci-tsc@groups.io>
From: Nikolai Kondrashov <spbnick@gmail.com>
Subject: New name for new "KernelCI"
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi everyone,

As you know, we've been developing the new KernelCI API [1], and the
kernelci-pipeline [2] based on it, for quite a while.

However, by now it seems that too many things are being called "KernelCI": the
project, pieces of the old system, pieces of the new system. We would also
like to give the name of KernelCI the project a wider scope than just a
particular CI system, and accommodate more packages/projects under its name.

So we would like to propose to call the new system "KernelCI <Something>".

And this message is about that "<Something>".

I think it would be good to have the new name associate with one or more of
the below qualities/functions (but feel free to dispute and extend this):

* focused
* simple
* powerful
* experienced (as in arising from experience)
* open
* distributed
* commanding (a fleet)
* kernel-related
* bug-related

One of the current working names, that Gustavo Padovan has proposed, is
"Maestro". As in "KernelCI Maestro". It hits the following associations:
focused, powerful, experienced, commanding.

As a joke and to come up with an example, I suggested "Kraken", that is
"KernelCI Kraken", which hits these: powerful, experienced (it's old), simple
(minded), focused (on sinking ships), distributed (it has tentacles),

Keeping things short, here are all the ideas so far, in alphabetic order:

* KernelCI Anthill - bug-related, distributed, commanding, focused
* KernelCI Arrow - focused, simple, powerful
* KernelCI Kraken - powerful, experienced, simple, focused, distributed
* KernelCI Lens - focused, powerful, simple
* KernelCI Lighthouse - focused, simple, powerful, commanding, experienced
* KernelCI Maestro - focused, powerful, experienced, commanding
* KernelCI Needle (in a haystack) - focused, simple, powerful, experienced
* KernelCI Nucleus - kernel-related, simple, powerful (when split)
* KernelCI PristineCI - simple, open
* KernelCI Pulse - focused, simple, powerful, experienced
* KernelCI Tamanduá (anteater in Spanish) - bug-related, simple, focused
* KernelCI Trails - focused, experienced, distributed
* KernelCI Warden - focused, powerful, experienced, commanding

I would appreciate any arguments and ideas about this. Once we have all the
names we can think of, and strike out ones we definitely don't like, I'll
create and post a poll here to pick one.

Thank you!

Nick
TSC Chair

[1] https://github.com/kernelci/kernelci-api
[2] https://github.com/kernelci/kernelci-pipeline
