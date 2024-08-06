Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6BE94AEE0
	for <kernelci@lists.linux.dev>; Tue,  6 Aug 2024 16:32:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722961978; cv=none; b=dRDs+J1Mg9rPtE7LSGBhuWm3j8PChjGGcQG4RztX0jRX4VfvLxEtn15uYoazwAAblIL9RxyiYlsG76Gin6QU/3FiFUZUNnrL8oW+q2hpUaPE86MJXJ9n0qa7Nl11gXbpPVMLtafDcMAG7/pVZZbr3C7s1ki6+gopKMln/ohk2sk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722961978; c=relaxed/simple;
	bh=7zS5XDOHemibHSCVFmEeQEwxJAMt1AI1lLo5rHFlios=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FFqBrWbWQGvgrHsgeDVhVjAwkt8cBxeIlfz5Qug9XxXuSPCXOCcOlDgd1O8U0WfGRsRK9vHAfEY2R2Z7pFX6Va1xAJyDnKVmCqpGtJjZQ0l8a9xYKgPd4sMtLuJIEofyrK1fcNXJaCWw6WYSKCDNuHZU55/b49Nx50QZ6C+Nx7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nILWoKze; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nILWoKze"
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2ef248ab2aeso13979781fa.0
        for <kernelci@lists.linux.dev>; Tue, 06 Aug 2024 09:32:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722961975; x=1723566775; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FtHz/AG0RlbUylFb1GddhMakciuw594VS8DA9OTusng=;
        b=nILWoKzeuR5zgFJYXT62ybFBsaQMZUMTM6RY5zCBADmz7hS1qI7Aaa0Ex46BuDB8dx
         gBrSzfuBXVSvSYM5UiZOvZuuGo16k5alxY2TezPHd/wOfWLFtqIBvWtEa8dmUz6l1RNA
         yt52GbrgcSLznXBTz6leaQfjkzhZmrtL4UDO+R2V6P/3mlpp7w0iHfEVYTLr/YzKZPEY
         YKx+G9Q9soZv40yiFvJ9NSNUXMCyXwwTQXJ8D/hhKT4XgLMUKDHYGugUr9eWoB/dGX83
         8ko+vPviCtZvMb9BmaN6oqp7FOkFLZjDi5Z+u7ZHrbUBIYoaxE4pRGEjpEvs/LCVjTlN
         J4kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722961975; x=1723566775;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FtHz/AG0RlbUylFb1GddhMakciuw594VS8DA9OTusng=;
        b=kA7kL/AaT0UX31a7DAoAYdph/xHoLkCZAZnvRNMr80J7D50JHrHJDgGysc8KmLmAfM
         cVkDrlFkF93n471nMqNFsfoHehhmXy24FIdDhgbWfriSnXEeu2NqykFdg9sqobMPig1I
         td8in8wexUJf/1RWSzNTiL34oGmUXMJ9ZqLom7ZhhmmvMLVr9bOMJYfcSUrMjpUazobT
         g0cALG2UCiYV6eDpl4wU3weBKUFbFtzqlOXOHcodONWyOGPbCcDd7DXNlRU9ron2nXFQ
         NqjqUu5SxRwmwBgjUkiH73+Vg8j8k9dYh7oarMfZrv87G8jQyKhCGNFrx8ly2Hx9bew/
         771A==
X-Forwarded-Encrypted: i=1; AJvYcCVOIpme2UuAbEUEzrFfQsl7+n1hQDlJql9bZFOUYX9zc9FsYR7uGQk4bSRXxC5UJTsNP0SpCDWka+ZNG9HHDym8Nqbp7PWxpqo=
X-Gm-Message-State: AOJu0YypBRQtEGOMiEQlMGqb/r8hH0KLAJbFbJ1J5/gDHqj1/4xR4yCu
	u+7sVSfYOz/c8//y8XCwbZBMUCXcZKiNL7QoNLY+lTn76MDCTCIs
X-Google-Smtp-Source: AGHT+IHoZqhsxBoLbjAlsHjpf62vr0uuReTXGyScfMSWq1pew3oMv8XTNeQm4typMdQf1Aeherev9w==
X-Received: by 2002:a05:651c:cc:b0:2ef:2f9e:dd19 with SMTP id 38308e7fff4ca-2f15aa88a57mr127403371fa.2.1722961974513;
        Tue, 06 Aug 2024 09:32:54 -0700 (PDT)
