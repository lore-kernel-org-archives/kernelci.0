Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A74652FE1C
	for <kernelci@lists.linux.dev>; Thu, 16 Nov 2023 13:43:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lrxSs4Uj"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-6c34e87b571so727310b3a.3
        for <kernelci@lists.linux.dev>; Thu, 16 Nov 2023 05:43:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700142204; x=1700747004; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EqxTrnOujdy/nYz+c4pJkGoTHd351bDKHsXR781Nnak=;
        b=lrxSs4Uj2qOq9BwjxAAn/xRThidxkXocHHm70AGZfbtwtGs9sJxae/7S2FRvwaOwJv
         ODopdGrRh7S8D5IVxp84p+e40qaMaSNWsSbWZZC53PW4MrjSbatWTUGUb05oC8ATMjCZ
         YFS87TSVsfHHQfpXpF5j8st3MaORhva+lJ776TQT2hL62dqdpVAF+6w5vBi67W3c986R
         Kw+5iOSjBt3xbcAl/Dzo4AlVQFVUnDeaJhZacI11wUo3wtX8Z50ENUvvhX7rBR1bDy0N
         dY9hT8UH7DUP9kq85Wg2fYF8vF+92ENoliq5ne2b+hbv6Zjg3HcGQIcI0M8xpQK8glXN
         DS6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700142204; x=1700747004;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EqxTrnOujdy/nYz+c4pJkGoTHd351bDKHsXR781Nnak=;
        b=OF+wD8cxgjzhrk/TU9kambkXxWaJyhnSaN8TOeQPqZ353pTU8SO4V1stsGa1p4wUF0
         lCdpHlSMm4aqRIqbrib1rLgS4QopYb6kjpu3tJsrKsiS3jDHR2TIi7WffL8Yrlo2o2W0
         hCG3kLZnzcJLaVaHfNc+uhv0h+WnbHQu2oSXglaaRfKck5FUtstpxcnAv0XHmhSBRTIy
         4p5YLky+GxgMzeKNCXw4Vkgyij8N5wLqJorfijvF1KhWb7T4O6CCwm/CrMqhtnnGYrJZ
         QhyHSclrmvxLKbtQrwfIYru8B4uU0a5DDgPtBK4NtjRdxe85tiUhpwlYkk42UuFGm+Cr
         lFZA==
X-Gm-Message-State: AOJu0YzVWq3Tsy4NU/ojmJqOBG43Ub76elX5R65W3c/vYze8LxphzcXf
	wgdOyNBF8mnq9CT7fdFta/4=
X-Google-Smtp-Source: AGHT+IFWfUiIdUAuddWFdFYM8+CmBIlNqjS9jfS5sD1HpxVboDTNcs9BIeDE0HkK8N0x7Dp+7+mp0Q==
X-Received: by 2002:a17:902:bc84:b0:1c6:b83:4720 with SMTP id bb4-20020a170902bc8400b001c60b834720mr1919856plb.63.1700142203852;
        Thu, 16 Nov 2023 05:43:23 -0800 (PST)
Received: from [192.168.0.106] ([103.131.18.64])
        by smtp.gmail.com with ESMTPSA id 13-20020a170902c24d00b001c5fc291ef9sm9225411plg.209.2023.11.16.05.43.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Nov 2023 05:43:23 -0800 (PST)
Message-ID: <d7820a7a-4d30-4db8-9829-078eb6781454@gmail.com>
Date: Thu, 16 Nov 2023 20:43:17 +0700
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] MAINTAINERS: Introduce V: field for required tests
Content-Language: en-US
To: Nikolai Kondrashov <Nikolai.Kondrashov@redhat.com>,
 workflows@vger.kernel.org, Joe Perches <joe@perches.com>,
 Andy Whitcroft <apw@canonical.com>, Theodore Ts'o <tytso@mit.edu>,
 David Gow <davidgow@google.com>, Steven Rostedt <rostedt@goodmis.org>,
 Mark Brown <broonie@kernel.org>, Shuah Khan <skhan@linuxfoundation.org>,
 "Darrick J . Wong" <djwong@kernel.org>, Charles Han
 <hanchunchao@inspur.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Linux Kernel Unit Tests <kunit-dev@googlegroups.com>,
 Linux Kernel Self Tests <linux-kselftest@vger.kernel.org>,
 Veronika Kabatova <vkabatov@redhat.com>, CKI <cki-project@redhat.com>,
 kernelci@lists.linux.dev
References: <20231115175146.9848-1-Nikolai.Kondrashov@redhat.com>
 <20231115175146.9848-2-Nikolai.Kondrashov@redhat.com>
 <ZVYXEry40HTCis00@archie.me>
 <0f517de6-9eea-4641-a1dd-4631360fbe5f@redhat.com>
From: Bagas Sanjaya <bagasdotme@gmail.com>
In-Reply-To: <0f517de6-9eea-4641-a1dd-4631360fbe5f@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/16/23 20:41, Nikolai Kondrashov wrote:
> On 11/16/23 15:20, Bagas Sanjaya wrote:
>> On Wed, Nov 15, 2023 at 07:43:49PM +0200, Nikolai Kondrashov wrote:
>>> Make scripts/checkpatch.pl ensure any added V: fields reference
>>> documented test suites only, and output a warning if a change to a
>>> subsystem doesn't certify the required test suites were executed,
>>> if any.
>>>
>>> If the test suite description includes a "Command", then checkpatch.pl
>>> will output it as the one executing the suite. The command should run
>>> with only the kernel tree and the regular developer environment set up.
>>> But, at the same time, could simply output instructions for installing
>>> any extra dependencies (or pull some automatically). The idea is to
>>> get the developer into feedback loop quicker and easier, so they have
>>> something to run and iterate on, even if it involves installing some
>>> more stuff first. Therefore it's a good idea to add such wrappers to the
>>> kernel tree proper and refer to them from the tests.rst.
>>
>> Does it also apply to trivial patches (e.g. spelling or checkpatch fixes
>> as seen on drivers/staging/)?
> 
> Do you mean, will checkpatch.pl suggest executing test suites for
> trivial patches as well? If so, then yes, of course. These are
> inevitable victims of such mechanisms in general, and it's hard to make
> an exception for them, but we have to consider the overall benefit of
> having more uniform testing vs. making trivial changes a bit more
> difficult.
> 

Yes, that's what I mean. Thanks anyway.

-- 
An old man doll... just what I always wanted! - Clara

