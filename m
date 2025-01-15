Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9F2F1EBFE8
	for <kernelci@lists.linux.dev>; Wed, 15 Jan 2025 11:35:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736940935; cv=pass; b=mWj5ALJzHxga4tm8dgasunZrgMES4cOYpxRDufJJUKWBVgWwn7TWshqUMY0FHeRoaeU1cukFLwDBXUzdJEYsPqJXXdlI5gUSQeFmbe4Bi388plXIdJGeXid8MMYKTfBMl4Us/IXoXYsGa3/sRDEMRtRGgcZEovel+hoVbJhqjpc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736940935; c=relaxed/simple;
	bh=jigMdohUs5H7URzFOGVWYvK87nVu7xuefkDvS0fQoPU=;
	h=Message-ID:Subject:From:To:Date:Content-Type:MIME-Version; b=OVkDX/TFaf4b0H8DUqCB+5eI4Ivq9bJQX4BXQfFDKrM9Ree+x78lCQ6NgrZ3RKbWFC0HrrDvuFlnQ2ZXyA5PfLMAXshfX6jbqvRI7kr2N1FhKciDzsnCzwoNS35cND9N5fRRGCAQpqVL9m3YEgCqLd1LfJIZJVNp3GJQTLk3kdg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=denys.f@collabora.com header.b=T1DfwAI/; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=denys.f@collabora.com header.b="T1DfwAI/"
ARC-Seal: i=1; a=rsa-sha256; t=1736940931; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=dU15fKK/IDkhe8zdMyAe/OEVNe1a+tI/W6nG6pq8OgcDNIvh2waeYiMAMfje8B4c07P0pPDDuiZLvem6yKS3pEo0Ms4nQjy2959uDwStxUcw6AqpXbU1ssGtgKlWT6qGlzxtlmfXJVy2LTvucXo7B8kVUYhhcUPNeNPq2+hSRUc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1736940931; h=Content-Type:Content-Transfer-Encoding:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To:Cc; 
	bh=Yn1a2ezw0sDzYikA0C31iBFlruGvc4t8KTQso5o8/vw=; 
	b=G2flFgYsHEg7eqPTXB+cuHbXdW7py9TdHzXW9c4ubnF3grLUx9tJzOdN6xay+tIF7MEyKSu73PsJCaUJ+IrH9BcLFPhvXKGAfhuD6cqATBrn1hR+sZDes+5s8umM3it9I6ohPsKDOWXDXQWISRR4oGHGidiN7xhEqju0rgvAgcM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=denys.f@collabora.com;
	dmarc=pass header.from=<denys.f@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1736940930;
	s=zohomail; d=collabora.com; i=denys.f@collabora.com;
	h=Message-ID:Subject:Subject:From:From:To:To:Date:Date:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To:Cc;
	bh=Yn1a2ezw0sDzYikA0C31iBFlruGvc4t8KTQso5o8/vw=;
	b=T1DfwAI/VoSDDRq21o6bJRzbpC/ME85542g5j04SanSthmPoockPPMo5Wq4A2FHS
	l8R/PSIhq5oFHsjLGy5A2gD5YutfUF9flXPIpkirIhanneHCeKuKMc3nyOId3q6WiiB
	JjsghiYvhjBjpG3k/SOp2pI/heIl0YRMog9P7RHI=
Received: by mx.zohomail.com with SMTPS id 1736940929678662.2440089813945;
	Wed, 15 Jan 2025 03:35:29 -0800 (PST)
Message-ID: <8b00de79dda2b1aebc01e9e62ace74053be76da0.camel@collabora.com>
Subject: KernelCI Weekly Newsletter (Week 3)
From: Denys Fedoryshchenko <denys.f@collabora.com>
To: kernelci@lists.linux.dev
Date: Wed, 15 Jan 2025 13:35:27 +0200
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

This week, we focused on the following:
- Enabling full support for the GRUB bootloader, including NFS-rootfs
support.
- Enabling kselftests on the Aaeon x86 platform.
- Fixing kselftest build issues caused by missing environment
variables.
- Enabling net/kselftest on x86 (amd64) and arm64 platforms.

**Sysadmin**

Except regular production updates, we have been working on:
- Separating storage tokens for Kubernetes build clusters to allow
testing of new storage solutions without impacting production.

**kci-dev**

As kci-dev continues to evolve, we released version 0.1.1. A special
thanks to Arisu!=C2=A0
We have been utilizing kci-dev for various purposes, and here are some
examples of how it can be used:

- **Running a Single Test on a Specific Platform in Real-Time** =20
  ```
  kci-dev checkout --giturl
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git --
branch master --tipoftree --jobfilter kbuild-gcc-12-x86-chromeos-intel
--jobfilter tast-power-x86-intel --test tast-power-x86-intel --
platformfilter acer-cb317-1h-c3z6-dedede --watch
  ```
  This command checks out the latest kernel from the master branch,
builds it with GCC-12, runs the `tast-power` test on the `acer-cb317-
1h-c3z6-dedede` platform, and monitors the results in real-time. Such
combinations are often used to verify the consistency of test results
on specific platforms.

- **Testing a Specific Tree on Staging After Configuration Changes** =20
  ```
  kci-dev checkout --giturl
https://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest.git
--branch fixes --tipoftree
  ```
  This command checks out the latest kernel from the `fixes` branch of
the `linux-kselftest` repository and builds it with the default
configuration. It invokes the same builds and tests as in production
when a new revision is pushed to the `linux-kselftest` repository.

- **Initiating Bisection (Early Stage)** =20
  ```
  kci-dev bisect --giturl
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git --
branch master --jobfilter kbuild-gcc-12-x86-chromeos-intel --jobfilter
tast-power-x86-intel --test tast-power-x86-intel --platformfilter acer-
cb317-1h-c3z6-dedede --good 2f27fce67173bbb05d5a0ee03dae5c021202c912 --
bad 2d5404caa8c7bb5c4e0435f94b28834ae5456623
  ```
  Using this command, we can initiate a bisection on a specific
platform and test, while monitoring the results in real-time. The `--
good` and `--bad` parameters correspond to Git commit hashes, following
the same procedure as the `git bisect` command.

We will share more examples of how to use kci-dev in the next
newsletter.

**Planned Work**

Next week, we plan to update the production server. As a result, there
will be some downtime for `storage.kernelci.org` and
`docs.kernelci.org`. We will strive to minimize the downtime as much as
possible.


