Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 925B713666E
	for <kernelci@lists.linux.dev>; Thu, 13 Jun 2024 05:56:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718258165; cv=none; b=f3SqPse9b+sDq0pWCAJiTrmLbA5xVKumHnHkcrQIWv2Mq/q4+UBs0eqL2RrLz3MqsB936Kikn+g6SG58Z6Qj4zctY9GUMBxi9+CcpW7vdSVo3Jee9vIc4tqtTDuTcGzl+mVCHiE2PLbgT71OP97/TOOPbXlG10yuFJWaWx925vA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718258165; c=relaxed/simple;
	bh=Zd3mx7bbLLYI6vqB6RCqv7kyvc0mPgz1gKX0wdUCnAI=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=aV7riQo3UscTF10l+ELRusZsPryxhC3kC1aOVyG2IX/hAqbr+/NrqZvMLC6kw2NwFYzii7hU0c3wWBlXO7vFwiskAN/pDtxYm29pF2IRv6bkQQEkCdN7/QnKFuZnWhpkPpSHKLpxC+WDkUHLyBXdtCipBJkViBjpRXh7Ls6IasU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=kmqSiJ+U; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="kmqSiJ+U"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1718258161;
	bh=Zd3mx7bbLLYI6vqB6RCqv7kyvc0mPgz1gKX0wdUCnAI=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=kmqSiJ+UELkEL9gMRa0DhsA7XYISDiJj5GtWlzIKBiFoS2FsPghDW2sSXENtXbzZa
	 p3sAvbfnE0+5J65gEHGZNzBdfIlFEgOS15cME7uis3N1sLAZ9zh3spBngkXTcwLAFn
	 Fq4ik1msHKKNApM4To7UTNepGusGmgOgAFZU1uQqysoMHNIls575QHYUxNwfFrXYaI
	 6ILB7334YFvcME95gJM5Z4Zd0JlJtRuLUxxn0OVf+oIesSjiMdfQn1YiakZsnkdjde
	 abOWwA4pplZ8y9VB2q8vig+Qq1x13/9gpA1kIvjxHLBKDZ9g2qj5h6IcjpwVr7TsKt
	 GuuzK++/cQTgQ==
Received: from [100.97.141.225] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: jenysadadia)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id AA1B937820CD;
	Thu, 13 Jun 2024 05:56:00 +0000 (UTC)
Message-ID: <626e02b6-0b8f-41e9-8950-5307859cf245@collabora.com>
Date: Thu, 13 Jun 2024 11:25:52 +0530
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [kernelci-tsc] New name for new "KernelCI"
To: Nikolai Kondrashov <spbnick@gmail.com>,
 Gustavo Padovan <gus@collabora.com>, kernelci-tsc@groups.io,
 "kernelci@lists.linux.dev" <kernelci@lists.linux.dev>
References: <b51eab8a-41cd-4439-8434-076d09b60ed4@gmail.com>
 <17D6135FD5E0FC8F.2477@groups.io>
 <7f9eca2b-e2e5-4288-a9c4-bd8be09f33fa@gmail.com>
 <aba91233-6a98-a69c-0f27-955954e9e33d@collabora.com>
 <b397fcde-c2ba-443d-aa0d-e9c9d7944030@gmail.com>
Content-Language: en-US
From: Jeny Sheth <jeny.sadadia@collabora.com>
In-Reply-To: <b397fcde-c2ba-443d-aa0d-e9c9d7944030@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hello,


On 12/06/24 11:03 pm, Nikolai Kondrashov wrote:

> On 6/12/24 7:27 PM, Gustavo Padovan wrote:
>> Hello,
>>
>> On 6/12/24 11:56, Nikolai Kondrashov wrote:
>>> On 6/5/24 12:00 PM, Nikolai Kondrashov via groups.io wrote:
>>>> On 5/23/24 6:54 PM, Nikolai Kondrashov wrote:
>>>>> As you know, we've been developing the new KernelCI API [1], and the
>>>>> kernelci-pipeline [2] based on it, for quite a while.
>>>>>
>>>>> However, by now it seems that too many things are being called "KernelCI":
>>>>> the
>>>>> project, pieces of the old system, pieces of the new system. We would also
>>>>> like to give the name of KernelCI the project a wider scope than just a
>>>>> particular CI system, and accommodate more packages/projects under its name.
>>>>>
>>>>> So we would like to propose to call the new system "KernelCI <Something>".
>>>>>
>>>>> And this message is about that "<Something>".
>>>> Almost two weeks have passed from my original message, and we have collected a
>>>> number of opinions and potential names. So I went ahead and created a poll to
>>>> help us pick the new name:
>>>>
>>>> https://forms.gle/GY2uWw3yGLA6u5EbA
>>>>
>>>> The poll requires authenticating to Google to limit the number of votes, but
>>>> if anyone has a problem with that, just post your response here (pick all the
>>>> options you like), and I'll add it myself. We'll close the poll in a week.
>>> The week has passed, and the poll is now closed. We've collected ten
>>> responses. An the clear winner is:
>>>
>>>       "Maestro"
That's nice and as expected.
>> Nice. So here comes Maestro!  This is a great step to clarify the new
>> architecture.
>> We should first patch that in the documentation together with the overdue update
>> on the overall KernelCI architecture. I can look into a patch for that next week.
Sounds good.
>> Now, when it comes to actually renaming the git repos and other things we want
>> to evaluate a proposal to bring kernelci-core, kernelci-api and
>> kernelci-pipeline into
>> a monorepo kci-maestro. But that would be post Plumbers possibly as our focus is
>> super sharper on showing the new KernelCI there.
Wouldn't that be complicated? That way we would be binding all the 3 repos
more closely instead of letting them work as separate entities. Maybe we can
consider renaming the repos to include "maestro" in it?
>> I guess we should also start tagging the maestro data in KernelCI as
>> 'kci-maestro' or
>> something like that and not 'kernelci' anymore. Jeny, thoughts on this?
> I'm happy that we got a name, and I quite like it too :D
>
> Let's also go over all this in the weekly tomorrow, and on the TSC calls!
>
> Regarding KCIDB, I think the origin should be simply "maestro", similar to
> other origins (like "0day", "tuxsuite", and "cki", not like company names that
> we also have).
"kci-meastro" looks more suitable to me than just "maestro" as that
mentions name of the CI system more precisely.
Any particular reason to drop "kci-" from the origin? @Nickolai

Thanks,
Jeny


