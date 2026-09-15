Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12DDF362154
	for <kernelci@lists.linux.dev>; Tue, 15 Sep 2026 14:09:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789481344; cv=none; b=PQkGhEs/e8kRfHStT0jC24KeNefLOry07/g0fj6xEllyhd3RGPMj82TjSQr7q1XXbS00+0DkEIGq7fz/+I7GEMIb5/x6mtRU+/J2q64xWJrzeyiug0I5eEMQIUuQxLCpYySsAD7lOXaQJPg+vd110z4Jfcb1amlDvJZVwqvW/uA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789481344; c=relaxed/simple;
	bh=+FYueeoLe7CB6r0ffmkucB90kJoCHiWq48g9dkvRcBA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SxeVq1dwjV+XMP1TJztiLcXyaDYqTF4JFh3eECjTGWWCnScSJjF71V3kN0I+iRqw1JlMCOTBo6HEZlFXO5OofZvEmzxRCMLgtj71UT0d8n1zEtkKR1ybr4wKqWC/8JQ6fdsOJo7jKGZAaNEd/86qJlu309uAHY3w8hFPdYxxQIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=VIydSeuW; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=8o1tGgLi; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="VIydSeuW";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="8o1tGgLi"
Date: Tue, 15 Sep 2026 16:08:58 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1789481340;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+FYueeoLe7CB6r0ffmkucB90kJoCHiWq48g9dkvRcBA=;
	b=VIydSeuWgQlnkUxb6qaMr2jyK2nS27LSnMA/QMgXYH6l9vVSpAqUzc4ASKW0765aT0grBw
	iPJhwSbZrr1T5N8BOwLdgGM2z/KizrdEd6/1lkwSHq8p5n48JZ/GJsY2F5W6Nzm7Dpxiu6
	S3Xqe8K3jbZI6HUAc06sgyRdtjiqWAfD/q5gtxAQHq0uA6NqBP6Y33luZTbx7AZbOzc5T+
	Q/5NC2Rx2cx4gvBtPCEf75tiffyBFfSTEhJseNOLVeUS8NjQaSKRDlC6SDmXBruhWVR77d
	xVHVCK+B8kswyeeKOnwv1z9Hw3JL5N0IU9Mq/iIgzURNGMbh1ApAaCqgc8+dng==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1789481340;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+FYueeoLe7CB6r0ffmkucB90kJoCHiWq48g9dkvRcBA=;
	b=8o1tGgLirOfU83pyU0NP9Obeu7RjSnV+a+Sd3xOzUjKv3LkI5eHoECe7GzNGPV4NQlz/xZ
	oKLvCKAzo3H41+Bw==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Alan Zanoni Peixinho <alan.peixinho@profusion.mobi>
Cc: kernelci@lists.linux.dev, kernelci-webdashboard@groups.io,
	John Ogness <john.ogness@linutronix.de>
Subject: Re: kernelci test results
Message-ID: <20260915140858.W5JzUKyx@linutronix.de>
References: <20260903154354.rXZZL6F9@linutronix.de>
 <CAKKBm2t3EoD4cRiBJzLqpE79ehRs+Xs-Ypb5ta3Y7rC=0jjyKA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CAKKBm2t3EoD4cRiBJzLqpE79ehRs+Xs-Ypb5ta3Y7rC=0jjyKA@mail.gmail.com>

On 2026-09-03 15:37:09 [-0300], Alan Zanoni Peixinho wrote:
> Hi Sebastian, I work with the dashboard team, so I hope I am able to help=
 you.
Hi Alan,

> First of all, thanks for using the dashboard, and for taking time to
> write this up. Scenarios like this one are exactly what help us find
> the UX gaps for improvement.
>=20
> The dashboard is mostly organized around tree checkouts first.
> If i understood it properly you might be able to achieve what you are
> looking for via:
> 1. Selecting a tree (ie stable-rt/v6.6-rt).
> 2. Clicking on the filters button on the right. There we can apply
> filters for configs (defconfig+preempt_rt, etc).
> 3. We click on the tests tab (default tab is for builds).
> 4. On the list of tests you can search for test paths (cyclictest,
> rt-tests, etc).

Oh, okay. This makes things a bit easier.
Now that I clicked next tree and filter the preempt_rt builds I see
"builds", "boots" and "tests". Now clicking below I can get all the
cyclictest results for all the boards.
The confusing part is that "boots" says 0 but then I can download the
complete log for one of the boards where the test did run. So I guess
"boot" is something else here.

> Link for the view:
> https://dashboard.kernelci.org/tree/stable-rt/v6.6-rt/84925bb144f49eb0d5f=
4c5c29f690b4bbf84903b?df|c|defconfig%2Bpreempt_rt=3Dtrue&p=3Dt
>=20
> That list is for that checkout across hardware, so you do not have to
> go board by board. (Unfortunately there is still no search for =E2=80=9Ct=
his
> test on this device over time=E2=80=9D across all trees.)

I see.

> About the other questions.
>=20
> All the logs presented are the ones that have been submitted via KCI
> submissions, so there might be some missing information when not
> reported.

Okay. What I see that the "kubernetes" seem not to submit anything but
the actual tests do.

> On the topic of notifying on log errors, this is a feature on active
> discussion, to automate notification for first for boots and later for
> test failures as well. Today we only notify registered issues.
>=20
> We are actually looking for some feedback of dashboard users to help
> us steer on the roadmap for new features, and your help would be much
> appreciated.

Is there something you want me to do?

> Att
> Alan Peixinho
> KernelCI Dashboard Team

Sebastian
