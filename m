Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D42EB79C8
	for <kernelci@lists.linux.dev>; Fri, 24 Jan 2025 12:58:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737723505; cv=none; b=egKFb5u8eAdmsWELlXFnPrWLJxn2TVSDeb1EzN7wZGGrX82uEIyC3L5MPLMb2eUSwWI20z8oq+kmITgD7d7noGKa8IsKxz33jApah2fxppaolVh1EiQ3sCvs/Z9vG89xJsxL2JMax0vxl6qHMvKeugmOHht/hDbOD1GWe4M2nlw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737723505; c=relaxed/simple;
	bh=9vhLVgSJvkUzp/+ZDz8AjHfj93ayZ6e4etxKDQgKZ1k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iz3dv/T6mcvoNeoL7KvEuM7W3wJE1WzNEEc3xTYuyWulyvwzfZzeW71lobyf2VlTaPzImdnfJD7/vKOZHblCrgU36WNZ3d8BWWRQKV+avElCFD1D7GJ4FWiOitjacNS5RXdwpIgMD6igzII+pM/fgb3Q9nw8qD2/3yOxw4G4nkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=WW8u5gxV; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WW8u5gxV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1737723500;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=z0J5Z2SBoY0f55z7emiVbfYnb6Y91DGR2ecZHMgdiZ4=;
	b=WW8u5gxVfB7fNEPbftWXTlLBjMjBdgZ/XRHq5UQuAC2exOLa0nUxFLD+eL7isujAXBtzfA
	d7G0odA1ByZpggsqMcRwdgpTneoqSEOuOiNkdX8K7ygllJCfqPQRe+cz7/EV1lgsCYBIGF
	QHLNX4tJp272sf2lw6qMiFi7g6CKdDE=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-680-85cC5Lz_MKGf376oMt8cjg-1; Fri, 24 Jan 2025 07:58:19 -0500
X-MC-Unique: 85cC5Lz_MKGf376oMt8cjg-1
X-Mimecast-MFC-AGG-ID: 85cC5Lz_MKGf376oMt8cjg
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4362b9c15d8so9761735e9.3
        for <kernelci@lists.linux.dev>; Fri, 24 Jan 2025 04:58:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737723498; x=1738328298;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=z0J5Z2SBoY0f55z7emiVbfYnb6Y91DGR2ecZHMgdiZ4=;
        b=Aas0+a/I5WrDUK/iPMoKG4hospvtpf07he/gy9CAPtVpnBtcmTZKfU+EVwbcPwjqF9
         ygahiSt7XDBV2Meo/FTXfBq19iOX60wefh109oMUqIGa+PX/TS6918m6n01zMPnK7EDH
         r4fb/cVSXyPWpSnkPgJJ4Yhn7n1ouXNc6h3R5XbXpkaf1SMpLYbotQ/Vws5PT5cCURuX
         rIDzGv4XBNO6kUjgn+LipYNYipmMvnwTG/l/3etxtkG3cNpgllVCMdXI+TRsvltRBZ02
         NSmoCwDvRxZtBy9OM10MYbvrsFb4Lro/GraKaKRmvh1zc6YL0OKUhzR/vv/KpgPFfVcu
         SR0w==
X-Forwarded-Encrypted: i=1; AJvYcCXN3k9vxp2+HLWjYFBqbN4GDD92pkoa/F+24obNH/70QMDJ2SEJI2rBrSw9aTqt6U2cpsyCJ9WepA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz7deNV7QL3M2Uww2VAPDHjuuNylFWlK0tdhEOx6IE584LPyGAi
	SHsIo6OeYZ+xgZWux+OLnEYlz2ywOeccHzvyXq4rNv9dfIr28uOCitwpJ9N8Gf84D3rlV0WAJWF
	mF5n2Qa0vDRG54/cRGzTz6Y3PpWBDyymEla/YpATv5oWAYV4ZZnfTSveR
X-Gm-Gg: ASbGncsPa58G3PLfg2X01w+uH4N4sy/tVOpn0q7cVTySf5T/mdZ7P2oHaqzhMFwvnWs
	uNP7kNvQWXxbHJhNx9swxWIZiJTUlJFgZgIB3/uKu+fjCQbHavxQZBaqqaJYIB5j7tV0NyMlEJj
	L1CVoX2x8Sd5qtBP9gojQWKUZhh1i27PkqfWLSXLR2JOyGU5js9gtFPlHzDJBqLnEnbf2dizhYh
	2JSRvahyK1lHTSF9dzlOcNzaBvJ7A6ETlOrVC+u7rRrM3xMs+hnBWTPHjHoiJ9Wf1jpn5e5SLi3
	OVrSslxfdxpw57abKoiw8XErmBGktDCwNtSXbpMNeuPQxQ==
