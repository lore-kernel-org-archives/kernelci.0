Received: from mail-0301.mail-europe.com (mail-0301.mail-europe.com [188.165.51.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3487B7C
	for <kernelci@lists.linux.dev>; Wed,  7 Jun 2023 01:00:24 +0000 (UTC)
Date: Wed, 07 Jun 2023 01:00:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=revenni.com;
	s=protonmail3; t=1686099614; x=1686358814;
	bh=cZ5h97wKPJMkZpWRl1KdDx91V2gR48eE04m7sdMgQok=;
	h=Date:To:From:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=vWtNvd12MCzpTGo85bpwyzr7o+UJ5uNaYOGGXSzbbCRTgyvQOzOrG7rJPNkMZyETA
	 D5ETRuOPuJRX+6JMCvuAjWC1FQgD/fcQsKL8I8aYhI+Fw5ymcBsh1h2Okge3qhsNZP
	 Ww//NEkABrISXxugIHujL98bcWMN1QdrZ8f9+xgbACi+WxXo0QWIQnab70jKrnjcHo
	 UUHW6KzjJ6pgi4batyONNm3jZGZeV/LGrtCEBImHpVxPSFkelazYcuLgZCdAyF2trA
	 urCF+bvsFWbaZio2bbqfAlbDfQo9BuJ0QlehKIKw6sbX5m9s49WHAcqVpVUWuUB26M
	 xVlo22RKpreBw==
To: kernelci-sysadmin@groups.io, "kernelci@lists.linux.dev" <kernelci@lists.linux.dev>
From: Vince Hillier <vince@revenni.com>
Subject: Re: [kernelci-sysadmin] Scheduled maintenance this week and next week
Message-ID: <d7db790a-2b76-8c44-45d8-6cd46943fd8a@revenni.com>
In-Reply-To: <554e1510-4c48-5074-4e6b-faecec6a4364@collabora.com>
References: <84aef6eb-a761-f647-3b23-ff1bdd931115@collabora.com> <e89a3f40-e719-c3c2-6c7e-ffb1706ad380@collabora.com> <202534aa-a40a-5ac7-3fba-32c30cfc4a04@collabora.com> <607da614-ecda-a47f-94e3-0fad2e951f00@collabora.com> <554e1510-4c48-5074-4e6b-faecec6a4364@collabora.com>
Feedback-ID: 25944540:user:proton
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 6/6/23 17:17, Guillaume Tucker via groups.io wrote:
> On 02/06/2023 19:08, Guillaume Tucker wrote:
>> On 02/06/2023 09:53, Guillaume Tucker wrote:
>>>>> Once the staging move is complete, all the production services
>>>>> are scheduled to be moved next week:
>>>>>
>>>>> * https://kernelci.org (static website)
>>>>> * https://linux.kernelci.org (web dashboard, backend, Jenkins etc.)
>>>> Also:
>>>>
>>>> * https://chromeos.kernelci.org (ChromeOS KernelCI instance)
>>>>
>>>>> There may be some longer downtime next Monday compared with usual
>>>>> weekly production deployments.  We'll also be sending regular
>>>>> updates as things evolve.
>>>>>
>>>>> Please let us know if this downtime is causing any critical
>>>>> disruption and we'll see which measures we can take to mitigate
>>>>> the impact.
>>> We've now started transferring VMs for the production move.  It's
>>> still scheduled to happen on Monday as per the usual production
>>> updates, except this time we won't be updating any of the code to
>>> focus solely on the infrastructure.  If things to well, the
>>> downtime shouldn't last more than a couple of hours.  We'll soon
>>> confirm the exact time window for the downtime and provide
>>> regular updates.
>>
>> There is now a scheduled maintenance window on Tuesday 6th June
>> from 18:00 UTC to 22:00 UTC when the kernelci.org production
>> services will be down as part of the move to the new Azure
>> subscription.  If things go well, the downtime may be shorter.
>> There should be no downtime on Monday.
>=20
> The planned maintenance window is meant to end within 1h, however
> we've experienced some complications and it looks like it will
> take longer to get all the services back online.  As it's nearing
> completion we've opted for extending the maintenance window in
> the hope that it gets resolved within the next couple of hours or
> so.  We'll send an update once things have settled down.
The production move has now been completed.  Thank you for your patience.

Vince Hillier |  President and Founder
Revenni Inc.  |  https://revenni.com  | 647-812-0131 x301

