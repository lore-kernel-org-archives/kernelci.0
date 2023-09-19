Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 241D436AEF
	for <kernelci@lists.linux.dev>; Tue, 19 Sep 2023 16:12:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADAB1C433C7;
	Tue, 19 Sep 2023 16:12:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695139956;
	bh=YLpcVm78Py16S0WdBNE5BykIXMAE5xwPjgTigadSdEQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KBoYDDsmSxjyqrDcjQjD0PUJz66qCOA2iC0cQ7AR2HNXBQAUaPsVimVr/Bysnwu+S
	 vxex7OUvee0SD6VpvtOKIjw3MIA/Yrdqn1JKKrDZ177pUdjrfUiSgwShIomuPWXbZR
	 jpOCVBI8u9EbsMJXpLPcTnyUGDEpmA5ze6JrKmyAENtCWwjHWx3O+DMgqYvy6SNahd
	 HQQUnp6C4++5Vi43U1RU0TgFD+pEua66v/QhxwU/mBBj4nWL6WDcnNZlAp8XE4/WRq
	 IpKi5602L0QNJwkU01vZq0NbvX7ScdwRLNI+l1I0+BIHJOQUaNApPQD78qhGQn+/8E
	 2tTQDjDAkE/PA==
Date: Tue, 19 Sep 2023 17:12:32 +0100
From: Mark Brown <broonie@kernel.org>
To: Ricardo =?iso-8859-1?Q?Ca=F1uelo?= <ricardo.canuelo@collabora.com>
Cc: Guillaume Tucker <guillaume.tucker@collabora.com>,
	kernelci@lists.linux.dev
Subject: Re: Reduced build and test coverage
Message-ID: <6dd07972-3646-496f-add0-b7993acefd0c@sirena.org.uk>
References: <4918ba63-5d11-3b48-0591-0411684f69d3@collabora.com>
 <87h6nqdyny.fsf@collabora.com>
 <8840c525-4e80-48dd-a31f-40f2ca4ed03e@sirena.org.uk>
 <87ediudxzd.fsf@collabora.com>
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="IeUBpHAWsCNMYS/+"
Content-Disposition: inline
In-Reply-To: <87ediudxzd.fsf@collabora.com>
X-Cookie: You buttered your bread, now lie in it.


--IeUBpHAWsCNMYS/+
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 19, 2023 at 04:44:06PM +0200, Ricardo Ca=F1uelo wrote:
> On mar, sep 19 2023 at 15:31:31, Mark Brown <broonie@kernel.org> wrote:
> > If we're doing this -next would be very helpful too.

> Does it make sense to bisect -next, though? Considering that it's
> constantly rebased, so I don't think it has a coherent and "linear" log
> like mainline. That means that bisections aren't guaranteed to work on
> it. Is that right?

When bisecting -next you should generally bisect it against the mainline
it was based on.

--IeUBpHAWsCNMYS/+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmUJyG8ACgkQJNaLcl1U
h9CrhAf9G/EO+iyp4NxWbQQfLACqPGwoOC+ebOBSbfqHzC1toedwQ2D5pMgKhvmj
sNPknzD+elnXlOAzBcNPw8+eluMLNTZJCKV4HVAdPaYOq+Rcw/NciJqJgHRzN1Ku
XO8EKyriVloP/+6JCGjyW6Jr2R7xayBCK5FRvfsYJ5Qf8OygxHP9Qpa77sosB7Ff
O8LC9RSQW5xb1soYqZ4yUGV+giw2Bwdpuoazt6hzo24UQjO4uTMZ5efO4km2jQFn
lEWaeqB3yji7SgjcMrMuc1aFbPMPvpXAfvqJ1RX/z0CBbeh4mslVD31XiJCnbtZz
DRr+2Yt+DsJuWraYdZNMh66VSxob7A==
=pnO9
-----END PGP SIGNATURE-----

--IeUBpHAWsCNMYS/+--
