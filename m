Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1BC22573
	for <kernelci@lists.linux.dev>; Wed, 21 Dec 2022 15:25:33 +0000 (UTC)
Received: from [IPv6:2a0d:e40:0:4000:a33d:5e2a:b8b4:d3c4] (unknown [IPv6:2a0d:e40:0:4000:a33d:5e2a:b8b4:d3c4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nuclearcat)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id D7DF86602CC5;
	Wed, 21 Dec 2022 15:25:25 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1671636326;
	bh=mfRoRJlGD/4UUBeCeL6zlqjPaEjQxUEP7Fskwqit1Eo=;
	h=Subject:From:To:Date:In-Reply-To:References:From;
	b=GKv7mMh/IrvX9Q5WNMIMC73siD+ulB2hV3QcjXbtKZapVcYAPMd3xYI6Ez8P1hTSo
	 RyOlGtP8VWck+qLq8LDwbNAdGBkZl/6PC7/b6G8X1V/Z5mWDVYoeiyeuyc1n9WxmxG
	 sRWBRwVYn7mWcbczNuedXv337V5e6IinABLOD2Dpz2Uc+c+jhzx1dHnemf04hmDpoP
	 lzAPWkGVhk7mcWc59RYWU8D26RLK9PqYmNSPP7dU+jTplEyVsdOFMQ0ljFV9vL5Qn6
	 PB3AyrMztWNg/8aNZNiCMis2ks30y/H5tWMRyGBRHt3aLKzY9UCY1MPDEI6t3UgzjX
	 RXMcCV+BgDfWQ==
Message-ID: <196909140b94ca61e15b555335221127c8a3f650.camel@collabora.com>
Subject: Re: Please add android13* LTS staging branches
From: Denys Fedoryshchenko <denys.f@collabora.com>
To: kernelci@groups.io, tkjos@google.com, kernelci@lists.linux.dev
Date: Wed, 21 Dec 2022 17:25:13 +0200
In-Reply-To: <CAHRSSEwTjFNRvQ8O2+d4F2uNdh9NTbGgCGQY080qTPhTSAaacg@mail.gmail.com>
References: 
	<CAHRSSEybbLKQvco=EWqnQmSihhqB7u8_SsZOnmuB=7KYiWFAig@mail.gmail.com>
	 <CAHRSSEwTjFNRvQ8O2+d4F2uNdh9NTbGgCGQY080qTPhTSAaacg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.3-1 
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Todd Kjos,

As i know they are already added and being tested:
https://linux.kernelci.org/job/android/branch/android13-5.15-lts/
https://linux.kernelci.org/job/android/branch/android13-5.10-lts/


On Fri, 2022-12-16 at 11:47 -0800, Todd Kjos via groups.io wrote:
> +kernelci@lists.linux.dev
> 
> On Tue, Nov 15, 2022 at 5:38 PM Todd Kjos <tkjos@google.com> wrote:
> 
> > Please add android13-5.10-lts and android13-5.15-lts branches to
> > kernelci
> > testing.
> > 
> > repo: https://android.googlesource.com/kernel/common
> > branches: android13-5.15-lts, android13-5.10-lts
> > 
> > Thanks,
> > 
> > -Todd
> > 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Groups.io Links: You receive all messages sent to this group.
> View/Reply Online (#1627): https://groups.io/g/kernelci/message/1627
> Mute This Topic: https://groups.io/mt/95061589/6902820
> Group Owner: kernelci+owner@groups.io
> Unsubscribe:
> https://groups.io/g/kernelci/unsub [denys.f@collabora.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 
> 


