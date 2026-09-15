Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B98C388E6E
	for <kernelci@lists.linux.dev>; Tue, 15 Sep 2026 15:35:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789486541; cv=none; b=V6l/bUigAc8YHGxnc1D0RGoo1J0UFsRhaJZqjIuAaZnnxyFjqiV6+3AGwBQuSQSFBfjnKeLPfm8cVa6WOUZjD26NetO0srykRZN+0NXPi75VCkbmD8QFDe6tqu5sgmSdY//hiuY6YuLoXY82T3aAVfP3V1iO/GyVT/SzaD5fB/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789486541; c=relaxed/simple;
	bh=s5gHzzr4QRYQlNPcKBgMBVfnxAAFkV6adNb/TD8phoQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XqvJAsKWq8AezoS7hvXFunh8rC81AHexh7KG3vr9ou0e1BxWHnrmfdMwYEAV4a4otlkAs8RjSLa2XKZJxyHJuFJW5rdg1qALehzGWIBIE0FwLnk1bQ304MtGJqyWtwptCdhIWiRHcirs40WAPqNS8mkg1JwwEd6N3aQ2Tcx/tD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=H7yjI5fS; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=hAS2SmvJ; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="H7yjI5fS";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="hAS2SmvJ"
Date: Tue, 15 Sep 2026 17:35:35 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1789486537;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mtZqGMiybLkNUE67gO46/G3gpHvSkLYW6E2pk2UI+0M=;
	b=H7yjI5fSPAABCHKdthauOEao+0UHfxCgAIdsfuBjvvRwur7LilYQ1GoybyhYnHvfBMh3I4
	mh8WiqHSdGFdhC6drdOTc/URN842nDylEnMUBNYU0/7enTJOMQtYH1rm9JLZTtmzU43Aja
	HHCuVSQ8539KsCv8OiaIwAiDzW1wlIpI3pTdR2NK2dBqmu6IpC3qxBzR0dfPn/tpoVIqk6
	L0l4xnkh2JeAsfJa0qijp20kZK9LwUloZX0yZUcMnioOKhDKrSrHs9TYfc3OnCMk85FHTu
	o1awdy8leNyQsuG84fAMJK/6mKJvaipAfnALxZxf5zoPgH4AZgLRQZuj62Vkvw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1789486537;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mtZqGMiybLkNUE67gO46/G3gpHvSkLYW6E2pk2UI+0M=;
	b=hAS2SmvJVx4A26Y6Lk+3unH2mqcnZGW/310JHqBLEyVWx0Gh20wcLajGIhGgZagkr/JVez
	zSe2n+RUQMB5fDAA==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Ben Copeland <ben.copeland@linaro.org>
Cc: Denys Fedoryshchenko <denys.f@collabora.com>,
	Alan Zanoni Peixinho <alan.peixinho@profusion.mobi>,
	kernelci <kernelci@lists.linux.dev>,
	kernelci-webdashboard <kernelci-webdashboard@groups.io>,
	John Ogness <john.ogness@linutronix.de>
Subject: Re: kernelci test results
Message-ID: <20260915153535.jTjws1qq@linutronix.de>
References: <20260903154354.rXZZL6F9@linutronix.de>
 <CAKKBm2t3EoD4cRiBJzLqpE79ehRs+Xs-Ypb5ta3Y7rC=0jjyKA@mail.gmail.com>
 <1a06ad7a5bf.36f8f8422502097.1545856430736765843@collabora.com>
 <CAL0q8a6RKqmEte6t+NcYX3u60YvJS+q_THcwKcO6YReY310-HQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAL0q8a6RKqmEte6t+NcYX3u60YvJS+q_THcwKcO6YReY310-HQ@mail.gmail.com>

On 2026-09-04 09:44:31 [+0100], Ben Copeland wrote:
> Hi Sebastian,
Hi Ben,

> >  > > On the dashboard, by clicking hardware, Tree=mainline I see only
> >  > > kubernetes as platform. There I see on the bottom various builds. There
> >  > > is a search bar where I can limit to "preempt_rt" and then builds are
> >  > > limited to "preempt_rt" configuration and it also includes "next".
> >  > >
> >  > > There I can click on the build-log (and later I get the build.log.gz)
> >  > > but it appears not to contain the build log of the kernel. I think there
> >  > > is the "config merging" part and kselftest build but not the actual
> >  > > build of the kernel itself.
> 
> By design. We build with tuxmake, which builds silently unless you
> pass --verbose, so a good kernel build emits little more than echoed
> commands. What is left is warnings and errors, and for a failed build
> that log is what logspec parses. The noise you see is the kselftest
> build, which echoes anyway. There is also a reproducer.sh artefact if
> you want to reproduce the build locally.

Ah okay, then.

> >  > >
> >  > > Clicking on tests, I can also filter for preempt_rt but there is only
> >  > > kselftest. I can't see the results, there is always "No logs available".
> 
> Those aren't LAVA test runs, which is why it looks broken. On the
> kubernetes hardware page you are seeing kselftest *build* results
> hanging off the kbuild node, e.g. path
> 
>   kbuild-gcc-14-arm-preempt_rt-kselftest.build.kselftest.rseq
> 
> Those have no log_url, so the viewer says "No logs available", but the
> log is there: look at the output files section of the test page for
> build_kselftest.log.gz and build_kselftest_stderr.log.gz. Not expiry.

Ah okay. So build logs for the tests are there, I see it. But there are
not run anywhere therefore there is not log output. Understood.

> >  > > Later there is the cyclictest invocation, arguments and the result.
> >  > > There is no max-value set for the test so it passes. Would there be a
> >  > > notification if the test failed and if so, where?
> 
> I cannot find any thresholds set, which isn't ideal.
> parse_rt_tests_results.py prints the literal string "pass" for every
> latency line; only cyclictest's return code decides the overall
> result. So a max-value parameter on our side would change nothing
> until the parser learns about thresholds.

Okay. I have two pulls open to the priority thingy. Let me then look
into this.

> >  > > I noticed that on the lava page, by clicking on the device I can search
> >  > > for "rt-tests-cyclictest" and get the recent results for this device for
> >  > > this test. Is something like this possible on the dashboard? I.e. look
> >  > > for the recent cyclictest results?
> 
> Alan already covered this; however, after a quick dive into some of
> the rt results, I noticed jobs dying with "Unsupported url protocol
> scheme". Seems to be an issue with rt-tests + nfs boot. I will have to
> dig deeper, but there is some improvement to be had here. I also
> noticed that we are missing trixie-rt armhf rootfs, which will be a
> problem for imx6q-sabrelite (and other armhf boards about running rt).
> 
> So bcm2711-rpi-4-b, where you ended up, is one of the few places
> rt-tests actually produces data. I'd need to dig further to see where
> else it is running or failing.

Okay, thanks.

> Thanks
> 
> Ben

Sebastian
