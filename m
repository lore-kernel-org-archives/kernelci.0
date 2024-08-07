Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20C131C3F22
	for <kernelci@lists.linux.dev>; Wed,  7 Aug 2024 10:46:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723027579; cv=none; b=nIAtVIncyDGvFByMAfvSmIu3tnvOF7rXLjihbz9uixKxSvj4sS2UO0jGEaq0iI0pgU2WKzt0Qgcr6cgnoCLu517OhiI1jdLTYfy90mlj0hyesyVmBTVYCs4RCnOMMu1SzgwAT6APWYr2SyUa2bixA3I88CjN1z96EsJAIkR6Edk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723027579; c=relaxed/simple;
	bh=lwp3eUg9YKt0/Rn1QNaXIePdpKXuW59Wnkwl0EjQHAQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bsa7O/B7ll/GfgzPlqhGpeggQ0/oDjKm3KuRLqIaS2AHOSefgzk6/s5c+DbyYsPna9NpN2hWbGpWj9vFw9ndykKgJAevaMxLFYhWlpQuycjRj2OoICKLHrfiNTp/4Aa8d4r3PR+wrjWfOkTBXIwRJepe7kf9odnqk/o/Rggq7ZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=HgqsZNJr; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HgqsZNJr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1723027577;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5aKmwKAI1e76hubiA0mFtvx+ywqLcn/qRlZXJZGjK6Q=;
	b=HgqsZNJroZeMBlAzqN2Gz7ww0k31sT0sxq5IRX+5b/bP4bLj3h0+20IyZ8pZYDnsc7uVPT
	sG9OQmHC0LuqA6UAUu9hEyGcJQUcV7qUwpDCgMTAdwOqr0wfv/H8CXwAd6vREEzB1xcvfi
	Mk8Kh1svgU/uuBf2S8ZOc7MNT0bukAg=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-662-wKLHFRPcMhCD3MoXdO8pLg-1; Wed, 07 Aug 2024 06:46:14 -0400
X-MC-Unique: wKLHFRPcMhCD3MoXdO8pLg-1
Received: by mail-lf1-f70.google.com with SMTP id 2adb3069b0e04-530db30018aso1070732e87.2
        for <kernelci@lists.linux.dev>; Wed, 07 Aug 2024 03:46:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723027573; x=1723632373;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5aKmwKAI1e76hubiA0mFtvx+ywqLcn/qRlZXJZGjK6Q=;
        b=HWELf2a5cthGV3WZqx2W/nsJAqbM6EuCejC4raxfLKOEx6UhXGUZSIj/hWuXVoEX4u
         AxKfwFGHFvU3m+Lh/9I4mSWh7Oj33HzQJ2ZW4/KATUk9yr17TNyfp7jSB20Dp+k0TWuf
         hEpiUkEkUf6ZZ8eRPMO7SqjjzaAmCs06PWg4K4kvxZRAcRbRsbTUVEoDT3z6Mnvrm69l
         SZfNbmyagdDVQaMgdDr3osTvmbL5CftcKj5N4FSV74T1B5PN0YNnm1oV0dEhXp4QdpJl
         OKvZms5MmiHDz+bJb8Ghbsfy9udejR6eGXQXT63wFfG9f15kT5guVA/hGIug+i8a8/rj
         7f7A==
X-Forwarded-Encrypted: i=1; AJvYcCU2qx9I9Yq5UZEWsdqZUPjBtpDlNmfaXQvnwDLa5Hftbgaj25+neZzr7eol97CXXt29iUhzK/PFXYRb0kOLwnfwDRwSXPp/fUI=
X-Gm-Message-State: AOJu0YyYFxDSMFTXXRwmSPGZwWN2H3lmh3CN1nBL7NR/Ga8o120xAmqR
	W6cV9KTdzpieNrvMNO2oSCBAO5GPwg5J7PmFNiHaYy5uf36yUDcpcMkSlGB4Gn82ZmJPtg9pfqy
	i0+ZFrR5WU5o7pMCJ11e9hZ5OKg19JZzxvImgOuJhiEys3AaXIyoS7CcB
