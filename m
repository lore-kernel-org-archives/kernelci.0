Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31C9C3224
	for <kernelci@lists.linux.dev>; Tue, 29 Nov 2022 14:34:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64002C433D7
	for <kernelci@lists.linux.dev>; Tue, 29 Nov 2022 14:34:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669732486;
	bh=YRgeO/6wlRi6vPrCGAce0jdmXiUevT/5tvuY1VWfbqc=;
	h=Date:From:To:Subject:From;
	b=c4NCLqkX9A1J7NZ3BqOVtnAehZasR2eVCBuufmb+KCtgleEv8QpvXfrwrr1r2BFKH
	 j6pE+OkkDZ3ZFkPlK7iW5tMG4NvA9sQyhOmDJM02XyLctz8N+eAn8hYlY9wpuvX3Ik
	 SSrnTltsq0DGC5Wq2ItwLz50nviIUgtiHfk+s50spwGpGYpMKFqFlWbxkBIjDTZ6pZ
	 0xTWQ7Ogu7hpu0Y/Z5hoWcdbTh5r66YIcAsnhVHE9Eq8Smc7PY7cDMKU09uLe0fFnA
	 2X/Q2YSdxyyCqaBoU49eXR1Uj23rutUGwN+ciZw2OMw1nsNJ+ZhdJRRtsyKuIPty/I
	 2Rml1akwp1NXQ==
Date: Tue, 29 Nov 2022 14:34:42 +0000
From: Mark Brown <broonie@kernel.org>
To: kernelci@lists.linux.dev
Subject: terraform configuration for Kubernetes clusters
Message-ID: <Y4YYgmC1NU5igAYb@sirena.org.uk>
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ixjsnV45MK0vy+cf"
Content-Disposition: inline
X-Cookie: An apple a day makes 365 apples a year.


--ixjsnV45MK0vy+cf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

There's a couple of pull requests open which attempt to start converting
the Kubernetes clusters we're using for build to be managed using
Terraform:

Azure: https://github.com/kernelci/kernelci-deploy/pull/18
GKE: https://github.com/kernelci/kernelci-deploy/pull/33

The idea here is to make it easier to manage things, both for people
doing deployment (since it makes things less manual) and for those
working with developing things (since they can see how production is
configured and propose changes without actually accessing it).  Since I
don't have any access to production I'm about at the limit of what I can
do with this right now, there's some finishing on the configurations
that should be done but that needs some configuration on the cloud side
(eg, for allocating a storage bucket for terraform to store state in)
and validation that what I've done does actually match what the current
system does.

Discussing this at the weekly meetings it's seemed like people were
broadly in favour of this approach but we need a plan for how we'd
actually deploy it - do people have any thoughts on this?  One
suggestion was that we should start deploying this in parallel with the
existing infrastructure and putting jobs through it, perhaps doing
something like putting the new pipeline jobs through it it.

There was also some talk of also deploying some of the other cloudish
bits (eg, a cloud mongo instance) like this, that does seem like a good
idea if we're going with this approach.

Thanks,
Mark

--ixjsnV45MK0vy+cf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmOGGIIACgkQJNaLcl1U
h9BiDQf/ajuamVMnlTPnUybpAMBxuT09fz+/T9WrcZCs90AWdmLZjpddH4CLYl5W
NKy8x+ORfnHksZkiLpbcMhKgPI6cHquuH1lLXsUuY5+koDw4npRs2qqNFSYm9UWL
L6asKuz9/ItdhVkm+ggVPKs3AbpKyncXD1pkmZ+CdVayG95+rYE7V+Qzs7qOkAkF
EQGE4pc0uYDvTlg/9N5VSIMHd5abr2iMxVuK1exMrZoefcTE31HLtYlImSH2OZp5
zBM1xn45dCRvGMMq6l1Eima4VltJTQn7JwDdjV4pYaV+dOm+8oiD20hGV+DcR4F0
/gSSyKlsCuvhTXi4/rs5y5jdMempvQ==
=xKzo
-----END PGP SIGNATURE-----

--ixjsnV45MK0vy+cf--
