Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 620B0AD2F
	for <kernelci@lists.linux.dev>; Sun,  2 Feb 2025 13:19:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738502350; cv=pass; b=kuMmI217eX3tTkiAjEAbiK6wlN9ZO1QBS1R1Aa5OdktlW73QM3wN548qZOXqK8oyIR1o9Jb63hSikGzuv3FPEhmRuaFJg2Ej196ySZ1K4AXG7kFg/r2DenbM4jp/X1D/hqYCw1Ey8DO9WYFjEXX3abYEbaRgdcDZdDWiHZcaSt4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738502350; c=relaxed/simple;
	bh=qVVBhtmKQFPrvMmYjvWyJyTRAwWAvw32waXuYHu0UVc=;
	h=Message-ID:Subject:From:To:Date:Content-Type:MIME-Version; b=fsy5MqAxfzfzEf4F4o/JJZQPvAHjRHcGIF3mCeQcILb0xldp2KwkHcJNIEUZHPsRE5nWw5Dizv0rq9Tr3ctLrrHCtAURIEM8f9lLPzbqh3LCr4TV2HxxO8mEBrDUOOnCpV4e0b/uO1cVxX7pKiNTH52QO7gQB7Riyz4TEqMK+fc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=denys.f@collabora.com header.b=YJ2T0Ldd; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=denys.f@collabora.com header.b="YJ2T0Ldd"
ARC-Seal: i=1; a=rsa-sha256; t=1738502345; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=IaElo1IcobTQ/o0rfzOVjpEbgN7BzJC5CUW5BiREBRELToKE4AoASHjIUod5eTEY9xh8iK7tYk0OeZk2x2RNP050s492vRBvcdaN2Gpgop3idfXj671KCw52uEHknH6A3CR1qMYT5e5lQzAArIJ8KkRs+oVzAe4Z2KDmsSRS1ZQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1738502345; h=Content-Type:Content-Transfer-Encoding:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To:Cc; 
	bh=qVVBhtmKQFPrvMmYjvWyJyTRAwWAvw32waXuYHu0UVc=; 
	b=VQFPlCoXjX60RclD0nX2r3+EO3B3/JAzcvEj3zls+6Sj0tUL4DdbwxHmU+c25bd9ymaQTcIinix+OWb8wlaC5DfaO+AnNTP+Gq8BovFxt9aDy/+P5x2siRakPd5PESTtF3/jOy8ZPX8Gf8p2hb8xUOyNo6bUm2RTbq+PJ4x1jsM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=denys.f@collabora.com;
	dmarc=pass header.from=<denys.f@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1738502345;
	s=zohomail; d=collabora.com; i=denys.f@collabora.com;
	h=Message-ID:Subject:Subject:From:From:To:To:Date:Date:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To:Cc;
	bh=qVVBhtmKQFPrvMmYjvWyJyTRAwWAvw32waXuYHu0UVc=;
	b=YJ2T0LddQB9L6QM2RdnaMplAxVCdja/d8NA1CIpW034JpILHAYWJE/Ma/eU4ZSkm
	Qt+n83weNahA1ooRWnj14s9pwsoAbraYZR/h2sfetldGWkUVKFA2OmXXQWNBbfBPtpS
	APX/duXOYieH6GTVaMVJoTtd3COkdweoqxfn7Qrs=
Received: by mx.zohomail.com with SMTPS id 1738502341095226.73863335266446;
	Sun, 2 Feb 2025 05:19:01 -0800 (PST)
Message-ID: <b746afa1ae72011a3ea65fa84a0237486b191d83.camel@collabora.com>
Subject: KernelCI Weekly Newsletter (Week 5)
From: Denys Fedoryshchenko <denys.f@collabora.com>
To: kernelci@lists.linux.dev
Date: Sun, 02 Feb 2025 15:18:58 +0200
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

# Weekly Development Summary

## Key Highlights
* Sysadmin team successfully implemented production deployment
workflows via GitHub
* KCI-dev received significant updates and improvements

## Sysadmin Team Achievements
The sysadmin team has completed the implementation of production
deployment workflows through GitHub, marking a significant milestone
for the project. This enhancement represents a substantial improvement
over our legacy system.

Previously, deployment relied on server-side scripts with multiple
manual interventions. The process, which included building large docker
images, typically consumed an entire workday. The new GitHub-based
system, leveraging free CI/CD capabilities and parallel builds, has
dramatically reduced deployment time to 1-2 hours while fully
automating the workflow.

Key benefits of the new system include:
* Increased deployment frequency capabilities
* Broader deployment access across team members
* Enhanced process transparency and documentation
* Reduced operational overhead for the sysadmin team, requiring only
initial process initiation and final verification
* Elimination of dedicated deployment server requirements

## KCI-dev Updates
Special recognition goes to Gustavo Padovan and Arisu Tachibana for
their valuable contributions to KCI-dev this week.

Gustavo Padovan implemented several significant enhancements:
* Real-time build status monitoring through the watch option (PR #107:
https://github.com/kernelci/kci-dev/pull/107)
* Enhanced results command functionality, incorporating boot and test
results with hardware filtering capabilities and visualization
improvements (PR #102: https://github.com/kernelci/kci-dev/pull/102)

Arisu Tachibana delivered multiple critical improvements:
* Implementation of stability fixes
* Streamlined pip deployment process
* Introduction of KCI-dev development version
* Additional system enhancements

Reference PRs:
* https://github.com/kernelci/kci-dev/pull/106
* https://github.com/kernelci/kci-dev/pull/104
* https://github.com/kernelci/kci-dev/pull/103
