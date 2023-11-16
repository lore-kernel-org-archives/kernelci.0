Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD2C62E654
	for <kernelci@lists.linux.dev>; Thu, 16 Nov 2023 13:20:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kGUGMA1U"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1cc316ccc38so7285815ad.1
        for <kernelci@lists.linux.dev>; Thu, 16 Nov 2023 05:20:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700140821; x=1700745621; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Q2XflPwdTyJWS9B5cLq55m5fzTSgF5IpCemsZrZkGPI=;
        b=kGUGMA1UAJ1xXGUibvZP3OiSgwX+GV6p246hw2WYKdBy3KlzbtvDjlZkzo60K13NR4
         sPGRRrMvIfpcoynKxXikddY1zbkeNowMUni4de2qfWOvBiyf3F5WCX07sP9uoeG+blSS
         LapV02h5nxD0KykOnFQJO0UmGSSwth7D2ibQP2Gq8rPq/URhPzQ6HXw5BMYPb2R7m+by
         t6NQS1F7DgFua7MpE83pHMgz0tMCWbKhCQc8lfIoNGZmoVBbqtqaQJLymnzaIc3qp2Nr
         bw+Pq0XM3rQgfIfK66KfVaZ+ko+6Jjl8r7oVuKRNPC0uJ5C7rU1qIDq89fyuOdguWUoA
         lcOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700140821; x=1700745621;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q2XflPwdTyJWS9B5cLq55m5fzTSgF5IpCemsZrZkGPI=;
        b=wJJyoot94smoXsrzzlzY9+o6knOEibjgGUO3TsnpZoJWHfYBZdVPfcDNdko5dahHBV
         MAXbexxngBIRjSpEvANIDEB/eeC+DuSPgbUsg0b+ay7bxOBz2oc0/u0ImdabP0SxbjYL
         4Yw00CDTWXMa72EhLOC4cNIYS0qVd9VTQMsf6Hu3UbCdWkGt+BWcDY/G+b6F9Rn16NT6
         4CuXGIGFirNZ8WeF4Mmfn1Rt9M7oZxXrAlSiZ53V29sXtS2JYhLbZ6raI920u6ropvOY
         PSV9ZZSx9s/Qyu5mYFS0SINniq/CbNTCdx4W/iCiKz4e17Uy+blwhDpHE6kgTuDVYe11
         6S/A==
X-Gm-Message-State: AOJu0Yw9T2qkYBnPvTNgfVBzRbtY9PW5KvbACclMZK1PxWrWdIoOmfeB
	MgPEUgyn0qfDIo5UYQzYJII=
X-Google-Smtp-Source: AGHT+IHdEhG8HmRvd+96XU5XATRxmwZpSuHqHTrSJ7n/ZhLDynMAFsvUmOr6SrxJmBMisUEAdwOCXw==
X-Received: by 2002:a17:902:e545:b0:1cc:3bfc:69b1 with SMTP id n5-20020a170902e54500b001cc3bfc69b1mr9304626plf.24.1700140820712;
        Thu, 16 Nov 2023 05:20:20 -0800 (PST)
Received: from archie.me ([103.131.18.64])
        by smtp.gmail.com with ESMTPSA id s15-20020a170902ea0f00b001bc930d4517sm9176312plg.42.2023.11.16.05.20.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Nov 2023 05:20:20 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
	id 16A6610D5B837; Thu, 16 Nov 2023 20:20:18 +0700 (WIB)
Date: Thu, 16 Nov 2023 20:20:18 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Nikolai Kondrashov <Nikolai.Kondrashov@redhat.com>,
	workflows@vger.kernel.org, Joe Perches <joe@perches.com>,
	Andy Whitcroft <apw@canonical.com>, Theodore Ts'o <tytso@mit.edu>,
	David Gow <davidgow@google.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Mark Brown <broonie@kernel.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	"Darrick J . Wong" <djwong@kernel.org>,
	Charles Han <hanchunchao@inspur.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Linux Kernel Unit Tests <kunit-dev@googlegroups.com>,
	Linux Kernel Self Tests <linux-kselftest@vger.kernel.org>,
	Veronika Kabatova <vkabatov@redhat.com>,
	CKI <cki-project@redhat.com>, kernelci@lists.linux.dev
Subject: Re: [PATCH 1/3] MAINTAINERS: Introduce V: field for required tests
Message-ID: <ZVYXEry40HTCis00@archie.me>
References: <20231115175146.9848-1-Nikolai.Kondrashov@redhat.com>
 <20231115175146.9848-2-Nikolai.Kondrashov@redhat.com>
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="/52Cd+M7ZZaAYRXH"
Content-Disposition: inline
In-Reply-To: <20231115175146.9848-2-Nikolai.Kondrashov@redhat.com>


--/52Cd+M7ZZaAYRXH
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 15, 2023 at 07:43:49PM +0200, Nikolai Kondrashov wrote:
> Make scripts/checkpatch.pl ensure any added V: fields reference
> documented test suites only, and output a warning if a change to a
> subsystem doesn't certify the required test suites were executed,
> if any.
>=20
> If the test suite description includes a "Command", then checkpatch.pl
> will output it as the one executing the suite. The command should run
> with only the kernel tree and the regular developer environment set up.
> But, at the same time, could simply output instructions for installing
> any extra dependencies (or pull some automatically). The idea is to
> get the developer into feedback loop quicker and easier, so they have
> something to run and iterate on, even if it involves installing some
> more stuff first. Therefore it's a good idea to add such wrappers to the
> kernel tree proper and refer to them from the tests.rst.

Does it also apply to trivial patches (e.g. spelling or checkpatch fixes
as seen on drivers/staging/)?

--=20
An old man doll... just what I always wanted! - Clara

--/52Cd+M7ZZaAYRXH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZVYXDgAKCRD2uYlJVVFO
o75JAP0cfZYKSutbwH9x71KI13pvS1fgdOAvvcN9kaUBzg0vnQD+LUG82FmYKG63
JUcGvcrvno/pxKXp/R7iYPVC1/wijQQ=
=hAKi
-----END PGP SIGNATURE-----

--/52Cd+M7ZZaAYRXH--