Received: from [192.168.0.118] (h-185-57-5-67.na.cust.bahnhof.fi. [185.57.5.67])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2f15e250810sm15177251fa.81.2024.08.06.09.32.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Aug 2024 09:32:54 -0700 (PDT)
Message-ID: <d0b5b62d-9f19-468f-810b-6533fb1c23e4@gmail.com>
Date: Tue, 6 Aug 2024 19:32:53 +0300
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: KernelCI report for stable-rc: v5.15.164
To: Gustavo Padovan <gus@collabora.com>
Cc: kernelci-results-staging <kernelci-results-staging@groups.io>,
 Jeny Sheth <jeny.sadadia@collabora.com>, bot <bot@kernelci.org>,
 "shreeya.patel" <shreeya.patel@collabora.com>,
 "kernelci@lists.linux.dev" <kernelci@lists.linux.dev>
References: <66ae1e21.050a0220.1c5959.0148@mx.google.com>
 <1911838cd2e.ddb71f5356531.3914011082698955929@collabora.com>
 <19122d7a43d.dde9a53983019.6953377593724593632@collabora.com>
 <19122fc3d66.11f5a856693778.1637642610124539898@collabora.com>
 <17E91B8D1664855A.28314@groups.io>
 <e3f0fbd1-34f2-4b0b-b1f1-6158b6773dab@gmail.com>
 <191286e9b09.f4f1c6a4526882.2185642814129237428@collabora.com>
Content-Language: en-US
From: Nikolai Kondrashov <spbnick@gmail.com>
In-Reply-To: <191286e9b09.f4f1c6a4526882.2185642814129237428@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 8/6/24 7:03 PM, Gustavo Padovan wrote:
> 
> 
> ---- On Tue, 06 Aug 2024 07:06:00 -0300 Nikolai Kondrashov  wrote ---
> 
>  > On 8/6/24 1:03 PM, Nikolai Kondrashov via groups.io wrote: 
>  > > On 8/5/24 5:40 PM, Gustavo Padovan via groups.io wrote: 
>  > >>  > > Why does this have kernelci, syzbot and tuxsuite. Let's remove it for now. 
>  > >>  > 
>  > >>  > It lists all the CI systems the report has been aggregated with. Although 
>  > > only maestro and broonie reported failures, we included 
>  > >>  > builds and test stats from all the 5 CI systems. 
>  > >> 
>  > >> I see.  Although, we can't really guarantee the quality of data coming from 
>  > >> the other origins, hence my request to use only maestro and broonie for the 
>  > >> time being. We need a high quality report, not a report with as much results 
>  > >> as possible. 
>  > > 
>  > > This is alright for a PoC. However, I'd like you guys to mention to Greg that 
>  > > we have more data from other origins, when you engage him with this, and that 
>  > > they're available on the dashboards. Or perhaps better just put that into the 
>  > > notification message itself. 
>  > > 
>  > > Finally, as we've discussed before, if a maintainer has requirements for 
>  > > particular result quality, it's best to directly apply them to data, where 
>  > > possible (e.g. check that log_excerpt is there), instead of simply selecting 
>  > > origins. That could be the next step, once we define what "good quality" 
>  > > means exactly. 
>  >  
>  > This is what all the CI systems signed up for, after all: reaching out to 
>  > maintainers. And we would be breaking our promise, if we make these decisions 
>  > for them, or discriminate by origin. 
> 
> Not exactly. That would be the perfectionist take.  We are investing a lot in the test
> and results data quality so we can be sure we can be sure we are showing good,
> high quality data to maintainers we are engaging actively. 
> 
> That's exactly the case of the stable-rc report. Greg has said to us already that just
> throwing data at him wouldn't help much. We have to make sure that data can actually 
> help him. This has been our goal since we started the current stable-rc report process
> since LPC. The Collabora team has invested dozens and dozens of ours into evaluating
> and improving the quality of the data.
> 
> In summary, we are not breaking any promises. We can really throw any data we have into
> maintainers and expect that would be helping them.

Sure, but our (KCIDB) job as the "middle man" is to advertise results of all
submitters *equally*, let the maintainers *themselves* decide what's good and
bad for them, implement their requirements, and *also* pass their feedback to
the submitters. *This* is what they expect of us.

We should not be deciding *ourselves* alone what's good and bad for
maintainers (without even specifying actual requirements we're applying), and
not telling the submitters we're ignoring their data, while sending our *own*
to maintainers.

> The Collabora team has invested dozens and dozens of ours into evaluating
> and improving the quality of the data

You can be sure that other CI systems worked hard on this too. Microsoft
results were top-notch when they decided to join. Syzbot results are almost
*perfect*, they're doing a *very* good job. CKI has an *army* of QE looking
after tests. And so on.

I understand the desire and the need to hit the mark first try, and sure, this
is fine for the start, as long as we're clear about what we're actually doing,
and what *other* data is available and being omitted from notifications.

Finally, once again, we should be judging data based on its merits, not on who
sent it. Let's specify what kind of quality we're looking for exactly, and
implement filtering according to these requirements as one of the next steps.

Nick
