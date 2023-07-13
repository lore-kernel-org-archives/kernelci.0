Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A83A8366
	for <kernelci@lists.linux.dev>; Thu, 13 Jul 2023 07:08:56 +0000 (UTC)
Received: from [IPV6:2001:861:4a40:8620:d901:c525:a85f:2da3] (unknown [IPv6:2001:861:4a40:8620:d901:c525:a85f:2da3])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: gtucker)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 99F896600010;
	Thu, 13 Jul 2023 08:08:54 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1689232134;
	bh=n+FJ8Drsk7rPYs8YngLBcL0lIuOfCvxGRwej1YKYyRs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=FLR0DiG8U1J2lKkEW4J6ixeFDgEpnIKeUz4BdH/EJt3sylNeOq3w7XX/v5dE/g759
	 2LPCTRNlrP+PydmrUPwdd+r9A8ke1vkYZ/UOwsSESMCi5aKoGMRDoRQhx/yj4Iz0nt
	 i+bB3dzwLmfg28zzKodBTectJcgmhdyqdwgzsSyDNezIQvyFeNn+IjukGYD5GoTSq5
	 YLm9daEc22LWYTsDavvdTACiajjmllSs9DKFkdqcNG0S+BWzXZ5wIWaARlIpPJqADR
	 24Tn8kIrqtw9jFNbIZhoANIEorUyFjYJSOMl27RkXyRArGGrO7nv83HjSPMiax0brg
	 84OeB4rn4851Q==
Message-ID: <ff846cc6-f5f6-c886-4309-cd1b815bbeb8@collabora.com>
Date: Thu, 13 Jul 2023 09:08:51 +0200
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: UM-Linux compilation on Android Common Kernels
Content-Language: en-US
To: Todd Kjos <tkjos@google.com>
Cc: Mark Brown <broonie@kernel.org>, Elliot Berman
 <quic_eberman@quicinc.com>,
 "kernelci@lists.linux.dev" <kernelci@lists.linux.dev>
References: <131709e8-f804-5623-448d-7c3607be00e0@quicinc.com>
 <CAHRSSExm0P0kBF00R9Ft7-GVMcf0A9190mjeOWU4umKA3PL93A@mail.gmail.com>
 <CAHRSSEy20Zc80XufjYN4XjXbba6BTMHd_9kFaNOnhiuj9yEDsQ@mail.gmail.com>
 <YxCtqsY55Lwaj34H@sirena.org.uk>
 <CAHRSSEw9KqQFKZND1fmMa67btkozg0yA_0NjF8C=UiLnvfwHGA@mail.gmail.com>
 <YxXkuTdnt4IbPMDC@sirena.org.uk>
 <CAHRSSEzgEyPDxZ64SUdJNZRU3YAxS+mJcfVgG4-cSjjuTsH0Xg@mail.gmail.com>
 <9b4773cc-f68c-4e34-4688-92c968bfb66c@collabora.com>
 <CAHRSSEyrJeru4YKoAFUo2Ai1dmxQAxRTJ1gnAuY1OmxohF=5Gw@mail.gmail.com>
 <CAHRSSEztTzwRThMc1OfpP33r-V8=bNNP3fc_LD9_6eY9Ztj6sA@mail.gmail.com>
From: Guillaume Tucker <guillaume.tucker@collabora.com>
In-Reply-To: <CAHRSSEztTzwRThMc1OfpP33r-V8=bNNP3fc_LD9_6eY9Ztj6sA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 06/07/2023 19:00, Todd Kjos wrote:
> Any progress on this? (at least doing the um builds?)
> 
> On Thu, Mar 16, 2023 at 3:46 PM Todd Kjos <tkjos@google.com <mailto:tkjos@google.com>> wrote:
> 
>     On Thu, Sep 15, 2022 at 9:23 AM Guillaume Tucker
>     <guillaume.tucker@collabora.com <mailto:guillaume.tucker@collabora.com>> wrote:
>     >
>     > Hi Todd,
>     >
>     > On 14/09/2022 22:36, Todd Kjos via groups.io <http://groups.io> wrote:
>     > > Is there an ETA for at least doing the builds?
>     >
>     > I don't think anyone else is asking for user-mode builds, and
>     > adding this new architecture with a new sub-architecture
>     > parameter is not as trivial as adding a few lines of YAML config.
>     > So unless someone on this list is interested, or someone wants to
>     > run an internship topic around that, I think you'll have to go
>     > and find someone to do the work.
>     >
>     > KernelCI is starting to run KUnit which does involve UM-Linux
>     > builds but that's all done "under the hood" by the KUnit
>     > framework.  Still, I guess it would catch some build errors as a
>     > side-effect.  So an alternative is to wait for that to be fully
>     > in production (first half 2023) and we can consider enabling it
>     > on some Android kernel trees.
> 
>     Is this in production now?

No, the timeline for making the new API & Pipeline as the new
production system is basically bumped to 2024.  However, KUnit
jobs are now being run every day on our staging instance and
we're planning to have an "early access" stable instance online
in the next couple of months.  I think we'll get back to you at
that point.

Thank you for your understanding.

Best wishes,
Guillaume

>     > > On Mon, Sep 5, 2022 at 4:59 AM Mark Brown <broonie@kernel.org <mailto:broonie@kernel.org>> wrote:
>     > >
>     > >> On Thu, Sep 01, 2022 at 08:44:25AM -0700, Todd Kjos wrote:
>     > >>> Could we start by building but not testing? That at least prevents build
>     > >>> breakage (which is the case that motivated this).
>     > >>
>     > >> Yes, that's definitely an easier first step.
>     > >>
>     > >
>     > >
>     > > -=-=-=-=-=-=-=-=-=-=-=-
>     > > Groups.io Links: You receive all messages sent to this group.
>     > > View/Reply Online (#1593): https://groups.io/g/kernelci/message/1593 <https://groups.io/g/kernelci/message/1593>
>     > > Mute This Topic: https://groups.io/mt/93087607/924702 <https://groups.io/mt/93087607/924702>
>     > > Group Owner: kernelci+owner@groups.io <mailto:kernelci%2Bowner@groups.io>
>     > > Unsubscribe: https://groups.io/g/kernelci/unsub <https://groups.io/g/kernelci/unsub> [guillaume.tucker@collabora.com <mailto:guillaume.tucker@collabora.com>]
>     > > -=-=-=-=-=-=-=-=-=-=-=-
>     > >
>     > >
>     >
> 