X-Received: by 2002:a05:6512:3b8c:b0:52f:44b:7d42 with SMTP id 2adb3069b0e04-530bb3b4340mr12654888e87.58.1723027573255;
        Wed, 07 Aug 2024 03:46:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHLuIJyvmv4q9Fvxerg/s6IO242nQo+BSzbRjDgny2YM62QlE2GU7l2cFG3PvMfTl++JuZABg==
X-Received: by 2002:a05:6512:3b8c:b0:52f:44b:7d42 with SMTP id 2adb3069b0e04-530bb3b4340mr12654853e87.58.1723027572273;
        Wed, 07 Aug 2024 03:46:12 -0700 (PDT)
Received: from [192.168.0.118] (h-185-57-5-67.na.cust.bahnhof.fi. [185.57.5.67])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-530de466ec0sm203389e87.211.2024.08.07.03.46.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Aug 2024 03:46:11 -0700 (PDT)
Message-ID: <6ab97f79-b5b5-48b5-aaba-a1b592798f1e@redhat.com>
Date: Wed, 7 Aug 2024 13:46:10 +0300
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Automated-testing] KCIDB: Test schema enhancements
To: Mark Brown <broonie@kernel.org>, Nikolai Kondrashov <spbnick@gmail.com>
Cc: syzkaller <syzkaller@googlegroups.com>, Dmitry Vyukov
 <dvyukov@google.com>, Vishal Bhoj <vishal.bhoj@linaro.org>,
 Alice Ferrazzi <alicef@gentoo.org>,
 automated-testing@lists.yoctoproject.org,
 Cristian Marussi <cristian.marussi@arm.com>, Tim Bird <Tim.Bird@sony.com>,
 Johnson George <Johnson.George@microsoft.com>,
 Veronika Kabatova <vkabatov@redhat.com>,
 "kernelci@lists.linux.dev" <kernelci@lists.linux.dev>,
 Don Zickus <dzickus@redhat.com>, Philip Li <philip.li@intel.com>,
 Denys Fedoryshchenko <denys.f@collabora.com>,
 Michael Hofmann <mhofmann@redhat.com>,
 Tales da Aparecida <tdaapare@redhat.com>,
 Aditya Nagesh <adityanagesh@microsoft.com>,
 Jeny Dhruvit Sheth <jeny.sadadia@collabora.com>,
 Sachin Sant <sachinp@linux.ibm.com>, "Hambardzumyan, Minas" <minas@ti.com>
References: <5188d6fe-bd01-402b-a6e6-0fe57ef4d336@gmail.com>
 <738dcd74-fe4d-4e49-900e-b7c1635bb798@gmail.com>
 <49484f50-3506-4856-99a8-591b7ae29a44@gmail.com>
 <ab2e9692-f2b5-4b5f-8767-308c1a4d2771@sirena.org.uk>
From: Nikolai Kondrashov <Nikolai.Kondrashov@redhat.com>
In-Reply-To: <ab2e9692-f2b5-4b5f-8767-308c1a4d2771@sirena.org.uk>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 8/6/24 10:26 PM, Mark Brown wrote:
> On Tue, Aug 06, 2024 at 08:39:13PM +0300, Nikolai Kondrashov wrote:
>> On 8/5/24 3:28 PM, Nikolai Kondrashov wrote:
> 
>>> The "compatible" property in the root of a device tree specifies the device
>>> vendor, the device (board) model, as well as often the device SoC and family.
>>> These are generally encoded as several strings, ordered from most to least
>>> specific, each potentially containing multiple parts separated by commas.
>>> E.g.:
> 
>>>     "ti,omap3-beagleboard", "ti,omap3450", "ti,omap3"
> 
>> Just wanted to highlight, that we also need feedback on this. Thank you!
> 
> It looks good to me - I suspect it's just uncontroversial and everyone
> thinks it makes sense?  

I like this kind of feedback, yes :D Thanks, Mark!

Nick

