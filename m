Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DA5D33ED
	for <kernelci@lists.linux.dev>; Thu,  9 Mar 2023 09:32:40 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id o11-20020a05600c4fcb00b003eb33ea29a8so795868wmq.1
        for <kernelci@lists.linux.dev>; Thu, 09 Mar 2023 01:32:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678354358;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/XdqRykafIgvY1X5jhaRl3CDDkwg5O1URaBfOHzmjgo=;
        b=hxuDEgUXY+iPQG/4kyca5aiIRh3nbiNBYnAZqmI53zKhtUQ10OIGl79qPZDS+RlH7O
         AO1z8dbogSlvFZXfwN3wJfhc/XsGY91nSokx87NQw4nKLvPi2+4y1+mZT9Spg8Jf7F8I
         cL/ZBmkx0BygxkuHaxo8aaDycopK2Qc7+5JdIHNJx17mi5Qjwrerl+cew/63iY7dFb98
         Mx/k6oxoao2xV3+7aCdm9l/6zHKXEN7u4hQac1CG/p+zG+ekM85r/G04sW7g9MPouxUl
         XPI8gQhxHvjM5nsWxkz10HQAPfgB+KxsQhEzBFjBD8rMMniho+nFhvwBgynE/F+PDKS4
         7JlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678354358;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/XdqRykafIgvY1X5jhaRl3CDDkwg5O1URaBfOHzmjgo=;
        b=7IiK5MQExoFWCYyrbpRg9Jt21WwMMBv0aN6o2BAHImKSH6wmJSkJP408Axrxk3PYm/
         pRC5KrfcnTvSlViS8CprEwtf+CrBOhJAGVy85c/oOlU84iAxtMX6ch3NUAlBoLOCbaS8
         YN6w5mkwtFI3Un2bBczSbjM3IyPS8qe02RWNpJOoiRbx2PazlSC7x2DwMQuROFYJOr+A
         imsOxqQheYZTdo/9Yh3kn8dvmmDINtb8nrm6C3x8oFnwvhcI7NinLGpYnr5ssbsR22jX
         p0EiaFJQPfmm3Sh4nxqkKOs4iVGjiv51JalHd3N46OqcQnikAR2aQECN2W2swDwXYIrn
         3DFw==
X-Gm-Message-State: AO0yUKUNPxpGUy7uemGb/BQLWBkEG6eAfRx+16dHa1hJHzXzGfYfs0f3
	PXbdcMfBSeAHU9uL8EvJpe8=
X-Google-Smtp-Source: AK7set8pE0n706QiI64C7va7H0tYzj0gCYZXmJdTDTvluUn9xcSTeRTQ6tBAWcPjXDmnwQ1WCCRgOQ==
X-Received: by 2002:a05:600c:4750:b0:3eb:395b:8b62 with SMTP id w16-20020a05600c475000b003eb395b8b62mr19657506wmo.39.1678354358231;
        Thu, 09 Mar 2023 01:32:38 -0800 (PST)
Received: from [192.168.0.118] (88-113-27-52.elisa-laajakaista.fi. [88.113.27.52])
        by smtp.gmail.com with ESMTPSA id d9-20020a05600c3ac900b003dc522dd25esm1929452wms.30.2023.03.09.01.32.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Mar 2023 01:32:37 -0800 (PST)
Message-ID: <050008a3-8deb-4815-10cd-5557fa4afde0@gmail.com>
Date: Thu, 9 Mar 2023 11:32:36 +0200
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: Introductory Message
Content-Language: en-US
To: Olofu Ojoachubione <olofuchubi@gmail.com>, kernelci@lists.linux.dev
References: <CAOHb_39iXN2YqLpXz7_kfcvZcFjchCVA0gBHgDZhV_2E6zuNnw@mail.gmail.com>
From: Nikolai Kondrashov <spbnick@gmail.com>
In-Reply-To: <CAOHb_39iXN2YqLpXz7_kfcvZcFjchCVA0gBHgDZhV_2E6zuNnw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/9/23 10:26, Olofu Ojoachubione wrote:
> Hello, I'm Chubi and I'm an outreachy applicant.
> I am happy and willing to contribute to this project.

Hi Chubi, and welcome to the project!

I just sent you an invite to our Slack. Please proceed to the #outreachy 
channel there with any questions you might have.

We still have one "good first issue" unassigned, which you could pick:

https://github.com/issues?q=is%3Aopen+is%3Aissue+archived%3Afalse+no%3Aassignee+repo%3Akernelci%2Fkcidb-io+repo%3Akernelci%2Fkcidb+label%3A%22good+first+issue%22

and I could create some more. Once you're done with one or more of these, you 
could move onto "good second issues", which would be harder:

https://github.com/issues?q=is%3Aopen+is%3Aissue+archived%3Afalse+no%3Aassignee+repo%3Akernelci%2Fkcidb-io+repo%3Akernelci%2Fkcidb+label%3A%22good+second+issue%22+

Have fun, and don't hesitate to ask questions!
Nick
