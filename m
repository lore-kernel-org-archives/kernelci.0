Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6AFD183064
	for <kernelci@lists.linux.dev>; Wed, 12 Jun 2024 17:33:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718213601; cv=none; b=tWYlBnncHRQZ8R7+WSlLR6JLpVZVAJLx/zhMDtKH+gTaxBZ1MBu0ITKsCy7hptWu+eiHzkcrDyAfWmHezDJRDOXVfk8ZlB8x0A/0MHWJGp9AcIc6sTuA+pmtUeVP0igVY1EoAHkTNT0FTQMnYcZrg4p4qK6cmX+43z75GjwziTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718213601; c=relaxed/simple;
	bh=vvW0dWDE1QFokf+maCCtfzxT7tjMwq9u+o5S5Cf3k78=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=GlWkI12TmeSSM1CaAvnVE84/laPxsyDOPNHneZtOzPvNYvq2Tlog1kv6dBkmll/EPYIPtDJBne+PdSAmBIHI34zvLuIVJ8+r/82A8GqkuJTAmfXEky0PUj1bZrTSS9lokBdf5OVQr1wTqD8nYZpYHbPYStDkTq7897QchoMvtdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g7pmB4qO; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g7pmB4qO"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a6f04afcce1so20822066b.2
        for <kernelci@lists.linux.dev>; Wed, 12 Jun 2024 10:33:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718213598; x=1718818398; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zcy+ZtpnDZcu7l3Ux6ykCtXUSXJH/ona9MKrKpwLCT8=;
        b=g7pmB4qOAqzcw8HobrpThziaGlAWy3vaOZDXQt8arNyCP1cuO9RyoD3DlGP9igjDVM
         t7yta/g7SLmhJzfN7U5SM+TDrbGICCaC/N8rpvuzuLR/FmdwMHrGkwpmtA2uWJw0k3WQ
         kegTaJGNMjX71qaJ8DuSuR0yhzUUHciNcgk4L4i/eOnjOxu4ExYg1T6rLZYZH4ojXHbJ
         dTL0ymuMoEjVZWF/GTpRhWQNMvgRFNzWUxIKtgT4e9hz2j0jjFkMWcer0rq8VRoYmYT+
         UmZOYUK0E2RiJ0UqSI5IT+nCBYGrLX13EW3WcWUTit1ghykqw9bzVodCkSYuX/SFz3HX
         QyoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718213598; x=1718818398;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zcy+ZtpnDZcu7l3Ux6ykCtXUSXJH/ona9MKrKpwLCT8=;
        b=as5NwtegHcTIhwC67OnzshpuWk7PzC3iMrGO1LqbedR5+MSvNZnXr+BsZ+vF+Hj3f8
         2bA2wB3KXqyPM09hitthpljLV3RvHK8PiNg9JgVD6rxegWj3Cat8hVpFgIhrh5Crfu5Q
         AaPHkAKMx36NG96ZB6q5gccbJrAiZnfcqcO0f4/5HiZXNAnZ0G3VOks9jEofihUfXcpw
         GRYMcbOTUO1LgwSeCOAoqPHZLI55CLi9U9kje5FFEIYdLIImdjhDrQ6aNz5aO/2Tjo2F
         XX4vJHOlSXAbCWT8Vwp4SsdRiPNOCbQvivGiWJpAJIJ+vmRZwRQrfVXDHe+5qWymldlt
         O5Nw==
X-Forwarded-Encrypted: i=1; AJvYcCUgMAIShkm72TX/cEcShvsE5Btlk4gJsvGORFRDhUr0clhc4q+8o86I4i2iqjhATYFZNFLjWG7SRBZGfY8OtkFZqyCnhq76A3g=
X-Gm-Message-State: AOJu0YztBAMo/5jV0w4I3abdua5kai8QbNR+gA/lzXeZNccQXimVfKfp
	hi8/LCanklFTxzHc1MELxw9EXMlzvLJxZ9KfZryfy7E/E1paNPaj
