Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A82C230276A
	for <kernelci@lists.linux.dev>; Thu, 22 Jan 2026 13:23:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769088219; cv=none; b=rT2R+2MQVzKeaWLYxAtYYjF4oLvGnNBoAadsmKTNeCEg2FOB/H366BehiM1b4WvjopQkHkHLL5ZRh43W1/QgfYcJRu28BAjdnL2GJro7Pt5cuMGZogzIEIx9KKe8HvMaMnq2vdqpqJcG9HEiV7lyL8qPLu3UXhNKwiqIi6XvM18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769088219; c=relaxed/simple;
	bh=LyM/EVVFWB8MCFMy5okLqWXwImRTBU+GqkaRd5g+ikM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V15MNrYDT+Uwbn8SaNU9ULqlvl/+vVqw0cCEcvAi4nl4Mxy2vAFzbWkj+o1aM8CIlPaemR0cYrqzCQc5d740VrRN4V1kb4q4A9VS5y5Yzj/bUicatNbeGTfmHOD4Sx1UCg3+Dum4/BYQuIyTIMtgXyI27OF2RjbfOIe/WPTiI5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GmKj5Tdv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GmKj5Tdv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 471FEC116C6;
	Thu, 22 Jan 2026 13:23:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769088219;
	bh=LyM/EVVFWB8MCFMy5okLqWXwImRTBU+GqkaRd5g+ikM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GmKj5TdvkV//MlRkFNPPsasHDf5w2bDYk+WEyFgjI/Vy+pIDurxyXHpAWCNen6BAB
	 Ao6PpHc4V3uSp33d5+XxDwEfbLT2uQQ7u824ZP0vW2gr9u2l+n7g7RXznH21a9EkvR
	 ji5j/zkPdT54NAMsd0+HwtbMcoBuZmXQN6b2Fau0thFChUPKWqtJFKkyr+mBz3fLTH
	 PDDNi0GJFJRdfLzc70RTIvmq8tbhN1uT+9W8dU8HpKh6LH+Ae32+zpgvGFo4EIAwJD
	 5w4TAv58qiEPcJLDrdU5RxAaxWQsnpQCJXp4be6vwqFnZoetB53HG4cTgmpzUs64Gx
	 51dUqGeBhGwMQ==
Date: Thu, 22 Jan 2026 13:23:35 +0000
From: Mark Brown <broonie@kernel.org>
To: Chris Paterson <Chris.Paterson2@renesas.com>
Cc: Gustavo Flores <gustavo.flores@profusion.mobi>,
	"kernelci@lists.linux.dev" <kernelci@lists.linux.dev>,
	"kernelci-webdashboard@groups.io" <kernelci-webdashboard@groups.io>
Subject: Re: KernelCI Dashboard - Hardware Listing Behavior
Message-ID: <97cfa9d7-b740-4f2d-a0f2-aef3df98d6cf@sirena.org.uk>
References: <CAB31pVk5MsWzPxYc-ctAg8rfVGvYcVGzsxXNi+KEWkf_5B2qTA@mail.gmail.com>
 <OSZPR01MB81230BE51B22B72D9D2A1BB4B797A@OSZPR01MB8123.jpnprd01.prod.outlook.com>
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="VpV/i2Wg9+mMBAWH"
Content-Disposition: inline
In-Reply-To: <OSZPR01MB81230BE51B22B72D9D2A1BB4B797A@OSZPR01MB8123.jpnprd01.prod.outlook.com>
X-Cookie: Don't read everything you believe.


--VpV/i2Wg9+mMBAWH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 22, 2026 at 11:17:46AM +0000, Chris Paterson wrote:
> > From: Gustavo Flores <gustavo.flores@profusion.mobi>

> > 2. Show tests from the most recent checkout in which each specific
> > hardware was tested, even if it's not the latest checkout of a tree.

> I'm not sure Option 2 would work so well if there are more than one check=
out on different trees testing the same board in similar timeframes.
> Say linux-stable and linux-next pipelines are kicked off at the same time.
> The linux-stable checkout may finish a hour earlier having failures, then=
 an hour latest linux-next finished and we can no longer see the "latest ba=
d" result from linux-stable.=20

Right, the most recent commit in development terms may not be the most
recent commit tested.  I think what we probably want for this option is
to have a report showing the most recent state for a series of specific
trees, for example mainline, next and all the stables where there are
results for the specific board.  I think that's more likely to show
people the state they're interested in.

--VpV/i2Wg9+mMBAWH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmlyJNYACgkQJNaLcl1U
h9CW2Qf+J2wA/yzAqF6fh1AdAhFfjLvFbpznS14mVGGxujVuCZPGtQdcQ6nfEp0E
fIbQ/LN/O4heywWdlC1rvEFcHexWzVwFBU52hR4d0m0tQUKQlBGGlzvk1fy09HF5
NavxCYGQRgATbn5KqTTR65m4AMJttBk9/o/Y9lGM6NIUpqlX6lRXxJAe0245+g5w
VaxGv3FFXQaBxZlxTZDUfmgPZ3DYiKArrTjJyNq6WON5cczxMru0LgFz174qFH0K
SMKAlwUYrSgt2etgQXL+5kRRh2ZdgImo/mCMkSeSLA+ol2pwZflUZ6xxkskkMKQt
KjxmcV2qpTCIZrKuI6RcjilhoWrbHw==
=QoVo
-----END PGP SIGNATURE-----

--VpV/i2Wg9+mMBAWH--
