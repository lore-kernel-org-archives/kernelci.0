Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4424B1D31B5
	for <kernelci@lists.linux.dev>; Wed, 11 Dec 2024 21:54:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733954047; cv=pass; b=W9ip3DYWisNpfTtX4xoI1WeHma4J6qHkrIFmQZhZgu9N5xj1xTrQ/c1FoikYq7GN6NBrdLRBffby0N3gR9NBQtETUKIDM5bKT8j0I0c/Z9ARReFYAIo9XgEZt0pZJuOW4jcB8oyUD/vhC4C0rWM+qOcrt42eJ3fuWS9DiQux0Mw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733954047; c=relaxed/simple;
	bh=TglsoPLlYhQm2Cq7g5l+tXS+SzuNEWgEWitmtE5lPi8=;
	h=Message-ID:Subject:From:To:Date:Content-Type:MIME-Version; b=S4rzwO3gJoH1OYNfBXvjYTv6dgQmirb3iqRuodhtwsztEoRJ33ZmWERCUINVyF9nJeEHnXu/IvJ1L3I0JkPPQvJc691567ADpbQBxC6zf+ZUQUcWS6HvvCTB+4nzXF8ErHw/6KqWXiVUN4R9eLPbymrPFGE2PkAvCs1xLwFCxxg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=denys.f@collabora.com header.b=dZabUL5S; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=denys.f@collabora.com header.b="dZabUL5S"
ARC-Seal: i=1; a=rsa-sha256; t=1733954043; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Y6SYWBf6yiYUfz96K9Ki07seqnPhcTbFB3JLvH46TMyynmyKMfDjqEeZf9j6ZN9uA1zPtMFmxBi+RvS24C2CLQViRw6skDaoQALdUbw7lK25Wzb+oEaf8zqDbDJqpAiNqYVH9Pk0RX76jnlmzjphTuav1xc2wc0cAvPjLRp4z2I=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1733954043; h=Content-Type:Content-Transfer-Encoding:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To:Cc; 
	bh=fgQvcp8W2yCLer9iBsuoB2VQocYYsG0qbvZZChxfDDw=; 
	b=IO8nBK0W/Qq/LNUramPnj73lyp+TAVD3oCSuqZDuddq/vkvb1zEEY9hl+U6LaydlKzhRK4L78PdWLhvkb1uYSbjLAK1JkeXpx6GzfY1bd4TUPKUANiZziCaqqoyIZ5m28InWW7UBRl8qjVQWC2aRjs6o2v4sTiHNMZMNGHkew+Y=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=denys.f@collabora.com;
	dmarc=pass header.from=<denys.f@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1733954043;
	s=zohomail; d=collabora.com; i=denys.f@collabora.com;
	h=Message-ID:Subject:Subject:From:From:To:To:Date:Date:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To:Cc;
	bh=fgQvcp8W2yCLer9iBsuoB2VQocYYsG0qbvZZChxfDDw=;
	b=dZabUL5SbvnOdPVriPL6VsoaJGFGW8C+Cb6waeBCK3RBVmKh3w48IxeyUbcLpa/G
	IjLVneu8zeeyoyGj4KwlmkQRJZD2wclZi135Xi3eeqTu0n/pDarLjM14FPIO2S/pTcp
	qyUAhqB2yoix4K/yTCm3VKGrXmZIb3s/5Q7qi3/A=
Received: by mx.zohomail.com with SMTPS id 1733954041715233.09331894620993;
	Wed, 11 Dec 2024 13:54:01 -0800 (PST)
Message-ID: <4fd04778fbcbe65d889fb68ebaaaed4f5ff6ec69.camel@collabora.com>
Subject: KernelCI Weekly Newsletter (Week 50)
From: Denys Fedoryshchenko <denys.f@collabora.com>
To: kernelci@lists.linux.dev
Date: Wed, 11 Dec 2024 23:53:58 +0200
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

The issues with KCIDB submissions have been largely resolved, though
KCIDB is still experiencing minor problems with large batches (should
not cause data loss). We continue to monitor the situation closely.

This week, we also began planning a redesign of the storage subsystem.
The goal is to improve performance and reliability while providing
artifact storage for both KCIDB and partner CI systems. Since these two
subsystems require significant work, most other features are on hold
until their completion.

**Known Issues**

- `/latest/docs` and `openapi.json` are currently returning a 500
error. We are investigating the issue.

### Key Updates

- **Storage Subsystem Design Proposal** =20
  A design proposal for the storage subsystem has been drafted: =20
  [Storage Subsystem Design
Proposal](https://gist.github.com/nuclearcat/2d34f8266ccd1b8356bd993eadcf2e=
ed
) =20
  Feedback and suggestions from the community are welcome at the weekly
meeting and via the mailing list.

- **New Pub/Sub Subsystem Design** =20
  Work is underway on a new Pub/Sub subsystem to address fundamental
issues with the current implementation, including non-guaranteed
message delivery and the lack of load-balancing features. =20
  - The new subsystem will use Redis Streams as its foundation. =20
  - It will be backward-compatible, requiring no API changes, enabling
seamless migration for clients.

- **Experimental Features in kci-dev** =20
  The `kci-dev` team has started implementing experimental features for
retrieving results from the Dashboard API. Details can be found here: =20
  [GitHub Issue #57](https://github.com/kernelci/kci-dev/issues/57)

- **Re-enabling ARM64 QEMU Support** =20
  Efforts are ongoing to re-enable ARM64 QEMU support.

- **Buildroot Rootfs Fixes** =20
  Long-pending fixes for Buildroot rootfs (pending for two years) are
being addressed.

- **Dashboard Improvements and Fixes** =20
  As always, continuous improvements and fixes are being made to the
Dashboard.

