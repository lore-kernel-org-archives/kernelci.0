Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 871AA6FB6
	for <kernelci@lists.linux.dev>; Fri,  2 Jun 2023 07:52:04 +0000 (UTC)
Received: from [IPV6:2001:861:4a40:8620:4b68:186b:85d7:702f] (unknown [IPv6:2001:861:4a40:8620:4b68:186b:85d7:702f])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: gtucker)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 89E276606EBA;
	Fri,  2 Jun 2023 08:52:00 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1685692320;
	bh=muyIguY+lPcDZNsdvm0EawLAU0QG8j1ZduvPVX1RhWo=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=E5xfNMvHRYqzaYLk12m+uqZAVd9lO6vuGMuLf8PoepAomI09fQdvCVQ6a/eXoMI9m
	 QCHUsTAER9gYqezd7Hyq5t+gHdsFfmMeFICQ16C+sgrZ/zo5TIauLS+wA7kXcR4KHj
	 PRKWdRJq2sohBUKIP9ddnE9nd6vMmK/KnfA06FdKM6hwOL8iMn+pFRP8Jehzb1ZBGO
	 NBXDs7GzGUiwRsG1uJ3y80tv5zmuG3bnD+6w6qis5krwtDMKHs/ydkvKZmvQUSb30J
	 Iqx1k5YNfaEanop0u56kkwsgSG9D7D6KIStlxhrVNl8sL+RvccJn08RkHw/6ca/Jsy
	 9/61KyRoC3OsA==
Message-ID: <202534aa-a40a-5ac7-3fba-32c30cfc4a04@collabora.com>
Date: Fri, 2 Jun 2023 09:53:13 +0200
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
In-Reply-To: <e89a3f40-e719-c3c2-6c7e-ffb1706ad380@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 01/06/2023 14:21, Guillaume Tucker wrote:
> On 30/05/2023 10:12, Guillaume Tucker wrote:
>> We're now in the process of moving all the KernelCI Azure
>> services to a new subscription.  The domain names, port numbers
>> etc. should remain unchanged, there will only be new IP addresses
>> for the new VMs and DNS records should be updated in a timely
>> fashion.
>>
>> As such, the staging VM is being shut down today.  We'll be
>> sharing updates as things on staging come back online by the end
>> of this week at the latest.  Services impacted by this downtime
>> are:
>>
>> * https://staging.kernelci.org (web dashboard, backend, Jenkins etc.)
>> * https://staging.kernelci.org:9000 (new API & Pipeline)
>> * https://kcidb.kernelci.org (KCIDB Grafana web dashboard)
>> * https://chromeos.kernelci.org (ChromeOS KernelCI instance)
> 
> We've made some good progress with transferring the staging VMs
> and services are coming back online now.  In principle all of
> staging should be back to normal by tomorrow.

All the staging services are now back online and jobs are running
as expected, both the old Jenkins and the new pipeline.

>> Once the staging move is complete, all the production services
>> are scheduled to be moved next week:
>>
>> * https://kernelci.org (static website)
>> * https://linux.kernelci.org (web dashboard, backend, Jenkins etc.)
> 
> Also:
> 
> * https://chromeos.kernelci.org (ChromeOS KernelCI instance)
> 
>> There may be some longer downtime next Monday compared with usual
>> weekly production deployments.  We'll also be sending regular
>> updates as things evolve.
>> 
>> Please let us know if this downtime is causing any critical
>> disruption and we'll see which measures we can take to mitigate
>> the impact.

We've now started transferring VMs for the production move.  It's
still scheduled to happen on Monday as per the usual production
updates, except this time we won't be updating any of the code to
focus solely on the infrastructure.  If things to well, the
downtime shouldn't last more than a couple of hours.  We'll soon
confirm the exact time window for the downtime and provide
regular updates.

Thanks,
Guillaume

