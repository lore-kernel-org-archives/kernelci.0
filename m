Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 233AC30649A
	for <kernelci@lists.linux.dev>; Fri, 12 Sep 2025 15:55:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757692549; cv=pass; b=nlnB2Vx1c+3yTWBwgQG8l+yMA8AmHzJ1DsGP9u7Tjn9lsPLNqENoScgUXvwq564ixYRJ8al0TFqMmyHx7UBfkOjQMFIG2EgMLe7G1qdujxgPTZbqoWDmy0NSrx2XOU/bgQKv9/JypQ6lZwy5UZt+lzKWbFUPf210tH0jQgdgLVc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757692549; c=relaxed/simple;
	bh=frbOY0BYIsM7Qo+KiHURtXJO5yWRvQmxr6J+sSzWsUU=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=hU21Fj3MPBlnHvVZ4WL39qE4yzs1gPd3yAbuC6R6hi5H7C5wMEcaRUMKt21MJtgMwH5IhCXG7PBCXgrs74ThP8g25fzuaAtRfVwXMfiM24UeG4rUAVbUXACncE+qRktdUXSLtAZztUqGZdVFA+1KoZonikwqofDYtbyoQ9OTxTQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=gus@collabora.com header.b=AlFdoqcr; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=gus@collabora.com header.b="AlFdoqcr"
ARC-Seal: i=1; a=rsa-sha256; t=1757692544; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=HTNjgSVu22dNtWlViCcIfiUEfia2x9/zJc2dosf02vLsHZqnDrhtDGYzYz0qUFbady8MWI8pygzoR0ET08KfLvFsMYlQa0f48Q3P3Ga4bfp8gGo7qRbR0jExOmLU4HDT9dE5OB0cmgzeUoMWUHQI86litwCmu7ewCVPVt5H968c=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1757692544; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=635pP2tlmNWs7/TC5FQBqR0t0l2Glur2QdfUYd0cvvw=; 
	b=eN+Wiq7wejq1en0CBoHPRvjj/K9AqTxdg09xsH2W5GehUPrF5C4DSSLv+l949b5FTEJy+dOTyJwa6gqDEMc8LMPYyC8KY1ifZKtLzVZ7hp5Nwwd7P7pxAH5JsFyB2D4T7htlc/Cu41lgB34IkkbIfWfF2YXKHR1H+YFyZ9qFPc4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=gus@collabora.com;
	dmarc=pass header.from=<gus@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1757692544;
	s=zohomail; d=collabora.com; i=gus@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Message-ID:In-Reply-To:References:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=635pP2tlmNWs7/TC5FQBqR0t0l2Glur2QdfUYd0cvvw=;
	b=AlFdoqcryP3l4Tiov1dExXMNP2fg9ZZfZuj4bz40v6Dvhpu7h7fs2+xP9n0b7vTf
	iKuMbXBrMGBkDOCumM+f19yXPd3WNVjeCE8CMR9JTNP7gHbdBTjT/iZcbVidhRiN0Al
	GMbs2iYsBr+Pi5Urpdbp/KwLgBrA62l6RDgjTVYY=
Received: from mail.zoho.com by mx.zohomail.com
	with SMTP id 1757692541937427.66476179232325; Fri, 12 Sep 2025 08:55:41 -0700 (PDT)
Date: Fri, 12 Sep 2025 12:55:41 -0300
From: Gustavo Padovan <gus@collabora.com>
To: "Gustavo Padovan" <gus@collabora.com>
Cc: "Kevin Hilman" <khilman@baylibre.com>,
	"kernelci lists.linux.dev" <kernelci@lists.linux.dev>,
	"chris.paterson2" <chris.paterson2@renesas.com>,
	"ben.copeland" <ben.copeland@linaro.org>, "cfi" <cfi@pengutronix.de>,
	"broonie" <broonie@kernel.org>, "sjoerd" <sjoerd@collabora.com>,
	"f.pflug" <f.pflug@pengutronix.de>,
	=?UTF-8?Q?=22Pawe=C5=82_Wieczorek=22?= <pawiecz@collabora.com>,
	"Tim Orling" <tim.orling@konsulko.com>
Message-ID: <1993ea3bbde.627334c2425860.7853970427232369784@collabora.com>
In-Reply-To: <19929cf8b8c.280b13d3500933.1530159640283422004@collabora.com>
References: <199077d9fe2.7b4205005094745.5898848305828715448@collabora.com> <CAOi56cVoV4GoidU=yP8w=p6KXL_8msye3mtmtxJnQFOzcmC6Rg@mail.gmail.com> <19929cf8b8c.280b13d3500933.1530159640283422004@collabora.com>
Subject: Re: KernelCI Labs Working Group
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

Hey folks,

Thanks to everyone who joined yesterday. See meeting notes and video record=
ing at=20

https://docs.google.com/document/d/1aoNpi69WRhn1nENbdAY1CPXYVkufbVnG_lFoGfA=
0aM4/edit?pli=3D1&tab=3Dt.0#bookmark=3Did.kub168tpcpqb

Remember this meeting is bi-weekly, so you are welcome to join the next one=
 on Sep 25[1].

The main action from yesterday was to set up a deep dive section to underst=
and some of the Maestro internals for lab integration and the possibilities=
 for labgrid integration. Please answer the poll for us to settle on a time=
 as quickly as possible:

https://doodle.com/group-poll/participate/e17VrA3b


Best,

- Gus

[1]  https://lore.kernel.org/kernelci/010101992a9a3b51-fdf26386-9ac2-4716-9=
e5c-12cf21bd1800-000000@us-west-2.amazonses.com/T/#u

P.S.: If you didn't join the kernelci mailing list yet, please do so.


--
Gustavo Padovan

Collabora Ltd.



---- On Mon, 08 Sep 2025 11:51:31 -0300 Gustavo Padovan <gus@collabora.com>=
 wrote ---

 >=20
 >=20
 >=20
 >=20
 > ---- On Thu, 04 Sep 2025 15:28:47 -0300 Kevin Hilman <khilman@baylibre.c=
om> wrote ---=20
 > =20
 >  > On Mon, Sep 1, 2025 at 3:55=E2=80=AFPM Gustavo Padovan <gus@collabora=
.com> wrote:=20
 >  > >=20
 >  > > Based on the interest during the workshop, we=E2=80=99d need to cov=
er the West Coast timezone=20
 >  > > as well. So an initial proposal for these meetings is starting next=
 week on Thursday,=20
 >  > > September 11 at 7:30am PDT/4:30pm CEST.=20
 >  >=20
 >  > I'll miss the first one due to travel, but generally speaking this=20
 >  > slot works fine for me.=20
 >  >=20
 >  > Is the goal for this to be weekly?  bi-weekly?  monthly?=20
 > =20
 > Let's start with bi-weekly and see how it goes. We'll send out invites t=
oday.=20
 > =20
 > Best,=20
 > =20
 > - Gus=20
 > =20
 > =20
 >=20

