Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D09143FB0A
	for <kernelci@lists.linux.dev>; Tue, 19 Sep 2023 14:31:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76DEDC433C8;
	Tue, 19 Sep 2023 14:31:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695133895;
	bh=+jvZHjZmn/DuyRFCIgxgFSXQiPb4uV5xTi8NXlwpr9A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BMtaA7AIfMEBb9xgDr8x02pjArI8Y3bI06t0XIyLaCai54uAg94rlz8fuWV1cKBDj
	 jUhwkj4JndeqPde/kGZmrTXEHbgdSBO98aeNIbjEZJZ/iYWz+sOiJBwZrXe164xmiJ
	 ZEaQ3i5raTUPsHtbIyPMKlxa2tkqMmTXVA7ciicIa8I6cpHP/Ef5nElncJzl60OY2E
	 B4wfg576pddzd88gQCtu5TJAVwGinHUIZwU5NbVNZVM7Y1R+M2P5WGVnBII0QP8H5Q
	 Cq/qVyandzcJlygS4MiR+nhmXhEcrCZFrSEZUaZ5xGZ3EfeBJOxG9YzxTdYfMvXe0/
	 JxNNhM0LfQK5A==
Date: Tue, 19 Sep 2023 15:31:31 +0100
From: Mark Brown <broonie@kernel.org>
To: Ricardo =?iso-8859-1?Q?Ca=F1uelo?= <ricardo.canuelo@collabora.com>
Cc: Guillaume Tucker <guillaume.tucker@collabora.com>,
	kernelci@lists.linux.dev
Subject: Re: Reduced build and test coverage
Message-ID: <8840c525-4e80-48dd-a31f-40f2ca4ed03e@sirena.org.uk>
References: <4918ba63-5d11-3b48-0591-0411684f69d3@collabora.com>
 <87h6nqdyny.fsf@collabora.com>
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="pW0xVFCljtaObuYx"
Content-Disposition: inline
In-Reply-To: <87h6nqdyny.fsf@collabora.com>
X-Cookie: You buttered your bread, now lie in it.


--pW0xVFCljtaObuYx
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 19, 2023 at 04:29:21PM +0200, Ricardo Ca=F1uelo wrote:
> Hi Guillaume,
>=20
> Would it be possible to have the bisector running again? The bisector
> results are the main driving point when reporting regressions found by
> KernelCI, and without them the task of investigating regressions is
> rather impractical and time consuming. Even running it at a reduced
> capacity is much better than not having it at all.
>=20
> The branches we'd be interested in are (in order of importance):
> - mainline/master (the bare minimum)
> - stable-rc/queue/6.1
> - stable-rc/queue/5.15
> - stable-rc/queue/5.4
> - stable-rc/queue/4.19

If we're doing this -next would be very helpful too.

--pW0xVFCljtaObuYx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmUJsMIACgkQJNaLcl1U
h9C6dQf/aq/WlBJqVUo9kmH/AU6kCApu9jbVSFlvTIrSJsroKA8Jgh8AZX0fuk2K
fWNy1SbKWlkos8OhygKrFxqV+9C28C1ubn8DS7g4DYH43mXRdVXRXvG60RL5W5pb
DdGqUCkyz76Xs1JjKu+btZpoZqjlLob6QR0H3TOCRIrqmH5KwXzqGMlHeYZjPRSy
vtR/ymHKVT3uef8GhhYRD+sYp+oM3ZXx80ETtnfCoBFXYG9VdvhikhDWK4rrIB5i
XzsctrNeyBVerHaXi/wndAi/bdU+gXJdjxEo4g/IDWVxSr8Dk9JiNtD3Y9Yukl74
BQBWCoGfSCX/GaonJYp+4v+G/Ln0qw==
=jdo/
-----END PGP SIGNATURE-----

--pW0xVFCljtaObuYx--
