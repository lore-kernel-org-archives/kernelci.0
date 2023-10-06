Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF4AD748E
	for <kernelci@lists.linux.dev>; Fri,  6 Oct 2023 08:25:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="VJVhOQui"
Received: from [IPV6:2001:861:4a40:8620:cbfd:2a89:a9bd:de3d] (unknown [IPv6:2001:861:4a40:8620:cbfd:2a89:a9bd:de3d])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: gtucker)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 1FF9E6612212
	for <kernelci@lists.linux.dev>; Fri,  6 Oct 2023 09:25:12 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1696580712;
	bh=vTNxDAG2YTlMUL5HEk7yxWsUNvTZFoqPNOkEaKvCC80=;
	h=Date:To:From:Subject:From;
	b=VJVhOQui8VblXSmhOP52xUYtdw2s3DPkusVoN57fW6p3LZT+sVSwnFETrUyBP0/Ig
	 M398vMUiLbqYRSYPauFD7hTfjaJjr3hVROerv0C5UDP87XrW7XmAoQnWqEvmqjpnYs
	 x8q8hRUPMXNLLCQ7GzaZGfC+ksjqYL5MC8he3y+D7pkulC2ox4Y8R8IgBf2bbBlDw7
	 hipyofFOlsbMpA0EvidT+mB480IA2njeO7uVrbWSx0AwchPquXekNIrpyk7B3BZw38
	 XlYd2yGRInemFQTiTU05zzzb7veihDFjk32gXZOOTPYXagU05PpHn6JPkoaQwBuq2c
	 liEYIJMQNTbQQ==
Message-ID: <f059956c-30ac-2ada-8c19-8bacc0b8b969@collabora.com>
Date: Fri, 6 Oct 2023 10:25:36 +0200
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
From: Guillaume Tucker <guillaume.tucker@collabora.com>
Subject: New open hours for AMER-EMEA timezones
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hello,

As discussed previously several times in the past and more
recently with Kevin and Nikolay, the currently weekly Thursday
meetings are good for EMEA and APAC timezones but not AMER,
especially not US Pacific.  The idea is now to add an extra open
hours and it seems like Wednesdays at 17:00 UTC would be ideal.
It would be good to have at least a couple of people from EMEA
time zones attend it and help bridge the gap with the Thursday
meetings rather than just rely on written notes.

How does that sound?

I've prepared a poll to get an idea of people's preferences with
a few other options around this time window:

  https://framadate.org/6NDCHsuSbG78v5a6

Thanks,
Guillaume
