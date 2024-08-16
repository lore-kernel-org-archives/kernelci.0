Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97ADB1BD015
	for <kernelci@lists.linux.dev>; Fri, 16 Aug 2024 14:05:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723817142; cv=none; b=o6S2F/dO8W42XjpCEmXlIQhlxO6BZZdFmQdZHOFgXtIfXa2FnPZBpRaDCbFNRXv1fvwjsdKB++L602WvA7LwOzwHXVhbImJY931YMvHgXiRF+AF0jVKfOH+dZapou0XwZj8fOQY17GXo7roKWq8IqO1w1VP8FbR68TRU9P8Z+BE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723817142; c=relaxed/simple;
	bh=zDTx6MGqJXqA3G5lS4oI6CUe8Hs9Q+LMnbKECRPCKM8=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=kWn85JTxir8vQqz3O688H7CLiBuDe8XP4/24HSLyjQSphDdpWgNneEtjncQOofHDaBg3nn6GmutBHwxQ3YRzEEJ5SOG90HAR0dfZvV+axCQSPhwQwIU+LCTi8hWPJwKqykmtjRcbiCQD8zKUDENkvSZhAI+klxMQH4cva9thWAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WuW24rXL; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WuW24rXL"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-42819654737so14103205e9.1
        for <kernelci@lists.linux.dev>; Fri, 16 Aug 2024 07:05:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723817139; x=1724421939; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :to:from:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LdBOIrzl9sQfk/jIK6NRshh+8bju8iOmTMbvpoMEflk=;
        b=WuW24rXLNEvflYgEJmFzKbxiaSYjwXeLU/NEfm6wsFnvD3gik3KDywiepIm9yfAroB
         XTxtkF42zOdmQveB3zd7aOBEZaQwI63vwYt/OKB5V7IL2cZisTtoFOL+Ld5FvLpSiyNf
         i8hDqZL5HvJFPcZ09JrbKe+pK9TK4sAr2Bmk+Dg6lPXTit5dCrdMLq/d5uvV4A1GT4oe
         Yy1sOqt4GDOcUhZ7l89rKS9pt5W0YUynm3p2ayB8gIn8PpcBEjyGqyKiqfYetYlFGvH7
         4asSr7Jtj4NM0ce7pEGMMbBu+c1aJdAMZRUe09M7psqvX/kLnekJQYtqZ1V3IXIGmU3J
         t/lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723817139; x=1724421939;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LdBOIrzl9sQfk/jIK6NRshh+8bju8iOmTMbvpoMEflk=;
        b=jYnEed03uO3zfGqQ1f5tZ46SF6xtRepdviUM2JAJJZTcC4pKUMi1X5KTgjpuqKHqgK
         /kZRywdT3vmC5R0qDYUo+Zzq8nXHbTwRAQMWq0SJ21IuJBaIPTGXHKi7wMFBY4qSc48X
         kbaeqAxa+7laI4rrVNBSFw/I/XUZrI4Q1C+MHuYkVCSjTNE9DeL8/rnNdHX9lTNjjLbN
         YTSzQqo8i2A7Vf5CtdduHHldWPvcxb5rVWhN4Zmtr1V4cx6QvL6e3dEZmab5KGhJ8IAh
         F/5gA5bO6UaQ3prdzF0wzAyjE//sXOdL0XoV6wFY1jYzBQPxgJ2g1XXcLtXCo4BbBT6Z
         JcKw==
X-Forwarded-Encrypted: i=1; AJvYcCWKGCehQX7CsrTpv3OXuIYqASNibq9EyXwJ8gvuis4QB7Id7EA2EcfxjUTfWS9UUX+S9pHtoCtMEw/c/cVDu373fNewLa6b3CI=
X-Gm-Message-State: AOJu0YyBqK53XoYhNxbiec8tQuyzelsVj+B8//t0gj9Lvg55Z8kNeuIO
	ueRLAVjDDo934JqaoyibGdS/y38x710UhZu8beAUzldtuF1H2gqrxAgPZcQ5mng=
X-Google-Smtp-Source: AGHT+IEiJFqUGasqs1gLjFocRVJY6LhvOQ7Ug2K4DVsCvXX1XpoM89crpsfa8bPRNIzg80FPMrT6/Q==
X-Received: by 2002:a05:600c:1988:b0:426:616e:db8d with SMTP id 5b1f17b1804b1-429ed79e773mr17775235e9.15.1723817138583;
        Fri, 16 Aug 2024 07:05:38 -0700 (PDT)
Received: from [192.168.0.118] (h-185-57-5-67.na.cust.bahnhof.fi. [185.57.5.67])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-429ed650e41sm23406165e9.19.2024.08.16.07.05.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Aug 2024 07:05:38 -0700 (PDT)
Message-ID: <944bf5c2-6914-4c28-86d9-6dbbab450363@gmail.com>
Date: Fri, 16 Aug 2024 17:05:36 +0300
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Automated-testing] KCIDB: Support non-binary test outputs V3
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
 <c66e960b-0a43-45fd-8220-82a91b0b8523@gmail.com>
Content-Language: en-US
In-Reply-To: <c66e960b-0a43-45fd-8220-82a91b0b8523@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 8/16/24 1:03 PM, Nikolai Kondrashov wrote:
> On 8/5/24 2:28 PM, Nikolai Kondrashov wrote:
>>> I'll follow up with a separate message for each of the changes, going over the
>>> details and the rationale.
>>
>> The support for non-binary test outputs introduces a new field to the "test"
>> objects called "value", being an "object" itself. It (and its abstract
>> meaning) are supposed to work together with the "status" field. That is, it
>> should only be considered when the test has actually executed. I.e. with a
>> "FAIL", "ERROR", "PASS", or "DONE" status only. Normally "DONE" should be
>> used, when the value is the test's output, and not an auxiliary value.
> 
> Alright, I redid support for non-binary test outputs:
> 
> https://github.com/kernelci/kcidb-io/pull/85/commits/040a20db407f2592c28c3797cec9e4118221af9c

Aaand, redone again:

https://github.com/kernelci/kcidb-io/pull/85/commits/86b75f6bf6e4f74e594a301382f2b77cfe4cbbd9

I switched the value from integer to floating-point, as that allows us to get
rid of the exponent field, at the cost of a small accuracy loss. The storage
requirements are still 64 bits.

These values are intended for analysis and tracking first of all, and small
inaccuracy would have little effect on them. If you want to store the exact
measured value, you can put it into the "misc" field.

OTOH, this makes it much easier and faster to run queries on the values.

Here's the new (abbreviated schema):

    "number": {
        "type": "object",
        "properties": {
            "value": {"type": "number"},
            "unit": {"type": "string"},
            "prefix": {
                "type": "string",
                "enum": ["metric", "binary"],
            },
        },
        "required": ["value"],
        "additionalProperties": False,
    }

And the rewritten examples:

    "value": 42,
    # Display: 42

    "value": 3.14159,
    # Display: 3.14159

    "value": 720,
    "unit": "KB",
    # Display: 720 KB

    "value": 145000,
    "prefix": "metric"
    # Display: 145 K

    "value": 1.6e-7,
    "unit": "s",
    "prefix": "metric",
    # Display: 160 ns

    "value": 5.12e5,
    "unit": "B",
    "prefix": "binary",
    # Display: 500 KiB

Send comments!
Thank you.
Nick
