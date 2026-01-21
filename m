Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C3BD2DCF55
	for <kernelci@lists.linux.dev>; Wed, 21 Jan 2026 18:58:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769021921; cv=pass; b=C8RScAfo3odDdKCEkVw4L11VPtsQnITZ0nooTWb43F7a9obGDZu8ZYfSOE8pvIp4lsckq81PWbwYTxeiW3mhBtR3OdYaotOBrT3EwEoJV4t5XbtHNhC+SP/m4xsoSqnbGJUJbjDBZeSc8CFUqStUBB2IIk7GB5clY4ruMfD4PaI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769021921; c=relaxed/simple;
	bh=vZpCv3q+WKcTrSCeE2Q8MOKwXd6SUZAgebLBlAcB3HI=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=nPYu8M0ZjCPy/Wuasc62RMzv9HgHROlG0vy05grmzestqKKmm2R7sX9+KogIB0vgJ1+kTRcHcfw4tQvlv2z6qTjVUnlSDdc/YRYSQs9X4/63Ro6F5FbuRBQGY/VohJr/6Z5lhgS/Tf1Li/aoJdDeSHi8C6/+w46JViY0bS5ltJU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=profusion.mobi; spf=pass smtp.mailfrom=profusion.mobi; dkim=pass (2048-bit key) header.d=profusion.mobi header.i=@profusion.mobi header.b=Ua94h0YR; arc=pass smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=profusion.mobi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=profusion.mobi
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=profusion.mobi header.i=@profusion.mobi header.b="Ua94h0YR"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-81f5381d168so219752b3a.2
        for <kernelci@lists.linux.dev>; Wed, 21 Jan 2026 10:58:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769021917; cv=none;
        d=google.com; s=arc-20240605;
        b=hceKy8gXvu2lCHQIsPR7VQGwF04m+WDGKvrFg64pmIWbOm+RD956eCpU556ZG3y7gz
         mgFsfbtSBayL8bILNdKg5oQ78iEG6c/bYiOy0+IhZOLTglf6KPFc4SRvbWO03O3+gOpX
         UmzJ49zQVCWkgP3lUPBua1Hdx6KfgKIruS+91uvLOo1gihyOSHDLSg72YhmQWIL81jVY
         CwAjcGu7MPflK7xMuc4359eyIRl6iVSALaVlnPgDHrY0dSVl4Hl/aqXmWZQVKNLm1P1M
         OhWzor1zSKqXpLxjsWr7C/RJ8XoMPWA0HRmsljofUwpmHpuTJAKP8UBdofsJgcHIN4VK
         CigA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:dkim-signature;
        bh=vZpCv3q+WKcTrSCeE2Q8MOKwXd6SUZAgebLBlAcB3HI=;
        fh=iE0vmLwB6/kNrV5nreBoAlr+nMoMNEJT8UrOo+5ZA4A=;
        b=ByPobjXde4d2tkuGOVwY5Lb6W0gvwEIc7y6C0P44575xsQmrlaGVfFwAEOF4ODbM3O
         +kif6DUdPZ7tw7M7/qH/cF58Pz1rXgAycz6fgX2suRFMlR/IN+/AKpLZzHDEPs7uMN4s
         bbFh+llGe6BqKwTlWRP0zWCMYBOOWIjk0khCVMIjJ6fdh2NUW7e+gaUvJ1JL4Xg5PyTJ
         rUjmBwUezcDNgBzXEZWCEF1N4W5ys+jvnP/pCHbejknvOOyTt9rsd0zGnI5V7ea0x9e0
         3HwV7vH/BCpxockJyhY4QfwEx/kHJ9s476vBbKC/9cdOqLkhqSQQb/FEHJPXGNm9v/P0
         k9tw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=profusion.mobi; s=google; t=1769021917; x=1769626717; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=vZpCv3q+WKcTrSCeE2Q8MOKwXd6SUZAgebLBlAcB3HI=;
        b=Ua94h0YRks0yD91NMcJBNQ9MyQWN1aIjPCDH1OVR4J8kp5E56qpXPn5I6O51heUKud
         K6fBbJXSlXS2JVNUMG/cDIEv/IY7Rr4DyQzR6YE5JUCC6tfFlRnUL3kZoIFdqAcmsbK6
         CfhxNMXqlYYnBw8tnPUBPyI1LAI5pCde3SYcrw7lUcz7gVdqKCwtfM0atzXRdAR8x/5J
         SMI+PDp81L9qU0Tvcnj0NcxO2rwkoaKhgBv4O4qxMYDEXevnU5JOvQS4iz4pSFxmOA/+
         VBHa3/4eYLCbbjtNCJaleixjKygy0PQsCexadS/bgFjUaYXiBo3VNFF5GMTr3rRkraYt
         D12w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769021917; x=1769626717;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vZpCv3q+WKcTrSCeE2Q8MOKwXd6SUZAgebLBlAcB3HI=;
        b=Y0uWSnIKCCLpHr6bk4DZxp1SRAJ/J96n3QAwXJbVHSMr4Q8UftFcUK+oMN5ZIdFave
         1gj2rDdB4xTg4e99d+fmuCUoT/q1ePhIj4Mi+kCymb+k59ROpQ6IRx665022VYaE3J5r
         1VsnQvX/PJQZSAL2ax30XOuOMzv/T/NwsQ3Dax7WfuvsZuWjoF9niuChODBSUv49ICPH
         5D8RWQ+Yjx5g3su3vteMPlTDahQGoykJTpsrKJnwzmPHpZCA02Hdczy7Ky1nLd6ft4MC
         y7gZBQF1L4kXiYfV+p4zJGEwzPOmepWwUXh9qzUoX6jPjTA3vVMwsZ8G+GO0j1/rci3Y
         phzg==
