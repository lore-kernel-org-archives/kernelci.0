Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E671F5027F
	for <kernelci@lists.linux.dev>; Fri, 10 May 2024 13:56:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715349400; cv=none; b=XBeMgg9RayIFmpErTVWAq/AHvbGgs81x9bAp4G4OFZG/SdjDVh0+Gy8UbRyEb7NKIpA2I+DSTr6t1CTZbn4eFZgqBJ5ZVkZEh1Gmc74Sx4LGuy4Wd1LHrXFVB/ZsJi9jcBvEZkVJ+YmQNiow9+s2JMBEyzhAPT/qqtfUafhxGSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715349400; c=relaxed/simple;
	bh=/pfPYtSa3b1f36+IWXHoGdeZdxYk4J1srGRsBMXBPfQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZW3ttcWzcvyC7Vg89YFOd7bmtnldP3AuPfuFUMGvB+4PSF+h88PpyFjOPwzReRJLExV/hGl9f1dBKzPB9XPl1246kVlGSqxQFSiQWQ7zcCN0h1msfjk30f+2Tu6ChYI7HIVvKNOKNj8LqkjFT+wSJ5dDIRQ+tSUr+Zm0+EU5Vjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=T9PMZ5bA; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="T9PMZ5bA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1715349397;
	bh=/pfPYtSa3b1f36+IWXHoGdeZdxYk4J1srGRsBMXBPfQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=T9PMZ5bAeiKDR3oun+V6N0vqvU/HSBzJIVQDl1TNllU8InWRzr66li/mx4uZR4Cyn
	 eq7CyhW96vv6mLabcU0aoAql9TeDA8/5zJEZ2AaJaFsrmHDq2/cb+a7qP9hnWO8jqd
	 U7JIzzPmHV+xa/SZZnJSCIoxgm2Rus3+z5ZpSAsnN9GZbf7MonKZFo38gmQga9qMUj
	 4mscg/5Gvesws5S6VgrZRWs2hcIBDkkJv7fLxkWS0AeIMbQSzX0FO5gZ9APc7jHUXl
	 39jyIVQI7M00hN076o7Z3NdUxJjcbLJiWcIEcJ4L2KKNEsQlnNgfXk7BDHuuQiPb3U
	 m0G2qU47qbPow==
Received: from [100.95.196.25] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: koike)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 8878B3781183;
	Fri, 10 May 2024 13:56:35 +0000 (UTC)
Message-ID: <1dda36fe-4af4-4c57-b5ba-19e9e67ea3c3@collabora.com>
Date: Fri, 10 May 2024 10:56:33 -0300
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Kernelci Job Start Delays
To: Joseph Salisbury <joseph.salisbury@canonical.com>,
 Gustavo Padovan <gus@collabora.com>
Cc: kernelci@lists.linux.dev, lgoncalv@redhat.com
References: <9cce38df-de93-486c-bee6-1a866f8ac696@canonical.com>
 <3deb2b-66195880-7f-7ed64100@24373438>
 <d46595e5-a701-5896-0137-0ec8197bcaf6@collabora.com>
 <1ed9e9d7-d927-4277-9399-16ab952e6ea2@canonical.com>
Content-Language: en-US
From: Helen Koike <helen.koike@collabora.com>
In-Reply-To: <1ed9e9d7-d927-4277-9399-16ab952e6ea2@canonical.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Joseph,

On 03/05/2024 15:17, Joseph Salisbury wrote:
> Hi Gustavo,
> 
> I just uploaded a new version:
> https://lkml.org/lkml/2024/5/3/811
> 
> Is there something I need to do initiate the transition to your new system?

We need to first enable build tests on your tree.

You can follow this example: 
https://github.com/kernelci/kernelci-pipeline/pull/502

Basically you need to add your tree under `trees:`, so kernelci knows 
which trees to monitor. You need to add a `kbuild-...` job under `jobs:` 
and an entry under `platforms:` so kernelci knows where to run.

Let me know if you have any questions regarding that.

Thanks
Helen

> 
> Thanks,
> 
> Joe
> 
> 
> On 4/29/24 17:09, Gustavo Padovan wrote:
>> Hi Joseph,
>>
>> Just following up on this to check if you want to initiate the 
>> transition of rt tests to our new system. Let us know.
>>
>> Regards,
>>
>> Gustavo
>>
>> On 4/12/24 11:50, Gustavo Padovan wrote:
>>> Hi Joseph,
>>>
>>> I am glad that you reached out. It seems you are pointing out yet 
>>> another aging sign of our legacy system. For broad context on that, 
>>> check our recent blog post[1].
>>>
>>> The best way of solving your issues would be to move your testing to 
>>> the new system. The best plan for the legacy system right now is to 
>>> shut it down in the coming months. As we said in the blog post, we 
>>> are starting small in number of tests and scaling it step by step, 
>>> but always with community engagement to evaluate the results. If you 
>>> want to come on board with the rt testing, we would be happy to start 
>>> a plan to make that happen.
>>>
>>> Let me know if that is an avenue you would like to explore. If yes, 
>>> I'd be interested in knowing which tests you are running.
>>>
>>> Best,
>>>
>>> - Gus
>>>
>>> [1] https://kernelci.org/blog/posts/2024/strategic-updates/
>>>
>>
> 
> 
