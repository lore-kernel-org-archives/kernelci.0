Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A40F17F4F6
	for <kernelci@lists.linux.dev>; Fri,  5 Sep 2025 18:38:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757097535; cv=none; b=L6mb6XZgw+VL0Uesv0iYG9YwS1RdniYV392NAJzW5byy5v55s6WFdQI3RBVt1jbFLZ8BhUHqV77MwcTsIBs9ZX4STwF6F2EnDqafNtRplPi1ig9U/9fKXQiGqTCvXkIN8KkIS4JItQuqzuITU87m7wI7DhTXDz3kODw1Qu78iCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757097535; c=relaxed/simple;
	bh=6tf3C5cOMa55fSS5btALL5EqJlAT4dqOAMJFHcMdlx8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RIMiMUyfa9vsH1oE3bESgNgmeSv8oHYFWheOzDIpgmTWtE9LnkgC/JJi6VNvxj9PHQrh4F2h9RAsG9lAjItpVF618X4npUVpzM+iCzdPIxXnJJHQ6sLqufh0DFM+BnQUMYFrnuzAkIDpsMyEqZKOqO6KuTGsQmCzWAbJ83lHGaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AiwPpd4a; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AiwPpd4a"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B8FAC4CEF4;
	Fri,  5 Sep 2025 18:38:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757097533;
	bh=6tf3C5cOMa55fSS5btALL5EqJlAT4dqOAMJFHcMdlx8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AiwPpd4aNTjP7fFjWO/nMuJzw9wULvC0l4iUFSQOelxsgTlcJDbk/NTjyBZDPz6dm
	 XUpI1PIIN6BlP2rmCqkm+dj7V4Be1k/S+VGQ+mB06XRK5yTrrJ/zHA/imZken4Y+UM
	 Lgw+hzykq+TcmtwN4IDWMJvspFErlWal6J2hQzoIRmbJb2/Qzb4gn0iiqa11eoL6o5
	 W0FQ4oQ/ZG3JtT56SeOdGrzqWWjJZajXWYLrwlgJbaxX9ZMhTQqnQrBAMvMexMTtWB
	 lVk2Kk3GW9+pwpXMtTqoP1Jymoyc+xI0o19l83r21yYI3SzIAhBRDdvLDrqCCo2loT
	 vX7OwQLBxFHWg==
Date: Fri, 5 Sep 2025 19:38:49 +0100
From: Mark Brown <broonie@kernel.org>
To: Donald Zickus <dzickus@redhat.com>
Cc: kernelci <kernelci@lists.linux.dev>,
	Gustavo Padovan <gustavo.padovan@collabora.com>,
	mwaqar <mwaqar@linuxfoundation.org>,
	"Hambardzumyan, Minas" <minas@ti.com>,
	Greg KH <gregkh@linuxfoundation.org>,
	arisu.tachibana@miraclelinux.com,
	Guillaume Tucker <gtucker@gtucker.io>
Subject: Re: KernelCI TSC nomination request
Message-ID: <634af87f-dc43-41fa-95f4-d97efc0e2e65@sirena.org.uk>
References: <CAK18DXZFCrvj-QK=45xVSkt+EJ6FSSPsxPxoeRBXPdDRySup9A@mail.gmail.com>
 <CAK18DXbDiXqiP_A+89h0D-1tFWOo0ezua2Np2VytbZ9DK5p=8w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Fe0LwQvUWhIJlguP"
Content-Disposition: inline
In-Reply-To: <CAK18DXbDiXqiP_A+89h0D-1tFWOo0ezua2Np2VytbZ9DK5p=8w@mail.gmail.com>
X-Cookie: He who laughs, lasts.


--Fe0LwQvUWhIJlguP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Sep 05, 2025 at 01:50:23PM -0400, Donald Zickus wrote:

> Additional request, can folks add a small paragraph (2-3 sentences)
> about their involvement in kernelci that will be provided during
> voting.  I will poke current nominees next week if they haven't
> provided something by then.

I've been involved in KernelCI for a long time, mainly as an upstream
kernel developer consuming the results and relatively small time lab
maintainer trying to get the best coverage out of the boards I have
available to me for the community.  Most of what I've done with KernelCI
has been focused around making those two use cases better, plus some
marketing mostly to other kernel developers.

I'm also part of the team looking at the Arm internal KernelCI instance,
a key part of our CI strategy.

--Fe0LwQvUWhIJlguP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmi7LjgACgkQJNaLcl1U
h9AACAf/eMIXtcjv2KufS9pLB2Tl9r7u23OEoYs8XJcJ882KRsBJkxlxsCeDztj1
6/WLMmFSaZgdo/19fxQ1onpZvDxrEovP3nEHgnGiC/qEfpuQWHmmZYZx33PVeSe0
DknOF8l7GbPb+wu2+06aEaR72ZGtIo59Coo5kuojcojFgY5lnqgOOszXuf27Z1Tl
gwDrBiV9hBZjhLqf+dQrG3KV0EpM4ZIRAsSierDdkxxyx1fHa40gbNnjyMLBda9J
3N08P3lMAQe7i/7l9DiC5iljS6I3tY0rln6/b4knWd3mqUMi0yw8gn3+Kvqvb7k9
+NUtGpns35m/QlwUHkiuV0Z0tFEduQ==
=yjQI
-----END PGP SIGNATURE-----

--Fe0LwQvUWhIJlguP--