X-Gm-Message-State: AOJu0Yz2F/e1llo/WevoqWdN8IH7Ag9KjaG2ebYwF4mhgr9zlHJiHkwa
	yTkwSodK5nS1i2DhHP06yQAvUuzR3oIpv8SnNYEvpE8cZTQ6dV+oanecOQ3XOR3+ddVv/CXD9E0
	ep9+8EcIexXqKS2ctyjjP4A2jG2mG/ldF0AnG00UoRKcXiEXD8bQslkGCNA==
X-Gm-Gg: AZuq6aLzhIhZQsmyGupvENoUgq+6g9BZjJYaqShPRojGTcM/mhQG2OE5GDvjo+RlwXM
	LpHLI94xi5xczo2CF/53Rql+o+kZQic0S0EqLy9wOxCD1bSugx5rGsGRltyXrRr2U/PfA5Ngzrc
	yVokLik3xVbiAfmvE1CtueV4pB+dXqsmPw6ExORuffxuCxxJUBi0QZD3ZaIZBKT1PA9Z6V5dxrk
	AVnVqaBeai3K0n4iK3yc0Te9u8WtwHoFPMttV4oSKAaV6xulfioAmavtw2nI0giKDE67oC9lQ==
X-Received: by 2002:a05:6a21:3a93:b0:359:c3:c2ec with SMTP id
 adf61e73a8af0-38e45d62ee2mr5785158637.35.1769021917500; Wed, 21 Jan 2026
 10:58:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Gustavo Flores <gustavo.flores@profusion.mobi>
Date: Wed, 21 Jan 2026 15:58:26 -0300
X-Gm-Features: AZwV_QjfS0kcMitAICMaG7_skLJnw4A7SUOr8uLMJEdBtl_UIW-XxRGgSKbpeQc
Message-ID: <CAB31pVk5MsWzPxYc-ctAg8rfVGvYcVGzsxXNi+KEWkf_5B2qTA@mail.gmail.com>
Subject: KernelCI Dashboard - Hardware Listing Behavior
To: kernelci@lists.linux.dev
Cc: kernelci-webdashboard@groups.io
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi everyone,

We are working on some improvements on the dashboard and would like to
hear your opinion.

Currently, the hardware listing and details pages on the dashboard
only show hardware that has tests in the latest checkout of each tree.
As a result, some hardware ends up being effectively "hidden" from the
views.

We discussed this internally and see two possible approaches:

1. Show all tests within the selected time frame (e.g. last 5/15/30
days), regardless of checkout.
2. Show tests from the most recent checkout in which each specific
hardware was tested, even if it's not the latest checkout of a tree.

With the first approach, the number of displayed tests would likely
increase for larger time windows, since we would no longer be
filtering by checkout, but this shouldn't be a problem.

Since this would change the current behavior of these pages, we=E2=80=99d l=
ike
your feedback: which approach do you think better fits your needs?

Best,
Gustavo Flores
