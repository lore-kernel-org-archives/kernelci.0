Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AC8024BC06
	for <kernelci@lists.linux.dev>; Thu,  3 Apr 2025 14:16:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743689809; cv=none; b=NiX6BFStDkMTcNjiqJTgpLCdcRRpFTnyvzdP8+txnwxHzM6WIMNgV5grSM57lc8XXM9XDB4SBFXOi06hwrWPwcdsAHK1E04IpT+jrtWkRC4PT+MVou7tYUJIWkb1qcuAMGtdOJ+6Ef5vU4LQZBqOP5bdwHqZ59wjPsNndS/k3qU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743689809; c=relaxed/simple;
	bh=63p5+6PRos3C0Hjq58fN5xbWa5oUZuIiRGUJp7iGCXM=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=AyGLP4rP3IoSy8DQsrsbsfxzFWELlpuWrMF2Bb3EujGix7VSdQwDHn7NAHf5CV48Wg28k4bztluGGMhA8bEHaKZTtayo4myKVPsLg48GQtHNcm1qZeW6E08NpD635grEEptvrI7Q08dLmyJzAcyMcCc/vQkL/OEvQ3m6myuNywI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P7JDTym/; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P7JDTym/"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5493b5bc6e8so1173538e87.2
        for <kernelci@lists.linux.dev>; Thu, 03 Apr 2025 07:16:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743689805; x=1744294605; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :to:from:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L/XAptyKE2ETbr9Og4famr/JLUsH4fzIh/8MX1usuXQ=;
        b=P7JDTym/L+zGofily9kXdsoSJAgy6zgFNpvbd1GBX+hHQ7bAE0UrDFiiD7l+Te8CNI
         N5Go/eurUpyny9B57ct9qBU8o++PY6WkCoWKWsw7VqaR3SF2Dm7fu0vFKzjxy2qsRzxC
         bdBpWzcqLTa7lDgEGKNATkfLpHGzRfUkYfy5qMxQZSeZ9OSOXt3gGYtcALwEyHkpcsSM
         0HFInF49f9SJ3tbvT+M0/pJ5Z47FXReBuPo/b6jIyEOqB0xb3PkMqcVZhkWX8obYaI0W
         tSs9eGjlYVYldqyFFn3tD6Z3bM8GNt3AsANMvB9RdAzdl3wAEUbxiNIIcQuHJLPpewDN
         rd/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743689805; x=1744294605;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=L/XAptyKE2ETbr9Og4famr/JLUsH4fzIh/8MX1usuXQ=;
        b=T0e967Mq+ufzfCmDvwxTzA44CO+q1p87+K4SHzOiixTOOR2GCOfe3ZG099UEGZ/Tmu
         mT8J++GIsOxqL4pcr+06fuomqUniGNlpslbGrmBUR9cM100AipTFKQEIdm+t6rGxr6PD
         JErmw7H0bwNh0yCtQSlSaPyoPKpAB3u5sjIYoAN3gUaFm9FHGOX8xmTzmQy3T6lgDPNe
         mTM5fAlirb4XWuSzP/rwDCPyBdqI99LbRYRTULAC9xv0GzmLyM4KHSVL/OGaOOpA23xG
         NINk4+Vs+To5/och/UmY/nYqImdG9pthfDKwQ0ssmPKAMD3qt0yJQ/qGMYNPfgxLeYNs
         FXDw==
X-Forwarded-Encrypted: i=1; AJvYcCUFiVYwaRq9d5ymX/cLgspzsHu+oevZjh3TC6W5XarlGcsUOTYZ+lYZqQ6HfPZqMFIVejC/eSEdPw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxei4iJUic+py3CMdnedGNeULt4Gsccm6aO/Oz5b4IM9fpO77+K
	kQH8BqYX/IM5LsS6aC6gAuJeMDw1HrlTNcsmMdSq2h35la0P0vyV
