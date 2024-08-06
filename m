Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CFC5165F06
	for <kernelci@lists.linux.dev>; Tue,  6 Aug 2024 10:06:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722938765; cv=none; b=CDXuDUOER/zZ1WFdhOYiBAo9FQkEMBiG+/KZvbf4AN0Dn/BXQTrU+aLKKBdSPk9xUQnjH1Bpxo9W5t/QT/BxpATZvFpOlxbsIICBldlcgzelMyCWpZpLdMYucpwCdjVdMnT3b/SZFPs2XGjBdlsV2f30TVdZkaTZ7FBQCOCwNTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722938765; c=relaxed/simple;
	bh=6wLdPdjVTnE5BKeuvTnFzDV/ahWhP+i4BLUzs43RQP4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XDZuVp9cwCGHdtzWG5w8oQkR4EWflUwrYud56G936/liw+gWfRYFzMNEKQsEOhk0DNGAt2V2YKQkIE+hL5QIOraei2Au02vGpU0pndYhM71uuvJvNHqiuKw5ZEiy0pbHUyS6IbpZOwjOgWetShehG0iwJFsIasMmyhydY2YpsGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O8vvUKJT; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O8vvUKJT"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-52f04b3cb33so1056224e87.0
        for <kernelci@lists.linux.dev>; Tue, 06 Aug 2024 03:06:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722938761; x=1723543561; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5QNaDAXG0g2qLbnDUsvzvA1vGS/rRXAAPv81Ro4R3Dc=;
        b=O8vvUKJT1rKJojvGCI6CudAYU8oaZQpd8/tmS0EMkP8NRvWcJCuBtaHFEVQT8/NxAy
         l9xYKHeSXBBSBpZEN0mw3GdDo7qWdyZjR9ViZtVy+GAqvZAe32xU/BEl3jGokkDMPXde
         9/UV5drAkhZh0aE7FujNMGktrSbRcpsK7iW06i0G8kLlRBOKME4G8RtfSH6lTlbhU3oX
         Gw/qT5AEabxaR2U/qba+t904nslqlkSVMHlefZT/3T79H4x3hGrBNmm+sKmn13A9aKn7
         RWppgvSw2hzerD0XV7qcBDBuoJd1PtmhGx/5sqbvH5a29biUpHKcg3+tuqBCJj3JfVyT
         NQFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722938761; x=1723543561;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5QNaDAXG0g2qLbnDUsvzvA1vGS/rRXAAPv81Ro4R3Dc=;
        b=FgN1QqY7r04u6YRlSN7MnTxzoDKsIi/TDZFgLEzv+MzhqUhQjChwPzxFPJjdwrFjKf
         7Kx93/2T52j1Jk9ZEq+oOilGi9cSrYoU5j0xiAbz5uWZ93R1eEOwrnKH66k4W6+/J+et
         fXmTIajWmpI7d0QoohkdbGKqrqg6BHpqIppoECfGka047AnKypvOfEbxgxD8YrRnbePe
         KDZE/W2tvkER6LN7veCcx1ZCOxMwkj4zxMcT3cDc7pqIhIbPaA0DHnw0Y4PM15Vi4Nsn
         gmuiUyeQOfoAslBGvx8ntVQifbQivT9rmjXqahkQnJ8JUd77zKXHhCzUnDjNHXA/F/AC
         QCgA==
X-Forwarded-Encrypted: i=1; AJvYcCV01HFilCk3uDnQgWGVaGjDEjxguJfgBlfhIQunDOE04qXHEwkzS9LZV94G2H82+OMJkpPkwFZyFxA8HtB74+ZUq4lFCY3m+to=
X-Gm-Message-State: AOJu0Yxz2NW4ohfr/jjEpW6/Aot39DXXyBQDcB1GSTK97rCrRhVvUDRE
	8Cg/YsHhO3HjqqRwVYArZMtkASoKRODBuaq8QfTQteznQpoaGe9K
X-Google-Smtp-Source: AGHT+IGfejmziZpBCuW4KQwq3ih0/W5wmzkDzFKoLoo44K8CaIkp2dDHw/gfefD0uzrEkUayyiLNFw==
X-Received: by 2002:a05:6512:3d08:b0:52c:dcdc:f186 with SMTP id 2adb3069b0e04-530bb38cab6mr11091916e87.27.1722938761198;
        Tue, 06 Aug 2024 03:06:01 -0700 (PDT)
Received: from [192.168.0.118] (h-185-57-5-67.na.cust.bahnhof.fi. [185.57.5.67])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-530ce72a2bbsm736926e87.282.2024.08.06.03.06.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Aug 2024 03:06:00 -0700 (PDT)
Message-ID: <e3f0fbd1-34f2-4b0b-b1f1-6158b6773dab@gmail.com>
Date: Tue, 6 Aug 2024 13:06:00 +0300
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: KernelCI report for stable-rc: v5.15.164
To: kernelci-results-staging@groups.io,
 Jeny Sheth <jeny.sadadia@collabora.com>
Cc: bot <bot@kernelci.org>, "shreeya.patel" <shreeya.patel@collabora.com>,
 "kernelci@lists.linux.dev" <kernelci@lists.linux.dev>
References: <66ae1e21.050a0220.1c5959.0148@mx.google.com>
 <1911838cd2e.ddb71f5356531.3914011082698955929@collabora.com>
 <19122d7a43d.dde9a53983019.6953377593724593632@collabora.com>
 <19122fc3d66.11f5a856693778.1637642610124539898@collabora.com>
 <17E91B8D1664855A.28314@groups.io>
Content-Language: en-US
From: Nikolai Kondrashov <spbnick@gmail.com>
In-Reply-To: <17E91B8D1664855A.28314@groups.io>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 8/6/24 1:03 PM, Nikolai Kondrashov via groups.io wrote:
> On 8/5/24 5:40 PM, Gustavo Padovan via groups.io wrote:
>>  > > Why does this have kernelci, syzbot and tuxsuite. Let's remove it for now.
>>  >
>>  > It lists all the CI systems the report has been aggregated with. Although
> only maestro and broonie reported failures, we included
>>  > builds and test stats from all the 5 CI systems.
>>
>> I see.  Although, we can't really guarantee the quality of data coming from
>> the other origins, hence my request to use only maestro and broonie for the
>> time being. We need a high quality report, not a report with as much results
>> as possible.
>
> This is alright for a PoC. However, I'd like you guys to mention to Greg that
> we have more data from other origins, when you engage him with this, and that
> they're available on the dashboards. Or perhaps better just put that into the
> notification message itself.
>
> Finally, as we've discussed before, if a maintainer has requirements for
> particular result quality, it's best to directly apply them to data, where
> possible (e.g. check that log_excerpt is there), instead of simply selecting
> origins. That could be the next step, once we define what "good quality"
> means exactly.

This is what all the CI systems signed up for, after all: reaching out to
maintainers. And we would be breaking our promise, if we make these decisions
for them, or discriminate by origin.

Nick
