Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D1973B47FB
	for <kernelci@lists.linux.dev>; Tue, 15 Sep 2026 14:28:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789482499; cv=none; b=YZACn7axOhe0C6eaPr3yOYa9kltLmT3DYKG2L5kQRisaYcubtd3rkhV8cChRmagjNn03QeW2b4iTQHkGnKfMH1Q4kyPZZtL0Wn2qKt3ZR4T5BW6u1Y4H0sxM0OZ1MJ7MG8SEluB40MqJn5gWu0kJjencW8pWJTb1U1sF+Yqge+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789482499; c=relaxed/simple;
	bh=cCK9IzaSCGq0nUWIikjWr99k5WhuR0M8DFgQHwe+RUw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cvc60c+5inCMVApI0tMlo6p2TM8S0C0GBjgEN43vq10IRXwbycRVLKWfSA8PIEsv7EwssniY0MNmHKANgeyXquhHdIwI2CrxDBXoIh/Wc9SQ22tFfk9fyEDHvj+t9XTx9GEB0C4ET5268dkPulShxz4F3jDgGRrfnqF/phbBlcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=ZmdTbXmU; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=WxFfnVm1; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="ZmdTbXmU";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="WxFfnVm1"
Date: Tue, 15 Sep 2026 16:28:13 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1789482495;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eyP82m//iKUB3RGOoPn6Wdr7wtTit2+ydqdc0+LTQxI=;
	b=ZmdTbXmUrB/MOY1yrvNLRuUKASna9R0/ZE/raAbLL4lErK2VqPN0xFXYLJg0prBnCKfhxy
	FAksV5RmaRAWpWWuplLucucVt+IbqVQKGVTjFxtTexPqdbyCykRHF+sc5nJQWOwqDv/8Hu
	9T/hSPIyoDj+7Rf436ZvFmisgt3OuQk80BSFaAEABGfRKkB4AoixTZbwRcsohcO/6ucp2/
	pBOTRRZ28aW+B1z73kPG/AMooFTX1c6EGICmizL1HCXgJ4mhre2wXBXr4k4yQfczXyredd
	2vp5Jjcrbf7H10kPgsdcm36pZwpXJHqIb9UtE0DAu/91eT8xuOraC/NYyblMDw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1789482495;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eyP82m//iKUB3RGOoPn6Wdr7wtTit2+ydqdc0+LTQxI=;
	b=WxFfnVm1gPysEhXIQ78qVWAEqOgN7fDfsbuE1rsDC3joU7tDsm2aSpE2Bz1Gmb1k6IVS+N
	tqb8U2zxAes6XXAA==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Denys Fedoryshchenko <denys.f@collabora.com>
Cc: Alan Zanoni Peixinho <alan.peixinho@profusion.mobi>,
	kernelci <kernelci@lists.linux.dev>,
	kernelci-webdashboard <kernelci-webdashboard@groups.io>,
	John Ogness <john.ogness@linutronix.de>
Subject: Re: kernelci test results
Message-ID: <20260915142813.WZeSH-ck@linutronix.de>
References: <20260903154354.rXZZL6F9@linutronix.de>
 <CAKKBm2t3EoD4cRiBJzLqpE79ehRs+Xs-Ypb5ta3Y7rC=0jjyKA@mail.gmail.com>
 <1a06ad7a5bf.36f8f8422502097.1545856430736765843@collabora.com>
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1a06ad7a5bf.36f8f8422502097.1545856430736765843@collabora.com>

On 2026-09-04 08:15:12 [+0300], Denys Fedoryshchenko wrote:
> Hi Sebastian, Alan
Hi,

> The system currently creates a short log extract only when a build or
> boot test is marked as failed. This job completed successfully,
> including the boot and cyclictest, so the log was stored but not
> automatically analyzed for an extract.
> The kernel warning is present in the full log and our analyzer can
> recognize it, but it was missed because the overall job passed. This
> is a limitation in the current reporting flow.
> We initially chose to create log extracts only for failed builds or
> boot tests because successful boots often contain harmless or known
> warnings, such as spurious IRQ messages. Reporting every warning as an
> issue could create substantial noise that kernel developers may not
> find actionable.
> We could review this policy and maintain an ignore list for known,
> non-actionable messages. That would let us highlight new or unexpected
> warnings without creating unnecessary noise for kernel developers.

Okay. So this might look okay since the tests pass. With my kernel
developer hat on, I have to say that there should be warnings of any
kind. Looking at log from
	https://dashboard.kernelci.org/test/maestro%3A6aa88a0d20239ade9037b72f

reminds that I poked at the first error "Event mtu3_gadget_ep_set_halt
has double dereference" but it is still there so I need to poke again.
There there is
|Unable to handle kernel NULL pointer dereference at virtual address 0000000000000019
which is definitely not normal.
Someone with hardware should look at this. I will try to forward it,
maybe it goes away :)

Even the "spurious IRQ messages" is a sign of bad driver/ hardware setup
and shouldn't be ignored.

Sebastian
