Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D77C21F03C1
	for <kernelci@lists.linux.dev>; Fri, 21 Mar 2025 11:16:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742555796; cv=none; b=TxTYQl5NQEttSzqnvqkPukffSwtAcyZo58kC5uCT3rjml7gUvs/y4roAM58DXyKA5JXnOHZMmB+cP0P5mzISXwSBc0la74o1O7vDEOO1pXo8NkqhTD9BckkvHcok8J4HxsAbl1iRoX/1G94JLhcatE9CQsZWpdaY/NCCfaEeM4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742555796; c=relaxed/simple;
	bh=bPLI2NOz630Tnk8dSU/h56z6i0gjDc9SZ5Jt3oR8a7c=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=hicgxe3NU++p+EwCAPYZ8zgWWdKFsGIsPdB1Iv5eV+ab3R7vHSUg40fB89Ud30+2LXLCjhLdy6sNyKn4oca5DD9ZuoTdycq2bBlRzF3BDe2O7fPHnEz9FP2KANfoCD5f/QlNlxdHfepiykVL15nJb4BTJnoWhPBhzc5qDwR5YVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PdMA6DOu; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PdMA6DOu"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43cf06eabdaso17610565e9.2
        for <kernelci@lists.linux.dev>; Fri, 21 Mar 2025 04:16:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742555793; x=1743160593; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :to:from:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RLSLf7f+dC3D3jOHMZMZANJRdUIMHOqoy2YtD++BfBo=;
        b=PdMA6DOuOoXsHj2P7V0ZXOtPYT95ylQAf9vdGLETaaD6SILPc+Eg+eL5WF4+miNGoo
         +JZk7xnA43sL3aUtwyvw8ddR4yrVhi9C4JMRSp0rjiYpZ1L8DVYpWfVMoGTsloK+6BNL
         Y5EctvkFZ1lS/R95Bw4oL2kKsDMnZ2GY5Ya+ZjrAp1UNDDKTDf9WW+cm4dMNjozuKKtb
         lnq6DTM+oaG2k2FOYDcaVBMeDDT8f9BU5ZLHSi7DWHBBb9cnBQscHn8ZUZ0wCAmddYrt
         YLNfeIzdjq2UVaavcYCKUx+qxDmORKO26UtrI4oA29vOoMyyDaMWJAW4I3aSDYcTap+j
         N75Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742555793; x=1743160593;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RLSLf7f+dC3D3jOHMZMZANJRdUIMHOqoy2YtD++BfBo=;
        b=MssXW9dX8sB2LaqAFzkWA3OB8jaU+aj2cHhuBI+v8HuEkFY8hCCCUUbEFakcq222FE
         FYh4PJ+bTme7BD0skGp/m6w3ENXdBo5+BiK86mKYemf+POZj24FxKeZgTGEl3JNTs9ii
         tcj90EpHv188db6U37omu9yr/lOfwiU1FoC3taIyLlyKhMcepIPm3Y/d1hCwLIxvjHbc
         BVMCNGrnA5M9QtyziqOS/Z8Us7sxOu6D/0sg4TY5rcck59N2QlX450xdOUdkb60gyIw1
         Ix5rcRO9Znq7FJFPCyXTLNpNfgY4Hy6Rk4MvozmmjgOwO6kDH3PWnNkLpbXuJKmIT24x
         44Bw==
X-Forwarded-Encrypted: i=1; AJvYcCV4svrZgLTW7fqwmX4d3yAAse6EokizMwEnuA7IsIozJe/+JjuPfRTQCpsxkCL98zhkZ3ivxvLilA==@lists.linux.dev
X-Gm-Message-State: AOJu0YyaS5N0ELir55hNWu/HFo2QQkFWnARESQFgh6T4CKh7QSMUIZOy
	r39+yjf8/qI2/sV1C3nPOzdceJY/tFp/51wSCSdc6G8lzAUzjtY9
X-Gm-Gg: ASbGncsr2NiBgTabVpj1VCETi7HCLJxeJd5MoozGCaGs3U7vZtdwYe+Ivau8DmAAjT7
	0Vgyse/DYdl9RCOwYKMbn8FuGbNGpIkDHqJvU6K7W9hr0R4rsvHyob7HFMUtf5XM39NC5rBWhY/
	g6g8R3v5qEi6J7aPj8ZIy9kmsEgRqt06B6+qq1e73UI7kXO9sJDSJzSXTu45oMwY3UAIKXDQshU
	s1WDyQaeNGUF0j9DDEPak6mIoImYf81YhYXwRTQ/1UEWUA6quayHWycvWwl36WSLXVr6OT3Vd39
	D8mv5DUh1NzlYb2C24fCOKoBI4J8xP05ynwT8pYqVF5qJY3jJPYI0iKu7m5R8u23TIQjLTfX4N7
	u5h8b
X-Google-Smtp-Source: AGHT+IEu9e5eloL1mJZcrdzNofmgDZcAm35MBRKh3qvEPM8FpwQ9q498/oEDqQb9LZSNzrYl/YF7Vg==
X-Received: by 2002:a05:6000:2cd:b0:390:fc5a:91c8 with SMTP id ffacd0b85a97d-3997f940ec2mr3366281f8f.53.1742555792806;
        Fri, 21 Mar 2025 04:16:32 -0700 (PDT)
Received: from [192.168.0.167] (h-185-57-5-149.na.cust.bahnhof.fi. [185.57.5.149])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3997f9b3dd5sm2074825f8f.45.2025.03.21.04.16.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Mar 2025 04:16:32 -0700 (PDT)
Message-ID: <e881e858-5e34-441b-9d0f-50c70ec0f17e@gmail.com>
Date: Fri, 21 Mar 2025 13:16:31 +0200
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: KCIDB: v5.0 - backwards-incompatible changes
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
 marcelo.santos@profusion.mobi, kernelci-webdashboard@groups.io
References: <87b2306a-4110-4032-956b-d0a6db8e3aca@gmail.com>
 <62caecef-1cf6-4a3d-a223-f67d2e8af617@gmail.com>
Content-Language: en-US
In-Reply-To: <62caecef-1cf6-4a3d-a223-f67d2e8af617@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 3/7/25 6:37 PM, Nikolai Kondrashov wrote:
> On 2/27/25 8:32 PM, Nikolai Kondrashov wrote:
>> Hello again, everyone (potentially) involved with sending data to KCIDB,
>>
>> We've accumulated a bunch of schema change needs, which would break backwards
>> compatibility, and so it's time for another major update: v5.0.
>>
>> First, here's the kcidb-io PR: https://github.com/kernelci/kcidb-io/pull/95
>>
>> This will be followed by a DB/ORM update, once we agree on something. I'll go
>> over each proposed change below, linking to corresponding commits in the PR so
>> far. Please review and respond if you have any objections, comments or
>> requests (here, or in the PR).
>>
>> I'll merge this next Friday, March 7, if there are no objections by that time.
> 
> Alright, this is now merged into kcidb-io.
> 
> I'm finishing up the DB support for the new schema, but now that I have to run
> migration tests, each BigQuery load job gets stuck several minutes in Google
> queues, so I might not be able to finish testing today. Hopefully they fix the
> problem and the DB support will be merged beginning next week. After the
> Dashboard folks give a go-ahead, I'll upgrade the database, and the data with
> the new schema will start getting accepted.

We have now upgraded the database to the v5.0 I/O schema, and KCIDB is now
accepting data in this format. Please go ahead and upgrade your submissions,
whoever is ready to do so.

Thank you!
Nick
