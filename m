Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 650041D5170
	for <kernelci@lists.linux.dev>; Fri, 28 Mar 2025 09:11:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743153066; cv=none; b=FUd8iTS55nLxz5T652gAVUD9Rf+FXJT9ET9Z5k2ZaxArsdZkUMXcUN3J7bQM563W0zxwDYCdf5k/A1uJRmOASqMP/v8L1g9KgiJvwXODxsX4KXNq1U3fJRw/6RWaJHMbZYmZM71YgqQCNI+ljnJnLhGLou1ASGNfpGvSjnrREes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743153066; c=relaxed/simple;
	bh=u/Is71yze1bH4oxNkUnBuQkj6i8Xsh52rQbS4aU+SOU=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=hE2Rx5EacUdi7ELcZkwEjkwzhkBwPMZcQSk7TAcz2TgyX5Xdz1vcpzdTACyTtmU7plkzNZYkXl4dqFrzsk/R6fdaN7raYMOmSPQPIftHBMn868lrV2qGwwf9DoE/00HpHIgcXri8f8xYdhvQiY7V6YsL5inhj9VjOHx7JpAgNSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jFsz5QNJ; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jFsz5QNJ"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43ce71582e9so13802195e9.1
        for <kernelci@lists.linux.dev>; Fri, 28 Mar 2025 02:11:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743153063; x=1743757863; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :to:from:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=seNamhV5jVpF2hqnYB/OdhOm+fkL3Oj/VaHUpxCy9EM=;
        b=jFsz5QNJJd3vJnz9J3+ljq/QIKYuhFhLzR8j/7Dd6R2kn35T82N/ecvs7jC1WLBLy8
         0fKCgBAm96vHoYtU1R6hIW/zYS/Jc/00IzLEPZKGyQJQzpMt/18xry2uXBhBoanzTNBL
         kPpT7QP826XTXx0cST7gs2iyqsZYoBJXLl8M2LqmSaloLcZpHECXd05/96gYjK6VKNwq
         QpGt+38bf2d7CqhqxpBwGE6Nbp5ej0A0aPqCrQPGkCwMwTZjSlAdHq9WCvLyz413ShDC
         xmURspYIXd96QC0BIXNf2bRWPjXd88XrBCosZStfzgUYMaZK2JCZV5tCjVljmZRjY0yo
         El1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743153063; x=1743757863;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=seNamhV5jVpF2hqnYB/OdhOm+fkL3Oj/VaHUpxCy9EM=;
        b=OIfB6qkCgzP/5hIBATJMGC5+QCr/i5QEgQVMyc8WHaRFRUVrtwTvU1xReATv6ujcIK
         OKJ40BGsMlSk4jExXEg6RvHK5II6uEy31Z++C5EM7HEd4QvBaSi7o5LO2cW0zoi1wap2
         24I0Bnsm/XqykjvbnjVhN1F/eLBiYvXKv9Y8g2GFxLET3nb+AVwsU8EGWZVkdRlhDvTX
         XY6e3Yoejk0wkzz7B4yrz6x1g+N7v4FkzdrOfzHywAfsBPz2fglQKTtl2NC9XtHkseeg
         WJQyyhaC2o7x4fobKjbt4dSynemq3WF+fu4W5Dc9gkc1RTigUgTadoWslDNFFir3jdeA
         ymTw==
X-Forwarded-Encrypted: i=1; AJvYcCV6JFUgcU7beTEzuZtLE6VS3jZNYh0mmioCov0gnlAE0x56ZdgE9wI6N8fmySsaRmXVZ6XP/uj9/Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YwKrH/3OVBRu8HpvxtLU+EEM4U52c21kcBYigyUdyd9izeXXA79
	0jDYZ3Dw+56fm9v4cY6XEcChwKEfwaC5Ood+x5XxYJXiWBonY2Ur
X-Gm-Gg: ASbGncsEoMrjlYSuvHpgYRpV5i7IUlswpOd3LEVxyEgGJrb92qopfoeRAdiAZvYdCKY
	H2VcIiDE3M8vXF0WAggEMRU5VTcDCLD5NiLDhwKxDcQpu8JdwJIZ/qyXG0ZkZwsK3oOfuuFx3MR
	2SL8ZVVWbs+Hg6Is7GI4+TkN+hJ+YRKg6zipR365VwsGtc9WQmlpi+zLFp3g272PUu2ID/9u4+C
	UKlAbhlix2E2z9dsTfM4RNkhNb6OBnXcqLltXGb5rXS9r7+JLxpr8cEoIqTTpXgl9VrZRArwSY8
	4G5Kp+7OqT3OoS+YtSaonSY45aHVEwa+hAV75FN/n+DdzYbun/1JYW+zndd5CXWYxPltmEuQn60
	hdQ6aMG89ZJ7Ky6A=
X-Google-Smtp-Source: AGHT+IHE+7sip2NAgx4DylW/58aQL4ds0cmo5lHcm99o6B+p0Jb9lMz3gUsq/c/+0SMs71o6o+a53A==
X-Received: by 2002:a05:600c:1d96:b0:43c:fd72:f028 with SMTP id 5b1f17b1804b1-43d8509d443mr69745725e9.29.1743153062399;
        Fri, 28 Mar 2025 02:11:02 -0700 (PDT)
Received: from [192.168.0.167] (h-185-57-5-149.na.cust.bahnhof.fi. [185.57.5.149])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d8fbbfeaasm21181855e9.9.2025.03.28.02.11.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Mar 2025 02:11:01 -0700 (PDT)
Message-ID: <aa001ed8-caa6-4e40-9eb0-940cbcab4e76@gmail.com>
Date: Fri, 28 Mar 2025 11:11:00 +0200
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_KCIDB=3A_v5=2E2_-_issue_categories_+_=F0=9F=97=B3_P?=
 =?UTF-8?Q?OLL?=
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
References: <92698250-fab5-4f39-8f2d-3f29d85bdd40@gmail.com>
Content-Language: en-US
In-Reply-To: <92698250-fab5-4f39-8f2d-3f29d85bdd40@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 3/24/25 2:18 PM, Nikolai Kondrashov wrote:
> Hello, everyone involved with sending results to KCIDB,
> 
> Please consider helping protocol development by filling this 5-minute form:
> 
>     🗳️ https://forms.gle/FsZL84bcAzqve1aC8
> 
> We now have full support for ingesting v5.1 schema, including the new
> "origin_builds_finish_time" and "origin_tests_finish_time" checkout fields.
> 
> So, we could move onto the next change in v5.2, adding support for
> categorizing reported issues:
> 
> https://github.com/kernelci/kcidb-io/pull/98/commits/e7ba6a9f351a724f69a556f7967f96bb83e398e4

This is now merged. Thank you everyone for attention!

If you think you can find the time, please consider participating in the poll:

    🗳️ https://forms.gle/FsZL84bcAzqve1aC8

Nick
