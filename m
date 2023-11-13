Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0CC92510C
	for <kernelci@lists.linux.dev>; Mon, 13 Nov 2023 21:43:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="BppqUqY3"
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-778927f2dd3so250825585a.2
        for <kernelci@lists.linux.dev>; Mon, 13 Nov 2023 13:43:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1699911793; x=1700516593; darn=lists.linux.dev;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KLyE4nP2VprXJXSsqoWE9ZKnPFB8OZ/fAZXNeJFXxrY=;
        b=BppqUqY3mPC6BAnoevo+usUMrOl599jFWSqEzcJ+VsX5JI/gQpZuh6socRLyBtJNh7
         CRn9Hk3/bMygGDu+3ro1nFaSygRxPmIcmYekt/ji0gchpT3JlvlJmamfTYOnsH9oX/4j
         DXXD0sBZTT2y22CAec/VaX8yrJVNaOF14wC7+5iIvI/wvGDhWGtdeFVdPpHGDKKZmKMy
         YxJuMv0lxllaq6zd3plcU9bgvbU1xeMTtWd05b+F5ALrnxKdLtdX3uvI9E7PJ0BQ09WU
         GIrRmZ+huLq9JV7dhIQGXfXGRenX5/T+eUukdd9FIpNUHOpAe4+CrZsTU6jSvLAA7G9v
         RvQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699911793; x=1700516593;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KLyE4nP2VprXJXSsqoWE9ZKnPFB8OZ/fAZXNeJFXxrY=;
        b=f2YdTBrcQ1uxGeMvNPQMgP9Jnp5Wob+4gpadXxZbXr0ooVRqarUAtXMI2E0vAAlwt+
         jZrZz8KuvWGD+EmlOtffztZARhps9OCX0fsIOb0VlS6A0Gg3e3pz+jxmxHLdz4HCoqcj
         T7GWCaGS8AzyDcafvgDnDCbdrX74FQnhs912Jjk4biQ73kaIJC+PNXLVVHBtQv2RdKDm
         DBDUZQrwxOfzJtWPFVqcltL1O9pGsYMqsJrfQf5xIdpLFzRXcz4aTLA5d1lLTBZ21ce3
         8D4UEL3ZBdZVJ7b78Ck9hhjfJYsnhvwZpgfurxOEglcwPW/vay8o+NZQXIr4o0zjW8BL
         QMow==
X-Gm-Message-State: AOJu0YxZ9CjaoP8cZZYo3BuVKDwT9u2jabKGwajxUVMGF0qoUTJ7p/wC
	BzeqadbVxI3bxK+x7bFMSKuqZapCjn2Jyz4z7yOLdA==
X-Google-Smtp-Source: AGHT+IGMuZ9rveuhTw4IlphxIx3T3MfeHsz8A252zrQ9pta+gSLJz3PGMoCVfsQFRUme3MVh0nzDow==
X-Received: by 2002:ad4:430a:0:b0:66d:12fe:207d with SMTP id c10-20020ad4430a000000b0066d12fe207dmr569205qvs.5.1699911793402;
        Mon, 13 Nov 2023 13:43:13 -0800 (PST)
Received: from [192.168.40.12] (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id b4-20020a0ce884000000b0066d04196c39sm2357494qvo.81.2023.11.13.13.43.13
        for <kernelci@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Nov 2023 13:43:13 -0800 (PST)
Message-ID: <7ee32af8-341f-429b-96c1-ca407cb17f0d@baylibre.com>
Date: Mon, 13 Nov 2023 16:43:12 -0500
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: kernelci@lists.linux.dev
From: Trevor Gamblin <tgamblin@baylibre.com>
Subject: KernelCI Local Instance docs have missing/outdated info
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hello,

While following https://kernelci.org/docs/api/local-instance/, I have 
run into an issue when trying to generate an admin API token:

[tgamblin@homunculus ~]$ curl -X 'POST' \
   'http://localhost:8001/latest/token' \
   -H 'accept: application/json' \
   -H 'Content-Type: application/x-www-form-urlencoded' \
   -d 'grant_type=&username=admin&password=hello&scope=admin users'
{"detail":"Not Found"}[tgamblin@homunculus ~]$

The previous steps to start the instance and confirm API availability 
work fine, but the "token" endpoint doesn't appear to be up, and I can't 
continue without it.

Is there a newer set of documentation that can be followed, or can 
someone point me at what I've missed?

Thanks,

- Trevor

