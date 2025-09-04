Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED878212576
	for <kernelci@lists.linux.dev>; Thu,  4 Sep 2025 17:04:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757005463; cv=none; b=GYPqOQyZrX8p9CVr0IxUbyudZlyto45O/pIQah4wsv0yH05c+noXtH/lmroS84VHsf806YQsgjDJnUPQJakyoJz4sGETHouz68A7iuSSUlMbMF+UQ3zdkIMdP9dZekuYp6pO2w/mU0OG+Xh2kpfJwgSX6W6QhOpfqN3xWMi1XnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757005463; c=relaxed/simple;
	bh=pkfKigxBehoKtD84TZkpYDKYrxBJJkn4UNSr5fWe9Dc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sdTBZoMVb5N+6TFwur6FvGzU4K762Whi8pJdPWEzB7I8E8FRszsf4Nb7RlLoLHmL/KPAGJOrtT7vVUqdQe1fDVKBzUPiU8tZA48W+aLmZMiJupft38BedfVnB+USiC9YvFYAvN7Ctz9faWbH0qNSwCjflVyMdJxlCzIcQamg6aU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=miraclelinux.com; spf=pass smtp.mailfrom=miraclelinux.com; dkim=pass (2048-bit key) header.d=miraclelinux-com.20230601.gappssmtp.com header.i=@miraclelinux-com.20230601.gappssmtp.com header.b=VQMYEIeL; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=miraclelinux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=miraclelinux.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=miraclelinux-com.20230601.gappssmtp.com header.i=@miraclelinux-com.20230601.gappssmtp.com header.b="VQMYEIeL"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-327ceef65afso1381092a91.0
        for <kernelci@lists.linux.dev>; Thu, 04 Sep 2025 10:04:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=miraclelinux-com.20230601.gappssmtp.com; s=20230601; t=1757005459; x=1757610259; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pkfKigxBehoKtD84TZkpYDKYrxBJJkn4UNSr5fWe9Dc=;
        b=VQMYEIeLygwR/KsAp1S+KwlynhmQ07u2bkiQxUAxu6AM4cFNfmg0WDhitlBWVgDQk6
         5/NpKq07VAehBjas9SYv6eE5XD/tGaocv3oJQCiyoVK2Oqoq+JvRzawbOWfOL50PLhiY
         hHnmueXU82+356SrU5CfDUNx6vm6KsvhwdLWCTjSQr2Hr+Fnqny5KN5rpKBFEPUa7g9k
         l0tzmjH/wJxzsfFRQva33Q6mWOTI+QN8+B4pSpSMo/DCtxpxgdhrVw70WQu5vgEqeyPB
         SxVoA4FJ4Md3PZ7RNMAd/FKCv3QYJneS2ooAEjzciAf2yrKHv63Yg7R+mpjp6HM3iroR
         JKuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757005459; x=1757610259;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pkfKigxBehoKtD84TZkpYDKYrxBJJkn4UNSr5fWe9Dc=;
        b=fvywblX7irFk1SfQA9RGOuCThr2NpgxafNQB7aT7YTEJXb7S3mK2cV9YPaerH+VOG/
         n4zE2H0fqnu1vKmQFDllEfdNn97iNiLwt46MBHQjbv/8kRPMB9Du/NFxAIiaAGuQG8UF
         KaD3iQvmobTJQH8ghfYVN147uwnCPmUUut1Ou5lUDP6jCUzQ3z/YBKCqv7f66TIKy/P8
         63sikX5RjpgVSRTCaKOLtlbKr/1YErrDYX6XY4SmzryDgqitpGZDssUl4BeJ+GkuQMzS
         EOkfm+2o43E4RFMOtxjN9FhMVNAjx9Dg0yt3ccR8bAzTvlH7Cf+adz/PHzHJCiILtIIY
         5SoA==
X-Gm-Message-State: AOJu0YzNK55gpN/ocAOrBTdn4mrpgoVEqat9EdoTL8cNRgWRYGV/6ZwD
	qLI8fejZGjqH71VGLMMLU2UDy1aUmNsDN6rdGlUbj2Vj7U1s+88VZ77SS137Je3rPtt4npARYkZ
	nULEPZyhJHdZY0BxILfG5d6DYLuVn35ispG5+vRWi
X-Gm-Gg: ASbGncv2MhQdWJTn+i3llVjjDmiW/NezbKYjRsk2A0C/p59z/VRzVNDrpv4PHcymJ0u
	iKT0MzzOHB+dyQ2ZADyA5Dx1iCDJM1L2oPuFPdPpxxYssZqeJi8XE64uASzuEqCv6/F42TZm/co
	Cjq3bnXYKP5AodaSrMQvdWqB+B5BbSXUbAVVpUx/4Eh2o6R5IyTUxxZ5xMyD2TmXqkubTh1xHZn
	vS+2OxsIM6AyGwYaA==
X-Google-Smtp-Source: AGHT+IFShcA6nJpaJcsS9dNZFGgnBCe59Kzrg9VkUS/Pk08muoNP6U9/uurx34cm/Lf+9aQdFHg0ebbTxtG+VN9uPOs=
X-Received: by 2002:a17:90b:3f0e:b0:32b:95bd:8271 with SMTP id
 98e67ed59e1d1-32b95bd85a4mr4849835a91.15.1757005458421; Thu, 04 Sep 2025
 10:04:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAK18DXZFCrvj-QK=45xVSkt+EJ6FSSPsxPxoeRBXPdDRySup9A@mail.gmail.com>
In-Reply-To: <CAK18DXZFCrvj-QK=45xVSkt+EJ6FSSPsxPxoeRBXPdDRySup9A@mail.gmail.com>
From: Arisu Tachibana <arisu.tachibana@miraclelinux.com>
Date: Fri, 5 Sep 2025 02:03:42 +0900
X-Gm-Features: Ac12FXyKcPB8GIqzI7Y8uI7LNh9y-7Kv3xH3mk8BNNCjXC0v67qj_L0DG7jWDV0
Message-ID: <CANgtXuOmXx1d4LPp1HKvWyOkLnYUt3fi97=f4wG7G72dRVcNzA@mail.gmail.com>
Subject: Re: KernelCI TSC nomination request
To: Donald Zickus <dzickus@redhat.com>
Cc: kernelci <kernelci@lists.linux.dev>, 
	Gustavo Padovan <gustavo.padovan@collabora.com>, mwaqar <mwaqar@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 3, 2025 at 4:24=E2=80=AFAM Donald Zickus <dzickus@redhat.com> w=
rote:
>
> (resending text/plain)
>
> Hello KernelCI community!
>
> We have recently revised the KernelCI TSC charter[0] to establish a
> more effective approach for our future work. The TSC will continue to
> monitor and provide technical direction for all activities and
> services related to KernelCI. Additionally, with the inception of the
> Infrastructure Working Group, the TSC will serve as the primary
> interface between the KernelCI community and our key users (kernel
> maintainers and developers, hardware/cloud vendors, etc.), translating
> user needs to the Infrastructure WG.
>
> The updated charter requires a new committee to be elected, consisting
> of no more than four members, each serving a one-year term, with only
> one member per company.
>
> If you would like to nominate yourself for a committee position on the
> TSC, please reply to this email with your nomination request.
>

I would like to nominate myself.

thanks,
arisut
