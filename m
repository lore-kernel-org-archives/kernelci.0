Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795075755;
	b=CGjHixz4k7qM52pcKFQaF4i83LMqk8mbX+oyVBT30GGlJLtV4yXyE+xvZvp5O5d5Px/W
	 skVsWWpMrVa2yh4kIvAi4Rt8uclMv+KyqtPgemHkBdAg3VhnrokQduv60+PJlRHP3zTS7
	 Rw0AuxoY1yThfe0OjPdWYLw4Jh558TiZIjRxvgsDNhJYlAhtaUVsp7LAf5FutZ2kTnB6k
	 qQ6mu8/ehRGUEJkL5tWrWBMYum5QEtvYfPNzMa63ZTvhH/9B4m9iT4iJo+PqKzoXhdiP9
	 cyrgYdmWtFcj5eJV0WxBjVKooM0/3S9/1Z1HS5pY08FZtmieOp/NFIohNYfYNg2x24g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795075755;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=kM7yUQauU1WNq3u2MKY4OTkdXYSl5XmAGjgTxEm/19g=;
	b=Xdu95xmiNY5gioQwv3dTndd+9wu7sRT6D6W6HyS/Sicyy2OFXUpDFJjA8GRxDZtqQzSp
	 ECEl/w3iF1WPcevNjOdFm7YdvqjGqMA8uk33+pEwMAATkBdO0xe0of2jvdQZPEVLaTEQC
	 8Ek11GL6QI7xWz9LM7O7g5RWLheTVTpcElGnlnUdJXVwa3rUXS4zs6EAR2QuvIqdqXbfP
	 IzbjHa4oMpDwmOV7fRXoRJQs/2w0drzDqIO7D8m1y+PUmydW4Q622FKDrua/bxzonFlwv
	 zTzYQmLwhIpwyB5TrF4JZt9LuAqX4zn0fOnoVFTiKbnl3W3bNVDnNi9Q9yi6SF2GxrA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=gIWCl8fU;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=8ox3SLij;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E4BB606A320
	for <kernelci@lists.linux.dev>; Thu, 19 Nov 2026 08:09:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8E4BB606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=gIWCl8fU;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=8ox3SLij
Date: Thu, 19 Nov 2026 09:09:10 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1795075752;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=kM7yUQauU1WNq3u2MKY4OTkdXYSl5XmAGjgTxEm/19g=;
	b=gIWCl8fUdlBF5P/poRGTwk+nSTqqrq+k9jk2Wp3WQxzxgSSU/rw8aP8mxlQr1Y7e60BVh/
	orjnjP1vSAvsqI8JHK3hvlcSHnLLjZpPAjZuU/pDCU0w4a8Ee3UFFPjx5WBHfUY1SAgrNO
	0zy8+ShB7KWLgTPFONEtEAbzZ1QAyLBYEzz9lJJnLLm4aED7ju8KHfHbvpX5O3zeELzj6Y
	rp28JGPbF+o9YqcH17GcrMp8hcWlll1KWW+9S0bcPYwyBxs8mRmhohcOx0ndgEMpQ+0cWQ
	JcelbumPwYlngTj8p1mI0FKrHkIwN7CSGkVdIqe0xXZ2yEV6JqJr7a8Ax+ozhw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1795075752;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=kM7yUQauU1WNq3u2MKY4OTkdXYSl5XmAGjgTxEm/19g=;
	b=8ox3SLijlR6+N26C0vI01BWVqHrED2nyhHDu9CfwEv8h3Al1l4Zv7O0qrbvAPEUGTLIlHM
	LL04A+jM8g2PvjBw==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Denys Fedoryshchenko <denys.f@collabora.com>
Cc: kernelci <kernelci@lists.linux.dev>,
	John Ogness <john.ogness@linutronix.de>
Subject: Re: Debugging PREEMPT_RT spikes on kernelci
Message-ID: <20261119080910.RIjU3Vyp@linutronix.de>
References: <20261116111135.Fsypfl7Z@linutronix.de>
 <1a1e41d96b1.3e56ef281896928.385630952830763087@collabora.com>
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Post: <mailto:kernelci@lists.linux.dev>
List-Help: <mailto:kernelci+help@lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
List-Owner: <mailto:kernelci+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1a1e41d96b1.3e56ef281896928.385630952830763087@collabora.com>

On 2026-11-16 13:28:26 [+0200], Denys Fedoryshchenko wrote:
> Hello,
Hi,

> I will do deploy production right now.
Thank you.

> Usually changes are deployed weekly, unless there is breaking changes
> that might need more needing.

I see. Thank you for the information.
Judging from yesterday's run
	https://dashboard.kernelci.org/test/maestro%3A6afe07fc99c74e1a99855381

the config bits are merged and cyclictest reports

| T: 0 (  484) P:98 I:1000 C: 540000 Min:      4 Act:    4 Avg:   13 Max:      98
| T: 1 (  491) P:98 I:1500 C: 360000 Min:      4 Act:    7 Avg:   14 Max:      92

which looks good.

Sebastian
