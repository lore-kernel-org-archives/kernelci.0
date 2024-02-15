Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E56F13667A
	for <kernelci@lists.linux.dev>; Thu, 15 Feb 2024 17:38:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708018692; cv=none; b=ft3NfElzU/92xleQ3evkPVKChdHr1wfObVfWSioBLew7sOINkOq93UwCaimXdnwX0XZF6OZWSlLEyEk+bSj5kPXsKjid9ygejDKF2mcYEoT+362Jkr0H2KdwnCkbzEwtxgtMZpGAtPPuM5Jgaj5TsD7ygSEuegIa0bRzWJu2Bi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708018692; c=relaxed/simple;
	bh=CmA2yNqbhHxRJP/sPUsviXqi+eveftIcv605DlHS1OE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Mrs5EOclPIDCXzayQbCagGgCjVO5dY/YTFWVIl7U7rjEN7Yf4+wlzFTe/UGeSfhLM6CKHn99spMWCOiJkhzZqKNek3U5xgBKAH705mfNdLRUbOW5CA+Al87cfqDIlvHFd4+m6xLcAPtxWU+wxgU7wfdfbXZntgLd8BFxDquUsiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=dMdkAoSQ; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="dMdkAoSQ"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-5dbcfa0eb5dso1047527a12.3
        for <kernelci@lists.linux.dev>; Thu, 15 Feb 2024 09:38:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1708018689; x=1708623489; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WKujQBQrVUJjXR80iuACMbDhu6cNiLpIU8q///YY7rg=;
        b=dMdkAoSQ1WrmVN0TEQOgERkWmY/bSIW9Ouflcztvh49K+sW8WmK+CEBKPFlaHdgYRw
         iKBQhPx3/s1RzjIC6O/UXLMaAkxVXXcE1Z77q3Eg7FR2n3/OrZQvnv/774dm7Hy2drhm
         eK6ztThjuGwyZAaPAR9dQp4mCYSZdw0ugtwtE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708018689; x=1708623489;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WKujQBQrVUJjXR80iuACMbDhu6cNiLpIU8q///YY7rg=;
        b=kuixOPH4eNHuMncx8nPwqOJv9uBvl9mWXBiTbLrOVyvJocop9jPHw7RZZ2UoZRafON
         DTHk2akTenG5O8vbn1VicRkU5gC17AbpmoWTYXyvOTAfcRaIAEOnJgL1WOi0nZCe72kQ
         mCbaOwFZveLGpw6ojJ4s8Rc1zu1AGpNmX6582geLZqQQLO3lizPEuzbVKBKSKB0wJ1Tq
         2tvSkhiwXNQ050KXszlX0+rZWmmCYs3zpMTME/N9y352h2g4wzpsAd3cnBOup+rPdFWQ
         qWbHHUTd150CN4RkSJSgVeiauJWtO26QqI0/DaXOSoyNlOIR+BWAmQQmywQ6QYnlpTUy
         Bi/Q==
X-Forwarded-Encrypted: i=1; AJvYcCUCMG77uPLEIrLlFlOyRLA1QY9yO9noZhBRZ0Y1SLAOsglkltAxODJa2bt+naZeuhTqzTRR+aSk+cVlR8/FYDdDfg8Jze5NzwM=
X-Gm-Message-State: AOJu0Yz9cKYJH/CGP5N0pKrEts5zw44dMBqWuB7xlcFzczUmcRNe3UvI
	3mPDK0VQHe8dAr4Q3RLnkIeeAMrOV68VDitSxNDNQOl0BZ+V1iCAd2Q/NNmYHg==
X-Google-Smtp-Source: AGHT+IEmUMsadd1ltbUlWE409OqLhKhvGNE10Bn2f8xDtB+k6aT9AM3aTWrJUCSsRXb5eYsZq3jeBA==
X-Received: by 2002:a05:6a20:d90c:b0:1a0:841a:64c3 with SMTP id jd12-20020a056a20d90c00b001a0841a64c3mr928295pzb.39.1708018689482;
        Thu, 15 Feb 2024 09:38:09 -0800 (PST)
Received: from www.outflux.net ([198.0.35.241])
        by smtp.gmail.com with ESMTPSA id e4-20020aa79804000000b006e02da39dbcsm1665651pfl.10.2024.02.15.09.38.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Feb 2024 09:38:09 -0800 (PST)
Date: Thu, 15 Feb 2024 09:38:08 -0800
From: Kees Cook <keescook@chromium.org>
To: Rae Moar <rmoar@google.com>
Cc: frowand.list@gmail.com, davidgow@google.com, Tim.Bird@sony.com,
	shuah@kernel.org, brendanhiggins@google.com, dlatypov@google.com,
	tytso@google.com, gustavo.padovan@collabora.com,
	ricardo.canuelo@collabora.com, corbet@lwn.net,
	kernelci@lists.linux.dev, linux-kselftest@vger.kernel.org,
	kunit-dev@googlegroups.com, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [KTAP V2 PATCH v3] ktap_v2: add test metadata
Message-ID: <202402150937.3CAD9E69D5@keescook>
References: <20240215171859.1907668-1-rmoar@google.com>
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240215171859.1907668-1-rmoar@google.com>

On Thu, Feb 15, 2024 at 05:18:59PM +0000, Rae Moar wrote:
> Add specification for test metadata to the KTAP v2 spec.
> 
> KTAP v1 only specifies the output format of very basic test information:
> test result and test name. Any additional test information either gets
> added to general diagnostic data or is not included in the output at all.
> 
> The purpose of KTAP metadata is to create a framework to include and
> easily identify additional important test information in KTAP.
> 
> KTAP metadata could include any test information that is pertinent for
> user interaction before or after the running of the test. For example,
> the test file path or the test speed.
> 
> Since this includes a large variety of information, this specification
> will recognize notable types of KTAP metadata to ensure consistent format
> across test frameworks. See the full list of types in the specification.
> 
> Example of KTAP Metadata:
> 
>  KTAP version 2
>  #:ktap_test: main
>  #:ktap_arch: uml
>  1..1
>      KTAP version 2
>      #:ktap_test: suite_1
>      #:ktap_subsystem: example
>      #:ktap_test_file: lib/test.c
>      1..2
>      ok 1 test_1
>      #:ktap_test: test_2
>      #:ktap_speed: very_slow
>      # test_2 has begun
>      #:custom_is_flaky: true
>      ok 2 test_2
>  # suite_1 has passed
>  ok 1 suite_1
> 
> The changes to the KTAP specification outline the format, location, and
> different types of metadata.
> 
> Reviewed-by: David Gow <davidgow@google.com>
> Signed-off-by: Rae Moar <rmoar@google.com>

Thanks for the updates!

Reviewed-by: Kees Cook <keescook@chromium.org>

We'll need to update the test runners to adjust their outputs...

-- 
Kees Cook
