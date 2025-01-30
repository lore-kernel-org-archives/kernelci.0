Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 771958BEC
	for <kernelci@lists.linux.dev>; Thu, 30 Jan 2025 03:08:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738206497; cv=pass; b=Uex8D1T10FJEtXey7PKm+CRq9Ra1n0M8h0sHncHSD+yghD3HfnE6uIDDOCf5exF4XXioTefyNyK9BQDNyM22V/h5W+fV+/vKQ43naL4X/L2sfY6j2cFcXYSZqrKq6efPzz5q4zx+QUCpFGugn1Ob+jWrQT+iZ2Z/WJQRzpaQxso=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738206497; c=relaxed/simple;
	bh=pAY6pOjbP5YtMioL5LpTn4CjTPVBYBKcgPeOLwUIlRs=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=gxpUliqxRwWwKYo30/m4leJO/s0Y79RsKRXq5vDwEcteOeOdDKXttouzfeaALT1+7ZbdSLqlCQ6+xH9NgsfxCNmDBuuy6UItF9wLl/T92qW5lu2VxkNT8NXC36qWDXZAQ27lfPe4Nq7FpsBEZsXvtpUTcBQvcRrssmmxXfyj62Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=denys.f@collabora.com header.b=Hkkd/Pog; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=denys.f@collabora.com header.b="Hkkd/Pog"
ARC-Seal: i=1; a=rsa-sha256; t=1738206493; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=EMV8V9bcnzgXrPLbxXrlHnaQ+GopIMBGScm6UGSSq8M2zLL42Cy5OByeEGglxoZ9/kipu0SCN7JxWzZC4gFotOHGVRyEb+hCNMqS21vkoDV9PtiDX2jpz4QpKPjscYScvqhkRTEP/2Jbz3HCHQwjdskCa+RkuaOw5CCj2suLJAM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1738206493; h=Content-Type:Content-Transfer-Encoding:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To:Cc; 
	bh=pAY6pOjbP5YtMioL5LpTn4CjTPVBYBKcgPeOLwUIlRs=; 
	b=fysCmPmJSwUvotW7DKyevXYmE949K6+cGr/4PuFWz+iiCK+vr3UINLy5qRtj60EbwDFLePFr95TDltKywx5cFo1mZDHk+QrGQa60QqRcetjoOyJ5vmCrWNCdut0EnLXOhgUiLwC2kgTMVvJLCM1hpg+2/1DX34EA+V8UeqxA2VU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=denys.f@collabora.com;
	dmarc=pass header.from=<denys.f@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1738206493;
	s=zohomail; d=collabora.com; i=denys.f@collabora.com;
	h=Message-ID:Subject:Subject:From:From:To:To:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To:Cc;
	bh=pAY6pOjbP5YtMioL5LpTn4CjTPVBYBKcgPeOLwUIlRs=;
	b=Hkkd/PogrkjrE0h1a7nWk+KB5/fwqffpUDQUG4x+bPhOVx9ma6Hz9PPbG2RDw7/9
	jcbQwHlIHc4CNSFq0CQ7fUuVn4RrXIXaJp7eZnxyvNE+yzhIKmIqcIJiBg7lMF9EBti
	tHbifqXDyaAS/5aE0by7uDtjlor/uuePPk6F5rQc=
Received: by mx.zohomail.com with SMTPS id 1738206490518504.4632637628184;
	Wed, 29 Jan 2025 19:08:10 -0800 (PST)
Message-ID: <ffde15672dae498c57da571f94eafea1212ca5ad.camel@collabora.com>
Subject: Re: FW: Questions about kernelCI tools
From: Denys Fedoryshchenko <denys.f@collabora.com>
To: =?UTF-8?Q?=E6=9E=97_=E6=8B=93=E7=9C=9F?=
 <o_takuma.hayashi@nds-osk.co.jp>,  "kernelci@lists.linux.dev"
 <kernelci@lists.linux.dev>
Date: Thu, 30 Jan 2025 05:08:07 +0200
In-Reply-To: <TYCPR01MB878896C3005C58A79DE7D531B5E92@TYCPR01MB8788.jpnprd01.prod.outlook.com>
References: 
	<OSZPR01MB878233DCFD867C7C54A941F4B53F2@OSZPR01MB8782.jpnprd01.prod.outlook.com>
	 <0346291a3c0829f9a5008c828e6ba01223c7fa76.camel@collabora.com>
	 <OSZPR01MB8782CC271F4C194691847691B5E72@OSZPR01MB8782.jpnprd01.prod.outlook.com>
	 <TYCPR01MB878896C3005C58A79DE7D531B5E92@TYCPR01MB8788.jpnprd01.prod.outlook.com>
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

Hello,

On Thu, 2025-01-30 at 00:41 +0000, =E6=9E=97 =E6=8B=93=E7=9C=9F wrote:
> To: KernelCI community=C2=A0=C2=A0=20
> Cc: Denys Fedoryshchenko
>=20
> Does anyone here answer the additional question ?
>=20
> > > How should we avoid using KCIDB ? (but we still want self-hosted
> > > dashboard) We have seen a legacy version of the ?>> dashboard for
> > > KernelCI, but I could not find setup guide like "get-started".
Unfortunately KCIDB is essential part of dashboard.

KCIDB deployment guide is available at
https://github.com/kernelci/kcidb/blob/main/doc/administrator_guide.md

Legacy dashboard is not supported anymore and not compatible with
recent system.

