Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8D1315CD49
	for <kernelci@lists.linux.dev>; Mon,  2 Sep 2024 19:29:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725305373; cv=pass; b=JqL0bBsgkMx6fCUdYsWgM9f5QYohD2bcQnULtnbAs2oKy0Hon4rQ9Mm9lKPMRYGPu2lPSD86ac2EW1lgzfcl8dr4ng6Dc31Mrwnll73tUdZnTwlwUwnFmORv5xGtUn6KMK6KMuwO14NFvKlIceV/21prXfOHvL6xyhvWN4bj+LI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725305373; c=relaxed/simple;
	bh=nkOnWXyvn5Nx59vzEeD2UPWH2cHyCojk+sX0JomtebI=;
	h=Date:From:To:Message-ID:Subject:MIME-Version:Content-Type; b=hcgdj2SY9EwjKCEIY/zNDXutLEUAL2s3cIUtnvk4oPVsY1onppOKf/4DK/ScTg2SpvfJ542kp9h98xLp+32dmdQiolG1jRBVPRGBnpVsuAH3rO7/xxMuDg8SrW+Iy325y2z5wFmX5xGJQeHCVvyYdjK68UhnwzonuZsWutOMuSQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=gus@collabora.com header.b=GOorEIDe; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=gus@collabora.com header.b="GOorEIDe"
ARC-Seal: i=1; a=rsa-sha256; t=1725305369; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=RhPmq8Ckgo8KbNFJrJAnfQNgVTj2MQqZhRcWVDqTFM7PNfKd0GlcxOu0EdZfSYOEE5PbjaSp4lcF8Q8vbqUbtwlujPAlI7IfFCpRj7OR8lfWQBcJ1/jpkCJ1X/rOD9j6BKe2Su1u39NDgSWHlcJyMHj3FprTT0HDX6LXCEELH98=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1725305369; h=Content-Type:Content-Transfer-Encoding:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To:Cc; 
	bh=yfc6QmQqmpu6zjN1Qr65nMa2PpsvNPxdh7ScNQ1nShc=; 
	b=D9kfRD4Tg7JK4+siG3kHQw1GSvoZEHiyGWoQUigvOBdCx5gC1hI17oXyW8FO9RMqXtK0z+YckO9HYkK1HpxbI4pvKnoooWueImSaFdOB980d6L6xYOoH9NMBUxoz5E2aMF/Osdpht/t3wl+a1tcToq+T5ucetHvRVyvWJn53lU4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=gus@collabora.com;
	dmarc=pass header.from=<gus@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1725305369;
	s=zohomail; d=collabora.com; i=gus@collabora.com;
	h=Date:Date:From:From:To:To:Message-ID:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To:Cc;
	bh=yfc6QmQqmpu6zjN1Qr65nMa2PpsvNPxdh7ScNQ1nShc=;
	b=GOorEIDeT8beSLJQQc4Zp71AgD/h1y+q0Jw2zXNhfnBJqeUPJeVeKHhLddzfnLhu
	jd9RMT7xqPRZ0MLTkPTd/THRhAh2Bg7l/d+pojHdg46w9eiqsvZgWWNnlzryPVhyGsa
	aOJi3FB2gguW9jQKKVdJd8y5wqytwvYGkBU5F6bE=
Received: from mail.zoho.com by mx.zohomail.com
	with SMTP id 1725305367296138.65070260104994; Mon, 2 Sep 2024 12:29:27 -0700 (PDT)
Date: Mon, 02 Sep 2024 16:29:27 -0300
From: Gustavo Padovan <gus@collabora.com>
To: "Kernelci" <kernelci@lists.linux.dev>
Message-ID: <191b436aae2.11a2b21001544684.624149179881179984@collabora.com>
Subject: ELISA Seminar: KernelCI presentation
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

Hello,

The ELISA Project holds frequent seminar to dicuss topics of interest for functional safety in Linux. We were invited to speak about KernelCI there this Wednesday, September 4th.

Don Zickus and myself will be sharing the all the good stuff of the new KernelCI infrastructure there. We also plan to have some discussions about possible intersections of both projects for further advance of functional safety in the Linux kernel.

Check the all the information and meeting invite at:

https://elisa.tech/event/elisa-seminar-meet-the-new-kernelci/


Date: Wednesday, September 4, 2024, 7:00-8:00 Pacific / 14:00-15:00 UTC / 16:00-17:00 CET

Speakers: Gustavo Padovan, Kernel Lead at Collabora and Don Zickus, Distinguished Engineer at Red Hat

Abstract:

KernelCI started 10 years ago as a small project to test the kernel on Arm devices. The project grew over the years and today a new architecture is in place. In this talk, Don and Gustavo will present you the new KernelCI. The KernelCI community put a lot of effort recently to design and implement its new testing architecture with a focus on facilitating the kernel community and industry engagement as much as possible.

Our new KernelCI Architecture (1) allows different services (such as patchwork, b4, etc), multiple CI services, and users to send request to test patches; (2) supports all sorts of testing platforms and hardware labs, not just embedded hardware; (3) focus on quality of test run, rather than quantity; (4) brings common database for all CI systems with automatic post-processing of regressions.

We will offer the ELISA community an overview of KernelCI and look for potential areas of collaboration between both projects.


Regards,

- Gus


--
Gustavo Padovan
Kernel Lead 

Collabora Ltd. 
Platinum Building, St John's Innovation Park 
Cambridge CB4 0DS, UK 
Registered in England & Wales, no. 5513718


