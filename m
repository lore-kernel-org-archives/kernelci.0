Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FACBD515
	for <kernelci@lists.linux.dev>; Tue, 10 Oct 2023 10:42:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="koA+1INC"
Received: from [IPV6:2001:861:4a40:8620:d901:c525:a85f:2da3] (unknown [IPv6:2001:861:4a40:8620:d901:c525:a85f:2da3])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: gtucker)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 4887166072AE;
	Tue, 10 Oct 2023 11:42:48 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1696934568;
	bh=tjGs7F3QyHynOHXUEYgWZ9PBrJ47HHix3ZLt7lJW9pc=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=koA+1INCOiGHuhoJW0jGGXEFqc+sJvFm3o3QW6/48RYxMZnWUMWFbz0n4cQGnNDHi
	 b/AsLQNfm5KYxo4DzE7fIrcrcHYwZ8ptYC7G/YpxvgpO1DwmxwuwcSAU9joyCwAgEe
	 Rwige3O72Nis3LZkDurSMTTbSL/2rTg7+LlyaTWw/LtzOtdLlci6TeLARM9KitBfxj
	 29vGHKgWe6wn6pjg4midhINgArhshY7izkSxPGraFM18SWF5OLSSWh6/RjGf6AaiGz
	 pSTKWE5vOc3yX+fcI9UlQM1AhQTMOYYJuij04kmSBAd+OWNsQ4dthGjCJ2D0vBGPPl
	 Ev9Tcg4HNPG3w==
Message-ID: <cb4befc4-6fa4-8d07-8845-bc14600da315@collabora.com>
Date: Tue, 10 Oct 2023 12:43:29 +0200
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.1
Subject: Re: Reduced build and test coverage
Content-Language: en-US
From: Guillaume Tucker <guillaume.tucker@collabora.com>
To: kernelci@lists.linux.dev
Cc: =?UTF-8?Q?Ricardo_Ca=c3=b1uelo?= <ricardo.canuelo@collabora.com>,
 Mark Brown <broonie@kernel.org>
References: <84e-6509cf80-5-78984280@144048748>
 <c9edd342-c4eb-323a-f68e-1cce3d0cea66@collabora.com>
In-Reply-To: <c9edd342-c4eb-323a-f68e-1cce3d0cea66@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 25/09/2023 10:50, Guillaume Tucker wrote:
> On 19/09/2023 18:43, Guillaume Charles Tucker wrote:
>> On Tuesday, September 19, 2023 18:12 CEST, Mark Brown <broonie@kernel.org> wrote:
>>
>>> On Tue, Sep 19, 2023 at 04:44:06PM +0200, Ricardo Cañuelo wrote:
>>>> On mar, sep 19 2023 at 15:31:31, Mark Brown <broonie@kernel.org> wrote:
>>>>> If we're doing this -next would be very helpful too.
>>>
>>>> Does it make sense to bisect -next, though? Considering that it's
>>>> constantly rebased, so I don't think it has a coherent and "linear" log
>>>> like mainline. That means that bisections aren't guaranteed to work on
>>>> it. Is that right?
>>>
>>> When bisecting -next you should generally bisect it against the mainline
>>> it was based on.
>>
>> Yes that's how the KernelCI bisection works. It's the most useful branch to bisect automatically precisely because it's rebased every day with thousands of commits, so a bisection takes between 10 and 15 iterations and it's painful to do manually. And that's where most of the bugs are.  Then mainline, stable and stable-rc are the other critical trees to cover so it makes sense to enable them first.
>>
>> We've discussed enabling bisections again with sysadmins and I think we can have this done in a week or two.  Other issues are about measuring costs empirically for different parts of the system and adding a filter in the legacy back end to avoid flooding Jenkins with jobs that won't get run (they still use up all the RAM).
> 
> We've now re-enabled the full functional test coverage which can
> result in roughly twice the amount of test results coming from
> LAVA labs.  We'll be monitoring the additional costs incurred as
> a result this week and compare with previous weeks.
> 
> Then the plan is to prepare everything to have bisections enabled
> again next Monday but with only mainline, linux-next, stable-rc
> and stable as discussed previously.  These are the trees that
> benefit the most from automated bisection.  We'll be able to
> measure the added costs for that again in the following weeks
> although we already have an estimate.

We can now confirm that bisections are running again in
production, see details about it here:

  https://github.com/kernelci/kernelci-project/issues/260

It is still based on the legacy system but with some small
internal improvements to avoid cluttering the queue which should
improve the quality of service for users.

> In October, the current plan is to enable some more builds such
> as allmodconfig on a couple more trees such as mainline (right
> now only linux-next has allmodconfig builds enabled) and continue
> measuring the related costs.

This is still the plan for next Monday's production update, which
should give us two weeks to measure the added costs with large
kernel builds such as allmodconfig.

> This exercise aims at:
> 
> * knowing more accurately the cost of each area KernelCI's
>   coverage to better secure its long-term funding
> 
> * streamlining the overall config to maximise the value of the
>   results produced by KernelCI
> 
> * review the whole configuration in preparation for migrating to
>   the new API with a fresh implementation

Note: The Android kernel builds configuration will also be
updated as per the other email thread with Todd.  This should in
fact deliver more value by streamlining the build coverage so
costs aren't expected to change much as a result.  The large GKI
configs are already being built and were never disabled.

> As mentioned before, if the current coverage is missing parts
> that are critical to any use-case in the community then please
> raise the issue here and we can address it.  For example, we're
> looking into Android builds and bisections on more trees based on
> feedback from users.

Likewise, if anything else in the build and tests coverage needs
to be adjusted please let us know.

Thanks,
Guillaume