X-Received: by 2002:a05:600c:4c24:b0:434:f3a1:b214 with SMTP id 5b1f17b1804b1-4389da1e6c7mr254282995e9.28.1737723498235;
        Fri, 24 Jan 2025 04:58:18 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHRs0Glx89jQkSNFnV105jdUfXdwoCdvq5qiGz1yC35tKkgkMxhavVq6LlrhT4jZWikxY+ngg==
X-Received: by 2002:a05:600c:4c24:b0:434:f3a1:b214 with SMTP id 5b1f17b1804b1-4389da1e6c7mr254282705e9.28.1737723497800;
        Fri, 24 Jan 2025 04:58:17 -0800 (PST)
Received: from [192.168.0.167] (h-185-57-5-149.na.cust.bahnhof.fi. [185.57.5.149])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438bd47eecasm25576245e9.6.2025.01.24.04.58.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Jan 2025 04:58:17 -0800 (PST)
Message-ID: <a77f2eea-1793-4e83-92b0-92b5bbd23a5e@redhat.com>
Date: Fri, 24 Jan 2025 14:58:14 +0200
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/5] kci-gitlab: Introducing GitLab-CI Pipeline for
 Kernel Testing
To: Jarkko Sakkinen <jarkko@kernel.org>,
 Vignesh Raman <vignesh.raman@collabora.com>, kernelci@lists.linux.dev
Cc: linuxtv-ci@linuxtv.org, dave.pigott@collabora.com, mripard@kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kselftest@vger.kernel.org, gustavo.padovan@collabora.com,
 pawiecz@collabora.com, spbnick@gmail.com, tales.aparecida@gmail.com,
 workflows@vger.kernel.org, skhan@linuxfoundation.org,
 kunit-dev@googlegroups.com, nfraprado@collabora.com, davidgow@google.com,
 cocci@inria.fr, Julia.Lawall@inria.fr, laura.nao@collabora.com,
 kernel@collabora.com, torvalds@linuxfoundation.org,
 gregkh@linuxfoundation.org, daniels@collabora.com,
 helen.koike@collabora.com, shreeya.patel@collabora.com,
 denys.f@collabora.com, nicolas.dufresne@collabora.com,
 louis.chauvet@bootlin.com, hamohammed.sa@gmail.com, melissa.srw@gmail.com,
 simona@ffwll.ch, airlied@gmail.com, Tim.Bird@sony.com,
 laurent.pinchart@ideasonboard.com, broonie@kernel.org, leobras.c@gmail.com,
 groeck@google.com, rdunlap@infradead.org, geert@linux-m68k.org,
 michel.daenzer@mailbox.org, sakari.ailus@iki.fi
References: <20250123135342.1468787-1-vignesh.raman@collabora.com>
 <D79RU9MHGKJ8.1HG89ZJS4Q5FC@kernel.org>
From: Nikolai Kondrashov <Nikolai.Kondrashov@redhat.com>
In-Reply-To: <D79RU9MHGKJ8.1HG89ZJS4Q5FC@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: njxiKyGLhcS_nNbX_hz50DvnytS-XzrAkOxBd2V4Y0k_1737723498
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Jarkko,

On 1/23/25 11:30 PM, Jarkko Sakkinen wrote:
> On Thu Jan 23, 2025 at 3:53 PM EET, Vignesh Raman wrote:
>> We are working towards creating a generic, upstream GitLab-CI pipeline
>> (kci-gitlab) that will replace DRM-CI [1]. The proposed GitLab-CI pipeline
>> is designed with a distributed infrastructure model, making it possible
>> to run on any gitLab instance. We plan to leverage KernelCI [2] as the
>> backend, utilizing its hardware, rootfs, test plans, and KCIDB [3]
>> integration.
> 
> Why can't you keep the next version of your great pipeline outside the
> kernel tree?
> 
> If there is a legit motivation for doing that, why it needs to be bound
> to Gitlab? Why can't you make script callable from any CI?

Greetings from the (today's) sunny Espoo!

Of course we could keep it outside the kernel tree. However, the point of this
contribution is to provide kernel maintainers and developers with an easy way
to setup their CI pipeline on a GitLab instance (the main one, FreeDesktop
one, or any other). Basically this is like a template or a library, if you
wish, which helps you do that. Approved by Linus too.

Why GitLab? Because it's one of the best, if not *the* best CI system these
days, with lots of flexibility, and it's Open-Source too (well, at least
open-core, which is still very capable). And also because a number of
maintainers and companies are already using it.

Sure, a script could be contributed too, but the value of this contribution is
a ready-made integration. And we want to make it easily discoverable, and
easily contributed to.

BTW, here's the talk we gave at last year's LPC regarding current use of
GitLab in the kernel and surrounding community:

https://lpc.events/event/18/contributions/1728/

Nick

