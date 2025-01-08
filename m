Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83B771F3D54
	for <kernelci@lists.linux.dev>; Wed,  8 Jan 2025 11:59:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736337577; cv=pass; b=G7RouPS8v0cQOcnQKoJalzY77wdq5tXHLUHnEl8OagMYxEaz3mmdtoyuyVHIbEwYpgoD75bBg7HAFjgh9i1k413JGt1rZqL68+qlD+h+ZH8dNbEA2GgYi4Wr8Gup6h1/yWzSoFm/0b5E9lDRrDPlYpCtgNEnaHrCGUN30fyVGGM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736337577; c=relaxed/simple;
	bh=aahp6HpxHf4bNNezcwyw0Pbopm7qQch1QeaIC0Qs5sE=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=iJHHzR4/PWfXZ9A04jl2pNyKXdDPtYZqie52iF3+aGC/bQis5WOYDqHYc5J1zdtg7psU/YY74F/Fw1dTXLfQ043ZGdXCqkeqKuYjCklkQ+uN4xleSWxaF9XC6Tqd6AqoWx5q4H/wVyADoWTpxy0NabrWva4/xPz9WpgUnhxxl8U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=denys.f@collabora.com header.b=Tun7BJ+M; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=denys.f@collabora.com header.b="Tun7BJ+M"
ARC-Seal: i=1; a=rsa-sha256; t=1736337573; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=HYIdXwewtIIT+wT/7qD8lVNReFNaShuE1SRhSgcTXVvLTZflDJLhBzbe4Nab5+6RBWUT/B9vIjB8wJKAfWYjeSUx1eGs8IlSptGmiqZdnr0KP6JgOZW3tQ9OMU3KCTIVKuxeLIxpinkEwrJ8EV+Vf44joKlIVzA5Vu/4LmddBgc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1736337573; h=Content-Type:Content-Transfer-Encoding:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To:Cc; 
	bh=aahp6HpxHf4bNNezcwyw0Pbopm7qQch1QeaIC0Qs5sE=; 
	b=eIslsskF+IfwAzoZvybQsP4Pv53g3s6RMkZ98CBwssAuSmdqOEsK8nNqgOM5maB0ascouYYlpbQExTh1L3GkngBDu5euhQVSwaSi1h7gKNshDa1rOOFmdFE3GlfrAhdlYVb4s5OiRveQWcIH9QHiA0MqVbLTvAYNe8LIquPPLtA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=denys.f@collabora.com;
	dmarc=pass header.from=<denys.f@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1736337573;
	s=zohomail; d=collabora.com; i=denys.f@collabora.com;
	h=Message-ID:Subject:Subject:From:From:To:To:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To:Cc;
	bh=aahp6HpxHf4bNNezcwyw0Pbopm7qQch1QeaIC0Qs5sE=;
	b=Tun7BJ+Ml727Lp9QBq2OCLqB4TAUWsVen9ISTA/9UyIl9w0+n4QwCDISqEJkTxrI
	hzZmiN6DMDnpPrv4XvAJ9iEBv48XIUkh4/osowFo4TFagDOniBCQDlCbEkm3bLwSSY7
	3cX5+dh2miMop7Opbj9hT0hrKNNEN13sotUviSvA=
Received: by mx.zohomail.com with SMTPS id 1736337570286282.26982706824094;
	Wed, 8 Jan 2025 03:59:30 -0800 (PST)
Message-ID: <2c31f8fdbb38c74c4ca82d6625243b1e27101c52.camel@collabora.com>
Subject: Re: remove android-4.19-stable from kernelci testing
From: Denys Fedoryshchenko <denys.f@collabora.com>
To: Todd Kjos <tkjos@google.com>, kernelci@lists.linux.dev, Gustavo Padovan
	 <gus@collabora.com>
Date: Wed, 08 Jan 2025 13:59:27 +0200
In-Reply-To: <CAHRSSEy3cDt13XcErp5qNLKhgZDoC212MSRpDgGOXRE1=_RN2Q@mail.gmail.com>
References: 
	<CAHRSSEy3cDt13XcErp5qNLKhgZDoC212MSRpDgGOXRE1=_RN2Q@mail.gmail.com>
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

Hi,

Thanks for the update.
android-4.19-stable branch is removed from testing.

On Tue, 2025-01-07 at 10:36 -0800, Todd Kjos wrote:
> The android-4.19-stable branch is now deprecated. Please remove it
> from kernelci testing. Thanks.
>=20

