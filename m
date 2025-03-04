Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97F4924EA92
	for <kernelci@lists.linux.dev>; Tue,  4 Mar 2025 17:00:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741107655; cv=pass; b=SgaKosjHcqADJB2W+am/UyUU7E9k1mn0Xaw/2jFYKSvXgA+pZpUZj0wpqmhWKx3u4H0CA1rFt7C3zEdrXAl3NLfNKb6AulJ48FNdjZLkcJcVoxOIIOaFw1K/8g7ClfbSdhJx0FvKcNpEjODfXovlGRnwjAqBNCXj4spX1HrrZ7E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741107655; c=relaxed/simple;
	bh=cEzIfXBkuFewP7IayxDT1pO9+2eoKNPRsvZaQ6DVe20=;
	h=Message-ID:Subject:From:To:Date:Content-Type:MIME-Version; b=NmWB7S3DjtpYUakiFsVLawAdh3LkE31YfHIYaSYHd74vBF6v9pSoK11g3qykUHusCI8AaVqJMuk4Eaj5pT8ZJFSKWWM5UaTUbGVNhyNHCeaCp25G5qIipsUiS5Y0Z4ITzkQtN5rCZpHpCQM5XbEs5JFYzHBOCw+HjNUdkYBe/Ag=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=denys.f@collabora.com header.b=g8bB8918; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=denys.f@collabora.com header.b="g8bB8918"
ARC-Seal: i=1; a=rsa-sha256; t=1741107651; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Q0yQ0yNUP4Nv+pohHnjYx4a8kmm/MS4YT2JVVxfGnz1mgEDR1q0yoOQUfF4KeY+5K2pn5nSKiC5TMgG800SVS1mPWGJ2EqhOgRW86N7Acb3a6QVxM9AUxzi0qerkD+9d9wwTL8cOSemXpcy92iiHHIJe9wS6KkwRUyIiwWwFrbI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1741107651; h=Content-Type:Content-Transfer-Encoding:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To:Cc; 
	bh=cEzIfXBkuFewP7IayxDT1pO9+2eoKNPRsvZaQ6DVe20=; 
	b=jbPKPtM51c4EhWI1RcxUPHxcUk7KinV/wVIPT5JREWTm1JnNHTbQYKRazSZYajzFx0q4C7945TRU3qN3YE3X0pVB4n87jdBiut6ZwhY02N/KwuVBDXoTHBsjv28hapU3A/wpfWD2QLnYDrHQIXmJnSK/yy0uonaorw7ai8Hp3Bg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=denys.f@collabora.com;
	dmarc=pass header.from=<denys.f@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1741107651;
	s=zohomail; d=collabora.com; i=denys.f@collabora.com;
	h=Message-ID:Subject:Subject:From:From:To:To:Date:Date:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To:Cc;
	bh=cEzIfXBkuFewP7IayxDT1pO9+2eoKNPRsvZaQ6DVe20=;
	b=g8bB8918InQBcuexHu55SzCAqQtWyKadTqysTPrv6Ul1zrps+uAiuwUzwJIjDEc3
	tRVGGKeYFpv/fU3Ed1HEjwnEm4Mter10Uo07hdfMdmNdnBUldGTcwuagvXWNh3PUMyp
	cVxWz+8nau2tskZWQsaBRik+g9TaInlikzGyAe7U=
Received: by mx.zohomail.com with SMTPS id 1741107648452902.0505682859653;
	Tue, 4 Mar 2025 09:00:48 -0800 (PST)
Message-ID: <55ecd071061c867bc52464cc5170446e685a5766.camel@collabora.com>
Subject: KernelCI Weekly Newsletter (Week 10)
From: Denys Fedoryshchenko <denys.f@collabora.com>
To: kernelci@lists.linux.dev
Date: Tue, 04 Mar 2025 19:00:45 +0200
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

## Summary
It's been a while since our last newsletter, but we've been busy
working on significant improvements that we're excited to share with
you. Here's what's new:

## Sysadmin: Production Server Fully Upgraded
Our main workhorse, the production server based on Debian Bullseye, has
served us faithfully for a very long time. However, due to the
significant size of legacy services and some deviation from DevOps best
practices, we decided it was time for a fresh start. We've created a
new, polished Ansible recipe and reinstalled the server with the latest
Debian Bookworm.

## Sysadmin: Staging Environment Significantly Improved
As with any properly organized development cycle, the staging instance
is a critical component of our workflow.

While our staging system was already quite robust thanks to
contributions from many developers, we're constantly evolving to
shorten the development cycle. Many KernelCI features require advanced
infrastructure components (LAVA, Kubernetes), meaning even minor
contributions need thorough testing.

Previously, our staging cycle took 1-2 hours. Now, using GitHub
workflows (just like in production), we've reduced this to just 15
minutes. Additionally, staging logs are now more accessible to
developers, allowing them to track PR merges, docker image status, and
more.

These improvements mean that when we have an urgent patch or
contribution, we can deploy it to production=E2=80=94with full testing on
staging=E2=80=94within 15-30 minutes (including staging update, triggering
kernel tree compilation and testing via kci-dev, and production
update).

We're currently working on comprehensive sysadmin documentation that
explains how everything works and provides examples of how new
contributions should be tested.
