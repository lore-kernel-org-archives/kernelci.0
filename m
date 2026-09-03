Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD2514E8E06
	for <kernelci@lists.linux.dev>; Thu,  3 Sep 2026 15:43:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788450239; cv=none; b=E/UEMgaLKVH6eerYFegBwliJSKsFQxiEneRO/3g6IZJjvtpYD/kFPGX0p/NpM5CdCoIodykQwH2P2BstUYm40qsMhPBA6AziSZ8dP9QwUzHoalLp/n3scf8dyIqeQcu++4WzR0sH1UCSg+2s3L19VzMkWWLoaCqUr6cDhpeutD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788450239; c=relaxed/simple;
	bh=63Wo9G9X3t6oRSSKipIQg/YNTr6OilUfnUkAzgpbJMA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NzC7StdesVlRvDwBzaP74QSQVxSa7FhidHzGLWwc6sHyJuGftwDz3dvqBWU3p02YMzDCOGNiNyG1CCmBTwSDGzZG0wjMmxL9hzpnRmVSKbHjt1iQndUb8sZ/jka7g9hVLAFQlhO9MOsGnREldIZkHlriyzCKTViUW5LNoTJ+p5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=2gL/uOYh; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=/QCkgCmf; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="2gL/uOYh";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="/QCkgCmf"
Date: Thu, 3 Sep 2026 17:43:54 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1788450235;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=TvswMR9wTzQFa4/f1Z8qG+0Zbyh1v0sUYDs8Lm8gZ/U=;
	b=2gL/uOYhYXiaPaDkltRHsDVWeVo8ljclm8c8dGCztB0rHWWgeNe7oExNRYM4cUntQDdsoc
	t6DZv2wAAa37og4JfQ+omB++1vJzDNF4hKLedI76nzEBdfAbSTrU2MR2epwU7Mq43uCeWT
	gz+sNXUHV6a5GvPI8BzciPrCZ92t5wbA5iDCnHmtqTXZSYj/QZVAGsJULDgmOBqZwdRfqU
	CZqTnLtSPcNr9Qlj182pAsupNwe976lVjr+M7ZQXCB3d6vUUEy14akJm7Pk+bmgtNo3WID
	odl5V2RJtY3mRTQb638DaUGM4DEOR/M6sM0rSsa02PZEZ/sRnXNN0l4WdiKGVg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1788450235;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=TvswMR9wTzQFa4/f1Z8qG+0Zbyh1v0sUYDs8Lm8gZ/U=;
	b=/QCkgCmfit6M5+MYrbyjKPy0KVhLAa1+Z5EKkhH64M2w4qFuOr5qTkT5Nh8i9K4dum5ogC
	/eztGmcTuM219VDg==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: kernelci@lists.linux.dev, kernelci-webdashboard@groups.io
Cc: John Ogness <john.ogness@linutronix.de>
Subject: kernelci test results
Message-ID: <20260903154354.rXZZL6F9@linutronix.de>
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi,

I've been poking at the dashboard to see how rt-tests tests are doing.
I tried to summarize my doing/ process and added questions while doing
so. I might be doing things wrong, not the expected way or simply
missing the obvious.


On the dashboard, by clicking hardware, Tree=mainline I see only
kubernetes as platform. There I see on the bottom various builds. There
is a search bar where I can limit to "preempt_rt" and then builds are
limited to "preempt_rt" configuration and it also includes "next".

There I can click on the build-log (and later I get the build.log.gz)
but it appears not to contain the build log of the kernel. I think there
is the "config merging" part and kselftest build but not the actual
build of the kernel itself.

Clicking on tests, I can also filter for preempt_rt but there is only
kselftest. I can't see the results, there is always "No logs available".
Based on the timestamp the results are from today so I wouldn't expect
them to be deleted because of age.

Going back to "trees" and selecting "stable-rt" and branch v6.6-rt
there is more HW. Clicking on bcm2711-rpi-4-b since it has the most
results here.

Here I clicked on configs "defconfig+preempt_rt" and then one of tree
that appeared is "mainline/master" but I did not see this earlier while
I did select that tree.

I did click on "tests" and then "rt-tests" appeared. Expanding it up, I
found cyclictest results for that tree.

Clicking on details I found a link to
	https://lava.collabora.dev/scheduler/job/22810572

where the complete log is available of what has been done on that
hardware. In the bootlog I noticed
| [    0.000000] WARNING: kernel/trace/trace_events.c:420 at test_double_dereference+0x128/0x130, CPU#0: swapper/0/0

which is a warning that appeared during boot. Is this picked up
somewhere? Is there a notification sent somewhere that this has been
noticed?

Later there is the cyclictest invocation, arguments and the result.
There is no max-value set for the test so it passes. Would there be a
notification if the test failed and if so, where?

I noticed that on the lava page, by clicking on the device I can search
for "rt-tests-cyclictest" and get the recent results for this device for
this test. Is something like this possible on the dashboard? I.e. look
for the recent cyclictest results?
Right now I have no idea how to do this without going device by device.

Sebastian
