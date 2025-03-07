Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CB511607A4
	for <kernelci@lists.linux.dev>; Fri,  7 Mar 2025 16:37:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741365466; cv=none; b=KwPBTCNvPPt7Y7e8jSFY1jD0Yzw3SHI0a0tQ9fVotQlf4vIOSKWRpacCM3GOmIRGRuuQglh9/sXFsqqpRo1LgwDQIldKO32uymjMF1fwktdTTc/rGij9Fn/A/eBXFqEn4sl4nq0JX+9vO52HBPZ3LlambKiVq+2HiNH8o41ImWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741365466; c=relaxed/simple;
	bh=Zz7+WecWW0qE2ULgLjq0Ur2YCbM1tJErolKHT9Qoego=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=bZOq+8xIlHDc0T93A9HO3X4/0NsTtCmh+nTXctKIMs0YYlrtkBtiWGmln7ej+lQozb+ezEht9VtN/zxKvfpvmt+Jt/t5DAreCu5qv6FS0So39h3UQaCjkYxDXjPDuTh2ZV51E52odDMcCW52JVgvALuUjl5aOFXMaEEEhCLge3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NdgHId7e; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NdgHId7e"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4394a0c65fcso24192585e9.1
        for <kernelci@lists.linux.dev>; Fri, 07 Mar 2025 08:37:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741365462; x=1741970262; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :to:from:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1Bs+eXTATmGptgBskFljvOL1CcuUh73h9Vzxe/l4Ars=;
        b=NdgHId7eUKa4VzTNNMEhFj/YffClFGl+/HDUD8jq+EPTxjMEqXkq/b277J/fLOw0oq
         sKcPoD0N1pl2WMvP9MR3sQrgNsWIGH/nIBxp+LUbHRrSSODZ0hXSh583aW07taZkz+X8
         TxDVqeguDmtOVO+XCdF3uHsc+P3MDpTpqp9TIofR3Q6u+50b0ySdm5sJtbQlQYnd+gdg
         RXrEdv6ednBcnaSd30BWXsXJ0u8bxiZmx9BrpqgRa7B0zyqxlke/hRl++v/T7V6Ooq/g
         Xda+wxAVjRDvWxNksnY/ePctFW3wvqSijX7cNDDjPrG/5AYRMrGWbKyyAE1LykIFnAsP
         r8gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741365462; x=1741970262;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1Bs+eXTATmGptgBskFljvOL1CcuUh73h9Vzxe/l4Ars=;
        b=VN5vwz3Y9+NIOvaUnb8niRa4N2e7iQ0fOjplQ9QIeVnQBXyMSL2l4rl/lxtR1zF6Nl
         bCIioZza+nVH+NISSH78Y292lltoWJGY39XKDABCCmARYqZXHW3o56iqKqWA+4LaDNc4
         IGVCRr/rSieyec3EgEtAmdb+sACzCzRbKgjUdmMhvOKR7h1qk80wdymy7noFUcks3bre
         hocQTk2H32ngpWxiafkaOUO+WjTKWR+rVDiZJCqBu1emjPlC9D4Ac1EtLlP4BxWDR2ah
         Gz3i/3Zgf6ZkHYw7IJo1Y2YOrmJjuD+hpI7T1Xij6BIQppKjM79sFhS3lL4GywdELpsp
         zCwg==
X-Forwarded-Encrypted: i=1; AJvYcCXez4LSCiKA3q4RkBQGeXfTbkly8vUmX9t0Joa0TlZdoz+8Z8sKBQb/FBmHslkEy/OfREJvUpF/gA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxm6oBGhYJZ7d/beniz+QTurxnvdEeNC1xApNBS/8n0x/DiZMvQ
	2dP6Cc/XYOXaIpRkYFeqRLznmzFeQPcbjaSX43sHpP9WQopoLFIN
X-Gm-Gg: ASbGncs7/wF5kivT1QcvrK+23gpMbLYzgg2GDmkjq1Z95OHKoyoriON8J0PgVACopmx
	djwZZGmXo6/uwq53QabG2EIul4Q/9UNek2ekWOwSzpnZETwFmwCbGnw24Bpe6ZFtIBsyhn2GW3O
	BCZK45XOstaCyvwLgUE9jCViiKGwelHt8fc1bwE09UovurN2ryk9aCjL+YEYuvJP5iAYhewlwcc
	PtCNJxb2WeymUmV+tRsqjluA7t7vcti7Cn0QNejlyxB4GML4cWPCghHOBvAdNs9MBeqODS/F2mb
	LjUeV82R/oYCYeylnq/uZHJKZHjLJgnsw2fdxnWJCBfIW5AeNirKgTM/EbiAAEg26Vv2EW1k5FX
	sGwkz
X-Google-Smtp-Source: AGHT+IFLAueJyqa7dgxcL+ul+fHWwg/9J9nKs3yjqN0uawoEUTm02a8V6ofgj6YPTVEQEMqJ5ktRMw==
X-Received: by 2002:a05:600c:1c92:b0:43b:cb74:2c0c with SMTP id 5b1f17b1804b1-43c54a13724mr45138625e9.0.1741365462067;
        Fri, 07 Mar 2025 08:37:42 -0800 (PST)
Received: from [192.168.0.167] (h-185-57-5-149.na.cust.bahnhof.fi. [185.57.5.149])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3912bfdfca1sm5721934f8f.22.2025.03.07.08.37.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Mar 2025 08:37:41 -0800 (PST)
Message-ID: <62caecef-1cf6-4a3d-a223-f67d2e8af617@gmail.com>
Date: Fri, 7 Mar 2025 18:37:39 +0200
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
 <dvyukov@google.com>, Vishal Bhoj <vishal.bhoj@linaro.org>,
 Alice Ferrazzi <alicef@gentoo.org>,
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
Content-Language: en-US
In-Reply-To: <87b2306a-4110-4032-956b-d0a6db8e3aca@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2/27/25 8:32 PM, Nikolai Kondrashov wrote:
> Hello again, everyone (potentially) involved with sending data to KCIDB,
> 
> We've accumulated a bunch of schema change needs, which would break backwards
> compatibility, and so it's time for another major update: v5.0.
> 
> First, here's the kcidb-io PR: https://github.com/kernelci/kcidb-io/pull/95
> 
> This will be followed by a DB/ORM update, once we agree on something. I'll go
> over each proposed change below, linking to corresponding commits in the PR so
> far. Please review and respond if you have any objections, comments or
> requests (here, or in the PR).
> 
> I'll merge this next Friday, March 7, if there are no objections by that time.

Alright, this is now merged into kcidb-io.

I'm finishing up the DB support for the new schema, but now that I have to run
migration tests, each BigQuery load job gets stuck several minutes in Google
queues, so I might not be able to finish testing today. Hopefully they fix the
problem and the DB support will be merged beginning next week. After the
Dashboard folks give a go-ahead, I'll upgrade the database, and the data with
the new schema will start getting accepted.

Nick
