Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 210232115
	for <kernelci@lists.linux.dev>; Thu, 17 Aug 2023 12:26:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBCD7C433C8;
	Thu, 17 Aug 2023 12:26:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692275171;
	bh=iFjwGysYvS9TYcoAfyXp1ESubsE34OY9xRbs/m27bGs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Rhzafjy+laiM2b1JZH/e0x4/aLebL2bnC2ifqd2UUIvPhTPjy42bOIRkPIcnKwqhD
	 1gdmm4HoMFq53xbYACwKkuN93EFqtHQmL5LHDA8sbB9iLoGjx0twxw4hVhzbn32slP
	 51YNS7ulyyEWLGp3XCES8LbudciVhjImt/4c1GdgCMSxZN1rkqLimwLMZEGXxLnfl+
	 g8ZcGB/ptyOydp8xJdT0FOAEuxWcHdYFF/reoSq6rfR4ViGO3mNmzz1mnvumcEedhm
	 ZW6chQp9kS5mU91KEH8kpMZHLP3VsflPb9HUYuGCJ0p0BOLEjdgf7B7XOpA7x505Fo
	 Us3YjK0qhIIVw==
Date: Thu, 17 Aug 2023 13:26:05 +0100
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
Message-ID: <117448a6-671e-4f30-90c6-808a319caf32@sirena.org.uk>
References: <20230810202413.1780286-1-nfraprado@collabora.com>
 <20230810202413.1780286-3-nfraprado@collabora.com>
 <ZNY9sBgzrEQVVQT+@finisterre.sirena.org.uk>
 <b4b1f56b-94c0-4849-a7fc-9228b4e40dc7@notapiano>
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="KzMo14n8WZa6AeHL"
Content-Disposition: inline
In-Reply-To: <b4b1f56b-94c0-4849-a7fc-9228b4e40dc7@notapiano>
X-Cookie: Walk softly and carry a BFG-9000.


--KzMo14n8WZa6AeHL
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 11, 2023 at 10:16:52AM -0400, N=EDcolas F. R. A. Prado wrote:
> On Fri, Aug 11, 2023 at 02:54:56PM +0100, Mark Brown wrote:

> > This doesn't appear to produce KTAP output which is going to make it
> > less useful for generic kselftest runners.

> Right, I'm going to need to rewrite it in C for that, but since I already=
 had
> the shell script done, I decided to send it as is for the RFC, since I wa=
nted to
> get feedback on the general approach more than anything.

I'm not clear why KTAP would require C?

--KzMo14n8WZa6AeHL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmTeEd0ACgkQJNaLcl1U
h9Cj5Af9HvBEeATneL4L4KyaTje+eZTmz6+nPBWc0RUgYHS6rzYEV/ysoMSUEsQ9
lmmBLxqkxBpTxeFCDpcXLKrul51oXqJY6fgcBAmoOgJ2rVilMDtFyENtYxNDNBc2
VU7LDxtuHzhygehFFypWS3K/790bbVnQcTlIaZsjqOAHTUjsMwKiWYvH7BosmI5D
NIsPNtaUtpuR/iDZRUQMRW8GLO97nM0W3ixvDeFh3smrV7BAmyzwZV7RN9v/Oj7d
g8D6/vSOQNp3S3ZIe30M4XS3NMS1HpSgoAaQvWgyBQnVb/Xc+2oLiRzn6AAYqWUL
kFEd0jI7Xpyk+f4GoHipOywNPTfUWw==
=n2ds
-----END PGP SIGNATURE-----

--KzMo14n8WZa6AeHL--
