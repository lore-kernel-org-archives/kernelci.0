Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBDE48F55
	for <kernelci@lists.linux.dev>; Thu, 21 Sep 2023 08:59:27 +0000 (UTC)
Received: from [IPV6:2001:861:4a40:8620:d901:c525:a85f:2da3] (unknown [IPv6:2001:861:4a40:8620:d901:c525:a85f:2da3])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: gtucker)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 9CF6266072E7;
	Thu, 21 Sep 2023 09:59:25 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1695286765;
	bh=u3PuxCIdBlzKNpLo1PTxhfqSUWg9LDeJpk4EeJ8yR3E=;
	h=Date:To:Cc:From:Subject:From;
	b=HuJB/8TKsuLTZcsYu0upf8VWpUn2CzQ0ihj/Y/CHEMoHPKikzu5sTSHwX3h5alBZE
	 f2t4RsAeQDY9/JbO2KhR5Hl51mkPGL+gSxNS5i1NN6n0G1FHTfSRAEIxXdUc0BPYn3
	 OReJHwzRqJ57OFTkDgTQwd4HJW+ehy5iraOWsUeVcu5ljiMQKR3tzFK+7rFbXpx8i6
	 5qT5V5A1AIZGnZBzkKJIK/oS3znI+H5mEB3Vept6bdPfy2ylSkn9jh/66nz4N7XWu5
	 TZS2ZNoMNCsedQRT3dC6IAPWlCmO7q2Ro1y9eteo0rup29GgcPsOhaieCEER5Rd9w7
	 nI34/xxJOQrmw==
Message-ID: <9acfa649-4ae0-2e56-16b8-b7c24ab60a30@collabora.com>
Date: Thu, 21 Sep 2023 10:59:55 +0200
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.1
Content-Language: en-US
To: "kernelci@lists.linux.dev" <kernelci@lists.linux.dev>
Cc: "automated-testing@lists.yoctoproject.org"
 <automated-testing@lists.yoctoproject.org>
From: Guillaume Tucker <guillaume.tucker@collabora.com>
Subject: kci command line poll: Click or Typer?
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Alongside the new KernelCI API we're also working on the new
command-line tool "kci".  One of the key decisions to make is the
framework to use for its implementation.  The legacy KernelCI
tools use the standard argparse, now we may consider using Click
or Typer as they are popular Python alternatives.

Here's a small poll with extra context to help people make up
their mind and vote for their favourite choice:

  https://github.com/kernelci/kernelci-project/discussions/258

If you don't have a GitHub account, you can also reply to this
email to vote instead.  Feel free to also bring up any discussion
topics here or with GitHub comments of course.

We'll look at the results at the end of the month so there's a
bit more than a week left to answer the poll.

Thanks,
Guillaume