X-Google-Smtp-Source: AGHT+IH6hoFue9V0uOq3cnRoyIUe0X54rdgAweC9dUDvkPlMSUan3QtzwyF2AcRF0z8LrtgT/D15Cg==
X-Received: by 2002:a17:906:5c4:b0:a6f:5150:b809 with SMTP id a640c23a62f3a-a6f5150c335mr50925466b.59.1718213597852;
        Wed, 12 Jun 2024 10:33:17 -0700 (PDT)
Received: from [192.168.58.69] (server.hotelpassage.eu. [88.146.207.194])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6f4d45c78esm60906366b.6.2024.06.12.10.33.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Jun 2024 10:33:17 -0700 (PDT)
Message-ID: <b397fcde-c2ba-443d-aa0d-e9c9d7944030@gmail.com>
Date: Wed, 12 Jun 2024 19:33:16 +0200
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [kernelci-tsc] New name for new "KernelCI"
To: Gustavo Padovan <gus@collabora.com>, kernelci-tsc@groups.io,
 "kernelci@lists.linux.dev" <kernelci@lists.linux.dev>
References: <b51eab8a-41cd-4439-8434-076d09b60ed4@gmail.com>
 <17D6135FD5E0FC8F.2477@groups.io>
 <7f9eca2b-e2e5-4288-a9c4-bd8be09f33fa@gmail.com>
 <aba91233-6a98-a69c-0f27-955954e9e33d@collabora.com>
Content-Language: en-US
From: Nikolai Kondrashov <spbnick@gmail.com>
In-Reply-To: <aba91233-6a98-a69c-0f27-955954e9e33d@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 6/12/24 7:27 PM, Gustavo Padovan wrote:
> 
> Hello,
> 
> On 6/12/24 11:56, Nikolai Kondrashov wrote:
>> On 6/5/24 12:00 PM, Nikolai Kondrashov via groups.io wrote:
>>> On 5/23/24 6:54 PM, Nikolai Kondrashov wrote:
>>>> As you know, we've been developing the new KernelCI API [1], and the
>>>> kernelci-pipeline [2] based on it, for quite a while.
>>>>
>>>> However, by now it seems that too many things are being called "KernelCI":
>>>> the
>>>> project, pieces of the old system, pieces of the new system. We would also
>>>> like to give the name of KernelCI the project a wider scope than just a
>>>> particular CI system, and accommodate more packages/projects under its name.
>>>>
>>>> So we would like to propose to call the new system "KernelCI <Something>".
>>>>
>>>> And this message is about that "<Something>".
>>> Almost two weeks have passed from my original message, and we have collected a
>>> number of opinions and potential names. So I went ahead and created a poll to
>>> help us pick the new name:
>>>
>>> https://forms.gle/GY2uWw3yGLA6u5EbA
>>>
>>> The poll requires authenticating to Google to limit the number of votes, but
>>> if anyone has a problem with that, just post your response here (pick all the
>>> options you like), and I'll add it myself. We'll close the poll in a week.
>> The week has passed, and the poll is now closed. We've collected ten
>> responses. An the clear winner is:
>>
>>      "Maestro"
> 
> Nice. So here comes Maestro!  This is a great step to clarify the new
> architecture.
> We should first patch that in the documentation together with the overdue update
> on the overall KernelCI architecture. I can look into a patch for that next week.
> 
> Now, when it comes to actually renaming the git repos and other things we want
> to evaluate a proposal to bring kernelci-core, kernelci-api and
> kernelci-pipeline into
> a monorepo kci-maestro. But that would be post Plumbers possibly as our focus is
> super sharper on showing the new KernelCI there.
> 
> I guess we should also start tagging the maestro data in KernelCI as
> 'kci-maestro' or
> something like that and not 'kernelci' anymore. Jeny, thoughts on this?

I'm happy that we got a name, and I quite like it too :D

Let's also go over all this in the weekly tomorrow, and on the TSC calls!

Regarding KCIDB, I think the origin should be simply "maestro", similar to
other origins (like "0day", "tuxsuite", and "cki", not like company names that
we also have).

Nick
