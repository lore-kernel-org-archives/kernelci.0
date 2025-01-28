Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC9531B59A
	for <kernelci@lists.linux.dev>; Tue, 28 Jan 2025 01:49:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738028980; cv=pass; b=Mh/YSLfgkj54jWX3gMS/YN1nomBU4wQVbdKNaz3FZpkNwz68vHLjgugH705PF4Jqaw9MqdpS6iyIg0y+QCR06q3IKSJoZg4UyPXwnqAEvrzs/44F/iMgqcec7N12SzFOHUlgK9CSoloUkuYDiqsBHn6kbhza8yyoAnVfiUUP1+Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738028980; c=relaxed/simple;
	bh=M32V+KVZimZqfAKZPpanBbE3xzX03A+MXxBzsWsQU8Y=;
	h=Message-ID:Subject:From:To:Date:Content-Type:MIME-Version; b=QA97WWOPiPZ5t3kGWVEQdd6mSE1/pg82djTp1nEM0hsy7aHonuM/iAppGGi+Nl8xjdmcDB4i2Ywi6oDjVG4VmHbxNY8K5go/Qec3pIO6yV/UA4xYmPPL9nkA94jcMQ+IKhun1mrXqYPLumrv4MBwDaKO/FB6Ucc1SdloV0+Jn/o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=denys.f@collabora.com header.b=aPedJULB; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=denys.f@collabora.com header.b="aPedJULB"
ARC-Seal: i=1; a=rsa-sha256; t=1738028976; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=cm1PJ2ZX6J5WHlRjZtlQg7d23LFGuuP1KCaspRFzRa6Hb4r0zie1vV7feimF1uFZ3JrY9+qdXYq3x3bbvYbLASdWKt+Ef/Qhx/w7RqyXxaOtuj1ruTMisIJ4/1PApbjF1qYzpfzvvwP8OgQ59yhMEa1YrG+5QvYBZoOhP8texNI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1738028976; h=Content-Type:Content-Transfer-Encoding:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To:Cc; 
	bh=V5VU+sU/CW+Aa8BtZlfzUku+IXl4qgo6TWy+hJnnB5A=; 
	b=OP+OBRbi0oyFx1RWA75e4U9XYt1EgSclT6f3jdzsV3i83eOj3dmSiBzGFdqAWgdRwV66ZDU3CwImwhETsEJdQeMV6pg4zZmdFeyX1GUc4MX+f+qdemFHjZioJzlKGya3LJ/jz3bzfNTsAzZoNnuHNP0g/T7EcI+tXqw7tI586cc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=denys.f@collabora.com;
	dmarc=pass header.from=<denys.f@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1738028976;
	s=zohomail; d=collabora.com; i=denys.f@collabora.com;
	h=Message-ID:Subject:Subject:From:From:To:To:Date:Date:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To:Cc;
	bh=V5VU+sU/CW+Aa8BtZlfzUku+IXl4qgo6TWy+hJnnB5A=;
	b=aPedJULBEN26DTFldCVQyxCsD0hg5UENzsm4FjlL3Fl1VDCs+s75UlIiaMGBUbE7
	LZkddiz7xcWK2PlLiTv+JdDmdyZQ7wW5X4YrUEwlmeA0PJ/CsYdT+YDsgK7INI7WY/T
	M3uai/sA07QrldNhFkEtvmyBH/J53B32CsweUpwY=
Received: by mx.zohomail.com with SMTPS id 1738028973470971.793396268736;
	Mon, 27 Jan 2025 17:49:33 -0800 (PST)
Message-ID: <8895855f627c1a0d17e510738ec3105936e9eedf.camel@collabora.com>
Subject: KernelCI Weekly Newsletter (Week 4)
From: Denys Fedoryshchenko <denys.f@collabora.com>
To: kernelci@lists.linux.dev
Date: Tue, 28 Jan 2025 03:49:30 +0200
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

Summary

Apologies for the delayed update as we were finalizing the newsletter conte=
nt.

This edition is dedicated to the latest release of kci-dev.

We=E2=80=99re excited to announce that kci-dev v0.1.2 has officially been r=
eleased!

Currently available on [PyPI](https://pypi.org/project/kci-dev/) and [gento=
o](https://github.com/gentoo/gentoo/commit/2f500dc9e17abdb5f447106c4e284384=
c56e0da6).

This version is providing the following new features =20
for the recently added `kci-dev results` command. =20
`kci-dev results` as been splitted into three subcommands:
- `kci-dev results builds` Display build results.
- `kci-dev results summary` Display a summary of results.
- `kci-dev results tree` List trees from a given origin.

each of the previous subcommand can be executed without arguments in a loca=
l Linux Kernel tree =20
repository folder like in the following examples:

```sh
Linux Kernel:
=E2=9E=9C  linux git:(master) kci-dev results summary
git folder: None
tree: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
branch: master
commit: fbfd64d25c7af3b8695201ebc85efe90be28c5a3

pass/fail/inconclusive
builds: 46/0/0
boots:  580/48/8
tests:  7858/6903/654
```
```sh
Linux CIP v4.19.325-cip116:
=E2=9E=9C  linux-cip git:(linux-4.19.y-cip) kci-dev results summary
git folder: None
tree: https://git.kernel.org/pub/scm/linux/kernel/git/cip/linux-cip.git
branch: linux-4.19.y-cip
commit: 6e07bbcb7050f0840638c734437cc842a855dd10

pass/fail/inconclusive
builds: 19/2/0
boots:  298/52/25
tests:  165/180/105
```
```sh
Linux CIP v5.10.233-cip56:
=E2=9E=9C  linux-cip git:(linux-5.10.y-cip) kci-dev results summary
git folder: None
tree: https://git.kernel.org/pub/scm/linux/kernel/git/cip/linux-cip.git
branch: linux-5.10.y-cip
commit: 6077b17f20b1bcfeccaa23bc05573b938c47679d

pass/fail/inconclusive
builds: 21/0/0
boots:  440/36/18
tests:  1190/184/100
```

Added new `kci-dev config` command for adding a configuration template to b=
e used with the maestro commands
```
=E2=9E=9C kci-dev config
Config file not present, adding a config file to ~/.config/kci-dev/kci-dev.=
toml
```

Also, new bisect command has been added! We=E2=80=99ll provide examples and=
 detailed usage in the next newsletter.


