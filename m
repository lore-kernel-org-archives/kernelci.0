Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 341E03B407
	for <kernelci@lists.linux.dev>; Thu,  8 Jun 2023 16:17:31 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3063433fa66so622229f8f.3
        for <kernelci@lists.linux.dev>; Thu, 08 Jun 2023 09:17:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686241050; x=1688833050;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nB35z5xXHRfKHBI1iVJZ/QQYI6/W4ZWNtqh0uqHYCXQ=;
        b=NxkJpXGzFTxK0CRU/a0cGxt85hdHsSlX7On0Z9KP6OkxU6TfvG0CrL40vfUqNmw4dG
         jUNrHUnNdHpcLmAMzg5geuv3t6DvTsfQsbeqSaYmH+1lcMDjmbSa66DmcJH3G7t4P9ij
         FKtgN8om6zJMHJgjXOsxl3IvOg7iwSAlR6Q1TYgstPJedwsnUvZonKw/ZDt4RyMZAp15
         UHYTdgqK2UmCVc/p0gXnH4ruP6rfw4OXkK+mRFEcmcCaIunGUmSBJ8sXyiR+ZmpfNPjp
         kg4ebp1wWJoMCHX2M+xjDwm402F5cSMppfOHCVPj/A9jaBmnvTkV6u2uuFpbwQkuO09P
         Mftw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686241050; x=1688833050;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nB35z5xXHRfKHBI1iVJZ/QQYI6/W4ZWNtqh0uqHYCXQ=;
        b=Zi9sXYbIzIhWYlAVbtcletqvACK872czIH1NqKtkuQ9pt7SKZ0KNI3HNuSfN542UqN
         mV2qCXDBTmq0/ojPCX6/8+E9p/I/2FMkuxQ7VbVzxQhC2lOLQ3eI6SmaSaflq4LT5av+
         o1wgM20RxMHo5/VcJKlgCwikOSQfT/lFrs5773Tssowb2q+olAe6SlK7xD5rO2xvwA7w
         YAzOL4XmDubFlTmR2M/lYMKh14Xipnr+ZzuhzCVETkBy0M1oB2bYu2cqIHF+SKwTaFp0
         95YBsQSX2Mn0V8sFo9YWL3EHXaPXjiRnIVWcmIPWNostLNL45rYY1Yh7n4jDAD/4j5oz
         PkOw==
X-Gm-Message-State: AC+VfDyiCJ72DjIEePVbOJUPl+lQjuIGVAqmcntDB0uUJYrFFO6Hts8y
	wS/C3YN5YKzj73zOKrmXCzlim127pNvJXA==
X-Google-Smtp-Source: ACHHUZ7kkgWulvr/q9Burm6WhMwsUzEsEzWkcNekref8biRPxTD7uDXOEZ8C8gr7KMvqZsvCryumnw==
X-Received: by 2002:adf:fccf:0:b0:309:5068:9ebe with SMTP id f15-20020adffccf000000b0030950689ebemr6661610wrs.50.1686241050042;
        Thu, 08 Jun 2023 09:17:30 -0700 (PDT)
Received: from [192.168.0.118] (88-113-27-52.elisa-laajakaista.fi. [88.113.27.52])
        by smtp.gmail.com with ESMTPSA id m6-20020a5d6246000000b0030e52d4c1bcsm2023463wrv.71.2023.06.08.09.17.29
        for <kernelci@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Jun 2023 09:17:29 -0700 (PDT)
Message-ID: <0a839a1c-b0bf-aefc-8c50-0365fc941423@gmail.com>
Date: Thu, 8 Jun 2023 19:17:28 +0300
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-US
To: "kernelci@lists.linux.dev" <kernelci@lists.linux.dev>
From: Nikolai Kondrashov <spbnick@gmail.com>
Subject: What's general kernel CI like?
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi everyone,

I'm preparing a talk titled "Kernel CI - How Far Can It Go?", which I'll be
giving in a week at DevConf.cz and in three weeks at EOSS.

I'm trying to assess the current state of continuous integration in the
upstream development of the Linux kernel (such as it is) and have a couple
questions, answers to which can help me get a better picture.

1. Whoever sends their test results to upstream, have you ever looked at your
    code coverage numbers, that is percentage of lines covered? What was it
    like? Less than zero, single digits, double digits?

    I know it's a very rough estimation of actual useful coverage, but it's
    something we could measure and it can give an idea of the situation.

2. If you're a developer, or maintainer, what is your perceived latency for
    receiving test results from the various CI systems for your contributed
    code? And how reliably do you get those results?

    Is it within a few hours, a day, several days, more? Do you get results for
    100% of your contributions, 50%, 25%, 5%?

Thank you!
Nick
