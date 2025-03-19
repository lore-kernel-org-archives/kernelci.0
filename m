Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DC0D256C7F
	for <kernelci@lists.linux.dev>; Wed, 19 Mar 2025 09:44:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742377479; cv=none; b=HeU/KHMzqZhw5vGOKe/gWOieGo+6tUBa+ZSWtzAlycGCzLkmO1FX0neT58g33JuTtPORRwf2wopB3qsIZzJZnOLBQr7+Q4UBpmm5VZUJAyuGVQ1JFy9fFTyv8ANF+HcZCAQUKUOydnvJAGdc39RQ9RK9/pOX83JOQT52KOC6ajQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742377479; c=relaxed/simple;
	bh=RaPm6BgmxfTrOQmW62CGd+n/puhOv6w2B/g3WQXg6SU=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=i0AIT7CQBa1FzBeBccmem+TpzZ+8qJZc9BX5rQLxU3YXbD0TQpVgaghQ8oIvcaSwKLox1uY9T96RGqpHK8A5Cv2sO8nVqZWawyyuMpXHrB8FrYLmFgzrd/XB8cPhikKU7Fs4BbEROtpooH6uqZOU8Tk36VeEwp37ytJ2GkmEL2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HpVpbPVZ; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HpVpbPVZ"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-43cf034d4abso45402365e9.3
        for <kernelci@lists.linux.dev>; Wed, 19 Mar 2025 02:44:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742377476; x=1742982276; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :to:from:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8QaFa0g6Z3TK3RSWLn952VM3zgME48Ebr7DEQOmcf4c=;
        b=HpVpbPVZ+LeZSXNGUL+2PvCHbgiXZUB3Bv6rICgDvI0n3wrcMIYrSFU0aAm2wfP56T
         CgUpvl6cAXtaAGtZHsKdJy4iUPhaeAsOqcRplBQ5gq27NPklSMZ1H9fmcA0fMKASWIYz
         +YgvFslrZpBZ0p2QgNqAk5OHCUDYZhCviH9K+Idc0N354LCoygbynpQTPGRFfEzS5ZG3
         Eo6+9wO+pS++v0+f/ikQCPmyC5qPpip8kAbD66jr5VqRkao2VJS40Z+bXubGT0BYYcD4
         5wlBOWq2admE1XBSXo/I8+ydsqTqu6x0Eneh1OaZchannLL8ijR8+GkuDzTth+7ehpCA
         /hLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742377476; x=1742982276;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8QaFa0g6Z3TK3RSWLn952VM3zgME48Ebr7DEQOmcf4c=;
        b=g1HZzpS7eSgdV7uSkuHT054PHIvgK4+o608n9o+N9R2G+N+Zy+nrPtgxqMhpNNb4tJ
         QY00LZdp+YW69lKLMVfYbJToBur6r0H8KqBtoth8nJ4TcWdPVfT29L2Apybq8Mxmp14I
         lkzPHD/0SADDItmShVHsQwkCqYSYRWcOz0CzJt7zqp758bDSWU7fYbJJKSmO4A3gWYTo
         GTzhDta70+6V+NHFr872lfusePJJxu8Y4b+Rk6PrDd2HADx7/9IEsuyBzmqGHExcSq4R
         tLG3NFFPJ+5x/XiSZzU0jMoJYSisOqmROl0Usgak9w9fu3SNZK4ajJFVChJxPCHr81jK
         RQUg==
X-Forwarded-Encrypted: i=1; AJvYcCVltyLsyE7KwfftR+Tm2tbGYQvSuuhXBVBLhh+6uOgL2O7KGunX/BGMItnAt/EBm+h3IogX3QOejg==@lists.linux.dev
X-Gm-Message-State: AOJu0YyhEXB3/LLqzAOLkIJHtrjMOErPxaMR1Lc+x+l5gLxiyAMagb91
	lIMviLTvwCF86eE5UDjhBsniSfupXSgL98yHPFv7nOqmE74CrVk3
X-Gm-Gg: ASbGncu+kn+UjPyFutQ6Jf4OUtGxYV2wkJkASNVbY+8t28i7zWw3FtPAsZMbIBFoyFQ
	PQCvP7RSMIo4PKs5HLvHhAq8ylq2dyOLS7quBBmyzKGGq3romUdVQ3FYN6k9GJ5WxCuZZ7J/VXL
	/j3ukXKIp6wL9jq9Hp+1VddP1rZO4YQTCBpFc3ON0Ixp2ClP8bcc17tyOIjRz+WHOrfQmrwVuCe
	Iy/rQWmVfr7vgcBrb8oMAHeGQ+QAUFa4fhTiUSFqOFYfg9D4nJInvAAPCU3Zqx57EcnbKDW+uzJ
	FO1mq3Ca3YQ2JmSy3CSuCPHnzqmpHBSZidAVSsjq1wH6kKiy38MBTxyJzhr54htODcFy9fjErdA
	oyRRk
X-Google-Smtp-Source: AGHT+IEDmg74Jzjt7dI6K84Aj4/SiB10RP5CQGctdAUhuSiVRWDmJKE5zwwzP60eWMou7Uordlj2vg==
X-Received: by 2002:a05:600c:548d:b0:43c:ec28:d310 with SMTP id 5b1f17b1804b1-43d43798880mr18729955e9.10.1742377475585;
        Wed, 19 Mar 2025 02:44:35 -0700 (PDT)
Received: from [192.168.0.167] (h-185-57-5-149.na.cust.bahnhof.fi. [185.57.5.149])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d440ed4cbsm13474055e9.34.2025.03.19.02.44.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Mar 2025 02:44:35 -0700 (PDT)
Message-ID: <be02986c-0aed-4dc0-917f-c945aa20aed6@gmail.com>
Date: Wed, 19 Mar 2025 11:44:33 +0200
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
References: <4697ff8f-7d97-4bcc-938f-958662289ba0@gmail.com>
Content-Language: en-US
In-Reply-To: <4697ff8f-7d97-4bcc-938f-958662289ba0@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 3/14/25 8:21 PM, Nikolai Kondrashov wrote:
> We would like to add two fields to checkouts: "origin_builds_finish_time" and
> "origin_tests_finish_time". They're supposed to contain the time the CI system
> which sent the checkout has finished running the builds/tests it planned for it.
> 
> As the change is minor and backwards-compatible, I'd like to set the feedback
> deadline to Wed, Mar 19. If there are no objections by that time, I'll merge
> this change to the schema and database support on that day.

This is now merged, thank you everyone for your attention.

Next I'll be testing and merging the DB support for this.

Nick
