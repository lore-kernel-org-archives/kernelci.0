Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DC361FB6
	for <kernelci@lists.linux.dev>; Thu, 24 Nov 2022 07:19:03 +0000 (UTC)
Received: from [IPv6:2a0d:e40:0:4000:a33d:5e2a:b8b4:d3c4] (unknown [IPv6:2a0d:e40:0:4000:a33d:5e2a:b8b4:d3c4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nuclearcat)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 8A07C6602B02;
	Thu, 24 Nov 2022 07:18:55 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1669274335;
	bh=Tqq+GOexAmzCKW6H05QNZmEpKt9ROs5lEvENPqD4QmI=;
	h=Subject:From:To:Date:In-Reply-To:References:From;
	b=LbNhJD71VqcyW8fqImiaBzuLy0KaTyZXRSF5RUduq7Oab6SFG/bxCiSNYc+EqqmVv
	 tWNBABLY7A078oDRNNX4IdnEM1GKaVHFLMCx7+5lJyUeHE2YVKZJGxF45TjU70SAM/
	 AdGTN0Oi6NZ6XbGbkKyqLv6xOS445oZSdaIgkr+ZvE0Fr0FB/kEAu+NPMi35iYyWc1
	 NDfQbKvN4AEsex/Z0tJw6bAVl+hCjXCC9cMNawCDLoJ83JcxTCasfWXQx9W0KrPKeV
	 uQm5I36ek/ToZA7L2M2IKuVWrzC/+3iniwAG+aWYDVd8PH2UOOIQQ1sjpQ2jkht59h
	 WDukMvJPIVGbA==
Message-ID: <e45f2055e36f41e6a27e40f596af7cbb492dc2ac.camel@collabora.com>
Subject: Re: Please add android13* LTS staging branches
From: Denys Fedoryshchenko <denys.f@collabora.com>
To: "kernelci@lists.linux.dev" <kernelci@lists.linux.dev>,
 kernelci@groups.io,  tkjos@google.com
Date: Thu, 24 Nov 2022 09:18:44 +0200
In-Reply-To: <CAHRSSEybbLKQvco=EWqnQmSihhqB7u8_SsZOnmuB=7KYiWFAig@mail.gmail.com>
References: 
	<CAHRSSEybbLKQvco=EWqnQmSihhqB7u8_SsZOnmuB=7KYiWFAig@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.3-1 
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello Todd,

PR created, will test it soon on staging.
https://github.com/kernelci/kernelci-core/pull/1531

Thanks

On Tue, 2022-11-15 at 17:38 -0800, Todd Kjos via groups.io wrote:
> Please add android13-5.10-lts and android13-5.15-lts branches to
> kernelci
> testing.
> 
> repo: https://android.googlesource.com/kernel/common
> branches: android13-5.15-lts, android13-5.10-lts
> 
> Thanks,
> 
> -Todd
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Groups.io Links: You receive all messages sent to this group.
> View/Reply Online (#1618): https://groups.io/g/kernelci/message/1618
> Mute This Topic: https://groups.io/mt/95061589/6902820
> Group Owner: kernelci+owner@groups.io
> Unsubscribe:
> https://groups.io/g/kernelci/unsub [denys.f@collabora.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 
> 


