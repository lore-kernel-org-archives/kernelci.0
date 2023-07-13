Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5562566E
	for <kernelci@lists.linux.dev>; Thu, 13 Jul 2023 05:51:27 +0000 (UTC)
Received: from [IPV6:2001:861:4a40:8620:e421:bbb7:2681:dee8] (unknown [IPv6:2001:861:4a40:8620:e421:bbb7:2681:dee8])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: gtucker)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 04E6C660703D
	for <kernelci@lists.linux.dev>; Thu, 13 Jul 2023 06:51:25 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1689227486;
	bh=40cCG/An7+T9fEZnHj374/zkPiaVR9xS8+zIVKCHHCM=;
	h=Date:Subject:From:To:References:In-Reply-To:From;
	b=gNR8E/EeSgtRrU7+tll23pWFiq8//StTDuXPpcXV2Yr4GFUVvwZBwC/6OUCIZMrP2
	 E4S2ZhTLYF6a8M5qLXcPEbskffyM4I3u7FtkAgvFN9G89W8nGHM+xm8MQFyNuvKKNP
	 C2tnZYGKlUSr0JKJYLtWN8Zi6XepyouGE9xaDuEXm7nYKrKSaQckPtuEg1PWsgTM1t
	 NV01tebTJreVumYbWBSy4PAZ8SLUH+BHRm9DxOyvDBbNY1HOQoboQ7f7GEdEgUArFp
	 UJoqEhE3pY7p/+VSgms6vsFuvKNNVJgH+AU0kh6QGiDOFiBbaU0r7qJhTxcFzs5NUN
	 0G867kB1ANzOQ==
Message-ID: <4918ba63-5d11-3b48-0591-0411684f69d3@collabora.com>
Date: Thu, 13 Jul 2023 07:51:24 +0200
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: Reduced build and test coverage
Content-Language: en-US
From: Guillaume Tucker <guillaume.tucker@collabora.com>
To: "kernelci@lists.linux.dev" <kernelci@lists.linux.dev>
References: <3e1a3658-2842-0eaa-efd6-bf61aca191dd@collabora.com>
In-Reply-To: <3e1a3658-2842-0eaa-efd6-bf61aca191dd@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06/07/2023 15:51, Guillaume Tucker wrote:
> While we now have a stable Azure subscription, it turns out the
> resources we're using are burning our newly allocated budget much
> more quickly than what we had before.  There are several ways to
> address this so we're confident it's only a temporary issue, but
> in the meantime we have to downscale our build and test coverage
> to keep the daily costs as low as possible.
> 
> As such, we're planning to make the following changes during
> Monday's production update:
> 
> * no allmodconfig builds
> * no builds with special config fragments (crypto, ima, x86_kvm_guest...)
> * most trees will only be building a minimal set of configs
> * kselftest and LTP test collections are each run on only one platform
> * baseline-nfs is disabled on platforms that don't run tests using NFS
> 
> This will allow us to shut down some Kubernetes clusters used for
> kernel builds and reduce the data transfers from storage.  We'll
> confirm next week whether this is going to be rolled out in
> production and provide more updates as we find some solutions.
> Please let us know if this is causing some disruption and we may
> be able to tweak things to reach a compromise until things are
> back to normal.

This is to confirm we've now deployed the trimmed-down
configuration with fewer builds and tests as described above.
You can see the results coming in with smaller numbers here:

  https://linux.kernelci.org/job/

The good news is that it is reducing costs a lot which should
help us provide some continuity of service until we find a
solution to restore full coverage.  Several alternatives were
discussed in the board meeting yesterday and we should come up
with something by the end of July.

On a side note, we're currently only building some cherry-picked
user-space rootfs images when some functional changes are needed
to run tests correctly.  If you require one to be updated (LTP,
IGT, v4l2-compliance...) then please let us know.

Thanks,
Guillaume

