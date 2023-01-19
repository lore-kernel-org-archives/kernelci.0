Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CE697471
	for <kernelci@lists.linux.dev>; Thu, 19 Jan 2023 14:14:58 +0000 (UTC)
Received: from [IPv6:2a0d:e40:0:4000:a33d:5e2a:b8b4:d3c4] (unknown [IPv6:2a0d:e40:0:4000:a33d:5e2a:b8b4:d3c4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nuclearcat)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id A87BF660087D;
	Thu, 19 Jan 2023 14:14:50 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1674137691;
	bh=tY3mEIiLXkzIKLMh56OQccXAO4xb2f6FwWVnlmUKAOg=;
	h=Subject:From:To:Date:In-Reply-To:References:From;
	b=e7SYskky74xES9C3o/kcBKm+fwZzEkCfCrMEHxDiDRxqqxstluz0gci61L8bJAiEV
	 mPXBGAe6Kr0dAN24PGt8eA5gb2U/gJ5gVdSx1nPylIs3h6VMso9HDzMfo6m4hcMdii
	 vc6SEbMNDd1EDPEt/Xf7wLzcTpDWV6qZ9xPxjODtkZxydvEHCtL+Wh1WcEnxcdtqcD
	 ONRMv5lj+2VT0dxOLUSXrYR8o8KBd3sngnVGkEQTUMtSWBCEzJztD7NuhqH47+fSXa
	 1P7Mbg8hw9KLRNbSFv1V1m/CLEetAo4gXE2sojKcVs3r/j84vCOwLwAC5PXnKULifl
	 DksEmdE8PZ8og==
Message-ID: <9f49d95262ba1a092f91e2e21cc65f9fcc8ab18a.camel@collabora.com>
Subject: Re: Please add android14-6.1
From: Denys Fedoryshchenko <denys.f@collabora.com>
To: Todd Kjos <tkjos@google.com>, kernelci@groups.io,
 kernelci@lists.linux.dev,  Kevin Hilman <khilman@baylibre.com>
Date: Thu, 19 Jan 2023 16:14:42 +0200
In-Reply-To: <CAHRSSExO0ZvPHj3z6SedhCpmZxYWpBR0nDgCPUNFkY4bqodgtg@mail.gmail.com>
References: 
	<CAHRSSEzfMO06w8cimnG9W_NnvnupxcF93tVVJOybUWjoQzNY3w@mail.gmail.com>
	 <CAHRSSEw=t+jhbmHjZVL+mZTJii66pJnHfyNSGXFRt99=y7=6WA@mail.gmail.com>
	 <CAHRSSExO0ZvPHj3z6SedhCpmZxYWpBR0nDgCPUNFkY4bqodgtg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.3-1 
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

i will take care about that, will post progress in: 
https://github.com/kernelci/kernelci-core/issues/1659

On Wed, 2023-01-18 at 16:08 -0800, Todd Kjos wrote:
> Any progress on this?
> 
> (sorry if you got this twice - 1st one was sent with rich text and
> rejected by lists.linux.dev)
> 
> 
> On Fri, Dec 16, 2022 at 12:17 PM Todd Kjos <tkjos@google.com> wrote:
> > 
> > +kernelci@lists.linux.dev
> > 
> > 
> > On Fri, Dec 16, 2022 at 11:45 AM Todd Kjos <tkjos@google.com>
> > wrote:
> > > 
> > > Please add android14-6.1 branch to kernelci testing.
> > > 
> > > repo: https://android.googlesource.com/kernel/common
> > > branches: android14-6.1
> > > 
> > > Thanks,
> > > 
> > > -Todd
> 


