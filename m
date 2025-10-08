Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1156D208994
	for <kernelci@lists.linux.dev>; Wed,  8 Oct 2025 21:20:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759958444; cv=none; b=b4F3htoN6nlaNMjmfofLEF0IPgApB8mk4/E+TamyCr+kmWjDWadTXL6B5AG5rQ041Gd+DFCt/vENGtNevbZ6aPY8wZAIQ9Y3iJwjmitsKqhoBcQ0rTjgakI7iIO9yo1sh1y1XXi7JGuYZLKvArBq+FVZXgYypp70lGk78V+sNJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759958444; c=relaxed/simple;
	bh=cDZwvB4CaVh0UhPQZMX1Jye+rNaLG+iMypEYJ4BePUo=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=GSSf738EacbHKVtSeOT2L55GyoFYkOxBBcDHSt6vFJY+rN0ghdUdUlqrpzMnszpMtefbaYfL6YeulMM0pPoqRu4PwEQt/AM6SBYr0F20lg8yOeFVtFYIBuEqIuefU6gopxh5na2ZNxEpXsXNywlVVs3onMuMWblrO00TqyH9klM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=jbZPCR3R; arc=none smtp.client-ip=198.47.19.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="jbZPCR3R"
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 598LKe5O311819
	for <kernelci@lists.linux.dev>; Wed, 8 Oct 2025 16:20:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1759958440;
	bh=cDZwvB4CaVh0UhPQZMX1Jye+rNaLG+iMypEYJ4BePUo=;
	h=From:To:CC:Subject:Date;
	b=jbZPCR3RtGTFPna2dsVjq49WrqRumYgnCRWUx7N1rTSZ44I24EqWnQDy6nyo+rqt+
	 WsmBJqlTvTC1qZXyWxM4ATBoNib5nhnMT/VLO6UBVPrpAP4hrT0Dl9mZBNY0Of67e9
	 /a42p5ilj11IoqonEHJKSwfIiPMctqyoTOk3je6c=
Received: from DLEE213.ent.ti.com (dlee213.ent.ti.com [157.170.170.116])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 598LKenx1742891
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <kernelci@lists.linux.dev>; Wed, 8 Oct 2025 16:20:40 -0500
Received: from DLEE211.ent.ti.com (157.170.170.113) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 8 Oct
 2025 16:20:40 -0500
Received: from DLEE211.ent.ti.com ([fe80::4e9d:7340:5514:6ecf]) by
 DLEE211.ent.ti.com ([fe80::4e9d:7340:5514:6ecf%6]) with mapi id
 15.02.2562.020; Wed, 8 Oct 2025 16:20:40 -0500
From: "Hambardzumyan, Minas" <minas@ti.com>
To: "kernelci@lists.linux.dev" <kernelci@lists.linux.dev>
CC: "Menon, Nishanth" <nm@ti.com>, "Sheraw, Barry" <bsheraw@ti.com>
Subject: Hardware registry schema proposal
Thread-Topic: Hardware registry schema proposal
Thread-Index: Adw4mWU5Adz+DFykSCOFi+5fSFOIpQ==
Date: Wed, 8 Oct 2025 21:20:40 +0000
Message-ID: <4e471946538c47cd9d000fa7ba31044e@ti.com>
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

I signed up a couple of weeks ago to propose a schema for organizing inform=
ation about the hardware tested in Kernel-CI labs.

Please review and share your comments on a proposed schema here:
https://github.com/TexasInstruments-Sandbox/KernelCi-collaboration/blob/mai=
n/hardware_registry/hardware_registry_schema.yaml

along with an example yaml file here:
https://github.com/TexasInstruments-Sandbox/KernelCi-collaboration/blob/mai=
n/hardware_registry/hardware_registry.yaml

In summary, the schema defines following main sections with cross reference=
s:

* silicon_vendors: A collection of silicon vendors (processors, SOCs)
* platform_vendors: A collection of platform vendors (servers, laptops, boa=
rds, etc.)
* processors: A collection of processors used on tested platforms
* system_modules: A collection of system modules (SoMs, SiPs)=20
* platforms: A collection of platforms tested in labs

Regards,
Minas.
