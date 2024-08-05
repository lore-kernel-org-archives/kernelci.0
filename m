Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F35A5131BDF
	for <kernelci@lists.linux.dev>; Mon,  5 Aug 2024 16:32:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722875574; cv=none; b=fvz3CW4Uf4rSRyYKT9dfVI0UtwMPz9B86leJSe/JV/lkvgB8twS9E/ONLJtUtQrf4N/y5dqCzPNKYZHUQtgsNTGFjxH6KHsyfbapFt58cKCk4yOLAS63cKCvDEgzF1mC5fKvhCNrSv8iggpG6DDtV9myuskgKtESaXQky5/5CvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722875574; c=relaxed/simple;
	bh=fKUiWoGA+LZGbTSRIohkKJQ5jKAOuV3ceHNSbpEuJh4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZSulKiIuL1OSzXXtstSQPYausKsvtVSEN+yREimThSLkRziXzvu3vNCRGyKpz3HjJlKSd+KavRrp/ljAAhEpOOnKy7sApSclbnrC7pQZ4UXgtBypHVe8wUO8jyGwTvqZ+gFJFMD9JgR4F/Xye7dfQF7gWG2Eii/2H1FxuRPfjes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sUoc/HHU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sUoc/HHU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A1E0C32782;
	Mon,  5 Aug 2024 16:32:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722875573;
	bh=fKUiWoGA+LZGbTSRIohkKJQ5jKAOuV3ceHNSbpEuJh4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sUoc/HHUJtPJ6wWJap2c2BFW1DsW29ymXrU6uWsdajrMdeL/M3uIwmeC8gVO07TOF
	 oeN7XqtxvVMdz5Pmk/1WaNxO74L0dd0Ng5VeeovVlHaBr8vUsueuwhTENwyYTd5hXN
	 MaSY0/zHo/SP91pfBtce54psR05OF6Pjny+OjSY7GOhNdn6wiknsdhDr2myOJdYYvb
	 rmnK7hy3ulJZAMRPi1m86iT/7l2LGFkWDU1aycPAR5E5K2f5at/NE0NDeOy+OGRs1s
	 78gAJT5wBU1avRwciBClFplAp5g5idHBl4iACqALuwNhow36XaWtEb7xwmahw+8MEg
	 AvI5+eKG9SthA==
Date: Mon, 5 Aug 2024 17:32:46 +0100
From: Mark Brown <broonie@kernel.org>
To: Nikolai Kondrashov <spbnick@gmail.com>
Cc: syzkaller <syzkaller@googlegroups.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Vishal Bhoj <vishal.bhoj@linaro.org>,
	Alice Ferrazzi <alicef@gentoo.org>,
	automated-testing@lists.yoctoproject.org,
	Cristian Marussi <cristian.marussi@arm.com>,
	Tim Bird <Tim.Bird@sony.com>,
	Johnson George <Johnson.George@microsoft.com>,
	Veronika Kabatova <vkabatov@redhat.com>,
	Guillaume Tucker <guillaume.tucker@collabora.com>,
	"kernelci@lists.linux.dev" <kernelci@lists.linux.dev>,
	Don Zickus <dzickus@redhat.com>, Philip Li <philip.li@intel.com>,
	Denys Fedoryshchenko <denys.f@collabora.com>,
	Michael Hofmann <mhofmann@redhat.com>,
	Tales da Aparecida <tdaapare@redhat.com>,
	Aditya Nagesh <adityanagesh@microsoft.com>,
	Jeny Dhruvit Sheth <jeny.sadadia@collabora.com>,
	Sachin Sant <sachinp@linux.ibm.com>,
	"Hambardzumyan, Minas" <minas@ti.com>
Subject: Re: KCIDB: Support non-binary test outputs
Message-ID: <8c9b63b0-453d-4f2c-8777-66871ad7923d@sirena.org.uk>
References: <5188d6fe-bd01-402b-a6e6-0fe57ef4d336@gmail.com>
 <bf0befaa-e23e-43f0-996b-d095b7390122@gmail.com>
 <41f4f4df-7587-42c4-b7c4-9e69bbf7d74d@sirena.org.uk>
 <e0d90418-5de7-41ed-8aae-872a717c10dd@gmail.com>
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="U/0ipHza8F+m2eCd"
Content-Disposition: inline
In-Reply-To: <e0d90418-5de7-41ed-8aae-872a717c10dd@gmail.com>
X-Cookie: Goodbye, cool world.


--U/0ipHza8F+m2eCd
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 05, 2024 at 05:26:52PM +0300, Nikolai Kondrashov wrote:
> On 8/5/24 3:33 PM, Mark Brown wrote:
> > On Mon, Aug 05, 2024 at 02:28:24PM +0300, Nikolai Kondrashov wrote:

> > Might it be useful to directly specify units for use with "number" to
> > help with normalising data between different CI systems or hardware -

> This is a totally valid concern. We could add a "units" field, e.g. beside
> "value". However, I'm not sure how we could use it. Sure, we can put them=
 next
> to the value in the dashboard, which would look nice, but then we can als=
o put
> them into the "comment", as my examples do, and I'm not sure if we would =
be
> able to do much with them in the database.

> Even if we have the exponent separate, I'm not sure we can make use of it
> (converting units on the fly won't work well with indices). I mean, we can
> (and should) compare only values with the same unit, but which one, if we=
 have
> multiple? Both separately?

> On the one hand I like having the explicit unit, on the other hand we can=
 get
> a similar result with simply using different test names for different uni=
ts,
> and have them specified in the comments, for humans =F0=9F=A4=94

Just thinking out loud here but perhaps what we want is something in the
ingestion path which either validates a schema that says "Test X must
have unit Y" or normalises the units on the way in.  I think my concern
is more on the write side than on the read side (modulo the display
stuff), or rather making sure that what's available to the read side can
be joined up.

--U/0ipHza8F+m2eCd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmaw/q0ACgkQJNaLcl1U
h9BWYgf/WI1z2CNgPkDp9FMY1E6A0TlUfdHPklt3dJxwN44pBsw/52Y0k+O5a+Zk
unWoO41VXmuXpds4T3GiXq6Sq+GNo+GYBUaJfuxqIy4ekUbFiBb2GZdQMd5yMhVh
QyACz/gGDg6bdEU0Qo/ikad80KYPDo0y2njpDwaWBFMQ6Iio/Wdbrs/MgeLloa8H
GfKoU9siHqzBlNNPl7m29MZY1plCEOInrBkmSMKkrdwZOui6f7V+UImIxX0wrElK
ieiIOh9NCEK9gV2/ygG3IpyIrxSfyrPbw+iocolT81StWIkDzjHzSIU2Q7fFIb24
DghB/h8w/jzR29jYPODNBAIWPQb0Qg==
=Ftzr
-----END PGP SIGNATURE-----

--U/0ipHza8F+m2eCd--
