Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 054D71CB519
	for <kernelci@lists.linux.dev>; Tue,  1 Oct 2024 16:17:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727799446; cv=pass; b=ihRGMO4MQ0v9OhbhIiAUiqav370WELBpvf/c+VQtWTHxrKcHZpp3z2PE7wuKl9qLGxVH2vcU2BWn17/hn0SZMNClZrdWkTbRzg4JqzuZsdSLflSk8YhXRgWz4OI73AVmjx5XiQMehtLX/ZZ4+CeulAKPcJJH1BZb2StZwf1lVS4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727799446; c=relaxed/simple;
	bh=6pwo92hhor9V48K27tAc4wzLwXYI79+05XgJOt5y8G0=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=F92daPAkY2vZyPc3mp2hHkOM3uri9aj1jtBaXJmLEbmipTmPgc18RNuuuQWAwYr/pZRQPG1LVx9Ln11hsYThEN2VdvCYzpFodgpe2F8+IIBYDx+OmOlD5cakGckyG1XCvV0n3vJ30sgtrMFh34Voo/sIdMrR63c0QkbuoxrdYpk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=gus@collabora.com header.b=SO/ci/jx; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=gus@collabora.com header.b="SO/ci/jx"
ARC-Seal: i=1; a=rsa-sha256; t=1727799442; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=H0oVzlnyOsI4Vf2IHZMzwvyBI82D0Pqdu3eYYXxliKyhewelk01YorxVW+euuQS03ZTFc8RQ/o37qsgfvnUjRxy7yWPN6lZ/iwseyuZI/EVr/RHkdDp4YB5RLk22HZWtouPM/MP/nlM4Yen9aBtNgnp8iUbPix5aMnYrVz3f9i4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1727799442; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=49bHsrlq/5dRHsYYu6slZH6cb0oLKFoNnrp1ZhvhW8M=; 
	b=WQutthxj0YtAGgZR1c2pawt3GleggfGJBvhL1Zejb4RgJvfVllt0gKehzXoX8X4OXOnEON5CyvKky68WFy4A2X73CyoxOgcFR00k5o2unE+Q6AGTq+DtTzoNl1WJeX1rimlwtdnRbt24vnhYIda5H7+djOIQwC3mOxJfhFL3+V8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=gus@collabora.com;
	dmarc=pass header.from=<gus@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1727799442;
	s=zohomail; d=collabora.com; i=gus@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Message-ID:In-Reply-To:References:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=49bHsrlq/5dRHsYYu6slZH6cb0oLKFoNnrp1ZhvhW8M=;
	b=SO/ci/jxotMI0F59PotpBPCN7nPcUF97dP7dF4kxPDTAJQDj/pd1Z+weNb7/3wNg
	9llNv481oOe9Ijt2sEP1pQZXN8tKuloeE7d5f7wXi2vRBDNg+yhjx/cWY/9mDhpqZUL
	wZp7c1qSOaNOtR3tuF31PrO3wCcb176SuEFDFXxM=
Received: from mail.zoho.com by mx.zohomail.com
	with SMTP id 1727799441277876.8785403331386; Tue, 1 Oct 2024 09:17:21 -0700 (PDT)
Date: Tue, 01 Oct 2024 13:17:21 -0300
From: Gustavo Padovan <gus@collabora.com>
To: "Alexandre Ghiti" <alex@ghiti.fr>
Cc: "kernelci" <kernelci@lists.linux.dev>, "Rafael Sene" <rafael@riscv.org>,
	"Helen koike" <helen.koike@collabora.com>
Message-ID: <19248df3764.c59f50b81776107.1655937717841580625@collabora.com>
In-Reply-To: <82421990-2826-4efc-adbe-8b256e7b4b12@ghiti.fr>
References: <82421990-2826-4efc-adbe-8b256e7b4b12@ghiti.fr>
Subject: Re: RISC-V
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Importance: Medium
User-Agent: Zoho Mail
X-Mailer: Zoho Mail


Hi Alexandre,

---- On Tue, 01 Oct 2024 12:21:49 -0300 Alexandre Ghiti  wrote ---

 > Hi everyone, 
 >  
 > We (the RISC-V community) are looking for improving our CIs that are 
 > currently spread over all the RISC-V companies, mostly private and very 
 > incomplete. 

That is great to hear!  We have other hardware vendors coming to KernelCI with the same wishes of improving CI overall.

 >  
 > I only found one RISC-V build in kernelci, can I do something to help 
 > adding a better RISC-V support?

YES!

First of all, we can enable more kernel trees and kernel configs in the maestro system.
That would give you wider build coverage. If you have a list of configs we can work on adding these.
- https://docs.kernelci.org/kernel-community/

Then, we have to look at running these kernel on actual RISC-V devices. We can get RISC-V devices in KernelCI through a maestro lab, either through some of the existing labs or setting up a dedicated lab. Cc'ing Rafael from RISC-V as we discussed that already.
- https://docs.kernelci.org/labs/

Another way, that could be relatively easy if you have a CI setup already, is to get the results of the current CIs in the RISC-V ecosystem into KCIDB (as long as you area running fully Open Source software in those tests).
- https://docs.kernelci.org/kcidb/

Let us know how does that sound to you. We would happy to learn more about the ways we can make this work and chat more with you.

Best,

- Gus

