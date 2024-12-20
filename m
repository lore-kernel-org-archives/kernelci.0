Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94DCF25949A
	for <kernelci@lists.linux.dev>; Fri, 20 Dec 2024 05:53:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734674036; cv=pass; b=JbMDbUe30wXNNvJp1L4C4dXKwjsXG3zEI7kotnv7seatT0Xtjgp6IoZBVRNL/VoGMyJBnhQFofChoOS1RmPvJ5QFNwr8GX6qJ5L8c6XgH2JLbCYihAoHyJYgr3j6ZNpBqC0LdOpadbHZk3BoddgTJyWWKswpH4/JRx08u2n/cTs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734674036; c=relaxed/simple;
	bh=liphiUIKnHCfTvc4W60ugXBgyhsGHJmsXaYoHh0U/kk=;
	h=Message-ID:Subject:From:To:Date:Content-Type:MIME-Version; b=MmcIHdD2uJktbNLy/86JjcI0P3vlcDlLHAMiHhf3bGjRBorE0EZDjvV0m/5p8a4cU9PI4lGPX6tZiDxH0NhI1GAmBE6jdCF/dt6Mcl25nTKvzKBTMg7WSCBu6tyL94YwVlZ8+u3iaXhji/u4kp1Wa3y9JKbJUMIrAMxG3vUPyL8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=denys.f@collabora.com header.b=aReyfUSl; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=denys.f@collabora.com header.b="aReyfUSl"
ARC-Seal: i=1; a=rsa-sha256; t=1734674031; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=BqWgPRIEfaVlvq9XUqVRbfzD3Dyb25bm3+5Zzf3ocozvzyAcXGlQ8IBYP31RVuti6UnB4am4gJ7RC9Eq/10bu99AdOsCqGrMvFxVrNrjhidx4wRBqqJns8dD5BwAg38oci49xWva5nV8ThW/174O0nf0tdSsfHGyPf5Vm2JT9AA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1734674031; h=Content-Type:Content-Transfer-Encoding:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To:Cc; 
	bh=ZswAJOk7nZ+Z7ZhgSjXxhIiO3P/4C9EO+UTYO42xVLo=; 
	b=bjN78w7q6b2MuwaIedALvUTsMXBpsf4nCux5knoeyBzGTWW5mkb1VJWZNgmDxRJkwctld8Wn9wK2V36r5sDOWDwXGV1BBzOKYP3z+Yg3Vah4kl+PTBaJVZP0i+YA30OxrTqIChduCYPVUES0ck9mGdtHe4zc300flm1DfELOYZ8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=denys.f@collabora.com;
	dmarc=pass header.from=<denys.f@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1734674031;
	s=zohomail; d=collabora.com; i=denys.f@collabora.com;
	h=Message-ID:Subject:Subject:From:From:To:To:Date:Date:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To:Cc;
	bh=ZswAJOk7nZ+Z7ZhgSjXxhIiO3P/4C9EO+UTYO42xVLo=;
	b=aReyfUSlUyocJUNVDXd276gb/Pv5CUzW/AksemK9zc9VL8+DE5dug93G6asPtcVZ
	ASOJ3W0Hgb5aCk11eu5DvUuPLOZOEyqaLlE0XnYtQy8a9zv0MfIDuwyE94FG+ibFkoS
	XnCLLKmpMqIuu9d2DycEoTKkHyIw6fSUP5B2LYyU=
Received: by mx.zohomail.com with SMTPS id 1734674029581349.8111748011428;
	Thu, 19 Dec 2024 21:53:49 -0800 (PST)
Message-ID: <0fef5105b0f02a3f913e6284193156e66014239b.camel@collabora.com>
Subject: KernelCI Weekly Newsletter (Week 51)
From: Denys Fedoryshchenko <denys.f@collabora.com>
To: kernelci@lists.linux.dev
Date: Fri, 20 Dec 2024 07:53:47 +0200
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-ZohoMailClient: External

**Summary**

KCIDB notification generation is overloaded due to too much data per
submission, constantly running out of RAM, this is exacerbated by the
queue replaying failed messages. The 8GB maximum RAM limit for Cloud
Functions is not enough to fit all the data - there are too many tests
and incidents in some submissions. Despite this, smaller submissions
are still getting processed, and we're getting some notifications
through. I have now limited the number of retries to five for each
update message, and set up dead-letter topic, which should receive all
the discarded messages. Because of this increased load (constant Cloud
Function execution) our finances are taking a hit and we're projected
to hit close to 800 USD this month. We have an option to completely
disable notification generation once again to save some money, but that
would mean no notifications will get through at all. If everyone agrees
that would be a good thing, I'll submit a small PR disabling them.

I've been investigating this problem for over a week now, approaching
it from different angles, with different solutions. I'm arriving at the
idea that we need to make a radical change on how we handle data for
notification generation. So far, for simplicity's sake, we cached the
complete data for each processed revision in RAM, and that no longer
works for some revisions -there's just too much data. E.g. this
revision has 217288 tests with a similar number of incidents:
https://kcidb.kernelci.org/d/revision/revision?var-datasource=3Dedquppk2ghf=
cwc&var-origin=3D$__all&var-build_architecture=3D$__all&var-build_config_na=
me=3D$__all&var-git_commit_hash=3Db32913a5609a36c230e9b091da26d38f8e80a056&=
var-patchset_hash=3D&from=3Dnow-100y&to=3Dnow&timezone=3Dbrowser&var-test_p=
ath=3D

We need a more sophisticated approach, involving paging, only loading
summaries by default, and requiring narrowing down our queries with SQL
on the server side. It's possible to add these mechanisms to the
existing simple custom ORM we have in KCIDB, but I think it would be
more efficient and future-proof to try to use a ready-made, fully-
fledged solution. I think SQLAlchemy could be quite suitable, based on
my conversations with ChatGPT so far, and previous research. This will
need to be combined with pre-processing using (materialized) views on
PostgreSQL side, as SQLAlchemy doesn't work well with aggregation and
denormalized data. I'll be doing more research and experiments on this.
It would also be good to evaluate our overall architecture and which
databases/solutions we're using, again, in case there are better
approaches, in case we can improve costs, query performance, or
flexibility. However, that would be orthogonal to the problem of
fitting our data in memory, which I expect will be chasing us forever.
E.g. I successfully retrieved the tests for the above revision on a
machine with 32GB RAM, but that would be the maximum even for Cloud Run
containers, and in any case would be expensive to keep increasing.

** In other news: **

    KCIDB had a weird problem deploying from CI for a while, involving
PostgreSQL access issues from the Grafana container, which went away by
itself;
    I doubled the storage limit for PostgreSQL, to 400 GB, as we were
at 75% use already.

** Other Known Issues **

- The /docs endpoint remains broken due to compatibility issues between
FastAPI, FastAPI-users, and MongoDB in their current versions. This
will be investigated when additional resources become available.

** Ongoing Discussions and Development **

- From Maestro side we are trying to limit number of submissions.
- Work is underway to implement a storage solution in Rust. We are
actively discussing potential storage features, which are detailed
here:
https://gist.github.com/nuclearcat/2d34f8266ccd1b8356bd993eadcf2eed

Happy Holidays!
Thank you for reading, and apologies for the delayed newsletter.


