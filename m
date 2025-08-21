Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90C04346A04
	for <kernelci@lists.linux.dev>; Thu, 21 Aug 2025 19:10:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755803407; cv=none; b=BxCc1lagxkE4ZxDKpuWxarygJihyW9E2D2JlMOiOBWJBHyJ0T4YjNrOT6rMHAIA+WQT+JjyKaGhUtTiefJI+W4ssTBEn+CAbqIc0LTxJneRZsOWiHw1bylNe2sGwMfROMT/EQF0rxMrq1kFVM4gUWWQ+ZclvAYky53EWLH6NELM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755803407; c=relaxed/simple;
	bh=AYwYLAJtNaHihhTjcd/RJ4DN9Yn/T2fq4pJe6vE78wU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fv/DBZRrTKf9HsCEsX9sn495EIqFi05r+dS9UGrELCdwDgNtMq8ufUCmzJOWpB5+HN+vY0OUSy/ibCh9NOI+D05aYTlohUxkmIEqWAY0Db29XnlBoN9wUUpDUXo8cHlVO5+As1C8ekP+lhS60BZfllZzON2qpMdFaxsCi2e/9z4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dRHxH0vu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dRHxH0vu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A35AC4CEEB;
	Thu, 21 Aug 2025 19:10:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755803407;
	bh=AYwYLAJtNaHihhTjcd/RJ4DN9Yn/T2fq4pJe6vE78wU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dRHxH0vuIWBRxtKkQF8YxlKR1xMEKFPSSAw4Up8Jff78sQC5e6r5fJ2xwqa6YlXxf
	 VPSgRjBpAOp+OdsiP1RTKHBha12wqn6FhI+xg3XQE4tt0lesiawB5fZHdNQhGpzIe2
	 e1hInuvngFWcl7AjLgj0q3JyMt4pEiWMWwLgaA959c1XvcvpRI3rznDJMX8nOWKhv4
	 m56KvtFJe4yVc5kXlQh/fYx/arysDxZoj0a14UERACjqAnbChz4FIyUoJ4NH05FNRy
	 jMlFSloarYaIWY7JQdP7WzxbfSJ94BVcO4zHsNfsTDcDfaQAsyQQ3m9MqDFuiCcCZf
	 3reNcs++xZ9gA==
Date: Thu, 21 Aug 2025 20:10:03 +0100
From: Mark Brown <broonie@kernel.org>
To: Gustavo Padovan <gus@collabora.com>
Cc: "kernelci lists.linux.dev" <kernelci@lists.linux.dev>,
	Automated Testing <automated-testing@lists.yoctoproject.org>,
	KernelCI Members <kernelci-members@groups.io>,
	kernelci-hw-vendors <kernelci-hw-vendors@groups.io>
Subject: Re: KernelCI Workshop in Amsterdam on Aug 28th
Message-ID: <7ece4a22-bdfb-495e-9c75-9860882f78cc@sirena.org.uk>
References: <19809426904.3c4822be1251531.2628638964882412232@collabora.com>
 <1987a1851a3.360c6270521972.8904361685319295839@collabora.com>
 <198cdb05900.390510884659603.8671527595926972481@collabora.com>
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="INhvEri5pZkHovMq"
Content-Disposition: inline
In-Reply-To: <198cdb05900.390510884659603.8671527595926972481@collabora.com>
X-Cookie: Warp 7 -- It's a law we can live with.


--INhvEri5pZkHovMq
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 21, 2025 at 02:32:23PM -0300, Gustavo Padovan wrote:

[Reflowed into=20

> I=E2=80=99ll start by listing a few discussion topics here to warm up:

Some more:

- Lab usage efficiency improvements:
 - Job prioritisation.
 - Job dependency usage (eg, don't try things that need a NFS root
   filesystem if NFS boot didn't work).
 - Deduplciation of tests/builds for the same commit (especially an
   issue at -rc1).

- Should the lab configuration be higher level (more like the
  boards/tests mapping we had with v1)?

- Onboarding documentation/tooling:
 - Programming the API (plus general API docs).
 - Command line tooling (kci-dev is pretty good here, but not well
   signposted from the docs).
 - Configuration?

- Introspection/debuggability of configuration improvements (Denys is
  already doing a bunch of work here).

> * quality of test results - we run many thousands of tests everyday, but =
the confidence level is not where we want it to be. Some tests and platform=
s are unstable, but currently we have no tracking of that.

A bunch of these are the underlying thing being tested not being stable
of course and showing that is useful...

> * Defining Hardware/Platform information: Today hw info in pretty much in=
existent in KernelCI and a big limitation for showing results filtered by h=
w capabilities.

We're not quite that badly off - for the class of fairly inflexible SBCs
there's not much information to collect until you start getting into
stuff plugged into USB or whatever.  Not that we don't need to improve
here, but it's not quite so doom and gloom as that.

> * bisection support: how to do it?

I will get to this if nobody else does (we need it for our deployment).

--INhvEri5pZkHovMq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAminbwoACgkQJNaLcl1U
h9Cq4Af+KItORr7+9jVrPI/qF3HyFuHggWDa3jUo3fV+rAWyB7KJRp50jcnP98fo
2DUzjrvfeMhK8r3VmjlkKEAj8if2E1oFH+MxWDtd2stlDaOQgfuLdNEAnSZMWFIJ
leSvEU1g0++Std5mbtl9vRq8879VA5POj2G/j+J9kOQ+KgL/4S30CpEb3GM+eZCF
8u78YLq7tZAslTnLoe4lEiqHGwa9KafN5N9XWEPEf4w0hzOr81ffpIvscqGLoUOb
HdZuexeAMH8z4t4Xj//Uy+5JRMToRf+70NntwWt2m+7c0vesB2yfmEhZnKkKmwD0
pSp+1NND7PKY5ppY5vtOW+nzpdMghQ==
=cAhD
-----END PGP SIGNATURE-----

--INhvEri5pZkHovMq--
