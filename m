Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB9182D0601
	for <kernelci@lists.linux.dev>; Wed,  3 Dec 2025 08:25:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764750335; cv=pass; b=bbS0En7TqPOJpKqEVraMRz5BBXtFUXrckiEP+f8diyz2zZ/lFPKoM8MPpWABAyHJStBbfkTMYgyPGzpbNsbczxFXxPvCPgs2mZcjbV+5sFXSotGBq6MBMV/UJK6vWhhWA0gnwZxAlMXm6Tkt9KFH+0SXbcvm3Me3qQOg65rVg7w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764750335; c=relaxed/simple;
	bh=1t9ZIkhKgwJjeW5bV07cwMEJ8xa7hrY6RoDCzlWFXrM=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=EsbNJ3JgDdcqZ/0Wr3CTjv2dIF9vrYas8ZyhjqMJntUK87NRfYebPPkzKy6M5tUweenhlxwfCab+K+J4H5EWY1Kx769K8SZAAqDO11ZLKiAmsY/81BWK0fRFf6w3C0J3x7NvpYoqHeKA1JLeCB0i/bN480jIvujbM+JMBURRzoI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=denys.f@collabora.com header.b=FPBgKj5J; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=denys.f@collabora.com header.b="FPBgKj5J"
ARC-Seal: i=1; a=rsa-sha256; t=1764750330; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Yr4z+mKOKXaCLFTFu0xsDfppMba7FwaTfvOt1wX3/cKP2FBl+ctw+bsLMAJIS+rbPUjB1gxo6gwzN+mU9hnVEKkfG9BwFjR2mquztn8WcKnAk394YudfGk+OC9XkmHIdPpvhAQTscJ4G2TZGz70QSv1a21DW+qf4LpBc1Hjw2lg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1764750330; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=1t9ZIkhKgwJjeW5bV07cwMEJ8xa7hrY6RoDCzlWFXrM=; 
	b=HCxgl/Z/grKe22waDvBQU7cgW5A+QolnCsd3RLNX7tk1PvsCPxjHyxwlvt2fmCLJg+rYNh9pzUFAmrRBbkKNFhXdteKQoHkkshfCt1IT6EPvN9fp65kCJHQd66gNXrM8y4d44UjNa5wkb+tImjhpCPTweMrQZ4LzU/g/K30kwcg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=denys.f@collabora.com;
	dmarc=pass header.from=<denys.f@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1764750330;
	s=zohomail; d=collabora.com; i=denys.f@collabora.com;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
	bh=1t9ZIkhKgwJjeW5bV07cwMEJ8xa7hrY6RoDCzlWFXrM=;
	b=FPBgKj5Js4Q4EyFp//s3/LSk6v/5qKUy61I7hDBY8SWccCJCJ0OHtke83dFX7TvT
	VMgdllYcMUdnVlWfHXBEo4mos9Lmxvb4ZTOSG+CToY8MDXvBct91ai1WV3z4ggu3paF
	twE06mCNb8Xf4m/Y/m0Q6g7xa7r1uLjXZbmZcjC0=
Received: by mx.zohomail.com with SMTPS id 1764750328858410.12198183162127;
	Wed, 3 Dec 2025 00:25:28 -0800 (PST)
Message-ID: <8006c851d80cb2a580410402b4bacb1590801caf.camel@collabora.com>
Subject: Re: please add android17-6.18
From: Denys Fedoryshchenko <denys.f@collabora.com>
To: Todd Kjos <tkjos@google.com>, kernelci@lists.linux.dev
Cc: Betty Zhou <bettyzhou@google.com>, Tiffany Yang <ynaffit@google.com>
Date: Wed, 03 Dec 2025 10:25:26 +0200
In-Reply-To: <CAHRSSEzYxAYwX8N+eLWjtJRpSTKi+CoMYnEDR74V7_K9Dok2Yg@mail.gmail.com>
References: 
	<CAHRSSEx3vyonQonF0cXOvnFS4=nZh_G4yRgpf1EsMNnXDrdTsQ@mail.gmail.com>
	 <CAHRSSEx21B9g1nO8izBf1aNesfKLj5DcHgHLd7txtZQaysptaw@mail.gmail.com>
	 <CAHRSSEzYxAYwX8N+eLWjtJRpSTKi+CoMYnEDR74V7_K9Dok2Yg@mail.gmail.com>
Autocrypt: addr=denys.f@collabora.com; prefer-encrypt=mutual;
 keydata=mQENBGKxg+wBCADYF2GLqmJgXZU/E7ovprGDTwVNhKmYi0xZeO4ITPpgykZCOCdTjxFCu
 XSGhSU4o30mtncv0k8AEgv/jxs8FkkOVwtynAUNNVL0fq+NaGxLJ/A72TC5gtC+DDLeTRNMXcTUcm
 g/r6XY4EaX+dqavsaIGKoRjE8+4Kh6gc+XHMEJq+renJScuHdHczCDSjuLyBKxP+2ufDbasgOpIzf
 +gbN/+8/U66Kh1ZjaN61BjLnYkZAPj9/TAiSwHWP8STZLmT/p0xVj/GvhQK5yVrz2x2Q9uA134fgB
 erviZcIeq+wm4qh6hNmlg07cEar5JlcAc6AV3RTbIKM/BrXj0P2hOAoHABEBAAG0N0RlbnlzIEZlZ
 G9yeXNoY2hlbmtvIChXb3JrIGtleSkgPGRlbnlzLmZAY29sbGFib3JhLmNvbT6JAU4EEwEKADgWIQ
 QOHhOgOUazrYZmBTUbQ+imrDIKrwUCYrGD7AIbAwULCQgHAgYVCgkICwIEFgIDAQIeAQIXgAAKCRA
 bQ+imrDIKr8mqCADFtMF+DV7SYIbJR7BWWAIFFm/ayWtfZppDvjlLg13fzKkh5Whrz68NNsPhnkhg
 qPmDNH95SR/P+LbZMT+MCeDUDngSr8KtxhA0LVMkl/7+Pfb5FKRMC0yBV19k+lbJYTbbTVpTpRU5z
 l9Eb0iF99BJRqsM5QJ7bvIVlwDckQFCXH5XaNTmv0O9n9A5/5Dhu4O8DukU079f9811UlpHhBWQPG
 nOGyTeCQGc8a+YCTeyQvcJg6a5a84hkI/z9suOryjKK2oW3/9/uiBEvagg7YCHTocjALhFS7PDC8g
 g/1rsq7pB/qlwu0mtSqOm+YYGnjBaDlq83cMZQh+cyDmf8jNS
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1-1 
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-ZohoMailClient: External

Hello,

Added already on staging, will be deployed on production today.

On Mon, 2025-12-01 at 12:54 -0800, Todd Kjos wrote:
> Please add the new android17-6.18 branch to kernelci testing:
>=20
> repo: https://android.googlesource.com/kernel/common
> branch: android17-6.18
