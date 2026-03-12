Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D82032861F
	for <kernelci@lists.linux.dev>; Thu, 12 Mar 2026 00:24:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773275041; cv=none; b=uFPFNu3j7CZW7FQDrkbfBw4eEnsYTuPFvIgUVd1rja1A4EM7On8+f9SBO41yzDkxYeIf7DHl7dkded9Woc1WOVUwg6nXYr8yJwk/SlQv2m1w73RLmve7qD++qsM7dbcQI2A423ht22B4/PMpUaZp6SVPt+sY76mipIKfw3rpyLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773275041; c=relaxed/simple;
	bh=sXTKKT8PiTDIT8bXeRFWURzMt8B0L4hTFAd81akDw9E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sAggp9n7451QVs7sA2wXjng8aKn4GA05p/zKW6tFUBOz2offIb/VHR6CNoiCKLXC+mP5SDTbd8Krj3nQiD9wnKP1zZx+Tju6qvLfPDKXRcBxcHqf1m11L/vSvWsRSVYYItdgxSTIgzCPyufsgxt/AgECytcT/cZ2hsKSJnBJu74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XInXPGAK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XInXPGAK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A61D1C4CEF7;
	Thu, 12 Mar 2026 00:24:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773275040;
	bh=sXTKKT8PiTDIT8bXeRFWURzMt8B0L4hTFAd81akDw9E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XInXPGAKyYSqXiRVgJx0HWH6X8YFCWw8ClE4H10MYGF3H1F6r+b2sof9W+5v6/aq+
	 02Q9pNObLmv8wZ2wqcbu/GXn9RkUiRGfzPWgRjgAPiOv+bZJw7kGaGyn1//x0Lq+df
	 a+UESxpUiKWE9V/8XLPIsvtrsZvROa7Kvgo0BT4YVdtnTjVGDHr8JOuoBp1OgvnwoX
	 W/MT15yjYEwndHnLzPg6DwlE32ENwWa2ZMqrfEdkn2pThIS90gQBHTG7uP9ikm4RcT
	 CCTvlhSslnWBguM2Y6KUnHIA+EhvagGdKRL4m4nf56/MzqpSm7s4T+027z26UDOIxj
	 3LWHfbll3HTlw==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id E611E1AC57EF; Thu, 12 Mar 2026 00:23:57 +0000 (GMT)
Date: Thu, 12 Mar 2026 00:23:57 +0000
From: Mark Brown <broonie@kernel.org>
To: Guillaume Tucker <gtucker@gtucker.io>
Cc: Ben Copeland <ben.copeland@linaro.org>,
	"kernelci lists.linux.dev" <kernelci@lists.linux.dev>
Subject: Re: Meeting proposal for KernelCI Bisection
Message-ID: <abIHnXct64ninKSh@sirena.co.uk>
References: <CAL0q8a67TOQVyDMpdFdgqJmyC9snDoTJaG8Fhf2OqKS1wc=S8g@mail.gmail.com>
 <dc1c30c3-823d-4feb-b381-82260f0db6f4@gtucker.io>
 <060dfaa0-4686-48da-8995-b03823b6d97d@gtucker.io>
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="sRUg/N4PsNSAFS4u"
Content-Disposition: inline
In-Reply-To: <060dfaa0-4686-48da-8995-b03823b6d97d@gtucker.io>
X-Cookie: Identify your visitor.


--sRUg/N4PsNSAFS4u
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Mar 11, 2026 at 10:01:08PM +0100, Guillaume Tucker wrote:

> Stage 1: the basics
> -------------------

> The first step is to implement the same kind of bisection as was
> initially done in Jenkins but this time with Maestro:

> * only for LAVA test regressions
> * triggered once all the results for a particular revision are in
> * removing duplicates with simple criteria
> * optimising builder usage while waiting for runtime test results

> The pipeline logic boils down to this:

> 1. look for base 'good' commit with reference branch (i.e. mainline)
> 2. check bad / good commits
> 3. iterate with git bisect
> 4. check found commit and revert in place to check it fixes the issue
> 5. send email report in reply to the original patch thread
>    (or alternatively build a list of recipients from the commit)

> It would be wise to send reports to a fixed audience initially for
> moderation until it's deemed good enough for automated replies.

I think there's a bunch of stuff we can do a lot better here than the v1
stuff did - the big one is sharing the builds and test runs between
multiple bisections.  Especially with the builds it's relatively common
to be able to share at least the first step or two of a set of
bisections (eg, if two tests fail on the same build we can reuse the
build), and it's not uncommon for multiple tests in the same test job
fail at once with the same or closely related causes.  You can get
something a whole lot more responsive that's still very simple in
implementation.

Doing builds and tests as Maestro jobs probably gets us a lot of the way
there, what Arisu has implemented already in kci-dev but rearranged a
bit with more of a server focus (eg, driving multiple bisects in
parallel).

> Stage 2: expanded coverage
> --------------------------

> * add primitive support for metrics-based results e.g. thresholds

BTW throwing https://otava.apache.org/ out there in case people haven't
seen it.  More relevantly there's also the fastpath bisection stuff.

> Stage 3: advanced features
> --------------------------

> Using 'git bisect' has its own limitations.  It's great during
> development but automated systems have different use cases.  A more

There's also stuff like mining history and throwing test results that we
already have in the range at the bisect (eg, if we've tested commits on
a different branch or as part of another bisect), not particularly smart
in terms of the bisect algorithms or anything but making use of the
data set that KernelCI is building up to try to improve their performance.

Another idea that's getting more into trying to be actually clever would
be looking at the builds we've already got and testing those if they're
somehow close enough to what we might have otherwise chosen rather than
spending time doing another build.

> their tree (e.g. -rc2 tag).  Semi-automated bisections is also
> something to explore, with a command line that 'git bisect' can run
> on each iteration and the ability to trigger fully automated ones
> manually.

There's the bisect stuff Arisu did in kci-dev that I mentioned for the
first bit.

> So this is a bit of a brainstom or braindump exercise without
> actually diving into anything in much detail.  It'll be interesting
> to see how this combines with others' experience of automated
> bisections in various environments.  Hope this helps!

Yeah, likewise.

--sRUg/N4PsNSAFS4u
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmyB5oACgkQJNaLcl1U
h9BO6wf8DIjFM2QWgE9IXkquY5//VMfsTZq+A4L/6bazmIt8toOatT8lBSGK60QX
kZPFWNVM8OtLfWLC5YOTbVT+sgSQhO3Sn5HF+Lxb5Y0Jz9vr4ucar8sOTKmiOBcs
qwmjpan5KeJKMXCU/q6myVDnMnL3a7r7TroLXLAp5ijMVToEgA1uFyRZ0yRKyTQD
fPOl4LgjA7phoeUe3EMlFm0pyFWJ1s3Rml2nPdyHB1yhXGLfkZHhBExCDEkhC1T0
9+0FASYFRwfclAd5N2WCuore9hNE4W2u5IiJsgxrBPAqZMk7ei8MCrr+Zy8uv6kN
3tvgRwN1hIzk5oitDS987RMQCOHrhw==
=Xxv5
-----END PGP SIGNATURE-----

--sRUg/N4PsNSAFS4u--
