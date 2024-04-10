Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EA80181D0B
	for <kernelci@lists.linux.dev>; Wed, 10 Apr 2024 21:27:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712784461; cv=none; b=XElpktoItj+3sDD/ZSmwX9rNs1HEay9xAG4XcEz1wYMpCqoZWSdloJnuS7t0RXACvVgCocpXWEOwLo3nZNyhPrHLbevA1m1PpT4rufr9EMkQxa/SXXRxiZJDhkYrnPS39MkMBurWlx03zRrc3jel8JzT0QSLO8YywMaE8tudKe0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712784461; c=relaxed/simple;
	bh=83U+K7s8/ob577rgnp3XkgQ+UImC4kuYsqWP54bSYQw=;
	h=From:To:MIME-Version:Date:Subject:Message-ID:Content-Type; b=awtO19MwNzp0NeSlQSNdKLV9/mTEcnq021DuHogVft19MTFspDn/5VQmu+ZPXmKdlDt3QM9nEh57fP4x+eGO3nJGnTR957z3b96MXRgP0Rq5Iqh7wIwsJmHm9Ct7XGYp90rdMroZ/XP9WMd3t8tgb56PuT78XtK/3npWMZrdzeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Received: from harlem.collaboradmins.com (harlem.collaboradmins.com [IPv6:2a01:4f8:1c0c:5936::1])
	by madrid.collaboradmins.com (Postfix) with ESMTP id 5020E378200D
	for <kernelci@lists.linux.dev>; Wed, 10 Apr 2024 21:27:38 +0000 (UTC)
From: "Gustavo Padovan" <gus@collabora.com>
To: kernelci@lists.linux.dev
User-Agent: SOGoMail 5.10.0
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Wed, 10 Apr 2024 22:27:38 +0100
Subject: KernelCI evening gathering at Open Source Summit =?utf-8?q?=40?= Seattle
Message-ID: <3c0c9c-66170480-315-194ac52@36759582>
X-Forward: 127.0.0.1
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hello everyone,

If you are attending Open Source Summit or Embedded Open Source Summit =
next week in Seattle, we want to invite you to hang out to chat about a=
ll things KernelCI, kernel testing, solar eclipse, etc.

We will meet on Tuesday starting at 7pm. The place is still TBD and I a=
m trying to pencil this down asap. I'll update in this thread once we h=
ave location confirmed.

Please send me a note if you are planning to come so I can plan the spa=
ce properly.

Looking forward to meet you! :)

Best,

- Gus

--=20
Gustavo Padovan
Kernel Lead
Collabora Ltd.

