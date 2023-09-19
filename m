Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 793981FAA
	for <kernelci@lists.linux.dev>; Tue, 19 Sep 2023 14:29:27 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a0c:5a83:9102:3700:3ace:131a:8271:ad61])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: rcn)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 71CEB66030BF;
	Tue, 19 Sep 2023 15:29:25 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1695133765;
	bh=UIz7X7grqztCLIj/oVoxbvbarIGNcS4bluWrpm923S0=;
	h=From:To:Cc:Subject:In-reply-to:Date:From;
	b=Q0ElJ+EY4c6ndRZKNqDy8CiusEeYf/H2+I6zm3ar+3hF90VSir0oBstD3J1hUFrhC
	 HcW22rhZNVsI3GfRslupw10aIqM5ZcMuUXHPoqL30XYpjcw8fNV9s3phxe8riWMWR2
	 myPhMF1sA5W4+gmqdwzat0yxpPZaYIJmO5Y2Td6i8R8Vj8+h+sfbIliJteOh2nTVe9
	 e9qJnMbZ5reetdP1RYtmO/bf4NP6+mRdhzlaYEbp9D4O9N0G1/SLySV8mVXf5R7gSj
	 Tg1IPzlOCLprvsf6Dsak27KDTfkuPNxUJ+b/YT9ksUs/pFUoGOmkv0NP3pCB639aVM
	 zANoacw8G8nKg==
From: =?utf-8?Q?Ricardo_Ca=C3=B1uelo?= <ricardo.canuelo@collabora.com>
To: Guillaume Tucker <guillaume.tucker@collabora.com>
Cc: kernelci@lists.linux.dev
Subject: Re: Reduced build and test coverage
In-reply-to: <4918ba63-5d11-3b48-0591-0411684f69d3@collabora.com> (message
 from Guillaume Tucker on Thu, 13 Jul 2023 07:51:24 +0200)
Date: Tue, 19 Sep 2023 16:29:21 +0200
Message-ID: <87h6nqdyny.fsf@collabora.com>
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

Hi Guillaume,

Would it be possible to have the bisector running again? The bisector
results are the main driving point when reporting regressions found by
KernelCI, and without them the task of investigating regressions is
rather impractical and time consuming. Even running it at a reduced
capacity is much better than not having it at all.

The branches we'd be interested in are (in order of importance):
- mainline/master (the bare minimum)
- stable-rc/queue/6.1
- stable-rc/queue/5.15
- stable-rc/queue/5.4
- stable-rc/queue/4.19

Thanks,
Ricardo
