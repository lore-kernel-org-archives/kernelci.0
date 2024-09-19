Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF09319E7E6
	for <kernelci@lists.linux.dev>; Thu, 19 Sep 2024 13:24:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726752242; cv=pass; b=QeAFScYotkKY9ME3Ww4swf5iBS2XRqQ6F0JXp5apkKbHgHP28hWh9v2tc/n1QcroQs7McNiRC8Fp8Mten2XHdJ3izPOKl8TCPCcLOcLiIdOwStWwQX/NwiraUoHJzNtUFePnmGZI2aaIMFmv4k6L/f45jjEg/7/M3JbYDz4QI1M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726752242; c=relaxed/simple;
	bh=KY9ymkmrL8HKjv5Wg0WQgsqpTZX5dRooC1VlR+HqArk=;
	h=Date:From:To:Message-ID:In-Reply-To:Subject:MIME-Version:
	 Content-Type; b=qlvVproj/1g8KzjNh9gsbbDOdEp+ZMAPkn6txprhgtgjSwUzcVNeELM7qZJodTQKPK12TIzXcI1YbrZwfIk+vzA6qQHmMRJ+8RSsXElWV7vpv7yOMUmqhlv0C80KgBZF0cbb/gT+tojTO2/b+ONTRlTblZNqnpCmC5lcpTVEJLM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=gus@collabora.com header.b=MO9MFlOv; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=gus@collabora.com header.b="MO9MFlOv"
ARC-Seal: i=1; a=rsa-sha256; t=1726752233; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=CebaCbTHIQ26xtIS6gguFoWLyekqryY8sFvTEbGAct/Vy4R0wQM8CVSGwG5SSAM9L6xwdCOuwgzWe3U3Ruw7HjS5ofi+nVpQZW07I/cVrkT/TFm7WVO8PpeRo0ppSMeQfa0RpvXVRGF7L6wls8bJn5yc0+I/sW5X6SLGlO2sFxg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1726752233; h=Content-Type:Content-Transfer-Encoding:Date:Date:From:From:MIME-Version:Message-ID:Reply-To:Reply-To:Subject:Subject:To:To:Message-Id:Cc; 
	bh=oRQH8aHcyC/bUlagqAW8EW0z+J/K45szguXLBp/5gpA=; 
	b=L9G3f8QsYk2u5RUcspsOcHh5ybMKzRhA0Amw68D6lHvBVK3lfkkmwzd8gtrb1xvKuamfuZ1Jms/aKkTXuTSyhltwwrIsPaFCGc34IWcYnINrtiKjcCD7ZQUOvNffJyirdGbPxIaEsuGWKfYQx0g8uHgNhkHk8QUxe/gY6ruLm6A=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=gus@collabora.com;
	dmarc=pass header.from=<gus@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1726752233;
	s=zohomail; d=collabora.com; i=gus@collabora.com;
	h=Date:Date:From:From:Reply-To:Reply-To:To:To:Message-ID:In-Reply-To:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Cc;
	bh=oRQH8aHcyC/bUlagqAW8EW0z+J/K45szguXLBp/5gpA=;
	b=MO9MFlOvStRKQd2wSiWfOCo3joUPiFaG+OD1WYP7B8o0QJLM7tCQhyjHXHSFidBv
	MUQIH0dQPaqT1RFX7IIHC1KbKh8d8frGwP9v8FL8kdI/kb1dOY4YGqd6T+AzI8QBdhG
	eSiCoh8mR9vmlIOkSxzX2X7g/MyhiVQn1KoxmxSo=
Received: from mail.zoho.com by mx.zohomail.com
	with SMTP id 1726752232768953.1678095882096; Thu, 19 Sep 2024 06:23:52 -0700 (PDT)
Date: Thu, 19 Sep 2024 10:23:52 -0300
From: Gustavo Padovan <gus@collabora.com>
Reply-To: gus@collabora.com
To: "kernelci lists.linux.dev" <kernelci@lists.linux.dev>,
	"Automated Testing" <automated-testing@lists.yoctoproject.org>
Message-ID: <1920a7414f0.ec974c923390.3400713740160924449@collabora.com>
In-Reply-To: 
Subject: KernelCI Happy Hour today in Vienna
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

If you are in Vienna, we will be hosting at evening event today 7pm at  The=
 View Caf=C3=A9-Bar-Restaurant. 25 min walk from the conference venue.

https://www.google.com/maps/place/The+View+Cafe-Bar-Restaurant/@48.2247609,=
16.4050117,17z/data=3D!4m6!3m5!1s0x476d071d9606a803:0xfd3f0315cef81b84!8m2!=
3d48.2247609!4d16.4075866!16s%2Fg%2F12qfwrjn2?entry=3Dttu&amp;g_ep=3DEgoyMD=
I0MDkxNi4wIKXMDSoASAFQAw%3D%3D

Hope to see you there.

- Gus
