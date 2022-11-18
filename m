Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D098B320D
	for <kernelci@lists.linux.dev>; Fri, 18 Nov 2022 10:07:28 +0000 (UTC)
Received: from [IPV6:2001:861:4a40:8620:b9e6:fe69:975c:4daa] (unknown [IPv6:2001:861:4a40:8620:b9e6:fe69:975c:4daa])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: gtucker)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 0B7876602A94;
	Fri, 18 Nov 2022 10:07:27 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1668766047;
	bh=5yr+qPybLALZNwG6C6F5w6WP1U/kwszcYlVeaIl6Ooo=;
	h=Date:Subject:To:References:Cc:From:In-Reply-To:From;
	b=IRnVFL4RBPPzZcjIaMlrBgHEwWfrJ24sIFgXgC3NBTV/b4keHQjCYKhHJpZQDqgNm
	 1jp+7Mv1K8LxaqcBbxsZhwYUuEaO71E0SltdpNF7WIgcu0TN6BSiMVlkiZGZziJ27x
	 TQMIWY8ekyOX+GnIl5MUd5NaavYNbatnQErIHABXlIsIzsQXV+BPCJMHRHLsP8iBTi
	 j3g2yWMEK6zcIhhvP6XZtO5jfPTEMqI4gfkQjL4HKgHEtStxGGoqcvpg7SICA+DRJu
	 zPS4XbgQ6jRkoDIwrn0L2/iPAedMKkaUcMcRVBCrCxPCzlSTA3noCypIv0iNKGqBdf
	 zDNfx7x7g52Tg==
Message-ID: <96ac68ff-4c8d-84b3-a2d4-0dc832fa2da7@collabora.com>
Date: Fri, 18 Nov 2022 11:07:49 +0100
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: Please add android13* LTS staging branches
Content-Language: en-US
To: tkjos@google.com
References: <CAHRSSEybbLKQvco=EWqnQmSihhqB7u8_SsZOnmuB=7KYiWFAig@mail.gmail.com>
Cc: kernelci@lists.linux.dev
From: Guillaume Tucker <guillaume.tucker@collabora.com>
In-Reply-To: <CAHRSSEybbLKQvco=EWqnQmSihhqB7u8_SsZOnmuB=7KYiWFAig@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

+kernelci@lists.linux.dev (new KernelCI mailing list)

On 16/11/2022 02:38, Todd Kjos via groups.io wrote:
> Please add android13-5.10-lts and android13-5.15-lts branches to kernelci
> testing.
> 
> repo: https://android.googlesource.com/kernel/common
> branches: android13-5.15-lts, android13-5.10-lts
> 
> Thanks,
> 
> -Todd
