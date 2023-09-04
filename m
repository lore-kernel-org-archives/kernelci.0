Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28152C14F
	for <kernelci@lists.linux.dev>; Mon,  4 Sep 2023 20:19:29 +0000 (UTC)
Received: from [IPV6:2001:861:4a40:8620:d901:c525:a85f:2da3] (unknown [IPv6:2001:861:4a40:8620:d901:c525:a85f:2da3])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: gtucker)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id E1FE9660708F;
	Mon,  4 Sep 2023 21:19:27 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1693858768;
	bh=uISngrYblxrRwnPH6cf+U4VHPbsyGjOvph41/6CzLPs=;
	h=Date:To:From:Subject:Cc:From;
	b=A5pN26JTcUMvs6lIb5PuGH/zXNyBSg10B9VnWTqYiH3HcnQN9sahmyUzTeSqOz5aA
	 aSlSVyzv/6Rr8dHKDnkY12YD69v1bulI5LbIG0b6NS63bDdT1yXosALpcFEbTTbAwf
	 a7vV/b0hJy92dYiRvfUlE9YLG8D8PtCW2PzqPWm5dO1BBkcXBd+xonslTX6eYIPT9a
	 II9vQXjj6x9U6cgEJmR1y7CKmhlggmkY5Y5DJI6/wVEjwRZwH4kdlG5XWFbD8yNixr
	 yttFUrSXPnAFDJwMCfpZetBZMoppXjhxDEwbw6JEcPxNImtUhMCACXRq90vUx8NZoG
	 1Mg1hPMrXXpTg==
Message-ID: <7bc25730-b522-3345-8291-fdbd3ad33ce3@collabora.com>
Date: Mon, 4 Sep 2023 22:19:05 +0200
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.1
Content-Language: en-US
To: kernelci@lists.linux.dev
From: Guillaume Tucker <guillaume.tucker@collabora.com>
Subject: KernelCI API Early Access
Cc: kernelci-members <kernelci-members@groups.io>,
 automated-testing@lists.yoctoproject.org, kernelci-tsc@groups.io
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Today is the beginning of the Early Access phase for the new
KernelCI API.  As explained briefly in the previous blog post[1],
this is to give everyone a chance to create a user account and
start using the API for beta-testing purposes.  There's now an
Early Access[2] documentation page with a quick guide to get
started, so please go take a look there and start taking part.

For a bit more context, see also the blog post:

  https://kernelci.org/blog/posts/2023/api-early-access/

Happy beta-testing!

Best wishes,
Guillaume,
On behalf of the KernelCI Technical Steering Committee

[1] https://kernelci.org/blog/posts/2023/api-timeline/
[2] https://kernelci.org/docs/api/early-access/
