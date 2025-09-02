Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71A442E54B0
	for <kernelci@lists.linux.dev>; Tue,  2 Sep 2025 13:20:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756819234; cv=none; b=BYWIXSLGnxUF8nModb+uPJzT1RTwhjGAnXzVc+nYxx7V63nl8GQgDtHXKoaxDN7SXCU+HZL0LimQ+r393Ju+sSLGWrwOIEdj/K9+BJg+Hpz1t5oSNi7iDQNqzwSFfFxgPKjoGkaok7Wo1CXl7WkCdxIeEqbESU3KLjDtaKmba3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756819234; c=relaxed/simple;
	bh=LurZ2Z0QJMsBagtUrz3OybDhhi9ezuZFyczVpIUoI+Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c6YJXzBGu5FgAbFCm+y7/hb1x8UlPaaWOpR8/g/Nq9YfCoDxOFQaaZKFGjiabwW4EDpVMKDbH/wALZwNO5jsLi0iTnJgO4FPSWpVripzqnLUYblCBcLPqbT3U2QqhOWT8fr5AZusxSlegdBBEB35Z10dA96O0yeGi+a5rTwkVxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nis8c8B4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nis8c8B4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04AC4C4CEED;
	Tue,  2 Sep 2025 13:20:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756819234;
	bh=LurZ2Z0QJMsBagtUrz3OybDhhi9ezuZFyczVpIUoI+Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nis8c8B4TyJuN7R5noj6Glly7A4u+XBssd5YwZXSAwkgr6fAS+4pZoWSN28BGHFzB
	 esUkuA5DaVbMVbSaLp2ffHpb6gnF0f8JikNhYzhSPtqYxPFDZHc9axtnVrMRpGmv+6
	 VRx0Nzf8UhxEvvIOKnz7U/XN+5nDZ2LXTn/li4yTIrQ44VdeRonDaIXOornfOc2gnS
	 4wyWWCkHgGEG2S5ZcpDmKDvjEir061hdBa7XnaV60ZnKd/Y1KQT/+wxnho8JlaUy1U
	 qJszbryEXldP4m4773g2QdPQaB9ddF7M3REpAEF1SaI1F1mmjrjk5uvV9rzl6QDH30
	 yexLH7OGrwTTw==
Date: Tue, 2 Sep 2025 14:20:29 +0100
From: Mark Brown <broonie@kernel.org>
To: Gustavo Padovan <gus@collabora.com>
Cc: "kernelci lists.linux.dev" <kernelci@lists.linux.dev>,
	"chris.paterson2" <chris.paterson2@renesas.com>,
	"ben.copeland" <ben.copeland@linaro.org>, cfi <cfi@pengutronix.de>,
	sjoerd <sjoerd@collabora.com>, khilman <khilman@baylibre.com>,
	"f.pflug" <f.pflug@pengutronix.de>,
	=?utf-8?B?IlBhd2XFgiBXaWVjem9yZWsi?= <pawiecz@collabora.com>,
	Tim Orling <tim.orling@konsulko.com>
Subject: Re: KernelCI Labs Working Group
Message-ID: <3ccb39a7-2095-44a5-945a-d80848835215@sirena.org.uk>
References: <199077d9fe2.7b4205005094745.5898848305828715448@collabora.com>
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="wbGX4ULq2+DsYq7f"
Content-Disposition: inline
In-Reply-To: <199077d9fe2.7b4205005094745.5898848305828715448@collabora.com>
X-Cookie: Vote anarchist.


--wbGX4ULq2+DsYq7f
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 01, 2025 at 07:54:57PM -0300, Gustavo Padovan wrote:

> Based on the interest during the workshop, we=E2=80=99d need to cover the=
 West Coast timezone
> as well. So an initial proposal for these meetings is starting next week =
on Thursday,
> September 11 at 7:30am PDT/4:30pm CEST.

> We invite all interested community members, especially those running or m=
anaging
> hardware labs, to participate in this working group. Please reply to this=
 thread if
> you're interested in contributing or have specific use cases and requirem=
ents to discuss.

That should work for me.  I do have some intermittent conflicts but
should be fine more often than not.

--wbGX4ULq2+DsYq7f
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmi27xwACgkQJNaLcl1U
h9BwyQf8CA5WrrbxGpcZzm4kGj/d1J95+1QcZvfzZb7Ub6ClzUoJUwvieB29EXHM
RX98ue6TRVluQY0BXFGKorPFz+kKJOBKW6cgjm4nDoqEwFyS/+7CuNkbsDeKymhI
DF+g41berI2Aoxo469193onIP9342K7iBhAn20PTIDNR5nv/i7zM5qat8h68Hxtu
/T6UKTkzSBljLm2KTBG89xxi7+rmefASABSYjzXP9m9xPzzHEJ5lIYR3C74Ec8Cc
FfQyXh7AMKtGU7lm/baQxtWMx46rADU2RI8e6ScQkkXp/i7vP10d1MmN8U96Lo8M
o7DOq5cxjLDS71fjpwjaDcat+vlRHw==
=nMQF
-----END PGP SIGNATURE-----

--wbGX4ULq2+DsYq7f--
