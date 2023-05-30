Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E16F12B63
	for <kernelci@lists.linux.dev>; Tue, 30 May 2023 08:11:43 +0000 (UTC)
Received: from [IPV6:2001:861:4a40:8620:1d6c:91b:4b7b:8e63] (unknown [IPv6:2001:861:4a40:8620:1d6c:91b:4b7b:8e63])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: gtucker)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id ADE9866059A8;
	Tue, 30 May 2023 09:11:35 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1685434295;
	bh=BX954U3LmYAHBwOYR/BReM4PoDJAn557m/q4GGUZUQM=;
	h=Date:To:Cc:From:Subject:From;
	b=MKo53Xmm2qBh0w8mhL6POQb9LoBm35FU18c391h0JP86XftDXZquHCbHA2sXn27Ho
	 Jcmrb1a5e+qW3GhPf2f1uuT3w6kps6hGbP3ytbZ5wPC7gNz8IlLDM0aNGM7KpT6F2f
	 +zga7SF852VIjWpgwKIf3V2huWApCh+jmdvekx7PyzgEdfarW4uNybNAl6oiAcxMDx
	 UrPSevxLYjDcl5WcpuyEkoPTP/Zvg41e37pumRGxTcIdJjD2VJPaPv9Hj3NSIVCpNQ
	 pDCOq9rj9mFJoZU6uFZoyglbNSjKAE6cwzQ3aVzXFm3sY+8SKtr83szETBLZQBoOO1
	 Wm5RnfePyA6aw==
Message-ID: <84aef6eb-a761-f647-3b23-ff1bdd931115@collabora.com>
Date: Tue, 30 May 2023 10:12:47 +0200
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-US
To: "kernelci@lists.linux.dev" <kernelci@lists.linux.dev>
Cc: "kernelci-sysadmin@groups.io" <kernelci-sysadmin@groups.io>
From: Guillaume Tucker <guillaume.tucker@collabora.com>
Subject: Scheduled maintenance this week and next week
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

We're now in the process of moving all the KernelCI Azure
services to a new subscription.  The domain names, port numbers
etc. should remain unchanged, there will only be new IP addresses
for the new VMs and DNS records should be updated in a timely
fashion.

As such, the staging VM is being shut down today.  We'll be
sharing updates as things on staging come back online by the end
of this week at the latest.  Services impacted by this downtime
are:

* https://staging.kernelci.org (web dashboard, backend, Jenkins etc.)
* https://staging.kernelci.org:9000 (new API & Pipeline)
* https://kcidb.kernelci.org (KCIDB Grafana web dashboard)
* https://chromeos.kernelci.org (ChromeOS KernelCI instance)

Once the staging move is complete, all the production services
are scheduled to be moved next week:

* https://kernelci.org (static website)
* https://linux.kernelci.org (web dashboard, backend, Jenkins etc.)

There may be some longer downtime next Monday compared with usual
weekly production deployments.  We'll also be sending regular
updates as things evolve.

Please let us know if this downtime is causing any critical
disruption and we'll see which measures we can take to mitigate
the impact.

Thanks,
Guillaume
