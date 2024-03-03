Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D82BC7AE5F
	for <kernelci@lists.linux.dev>; Sun,  3 Mar 2024 22:35:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709505330; cv=none; b=GQg0xstFQgQXE1/Ng2CDWrskSllgCxBCMYgL3SplIs8bAZCDkfDG8jbymVHe66urPpy2P0m61UGEkqMRIJzrgCgC4m/tX9hbG43rpVX3R67vdIfZPcoYxC2OspuID70X5aL7XY4b/89SxQzYtMxyACWftjjO3FUc1cNI0j2CANU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709505330; c=relaxed/simple;
	bh=57dcsP0mKRmzvMH9skbShUDlKdNdzM0IGL+0YP5cmLg=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=tich56D/sKsrYRK2pWUznoU+81feyRN9NeOPlh4IVhfBdPnVgb1+D2pLE4EniZIlBps0WTMJNX/CRR1hj28M8fudvD2bUV+JPLI5qD7D7jvyWyK6tVvoI5kL+KllX7Sk2NBPY9Z0kfdgUZUMLGFjWD0xFlCmkFh01srIxwQXXY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gtucker.io; spf=pass smtp.mailfrom=gtucker.io; dkim=pass (2048-bit key) header.d=gtucker.io header.i=@gtucker.io header.b=MVLBYsJo; arc=none smtp.client-ip=217.70.183.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gtucker.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gtucker.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gtucker.io header.i=@gtucker.io header.b="MVLBYsJo"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6D3D760002;
	Sun,  3 Mar 2024 22:35:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gtucker.io; s=gm1;
	t=1709505319;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=5CdqRGtG3irErhVMT/I81U99VRvlaTPQzWCtVYciBAk=;
	b=MVLBYsJoDO41liKhEUcSEcOpX1pf9uyzGsaV8r1Fpn6gKzHP5H0Ru32Ly2wIVu/bBopnUX
	iXgBMaDi1XyZqUK65r5LhGjf0wSe7Hsyj8D0JJz7zOL0K07XyDlF2RCUINZeAUHme+eDra
	NIlqY3wWN4vSzwPRKYRVuAt3EJy9pX0StBLV78MfsD0oCR/3+IJUl+x7DhRryruyqCVIC1
	Gxauxz1jMaj2l5kF+q7bquruxHPCVweqHjZwFQGhxAdcKgUqC1fJjzGgTuZg7YAG77bWsy
	Phu9xVJuKwNk1eyNnwJ+5/z7K12GyyXFie5PWc4NM1G7SWuZheI9aSkyUeHr0w==
Message-ID: <71f59a56-aef3-4bae-867b-769a0cdd1c1b@gtucker.io>
Date: Sun, 3 Mar 2024 23:35:17 +0100
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: kernelci@lists.linux.dev, automated-testing@lists.yoctoproject.org
Cc: kernelci-tsc@groups.io, kernelci-members@groups.io,
 Shuah Khan <skhan@linuxfoundation.org>
From: Guillaume Tucker <gtucker@gtucker.io>
Subject: [RFC] KernelCI Travel Guide 2024 LF webinar - 21st March
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-Sasl: gtucker@gtucker.io

Hello,

On 21st March I'll be giving an online talk about KernelCI as
part of the LF Live Mentorship series of webinars:

   https://www.linuxfoundation.org/webinars/kernelci-travel-guide-2024

While this is not something I'm doing on behalf of the KernelCI
project itself but as an individual, it seemed appropriate to me
to bring it up here and collect any potential feedback from the
community.  Is there anything in particular you think should be
covered?  Please see the current outline below, it's not set in
stone and there's still some room for additional topics.

In particular, I was wondering whether there was an update on the
new API roadmap which was meant to reach its main milestone
today (4th March) with the production switchover.  On a related
topic, the UX Analysis work is currently on-going but I haven't
seen any public update on this either.  Generally speaking, if
there's anything that seems important to add regarding all the
recent developments then please let me know.  This is more about
the last part with the 2024 horizon.

Thanks,
Guillaume


----------------------------------------------------------------


Outline for "KernelCI: Travel Guide 2024"

* Part 1: History
   (10 years in 10 minutes)
   * 2014-2015: Initial version
     * Started at Linaro
     * Dedicated to building upstream kernels for ARM
   * 2016-2018: Emergence
     * Boot testing in LAVA labs
     * More build capacity with VMs, more labs
     * Automated bisections
   * 2019: Linux Foundation
     * Launched with founding members
     * Still more-or-less the same member companies today
     * Drastic change of scope for the project, whole upstream kernel
   * 2020-2021: Ramping up
     * Kubernetes clusters for builds
     * Functional testing
     * ChromeOS
     * KCIDB
     * Community survey and new design PoC as a result
   * 2022-2023: New API
     * Updating the overall design to better serve the community
     * Modular API PoC
     * Preparation for new web dashboard
     * Unifying use-cases with a single KernelCI tool set

* Part 2: Guided Tour
   (main part)
   * Current build capacity
   * Current functional testing capacity
   * KCIDB stats
   * New API roadmap and current status
   * New web dashboard efforts
   * Overall impact
     * Cherry-picked stories about bugs reported and fixed
   * Growing community
     * Pre-merge testing with BPF CI (Meta)
     * Collaborations with Pengutronix, TI, ARM
     * Rust support
   * Side topics
     * regzbot
     * GitLab CI
     * Manual kernel bug reports
   * End users
     * How to engage with KernelCI
     * kci command line tool
     * Web dashboard requirements and user stories
     * Empowering users: from manual custom tests to full automation

* Part 3: Horizon for 2024
   (discussion)
   * Challenges
     * New API roadmap delayed
     * New web dashboard progress gated by new API
     * Transition period with new team members (TSC, board)
   * Advanced features to be unlocked
     * Performance testing (measurements, stats)
     * Advanced bisection based on stats (Scalpel PoC)
     * Dynamic scheduling to run jobs based on results and available hw
     * Post-regression checks beyond bisections
