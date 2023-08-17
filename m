Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 958E614F7B
	for <kernelci@lists.linux.dev>; Thu, 17 Aug 2023 17:39:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C89DC433C7;
	Thu, 17 Aug 2023 17:39:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692293965;
	bh=KMCXTEyW4HJ+6bxCyMzQ5srUb672mhdGd9vDlsSDYPc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nwKmoZsoruDqiYE0kuClCkNEJM4L7jG2SPv+wXfLLo04MovfxXc9kZMN/iGbNkT9m
	 xFiprSbyHDA3s3RGpnaa3/k330c4qvxftTKK8v4tI/LL9gw0uGGvSAY4QtMcvKUqgg
	 80N35ncOnm7eR6knzFNGAlOEytefh66GPZTMUSXbm62HGNDRwvJdhss7nNZ732cAtI
	 JX6d5bM8a/Z4rkGjy1wKXnkCbKpol2NCdginCUqmTKo4ub/tY9OmnpP5BePOTFnid6
	 jVC4HNARwepINEZdOuWHnnzmVtaoPkiDUHUqByAPrqFJ/279mvulF4AezF9T/UuQn7
	 Jo6jLKbfT/CKg==
Date: Thu, 17 Aug 2023 18:39:19 +0100
From: Mark Brown <broonie@kernel.org>
To: =?iso-8859-1?Q?N=EDcolas_F=2E_R=2E_A=2E?= Prado <nfraprado@collabora.com>
Cc: Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>,
	Shuah Khan <shuah@kernel.org>, cocci@inria.fr,
	Nicolas Palix <nicolas.palix@imag.fr>, kernelci@lists.linux.dev,
	Julia Lawall <Julia.Lawall@inria.fr>,
	Bjorn Andersson <andersson@kernel.org>, kernel@collabora.com,
	Guenter Roeck <groeck@chromium.org>, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [RFC PATCH 2/2] kselftest: Add Devicetree unprobed devices test
Message-ID: <c998b1ce-5515-4773-92e2-a88a0c7bd4ff@sirena.org.uk>
References: <20230810202413.1780286-1-nfraprado@collabora.com>
 <20230810202413.1780286-3-nfraprado@collabora.com>
 <ZNY9sBgzrEQVVQT+@finisterre.sirena.org.uk>
 <b4b1f56b-94c0-4849-a7fc-9228b4e40dc7@notapiano>
 <117448a6-671e-4f30-90c6-808a319caf32@sirena.org.uk>
 <439f66c9-8dc1-40d0-ae36-fb8beee5a6f1@notapiano>
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qUTT5oLWGHdNn3KB"
Content-Disposition: inline
In-Reply-To: <439f66c9-8dc1-40d0-ae36-fb8beee5a6f1@notapiano>
X-Cookie: Walk softly and carry a BFG-9000.


--qUTT5oLWGHdNn3KB
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 17, 2023 at 12:17:38PM -0400, N=EDcolas F. R. A. Prado wrote:
> On Thu, Aug 17, 2023 at 01:26:05PM +0100, Mark Brown wrote:

> > I'm not clear why KTAP would require C?

> When going through the documentation there was only mention of the C head=
ers for
> the kselftest framework which outputs using the KTAP format, so I thought=
 that
> was the only acceptable option.

> But in the meantime while looking through the other tests I saw you've re=
cently
> added ktap output to ftrace/ftracetest. The newly added test in
> net/mptcp/mptcp_lib.sh also has its own helpers for outputting in KTAP. T=
here
> are also a couple other cases of this in python.

> So I can definitely do the same for this test.

Right, KTAP is a format specification for what appears on stdout - how
that output is generated is immaterial.  It's just that most tests are
written in C so that's where the helpers are.

--qUTT5oLWGHdNn3KB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmTeW0YACgkQJNaLcl1U
h9C9Xwf9E4pANzcVsqYOUMPyTQMhx7gex1zIbfv5cwKKV46GxG4SdK6IgpHUsFvX
YPh3r8dmqP6ebpuPND1Eq2QMeaCF421dQ5IxPQXxf0Zo24D5wZ+TxQGAERuhkGMC
lXDZ+IdTbaLy+EsLD1jDtiRq6/qrjKyOO96+qsupBZXzbcjL9xje2GDnhjrLdZVs
Xv4d7ILUUZc73WtawHdgFImBB2ZnpL3OfiEDhQMy/NwnUa0Z3bGh5vqXGV4a1oqY
i8QMpVCx1uip9o/YOiEoEscZeF6to8VUr0cpuTggn5WII7tsZnkXm0HLB9rhC4ln
0kTrqFeeAkXvssHhsCn6hT2Z6W/nZg==
=gb9u
-----END PGP SIGNATURE-----

--qUTT5oLWGHdNn3KB--