>=20
> Thank you.
>=20
> -----Original Message-----
> From: =E6=9E=97 =E6=8B=93=E7=9C=9F=20
> Sent: Monday, January 20, 2025 4:49 PM
> To: Denys Fedoryshchenko <denys.f@collabora.com>
> Subject: RE: Questions about kernelCI tools
>=20
> To Denys Fedoryshchenko.
>=20
> Thank you for your quick reply.
>=20
> > > You can follow issue to see when it is fixed.
>=20
> I checked and applied the patch of
> https://github.com/kernelci/kernelci-api/pull/591=C2=A0to my local.
> Then I have seen it's working fine. Thank you!=E3=80=80(But the issue is =
not
> closed yet...)
>=20
> > > That said, we=E2=80=99d love to hear more about what=E2=80=99s most i=
mportant to
> > > you=E2=80=94whether it=E2=80=99s prioritizing the self-hosted aspect =
or any other
> > > features.
>=20
> One of the most important things is that we don=E2=80=99t want to expose =
any
> information about the board we have under development state.
> In that state, we still want self-hosted KernelCI to manage our test
> results and publish it for the limited number of stakeholders.
> Finally, also we think we can send the LTP result to the
> KCIDB/dashboard that is maintained by Linux foundation.
>=20
> Sorry if this is a repetitive question.
> How should we avoid using KCIDB ? (but we still want self-hosted
> dashboard) We have seen a legacy version of the dashboard for
> KernelCI, but I could not find setup guide like "get-started".
>=20
> Thank you.
>=20
> -----Original Message-----
> From: Denys Fedoryshchenko <denys.f@collabora.com>
> Sent: Thursday, December 12, 2024 5:08 PM
> To: =E6=9E=97 =E6=8B=93=E7=9C=9F <o_takuma.hayashi@nds-osk.co.jp>; kernel=
ci@lists.linux.dev
> Subject: Re: Questions about kernelCI tools
>=20
> Hello =E6=9E=97 =E6=8B=93=E7=9C=9F,
>=20
> 1. I guess it is about KCIDB, we have it planned. We totally get why
> having a fully self-hosted KernelCI setup would be useful, especially
> for teams looking to avoid external dependencies like Google Cloud.
>=20
> Making KernelCI self-hosted is definitely on our roadmap. The good
> news is that we=E2=80=99ve already started thinking about it, but with th=
e
> number of features we=E2=80=99re juggling and the small team we have, it=
=E2=80=99s
> taking us some time to get there. For example one of features we are
> working on, is making storage backend more "cloud-independent-
> friendly".
>=20
> That said, we=E2=80=99d love to hear more about what=E2=80=99s most impor=
tant to
> you=E2=80=94whether it=E2=80=99s prioritizing the self-hosted aspect or a=
ny other
> features. If there=E2=80=99s interest in collaborating or sponsoring cert=
ain
> areas, it could really help speed things up.
>=20
> 2.Thank you for report, yes it is a bug, likely appeared during our
> latest pydantic upgrade.
> I opened issue and will try to fix it this or max next week, as it is
> critical for user management bug.
> https://github.com/kernelci/kernelci-api/issues/589
> You can follow issue to see when it is fixed.
>=20
>=20
> On Thu, 2024-12-12 at 04:29 +0000, =E6=9E=97 =E6=8B=93=E7=9C=9F wrote:
> > Hello community.
> >=20
> > I am currently trying to run LTP test on LavaLab with Maestro and=20
> > KCIDB.
> > Also have currently considered building all modules of KernelCI
> > "on-=20
> > premise".
> > then I have two questions about the way I am trying.
> >=20
> > Question 1=EF=BC=9A
> > Is it possible to get rid of the dependency on GoogleCloud?
> > (So I am looking for the right way to build KernelCI on-premise
> > more=20
> > quick and easier=E2=80=A6)
> >=20
> > Question 2=EF=BC=9A
> > I encountered the error below while trying to build Maestro and,=20
> > trying to get the API access token for connecting to the kernelci-
> > api=20
> > container from the pipeline.
> > Following steps here I have tried: (Referred to
> > https://docs.kernelci.org/admin/api/)
> > ----------------------------------------------------------
> > Step 1. Run bash in the kernelci-api container. $ docker exec ?it=20
> > kernelci-api /bin/bash
> >=20
> > Step 2. Create an administrator within the api app.
> > $ python3 ?m api.admin ?email =E2=80=9C<administrator-mail-address>=E2=
=80=9D
> > =C2=A0=C2=A0 (trapped) error reading bcrypt version
> > =C2=A0=C2=A0 Traceback (most recent call last):
> > =C2=A0=C2=A0 File "/usr/local/lib/python3.11/site-=20
> > packages/passlib/handlers/bcrypt.py", line 620, in
> > _load_backend_mixin
> > =C2=A0=C2=A0 version =3D _bcrypt.__about__.__version__
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 ^^^^^^^^^^^^^^^^^
> > =C2=A0=C2=A0 AttributeError: module 'bcrypt' has no attribute '__about_=
_=E2=80=99
> > =C2=A0=C2=A0 Creating admin user...
> >=20
> > This above error I encountered does not seem to be fatal as far as
> > I=20
> > read the KernelCI implementation.
> > then I went to the next step.
> >=20
> > 3. Obtain the token of the administrator in the api app.
> > $ kci user token admin
> > Error: KerError: Value not found for None
> > ----------------------------------------------------------
> > Is there any missing steps I should do before?
> >=20
> > Thank you.
> > Hayashi
> >=20
>=20

