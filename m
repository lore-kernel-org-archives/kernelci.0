Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4589B16EC13
	for <kernelci@lists.linux.dev>; Wed, 12 Jun 2024 17:27:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718213256; cv=none; b=Z1HMcVDl+gusJRiIc3tSkFGBlfJJzNswYZOCdPQ3fRiHZGI3Icp1kUMwH0mD7EJ0PuC4r6Ovq/Bvk/nsckakupoyUls28RCFwTG/XmSaQo/2vJ2bryRsr41FaVNWC8ze4RDyQWPJvS927NRVhQr13c2G7qlXaU86bdveOUGL/cE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718213256; c=relaxed/simple;
	bh=wHQC9KBBjm+rHZ64K7OdCSmulJ5Y5TjaOI7hIf3T4wM=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=DUmZOV+IzMvfY/z38MfuvipL33TLz9tlBjWHzLhRD1+6YqlCXJslV0Z9QUe4mASC6fHcmCIJsIsycgAWHX78Q3zNsR4Jf/8zUOACRx93WnkYJBs8dUETPK28JKn/sKpHGeNKYYCG3V+KsT6KFQAvr4BakXo7HYJIdmZ5TxppaJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=HOr5ivhD; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="HOr5ivhD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1718213253;
	bh=wHQC9KBBjm+rHZ64K7OdCSmulJ5Y5TjaOI7hIf3T4wM=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=HOr5ivhD0f9AvcOE1RlO2Ufg+Mok/t0i5EeQtCDAzmawW+7HdZQwZJniaVDV4laI3
	 uiub0egiYkS2C0MX9AH+0JgPPFunUuFb7MIjVB8Xbatih8M9FDcBWYsMyqknzwqVIO
	 HHEKR2Ebfy1Mi6TqREU6W/F6QBUjiirBWW/PG1mL0oBr9dXIr6hi6AbPVtBy8zkMjv
	 TC6l5QRRoMweQtCniQbelucXIq99R1G8ZjBwW9hz8m/7asGBWZo0naeT69Yfgn4Mhp
	 g1jkTuuL0GnI2yUkIaW25CFZeH8uBJ0RYBWe+UQiIY80Ox5WDUQ9KY6CiKa8UCeWwK
	 G5OtcSLt0YOwQ==
Received: from [100.118.151.62] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: padovan)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 31BE63781139;
	Wed, 12 Jun 2024 17:27:31 +0000 (UTC)
Message-ID: <aba91233-6a98-a69c-0f27-955954e9e33d@collabora.com>
Date: Wed, 12 Jun 2024 14:27:27 -0300
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [kernelci-tsc] New name for new "KernelCI"
Content-Language: en-US
To: Nikolai Kondrashov <spbnick@gmail.com>, kernelci-tsc@groups.io,
 "kernelci@lists.linux.dev" <kernelci@lists.linux.dev>
References: <b51eab8a-41cd-4439-8434-076d09b60ed4@gmail.com>
 <17D6135FD5E0FC8F.2477@groups.io>
 <7f9eca2b-e2e5-4288-a9c4-bd8be09f33fa@gmail.com>
From: Gustavo Padovan <gus@collabora.com>
In-Reply-To: <7f9eca2b-e2e5-4288-a9c4-bd8be09f33fa@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


Hello,

On 6/12/24 11:56, Nikolai Kondrashov wrote:
> On 6/5/24 12:00 PM, Nikolai Kondrashov via groups.io wrote:
>> On 5/23/24 6:54 PM, Nikolai Kondrashov wrote:
>>> As you know, we've been developing the new KernelCI API [1], and the
>>> kernelci-pipeline [2] based on it, for quite a while.
>>>
>>> However, by now it seems that too many things are being called "KernelCI": the
>>> project, pieces of the old system, pieces of the new system. We would also
>>> like to give the name of KernelCI the project a wider scope than just a
>>> particular CI system, and accommodate more packages/projects under its name.
>>>
>>> So we would like to propose to call the new system "KernelCI <Something>".
>>>
>>> And this message is about that "<Something>".
>> Almost two weeks have passed from my original message, and we have collected a
>> number of opinions and potential names. So I went ahead and created a poll to
>> help us pick the new name:
>>
>> https://forms.gle/GY2uWw3yGLA6u5EbA
>>
>> The poll requires authenticating to Google to limit the number of votes, but
>> if anyone has a problem with that, just post your response here (pick all the
>> options you like), and I'll add it myself. We'll close the poll in a week.
> The week has passed, and the poll is now closed. We've collected ten
> responses. An the clear winner is:
>
>      "Maestro"

Nice. So here comes Maestro!  This is a great step to clarify the new 
architecture.
We should first patch that in the documentation together with the 
overdue update
on the overall KernelCI architecture. I can look into a patch for that 
next week.

Now, when it comes to actually renaming the git repos and other things 
we want
to evaluate a proposal to bring kernelci-core, kernelci-api and 
kernelci-pipeline into
a monorepo kci-maestro. But that would be post Plumbers possibly as our 
focus is
super sharper on showing the new KernelCI there.

I guess we should also start tagging the maestro data in KernelCI as 
'kci-maestro' or
something like that and not 'kernelci' anymore. Jeny, thoughts on this?

Best,

- Gus

-- 
Gustavo Padovan
Kernel Lead

Collabora Ltd.
Platinum Building, St John's Innovation Park
Cambridge CB4 0DS, UK
Registered in England & Wales, no. 5513718

