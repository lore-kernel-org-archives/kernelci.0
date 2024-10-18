Received: from mailgw.nuclearcat.com (mailgw.nuclearcat.com [78.47.178.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D1C92CA5
	for <kernelci@lists.linux.dev>; Fri, 18 Oct 2024 20:45:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.47.178.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729284338; cv=none; b=E+0zjYtJZZjQqH4TY/9qBzsXZ/snHs+MxOAwUBsrGr31vi4HsIcoFfn2oVO6WK01V25Gq/oid0bHHoX7OWgYd4/ARbfWJUjzjuAWLRC04jYQVTUUqD2m3EJmzcV6r2l4vfXTHvUQoPMEr4K11+pc6qoaL3oxuiWDwk+Nry8I7/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729284338; c=relaxed/simple;
	bh=1klxxhwaeQtQPcI7hta8BWRh1FFNKGt8KgzyG0QXdmc=;
	h=From:In-Reply-To:Content-Type:References:Date:To:MIME-Version:
	 Message-ID:Subject; b=U9tnz3NALknGfPd6RA4+E21120drik9gfiB49ko6IzeB8FdTcH5ctDlyAWMMJT8Hyh5+3eE2fL3RA5VBvlbmS6npX4iqiuYvnbaJw0S9Uh7oyVv+7IWIF1Q4JF0BFoba1dyY4UuUdIIL2SQG8ehm5wkT2Ir80qcAiH1EL3OCHBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nuclearcat.com; spf=pass smtp.mailfrom=nuclearcat.com; dkim=pass (2048-bit key) header.d=nuclearcat.com header.i=@nuclearcat.com header.b=Bwrf0KzM; arc=none smtp.client-ip=78.47.178.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nuclearcat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nuclearcat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nuclearcat.com header.i=@nuclearcat.com header.b="Bwrf0KzM"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPA id D1C8A5F02B
	for <kernelci@lists.linux.dev>; Fri, 18 Oct 2024 23:45:33 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nuclearcat.com;
	s=dkim; t=1729284333; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references:  disposition-notification-to;
	bh=1klxxhwaeQtQPcI7hta8BWRh1FFNKGt8KgzyG0QXdmc=;
	b=Bwrf0KzMUEAIJ8rUu5vjPE7/uhuDuz9dofdnqML3sifbs3Ffp4DvwSzoYZ6DqMBGgUTQjQ
	4MP6NDss4rJOC1p/8WSrd9RWnjZAehPPeJYutzfVB6vwUZAhqeELCiPytP2hiMU60ET4qh
	i03gadJC0M4110kwtChsnzSDCU2RlLMakLPUoz8aZxdgv9keHO3vryPVFMN7FhZ/ysDMPb
	j1imqiyeWOKneXkdko5R/PibagakmQ8gEjDr5/YWLkm0BSkMA8yhSsPLpgwYftamhvoDHw
	UUNLDPpZAntSoTmuHKqJyClJVU3Yl9QMAE+MX1LZVNexPl1XEkO/kEM4s9lZ9Q==
From: "Denys Fedoryshchenko" <nuclearcat@nuclearcat.com>
In-Reply-To: <CAHRSSEzk6QcBkdA4UhOfQzFxzLy9njSvZ67zgGpw1HZir=42bg@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
References: <CAHRSSEx3vyonQonF0cXOvnFS4=nZh_G4yRgpf1EsMNnXDrdTsQ@mail.gmail.com> <CAHRSSEzk6QcBkdA4UhOfQzFxzLy9njSvZ67zgGpw1HZir=42bg@mail.gmail.com>
Date: Fri, 18 Oct 2024 23:45:33 +0300
To: kernelci@lists.linux.dev
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Message-ID: <44-6712c900-3-17df13@5111692>
Subject: =?utf-8?q?Re=3A?= please add =?utf-8?q?android16-6=2E12?=
User-Agent: SOGoMail 5.10.0
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: None

Hello Todd,

I noticed it is mentioned android16-6.12 but then mentioned branch andr=
oid16-6.6.
I guess correct branch is android16-6.12?

(Sorry, re-sending in plain text)
On Friday, October 18, 2024 22:48 EEST, Todd Kjos <tkjos@google.com> wr=
ote:

> Please add the new android16-6.12 branch to kernelci testing:
>=20
> repo: https://android.googlesource.com/kernel/common
> branch: android16-6.6
>

