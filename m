Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 521B344C67
	for <kernelci@lists.linux.dev>; Tue, 28 Nov 2023 21:34:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="JrLs1dP/"
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-58d521f12ebso2296850eaf.2
        for <kernelci@lists.linux.dev>; Tue, 28 Nov 2023 13:34:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1701207292; x=1701812092; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ihcRsJVfXn/hFvJX6im4GsYJsFIm1qPB9DwXHfMEgPI=;
        b=JrLs1dP/iDt14Bf9w4tCF/j1ZGyTLeAkUMPMFnPuGAm8d+gw4a6Ql1E2izkqxBRCNL
         BMpb+EDkx50oiETFkP90c1rWjGIwjXocE6I3fTltEy/ChkcGawFDXMvkGq7vW9rkEhQx
         FLaVyWF9yrZGT6N8hp9YhKSNRFbJCy0Bd/jzbWlZljgwB//ksSBZorvHXiXiBaPvxt61
         TZlS93jdim1CSIDD4OUCGLeBEeTxi0xZShRQSP6iI2my/LXyJE76vijsVYzMbOrX8p5n
         tY9MZzTzB9OHQryYcDsUF04eJLeF7Qs2F785N2euaKJUXEXjJG4QDH3sVbtKzTmilt9j
         eRWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701207292; x=1701812092;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ihcRsJVfXn/hFvJX6im4GsYJsFIm1qPB9DwXHfMEgPI=;
        b=ac/FRZTMnilv2a27PFMsgxRpoU1pCyngW+7B+k1gPTlR7lwJ/S8jtsyqTs9H7vvk0V
         YHWrXftL7a2y7vYK8+YDBPRIkerE0CIqYqn6EMTfdQI3x2AYHy+hnqgD974ddUpclWkV
         QUiiNVwa0ukgyQLFsl82yGNMnhzRA55X2vSSW0LsltBBzWvJ6LSF75jSjYgabPPqESql
         xt5NkC0YCiDvUXsCAFaOLJFMO2dc2UrNHTitYIQg6Sswmk9s+VLtWPcNoecMOp7x2irZ
         R882dd8Z09dR78/dApEfWcXus/NNOwWirrvFtXw6z32AZQdl71nx54Qre6oNAoh0kUjq
         EsUg==
X-Gm-Message-State: AOJu0YylEfN8hgh84+55lTNZRVRkRlMW23GtOCK7TnT5ljk68Vo0h9mT
	e3sXxqSScWescwvvweyUH+iNeg==
X-Google-Smtp-Source: AGHT+IHosCtnSOkBEespo9S+IOuKQ4xI1rVw06cDD3voEKUuhwR1LuNKGnfqrhZ8aGkMvXUmmbrOHA==
X-Received: by 2002:a05:6358:4194:b0:16b:fbd6:9bab with SMTP id w20-20020a056358419400b0016bfbd69babmr17522296rwc.32.1701207292050;
        Tue, 28 Nov 2023 13:34:52 -0800 (PST)
Received: from [192.168.40.12] (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id lf5-20020a0562142cc500b0067a6392a323sm436908qvb.133.2023.11.28.13.34.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Nov 2023 13:34:51 -0800 (PST)
Message-ID: <b281cbba-8013-4701-9352-a176f4e692fc@baylibre.com>
Date: Tue, 28 Nov 2023 16:34:50 -0500
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: KernelCI Local Instance docs have missing/outdated info
Content-Language: en-US
To: Jeny Sheth <jeny.sadadia@collabora.com>
Cc: kernelci@lists.linux.dev
References: <7ee32af8-341f-429b-96c1-ca407cb17f0d@baylibre.com>
 <9820b359-cfc0-45b6-9edc-722b50e533c7@collabora.com>
From: Trevor Gamblin <tgamblin@baylibre.com>
In-Reply-To: <9820b359-cfc0-45b6-9edc-722b50e533c7@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 2023-11-27 23:43, Jeny Sheth wrote:
> Hello Trevor,
>
> Thanks for reporting the issue. Due to recent API updates on user 
> management side, a few endpoints have been redesigned and renamed. 
> Endpoint to get access tokens has been renamed to `/user/login`.
>
> We have updated documentation accordingly and updates have been 
> rolled-out to https://kernelci.org/docs/api. You can continue 
> referring to the same link. Sorry for the hurdles you had to face.

Hi Jeny,

Thanks for the update! I've got it running now.

- Trevor
>
> Thank you, Jeny
>
>
> On 14/11/23 3:13 am, Trevor Gamblin wrote:
>> Hello,
>>
>> While following https://kernelci.org/docs/api/local-instance/, I have 
>> run into an issue when trying to generate an admin API token:
>>
>> [tgamblin@homunculus ~]$ curl -X 'POST' \
>>   'http://localhost:8001/latest/token' \
>>   -H 'accept: application/json' \
>>   -H 'Content-Type: application/x-www-form-urlencoded' \
>>   -d 'grant_type=&username=admin&password=hello&scope=admin users'
>> {"detail":"Not Found"}[tgamblin@homunculus ~]$
>>
>> The previous steps to start the instance and confirm API availability 
>> work fine, but the "token" endpoint doesn't appear to be up, and I 
>> can't continue without it.
>>
>> Is there a newer set of documentation that can be followed, or can 
>> someone point me at what I've missed?
>>
>> Thanks,
>>
>> - Trevor
>>
>>
