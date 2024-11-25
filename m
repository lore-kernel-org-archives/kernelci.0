Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A8082500DE
	for <kernelci@lists.linux.dev>; Mon, 25 Nov 2024 06:40:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732516859; cv=pass; b=rwYFx9Yh/1DqURimkoveroqaaXN2os52+z++315Gw9ISY8V8NMLP56s6kwulsS8mjyaZPe/QuuRi+GYVIRq+NU5FpHZjPwUptrSxsej4Lu37KtvJyfnRowLJ++buFA2idSBFQvg0JZVV0oAoJgXEvjPS+s5QI47+PO8m20GQ9qQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732516859; c=relaxed/simple;
	bh=w3tr7VFQ7rsNHP+5Dda/ZOc7kIK4fM7wp4tAktar2Gw=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:Subject:MIME-Version:
	 Content-Type; b=jzTdoB9TKA9y0vzZE1xbFS0RGNwdWvbEHrOV/tirD1X13JLak0ZGQ2UMOXoZ/7PyOxhWaDkf1aMayeyCQTRkjEb5nP5B5W+mjZpMbwQIV7uU6ckqciC04lys4mPSW5lMDyEgegDwdoNRZyxeACaHK4F9NeXlJ6slS6kFE6FWVvo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=jeny.sadadia@collabora.com header.b=P+EWgex0; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=jeny.sadadia@collabora.com header.b="P+EWgex0"
ARC-Seal: i=1; a=rsa-sha256; t=1732516856; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=fGF1utnO7jxCcCxRBg2yOq64ycL8aU7EcHuKvV+Uu5XmdcWvzbtj8Zu9Ua+31w32fXbcE/qee9nrzoBCzFkTlF8dbqZYeQuyxysmianlBVVeyROnOWbK9ZA3VWDrr4HVJkk7UKeS6o0gvv93CFnp8qc02NzyEjqBGIHuqF208fI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1732516856; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=w3tr7VFQ7rsNHP+5Dda/ZOc7kIK4fM7wp4tAktar2Gw=; 
	b=Wa8M3Dene9h6rBRfnznVXkf/0bDyAdfFbCPbeXgiX/aFyf7fyas133pnulky9SJ0upFLVlA7tks6duSQ5dfjfz7IXTwDkjNGtnZYAxRZ+Pe3sKqPVGGiLXpxV+gLp9PcZNohrcHTdhzLcrDPB22PtjAv4UIEX7zqFwHPwWF+8V0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=jeny.sadadia@collabora.com;
	dmarc=pass header.from=<jeny.sadadia@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1732516856;
	s=zohomail; d=collabora.com; i=jeny.sadadia@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Message-ID:In-Reply-To:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=w3tr7VFQ7rsNHP+5Dda/ZOc7kIK4fM7wp4tAktar2Gw=;
	b=P+EWgex0p+Psuj0JBgHaPMhJMjPnOuHdzQFS3nZPd7YuW6R8dTFpTM0HFaLfvigW
	tseidEsPROEZUjgcC7IbZQUlFYm9P7Aog1oeO0dFcj8curx2S5Vs5rSeLqvJrVx4WQS
	wCt/DV2BYAiujiQAmzdiBrMaUm/79jhcz1YG3AJ4=
Received: from mail.zoho.com by mx.zohomail.com
	with SMTP id 1732516854909896.4276695549045; Sun, 24 Nov 2024 22:40:54 -0800 (PST)
Date: Mon, 25 Nov 2024 12:10:54 +0530
From: Jeny Sheth <jeny.sadadia@collabora.com>
To: "kernelci" <kernelci@lists.linux.dev>
Cc: "Denys Fedoryshchenko" <denys.f@collabora.com>,
	=?UTF-8?Q?=22Pawe=C5=82_Wieczorek=22?= <pawiecz@collabora.com>
Message-ID: <193620d3c42.ace85009157860.2102018958107430957@collabora.com>
In-Reply-To: 
Subject: [ Maestro ] Config entry changes update
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

We are pleased to inform you that we have migrated from early-access to=C2=
=A0production[1]
instance of maestro API and it's been running smoothly for a while now.

This instance is stable and we usually update it weekly (on=C2=A0Mondays).

We recently updated configuration entries in maestro to rename all the "ear=
ly-access"
entries with "production".
Here is a list of PRs for this transition:
- https://github.com/kernelci/kernelci-pipeline/pull/757
- https://github.com/kernelci/kernelci-core/pull/2638
- https://github.com/kernelci/kernelci-project/pull/488

Please make sure to use the below change in maestro pipeline=C2=A0TOML conf=
iguration[2]
file to accommodate this change if you are using the production API instanc=
e:
```
api_config =3D "production"
storage_config =3D "production"
```

Also, use the below change in your "kci" tool setup config=C2=A0file[3]=C2=
=A0if you wish to connect
with production API instance:
```
api =3D "production"
```
( Here[4] is the "kci" tool setup instructions for reference. )

Please let us know in case of any queries or comments.

Thank you,
Jeny Sadadia


[1] https://kernelci-api.westus3.cloudapp.azure.com/
[2] https://github.com/kernelci/kernelci-pipeline/blob/main/config/kernelci=
.toml
[3] https://github.com/kernelci/kernelci-core/blob/main/kernelci.toml.sampl=
e
[4] https://docs.kernelci.org/maestro/api/staging/#setting-up-the-kci-tool

