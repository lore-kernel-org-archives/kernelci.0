Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74A273B79F
	for <kernelci@lists.linux.dev>; Tue, 19 Sep 2023 14:44:11 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a0c:5a83:9102:3700:3ace:131a:8271:ad61])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: rcn)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 814D066030BF;
	Tue, 19 Sep 2023 15:44:09 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1695134649;
	bh=F3vuIhE6WMr13eUxvtxabPOmAGDmUT8PpExwfE8eALs=;
	h=From:To:Cc:Subject:References:In-reply-to:Date:From;
	b=Hz3Hsc25pdDKGdBTap3As+H2C+44Lvh1kXSKhQCRYJFJnR1SU8PsfECmqJOQ8QeUB
	 GjDa0c0zGrRduaXWoX2GHlFtvfXyBaEQnSOHr6mG8btpIRHbIGO4GDVa2LJWcEKRRc
	 8YuC6XkRb1g6uTl6009R1NVDPO6bugNUZBurt1Aqygoc37EMFgy2/n6Wl4j37V1XHC
	 u8hElfKvZKbceIWU3sweCEe9EZE4AJg5FlRCKUzsoLqOzeSmlSdMYrhLI9JA+Crbfj
	 egm0u+VWSRJQZYSgTGaK1pa9GvXdpO6DS1mC/2OduHu6Qa+ZH9OWNYhckgJ/OLQUGC
	 TFDXPjXidDWkQ==
From: Ricardo =?utf-8?Q?Ca=C3=B1uelo?= <ricardo.canuelo@collabora.com>
To: Mark Brown <broonie@kernel.org>
Cc: Guillaume Tucker <guillaume.tucker@collabora.com>, kernelci@lists.linux.dev
Subject: Re: Reduced build and test coverage
References: <4918ba63-5d11-3b48-0591-0411684f69d3@collabora.com>
 <87h6nqdyny.fsf@collabora.com>
 <8840c525-4e80-48dd-a31f-40f2ca4ed03e@sirena.org.uk>
In-reply-to: <8840c525-4e80-48dd-a31f-40f2ca4ed03e@sirena.org.uk>
Date: Tue, 19 Sep 2023 16:44:06 +0200
Message-ID: <87ediudxzd.fsf@collabora.com>
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

On mar, sep 19 2023 at 15:31:31, Mark Brown <broonie@kernel.org> wrote:
> If we're doing this -next would be very helpful too.

Does it make sense to bisect -next, though? Considering that it's
constantly rebased, so I don't think it has a coherent and "linear" log
like mainline. That means that bisections aren't guaranteed to work on
it. Is that right?

Ricardo
