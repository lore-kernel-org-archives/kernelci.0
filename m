Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FF0D2D6E64
	for <kernelci@lists.linux.dev>; Wed, 23 Sep 2026 14:11:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790172667; cv=none; b=PUDm/5NeDoE0ZphNuiZ1rHHJ+PcqetPtESc0Igkk9jNbwODlqWL+eRjZqXayqTQ+nOFzHpSWv11uopvgxcz+bXrLq1veDiDI+PZpBeAsJc8Azm0bA7mQuTpqKxMdXx10y6Rp/4YQ1U/Z25OgPUfMuRXVAOwmwrq1QEADAmwcd1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790172667; c=relaxed/simple;
	bh=0KFWGU9SAbbq2IsuLGa81DkMG3xWPqc5bZn/pUE1qys=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Sjwn2oOvMjscMeuldcH3wSYM6yFZcur6mKlVEjsw1/yfOq9ysTbtbdYu9I3xUnZzFZ0UwuxMpj2KTT9Jw8Ub3EzABijv5Wnpx7JGOr9y6vAxLD1P6EjTgidYfBu9TKOkXd2uj7jyeHib7cmOwq101u+3TIz26tNmUTGuLqqKvXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=HXF2hxsS; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=vzfMbud6; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="HXF2hxsS";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="vzfMbud6"
Date: Wed, 23 Sep 2026 16:11:02 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1790172664;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=B1eGi9W6Fq7TjMGNtao/9qjYgNaKFqm+jpSzF9CaP3E=;
	b=HXF2hxsS9Ji9BcA8GdDWlkcbYYaIYA/ahPzuQrBbcwBOWWgYAcKL7ErfjGmdjLlC+zXvBC
	7cN0C+Bq+p42fp0HaI6KkVUTZnr5bWUXQiiOH1MtYRM2Yw+yG1viaIh+P3vXEXNpG67cA7
	mVVyK2RTe2H2m76QHMWIpMlIWCrcOQlpb4uCyHObQyzZwLBiknQEDK5viUMqK5gECyPtc1
	v1LV1jR0E50byeUrqGpoaGiv4vhZ0fEFn6e999LTmLFiclGLL56zz86qf4bwBS7Mg/6FnC
	jrtDx3eSmeHraaIv2fnWln/qhsE6S4O4ZVp4xcWt3F+k5pMVh9tq4UzG3SN2UA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1790172664;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=B1eGi9W6Fq7TjMGNtao/9qjYgNaKFqm+jpSzF9CaP3E=;
	b=vzfMbud6zyYu6ed/5625o2ZlXggqUvkTkSvptYW0UykfsD6+6gpfYj8ksRnlfLSttQWKHA
	WuOPzmDj94ySi5CQ==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Ben Copeland <ben.copeland@linaro.org>
Cc: Denys Fedoryshchenko <denys.f@collabora.com>,
	Alan Zanoni Peixinho <alan.peixinho@profusion.mobi>,
	kernelci <kernelci@lists.linux.dev>,
	kernelci-webdashboard <kernelci-webdashboard@groups.io>,
	John Ogness <john.ogness@linutronix.de>
Subject: Re: kernelci test results
Message-ID: <20260923141102.n8dg59TG@linutronix.de>
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
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CAL0q8a6RKqmEte6t+NcYX3u60YvJS+q_THcwKcO6YReY310-HQ@mail.gmail.com>

On 2026-09-04 09:44:31 [+0100], Ben Copeland wrote:
> Hi Sebastian,
Hi Ben,

> >  > > Later there is the cyclictest invocation, arguments and the result.
> >  > > There is no max-value set for the test so it passes. Would there b=
e a
> >  > > notification if the test failed and if so, where?
>=20
> I cannot find any thresholds set, which isn't ideal.
> parse_rt_tests_results.py prints the literal string "pass" for every
> latency line; only cyclictest's return code decides the overall
> result. So a max-value parameter on our side would change nothing
> until the parser learns about thresholds.

Regarding the thresholds. Assuming we agree on a default threshold of
100us.

There is
   test-definitions/automated/lib/parse_rt_tests_results.py

which has this piece:
|     if int(rawdata["return_code"]) =3D=3D 0:
|         print("{} pass".format(testname))
|     else:
|         print("{} fail".format(testname))

Would that be the right place for the decision (test passed vs failed)?
If so, we could invoke cyclictest with the '-b' argument passing the max
value for the expected latency and then cyclictest would terminate if
the value is reached with the exit code 2. This is however not entirely
possible with the current binary, there is an outstanding patch
	https://lore.kernel.org/linux-rt-users/20260824101852.2237494-1-costa.shul=
@redhat.com/

to be merged. But other than that=E2=80=A6 :)

> Ben

Sebastian
