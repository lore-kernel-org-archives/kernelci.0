Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 502A04C62E
	for <kernelci@lists.linux.dev>; Tue,  6 Aug 2024 17:39:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722965958; cv=none; b=lNiyyyxAhfCAncHkKjdwLisLbzUBo0YAozpKYd633dd8y4lNT+qhR4gnCrGSn0/MgPUZCtdHZpOY5nXSQUfnKA69Hplhu7qMYQ9WvSl1n11EOLee2VQOiXaEUcMjCbsQKtI9PIOgXQ8xE3h5S74121F6iF6GWqKe561e9uU7buY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722965958; c=relaxed/simple;
	bh=rI0DtsycBEpCB55fqDf7afGlJl7lzp5U2HUkuzlvZUI=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=O+nRBkjFPVwRIjCkY87kZf28wcKRlJbDCj6kkiD1JE7ra9++3908Dt2CD3uC+E2RmSOugGHh4ukwvH2fK8E9hvqn3D7aMpYWwBCs6mSICjm+xigdpX/v84DA4zb9SSPsyrjDOckPzRQKjVkYzVDXSzkJcFeEeYxmcPdcf8WiIC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l7INaHwM; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l7INaHwM"
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2f029e9c9cfso13940711fa.2
        for <kernelci@lists.linux.dev>; Tue, 06 Aug 2024 10:39:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722965955; x=1723570755; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :to:from:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Hx+2wvcmNCIPaEe1UHXSFtNPc3KF+R1O+D+ujGC6Xe4=;
        b=l7INaHwMOdDXWc/5DKmLmSLnGLOaHdjHCMYkSMFYOAomVtkkdqbrlVl+tEGTO8ePdD
         /ewBCYVPHFCMQo7efj7jL3SMYFJbq/JqnBmphLb/BqtkUeQMRm0YLlBpU0nnzVPAoFBm
         ORhOZ3/EdTgR8+TU0K5P+oXkrdFsKEWsiZ9+REu34y1fjSdx1vKPoCN3hQ0BMA1jcZoE
         25eYEivNzFklmwCZAyQ15Mmw2/08oU4gewQBFApu88GjDltjQiJpDkIidASBlGSP5+h0
         ItFByBYt4brJSObFMQNMdzefWymu/uZdpSqlqVqKlS8SGDnFsIaCS3aHfxZ+/OOxi2k/
         DOLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722965955; x=1723570755;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Hx+2wvcmNCIPaEe1UHXSFtNPc3KF+R1O+D+ujGC6Xe4=;
        b=aawbMtxdgYegFTWQiaZKJHKJQ3WPv63Rc+dq7sJsZ4r2/gIDmRMK2E2JMRUBaqpnCE
         KTYR9kAV5N/dc3e9/NrPbY7mLYkBtZLUFwA7IWM5HLgDsQUu5/K7fYnh9kUPe6q/o2UL
         LmlOZM3QrcVKpdWzRR3jQ7v6avrODBhEInk+eOjJ+e8o9/h9CwS3DkzhuFeyEVjnDWIv
         /26XCUlkximzK7F1vv3DEsoDq1tDLzYFtK3tBy1aPDB4wleIeSe49g088bp40t/1gwxO
         emYxcPtTd2OU+adsFQgBq5CgtfztYMS3AKt6qORkC5AM901P3NQqzS+SSFL00mloepuZ
         L22Q==
X-Forwarded-Encrypted: i=1; AJvYcCXIGjYs0dUgLfbRspa36zdPM35iouzekqgt0Qq2YeLibmPgkjsYvBmywRcjUkLSPc7AmtbMtk1icc8odSJofLm2P8sdztsNosI=
X-Gm-Message-State: AOJu0YwsU8vZFlPGpL0J2yHYm5Mp3QWOZy7LZXMagS6AfRtkF8mLhifY
	lBeQpXDbmMny1QNKhDZ3km83PFU5x+mllQcxXiMpU35b8XQN7UZd
X-Google-Smtp-Source: AGHT+IFT6pXpgyYc10ruPcf4qXEPUCEDJoPPbj/XajTnpzARk9CtoO81Wub8qsVADkmIoJMmlc97gQ==
X-Received: by 2002:a2e:8549:0:b0:2ef:26f2:d3ec with SMTP id 38308e7fff4ca-2f15aaaac72mr125829251fa.12.1722965954900;
        Tue, 06 Aug 2024 10:39:14 -0700 (PDT)
Received: from [192.168.0.118] (h-185-57-5-67.na.cust.bahnhof.fi. [185.57.5.67])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2f15e25092bsm15227011fa.77.2024.08.06.10.39.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Aug 2024 10:39:14 -0700 (PDT)
Message-ID: <49484f50-3506-4856-99a8-591b7ae29a44@gmail.com>
Date: Tue, 6 Aug 2024 20:39:13 +0300
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Automated-testing] KCIDB: Test schema enhancements
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
 <738dcd74-fe4d-4e49-900e-b7c1635bb798@gmail.com>
Content-Language: en-US
In-Reply-To: <738dcd74-fe4d-4e49-900e-b7c1635bb798@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 8/5/24 3:28 PM, Nikolai Kondrashov wrote:
> On 8/5/24 12:56 PM, Nikolai Kondrashov wrote:
>> Meanwhile I'd like to propose two small, but potentially very useful changes
>> to the I/O schema for tests:
>>
>> * Supporting non-binary outputs beyond PASS/FAIL -
>>   integers/floats/booleans/strings/etc. - useful for performance tests.
>>
>> * Supporting recording `compatible` values from the top of the device tree
>>   inside the test environment, for machines which use them - useful for
>>   correlating test results by hardware.
>>
>> Here's the corresponding schema PR:
>>
>>     https://github.com/kernelci/kcidb-io/pull/85
>>
>> I'll follow up with a separate message for each of the changes, going over the
>> details and the rationale.
> 
> The "compatible" property in the root of a device tree specifies the device
> vendor, the device (board) model, as well as often the device SoC and family.
> These are generally encoded as several strings, ordered from most to least
> specific, each potentially containing multiple parts separated by commas.
> E.g.:
> 
>     "ti,omap3-beagleboard", "ti,omap3450", "ti,omap3"

Just wanted to highlight, that we also need feedback on this. Thank you!

Nick

