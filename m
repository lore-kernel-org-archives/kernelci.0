Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7724A288DB
	for <kernelci@lists.linux.dev>; Thu, 28 Nov 2024 09:54:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732787698; cv=pass; b=bl7awVskcdsawhcwAgOGjjmklWM6Y8AAU4ryxjn7j5uuBoGJrR8t8WUbRsATOkGpDj2qB+aaoWnqZ1E/6TVrHyRuTwF1VOX+1dYEfDasr+0EShw4Xs910J43zQtJuv0PAToF2qihrjXN1NIK8F3e+yO6s6U1u9zz9t9CfgbGZ/c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732787698; c=relaxed/simple;
	bh=LWk0Ye7E2FqTF13SvkWfukelAwQExqKg8QRZCx8MaxI=;
	h=Message-ID:Subject:From:To:Date:Content-Type:MIME-Version; b=F5i3GJmnZAP7OUx3KGaSq1hOO6AmMibdurLIsiGHTwgPiTJvDKo0yUaaPcI8AYtXg6P2o9MYjexPmCPzu6Qg6lN228Io+kRFOzc3PDnyV/iXPBb8a0jZgbwbSTdGhGcxP7jKEY3jyyL8aAQcIik3OQ6N1FIo2sf2+c7PxFKXLhE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=denys.f@collabora.com header.b=T1eFq5w/; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=denys.f@collabora.com header.b="T1eFq5w/"
ARC-Seal: i=1; a=rsa-sha256; t=1732787694; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=JnvkzK5FceTGP7PWmvWkYkJUpEjGRgHNwNNvNlQvFVBQKl3JvucSNPP4nbL9gAdKW2MqeKO0EKrN7/eHURbw3s1N72b+pY3bdV2YrBqys/LgNAsxfF3xHcHVyaseSsi3V00lLhUCjcvqmGXyTPEAPULvGom1/5wxsyKeYYySlPc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1732787694; h=Content-Type:Content-Transfer-Encoding:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To:Cc; 
	bh=LWk0Ye7E2FqTF13SvkWfukelAwQExqKg8QRZCx8MaxI=; 
	b=EhYfUC/+yU0L4DB7WZpHHVnKqOXm3R3qVU/Br/XYB/geOZg47XwBsgclYVhakR3hZdxGSsCnEOjJ0MvLJDdVETUPiExdf7+CQH7QTARq3uVVV3ByFl73OdwcymXSUPb7n+DnvTH3q8NZi5WHlQY+v6hYza+YVKdsNtBamuxPKv4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=denys.f@collabora.com;
	dmarc=pass header.from=<denys.f@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1732787694;
	s=zohomail; d=collabora.com; i=denys.f@collabora.com;
	h=Message-ID:Subject:Subject:From:From:To:To:Date:Date:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To:Cc;
	bh=LWk0Ye7E2FqTF13SvkWfukelAwQExqKg8QRZCx8MaxI=;
	b=T1eFq5w/GbJc1H2ntE42plKQ0hm18VsEprLnwSmCf4pV773SCUQ7yLLMDm9MLOPN
	D93rSliHEWdOgg+67qGu1ctp3z2usDeQ3m/gfbQEmItzFZed9oAEFoUnYnkcnNXE9Y5
	EkjeuVdYCFRzcGsw0buNVNsGVNGPbDwas+tWDzeA=
Received: by mx.zohomail.com with SMTPS id 1732787694296329.92625736675143;
	Thu, 28 Nov 2024 01:54:54 -0800 (PST)
Message-ID: <d2233efc5b6a4c4e4ed73cd572c277b3fa93f7a9.camel@collabora.com>
Subject: KernelCI Weekly Newsletter (Week 48)
From: Denys Fedoryshchenko <denys.f@collabora.com>
To: kernelci <kernelci@lists.linux.dev>
Date: Thu, 28 Nov 2024 11:54:51 +0200
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

Welcome to the first edition of the KernelCI Weekly Newsletter!

As our community continues to grow, we recognize the need to keep
everyone informed about the latest developments, regardless of their
ability to attend our weekly video meetings. This newsletter aims to
bridge that gap by providing regular updates on project progress,
upcoming discussions, and community highlights.

A Note on This First Edition

As with any new initiative, we're learning as we go. This first
newsletter might have room for improvement in terms of format, content,
or delivery. We're committed to making this newsletter as valuable as
possible for our community, and your feedback will be instrumental in
shaping future editions. Please don't hesitate to share your
suggestions, point out areas for improvement, or tell us what you'd
like to see more of. We see this as a collaborative effort to create a
truly useful resource for the KernelCI community.

1. What to Expect.
Each week, you'll receive:

- A digest of key development updates and milestones
- Preview of topics for the upcoming weekly meeting
- Community contributions and achievements
- Important announcements and project updates
- Opportunities to get involved

2. Why a Weekly Newsletter?
We believe that frequent, consistent communication is key to
maintaining a vibrant open-source community. By sharing weekly updates,
we hope to:

- Keep everyone aligned with project goals and progress
- Enable asynchronous participation in project discussions
- Highlight contributions from our community members
- Make it easier for newcomers to stay informed and engaged
- Provide a historical record of project development

KernelCI Newsletter (Week 48)

Summary:

This week's development activities focused on infrastructure
improvements and build system optimizations:
- Infrastructure Updates:
We expanded our Kubernetes builder capacity to handle increased
workloads. However, this led to temporary build congestion as we needed
to rebalance the load across our builder network.
- Production Updates:
Some production deployments were delayed due to bugs discovered during
testing. Our team worked diligently to address these issues before
proceeding with the updates.
- KernelCI Enhancements:
We added additional build configurations (allmodconfig to stable-rc
trees) in KernelCI to improve our testing coverage. While this
enhancement provides better testing capabilities, it initially
contributed to the build system congestion as we worked to optimize the
new configurations.

Known issues:
- Some checkouts were failing due '/' symbol in git describe. Fix
deployed into production at 2024-11-27
- Some builds are failing on new capacity and become "incomplete",
issue is under active investigation.
- There is some hiccups at 25-27 November due changes in k8s build
capacity

New features, changes and fixes:
- Add legacy build capacity, multiple k8s build clusters
- Add minimal support for k8s load-balancing
- Reconfiguring build k8s clusters from legacy to Maestro
- tarball filename creation is fixed for the case when git describe
contains invalid symbols
- Pydantic fixes from Jeny Sadadia
- CONFIG_CPUSETS_V1 added back to chromebook configuration, as ChromeOS
requires it (regression introduced by
1abab1ba0775036bb67c6c57945c637be644c04f)
- logspec is being built for staging/production images from it's own
repository
- send_kcidb bugfix for nodes that have missing some of job metadata
- src/send_kcidb: get lava labs from config, dynamically, remove
hardcoded values
- Enable v6.12 stable-rc branch
- Disable baseline tests for ARM Android (as devices fail to boot)
- Start documenting pipeline configuration file
- Add allmodconfig to stable-rc builds, as suggested by Todd Kjos they
greatly improve build coverage

Planned changes / Discussion at weekly meeting:
- Archiving legacy repositories
- Archiving mongodb database
- Pinning Maestro and KCIDB repositories to main github (org) page:
kcidb, kernelci-pipeline, kernelci-api, dashboard, kernelci-project,
kci-dev
- Discord bot development (newsletter reminder, github actions
notifications)

