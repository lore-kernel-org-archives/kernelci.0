Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4DE32F55
	for <kernelci@lists.linux.dev>; Thu, 13 Jun 2024 12:54:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718283250; cv=none; b=fwWATz1R5VLNwwUSERQ3Ow7+wIsp7jebu3V4ERd+q/4q2h+MGpfaOQRqCZr3sQfmWKvN6MJYpVL6aMntOM/03waoHyDjWU0aqel6ythTlms/LUKmvgHXQV2myEX6OF0OFFJYhU0CSWVDfe775hb67DGnTOlipPl7c2e76BKOgyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718283250; c=relaxed/simple;
	bh=wVGPvjTW4CIbBul2WZxjVlkQLsyBpV1+dM/5fBlGQXg=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=cn49nyWXl5H7zyqAiArnx1X59jZu+I7fuUw+oZ3nojyOquLhjTwK+UdVKZGz5CQm23YHH6hmfWKFckJ18SB2vxMvuJ/luEheurpoJGYmAkhH3XKBXh2/Oyn5BXd2GvoIcRBf4vtTU/KiCOZemXXE3+KpSyPFXxj+DtlhsKuVbFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=1fx/TOVI; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="1fx/TOVI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1718283246;
	bh=wVGPvjTW4CIbBul2WZxjVlkQLsyBpV1+dM/5fBlGQXg=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=1fx/TOVI3A1QCEv9d134gj+RBWgPsXHHipiipV7jWFevGesdGwd6nnr5Xpo28yNz2
	 Ik0mwRxE4/75e46xVDEAfrLteR/MpC3wpJ4HHIt6RnlJixNPKOf2huVjI7+RbVkAjq
	 3Rt/v+Hiz9W3LqtpBrvr580+pCVqpo/kBHCA8/x8zixG7JfIO20Db7xeDNlwdayMUB
	 8o3jJY+ThnWDbx+lDnUxT65xxkXWgGYOX49PwyZcJzn7N8sC5ZjnTg2ixALGAGmfdc
	 5nXCU+U/6fHZgohUcBvpaKyU1WUJcy8ZQpujrR9qpbOQXHmcf8DytYGOdhaFKNkRVO
	 h1DoYnHfvP5LQ==
Received: from [100.118.151.62] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: padovan)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 7118237820A7;
	Thu, 13 Jun 2024 12:54:05 +0000 (UTC)
Message-ID: <188b5668-45ec-ed35-0bf9-89c885a7cb05@collabora.com>
Date: Thu, 13 Jun 2024 09:54:03 -0300
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
To: kernelci-tsc@groups.io, Nikolai Kondrashov <spbnick@gmail.com>,
 "kernelci@lists.linux.dev" <kernelci@lists.linux.dev>
References: <b51eab8a-41cd-4439-8434-076d09b60ed4@gmail.com>
 <17D6135FD5E0FC8F.2477@groups.io>
 <7f9eca2b-e2e5-4288-a9c4-bd8be09f33fa@gmail.com>
 <aba91233-6a98-a69c-0f27-955954e9e33d@collabora.com>
 <7f692ecd0f55ab29baf68826114ec088376cda56.camel@collabora.com>
From: Gustavo Padovan <gus@collabora.com>
In-Reply-To: <7f692ecd0f55ab29baf68826114ec088376cda56.camel@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 6/13/24 03:05, Denys Fedoryshchenko via groups.io wrote:
> On Wed, 2024-06-12 at 14:27 -0300, Gustavo Padovan wrote:
>> Hello,
>>
>> On 6/12/24 11:56, Nikolai Kondrashov wrote:
>>> On 6/5/24 12:00 PM, Nikolai Kondrashov via groups.io wrote:
>>>> On 5/23/24 6:54 PM, Nikolai Kondrashov wrote:
>>>>> As you know, we've been developing the new KernelCI API [1],
>>>>> and the
>>>>> kernelci-pipeline [2] based on it, for quite a while.
>>>>>
>>>>> However, by now it seems that too many things are being called
>>>>> "KernelCI": the
>>>>> project, pieces of the old system, pieces of the new system. We
>>>>> would also
>>>>> like to give the name of KernelCI the project a wider scope
>>>>> than just a
>>>>> particular CI system, and accommodate more packages/projects
>>>>> under its name.
>>>>>
>>>>> So we would like to propose to call the new system "KernelCI
>>>>> <Something>".
>>>>>
>>>>> And this message is about that "<Something>".
>>>> Almost two weeks have passed from my original message, and we
>>>> have collected a
>>>> number of opinions and potential names. So I went ahead and
>>>> created a poll to
>>>> help us pick the new name:
>>>>
>>>> https://forms.gle/GY2uWw3yGLA6u5EbA
>>>>
>>>> The poll requires authenticating to Google to limit the number of
>>>> votes, but
>>>> if anyone has a problem with that, just post your response here
>>>> (pick all the
>>>> options you like), and I'll add it myself. We'll close the poll
>>>> in a week.
>>> The week has passed, and the poll is now closed. We've collected
>>> ten
>>> responses. An the clear winner is:
>>>
>>>       "Maestro"
>> Nice. So here comes Maestro!  This is a great step to clarify the new
>> architecture.
>> We should first patch that in the documentation together with the
>> overdue update
>> on the overall KernelCI architecture. I can look into a patch for
>> that
>> next week.
>>
>> Now, when it comes to actually renaming the git repos and other
>> things
>> we want
>> to evaluate a proposal to bring kernelci-core, kernelci-api and
>> kernelci-pipeline into
>> a monorepo kci-maestro. But that would be post Plumbers possibly as
>> our
>> focus is
>> super sharper on showing the new KernelCI there.
> I believe renaming anything at this current moment would significantly
> set us back. Additionally, until we eliminate the legacy systems,
> renaming is technically unfeasible.
>
> However, I would like to propose creating a new repository called kci-
> maestro. This repository would consolidate various scattered components
> of the project, such as new deployment scripts, maintenance tools, and
> local development install scripts (currently residing in kernelci-
> deploy and mixed with legacy items).
>
> Rather than attempting to merge elements that cannot be easily
> integrated, this new repository could serve as a true orchestrator for
> all other components.

That seems a great start! Thank you, Denys.

Best,

- Gus

-- 
Gustavo Padovan
Kernel Lead

Collabora Ltd.
Platinum Building, St John's Innovation Park
Cambridge CB4 0DS, UK
Registered in England & Wales, no. 5513718

