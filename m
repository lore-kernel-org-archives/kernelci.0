Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB8AC9440
	for <kernelci@lists.linux.dev>; Thu,  3 Aug 2023 07:55:57 +0000 (UTC)
Received: from [IPV6:2001:861:4a40:8620:35fb:242a:88f1:9f80] (unknown [IPv6:2001:861:4a40:8620:35fb:242a:88f1:9f80])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: gtucker)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id B4AD96607088;
	Thu,  3 Aug 2023 08:55:55 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1691049355;
	bh=7sCg1teFSltfjHqyNz3axUrrirMHTc8DAPFPWo+djfc=;
	h=Date:From:Subject:To:Cc:From;
	b=DIxIw1DxvFlHmKrXr7fGtd4z57rTixk6N73IPQWSyBarjz0HtVXdKAeNdjH2DFLXb
	 kasuEUOJZKBBC7AlCzN5vTbjR4kQTphVohRWn0p1234pQNGsu8LhNCU+rMTk4ksH0b
	 jENPxvx7uikA1N7lmT8uBht95CbUYoBHMJqnGPjcNnvdiZB8mnUPQ+i5agDewZivoo
	 ns/PFSflXLr8AC9RY8eMoYrGGd8xMMhl6l3QAA9TXstQ+IoDP7SVHn81Hz+Y8574U4
	 1LjhW8tPJ4zHMDplzzPBjB74jJb+pxU2vgK+hv6wFf6ev3EmqmQts8V7cfUYsINb1Y
	 gMN41aFFRsWJg==
Message-ID: <13fdbb33-e3d8-d0f9-f4ea-552100573cf8@collabora.com>
Date: Thu, 3 Aug 2023 09:55:53 +0200
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.1
From: Guillaume Tucker <guillaume.tucker@collabora.com>
Subject: KernelCI API Transition Timeline
To: kernelci@lists.linux.dev
Cc: automated-testing@lists.yoctoproject.org, kernelci-tsc@groups.io
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

We're glad to finally be able to announce a timeline for rolling
out the new KernelCI API & Pipeline and deprecating the legacy
system currently in production.  Here's a blog post with all the
details:

  https://kernelci.org/blog/posts/2023/api-timeline/


In a nutshell, there are 4 milestones:

* Early Access: Monday 4th September 2023

  For users to start experimenting with an production-like
  instance of the new API.

* Production Deployment: Monday 4th December 2023

  To have a permanent instance which will eventually become the
  new production one.

* Legacy System Deprecation: Monday 4th March 2024

  When the new API becomes the main KernelCI production service.

* Legacy System Sunset: Monday 4th November 2024

  When the legacy system gets permanently shut down.


We'll be sending regular updates about KernelCI developments in
general and how the new API roll-out is progressing in
particular, typically once a month.  In the meantime, please let
us know if you need any clarification about each milestone, raise
any concern you may have with this timeline or ask any question
about the new API.

Thanks,
Guillaume,
On behalf of the KernelCI Technical Steering Committee
