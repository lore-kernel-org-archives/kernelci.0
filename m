Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2AB62DE6E2
	for <kernelci@lists.linux.dev>; Thu,  3 Jul 2025 12:12:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751544754; cv=pass; b=Wj9cMzOQLVtOhb0cp0eL7s33SZWDxdxa66/5ZAGCs0sxiu2PJwskH8YvTBlkeKkfxIkbR9CwfgKcSt9cSmJbvYAYyNb+G13WeQRp0h1xswjska0ngUblf8+0oChemSW2gdGGnfm2aX7pdDS3SqkxjR6Q1uM39hUOl6SG3t9QwPA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751544754; c=relaxed/simple;
	bh=y9Ka96v+JA8G/jI0hq8PgrQvlWNSwQhzhDXtGVpZey0=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=CDTIXMIGBYW3GgETV6C0xIEwu8z+chR4NFqPIMFOxA2QrNm9t8/cCt+32eneV+fUseNtWenEuC7rqZl0EybwJOz0rbOX4bw5tgrp1R+HERda46Bu/Cd2vW4jf1INlUqcFLKRq3Gp36yHUdqqhZGYeJI2GmLfXTqFztd9g2U9Hnc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=gus@collabora.com header.b=P8ECoi8I; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=gus@collabora.com header.b="P8ECoi8I"
ARC-Seal: i=1; a=rsa-sha256; t=1751544743; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Yd0+jYeaHGruAngfmvjEd0igl7BBOQBZho9/84gZxhuFL9nG/MFxcOZXSdnpRkO7pvYg7cF1mofhPrIyH6Cr1/C3ovl88QtYyu8jxfvmApjfNzyjA5BfHYeGFXiulbMxwa9CRdYUh9H7XYonr/vph0/Q1LDrWd5PjpwtdDyTJBw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1751544743; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=2Dko/rKU2PLyvZhElmcvysXBcdNKX0Y2Ci5z0r6sAoA=; 
	b=ebG1K9BxKkbpSSvbOZwSKQd5UTSJvwotyg5K87a/yVqltVI3UAhJN2hYtXYL5xhmR9xiyh216IZRaWW3xyZXt7qBZm1davcJmAHiGczuJ19x/UwRHuYxP6fbCi7IkQjtC4kxF7fyFgiv1Sq64lOEVj5VfzJu7dZsUt+qyCDCsrI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=gus@collabora.com;
	dmarc=pass header.from=<gus@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1751544743;
	s=zohomail; d=collabora.com; i=gus@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Message-ID:In-Reply-To:References:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=2Dko/rKU2PLyvZhElmcvysXBcdNKX0Y2Ci5z0r6sAoA=;
	b=P8ECoi8IhJmOK455EtR3hL/XKX8yV9xMMbqWhXuX7/STOZYJoflhHALLvdD6APYM
	BVPUYJEIbrNNJbTCvMpTqk9FBlJiWWaT/0qUl0Y6NMiTSmYAuNKVLuiQaR8lzsWMrr7
	/3TXvEDQ4v4WSe12fNnXAtGzMVr3nkcLl9hz/QZw=
Received: from mail.zoho.com by mx.zohomail.com
	with SMTP id 1751544742106578.6666399723613; Thu, 3 Jul 2025 05:12:22 -0700 (PDT)
Date: Thu, 03 Jul 2025 09:12:21 -0300
From: Gustavo Padovan <gus@collabora.com>
To: "Liping Shen" <liping_shen@aspeedtech.com>
Cc: "kernelci@lists.linux.dev" <kernelci@lists.linux.dev>,
	"Ryan Chen" <ryan_chen@aspeedtech.com>,
	"Denys Fedoryshchenko" <denys.f@collabora.com>
Message-ID: <197d033c065.10b26e217232212.3079559047099293962@collabora.com>
In-Reply-To: <TYUPR06MB612177D6F57D1A988ECD4C3BF343A@TYUPR06MB6121.apcprd06.prod.outlook.com>
References: <TYUPR06MB612177D6F57D1A988ECD4C3BF343A@TYUPR06MB6121.apcprd06.prod.outlook.com>
Subject: Re: Request KCIDB Submit Token for Test Result Submission
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Importance: Medium
User-Agent: Zoho Mail
X-Mailer: Zoho Mail

Hiy Liping,

It is great to hear of your interest to test with KernelCI.

I'll answer you inline.


---- On Thu, 03 Jul 2025 03:27:08 -0300 Liping Shen <liping_shen@aspeedtech=
.com> wrote ---

 > Hi KernelCI team,
 > I=E2=80=99m Liping from ASPEED Technology. We=E2=80=99d like to request =
a KCIDB submit token so we can submit our test results.
 > Our setup is more of a legacy system, and we=E2=80=99d like to connect t=
o KCIDB using a polling + submit approach.
 > Our plan is to:
 >
 > 1. Poll for KernelCI-built images

Yes.  You can take this example code to listen to the events

https://github.com/kernelci/kernelci-pipeline/blob/main/tools/example_api_e=
vents.py

 >=20
 > 2. Run tests (boot, etc.) on ASPEED physical hardware
 >=20
 > 3. Submit test results to KCIDB using the kcidb-submit tool. The attachm=
ent contains the report data from our boot tests using KernelCI-built image=
s.

Denys will get you a token to our staging KCIDB-ng instance. We are in the =
middle of a transition to our new KCIDB infra, so the docs will be a bit in=
flux for the coming weeks. We are sorry about that.

 >=20
 > We=E2=80=99ll start in the Playground environment and move to Production=
 once everything=E2=80=99s validated.
 > We would appreciate any advice from you.
 >  Let us know what information you need to move forward, and we=E2=80=99r=
e happy to provide details about  test flow.Thanks a lot for your help!

Great. If you want to join our chat at Discord to ask questions, you are mo=
re than welcome: https://discord.gg/KWbrbWEyqb

Let me know how it goes, I'd be happy to review what you do and help you po=
lish the data submission to KCIDB.

Best,

- Gus



