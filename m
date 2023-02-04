Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68AD533EC
	for <kernelci@lists.linux.dev>; Sat,  4 Feb 2023 16:49:13 +0000 (UTC)
Received: from [IPV6:2001:67c:1810:f055:f11a:faf6:a821:9f0a] (unknown [IPv6:2001:67c:1810:f055:f11a:faf6:a821:9f0a])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: gtucker)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id BD5BE66003AF;
	Sat,  4 Feb 2023 16:49:05 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1675529345;
	bh=0V5lcsAT6OMrUkGzYjxK/FawUzYr8fbdyYAeE7ofX8c=;
	h=Date:To:From:Subject:Cc:From;
	b=HgZs1KB3VdytfqcGryBy25U4bBylvQnXW+Vv7QDYrfJyxwrRVyZzdE5AhyXBYY5Zy
	 U3KcSCxkeP0/UBKh5moJ1fcIJfKPwBYFfrYxuQ5DpisyVRuNK91CA79koJgr0U/3Xw
	 L2DEcQCocTq+VSobi1awh+88bFz+KxOKHIgfR2a6qIJvbjOlve71qryEKiPupu4rSy
	 gG2cQ3YbFBBFssEihWcWKIOh5zcUdfcB+Ezg+2cQmZRdSylMVFcCBZuMNYqkjNgCNb
	 uZ7JQlH3tbR3LG7DGTTGsmbOie7XFRPgoQTdKN2uKnTyeYkMW5o/ZjRYwhkkWPQCtv
	 rrjZHwdPz9GhQ==
Message-ID: <000d3088-698a-25b2-aba5-86301ef8640d@collabora.com>
Date: Sat, 4 Feb 2023 17:49:54 +0100
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Content-Language: en-US
To: "kernelci@lists.linux.dev" <kernelci@lists.linux.dev>,
 automated-testing@lists.yoctoproject.org
From: Guillaume Tucker <guillaume.tucker@collabora.com>
Subject: KernelCI at FOSDEM
Cc: kernelci-members <kernelci-members@groups.io>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Are you attending FOSDEM in person?  If not, are you available to
attend some talks via the live stream[1]?

There are 3 talks related to KernelCI this weekend at FOSDEM,
many opportunities to discuss kernel testing topics as well as a
packed schedule in the CI/CD devroom.  There are of course tens
of other devrooms including a kernel one scheduled for tomorrow.

Find out more about what KernelCI's presence at FOSDEM and more
with our latest blog post:

  https://kernelci.org/blog/posts/2023/fosdem-2023/

If you have any queries or just want to meet up with others
involved in kernel testing in particular, please feel free to
reply to this email, join the IRC channel #kernelci on
libera.chat ask for an invitation to Slack on kernelci.slack.com.

Thanks,
Guillaume,
On behalf of the KernelCI board of members

[1] https://fosdem.org/2023/schedule/streaming/
