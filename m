Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00E00270ECF
	for <kernelci@lists.linux.dev>; Thu, 10 Jul 2025 15:26:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752161166; cv=pass; b=Z0vC5/MzxNpcRWCzaueZDv3y2D+xigeTp4/yxWenPPS2UaSLbsHZmwj1jNiiMt11txNHirrCzz2b52M44lPCM0WLoLWv/T0pCf+52EopJRLWgPEdV1iKuxlw2/ILFhNPRTyeZu/X/g9WAnW6HfEtEpBPsNFuc5HaO3lLg2Yo6Ao=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752161166; c=relaxed/simple;
	bh=vUWrtfhE8IDsgEoLUun7atHft3h+C7/KgUwwcWGcxg8=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=iDmONKatwD/JecddpJ31xejlAe8BAJQljsJzqagrqZxaRF6ZaGtpLYbZtkUUaxlUwy4guJ1l347e+KJdl1eehB74PY3qe/WeCDJM6TFKQrH4fcu5oLCMMoSz1lrugXxL4OspE6fofAmAokumYpb7mhuNKTOpqGiNubaVRmMpfqY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=gus@collabora.com header.b=Z1qGMHoy; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=gus@collabora.com header.b="Z1qGMHoy"
ARC-Seal: i=1; a=rsa-sha256; t=1752161161; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=lQoQGLa/2DPsZFjbtrYHC3AP+uiXhlJ93vi3qPp5rfTkNw0uiqTIM+yGBz2f98QKISlsUuHuHFV2daCQ7XfcCb0JJvq6gcbP4b/GUQFQ7QVi4Y1Vfg9jyX1wM/zsepRGQLC7vjaOQi/vRONJGBG+EmZSKekL2sTBNzpU+iKOmUY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1752161161; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=nVDKj9+PHGjRStCnV6YMEJ10XAtQLZQzVZLkofGURiA=; 
	b=HLtvEsQvq+domPC3Zl3UJg0JoPRqcCodNfnsv42yU/lDC9jEmffHKgmKIQYFZ2dSbQgpiLYkZ0AxLmrtws/wGJkC4d9C5ZdVK8pvguV88EZrxJt85Am2q1AC8YlSl8+CODEkLDMSu6L1NDtjOUPox/N2AIinKaz7NrMbGY03CAQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=gus@collabora.com;
	dmarc=pass header.from=<gus@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1752161161;
	s=zohomail; d=collabora.com; i=gus@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Message-ID:In-Reply-To:References:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=nVDKj9+PHGjRStCnV6YMEJ10XAtQLZQzVZLkofGURiA=;
	b=Z1qGMHoyz/V5uBwkpDnNvT0GgnM1VXlQls4ZNuc6gldMcYv+/CC08y8dov7lNdYI
	LtpVY0E0xuqGLjnJY0RTmsQfM7pRj++l/mA+wjQMhfeCbH17ObEu3fMTu4wWo30RsLJ
	gnNlVdjVIeKYNxSiLFdDaa41jqpqJaV2ZCWHBCUM=
Received: from mail.zoho.com by mx.zohomail.com
	with SMTP id 1752161160156450.71749338222116; Thu, 10 Jul 2025 08:26:00 -0700 (PDT)
Date: Thu, 10 Jul 2025 12:26:00 -0300
From: Gustavo Padovan <gus@collabora.com>
To: "kernelci-webdashboard" <kernelci-webdashboard@groups.io>
Cc: "kernelci" <kernelci@lists.linux.dev>
Message-ID: <197f4f18bbd.4e72ec22245208.9045661304623853442@collabora.com>
In-Reply-To: <CAK18DXZo7WdVy6q+KVY+tHRr1wONU_MOh2+eec-Tx23Zmub+NA@mail.gmail.com>
References: <CAMVAkEsCEBNayPxXJXBXBXHRYLtqiwq6cMcgr8GL+5MgSgRtgw@mail.gmail.com>
 <CAK18DXYuM_bHrB-oCbct5bV4tuL2FYxeyVD1mT=Sfb7_8axOEQ@mail.gmail.com> <CAK18DXZo7WdVy6q+KVY+tHRr1wONU_MOh2+eec-Tx23Zmub+NA@mail.gmail.com>
Subject: Re: [kernelci-webdashboard] KernelCI Dashboard Report - June 27 -
 July 9, 2025
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

