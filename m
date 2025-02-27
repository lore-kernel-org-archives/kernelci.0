Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76A07270054
	for <kernelci@lists.linux.dev>; Thu, 27 Feb 2025 19:22:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740684127; cv=none; b=ovU/vT5oY5ksgki0ckKZ7YBzx7SG2m9inhLJIumVHOCpncuRNeLSkH9vd7EX3MRmEcPHeaF18NS6MexaaPma2Tjh0vfnepPaKIXRnD4GUgEnJg+qTFeIO+k2BTeAoSyv8udTD6jAr7PMRcWQqTyrmqK17DHypFxaqr4rJaQpJpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740684127; c=relaxed/simple;
	bh=px1KEIwgIVssOLJCQZ0qb47iFcFPus9cfwffUoFWoQo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FxonBxJr500G/RlFVocqEj77httidfK1FnWxu6mTFQNoNJyWQa49FWvwuQvI5QqT0AFdmnno1lc4v/JZjmXg+D6Vy9f76IsLgOJ+7vDx6ouy6zxiebyHkpsO4sLX5RIU7zl94ONzKeRdrTStWGhtvBWP4UGLUckw+8kpR1QTJlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B6lCeFSq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B6lCeFSq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95E9FC4CEDD;
	Thu, 27 Feb 2025 19:22:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740684127;
	bh=px1KEIwgIVssOLJCQZ0qb47iFcFPus9cfwffUoFWoQo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=B6lCeFSqCARktZrboqWsPcHJ6TCBpispWwg7kwSR/oFITszMtL9Lmco2UUiS0ELK2
	 tDEbpOfv78xOMJofaJXYgaP/8dF6sNJfDW8E/OnVyby/vtstxpCa2BeHWUqTE3zYH8
	 a0ODc6jJOCX8PnMN3RfQsAld8Fo3pW1HPrll3ip71VjYhUHOnfl73qNMlzQRqieMdu
	 lhxJHG044N9Gct1sM8hscEV6X5jn7gCktFkfLKq2KzqhjLvoqnf2QSXLsYMduiLtOY
	 AElOIg9UTx+pSuGM0I/89CT5URXquY0wNl6xIrsE43tJqzoKW7I5WOHGSmZBvHLE6N
	 RU8fk4VcIwPnQ==
Date: Thu, 27 Feb 2025 19:21:59 +0000
From: Mark Brown <broonie@kernel.org>
To: Nikolai Kondrashov <spbnick@gmail.com>
Cc: syzkaller <syzkaller@googlegroups.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Vishal Bhoj <vishal.bhoj@linaro.org>,
	Alice Ferrazzi <alicef@gentoo.org>,
	automated-testing@lists.yoctoproject.org,
	Cristian Marussi <cristian.marussi@arm.com>,
	Johnson George <Johnson.George@microsoft.com>,
	"kernelci@lists.linux.dev" <kernelci@lists.linux.dev>,
	Philip Li <philip.li@intel.com>,
	Denys Fedoryshchenko <denys.f@collabora.com>,
	Tales da Aparecida <tdaapare@redhat.com>,
	Aditya Nagesh <adityanagesh@microsoft.com>,
	Sachin Sant <sachinp@linux.ibm.com>,
	Benjamin Copeland <Benjamin.Copeland@linaro.org>,
	Manoj Kumar <ManojKumar08@arm.com>,
	Michael Hofmann <mhofmann@redhat.com>,
	marcelo.santos@profusion.mobi, kernelci-webdashboard@groups.io
Subject: Re: KCIDB: v5.0 - backwards-incompatible changes
Message-ID: <f1bc61e9-aa32-46d6-a826-f2457217771b@sirena.org.uk>
References: <87b2306a-4110-4032-956b-d0a6db8e3aca@gmail.com>
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="fc2KzBnTP+gVdTSK"
Content-Disposition: inline
In-Reply-To: <87b2306a-4110-4032-956b-d0a6db8e3aca@gmail.com>
X-Cookie: Swim at your own risk.


--fc2KzBnTP+gVdTSK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 27, 2025 at 08:32:15PM +0200, Nikolai Kondrashov wrote:
> Hello again, everyone (potentially) involved with sending data to KCIDB,
>=20
> We've accumulated a bunch of schema change needs, which would break backw=
ards
> compatibility, and so it's time for another major update: v5.0.
>=20
> First, here's the kcidb-io PR: https://github.com/kernelci/kcidb-io/pull/=
95
>=20
> This will be followed by a DB/ORM update, once we agree on something. I'l=
l go
> over each proposed change below, linking to corresponding commits in the =
PR so
> far. Please review and respond if you have any objections, comments or
> requests (here, or in the PR).
>=20
> I'll merge this next Friday, March 7, if there are no objections by that =
time.

I don't see any problems for me here.

--fc2KzBnTP+gVdTSK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmfAu1YACgkQJNaLcl1U
h9BPzAf/cYUVD6rAV5ZUY7I9YflX6FaCUIKyc8bGHz8n1sS8xZVWmcoJ01rPV+TK
fj2zOusEjIf88Ah95hl33be8lcLr9VX2sWpBEXnbD+OMdn3ftQ/irkGxe0hGl6Fp
VaGWnsYjWDxVsjdD9whOy6OWKIhB/ICVPwMnzGoHefZhZGPtGCFP3SSbBZcarWlX
BE1iN2Nfk2bhbfBsibDZTlUuq1xnK5eGzAj3EVH/gSZm9bBUIuf3VGHW2u+ZwPU+
ompBJZoDH/xE2qN7++NdC+BlLR6MCvRpaj0NxaO2KRvEsDZHQa98OvVL7i8gJXgv
YhJbOcEW/RdWTe1lODaBHxgjtah1mg==
=4zqA
-----END PGP SIGNATURE-----

--fc2KzBnTP+gVdTSK--
