Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 303C723AF
	for <kernelci@lists.linux.dev>; Thu,  2 Feb 2023 11:24:36 +0000 (UTC)
Received: from [IPv6:2a0d:e40:0:4000:a33d:5e2a:b8b4:d3c4] (unknown [IPv6:2a0d:e40:0:4000:a33d:5e2a:b8b4:d3c4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nuclearcat)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 940876602EED;
	Thu,  2 Feb 2023 11:14:47 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1675336488;
	bh=2jnf6EyQ7m2fqaV4Rqk2WUmANJA0d6/BtrsnL7n0lGY=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=YCkvisx3JJsoenyjK+sgvcOsyzCmpqRMI9HwS6fxgkjUV1ZZsEbY2aGfhJdLrQ3+G
	 ArkdtXYFLeRP0JdGDv+vBCNRa5P4V8uCiIovaHnFcbjiuZGWRnGRqniP5NQHN4nOvQ
	 ru7BDHg/IIf933GGs//b9Ni9qBIy2SbhCBbp/HukDOD4io5DoxZJwm+zkBvLbngguv
	 FhzRZGqrhTh7IS8dbh4YVMJXRuM42n76VfDZjrVgwhFb43EyMgMlnTZrqp914lIFw8
	 FuN3814js0I9A9VEKfH0gvv3tsd0DOu5VcqQUJRtVH62nmUMpXM0oGTd8EWEGPQ11K
	 sQFg5J067yCzw==
Message-ID: <5fa4e2b7e98d01bcdf6a7f24f99bb0259c80d882.camel@collabora.com>
Subject: Re: Please add android14-6.1
From: Denys Fedoryshchenko <denys.f@collabora.com>
To: Todd Kjos <tkjos@google.com>
Cc: kernelci@groups.io, kernelci@lists.linux.dev, Kevin Hilman
	 <khilman@baylibre.com>
Date: Thu, 02 Feb 2023 13:14:32 +0200
In-Reply-To: <CAHRSSEw0D9nYg2jHLNtWXMZHqR29gtk8qnNr181NuBt=_MTQAg@mail.gmail.com>
References: 
	<CAHRSSEzfMO06w8cimnG9W_NnvnupxcF93tVVJOybUWjoQzNY3w@mail.gmail.com>
	 <CAHRSSEw=t+jhbmHjZVL+mZTJii66pJnHfyNSGXFRt99=y7=6WA@mail.gmail.com>
	 <CAHRSSExO0ZvPHj3z6SedhCpmZxYWpBR0nDgCPUNFkY4bqodgtg@mail.gmail.com>
	 <9f49d95262ba1a092f91e2e21cc65f9fcc8ab18a.camel@collabora.com>
	 <CAHRSSEw0D9nYg2jHLNtWXMZHqR29gtk8qnNr181NuBt=_MTQAg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.3-1 
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

It seems queue is cleared, maybe it was caused by high activity in
all kernel trees for last 1-2 weeks.
I will try to do PR today and will delete old trees.



On Wed, 2023-02-01 at 10:18 -0800, Todd Kjos wrote:
> [non-HTML version this time. Sigh.]
> 
> According to the bug, this is blocked by build capacity issues... you
> can delete android-4.9-q, android-4.14-q, and android-4.19-q. Does
> that help with capacity? We'd really like to get our 6.1 kernel into
> the tests...
> 
> 
> On Thu, Jan 19, 2023 at 6:14 AM Denys Fedoryshchenko
> <denys.f@collabora.com> wrote:
> > 
> > Hi,
> > 
> > i will take care about that, will post progress in:
> > https://github.com/kernelci/kernelci-core/issues/1659
> > 
> > On Wed, 2023-01-18 at 16:08 -0800, Todd Kjos wrote:
> > > Any progress on this?
> > > 
> > > (sorry if you got this twice - 1st one was sent with rich text
> > > and
> > > rejected by lists.linux.dev)
> > > 
> > > 
> > > On Fri, Dec 16, 2022 at 12:17 PM Todd Kjos <tkjos@google.com>
> > > wrote:
> > > > 
> > > > +kernelci@lists.linux.dev
> > > > 
> > > > 
> > > > On Fri, Dec 16, 2022 at 11:45 AM Todd Kjos <tkjos@google.com>
> > > > wrote:
> > > > > 
> > > > > Please add android14-6.1 branch to kernelci testing.
> > > > > 
> > > > > repo: https://android.googlesource.com/kernel/common
> > > > > branches: android14-6.1
> > > > > 
> > > > > Thanks,
> > > > > 
> > > > > -Todd
> > > 
> > 
> > 
> 


