Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0822A12F5A3
	for <kernelci@lists.linux.dev>; Fri, 17 May 2024 16:57:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715965067; cv=none; b=BS00S08QPyfltRxHKPTtY7qMQwTt9sx9ewhOONR39fEIDww5pkw+6nvg98hLlkvZx3gshswcNFgtnzCHNgpILRtU1vGvqiZCVagmt7XgOH6snN1QAACESU/tS7q6Hjn82t1xN05eN8Z0G1nwfxQIhA3iRbmqLbiQ8UtH0yaF4yw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715965067; c=relaxed/simple;
	bh=LEY5VGL64XLykJjGC7+h3BFznP3m6EZLy+Nk/zxBPY8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TocvN/Jgqong1I27vy5pgMxpAICW0u4oPDMhreDY+suI8rcsu2dPAttHiOyK9Dg+xYUbnbYsxLIZS4EhNbHwEuAQF2jh2RvtJR/KPMr/hTaOzOdyRsIrtr3KT5N2j1zTAHWrKbFge0knRFJGUTanctDEHMIxlnXnre04TGyrR9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=cMyQcnR7; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="cMyQcnR7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1715965064;
	bh=LEY5VGL64XLykJjGC7+h3BFznP3m6EZLy+Nk/zxBPY8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=cMyQcnR7wBfoQfarHfY0T6VG5RoDvC55OVNeHNbyiMGiFL8PxPQW3rtUct26HS33G
	 xA7j//59qhOmSo82iiOkyzZ6ZoPVS89c+jRzbzynsRqT8Bszo877SQ4MMopV9z6Y/F
	 7OusygNGjnlUS8fWGn3hKrpzDYHDMU2e1ILCHatuj8CO/V8TU4PpXr2oviZaof3GTM
	 DiHx++QS5fkPU2HsPtiEMJL6Q0r8kXGybKi6E/sV06XZnZuWDuMfdaB74a0pUo+48t
	 akxUEew/7ZESVRkskU9sQfcDhMizGjhlhjzkndZKZpZ/gFFjCRJn3JPYjuV+K0ds0N
	 bcZkSXCsT3u+w==
Received: from [100.118.151.62] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: padovan)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 638A03780627;
	Fri, 17 May 2024 16:57:43 +0000 (UTC)
Message-ID: <8edccc0b-d71a-b6ec-392f-3946f768db05@collabora.com>
Date: Fri, 17 May 2024 12:57:42 -0400
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: linux-media checkout failing for KernelCI
Content-Language: en-US
To: Guenter Roeck <groeck@google.com>
Cc: linuxtv-ci@linuxtv.org,
 "kernelci@lists.linux.dev" <kernelci@lists.linux.dev>,
 Denys Fedoryshchenko <denys.f@collabora.com>
References: <2b1ca3bb-c49a-ce2d-2d86-821dfa6854a4@collabora.com>
 <CABXOdTdhkEADZO2YXM_RPdLooo7Lo9=WqsWS1euXxKqFLE6g9A@mail.gmail.com>
From: Gustavo Padovan <gus@collabora.com>
In-Reply-To: <CABXOdTdhkEADZO2YXM_RPdLooo7Lo9=WqsWS1euXxKqFLE6g9A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 5/17/24 11:29, Guenter Roeck wrote:
> On Fri, May 17, 2024 at 6:41 AM Gustavo Padovan <gus@collabora.com> wrote:
>>
>> Hi Media maintainers,
>>
>> We are struggling to use the media tree, in the same way we usually
>> virtually all other trees in KernelCI. The following commands gives
>> KernelCI a fatal error.
>>
>> git clone git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
>> cd linux
>> git remote add media https://git.linuxtv.org/media_tree.git
>> git remote update media
>> git fetch --tags https://git.linuxtv.org/media_tree.git
> Why not "git fetch --tags media" instead of the last two commands ?
> That is working for me, and it is what I always use when fetching
> remote repositories.

Hmm. Maybe we were just being newbies with the way KernelCI does it. :)

-- 
Gustavo Padovan
Kernel Lead

Collabora Ltd.
Platinum Building, St John's Innovation Park
Cambridge CB4 0DS, UK
Registered in England & Wales, no. 5513718

