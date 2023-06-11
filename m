Received: from mail-4317.proton.ch (mail-4317.proton.ch [185.70.43.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EC471FC5
	for <kernelci@lists.linux.dev>; Sun, 11 Jun 2023 07:42:38 +0000 (UTC)
Date: Sun, 11 Jun 2023 07:42:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=revenni.com;
	s=protonmail3; t=1686469349; x=1686728549;
	bh=wWdImuRVgft6cvfeU/KGBrZjK07gwkFQc8ccN5RGAUo=;
	h=Date:To:From:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=walAl2ScdAfnshb1/CeWGZj+PE/OgADmFtnt/eZK7348a8adIRF9f8Wk9VCKOWtSy
	 jw4ZLUNMh7ufBWuxpFuei5fpK6BTXQU0Ae4mIn3UgJAK0rfSZnXIPVlW8lO0FIXZuS
	 ZEzO7GNowQQ+X28EMd8fhrJGb3Grkoi54kO4ON13UC+2QI2uT8o/C6sQvE1+4l75w/
	 9rM0cHZleDKudYND2KADdz1QpdkDH/3oZBCGcnFoEHzrNGmQgcCQukwNHomH6e+f0V
	 xPCJchZ9ayqiC1/qMGMOR3am+4IOcyO5vkDtYlkszPrKxGuBBRZBzlKcDWnzH9Od/T
	 O80tEV3sMjlhg==
To: kernelci-sysadmin@groups.io, "kernelci@lists.linux.dev" <kernelci@lists.linux.dev>
From: Vince Hillier <vince@revenni.com>
Subject: Re: Scheduled maintenance this week and next week
Message-ID: <09b922e6-5f1e-f4e4-e5bd-60ecc272383b@revenni.com>
In-Reply-To: <d7db790a-2b76-8c44-45d8-6cd46943fd8a@revenni.com>
References: <84aef6eb-a761-f647-3b23-ff1bdd931115@collabora.com> <e89a3f40-e719-c3c2-6c7e-ffb1706ad380@collabora.com> <202534aa-a40a-5ac7-3fba-32c30cfc4a04@collabora.com> <607da614-ecda-a47f-94e3-0fad2e951f00@collabora.com> <554e1510-4c48-5074-4e6b-faecec6a4364@collabora.com> <d7db790a-2b76-8c44-45d8-6cd46943fd8a@revenni.com>
Feedback-ID: 25944540:user:proton
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable



Vince Hillier |  President and Founder
Revenni Inc.  |  https://revenni.com  | 647-812-0131 x301

On 6/6/23 21:00, Vince Hillier wrote:
> On 6/6/23 17:17, Guillaume Tucker via groups.io wrote:
>> On 02/06/2023 19:08, Guillaume Tucker wrote:
>>> On 02/06/2023 09:53, Guillaume Tucker wrote:
>>>>>> Once the staging move is complete, all the production services
>>>>>> are scheduled to be moved next week:
>>>>>>
>>>>>> * https://kernelci.org (static website)
>>>>>> * https://linux.kernelci.org (web dashboard, backend, Jenkins etc.)
>>>>> Also:
>>>>>
>>>>> * https://chromeos.kernelci.org (ChromeOS KernelCI instance)
>>>>>
>>>>>> There may be some longer downtime next Monday compared with usual
>>>>>> weekly production deployments.  We'll also be sending regular
>>>>>> updates as things evolve.
>>>>>>
>>>>>> Please let us know if this downtime is causing any critical
>>>>>> disruption and we'll see which measures we can take to mitigate
>>>>>> the impact.
>>>> We've now started transferring VMs for the production move.  It's
>>>> still scheduled to happen on Monday as per the usual production
>>>> updates, except this time we won't be updating any of the code to
>>>> focus solely on the infrastructure.  If things to well, the
>>>> downtime shouldn't last more than a couple of hours.  We'll soon
>>>> confirm the exact time window for the downtime and provide
>>>> regular updates.
>>>
>>> There is now a scheduled maintenance window on Tuesday 6th June
>>> from 18:00 UTC to 22:00 UTC when the kernelci.org production
>>> services will be down as part of the move to the new Azure
>>> subscription.  If things go well, the downtime may be shorter.
>>> There should be no downtime on Monday.
>>
>> The planned maintenance window is meant to end within 1h, however
>> we've experienced some complications and it looks like it will
>> take longer to get all the services back online.  As it's nearing
>> completion we've opted for extending the maintenance window in
>> the hope that it gets resolved within the next couple of hours or
>> so.  We'll send an update once things have settled down.
 >
> The production move has now been completed.  Thank you for your patience.

As we reach the final stages of our migration we'll be moving the Jitsi=20
instance at https://meet.kernel.social to our new subscription.  This=20
will incur downtime for the service starting Monday June 12th at 5am UTC.

The downtime is dependent on a DNS change that will be effected after=20
the migration effort.

Thanks,
Vince

