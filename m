Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04DCA13777A
	for <kernelci@lists.linux.dev>; Tue,  4 Jun 2024 22:24:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717539891; cv=none; b=m0JE9+XRB3h9dSLtIrE8U0LX1wRFKwj23/+AWSFHFRGiKdE4QBu4p9Ip2W2uXzC0gOGjB1ooWE9lfnSnkD1t2dPAeUX4ZANvbCBNPY0DD/JQnaZL075Wu1Jk6otfhxJv79Ffnj9ifYUOOYd7C+UuMNCZ/a/KngeBmRgVaVQ3BLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717539891; c=relaxed/simple;
	bh=xe/cyd/kM5WZTR5HOyEWVB73XtJV/ZoVzCnHL+oP3zY=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=RASHLYrH7EXtuidSGaZhvDPMIPgQxEZeXlz+K7zRz1mPuEnJnH5d22JixKY9SdR1/Fw7ZXHvoFydwfIu+PCCYl/bXpbByg7tMg7d2FybwvQ9pWedt827/PuUcSqlsWuDicUWxTsaCjFw1VkKKbuiEzuqwCj/mc6DC0R/rjbonfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=1X2HT8mQ; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="1X2HT8mQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1717539888;
	bh=xe/cyd/kM5WZTR5HOyEWVB73XtJV/ZoVzCnHL+oP3zY=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=1X2HT8mQbiQ/FpkPUA03hyUQE9rareSxUg4yq7pSFV0C9adbW9R2e82vej510NQ/Q
	 yokLi2AW77tkA58ksbF6K+c3ZWOP96+eDqv3LTkKXD7gcLxO0SegIlQ5VsJkaVI2eg
	 V9Hh2hc5rUdsuco5F8is0I+zx3SJj1AA2BbUapT14p9TawSn/kF1+WlCT6bul/9c0C
	 YdCLEO6w47gW93rrMO8yVuWWK2l/ccmyAc7uQ7FavcijrjQlW4qTakyXK1MeWnvnFB
	 lIbc9Fe8/BUn+MOmiuiwlTMyF1jayTsHozFP0xs73cw+xUXs3tcSHBJU/uspBoQmXa
	 Mwp/pqPqwxeAA==
Received: from [100.118.151.62] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: padovan)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id AA4333780480;
	Tue,  4 Jun 2024 22:24:47 +0000 (UTC)
Message-ID: <fd3ca485-6126-94ea-dab9-0a0a427ada28@collabora.com>
Date: Tue, 4 Jun 2024 19:24:46 -0300
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [kernelci-tsc] Discord chat trial
Content-Language: en-US
To: kernelci-tsc@groups.io, kernelci@lists.linux.dev
References: <CALu8Fe-jgygjYRz_DWc1z7YLkHdzDZxWWZaQ2idi+XHr9fh05g@mail.gmail.com>
From: Gustavo Padovan <gus@collabora.com>
In-Reply-To: <CALu8Fe-jgygjYRz_DWc1z7YLkHdzDZxWWZaQ2idi+XHr9fh05g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 5/30/24 17:12, Nikolai Kondrashov wrote:
> Hi everyone,
>
> As part of our effort to find a more open, or at least more welcoming 
> replacement for Slack, I created a Discord server for us to try out. 
> The following invite link will be active for seven days:
>
> https://discord.gg/Adk3gPCC
>
> But other ways for joining for everyone will also be available later.

I joined. It seems to offer enough for us to benefit from. It has a lot 
more colors and animations which makes it fun.
We will not find a perfect chat option and Discord seems to be used by a 
bunch of Open Source project already (notably Zephyr has a few thousand 
people there)

Here's an updated invite link as they expire every 7 days: 
https://discord.gg/N2BkPY3U

I am curious to hear more opinions.

Best,

- Gus

-- 

Gustavo Padovan
Kernel Lead

Collabora Ltd.
Platinum Building, St John's Innovation Park
Cambridge CB4 0DS, UK
Registered in England & Wales, no. 5513718

