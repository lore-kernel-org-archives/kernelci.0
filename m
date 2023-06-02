Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA7E4332E1
	for <kernelci@lists.linux.dev>; Fri,  2 Jun 2023 17:07:26 +0000 (UTC)
Received: from [IPV6:2001:861:4a40:8620:9c14:d4aa:d6b5:4b50] (unknown [IPv6:2001:861:4a40:8620:9c14:d4aa:d6b5:4b50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: gtucker)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 6206B6603219;
	Fri,  2 Jun 2023 18:07:19 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1685725639;
	bh=wy/ueRUYYimPMRqJSQOh3wzKh3OcJjcZc6v3dnhnopk=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=BVxEzpiA+pa/YbCut52FR2VswRosrxzdCawvaZIcA+lbHdkB89AHDkjG6OWQ3wgII
	 O2iP6toiierNbbKHpIUL7ysQqi88gUEh09VGFAbiH299gTy9QFHwXcWKjoc8bsPz6d
	 b/Q3YzdnB/0/PQtrMPhqUAN9M32BYOKwLqvdHqNN/5MQaTc+jIp/GKTl0LqOOHJqWU
	 XTqqCrgJDwwYVaW1NDthNQNm5nAEu55xpzXn1Xy2rTSM2ioaAPMJ/2l51QLijduvVr
	 FenRJu4l/59lt/tQwMGi3pm3GVrb/oSYfrKGmdHwLYIWBfm2sQvzClF+YfKb570KaW
	 dvMY+4IlTfXPw==
Message-ID: <607da614-ecda-a47f-94e3-0fad2e951f00@collabora.com>
Date: Fri, 2 Jun 2023 19:08:33 +0200
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: Scheduled maintenance this week and next week
Content-Language: en-US
From: Guillaume Tucker <guillaume.tucker@collabora.com>
To: "kernelci@lists.linux.dev" <kernelci@lists.linux.dev>
Cc: "kernelci-sysadmin@groups.io" <kernelci-sysadmin@groups.io>
References: <84aef6eb-a761-f647-3b23-ff1bdd931115@collabora.com>
 <e89a3f40-e719-c3c2-6c7e-ffb1706ad380@collabora.com>
 <202534aa-a40a-5ac7-3fba-32c30cfc4a04@collabora.com>
In-Reply-To: <202534aa-a40a-5ac7-3fba-32c30cfc4a04@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 02/06/2023 09:53, Guillaume Tucker wrote:
>>> Once the staging move is complete, all the production services
>>> are scheduled to be moved next week:
>>>
>>> * https://kernelci.org (static website)
>>> * https://linux.kernelci.org (web dashboard, backend, Jenkins etc.)
>> Also:
>>
>> * https://chromeos.kernelci.org (ChromeOS KernelCI instance)
>>
>>> There may be some longer downtime next Monday compared with usual
>>> weekly production deployments.  We'll also be sending regular
>>> updates as things evolve.
>>>
>>> Please let us know if this downtime is causing any critical
>>> disruption and we'll see which measures we can take to mitigate
>>> the impact.
> We've now started transferring VMs for the production move.  It's
> still scheduled to happen on Monday as per the usual production
> updates, except this time we won't be updating any of the code to
> focus solely on the infrastructure.  If things to well, the
> downtime shouldn't last more than a couple of hours.  We'll soon
> confirm the exact time window for the downtime and provide
> regular updates.

There is now a scheduled maintenance window on Tuesday 6th June
from 18:00 UTC to 22:00 UTC when the kernelci.org production
services will be down as part of the move to the new Azure
subscription.  If things go well, the downtime may be shorter.
There should be no downtime on Monday.

Thanks,
Guillaume

