Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92F4A20B20B
	for <kernelci@lists.linux.dev>; Thu, 12 Dec 2024 08:07:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733990860; cv=pass; b=njBeHC8uJ2BTHD624ySyq9twz7jr0t4KN8bE6q9rRF6OPr41JG2dfnGBPdcTm9N2BiJzQKIxFl+m6jtuGjrWJLAedlRT8gj4OJwbJ2qTWD2KdvApyvDyGoWvR55g8/e5ur60JFucn4atAjVZHuAY/77Ak7bIJM7BwXv/JraIraU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733990860; c=relaxed/simple;
	bh=qkrdz8Z2ga+EjGecL0AM30iK2TOPgfvx2913xgWlvPA=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=nB6LCFzykzGrL8nn9YnCvZ84aZpUSoOmWyi9nczGnK4JzWfarW3hqXo33oMRoR8gvSOkCZP1SvMF1+Ilrtm+i5QT2mzded+SeYYekqCpd5KE/Rv5i1fIWrVl5NC3n3/iqoSzCouvpzukD2rCTMNuyLsI4xtBhh9isXE+0iH2aJ8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=denys.f@collabora.com header.b=SB2XZyJy; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=denys.f@collabora.com header.b="SB2XZyJy"
ARC-Seal: i=1; a=rsa-sha256; t=1733990856; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=c/OUxvRb2gVWHKKhZPW0iamFgJbQkSgivdX/SG1aReIHJUqp0/GjDxqKnhyIedgnv4iWRmlc7ctnHUWlkxzJv2QBnfeiRv8kFqQEMQ4BnrMzIqdyxfhhxNP7f4zg1y8C9p1V6Pq6ss7ALrIu3WP3SUByjUSjRmZcchqAYz2KBrc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1733990856; h=Content-Type:Content-Transfer-Encoding:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To:Cc; 
	bh=qkrdz8Z2ga+EjGecL0AM30iK2TOPgfvx2913xgWlvPA=; 
	b=OF07pJRylsz8V+NkZlyphJ7v6lbaOKPEB434W/hQGakvqHMCiChODKDmdtbRAUl329I4Uu2Sfv5ScerX84QyCF4OJI96BUpqj/78rkps8n548hmN/yVR6HDG5okWkgJyfnTf+UaW0VipvvO8BHS+LYEeVuew3+746hgv+zrLiw4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=denys.f@collabora.com;
	dmarc=pass header.from=<denys.f@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1733990856;
	s=zohomail; d=collabora.com; i=denys.f@collabora.com;
	h=Message-ID:Subject:Subject:From:From:To:To:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To:Cc;
	bh=qkrdz8Z2ga+EjGecL0AM30iK2TOPgfvx2913xgWlvPA=;
	b=SB2XZyJyuQTZD1M9lcQ6DIlYz93h6PTKaLoJpZYqnXWW8Vgx8CJM1NK970VBrPnj
	yEbsqJ3lm4fPnInKPIVaeAoixQwyMlp8u6KT1N9ViuBt6mm3A4IlJQtw0VqbcR6YFae
	mNt5WTrhgt5G5c+EnRb3otUd2d0id9zaSDKTND3Y=
Received: by mx.zohomail.com with SMTPS id 1733990853098143.79379055666425;
	Thu, 12 Dec 2024 00:07:33 -0800 (PST)
Message-ID: <0346291a3c0829f9a5008c828e6ba01223c7fa76.camel@collabora.com>
Subject: Re: Questions about kernelCI tools
From: Denys Fedoryshchenko <denys.f@collabora.com>
To: =?UTF-8?Q?=E6=9E=97_=E6=8B=93=E7=9C=9F?=
 <o_takuma.hayashi@nds-osk.co.jp>,  "kernelci@lists.linux.dev"
 <kernelci@lists.linux.dev>
Date: Thu, 12 Dec 2024 10:07:30 +0200
In-Reply-To: <OSZPR01MB878233DCFD867C7C54A941F4B53F2@OSZPR01MB8782.jpnprd01.prod.outlook.com>
References: 
	<OSZPR01MB878233DCFD867C7C54A941F4B53F2@OSZPR01MB8782.jpnprd01.prod.outlook.com>
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

Hello =E6=9E=97 =E6=8B=93=E7=9C=9F,

1. I guess it is about KCIDB, we have it planned. We totally get why
having a fully self-hosted KernelCI setup would be useful, especially
for teams looking to avoid external dependencies like Google Cloud.

Making KernelCI self-hosted is definitely on our roadmap. The good news
is that we=E2=80=99ve already started thinking about it, but with the numbe=
r of
features we=E2=80=99re juggling and the small team we have, it=E2=80=99s ta=
king us some
time to get there. For example one of features we are working on, is
making storage backend more "cloud-independent-friendly".

That said, we=E2=80=99d love to hear more about what=E2=80=99s most importa=
nt to
you=E2=80=94whether it=E2=80=99s prioritizing the self-hosted aspect or any=
 other
features. If there=E2=80=99s interest in collaborating or sponsoring certai=
n
areas, it could really help speed things up.

2.Thank you for report, yes it is a bug, likely appeared during our
latest pydantic upgrade.
I opened issue and will try to fix it this or max next week, as it is
critical for user management bug.
https://github.com/kernelci/kernelci-api/issues/589
You can follow issue to see when it is fixed.


On Thu, 2024-12-12 at 04:29 +0000, =E6=9E=97 =E6=8B=93=E7=9C=9F wrote:
> Hello community.
>=20
> I am currently trying to run LTP test on LavaLab with Maestro and
> KCIDB.
> Also have currently considered building all modules of KernelCI "on-
> premise".
> then I have two questions about the way I am trying.
>=20
> Question 1=EF=BC=9A
> Is it possible to get rid of the dependency on GoogleCloud?
> (So I am looking for the right way to build KernelCI on-premise more
> quick and easier=E2=80=A6)
>=20
> Question 2=EF=BC=9A
> I encountered the error below while trying to build Maestro and,
> trying to get the API access token for connecting to the kernelci-api
> container from the pipeline.
> Following steps here I have tried: (Referred to
> https://docs.kernelci.org/admin/api/)
> ----------------------------------------------------------
> Step 1. Run bash in the kernelci-api container.=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=20
> $ docker exec ?it kernelci-api /bin/bash
>=20
> Step 2. Create an administrator within the api app.
> $ python3 ?m api.admin ?email =E2=80=9C<administrator-mail-address>=E2=80=
=9D
> =C2=A0=C2=A0 (trapped) error reading bcrypt version
> =C2=A0=C2=A0 Traceback (most recent call last):
> =C2=A0=C2=A0 File "/usr/local/lib/python3.11/site-
> packages/passlib/handlers/bcrypt.py", line 620, in
> _load_backend_mixin
> =C2=A0=C2=A0 version =3D _bcrypt.__about__.__version__
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 ^^^^^^^^^^^^^^^^^
> =C2=A0=C2=A0 AttributeError: module 'bcrypt' has no attribute '__about__=
=E2=80=99
> =C2=A0=C2=A0 Creating admin user...
>=20
> This above error I encountered does not seem to be fatal as far as I
> read the KernelCI implementation.
> then I went to the next step.
>=20
> 3. Obtain the token of the administrator in the api app.
> $ kci user token admin
> Error: KerError: Value not found for None
> ----------------------------------------------------------
> Is there any missing steps I should do before?
>=20
> Thank you.
> Hayashi
>=20

