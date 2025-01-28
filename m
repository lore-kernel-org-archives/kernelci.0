Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BE282F29
	for <kernelci@lists.linux.dev>; Tue, 28 Jan 2025 12:43:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738068233; cv=none; b=XbV8915HGJObKs9nKwV3BF39LleW/1OkSVK3ozK9e0PPzO0/JBlPiEFbqdxDcZzKPgan1Zxa/Tzzxne13G71Agter6bBsSGlmX9EZvY4BDaTH9gC375ycGrZfnyPRWNcIMA/hzxOLGpgSJxL9aIzPQeFpvwStS8l6APthle5lnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738068233; c=relaxed/simple;
	bh=q8Er4qI4ahI2S5C3hn8Eausgk4LAf76H/o7/smjFzjY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q37ezzglVRi/Wi4AKE+5Ya4KnDZ9IxjR80aODTFmVE0O1o98Apn9szFt16vjY5Z/HSjXYViab98a0NhML1G0auHK4I9dkfUgHz6N9/iVNTR+S0AyFktaA4uv5Yu3g/jagFUgrcU288qUOotM2yBW8Oax1vjNkSOpbpKk+En6myw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=D32WsTHz; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="D32WsTHz"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-436ce2ab251so36667355e9.1
        for <kernelci@lists.linux.dev>; Tue, 28 Jan 2025 04:43:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738068230; x=1738673030; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2npVkOuOv04Tel6DkNspjpRnmGdY5QLsfu3aoyjOBac=;
        b=D32WsTHzv2sZh0uIeap2V4R0ngMkKsPa3+5+YC4oLTHRsIu2us4dr+ormEl5HmYp+u
         f6Ettc6wdQ3EUnoojHuEgW2w91rLVhBfh9x3mnQyjU7hYJ4+jEAdleCSmtIXcfu9DcBd
         7OwaHSdOPnifxEcVV0nEkOhqTppFc3H4MyxdofWrX1Qjs5ulm7oOEtUgA6C8V+CBV0f3
         NoJDOAFRlxHkPYULNVMCZsOCvL/TUZwiikjuTkoyywcQujjpGGktx/zNdNkbNI/9IdHe
         o5CcL6e6ICcQHvKrKp57VPSeMQRB3Yj+30vhhSNSMLuHbvlDL9XbRPTU24nAyx6jBmcL
         qVFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738068230; x=1738673030;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2npVkOuOv04Tel6DkNspjpRnmGdY5QLsfu3aoyjOBac=;
        b=XxkD8gJRHs5rp5Ucwgg3Y0BzqgCQx3rL1OvW0/zA23A41525hN5SXfsCZyfqGZiV8A
         tLwcal/8mNouO4a+8Rkwcwz+DoB9jLnLXWjjMRzJ8a65+OECa2w/TsxkRH2BisGs456P
         L2gI1IJkHFNY2J9DHDE0eQ9AxRfK3dWpe1uKR8yQPLEiZk4nV863umjQ8thwfmCTpali
         mQxOY3plqy/Zq+JQrXOto7gCnuDHxxHhbkkQF6i2fcdfLWEsqGOOhdIjwZQ1rvC6Nqry
         eL991dSnUGUHTcnz272eUW1MG3oY+U6GcvXQ2tysk4yO4hzLRXB0KB9aBpfnYaEcyNhS
         bzrg==
X-Forwarded-Encrypted: i=1; AJvYcCUBix76CDnVXmtUJeo6k5OoL/42q9/v4GsLVk6ZgJJZ/F/aOQTuBwVSBnTcRp9454khn9sr+zAxGg==@lists.linux.dev
X-Gm-Message-State: AOJu0YyXZqX45QH0ZDCWds2VG3o2wM8pFeXxzhO79tttMO9dz/iEteOI
	TZSXl8jRsfkZIl+BQPzEI32hq6hkUIf85g/8tuO7jZBhaKpCeb2Fkm+B1bVoDno=
X-Gm-Gg: ASbGnctAJ2igAjMdPoNchBdYGZUq1ckCwMoSwVzXGNar8yxq/xpqeakcHbNm2La0MiX
	DAN8DkLx1a5u8te0YZlxESJshfVW4laC4VfkIaza8apySOQwmQi9JcwsdcXOG1XTrbv0+MQQMtD
	aoQtQqx2bnwMKIXIQyredm5GCT75jloLPfs/mxmPo8xqiQ0XOiB7cY+vxjh+LZsv9bdbFMwksgW
	CrmCbIeGRQfiD2WGAHTPzjKFjahCR2TyEjhv0270LQRrHf37soyvok5uLzBr/5xvIDCaAkJdSFh
	dFtnL9qN6fOmoII+bRLdiBiqdGvZueQ=
X-Google-Smtp-Source: AGHT+IEi1DubB0W4MOkD9qS8FRtXR4Q8D8HYzqTNZ2v21+5bX3PonF8dkrWl5tvWlJEytvuJGxKttA==
X-Received: by 2002:a05:600c:5486:b0:434:a10f:c3 with SMTP id 5b1f17b1804b1-438913cae48mr369108575e9.9.1738068229824;
        Tue, 28 Jan 2025 04:43:49 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438bd4857b8sm166100695e9.15.2025.01.28.04.43.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jan 2025 04:43:49 -0800 (PST)
Date: Tue, 28 Jan 2025 15:43:45 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Mark Brown <broonie@kernel.org>
Cc: Sasha Levin <sashal@kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	kernelci@lists.linux.dev, Al Viro <viro@zeniv.linux.org.uk>,
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
	lkft@linaro.org
Subject: Re: [git pull] d_revalidate pile
Message-ID: <bef98fe7-6310-4d24-aacc-3e629fd786eb@stanley.mountain>
References: <20250127044721.GD1977892@ZenIV>
 <Z5fAOpnFoXMgpCWb@lappy>
 <CAHk-=wh=PVSpnca89fb+G6ZDBefbzbwFs+CG23+WGFpMyOHkiw@mail.gmail.com>
 <804bea31-973e-40b6-974a-0d7c6e16ac29@sirena.org.uk>
 <Z5gJcnAPTXMoKwEr@lappy>
 <3770d3ed-e261-4093-9a41-90f0dfdd393b@sirena.org.uk>
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3770d3ed-e261-4093-9a41-90f0dfdd393b@sirena.org.uk>

On Tue, Jan 28, 2025 at 12:14:07PM +0000, 'Mark Brown' via lkft wrote:
> I'm able to decode (just feeding a random log message in, no idea what
> specific build generated the log message so the line number is almost
> certainly wrong):
> 

All the kernels that we're planning to boot have the DEBUG_INFO enabled.
Here is the config and the vmlinux.xz for this one.

https://storage.tuxsuite.com/public/linaro/lkft/builds/2sDW1u8fB268uU3L32J8FqAxYYR/

I don't want to explain how to find this URL because I've filed a ticket
to make it prominent so the instructions will change soon.  And ideally
we would just have the line numbers on the webpage dmesg itself.

regards,
dan carpenter

