Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4514F16F831
	for <kernelci@lists.linux.dev>; Fri, 16 Aug 2024 10:03:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723802588; cv=none; b=MeeYUjFLybdCBkTWP6OwKCoMTo/t8ODYeyf5e2oiR30gYLjmiaR4XBwggvwHKzLCTjqIQ8pXzlb0xQGiqiTITlZos6iOEP0aLPPa+i5oAt3IxFY6l9tNeMFbgQaZXbgC9Jp1pxg3j4NwfrIoxVa5pqBDkIli0fX8/BdG9bIp+TA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723802588; c=relaxed/simple;
	bh=sPv6FCylmouH+KJpCfYE4tkxj24ddaQ0XNoeeunfflo=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=BYlWF9jOCWbbyqPpUP5qGHeTfV+kQaOglMFffs96jdPsU8D4R8xTTUoN7vMohYcWb+Zdwd+t+8LlGXR8cv3jHr1kbUAKyY84uNPNdzbgk4+kfxHoC5BkcMdcewyQwBt/J8a6J2BNY5n+CbpYyHKQJBCWQ7E788B1dhUS5TMeelo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xc6y4PXI; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xc6y4PXI"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-429d2d7be1eso9237345e9.1
        for <kernelci@lists.linux.dev>; Fri, 16 Aug 2024 03:03:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723802584; x=1724407384; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :to:from:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dU0mWCdyi5+1z+HysLTtoOSd3u/ktS2zZMbmuobddMY=;
        b=Xc6y4PXI5EssSdNOaEWRl79DkfNf0ekuViRSgKZxpSIyEet2mExCcGQvNp3zMlqnBR
         3GKPmHTjRp7p4xNcIdEp27f73zUM9a3cZfwMvlY4EmK4RmwNlJtaQeQHYXtg8oAXpXED
         MZZCSfKsFdGSrb6Vm5zgdRxxIQvUGL2YaXepCh79Ikr87H5NkdS2trICfZ9NfyDK1nII
         6uyLaWFHyBD7DM49WDNSHrCOJE41aBgcdxeCDcS5kYIvwY1i2dmqd9ngJGVEbQXatElx
         yJ7xjqwHbIZRqbKBQWPAl6SD9QZouqSrouGlCmb1C/r6c4ao5riRA7tTrIJo8U70SAcc
         8qtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723802584; x=1724407384;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dU0mWCdyi5+1z+HysLTtoOSd3u/ktS2zZMbmuobddMY=;
        b=p1R48KCg0mdyHxmzbkCmajlP17MlMvaKRm6rx7knRRyL4qOYKnAKa0f/i3hzZEDa91
         KnrkgxYaEPWAjmV4MS481RvagB5iAfnQX1U5BF7PjJRJLFyJvg8TALVtYNS/rmSewQG0
         hI1JwKT+F/u63mYyvv/S3cGaDMkzpDmYNIFJDNkwauba5BahYQBtcXlpUt+YfYgGLPAI
         DXpCVT6tC0w0ovnogyW1c0+4YV9xouzdwdaxodJ49AF4zsd5LOHZMnJ0w3rhyeLjY2Jc
         hZwOIVay9FPvVQvSPiQhMM68FsszSkpBje2gHbcoBw0lwOQyVSbf5kkcU24wfe7fk9YX
         COsQ==
X-Forwarded-Encrypted: i=1; AJvYcCXU3s3EMs1waUEKVtN83lOAJ4c8rifbbfyx2XlPG4i8iFiCDaylbqOC4z9pqKkWV2Dgba/+z8XnHjJKWgNlOeyes/Q7GEvDCqE=
X-Gm-Message-State: AOJu0Yz/fBj70N/eQVC6tKtT9XvIh+0dVf7WpS9sbnvumKgg3dNP6l/D
	nU0+JHLiQGh6BQmLATP3wkBFGinOULNbYtDtXLhDIOd6Ik+dhHwR
X-Google-Smtp-Source: AGHT+IEIUxTAiDzBh0/TZeVf2Vmc3HvHluDQ+AcEvv8/31lu2kgatIVOgZocAea5oDBy7GOw1Ems4Q==
X-Received: by 2002:a05:600c:3505:b0:428:29e:67cc with SMTP id 5b1f17b1804b1-429ed9f8c74mr16468425e9.10.1723802584025;
        Fri, 16 Aug 2024 03:03:04 -0700 (PDT)
Received: from [192.168.0.118] (h-185-57-5-67.na.cust.bahnhof.fi. [185.57.5.67])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-429ded71ee3sm71292805e9.29.2024.08.16.03.03.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Aug 2024 03:03:03 -0700 (PDT)
Message-ID: <c66e960b-0a43-45fd-8220-82a91b0b8523@gmail.com>
Date: Fri, 16 Aug 2024 13:03:01 +0300
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Automated-testing] KCIDB: Support non-binary test outputs V2
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
 <bf0befaa-e23e-43f0-996b-d095b7390122@gmail.com>
Content-Language: en-US
In-Reply-To: <bf0befaa-e23e-43f0-996b-d095b7390122@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 8/5/24 2:28 PM, Nikolai Kondrashov wrote:
>> I'll follow up with a separate message for each of the changes, going over the
>> details and the rationale.
> 
> The support for non-binary test outputs introduces a new field to the "test"
> objects called "value", being an "object" itself. It (and its abstract
> meaning) are supposed to work together with the "status" field. That is, it
> should only be considered when the test has actually executed. I.e. with a
> "FAIL", "ERROR", "PASS", or "DONE" status only. Normally "DONE" should be
> used, when the value is the test's output, and not an auxiliary value.

Alright, I redid support for non-binary test outputs:

https://github.com/kernelci/kcidb-io/pull/85/commits/040a20db407f2592c28c3797cec9e4118221af9c

First, I dropped support for all the different types, and left only the
(signed) integer, requiring the receiving system to allocate at least 64 bits
to it. That integer is the only required field for the numeric output.

I also added the 10-based "exponent" field, to support "floating point"
numbers, although I suspect we would prefer fixed-point numbers (consistent
exponent) instead, as that makes the queries easier, at least for the start.

Then there's the "unit" field, which is just a string, and if "exponent" is
specified, then the "unit" is assumed to not contain any prefixes, and they
are generated on display, with the value appropriately scaled (that SQL
function will be interesting to write).

Finally, there's the "binary" field, and if it's true, then a binary prefix is
generated instead. That is, Ki, Mi, Gi, and so on. Naturally it's only
considered when both "exponent" and "unit" are specified.

Here's the abbreviated schema:

    "number": {
        "type": "object",
        "properties": {
            "value":    {"type": "integer"},
            "unit":     {"type": "string"},
            "exponent": {"type": "integer"},
            "binary":   {"type": "boolean"}
        },
        "required": ["value"],
        "additionalProperties": False
    }

The commit linked above has docs and examples. I'll reproduce the latter here
in shorter form:

    "value": 42,
    # Display: 42

    "value": 314159,
    "exponent": -5,
    # Display: 3.14159

    "value": 720,
    "unit": "KB",
    # Display: 720 KB

    "value": 160,
    "unit": "s",
    "exponent": -9,
    # Display: 160 ns

    "value": 512,
    "unit": "B",
    "exponent": 3,
    "binary": True,
    # Display: 500 KiB

Tell me what you think, especially Tim, and Mark!

Thank you.
Nick
