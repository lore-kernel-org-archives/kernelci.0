Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 587D2194A54
	for <kernelci@lists.linux.dev>; Mon, 23 Sep 2024 10:08:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727086081; cv=none; b=kbwD04zxfXfrezURGZaCm4FsoLnjjx092IJtlNA4bwIPAXncSYbCVIfV8Zw+GEDsA6xzYevXdybgher9/gdgnmRPFntO24AC3uwfDgfgtIHbcCwygh7YvEyjdVzfDOS6BRDb2spePe3jsnpjchgmgLO16xOfX2tOYgL+PnuCB/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727086081; c=relaxed/simple;
	bh=rtI+WHqQTHTw6Sd2Xg7IYxsZbOCEY2/C5Bt/8zVVZQ4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sW/L7sA+7hAdd39w6zAurWU2UaU/9latbPy24nSjryto9fpIIFKEb/NIdIUf2c4oyaWruqssADwhugj6MlUpvUPEC923kSVigGcxzgY71RGaFLkj/4Er+CG4C5+ATFV42Y8l9454SSm3lGGYlrdC+7EdsTSixavJfjn3Q/F9Eo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A1GlZl1y; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A1GlZl1y"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-42cb1758e41so32483385e9.1
        for <kernelci@lists.linux.dev>; Mon, 23 Sep 2024 03:08:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727086078; x=1727690878; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rtI+WHqQTHTw6Sd2Xg7IYxsZbOCEY2/C5Bt/8zVVZQ4=;
        b=A1GlZl1ymPk7sw6gIYQFptgFM8lVG+pAkcum6+V6sPlNB4CktU/HtdKqps++6CjoIt
         zNzowvJRGI2+xkmaICOnYZNEUMzuSs399uiyZKmt8oj6tT4WaczjIyn2FJEDnWVfmqzN
         ZCTWQTjBWrh6Y13Dp/SGYuj6vXLdN1kDNICIb5t8RURz/TxBxUYhkqHp3GWxa1sSTCKh
         Ba8pF3bBMm2O4yzGZT/iX8zBk1fOemTqDJLRPuwEzips/ZaMZ1jdmwyvOTgfENLbSrfY
         X3XVO9jsl5LBhNTgbOaDsDqVXQZUDvt1UGxe4t6wIjCCYYHQRXcY+4ILMzWZ+jbhT49Y
         RzGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727086078; x=1727690878;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rtI+WHqQTHTw6Sd2Xg7IYxsZbOCEY2/C5Bt/8zVVZQ4=;
        b=X1JTXcppNsEx9ExVmHNiAoT7b4kli/jkV4MvKwi8h9jBqUL4AhaaSqwHiwt+sq9Fij
         NPP11MAAuLVr/W59KlUVJ3WvAnLtYbFJYlNNuXls/M4uwou+6DSCPWFFNHKBgTHOI1K+
         IxZjuXnhL6W0o7wTIik3CeoHOzJOKVH3XbxyRyPjGlXa590ODNxtPZAqAoCTFjTpBVOv
         SOG4IRzc2fjwy443ZTC9G8cBjFIApkXvECGkddYZKH/Oqe4xN6Z2Ycv3loLGj2sZHNTL
         hR6+VK33egIeyDShfNxLes+TqrOEqOyNa07HaYkqq0J4fFWG/KGDasng192wMKPhSVcX
         7PPw==
X-Gm-Message-State: AOJu0YwyQMLmdTdQrbBcFjCkVwr3dkV2OqDw0uVnYicouqRo2+ZN1tDP
	oI/mrFHDn/QhUdkMsCQU5hJJNgG3JFWOWXqA2x8QXx+Lr9RPkbHXWj8Zsg==
X-Google-Smtp-Source: AGHT+IG3qoFHw0tz8YHGUJ2IlLXyhtq7gnrv4CVrPPVxYukaOOg52wXCjN81+4m2zkXv6IsPY4HoMw==
X-Received: by 2002:a05:600c:1c04:b0:428:1b0d:8657 with SMTP id 5b1f17b1804b1-42e7ad8e706mr81160955e9.22.1727086078042;
        Mon, 23 Sep 2024 03:07:58 -0700 (PDT)
Received: from orome (p200300e41f147300f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f14:7300:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42e754c7580sm122176915e9.47.2024.09.23.03.07.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Sep 2024 03:07:57 -0700 (PDT)
Date: Mon, 23 Sep 2024 12:07:56 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: kernelci@lists.linux.dev
Cc: Jon Hunter <jonathanh@nvidia.com>
Subject: KernelCI DB credentials
Message-ID: <gw7roxtasg6njfj7xzhgglbbomwuy7ipintlzd2iojpsvlflpp@6vj4aqcoekst>
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="mlyup23rdoovk4qd"
Content-Disposition: inline


--mlyup23rdoovk4qd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi everyone,

I've been looking into ways to contribute the test results from our
internal Tegra test farms to the KernelCI DB. Following the process
outlined in the documentation, I'd like to request submission
credentials.

We usually run build and boot tests on various Tegra-based boards on
linux-next and various stable and mainline builds. In addition, some
sanity testing beyond just booting is also performed, such as boot log
analysis and several system-specific tests.

Initially these would be manually submitted, but once this process is
mature enough we may want to set up our system to automatically send.
Can we reuse one set of credentials for both or is it better to request
separate credentials at that time?

Thanks,
Thierry

--mlyup23rdoovk4qd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmbxPfsACgkQ3SOs138+
s6Hn3A/9HjAYVylmhUOO5zHSW7yUMFFDgLBc0AhqeFv8zdpMsdtdqo5ek1KXle6s
ZL9GSM+mE6ORjVyUJwfc+r1eJINc/8n0Kqd9Jg7hif1fXu8jgao7T0LGA8A1lEbI
4rb67YPGJgyMxqJbWbNFojkKJ0VadeGy+BrbwPfhBCdmYMlY+ksOPHTTdNFXsh2+
w8vgoAd7L2VAl8iav2QL/+wfOhbu4U+D5TKom2ahsw++9o4dw3It3Roi+wJBW/t+
1n4uM2ZffRcbj2gZ75zP6dCMVcBijiGOxJKfhxxzMBfLNCyGI5Df0Za9ByuYZb1A
sIgWm3AnWVjSlkXXcMTAQtANcYpUkDPHB++I6MIey+aFpFHYqtD53dhkR2GW2Un9
5ygVgLDybsfrLp9g1SmpR1PGCX8qZ0/AJVfhYIXlHe06+jsEK/JM7pB7h+CAKCYH
yNxodplu8L5TbCzo3OIu9vN4KexejlBF5/cxlErlrH8XfIjHFGFYH0maAKQw+AjY
Kyyypy3ptrsjp5seKue5GI79t/2V29h0S1drZCcthuFoQ0v/G5vI+k7/WenBU02l
zBXt0eTgFWUgyvzcHtNR4mSLDZa7h9cNV1ltHkn+sJ/phF1HDOKh3KqyquAr4egP
mGzkNOb5YUWbjvehFFdjmBl3lndmZhO/pmdkO62ZiiW9rz7vEvg=
=F7IR
-----END PGP SIGNATURE-----

--mlyup23rdoovk4qd--
