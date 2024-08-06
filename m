Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4836A47F4D
	for <kernelci@lists.linux.dev>; Tue,  6 Aug 2024 19:21:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722972061; cv=none; b=o7O5+ZzucbtqIdrJzYGH/XH3QaiEynFxGDJx/yYuvp8jCDUG4Ff+65LR8q4iRgK/OTsrhN9gJQVNQOvykURwwLWESvkQn1i0uNfYyRObMSaCEc+XJGvkaYwjKyaoF4vmFAAlYXFMNyZ4Gmg/pOrCANXe98HFG9UoidKKgIhL4L8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722972061; c=relaxed/simple;
	bh=JgnTVYqdrAxRK6aVj1M/xXoDPCxT15UFecbi7SNrKpM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GYNxX3XT671cVv4iLbEDd9rindsWoQX1v0zIjXkQCky5V+YOw9T0mZyDiCMW0YKQxATA2rdvHXvhbGNOCfbyz/8zqecK29DeHZXI0bh47CFpLfcKqbRQwUQABJUb6aRkeUcjxiEO9iT0N7IoW/d1o9mk7Wb++twDRYAE8qRY1xk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LeDjnm7f; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LeDjnm7f"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C604C32786;
	Tue,  6 Aug 2024 19:20:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722972061;
	bh=JgnTVYqdrAxRK6aVj1M/xXoDPCxT15UFecbi7SNrKpM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LeDjnm7fdG/7d9RtUa+avyAoGGC3eWT0T47c8FV8NSiYCio0nch+mwpUiVfbycHhq
	 ZAHQTN8dG3PME1FoAuQRhUY1iN6fJvvSOYiVWwZwZjXx4AoHJ5h0gmBWUWAd/YVzNy
	 Gofx8sM0BxEId6JJFkaE+Ulamj8Bm4Psk/BzQpHzROgMMa4QzqqVGvaNGDLd1T8i53
	 XUtjiMuS29s9iUXlFv7jZV/tKV/SOMToUt4sVqVbe23mciygWgcIZYvgPU/4zQDdHy
	 edkAoBoIfBbc4dy7T5OOawz2l+9jkV/yDq1jK7EjraTi7ImV73zu4Y2pHhVFQUVoOZ
	 uyp2xHb4HkFYQ==
Date: Tue, 6 Aug 2024 20:20:53 +0100
From: Mark Brown <broonie@kernel.org>
To: Nikolai Kondrashov <Nikolai.Kondrashov@redhat.com>
Cc: Nikolai Kondrashov <spbnick@gmail.com>,
	syzkaller <syzkaller@googlegroups.com>,
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
Message-ID: <7aebe4a6-fdea-4774-83bc-b293012db052@sirena.org.uk>
References: <5188d6fe-bd01-402b-a6e6-0fe57ef4d336@gmail.com>
 <bf0befaa-e23e-43f0-996b-d095b7390122@gmail.com>
 <41f4f4df-7587-42c4-b7c4-9e69bbf7d74d@sirena.org.uk>
 <e0d90418-5de7-41ed-8aae-872a717c10dd@gmail.com>
 <8c9b63b0-453d-4f2c-8777-66871ad7923d@sirena.org.uk>
 <813ff1ba-7d87-4afd-9852-c7ed598869c8@redhat.com>
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="drIZcWEymJow3mF9"
Content-Disposition: inline
In-Reply-To: <813ff1ba-7d87-4afd-9852-c7ed598869c8@redhat.com>
X-Cookie: One picture is worth 128K words.


--drIZcWEymJow3mF9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Aug 06, 2024 at 08:03:00PM +0300, Nikolai Kondrashov wrote:

> In that light, I think validation is the right way here. And validating
> submitter-provided units could be the right way. This is actually similar to
> the situation with test "paths". Currently we're accepting everything, but our
> target is to tighten that down to help correlation. Perhaps by sending
> (aggregated) warnings about unknown test paths to submitters.

TBH as a submitter getting specific stuff back immediately (or at least
the option for it) is really helpful.

> This looser approach allows us to admit new data to the database faster, as it
> doesn't need to undergo cataloguing first. We certainly don't want to spend
> time arbitrating *every* test name or a measurement unit at this point, and we
> don't want to slow down adoption from CI systems, and introduction of new
> tests. But I think letting them know about deviations could work. After all,
> it's in the CI system interest to comply, as that improves result quality, and
> raises the chance of reaching maintainers, which they're here for.

Perhaps per test schemas of some kind (not sure how exactly you'd go
about doing it) could help here, if the test is unknown then just let it
in but if it's a test we know about and we've defined the units for then
enforce those units?  That way there's the looser stuff and reporting
that shows what we could work on standardising, and things that have
been standardised are hopefully going to be more joined up?

> However, I would leave it to the submitter to observe the correct exponent
> (e.g. KB vs. MB vs. GB). We can perhaps standardize on units *without* the
> metric prefix, and rely on either floating-point exponent, or larger integer
> representations (like 8-byte bigints in PostgreSQL, JSON integers have no size
> themselves) to handle the required ranges. This way the dashboard would be
> able to display the units, *and* apply the prefix as necessary, automatically.
> Or perhaps specify the prefix (or exponent) separately from the unit, so the
> usual range would fit, but the dashboard could still scale the numbers on
> display. OTOH, indices would be no use for separate value/exponent
> representation.

Putting the exponent in as a number does seem like it'd be much more
helpful for machine processing.

> And the final question we need to consider is how many people would actually
> bother finding out what the units exactly are in their tests, and specifying
> them?

I suspect there's going to be a fair amount of stuff where there's a
fairly clear specific unit for one reason or other that's commonly used
when talking about the test (eg, things like I/O benchmarks, run times,
or temperatures) so it'll be immediately obvious and also a bunch of
things where the number is just a number for the benchmark and nobody
cares about whatever the units actually are anyway.

--drIZcWEymJow3mF9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmayd5QACgkQJNaLcl1U
h9B+kQf/YruqJnaYcX/+F9OXC1UQVaOcmK+fOwBLzTu7v1morU9dUC37OCjbNWJ7
3rZpxQlpBdfscF0fqdLUxbuHKvdCXVac83Bqds5Li/0dpgq3mlY4ojmbedCobeQi
hAl78mqcI1CuIGFt8RRpw0Fjaaj5WLelRnoxhdQt0EBVkdqWRN7R4nKP2ju9WaBC
Pxe2sMsT+7kR4mRnI0q0idTVmPp1j8P1wXUrUOc0uzqmkGLC+daSjABa/qMWLGw+
OJHquasfWMNFLZRd+E+lwdKGPUOUn4PQeyIegu5HGTdd0AfEXUSK4u9R4RUWa7T1
vfvTTEaQmQRVxVgvC5ALgBwJOS8U+Q==
=FzD1
-----END PGP SIGNATURE-----

--drIZcWEymJow3mF9--
