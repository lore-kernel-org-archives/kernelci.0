Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB65413C81B
	for <kernelci@lists.linux.dev>; Mon, 19 Aug 2024 09:50:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724061022; cv=none; b=iYRXuCci57r3VEDepetWs+ndne3pB5IuTIKit/+tvRekrYko+t2pi9ZArb2qUtClbs4KXPt4PAIEg2aqSUSxzmfnfs4q0LrFkVJR6SgNC46209iQeR9TPi/EolMZamrT7CyWi1QV5Aj4WI4deaskn5ktcUSgBWMZFcOuG9Tf8QA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724061022; c=relaxed/simple;
	bh=FirFvNT9jLQGcw6fhKPN4ZDwWb9wYYtCJPuOgsGcoMI=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=DJVszCv8snXLvdGsWFrF0cN+gz5x3sdwl+qCB3UMQQw6HnN3Ue5CgBnHikpxngRRoSUTKK2tBNYPkApnxffCcpFwEGbRtBSafaWawLB99emXf8hmPEL5XqDqrO4AKOODAxaRGwauZqJnu8XKqel9+U/zl5zid/oTzLLVfV7qp8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O9uCGBLr; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O9uCGBLr"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-428141be2ddso31654805e9.2
        for <kernelci@lists.linux.dev>; Mon, 19 Aug 2024 02:50:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724061019; x=1724665819; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :to:from:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eB6oZFXUf8ARTXxeahu0iZWXZ9DkurIvfp0FcpyJoDg=;
        b=O9uCGBLr8fRjW/cbwY0oe0OS0sjBdh3bU3etBY5ffl7MIMLlbsbaSIVUlnt11CRK27
         /Wnnx5xCmeYr9aCMYMsKyR36FqvO5v/yecBj1FfTg4aCuAe/FHD/4IrAXbeJry2NY25b
         9w7g7eMw84J0fuaj6OHF2diIOYXKFovOecpD1EtkY9++udBSgVFRnETrcRY5E8ru2eeM
         /VQM6d98VQGX2+BwPjHSQorqO0NmxoD7F7Tp4DoK3A9sJOo/D7COW+ME0ZIBvsEXo3hn
         cpVJTD7S/OI+uHaAp5Gazuq6IKEpsFV7OcXVo5ZYuRVmFDB3CYNGohNnWKV5+7PPLcmy
         Lymw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724061019; x=1724665819;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eB6oZFXUf8ARTXxeahu0iZWXZ9DkurIvfp0FcpyJoDg=;
        b=WMi9+ThwK8xYLzKbySzgo1VG3A+y+QvqtfWE1G4COaRl5HmivUsNkqOuR0utUYn3Y4
         EGeUt5C9aFVOJYuLvo408HYMwwtU01cqQ5CTx8csqKO9TBm6fRfC++RaykFrz09WoAmK
         TsQlD96xih2/7FvrKUhl7AJ4QlZJ/Y6TfPEXnojPOWboZU0jUIeqnDgDCJMS91Yfhk6j
         NfM63a5d6Lf1nv9AT0O3+PUkYtQ8hJlf8ipuV6u/I/J7q6z52gC0Y79Xavl1wxV79Cbp
         mp5vq1Gy2Iw96x3veH8xsUrEqAYtRzQKDILUu35SEw8M+OEqkqvi5oO3/48/iRtDVsxf
         Urpg==
X-Forwarded-Encrypted: i=1; AJvYcCXEK8ORdcQGF+1J1dySSq9BhZ6sxJbbYZmFO/QeO0itj8S4lO+ddFGMiplKlu6Pgjy5jJa/dWixh1hwDF788njiG8prz4gJuAU=
X-Gm-Message-State: AOJu0Yyq2hGS7sJKQ8zkTFb/SgWfQSqdaGUhYd+tSHc9CBG89ABNdFea
	tnxiPvNYDpcpgcvSbMsj5qZdiZBzz5OAVO6u8wfmFPWz05dVfehM
X-Google-Smtp-Source: AGHT+IEP6VXmu8SRhgwYUeVAyuxRQOWBR0YjzF1lbuv3aHZEsNor+t/TchbgCDIADoD/ZyfwRIZqcg==
X-Received: by 2002:a05:600c:474e:b0:426:6b85:bafb with SMTP id 5b1f17b1804b1-429ed7b8a14mr79240765e9.20.1724061018844;
        Mon, 19 Aug 2024 02:50:18 -0700 (PDT)
Received: from [192.168.0.118] (h-185-57-5-67.na.cust.bahnhof.fi. [185.57.5.67])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-429ded299a9sm156030495e9.18.2024.08.19.02.50.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Aug 2024 02:50:18 -0700 (PDT)
Message-ID: <3adfebc0-75df-40a3-9a8f-6b8bd12bb725@gmail.com>
Date: Mon, 19 Aug 2024 12:50:16 +0300
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Automated-testing] KCIDB: Support non-binary test outputs V3
From: Nikolai Kondrashov <spbnick@gmail.com>
To: syzkaller <syzkaller@googlegroups.com>, Dmitry Vyukov
 <dvyukov@google.com>, Vishal Bhoj <vishal.bhoj@linaro.org>,
 Alice Ferrazzi <alicef@gentoo.org>,
 automated-testing@lists.yoctoproject.org,
 Cristian Marussi <cristian.marussi@arm.com>, Tim Bird <Tim.Bird@sony.com>,
 Johnson George <Johnson.George@microsoft.com>,
 Veronika Kabatova <vkabatov@redhat.com>,
 "kernelci@lists.linux.dev" <kernelci@lists.linux.dev>,
 Don Zickus <dzickus@redhat.com>, Mark Brown <broonie@kernel.org>,
 Philip Li <philip.li@intel.com>, Denys Fedoryshchenko
 <denys.f@collabora.com>, Michael Hofmann <mhofmann@redhat.com>,
 Tales da Aparecida <tdaapare@redhat.com>,
 Aditya Nagesh <adityanagesh@microsoft.com>,
 Jeny Dhruvit Sheth <jeny.sadadia@collabora.com>,
 Sachin Sant <sachinp@linux.ibm.com>, "Hambardzumyan, Minas" <minas@ti.com>
References: <5188d6fe-bd01-402b-a6e6-0fe57ef4d336@gmail.com>
 <bf0befaa-e23e-43f0-996b-d095b7390122@gmail.com>
 <c66e960b-0a43-45fd-8220-82a91b0b8523@gmail.com>
 <944bf5c2-6914-4c28-86d9-6dbbab450363@gmail.com>
Content-Language: en-US
In-Reply-To: <944bf5c2-6914-4c28-86d9-6dbbab450363@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 8/16/24 5:05 PM, Nikolai Kondrashov wrote:
> Aaand, redone again:
> 
> https://github.com/kernelci/kcidb-io/pull/85/commits/86b75f6bf6e4f74e594a301382f2b77cfe4cbbd9
> 
> I switched the value from integer to floating-point, as that allows us to get
> rid of the exponent field, at the cost of a small accuracy loss. The storage
> requirements are still 64 bits.

If there are no more objections, I'm going to merge this on Wednesday, Aug 21.

I have three more additions to the schema in the pipeline, sending them soon.

Nick
