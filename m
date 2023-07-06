Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58BDB9440
	for <kernelci@lists.linux.dev>; Thu,  6 Jul 2023 13:51:56 +0000 (UTC)
Received: from [192.168.196.47] (unknown [80.215.130.1])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: gtucker)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 3BA946606FCD
	for <kernelci@lists.linux.dev>; Thu,  6 Jul 2023 14:51:49 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1688651509;
	bh=fR7WsM/nfT/+zeb+kI7eksBvTk+XGxySpGuRsmfHPRw=;
	h=Date:To:From:Subject:From;
	b=RO2HqOhpUYJWYnINwCLQxC0FF7Ukd6oOjiCfznU6dCa8DreqrqzULnsaPAGBFS9dT
	 urCLmEcgWyBRBT+Cv+eHTdcHd5iuIkjcHVQvx1NKLyUZErYAgHxRmQydB1XvkPWXZt
	 GMfXhzz5sqkusiGVnNc0WoVchZsDtv+L1JfWX17IrOwbVcYw9YHV2RexXM+snEtFYE
	 jvH2p7078WwQQZJXSeHtDM+A//IblVxa8Rly6wC2E3s5gEmHvry+QzEZSsTmBGgUQ0
	 s/5eEa2+OieCh0CsMKmpkKJ5NhbwNWBtEw/nNPSxf8H557nE95bu+gDe3GWJoqrP3L
	 nUL6Kvke2QzUg==
Message-ID: <3e1a3658-2842-0eaa-efd6-bf61aca191dd@collabora.com>
Date: Thu, 6 Jul 2023 15:51:47 +0200
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Content-Language: en-US
To: "kernelci@lists.linux.dev" <kernelci@lists.linux.dev>
From: Guillaume Tucker <guillaume.tucker@collabora.com>
Subject: Reduced build and test coverage
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

While we now have a stable Azure subscription, it turns out the
resources we're using are burning our newly allocated budget much
more quickly than what we had before.  There are several ways to
address this so we're confident it's only a temporary issue, but
in the meantime we have to downscale our build and test coverage
to keep the daily costs as low as possible.

As such, we're planning to make the following changes during
Monday's production update:

* no allmodconfig builds
* no builds with special config fragments (crypto, ima, x86_kvm_guest...)
* most trees will only be building a minimal set of configs
* kselftest and LTP test collections are each run on only one platform
* baseline-nfs is disabled on platforms that don't run tests using NFS

This will allow us to shut down some Kubernetes clusters used for
kernel builds and reduce the data transfers from storage.  We'll
confirm next week whether this is going to be rolled out in
production and provide more updates as we find some solutions.
Please let us know if this is causing some disruption and we may
be able to tweak things to reach a compromise until things are
back to normal.

Thanks,
Guillaume
