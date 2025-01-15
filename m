Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17185241693
	for <kernelci@lists.linux.dev>; Wed, 15 Jan 2025 11:37:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736941054; cv=pass; b=jhff8CFPpgqNfRhjgb9kwuaTwOUQQkvaFbSwVwDepfKqEaSGXtQRquUdh0saMvFvx6H37inCC5khEJYpRTrXTttGOojWx13zFEkcniOP87H7gJFOwDRlpH/XrRCURSeMNpYRV5io1UTOIZWIMv/dN0pwQEq7ElJGi85aAXCq9+I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736941054; c=relaxed/simple;
	bh=qQ8HE2GfwFN8/wfA4gtpl6jzZqTY+eJf+eA8Y54UC4k=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=jdN+hj817/ntTHZ2Ipn+iiTkhYXUZ7ZKaP05PrAdjnDfBKFJm460r2tT5aQar58Jg6o1NUyZw25gjvHhrjxjJWA2wJEkC3QCWSO9XND782eEuc3uv9ZoBM+XGLjW/AJkGOJBSWb6F7vyCJ52GSiQI742zyiIA4+txgZB79O6BvM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=denys.f@collabora.com header.b=HmC355ax; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=denys.f@collabora.com header.b="HmC355ax"
ARC-Seal: i=1; a=rsa-sha256; t=1736941050; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=ZcaPadFqArGmDGKNujobeZeteo9/dAR5mJ7E8QbhK6pG7Kts3JTFS8VXTPSU1EvYCh6IRpv9Nh17QO2NF2GzAShdUswfjv2cX12wuwEkR/ZNzmy/TgBiakneOYBbavJWGb3dG/gz0/Ezg0oG+uDymWOKhuTab0YkGaSrJaSEb7M=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1736941050; h=Content-Type:Content-Transfer-Encoding:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To:Cc; 
	bh=qQ8HE2GfwFN8/wfA4gtpl6jzZqTY+eJf+eA8Y54UC4k=; 
	b=BLDwQTCCGC9bADuRAUd2he6zQWC9xrZ0u0TWxzMp4sRk+k7gcLk8UTwDwkzqTkNLmYkB/aq40qlX+JNHWd7Y3CrbefA+YcNQnfVuRAsRZ+qXr0qBQroNvPMyQxyJGxdQFW+Zam1Ar93yZdjm0KIUQY3nkgDSnQN6bIC5t8DmzOM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=denys.f@collabora.com;
	dmarc=pass header.from=<denys.f@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1736941050;
	s=zohomail; d=collabora.com; i=denys.f@collabora.com;
	h=Message-ID:Subject:Subject:From:From:To:To:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To:Cc;
	bh=qQ8HE2GfwFN8/wfA4gtpl6jzZqTY+eJf+eA8Y54UC4k=;
	b=HmC355axJxxyMwy+L51MoPo4t4bUiSMWIAoVXp35v1+TI90F2ofeCjXdWKqh8ban
	jVFvDFxyRhLAy1/z1PrFN8jduXyyT3L6m6w6Kk+BcqxQpTdM/GXnrWos0qv6qUTA8kt
	9qeAh29PhD1exswhly/NYDcrN+/KJycW0wjcFdGI=
Received: by mx.zohomail.com with SMTPS id 1736941048691541.2921938367418;
	Wed, 15 Jan 2025 03:37:28 -0800 (PST)
Message-ID: <8798491ed2f6780db990b164f8eca8a9627ad491.camel@collabora.com>
Subject: Re: KernelCI Weekly Newsletter (Week 2)
From: Denys Fedoryshchenko <denys.f@collabora.com>
To: Nikolai Kondrashov <spbnick@gmail.com>, kernelci@lists.linux.dev
Date: Wed, 15 Jan 2025 13:37:24 +0200
In-Reply-To: <962b6b41-3f21-4149-8869-562e11225681@gmail.com>
References: <8a2c4f7da3df1d3cd0e52c3bcc49f7fee9475b0c.camel@collabora.com>
	 <962b6b41-3f21-4149-8869-562e11225681@gmail.com>
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

Hi Nick,

It is still in draft/work in progress state, but here is the link:
https://docs.google.com/document/d/1JW1rl05qsZwvId_upDFlkQPrh5R0ielF1zoK0GZ=
nKaA/edit?usp=3Dsharing

On Mon, 2025-01-13 at 13:23 +0200, Nikolai Kondrashov wrote:
> Hi Denys,
>=20
> Thank you for keeping posting these updates!
>=20
> On 1/8/25 4:51 PM, Denys Fedoryshchenko wrote:
> > 2. **KernelCI Development Roadmap**=C2=A0=20
> > =C2=A0=C2=A0 Through discussions with the community, we've identified a=
 list
> > of
> > features and improvements for KernelCI.=C2=A0=20
> > =C2=A0=C2=A0 Please share your ideas or indicate if you'd like to contr=
ibute
> > to
> > any of these items.=20
> > =C2=A0=C2=A0 This is initial draft, and we will continue to refine the =
list.
>=20
> Is there perhaps a doc or an issue where these are fleshed out with
> more details?
>=20
> Nick
>=20

