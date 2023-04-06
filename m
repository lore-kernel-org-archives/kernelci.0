Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B93E72F38
	for <kernelci@lists.linux.dev>; Thu,  6 Apr 2023 11:03:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41F70C433EF;
	Thu,  6 Apr 2023 11:03:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680779017;
	bh=bQY0NZ9I+8jLRbFkUpIN+oepqEKbbu2Ya1/1TF6uaNE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AhwZ8yNrDd+wWnOx+v8/GuGvQsyzkDouFjaMonifBiuqdse2MEwkhFGvXKRMvk9ZT
	 INP1kcERhBiADFnfqgWrckNbnAIRWuQZ65I8NE1TWxwjRTTx1oGbhCkCvCVK9fT0B1
	 oFu1BU6u3ru9eLgzZ/wk07G19/mmzKrKza8oq35xOXOU14FCKDiEbi+PyEWLeqiXRx
	 5/H7W2/SHgbntKtv+JYikuzAgqNkp0PDTvvi0YEDIBBe3d2Yxi3eqb64VbCHe1IIWZ
	 p908IjH2UeEXGiYd+BV4LJHXjpDOiXmQGgCrkhY+KxEKxrSFgUUpUelvcvvNGAl5nl
	 qDJxOuPcX1WaQ==
Date: Thu, 6 Apr 2023 12:03:32 +0100
From: Mark Brown <broonie@kernel.org>
To: Nikolai Kondrashov <spbnick@gmail.com>
Cc: "Hambardzumyan, Minas" <minas@ti.com>,
	"kernelci@lists.linux.dev" <kernelci@lists.linux.dev>,
	Guillaume Tucker <guillaume.tucker@collabora.com>
Subject: Re: kcidb vs KernelCI APIs
Message-ID: <b8de56e5-f9d6-4eed-8ebf-ee8fa6098399@sirena.org.uk>
References: <ec413cbe0205479b8beb25f3d1c6dfc1@ti.com>
 <d03f72ca-1efe-6912-1468-b8582dbbc2d8@gmail.com>
 <6d9d506b-9236-0c99-f49a-bdc7efa7eb60@gmail.com>
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="PmirNaLvqOY7Nr0g"
Content-Disposition: inline
In-Reply-To: <6d9d506b-9236-0c99-f49a-bdc7efa7eb60@gmail.com>
X-Cookie: Man and wife make one fool.


--PmirNaLvqOY7Nr0g
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Apr 06, 2023 at 11:56:00AM +0300, Nikolai Kondrashov wrote:

> To clarify further: the submitting CI system is solely responsible for
> keeping the IDs of the objects it sends to KCIDB unique among themselves.
> You can generate them however you wish, as long as they don't clash between
> themselves. E.g. you could concatenate the name of the host where the test
> executed with a timestamp, and the test process PID, to get a unique-enough
> ID. Or get them from the database you're storing your test results in, if
> you have any.

For one practical example, I'm using git commit hashes for commits and
a UUID library for test results.

--PmirNaLvqOY7Nr0g
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEyBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmQupwQACgkQJNaLcl1U
h9DBpAf2PO1U1vQ/ut2LpYATqOnpIWiwepPZU+LaHVJz+uJ0JqOkjX28cOhfwwxR
YG+/a9gnxwRne9Vqteo9NMGfN1fCjrJ3nnTnX3wq/6sGdfsY5/IMgLcCvhUw4HQ9
uj/4+0guin9S8ul61ASTj/OxZ41TpjZq4KUWbq9hHwQ2eKWHjTWFMh/LwiUhO+eN
kxU41BLINxvgdxVZ4wKgmS4va2OLqBz/XeF7Kbx0nkZ9WQohTFQXvxscNn+Aej9h
R1cV3GWAwchxAw2mbJC/Uzs/6GOirocJdaF2IM2unWwmlbyu3671MNczpjRnQW/O
GbTQoH54GzMGQ6uNp30EhGRVb7NB
=QpO2
-----END PGP SIGNATURE-----

--PmirNaLvqOY7Nr0g--
