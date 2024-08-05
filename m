Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D0BF18026
	for <kernelci@lists.linux.dev>; Mon,  5 Aug 2024 12:34:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722861252; cv=none; b=dfGkNbYqeyr0gffXjKM2954C/X9OVDXq2Bb+z7Sh+Gk6WaUpb+sCVlzyQNSvyp2+mjrFgJktu32m4Wl49tafy9KGWPs+I/KVWmmy1xCfRX523YSEKSKS0bWAI6BznzPR35hNJhusdVv+KrXh52GlhHePK13YmqnDTQAD63i+oBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722861252; c=relaxed/simple;
	bh=GM1zLz5+x8031ael3PwRtMwHtDtwirjtnF77wAVz5vc=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=F0i2tjKkQTSTKSEEEMJHquMhq1rckcijR3kSbmz5nYVdVwJagrjyjy3X1BYPk+XnsBzSR/1A/AKyVOKnnN08iQcKv48hWQBEBJxJ/CZSGfXK405CnQOOL38oFa020d5aFiDgAYyoEtBsEzR5EkbLc/gvNhIR3KJb+lK/97JHTaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cmcwLVnK; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cmcwLVnK"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4280bbdad3dso70854035e9.0
        for <kernelci@lists.linux.dev>; Mon, 05 Aug 2024 05:34:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722861249; x=1723466049; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :to:from:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TCk3UXqMYvgSqugXZCczdPN/MI6++teABx/udteiMzE=;
        b=cmcwLVnKr9lLcDh7W7JVEPKgImfrP+VghS+6fh2qC4eRULwjDLlM5XY8JLCKJWAn7+
         W9w74EFXogEy3TArOUhPdN9pzWJdXSRToV1+qxg398UqXnGK9eipqWaiguXnkQHkSl3x
         K0xtFvvtdUmI2BozKcs+jVLm2GG7u+5RXdvTQf5tdNIgYf3FzzreLws+AtSsWPGm/7fO
         iBswE2Imhs7FDbBtZCyMGVoGT++EJmTEECtg8cShMRDFA9tAIXtfQFuzvWjQOaf30Cll
         CCEBdgcJdw/JE9TWXimB2/lyc5Qoc2YnKs7P+EUbAF7KQVzg6zf6510NLQ+i0NlhCs4U
         uDfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722861249; x=1723466049;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TCk3UXqMYvgSqugXZCczdPN/MI6++teABx/udteiMzE=;
        b=QoQiWYDvjXU3iRYQBE3nZWNh4sKyVkj+8giU6QA3IxacUthAA6gyqnJZbGjZYi6dl/
         avlYoZ/dmNRDXAuKA/TnKMZ0dTigNOBv8jUJv6Y0ty7qXxe9tdrTHbh46veQCDIg8naM
         esbl2Sp0OVcoYd7kXc4NQ+UAaNDqRU7jP72B3uOgdDz6PL+lQ/ReKxWBkucEY15XwvnL
         w2yFDxk+iDvl1NVHIPtXWGePGSdgHhQ8l+l0Nk/U2+6OgFmRGPuTC2HVJ2Y+Dcjo9o2i
         QuN57+AFLQpeBthP0rKTfBnkBrsXlWbesy5qkh5fXApTiyJR1h/pTAF71o+zMDE6uwPR
         G0og==
X-Forwarded-Encrypted: i=1; AJvYcCXMUr6tWL1qOpZ3EFaUx51UHQUdsopDxmNIoT9Pvi5BJfOHusVptqDGvBSWFm6/ibqAGuokAPWdWO4myO8/wRsKYZr8Pu7KXns=
X-Gm-Message-State: AOJu0Yx3FFUgIDUemzFCSK3rIHhYuSKMsKwg+Mu/Mm6Kym4g3+gWzppD
	C9e+cXrYhJKqa6XEgUFrSzPx0aSxGaIPHU5jRvJKOyQqSLDeb8eV
X-Google-Smtp-Source: AGHT+IFzD9itsH+yTTXGEm/E6d+nfXq00Y2Ge/+nWX9R2ZL6UlGOYPWWqTCA7dCQniAzpqU7FjohMA==
X-Received: by 2002:a5d:64a1:0:b0:367:43ce:9c91 with SMTP id ffacd0b85a97d-36bbc0f9fb6mr8816065f8f.27.1722861249257;
        Mon, 05 Aug 2024 05:34:09 -0700 (PDT)
Received: from [192.168.0.118] (h-185-57-5-67.na.cust.bahnhof.fi. [185.57.5.67])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36bbd059885sm9772320f8f.84.2024.08.05.05.34.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Aug 2024 05:34:08 -0700 (PDT)
Message-ID: <5cbd8d76-3231-4f32-a28a-922a77fdeb3f@gmail.com>
Date: Mon, 5 Aug 2024 15:34:07 +0300
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: KCIDB: Test schema enhancements
From: Nikolai Kondrashov <spbnick@gmail.com>
To: syzkaller <syzkaller@googlegroups.com>, Dmitry Vyukov
 <dvyukov@google.com>, Vishal Bhoj <vishal.bhoj@linaro.org>,
 Alice Ferrazzi <alicef@gentoo.org>,
 automated-testing@lists.yoctoproject.org,
 Cristian Marussi <cristian.marussi@arm.com>, Tim Bird <Tim.Bird@sony.com>,
 Johnson George <Johnson.George@microsoft.com>,
 Veronika Kabatova <vkabatov@redhat.com>,
 Guillaume Tucker <guillaume.tucker@collabora.com>,
 "kernelci@lists.linux.dev" <kernelci@lists.linux.dev>,
 Don Zickus <dzickus@redhat.com>, Mark Brown <broonie@kernel.org>,
 Philip Li <philip.li@intel.com>, Denys Fedoryshchenko
 <denys.f@collabora.com>, Michael Hofmann <mhofmann@redhat.com>,
 Tales da Aparecida <tdaapare@redhat.com>,
 Aditya Nagesh <adityanagesh@microsoft.com>,
 Jeny Dhruvit Sheth <jeny.sadadia@collabora.com>,
 Sachin Sant <sachinp@linux.ibm.com>, "Hambardzumyan, Minas" <minas@ti.com>
References: <5188d6fe-bd01-402b-a6e6-0fe57ef4d336@gmail.com>
Content-Language: en-US
In-Reply-To: <5188d6fe-bd01-402b-a6e6-0fe57ef4d336@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 8/5/24 12:56 PM, Nikolai Kondrashov wrote:
> Hello everyone (potentially) involved with sending data to KCIDB,
> 
> We've been working hard at KernelCI to bring you a bunch of exciting changes,
> to be presented at LPC in September, and in our news channels.
> 
> Meanwhile I'd like to propose two small, but potentially very useful changes
> to the I/O schema for tests:
> 
> * Supporting non-binary outputs beyond PASS/FAIL -
>   integers/floats/booleans/strings/etc. - useful for performance tests.
> 
> * Supporting recording `compatible` values from the top of the device tree
>   inside the test environment, for machines which use them - useful for
>   correlating test results by hardware.
> 
> Here's the corresponding schema PR:
> 
>     https://github.com/kernelci/kcidb-io/pull/85
> 
> I'll follow up with a separate message for each of the changes, going over the
> details and the rationale.
> 
> Feel free to reply to this or the other messages and leave comments in the PR!

If there are no objections by that time, I would like to merge this next
Monday, Aug 12, and start working on the rest of the support for these
enhancements.

Don't hesitate to object to *that*, if you feel it's too fast!

Nick
