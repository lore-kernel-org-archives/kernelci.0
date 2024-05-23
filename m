Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0177D83CDA
	for <kernelci@lists.linux.dev>; Thu, 23 May 2024 19:57:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716494270; cv=none; b=euq6iK+zjiLrEr8GyKgUYGKfJ4KZZYRt5Ky088OBeku8eTgJCcN4TNbAdEFaW/t7XhfMWVyLbeu7UMS41lh1bmJnpF6M6GA/iR3qYs6KNadKhZoRbPBs2Yba41EhuhyIrVLN0eVXd21uGBBTkBsTVyT46Cf/8cCYjAk090EizpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716494270; c=relaxed/simple;
	bh=8AeLV7XT4lTSJ7P3DpGUITLHfRw2+rYg+Nj1LIbPq40=;
	h=From:In-Reply-To:Content-Type:References:Date:Cc:To:MIME-Version:
	 Message-ID:Subject; b=Qs+A9DRd2aKLSQBJwFUZ7Chgn4yKrjU5IbNDFN+8NXmatkcSPg/nQBbObn8uMAPu1gN7Dj5DZCdDAVytKVHEKrIyRtAfJakNjqIRSjmOppMU1C+tcmLhPwNOvg4bJcOEj9ACi58BByA1I31JsDpG5G2jm1hTvuDVS/RcwokkDFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Received: from harlem.collaboradmins.com (harlem.collaboradmins.com [IPv6:2a01:4f8:1c0c:5936::1])
	by madrid.collaboradmins.com (Postfix) with ESMTP id EA4363782112;
	Thu, 23 May 2024 19:57:46 +0000 (UTC)
From: "Gustavo Padovan" <gus@collabora.com>
In-Reply-To:  <BY5PR02MB67543462B27CBA2C56BE5249B0F42@BY5PR02MB6754.namprd02.prod.outlook.com>
Content-Type: text/plain; charset="utf-8"
X-Forward: 127.0.0.1
References: <b51eab8a-41cd-4439-8434-076d09b60ed4@gmail.com>  <BY5PR02MB67543462B27CBA2C56BE5249B0F42@BY5PR02MB6754.namprd02.prod.outlook.com>
Date: Thu, 23 May 2024 20:57:46 +0100
Cc: "Nikolai Kondrashov" <spbnick@gmail.com>, =?utf-8?q?kernelci=40lists=2Elinux=2Edev?= <kernelci@lists.linux.dev>, =?utf-8?q?kernelci-tsc=40groups=2Eio?= <kernelci-tsc@groups.io>
To: "Trilok Soni" <tsoni@quicinc.com>
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Message-ID: <195626-664f9f80-23-758bf280@3007099>
Subject: =?utf-8?q?RE=3A?= New name for new =?utf-8?q?=22KernelCI=22?=
User-Agent: SOGoMail 5.10.0
Content-Transfer-Encoding: quoted-printable

On Thursday, May 23, 2024 13:10 EDT, Trilok Soni <tsoni@quicinc.com> wr=
ote:

> Nikolai,
>=20
> How about Yuga? It means following.=20
>=20
> Yuga:
> Meaning: =E2=80=9CEra=E2=80=9D or =E2=80=9CAge.=E2=80=9D
> Attributes: Experienced (through time), powerful, and open.
> Context: Yuga represents cycles of time and evolution.

That's interesting. One thing that I have been saying a lot lately is t=
hat we have a kernel that is 33 years old already, so the KernelCI arch=
itecture we have been putting in place lately is to be a foundation of =
something that will last generations.

The thing we need to name sits at the center of that coordinating tests=
 specs, triggers, running tests and facilitating the job for multiple C=
I systems to join the party.

Best

- Gus

>=20
> ---Trilok Soni
>=20
> -----Original Message-----
> From: Nikolai Kondrashov <spbnick@gmail.com>=20
> Sent: Thursday, May 23, 2024 8:55 AM
> To: kernelci@lists.linux.dev; kernelci-tsc@groups.io
> Subject: New name for new "KernelCI"
>=20
> WARNING: This email originated from outside of Qualcomm. Please be wa=
ry of any links or attachments, and do not enable macros.
>=20
> Hi everyone,
>=20
> As you know, we've been developing the new KernelCI API [1], and the =
kernelci-pipeline [2] based on it, for quite a while.
>=20
> However, by now it seems that too many things are being called "Kerne=
lCI": the project, pieces of the old system, pieces of the new system. =
We would also like to give the name of KernelCI the project a wider sco=
pe than just a particular CI system, and accommodate more packages/proj=
ects under its name.
>=20
> So we would like to propose to call the new system "KernelCI <Somethi=
ng>".
>=20
> And this message is about that "<Something>".
>=20
> I think it would be good to have the new name associate with one or m=
ore of the below qualities/functions (but feel free to dispute and exte=
nd this):
>=20
> * focused
> * simple
> * powerful
> * experienced (as in arising from experience)
> * open
> * distributed
> * commanding (a fleet)
> * kernel-related
> * bug-related
>=20
> One of the current working names, that Gustavo Padovan has proposed, =
is "Maestro". As in "KernelCI Maestro". It hits the following associati=
ons:
> focused, powerful, experienced, commanding.
>=20
> As a joke and to come up with an example, I suggested "Kraken", that =
is "KernelCI Kraken", which hits these: powerful, experienced (it's old=
), simple (minded), focused (on sinking ships), distributed (it has ten=
tacles),
>=20
> Keeping things short, here are all the ideas so far, in alphabetic or=
der:
>=20
> * KernelCI Anthill - bug-related, distributed, commanding, focused
> * KernelCI Arrow - focused, simple, powerful
> * KernelCI Kraken - powerful, experienced, simple, focused, distribut=
ed
> * KernelCI Lens - focused, powerful, simple
> * KernelCI Lighthouse - focused, simple, powerful, commanding, experi=
enced
> * KernelCI Maestro - focused, powerful, experienced, commanding
> * KernelCI Needle (in a haystack) - focused, simple, powerful, experi=
enced
> * KernelCI Nucleus - kernel-related, simple, powerful (when split)
> * KernelCI PristineCI - simple, open
> * KernelCI Pulse - focused, simple, powerful, experienced
> * KernelCI Tamandu=C3=A1 (anteater in Spanish) - bug-related, simple,=
 focused
> * KernelCI Trails - focused, experienced, distributed
> * KernelCI Warden - focused, powerful, experienced, commanding
>=20
> I would appreciate any arguments and ideas about this. Once we have a=
ll the names we can think of, and strike out ones we definitely don't l=
ike, I'll create and post a poll here to pick one.
>=20
> Thank you!
>=20
> Nick
> TSC Chair
>=20
> [1] https://github.com/kernelci/kernelci-api
> [2] https://github.com/kernelci/kernelci-pipeline
>

