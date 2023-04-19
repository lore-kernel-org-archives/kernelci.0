Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AA85C941
	for <kernelci@lists.linux.dev>; Wed, 19 Apr 2023 17:49:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56D0CC433EF;
	Wed, 19 Apr 2023 17:49:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681926549;
	bh=GW//Gl21V3jSKZ3G7aHqYYeSe4CitPs3f22l27AZioU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SiczUZzcBgyEBvYagjtD1QmJM3ZtFoYP46vUSYoifVL9I/DCFfCeZHCOCL0mLuvwM
	 Dscx50sbtroBQSSohlBJd8DAkpkXFqwA7q5sLFQBNkO8sIP2QMqqThwHM/5o2QRiO8
	 l2dzNMM6YlSlckvnPi7epBcW64uOY5Zfxms2cucHRSvZb5uLh5mePF49RY3qJRLE2R
	 6N8M1rMkg6ydiKP83hMyrabctqYnaCUZFj5nOeYbFmvb40fdii1DewR04H8DVHWPML
	 eFmkYW0GKHom2h+xubrYO6tgtnSlzksdsb009ADOqkdztE30Jn3kKD+nGymJ9lWRTZ
	 Vl9f1AGLoTNug==
Date: Wed, 19 Apr 2023 18:49:04 +0100
From: Mark Brown <broonie@kernel.org>
To: Nikolai Kondrashov <Nikolai.Kondrashov@redhat.com>
Cc: kernelci@lists.linux.dev, Dmitry Vyukov <dvyukov@google.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Alice Ferrazzi <alicef@gentoo.org>, Philip Li <philip.li@intel.com>,
	Vishal Bhoj <vishal.bhoj@linaro.org>,
	automated-testing@lists.yoctoproject.org,
	Tim Bird <Tim.Bird@sony.com>, CKI <cki-project@redhat.com>,
	Johnson George <Johnson.George@microsoft.com>,
	Sachin Sant <sachinp@linux.ibm.com>
Subject: Re: KCIDB: Support one more test status
Message-ID: <6d6cabd3-92e6-48b1-bd8b-b23fb09933c8@sirena.org.uk>
References: <45be6714-b818-0be7-3e95-9f69af65096c@redhat.com>
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="A8oJSM/HMnVMoM9z"
Content-Disposition: inline
In-Reply-To: <45be6714-b818-0be7-3e95-9f69af65096c@redhat.com>
X-Cookie: This is your fortune.


--A8oJSM/HMnVMoM9z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Apr 19, 2023 at 08:08:03PM +0300, Nikolai Kondrashov wrote:

> I would like to make KCIDB I/O schema accept one more test status string:
> "MISS" (preliminary name), meaning the test was supposed to run, but didn't
> because of a harness/framework/infrastructure/CI system failure.

> This would be distinct from the "SKIP" status, meaning the test was supposed
> to run, but didn't (or didn't complete), because it was not applicable.

> Here's the PR in question: https://github.com/kernelci/kcidb-io/pull/74

> I'll merge it in two weeks, on Wed, May 3, if there are no unresolved
> objections by that time.

> Read on for details, and respond either to this message, or in the PR.

This makes sense to me, it corresponds to how my own testing inteprets
results - I have a list of tests I expect to pass, and if any of them
return any result other than pass then that's an issue.  I also picked
the name "missing" for that in my code.

--A8oJSM/HMnVMoM9z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmRAKY8ACgkQJNaLcl1U
h9Bscwf/UVRdNtIidrmrncipJWXd4M85cpYjFQcWjcU8YNpWy4VRdx+aXl6ZRWrR
S7MVRKyyEEB47j4d+2cTCQ9GRiqRjLq244E9VoTJxBnXP+BVxfpJn5JWuN5aPq9A
e8via8+bsN78LRrugjvs1GfUsBFGU1wMc6Xe6KWMxE/MvgzkgXyrSHCQpZZsO+VZ
2Yk+WX8AftDwiv6mj5pzn1AtWLrHNXynLjqWOfnzHl+p3xR07+CYjWM+VuGx9Pnn
PWUE96q1A/7B2oRKGhB+9YYD9Cd96qN4BQG8+LuZrc/CoJ5/U6e55ANV6nzwAAOg
62P4Rlb2AqbWqHH8SHg7yWhB4eLxyw==
=BPWj
-----END PGP SIGNATURE-----

--A8oJSM/HMnVMoM9z--
