Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 567DF2FCE25
	for <kernelci@lists.linux.dev>; Fri,  4 Jul 2025 12:59:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751633955; cv=none; b=OPvic++K7rud2L4E2AYgUb1M+1ntZqms3RRyuowOXlGmXihS9IxxpDxICvQXSrUh07D1PezVMvnFTXS7dx/jC6YYe9KLoc8Ie3KDp1vewWJ0mYrfMhYF4zi8A0CmCcbrYJCu/5O/BHM5VyL+UMRk4zOM2cR/sOv9uBAKxVjOICg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751633955; c=relaxed/simple;
	bh=wy0UTXWmN5Tcv+MCKie6D6Aa3nh3lWJbdMDS3n3yoq0=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type; b=i4Gv0ScW22ynDhSMDSPPOvJNt1DfCpLrCvJkc5xA7PP6DufBk7hqBHqTJDDEFMG/SiBIfvs2vmk3pdlomzXjBGXT5gm2hbaGFQ3Sti6rhu4I4tE29jhf/w2tXeHHaBvlplHQ5tQoTXVYoY27jGlQT2moVKFE3vIZLP+cRVQ6jvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=sDMMKv1z; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="sDMMKv1z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1751633920;
	bh=6vWbZx/CHt9UJ0A7hnbUmcrB6Mrls4gIjWVNdVBU73Q=;
	h=Date:From:To:Subject:From;
	b=sDMMKv1zWAYXasyUcPqGjYaVqgVWe1TcRlPmXs9+icWA76pCsFPXxN5AfdFfJ5MZv
	 9d4WNksfCYBSFYGc1XvClWAppjZxNRLB8MyylTHWYYgjUltEWbWRKTLZPPSxcmK++1
	 JqBXEzphTTuJcKHbOl5lKKv5ra/bUuklMt/BUCSKKhkhV+vcfcFOSCY2RocyDfC4WR
	 zFOg+ak8P3OM+fi0BPDxXbmco1BEPRhkudec0Lpxxqh5KAmIv80ut1VUTGS0BEzczk
	 p+95AoboYjoymnm5sb7owYaqQxVVRt79QitKELa/rI5EStdvJF1n/4bI2boChuWu3+
	 2su/rfN79ovxA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bYYbg6mhRz4wcZ
	for <kernelci@lists.linux.dev>; Fri,  4 Jul 2025 22:58:39 +1000 (AEST)
Date: Fri, 4 Jul 2025 22:59:09 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: kernelci@lists.linux.dev
Subject: feedback about KernelCI reports
Message-ID: <20250704225909.52d1555d@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/yLWdGj6y8RyHl1yjOrDjSe2";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/yLWdGj6y8RyHl1yjOrDjSe2
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi,

Firstly, thanks for your testing and reporting.

Just a couple of simple thing:

It could be worth while reporting any tag on the HEAD commit.  This is
especially true for linux-next which comes out every day (with a tag)
- it would give people an upfront idea of which linux-next tree has a
problem.

Also, something is line wrapping your Log excerpt (and the reported
error/warning) which makes it harder to read.

--=20
Cheers,
Stephen Rothwell

--Sig_/yLWdGj6y8RyHl1yjOrDjSe2
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmhn0B0ACgkQAVBC80lX
0Gx7Hwf+PPkqlCtFuX0XHMXzwXqJkFB9/whEApQxBunCHzxkjtJjr3bXtFoxK3ST
n5p55TeiIejrSGcf4wnb38Q6wvfeub0B/06aQThK3WqEMeCWLR2kE84s04+yK73z
bQFDyoRTJlJ6ALxb0XJUuCxDwTk4rdP7U/EM8OsDN2w2crilK78Wteic1GlyXlFY
TwALWGhcP+KadzxlQRHgh+UVWOOcwAc24/KQZxSbyADsbZ/MVkp+UNBS7QJJwJzi
1Rs3lFL5ZjUu8VBMOtqtT6LOg0+uCWfO6TbqBOuAOU5WXnep4/7MT+Bc2QyIVkPE
9cd7xzbi+Tc3Kz6KGgeQVH5pn6Cx3Q==
=zv9f
-----END PGP SIGNATURE-----

--Sig_/yLWdGj6y8RyHl1yjOrDjSe2--