X-Gm-Gg: ASbGnctu+UfqTtuC5c132mLzi4fHK2RtfCb3bfZ24nq82zveHy4kW42QTFfzLwiN1yy
	cOkS+JSzcQ/gm5vnPuBJIEdrVz6p7odUFxGYXMnpdC1DKrltmTKA8UF4wWICUHlBXVrtBmeqVGr
	ew4yIEG7DyUJkNMvDkzKMgf2SDCJhj2dDIuSEz6/pAofeHLAHwqkRVLCndHz750No1bFua8Lkb7
	ZbxsLhSLmbXYvQty7RjBp3k6Edu36IcyBwibpd+TmmD1idxrYg58nAnO5PqxHQSrg3VtoDa6o4+
	l+2pXeOXwgKR99p11BBi28HITwhYJf1piovZE5+NWiHJ0hvMULQ3qQevy1pED8tmuG6S3/vi405
	t7xeb
X-Google-Smtp-Source: AGHT+IFN8wmAiU8yImyF00IY/ADqgSsKWDMI3rwqaFMQ7guuBlv6ICns4VV2KJfeuzvO9WeYau6eJg==
X-Received: by 2002:a2e:a803:0:b0:30b:d35c:4754 with SMTP id 38308e7fff4ca-30de023b4d7mr76674751fa.10.1743689805008;
        Thu, 03 Apr 2025 07:16:45 -0700 (PDT)
Received: from [192.168.0.167] (h-185-57-5-149.na.cust.bahnhof.fi. [185.57.5.149])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30f0313f381sm2309521fa.25.2025.04.03.07.16.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Apr 2025 07:16:44 -0700 (PDT)
Message-ID: <71ef92b8-c089-4354-a001-b0e449b62d30@gmail.com>
Date: Thu, 3 Apr 2025 17:16:43 +0300
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: KCIDB: v5.3 - test input files
From: Nikolai Kondrashov <spbnick@gmail.com>
To: syzkaller <syzkaller@googlegroups.com>, Dmitry Vyukov
 <dvyukov@google.com>, Alice Ferrazzi <alicef@gentoo.org>,
 automated-testing@lists.yoctoproject.org,
 Cristian Marussi <cristian.marussi@arm.com>,
 Johnson George <Johnson.George@microsoft.com>,
 "kernelci@lists.linux.dev" <kernelci@lists.linux.dev>,
 Mark Brown <broonie@kernel.org>, Philip Li <philip.li@intel.com>,
 Denys Fedoryshchenko <denys.f@collabora.com>,
 Tales da Aparecida <tdaapare@redhat.com>,
 Aditya Nagesh <adityanagesh@microsoft.com>,
 Sachin Sant <sachinp@linux.ibm.com>,
 Benjamin Copeland <Benjamin.Copeland@linaro.org>,
 Manoj Kumar <ManojKumar08@arm.com>, Michael Hofmann <mhofmann@redhat.com>,
 marcelo.santos@profusion.mobi, kernelci-webdashboard@groups.io,
 Simone Tollardo <tollsimy.dev@protonmail.com>
References: <be9de8bd-4d4f-4086-bb9a-90d7abaa3dcb@gmail.com>
Content-Language: en-US
In-Reply-To: <be9de8bd-4d4f-4086-bb9a-90d7abaa3dcb@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 3/28/25 1:16 PM, Nikolai Kondrashov wrote:
> Let's now move onto the next change in v5.3: adding support for
> specifying test input files (an `input_files` field):
> 
> https://github.com/kernelci/kcidb-io/pull/99/commits/07cc1885a1ecae6f25287b61b58ecb4f70a92e63
> 
> As the change is minor and backwards-compatible, I'd like to set the feedback
> deadline to the middle of next week, Wed, Apr 2. If there are no objections by
> that time, I'll merge this change to the schema and database support on that
> day.

This has now been merged, deployed, and the database was upgraded to accept
(and serve) the data.

Nick
