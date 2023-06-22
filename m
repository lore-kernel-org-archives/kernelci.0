Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B1F65239
	for <kernelci@lists.linux.dev>; Thu, 22 Jun 2023 07:29:58 +0000 (UTC)
Received: from [IPV6:2001:861:4a40:8620:d901:c525:a85f:2da3] (unknown [IPv6:2001:861:4a40:8620:d901:c525:a85f:2da3])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: gtucker)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id EFB156607050;
	Thu, 22 Jun 2023 08:29:56 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1687418997;
	bh=8ixXHchFRlGEx1sI05BizcKmvZvAksL3Dvxebc9O6gk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=gYnSWvgtvHKR+x/C6M6SvTvcirFwEsNN62Wc8CXDPEW8NLuFgW5wAgc/injqs8pqQ
	 uP8Hd0fH/DRNg+d3kZ8inQs4kxSokIP8c+GU/T64ENq8pWJvAZH01EqCmpdKJeWhVo
	 11cmpzZmjejJInEQkw2t8oGQAveTva195zuAF/itCoW1kMmV0W4fNJUHUWMzkpl85S
	 XOJy1vPrR0UthURUyUifd9taGPzAJ09+M9b1bUmB0vKNgzqTFR73xjZ4PpJpL/kaOY
	 JB+9u9Dz6tD98VkEvlBSKaQfPFrbsM9itmBECjbW3MuT+tkGZFZJhYjbpcA0yOIeAp
	 S+F6EY8LeOoTw==
Message-ID: <4eb6ba31-5c4c-20b1-1732-04bf6ac39189@collabora.com>
Date: Thu, 22 Jun 2023 09:31:12 +0200
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [Automated-testing] [kernelci-members] Request for Proposals: UX
 Analysis 2023
Content-Language: en-US
To: Kevin Hilman <khilman@baylibre.com>,
 "kernelci@lists.linux.dev" <kernelci@lists.linux.dev>,
 automated-testing@lists.yoctoproject.org
Cc: kernelci-members@groups.io
References: <74ac6506-7171-5b78-52c5-d6a3095df9dd@collabora.com>
 <7h1qi4tq8x.fsf@baylibre.com>
From: Guillaume Tucker <guillaume.tucker@collabora.com>
In-Reply-To: <7h1qi4tq8x.fsf@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22/06/2023 00:17, Kevin Hilman wrote:
> "Guillaume Tucker via groups.io"
> <guillaume.tucker=collabora.com@groups.io> writes:
> 
>> KernelCI is now looking for proposals to conduct an UX Analysis
>> for a new web dashboard.
> 
> Great work getting this finalized and posted.  Thank you!

Welcome :)

>> Please send any proposals or inquiries to the KernelCI members:
>>
>>   kernelci-members@groups.io
> 
> Warning: this list is restricted/moderated, so all proposals will end up
> in the moderation queue.

Yes that's fine, several people get notified by email when
moderation is needed including myself so we won't be missing any.

Best wishes,
Guillaume

