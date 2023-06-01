Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91472BA2F
	for <kernelci@lists.linux.dev>; Thu,  1 Jun 2023 12:20:30 +0000 (UTC)
Received: from [IPV6:2001:861:4a40:8620:f19a:2591:9ad7:3d74] (unknown [IPv6:2001:861:4a40:8620:f19a:2591:9ad7:3d74])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: gtucker)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id B459B6606EBB;
	Thu,  1 Jun 2023 13:20:22 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1685622022;
	bh=v+4ip9Xll3M+o851Lqa1tmWPt1fMvUo+OQENzWe9Ce0=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=ZRdUu49UUtlDH2NIVk3f3fjhxEXVwnUQPHApl7rwoRhpCHZVSr01QR03bathJcmfx
	 0MKNwJRNaOKXRmpLKRH/8KFUoXUoNJv+433e9L8yF1DLpPONoJzf+2R7rLNTVAIU4A
	 B1dL3+aDDTpuB3976FyKLe+nse/3CsOqDvzk+hKZYN0t4umrk0LoGQ+MpOJA3brWsR
	 OY1v5VO+zhXl1EMtgZlO8tA0CYlCKtB8xsICnpuy6cvM90JyQe9FfFp+1jAqpKq9P/
	 8vn4ckjTRrByXvwLPMOR+db1ci35uFOponc7ugV6xCAQukvzq8nhIdgbOq3/vZ9S1f
	 4Uzi0hEo8ujuA==
Message-ID: <e89a3f40-e719-c3c2-6c7e-ffb1706ad380@collabora.com>
Date: Thu, 1 Jun 2023 14:21:35 +0200
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: Scheduled maintenance this week and next week
From: Guillaume Tucker <guillaume.tucker@collabora.com>
To: "kernelci@lists.linux.dev" <kernelci@lists.linux.dev>
Cc: "kernelci-sysadmin@groups.io" <kernelci-sysadmin@groups.io>
References: <84aef6eb-a761-f647-3b23-ff1bdd931115@collabora.com>
Content-Language: en-US
In-Reply-To: <84aef6eb-a761-f647-3b23-ff1bdd931115@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30/05/2023 10:12, Guillaume Tucker wrote:
> We're now in the process of moving all the KernelCI Azure
> services to a new subscription.  The domain names, port numbers
> etc. should remain unchanged, there will only be new IP addresses
> for the new VMs and DNS records should be updated in a timely
> fashion.
> 
> As such, the staging VM is being shut down today.  We'll be
> sharing updates as things on staging come back online by the end
> of this week at the latest.  Services impacted by this downtime
> are:
> 
> * https://staging.kernelci.org (web dashboard, backend, Jenkins etc.)
> * https://staging.kernelci.org:9000 (new API & Pipeline)
> * https://kcidb.kernelci.org (KCIDB Grafana web dashboard)
> * https://chromeos.kernelci.org (ChromeOS KernelCI instance)

We've made some good progress with transferring the staging VMs
and services are coming back online now.  In principle all of
staging should be back to normal by tomorrow.

> Once the staging move is complete, all the production services
> are scheduled to be moved next week:
> 
> * https://kernelci.org (static website)
> * https://linux.kernelci.org (web dashboard, backend, Jenkins etc.)

Also:

* https://chromeos.kernelci.org (ChromeOS KernelCI instance)

The ChromeOS instance relies on services running both on staging
and production so it will be affected by both updates.  On a side
note, we're now working on removing this dependency with a new
chromeos.staging.kernelci.org instance for ChromeOS KernelCI
development purposes - this will happen after the move to the new
Azure subscription.

> There may be some longer downtime next Monday compared with usual
> weekly production deployments.  We'll also be sending regular
> updates as things evolve.

We're going to have a short production downtime later today to
take a copy of the VMs.  The web dashboard shouldn't be down for
more than a few minutes, and there might be some extra lag before
some kernel git revisions start getting tested.  This should help
reduce the downtime needed on Monday to complete the production
move.  We'll keep sending updates as things progress.

> Please let us know if this downtime is causing any critical
> disruption and we'll see which measures we can take to mitigate
> the impact.

Thanks,
Guillaume

