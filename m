Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83E69158D87
	for <kernelci@lists.linux.dev>; Mon,  5 Aug 2024 12:28:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722860935; cv=none; b=sMsGeeAxe804jnSYsBNwIc0PS/MNltCAtZL1u41jOPRNWwvQFe4SIJSX9AzY660gQI3knGCnkWXOXf/a6RahrjT78G+2s6qq6pSlzM4dRBe/6EY4MwUkwQdlfMwNrtkdr0mgAtTsxbaoaAo13OUuEVATFPvEVfSzwyBxbvn/cl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722860935; c=relaxed/simple;
	bh=oOl2M57Xm4Uzz7vJEbNZkwoQYRAJNJq85GwE1XdDPzo=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=a10hfUnzIcDvTa/jA4tIb5exusO2jQGAQrMpL1nPrL3ENe5s4/ONKcleJ8rDOqGqHtErE6gs+nCsTrxkHCS0wnpixeI2K+m/ezjmqzyYlUgK3U3Nui9Zb0JCEfvTdthYrIovTAM2N0J9/FnCAyC/2+eL4Op2nnBwuNHRuz2ZNTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EHZ6uEx0; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EHZ6uEx0"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-52f042c15e3so4781258e87.0
        for <kernelci@lists.linux.dev>; Mon, 05 Aug 2024 05:28:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722860932; x=1723465732; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :to:from:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4hsZ/UDNIN9uKkCstPM9X2SmD6O2tgiHQfIo9y8nJvI=;
        b=EHZ6uEx0x/S28/BHxImdHcxz0lmjlJbRxOMUraiaCF6P/6YPP4IswKKQEJTILxd5dD
         6Js1tCI0XnbaM15mzbEQhA5Vj++xZL5AXzkYRbkwFkMiawk42yEeHFF9KjpydwKucxAd
         OO0/j8cLZM2syzdaOUgW1xiX+GOs6J1RNkmBlRhs65phNxNkX28bqCi0ruBdf73Y15ff
         RqD3HP0W2TvZm4tNOevq/9yMOeHbfxPtm+AHvZMABcv0n+wc3adlqSNPqNSh8EpZElHz
         UQk8cROtCvSq/BP/FiPaoad6JM99alF9I8Ay3jugXb9uGbj9agePoyH73huSLcMOHHeW
         RR8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722860932; x=1723465732;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4hsZ/UDNIN9uKkCstPM9X2SmD6O2tgiHQfIo9y8nJvI=;
        b=WN+9VxJAhRRjCS8hM9jLy4L4UfC437Luu7ZW74XhEJ+BZyjGe8yX9MfbAhB578Jx1O
         C2zlUK6OCRpxWUIScsB1b68cJ67Tv5Bfzmk64UC1wU9rl32Ybo6dWb0lvywKVl2ZsIab
         FZzc0TJJ7gb2G0cYESB8jyAFWGBZXSuk679vdDyF89k0q495udDrwYB7O7u9ssIZacxh
         y6VT/5WjgX9e80cofSOydOLOLKODjGXs0SkwAlhNqb58L0ybAgpzYAXQctTfAdzJxP+U
         NszO1fZ2GoF+xLBAKsVhHqI2L5WUA/wMuA88b7OKmtYYWijWs7WQ2TosuIQNkR3lgEz8
         O9sg==
X-Forwarded-Encrypted: i=1; AJvYcCWYbjG4JzHCd9SR17Pd5wnHOLZla+ILY+cyr0v2VurhvT8/ieDCD16MfCXpW1sDHz6G5mKDSu2mp0MbtrcshMlfD9Mf4vn83XI=
X-Gm-Message-State: AOJu0Yz7e/eDHUFx7Xfgq8Dtnh0LVGl/sttbNdZQrTYjHzYwWN8n1rKx
	5cowfw7kqtHmaVhd4/Wh4H6d9mmd43Rxu3A1jUhHQxJ0/2kDl/WR
X-Google-Smtp-Source: AGHT+IH3mqH95Y+n0jPS0ubXivOMy+m2bQMOo8B1YAFH9/oRpMtx5FphQ0QoiPCBcJ7XKMhXh0m3iw==
X-Received: by 2002:a05:6512:118a:b0:52f:79f8:a445 with SMTP id 2adb3069b0e04-530b8d08afcmr3426899e87.8.1722860931157;
        Mon, 05 Aug 2024 05:28:51 -0700 (PDT)
Received: from [192.168.0.118] (h-185-57-5-67.na.cust.bahnhof.fi. [185.57.5.67])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-530bba2a0bbsm1107059e87.161.2024.08.05.05.28.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Aug 2024 05:28:50 -0700 (PDT)
Message-ID: <738dcd74-fe4d-4e49-900e-b7c1635bb798@gmail.com>
Date: Mon, 5 Aug 2024 15:28:47 +0300
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

The "compatible" property in the root of a device tree specifies the device
vendor, the device (board) model, as well as often the device SoC and family.
These are generally encoded as several strings, ordered from most to least
specific, each potentially containing multiple parts separated by commas.
E.g.:

    "ti,omap3-beagleboard", "ti,omap3450", "ti,omap3"

See more here, for example:

https://docs.kernel.org/devicetree/usage-model.html#platform-identification

Here's the (abbreviated) schema for the new "compatible" field, added to the
"test"'s "environment" object:

    "type": "array",
    "items": {
        "type": "string",
        "pattern": "^[^ ]+(,[^ ]+)*$"
    }

The particular regular expression is based on all I was able to find about
restrictions on the "compatible" values.

All of the above, of course, applies to systems using the device tree, only.
We will have to come up with something else for other systems (ACPI ID?), but
we can already benefit from "compatible", as it's relatively well-defined,
well-recognized, flexible, and the community is already looking after its
consistency and usefulness, so we won't have to come up with anything new
ourselves.

The database implementation for this would also let us correlate results on
more general levels than exact boards, e.g. SOCs, families, and vendors.

For the latter there's already an effort to document actual vendor names,
which would be useful in making dashboards nicer:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/vendor-prefixes.yaml

Don't hesitate to comment here, or in the PR!

Nick
