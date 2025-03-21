Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AD187082A
	for <kernelci@lists.linux.dev>; Fri, 21 Mar 2025 12:57:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742561846; cv=none; b=ZT0JyC2PAnBwSf/4aNKPp+pqzzj0UaADizTsTM01uucyI0L7IBuP5sen3+Q/srmYtn5vkXpW57fVTFrJ9BrgeRP9xq9c0TLODYZcHG3b07ZtM5mlqnOKPJUykIgOzpFX/iorPNoEEE1MqASK8ST2tVu04Kmagw8pEU+7h7bY0VI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742561846; c=relaxed/simple;
	bh=HM3Nkdo6O6lDo/jC2lN/FrAIefd8gxGrifiLYKFz2kY=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=lUwrDRKhMOKIoBzXPesGCAKPOlkAT8pchq9f8uOWbSQ6AbvN7hERmIfeAlYopOghItHzkJGdWRYmB8FaDf3WMC/iCOHGmUtiYrupMrlAfq5LYotIv8nuYF3VSSjrk4H/r/nXdu3tOHT9hpCDrVLAYBYk9RbK3Uzv5ej22ur2YfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lmcmx4LT; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lmcmx4LT"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43690d4605dso13166165e9.0
        for <kernelci@lists.linux.dev>; Fri, 21 Mar 2025 05:57:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742561843; x=1743166643; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :to:from:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TpWiHMBRJ66TF5OU+jEzdeo77vCUNHDpaX+tfDOFszU=;
        b=lmcmx4LToJrdqktNZnsObBQkI+icvrHpTlAoVsv44HV2yBa858x8CwqY1/6Kjes9sD
         88CLWxYhFX8oEL5aJDQJkdAZxRUtuMhnKJLf11gfoZB03HSPdJak+oD+dUEkTMaiUKHi
         vUp3WGu+tB9+Xi+iyQ6mRaiZODZs4K2tkltp9IQJ6N5Kh8dahqQlK068GxMg4t6w5/7S
         T0x33ZhYP5YUBpBO6DlllCaqTmbS9tnTMBpzQV4mZen6xGk0YyVSXp0Ab2cqEZN2ydok
         tuHujQ7vbPT9cNljfU6cj7NN4koFlkwWg7l+hBcK+iWb+bnjrGIxMXo6FstGH1o9SMam
         VTwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742561843; x=1743166643;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TpWiHMBRJ66TF5OU+jEzdeo77vCUNHDpaX+tfDOFszU=;
        b=wCUrXJVWQRd4Rj22pwjAOP6TC15GKrjcq/tEuKuhRayQoPFlupm7GKr2Sgrzx30Umw
         6fmF2pn8K7v+3YaYsGvEsjaOJwbQaPmN9sNLdm2m4eW8Bljli2U0eO2fPx7O2QGlzatR
         coDQZvO2fVUhdxmtvcYSGYRXQhMT19M9Q2Jn3X6y/8bDIGK8i0vtaY9jb9Sc69BYNJpF
         W2B/6H2o0M15vq5+QqAnWEaMLNE2+QVlRrT9sqX0b1MWbnTlWdaOb3M80KBVf+x0/rG4
         W29e8M43frPoUn69pJwCC2cpwv/CtX9AHZwp6BhBuXltIDkRIuEUwzhGOjPhPxikQ6Ro
         UUCg==
X-Forwarded-Encrypted: i=1; AJvYcCWu2iR7HesYGzaTDbVCHfM+B8TIqBXi79/bSbNANsw71oAA1GPMEvqEIGpNAzeqaoiUB/bRyFNILg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz4Q6K7lNiY/5LARrue3TZJkpSicJxCy816mAGPe672GhIPejvQ
	ntD8OvmrHVpjm0WQqDp/TJw5Z7F3bcpkUVK+acO707r1OcS6fSjl
X-Gm-Gg: ASbGnctN/rv8nm7L6cl0KUpHvIvdpfWVlQqmASB6NXTUPQlACy+C/C2iRvAYogefDIb
	0vL48Aw6PWvDh+V73y0H0VPQbjOkEQ5uCg1pVbFQ8jNfYYOpQTmFGvDtXNgVgqBS6qfbXLe5NAP
	QTAXwONVUKFGYTpg3c8anw4sdmCIPR19l+ysFDUsqKZqIcBCrzj0cYQkYESoW6beivgdJOCHXni
	WqKu0PyHCU/XY1xGAraH7/spMlje1DgWr4hldzKCmUdqXZcJv3+u+ruUoIOkwaXReus96w4TveO
	1n/2elv+iihea/6QjlwMSlMnf3RZhfnUWV8AQDgLEVlMe2LuCNKdQRWj8egWbFjV5inoKCSn17G
	gOSkf
X-Google-Smtp-Source: AGHT+IHkbXVXCj3RzJtmoHzBxlrffmnBEsGs8lV9cQDXvWUtcvZveoPHLkGinjNbC8eaNViK+zaI2g==
X-Received: by 2002:a05:600c:83c4:b0:43c:fffc:7886 with SMTP id 5b1f17b1804b1-43d509ec52fmr27443105e9.8.1742561842915;
        Fri, 21 Mar 2025 05:57:22 -0700 (PDT)
Received: from [192.168.0.167] (h-185-57-5-149.na.cust.bahnhof.fi. [185.57.5.149])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d440ed4d9sm77545505e9.33.2025.03.21.05.57.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Mar 2025 05:57:22 -0700 (PDT)
Message-ID: <7b6a061b-e9a6-4b16-b6c9-3229ca07b5cf@gmail.com>
Date: Fri, 21 Mar 2025 14:57:19 +0200
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: KCIDB: v5.1 - origin's build/test finish timestamps
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
References: <4697ff8f-7d97-4bcc-938f-958662289ba0@gmail.com>
 <be02986c-0aed-4dc0-917f-c945aa20aed6@gmail.com>
Content-Language: en-US
In-Reply-To: <be02986c-0aed-4dc0-917f-c945aa20aed6@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 3/19/25 11:44 AM, Nikolai Kondrashov wrote:
> On 3/14/25 8:21 PM, Nikolai Kondrashov wrote:
>> We would like to add two fields to checkouts: "origin_builds_finish_time" and
>> "origin_tests_finish_time". They're supposed to contain the time the CI system
>> which sent the checkout has finished running the builds/tests it planned for it.
>>
>> As the change is minor and backwards-compatible, I'd like to set the feedback
>> deadline to Wed, Mar 19. If there are no objections by that time, I'll merge
>> this change to the schema and database support on that day.
> 
> This is now merged, thank you everyone for your attention.
> 
> Next I'll be testing and merging the DB support for this.

Support for this is now deployed, and the database is upgraded and ready to
accept v5.1 data, that is the new "origin_builds_finish_time" and
"origin_tests_finish_time" fields.

Nick
