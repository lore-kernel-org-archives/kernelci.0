Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04EC02D781F
	for <kernelci@lists.linux.dev>; Thu,  9 Oct 2025 09:58:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760003905; cv=none; b=pxTBllI1qFpwBm2lCUxLqhzKxYwPVT3bmpdpLBGxDmnKj00W6OOvYO5lhmJGqRja47tQn8DokFoJBWVeGFQAYq1cjraKnmV32NlbVg6vZaT2asVvJw7AoQ/K4pu51AyI7OgPfM+fiSkKEh47HbQI+67icJrnjRyI/oEG3ssyeRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760003905; c=relaxed/simple;
	bh=7wV8rXqEBPEPB7trcxnS2ecaqbraPG7quYgJoP4rdag=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ASacUy4M/rw9GA0plwdfvB5Dc/i6UZulHH0aBtlcnGbIPRuF5PG1msN0S6u56zXQV6x/THakfBe4qiPXe6Va1VhpHyAfLy29NsnYTE4ByOJNHg0nbbViSxsuz0hWN18olDJHxwOQvvm9j3ruJDsD+B7/R4ooe5fNsafBlLuo9OM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <jlu@pengutronix.de>)
	id 1v6nPh-0004KU-33; Thu, 09 Oct 2025 11:58:21 +0200
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <jlu@pengutronix.de>)
	id 1v6nPg-002iAU-0q;
	Thu, 09 Oct 2025 11:58:20 +0200
Received: from localhost ([127.0.0.1] helo=[IPv6:::1])
	by ptz.office.stw.pengutronix.de with esmtp (Exim 4.98.2)
	(envelope-from <jlu@pengutronix.de>)
	id 1v6nPf-00000001StZ-1IkM;
	Thu, 09 Oct 2025 11:58:20 +0200
Message-ID: <2c821447e222e825b36bcc19917e6527d8358e8f.camel@pengutronix.de>
Subject: Re: Hardware registry schema proposal
From: Jan =?ISO-8859-1?Q?L=FCbbe?= <jlu@pengutronix.de>
To: "Hambardzumyan, Minas" <minas@ti.com>, "kernelci@lists.linux.dev"
	 <kernelci@lists.linux.dev>
Cc: "Menon, Nishanth" <nm@ti.com>, "Sheraw, Barry" <bsheraw@ti.com>
Date: Thu, 09 Oct 2025 11:58:19 +0200
In-Reply-To: <4e471946538c47cd9d000fa7ba31044e@ti.com>
References: <4e471946538c47cd9d000fa7ba31044e@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: jlu@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: kernelci@lists.linux.dev

On Wed, 2025-10-08 at 21:20 +0000, Hambardzumyan, Minas wrote:
> Hello,
>=20
> I signed up a couple of weeks ago to propose a schema for organizing info=
rmation about the hardware tested in Kernel-CI labs.
>=20
> Please review and share your comments on a proposed schema here:
> https://github.com/TexasInstruments-Sandbox/KernelCi-collaboration/blob/m=
ain/hardware_registry/hardware_registry_schema.yaml
>=20
> along with an example yaml file here:
> https://github.com/TexasInstruments-Sandbox/KernelCi-collaboration/blob/m=
ain/hardware_registry/hardware_registry.yaml
>=20
> In summary, the schema defines following main sections with cross referen=
ces:
>=20
> * silicon_vendors: A collection of silicon vendors (processors, SOCs)
> * platform_vendors: A collection of platform vendors (servers, laptops, b=
oards, etc.)
> * processors: A collection of processors used on tested platforms
> * system_modules: A collection of system modules (SoMs, SiPs)=20
> * platforms: A collection of platforms tested in labs

You have an `id` property which seems to always match the mapping entry nam=
e.
Can they be different? If not, it seems redundant and the property could be
removed.

Regards,
Jan
