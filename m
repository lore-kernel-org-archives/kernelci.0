Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16D815257
	for <kernelci@lists.linux.dev>; Thu, 29 Jun 2023 07:10:49 +0000 (UTC)
Received: from [IPV6:2001:861:4a40:8620:dc26:f845:fb8:f5b0] (unknown [IPv6:2001:861:4a40:8620:dc26:f845:fb8:f5b0])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: gtucker)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id EF1FE660701E;
	Thu, 29 Jun 2023 08:10:47 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1688022648;
	bh=2cY/zWQ2rVf4eOmWcalm4M2kOTp5eP6wtW8WuMGH6hI=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=Qh9USK6/qyG6agApm4l2Jj3MBLmJJAoWQlqi3ruJ6et96M1k+w7mZA4hweOwLW9Pi
	 dPJ71VXeFrJ7ADcpsE+DjddYDehmfoIdgylfIFACzxbANI/js09yyD8hYdra60lgbz
	 dxCM/oZf0IQT8RHWCiDtByLpizh+9s24q25Rn6nH0bE0UdBPDq+EbWfWjvpPdLZo4A
	 DbfwXaFeti1fx/ivH2JVbCK9fxQKuxtfOQDRYYJq8ci3yPspNnTXCMqSdQTBrPsczy
	 siA3pqH+kQs408Mt/LMR6bo6eaGik55645kf9LlB/mTISNe0EvBXOzkGMa8GlZoge0
	 yS04mLF2P2iqw==
Message-ID: <14cdf331-5c29-e708-0aec-7da0690856c8@collabora.com>
Date: Thu, 29 Jun 2023 09:11:57 +0200
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: kernelci.org currently offline due to Azure outage
Content-Language: en-US
From: Guillaume Tucker <guillaume.tucker@collabora.com>
To: kernelci@lists.linux.dev
Cc: kernelci-sysadmin@groups.io, kernelci-members@groups.io
References: <d33464ef-b4c8-59c1-399a-5f3d071c289d@collabora.com>
In-Reply-To: <d33464ef-b4c8-59c1-399a-5f3d071c289d@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28/06/2023 21:38, Guillaume Tucker wrote:
> Hello,
> 
> In a totally unpredictable move, our new MS Azure subscription
> just got disabled for some reasons we're still trying to clarify
> with Microsoft.  As a result, basically all kernelci.org services
> are currently offline.  It's most likely just going to be a short
> glitch as there's no known reason for this to happen, so we're
> hoping to have things back online very shortly.  If this takes
> longer we'll consider some alternatives to at least get part of
> the services restored in a timely fashion.

All services are now back to normal, thanks to the Microsoft
support team and KernelCI sysadmins for their quick response.

Best wishes,
Guillaume

