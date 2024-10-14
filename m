Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33D37143722
	for <kernelci@lists.linux.dev>; Mon, 14 Oct 2024 22:13:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.248
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728944021; cv=none; b=sE/QTIysMoWxIX8EZo4bEO3Pf4Ps4Q/ysUuS/YigpYNHCo2Wkie3mPbGPUjQ1Pa2gz/xT72x/1LLUoanzUJTKIdUaxbtZTnfJ+7jLu2TwmJBDT7ZNmA8p6In3wDMQ6/g0LG+ALogiy1Grfygxl/uieJrwgjbPfDUzN7REgdf1Gk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728944021; c=relaxed/simple;
	bh=z7sysNOt3QLfGmEtrQpUNkfYITxKE+h2pF6SxNL7W0A=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=DgAn0b8d/VvOep58Sf3hNQ/XkzyWeh2nGaS6ia22zojBarpHMq6HsNPftwITIaOpPrQb1ja6Tzbi2k2G0PTzcJRGdsYje3cHRLuR+NnmUYNI4VqESYbaJPWv5UzK8tBFo+ZqoG8dQa4/fTZNmwfijI9NoikesqMFXdxG7wCWQHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=CYZBAV8c; arc=none smtp.client-ip=198.47.23.248
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="CYZBAV8c"
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 49EMDcGO061686
	for <kernelci@lists.linux.dev>; Mon, 14 Oct 2024 17:13:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1728944018;
	bh=/HsgYgxEPn8Zb/c2pTAa/n0gnI/6pFNI9PFB4NpZ/Eg=;
	h=From:To:Subject:Date;
	b=CYZBAV8cLkfxXMM4XI4dpvLNHmxldSKOrxFh64eYhWwnmgy+ixbMuervNTi9GL8R8
	 FBIyEe7Jgw1vf5imZi5R4M6dz2bKexU+3Rqjp72jJH+/sJ7I7RlP9gN1xCoW3VngM+
	 0IoN7d+nJgIKdrFzJqvAWTxahoHWJJjfx3ZQFW9A=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 49EMDcEa102997
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <kernelci@lists.linux.dev>; Mon, 14 Oct 2024 17:13:38 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 14
 Oct 2024 17:13:38 -0500
Received: from DFLE110.ent.ti.com ([fe80::c545:bde0:ab70:bae9]) by
 DFLE110.ent.ti.com ([fe80::c545:bde0:ab70:bae9%19]) with mapi id
 15.01.2507.023; Mon, 14 Oct 2024 17:13:38 -0500
From: "Sheraw, Barry" <bsheraw@ti.com>
To: "kernelci@lists.linux.dev" <kernelci@lists.linux.dev>
Subject: KernelCI hw-vendors working group 
Thread-Topic: KernelCI hw-vendors working group 
Thread-Index: AdsegKAR9OoJUSH7RCC2YuJbEdlEYQ==
Date: Mon, 14 Oct 2024 22:13:37 +0000
Message-ID: <7ac62f9ab93944aca97ed3f2e7ecfc16@ti.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-c2processedorg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

Hello,

There was a lot of good discussion at this year's Linux Plumbers Conference=
, both formal and informal, around KernelCI and leveraging our shared testi=
ng needs into a standardized Open Source testing framework.  In order to ma=
intain that momentum, we've created the hw-vendors working group for discus=
sions of all things hardware vendor related within the KernelCI and collabo=
rative testing ecosystem.

Please visit https://groups.io/g/kernelci-hw-vendors to read, post or subsc=
ribe to messages, or subscribe directly by emailing  kernelci-hw-vendors+su=
bscribe@groups.io=20

Looking forward to collaborating with everyone...

Barry Sheraw and the KernelCI team