Hello,

---- On Thu, 10 Jul 2025 11:22:44 -0300 Don Zickus via groups.io <dzickus=
=3Dredhat.com@groups.io> wrote ---

 > (resending as text/plain not html [which is gmail default])=20
 > =20
 > =20
 > On Thu, Jul 10, 2025 at 9:59=E2=80=AFAM Donald Zickus <dzickus@redhat.co=
m> wrote:=20
 > >=20
 > > Hi Marcelo,=20
 > >=20
 > > Thank you for your work and the report!=20
 > >=20
 > > Do you see any blockers or challenges slowing down your next sprint?  =
Or are you able to do most of the work unimpeded?  It seems like most of yo=
ur work is implement fixes/improvements based on customer feedback which do=
n't appear to be blocked by anything.  Just curious to see if I understand =
things correctly.=20

On top Don's comment, we can add "blockers" and "next sprint"  to these rep=
orts as well. That will clarify things further. Then from time to time we n=
eed to build and share some Dashboard roadmap plans too.

Best,

- Gus


 > >=20
 > > Cheers,=20
 > > Don=20
 > >=20
 > >=20
 > > On Thu, Jul 10, 2025 at 8:21=E2=80=AFAM Marcelo Robert via groups.io <=
marcelo.santos=3Dprofusion.mobi@groups.io> wrote:=20
 > >>=20
 > >> Hello everyone,=20
 > >>=20
 > >> We in the dashboard team are working on sending a new report after a=
=20
 > >> deployment of every sprint with the main features and fixes, which=20
 > >> usually happens every other week. Here are the changes since the last=
=20
 > >> report:=20
 > >>=20
 > >> ## Improvements=20
 > >> - A new endpoint was added with the same return as the checkout=20
 > >> summary report, polling tests up to 1 day and with some other=20
 > >> parameters open [1]=20
 > >> - Added support for multiple paths in a checkout report, as well as=
=20
 > >> multiple paths in the kci-summary endpoint [2]=20
 > >> - Improved checkout notification query performance [3]=20
 > >> - Added kci-dev information on the page footer, linking to the cli=20
 > >> page and with an example command [4]=20
 > >> - Added description to request parameters on most backend endpoints,=
=20
 > >> also visible in the swagger ui=20
 > >> (https://dashboard.kernelci.org/api/schema/swagger-ui/) [5]=20
 > >>=20
 > >>=20
 > >> ## Bugfixes=20
 > >> - Filtering by architecture wasn=E2=80=99t updating the card correctl=
y, even=20
 > >> though the data was correct [6]=20
 > >> - The /c/treeName/gitBranch/gitHash endpoint wasn=E2=80=99t working a=
fter the=20
 > >> treeDetails url change, but was corrected [7]=20
 > >>=20
 > >>=20
 > >> ## Technical Debts=20
 > >> - The sqlite used to store cache and extra data was a single database=
,=20
 > >> it was then divided into two, allowing for a better control over cach=
e=20
 > >> versus notification data [8]=20
 > >>=20
 > >>=20
 > >> References:=20
 > >> [1] https://github.com/kernelci/dashboard/issues/1321=20
 > >> [2] https://github.com/kernelci/dashboard/issues/1217=20
 > >> [3] https://github.com/kernelci/dashboard/issues/1310=20
 > >> [4] https://github.com/kernelci/dashboard/issues/1247=20
 > >> [5] https://github.com/kernelci/dashboard/issues/1300=20
 > >> [6] https://github.com/kernelci/dashboard/issues/1268=20
 > >> [7] https://github.com/kernelci/dashboard/issues/1311=20
 > >> [8] https://github.com/kernelci/dashboard/issues/1223=20
 > >>=20
 > >>=20
 > >>=20
 > >>=20
 > >>=20
 > =20
 > =20
 > =20
 > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=20
 > Groups.io Links: You receive all messages sent to this group.=20
 > View/Reply Online (#182): https://groups.io/g/kernelci-webdashboard/mess=
age/182=20
 > Mute This Topic: https://groups.io/mt/114081027/6162449=20
 > Group Owner: kernelci-webdashboard+owner@groups.io=20
 > Unsubscribe: https://groups.io/g/kernelci-webdashboard/leave/12826471/61=
62449/1652598092/xyzzy [gustavo.padovan@collabora.com]=20
 > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=20
 > =20
 > =20
 >=20

