Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 995E530FB5;
	Tue,  7 Nov 2023 14:36:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tscldE+N"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87E2EC433C7;
	Tue,  7 Nov 2023 14:36:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699367765;
	bh=Wo+OkR2SJcTjqFCSIGnmQqSy64cw3QrZuHtNre/B8bI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tscldE+NLcdAAiT/hy775GjoAKr9qz5Bu31hJqKNOw0pBBJGCTEAU4ZKRpFSh5/Fa
	 WfdtPQE4Ghpt9hguNoCBCtTgizgLOeg5e8u9TpSDxrXGiCTX/lXzhzBBvScOt+FwJ+
	 S73pX/e/42xjy3fAm6tBy7AYbreeF4SPI/H+EFxuw0ZfJ75kxFs/li8S8pNw7MVIzX
	 fgg5EbE6QWg/SlFTKOqMm8CUDokKrArJSDLKoO3o3xiHVbc7Pbx9JOQ+ekqWAqdccp
	 pQFWBrl1ZrIZ5CTOLggpLWvgnvKZcptbbUHV2enzuQ1hDz+1N14bsAE0C3UcLTdXZd
	 1TgCxjCH7IaAA==
Date: Tue, 7 Nov 2023 14:36:01 +0000
From: Mark Brown <broonie@kernel.org>
To: Rob Herring <robh+dt@kernel.org>
Cc: =?iso-8859-1?Q?N=EDcolas_F=2E_R=2E_A=2E?= Prado <nfraprado@collabora.com>,
	Naresh Kamboju <naresh.kamboju@linaro.org>,
	Aishwarya TCV <aishwarya.tcv@arm.com>, kernelci@lists.linux.dev,
	kernel@collabora.com, Guenter Roeck <groeck@chromium.org>,
	Bjorn Andersson <andersson@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	Frank Rowand <frowand.list@gmail.com>,
	Shuah Khan <shuah@kernel.org>
Subject: Re: [PATCH v3 3/3] kselftest: Add new test for detecting unprobed
 Devicetree devices
Message-ID: <ZUpLUd+Q0MyYC6io@finisterre.sirena.org.uk>
References: <20230828211424.2964562-1-nfraprado@collabora.com>
 <20230828211424.2964562-4-nfraprado@collabora.com>
 <e90cb52f-d55b-d3ba-3933-6cc7b43fcfbc@arm.com>
 <CA+G9fYsbq28w7m-sf6LhMscXHdPs0cGXU7kK6YzjKdUFKuQ+6A@mail.gmail.com>
 <e72e144a-c617-4a9e-adfb-e25ddabeb4c7@sirena.org.uk>
 <CAL_JsqL-3O6omPf4HcPFctgid+br04QW5p81qDx0CPMqh_eXTg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="FfS63bym1dSwnNAk"
Content-Disposition: inline
In-Reply-To: <CAL_JsqL-3O6omPf4HcPFctgid+br04QW5p81qDx0CPMqh_eXTg@mail.gmail.com>
X-Cookie: Slow day.  Practice crawling.


--FfS63bym1dSwnNAk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Nov 06, 2023 at 11:09:44AM -0600, Rob Herring wrote:

> A simple solution would be instead of passing the source tree root to
> dt-extract-compatibles, pass 'arch', 'drivers', and 'sound' instead.
> There shouldn't be compatibles anywhere else.

This does seem like a reasonable quick fix that avoids the issue for
now - nothing would stop someone implementing a more complete solution
later.

--FfS63bym1dSwnNAk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmVKS1EACgkQJNaLcl1U
h9D+Bgf9HspkikyOl/hR8HPz+Oo8/wKTHACheiwhnT4RkfFcAbXX+kDJBjHC3b8R
F/dsfrL9G/LEvf1MoPIqr7LxmrGDUeVz/oirAlIsoJoRYJPPTwKE6zwH9S2AVU9x
1GFd84WdvTRSHRvPvxFe/EnyxfbL4InoEiG0c3qiI2pXze3EkdW5X/JSZ1hhvUsX
kqMN/TltmRFQAbDrIklsnkpU17Fae9Mi6tNe1xtcOlRfGlJicuOwReFSkanW50nH
ki2kXTbaLboOHmHXi3lSmMj4tMpHCtgfi3pVNsgwhOR9k2yW4/MrEGtQ9dSnKcUP
V5hhqjVNMF3TOOPlbEuEbTTjZMpULw==
=ALf9
-----END PGP SIGNATURE-----

--FfS63bym1dSwnNAk--
