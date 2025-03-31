Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09DBA13C9C4
	for <kernelci@lists.linux.dev>; Mon, 31 Mar 2025 11:58:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743422330; cv=none; b=U53h50el2o5IxEGCpbCxNv93x+cAm87Yl612vnEESEZ+cSVucvBcRSwPH9wj7oL/0BRGJEgHMa1eSfJH/sUqy1i0MccqaGDRN4K2WfoPPtYiGsjkgVBDZC5arDUbNGAAMPu5uEb/07wgpSMgNmKj4uwQZXQKIpnpTEpOHtxwBpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743422330; c=relaxed/simple;
	bh=k8HYhkgBbaUQRfDMrB8kyk9r+4HAUDEO3wR6oLtP2/s=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=moCg6hdG7042WzbywWKUy+q+AYqZSxquoO9Lmnt/lNJN8DwoI/IZIzkpr5b08jxV8NXRnadD/YaYcfq8X/siqUSExDgI0UezRR1GrjosrpNWRpuMmw4iZPWcbWNlaOfoYvs0bB42F9sNUbpXiWPS1cDH1QOBpHOB9jY+3W5Y/Yw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U5wDAg8V; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U5wDAg8V"
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-30bfed67e08so45039651fa.2
        for <kernelci@lists.linux.dev>; Mon, 31 Mar 2025 04:58:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743422327; x=1744027127; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :to:from:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=39mGf2mdJFWOdSAuM40N+hPK1tUjWLnnkfNLdLAwq7k=;
        b=U5wDAg8Vuvgu3n16iOlvMK0jL9Oov9NcJQ7MMqqAn4DUZV5NTmkFG3gA41sT/hv/R5
         mpzj0cUYMouE/I9bODfPgkPsq2h1HeVO2uV7VqG1JNBP4/uwhuGOGC3cDFe+V6PelMsc
         03w213MIJ4cznXh7Jdi1wTp/h7HKLKNiPMmwVjvDNSyGcjnj1tobZ8w3n0ZyZZfS7R26
         Woe/OinYyEZqQNkmlC9Bu54NfzoGFPXJqeaEqvRcPWT5I5ic8ZnuQt4q45FGMD6vKw2p
         UFXJ9aGb3lZBgHIuMiDthmpG8plVc7yOa8VxUwPy80HI6eaRzd4mRJHLRUAWaMDMvYqb
         skTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743422327; x=1744027127;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=39mGf2mdJFWOdSAuM40N+hPK1tUjWLnnkfNLdLAwq7k=;
        b=bvdyx94aL4xUrZEEC9MUGxL2ri3i1OH3RcxLytJO/m324aWrQqoYDCGK2KKAXp+gTc
         4Mc3/YIoPTqCWb9bZu7LPqjxQPhZjVo1ruCrgBT8KT9T6jZxV9OofNRTMqXEglWiMzUE
         D3+eJDXKV7wXQVqZrip8o6U3hjoyCnWPNe06IxxVCGVUUQeYqNh9lNLbZLlbM0AM7PtG
         41TH6cBL1QtHr8+DXWStKBxnwvytlVPxvydxiPJqs5nKFOz9ijEa9JfIjZtyBch/7Dp2
         0mqUsWZc6ykK7HgGkpUBtM9VQatEFBKd2LM1BhjgIX3apoIY5mmzVztQd1V0Kh/cdpv7
         kK7g==
X-Forwarded-Encrypted: i=1; AJvYcCULRO9ZKTSoT7tdy+pOuhzVVmkGkL86ouyzjGCkz9rW1NE5hzrgmZHP27lsdK/Z7W1ghEUj2rf6Rg==@lists.linux.dev
X-Gm-Message-State: AOJu0YxsjhhZucIwK4tzqFUrlSDfMQDMMfR3fPFxEKbmwPxaxm6T8DhM
	h8h+Cags2vLs/c3WY/0vYyY3bPGrx0Rd3XnMmrjgisNIImds0II4
X-Gm-Gg: ASbGnctw49aBWE1a6eN4RNOKTe/i0Bzm4/8WAiUQxFeiOqMppCROK95gARqXpRS9TX7
	b5sgZUnIAbPF8H6JfjUvy49RHuoSMH3HNNxdHNIirMKYaNJjPomtQwG+qRMfd/JcdJxLkXZ67mC
	HeQdqpBBxKtPVOyaM19z3xMO2OOdwSYXCBQWBYLs8VCwguh0v/eRJ2Oh0ZE4g+BrfQhPbnRgCxj
	W6u3IsFs8W1Wps7zeZMQXq2KxS1DCpla+3et7uJonmMEyOQUs2uEK6qwE1NMaOgt5bc99twGX6Y
	+MccrNB5UBFuoZKBqGiW+42j5pB/CKR0FZm4EntUCVYS9us8u9+hz1n0dNlAjH26FZTxlam1CHZ
	XpdMz
X-Google-Smtp-Source: AGHT+IGT/INTpnUyTgoP+IBR4KH9Pnzt/F6MS+YzhQ39/RaHMKqaDp65yQaMh4Egf1BNrLlbPKKBkg==
X-Received: by 2002:a05:651c:150c:b0:30b:c569:4665 with SMTP id 38308e7fff4ca-30de0328399mr32884991fa.29.1743422326883;
        Mon, 31 Mar 2025 04:58:46 -0700 (PDT)
Received: from [192.168.0.167] (h-185-57-5-149.na.cust.bahnhof.fi. [185.57.5.149])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30dd2b59468sm14637881fa.103.2025.03.31.04.58.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Mar 2025 04:58:45 -0700 (PDT)
Message-ID: <f1758192-724e-4917-b155-81861d75ea79@gmail.com>
Date: Mon, 31 Mar 2025 14:58:45 +0300
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
 <aa001ed8-caa6-4e40-9eb0-940cbcab4e76@gmail.com>
Content-Language: en-US
In-Reply-To: <aa001ed8-caa6-4e40-9eb0-940cbcab4e76@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 3/28/25 11:11 AM, Nikolai Kondrashov wrote:
> On 3/24/25 2:18 PM, Nikolai Kondrashov wrote:
>> Hello, everyone involved with sending results to KCIDB,
>>
>> Please consider helping protocol development by filling this 5-minute form:
>>
>>     🗳️ https://forms.gle/FsZL84bcAzqve1aC8
>>
>> We now have full support for ingesting v5.1 schema, including the new
>> "origin_builds_finish_time" and "origin_tests_finish_time" checkout fields.
>>
>> So, we could move onto the next change in v5.2, adding support for
>> categorizing reported issues:
>>
>> https://github.com/kernelci/kcidb-io/pull/98/commits/e7ba6a9f351a724f69a556f7967f96bb83e398e4
> 
> This is now merged. Thank you everyone for attention!

This is now deployed, the database is upgraded, and is accepting submissions
with `categories` in issues.

Nick
