Date: Tue, 5 Mar 2019 12:14:12 +0000
From: "Mark Brown" <broonie@kernel.org>
Subject: Re: Hourly, daily, weekly monitoring
Message-ID: <20190305121412.GA7513@sirena.org.uk>
References: <1eb2fcf9-d08b-0d38-9aee-c0206089b5d7@collabora.com>
MIME-Version: 1.0
In-Reply-To: <1eb2fcf9-d08b-0d38-9aee-c0206089b5d7@collabora.com>
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="C7zPtVaVf+AK4Oqc"
Content-Disposition: inline
List-ID: <kernelci.groups.io>
To: kernelci@groups.io, guillaume.tucker@gmail.com
Cc: Linus Walleij <linus.walleij@linaro.org>

--C7zPtVaVf+AK4Oqc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Mar 04, 2019 at 01:20:25PM +0000, Guillaume Tucker wrote:

> I'm not entirely sure how much flexibility Jenkins can offer in
> that respect, but at least having 3 versions of the monitor job
> that runs every hour, every day and every week should cover all
> the cases.  If possible, we may be able to implement something
> that dynamically schedules the next check for each branch.

One big concern I have with this is latency.  One of the common cases
where people don't need builds all the time is when they're mainly
looking for checks before they submit pull requests.  For those if you
might have to wait almost a day before we even queue the build it might
be a bit of an issue.  If it was just a "skip this tree if we built it
in the past X time" check that wouldn't be such an issue, it's just if
the daily check runs at some fixed time each day or whatever that it
might add huge extra latency.

Another idea I just thought of but I'm not sure is practical would be to
only check some trees if the Jenkins queue is less than some number of
builds - that way if we're busy we won't add extra load, but it feels
like it's more trouble than it's worth to implement fairly.

--C7zPtVaVf+AK4Oqc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlx+aBIACgkQJNaLcl1U
h9C6igf+PCOhwcT80nDdD0tKQIAJdxUdUZIHl5vNdYcx0pEpQqLwdXKh8B7kGxV9
k4/vhOp0Q3XFfLTx4RJJpHhdMACF7jPy41dHeK8A+IT6gHBhdFoLhaFEeTmC7dzr
IwjQ4FROpaqIcS+BjIhM3iwdC+wv4Vb9PNsl2zGpzWzYHzrPr6Vzo0ZfdewKeTUk
C8hX5Z3/mVnlwHnsxW+IfvTP7VUSapZGcS9XvC0DDVQ2+MmeQg/4m7ppRKwZkI6N
9GBVQJSBRq5p7NN5+8Iq+8x6J9I0dOIAQMPNQ0iZ4sBKW542yaV3kDwdDdj43c3A
ddkfqB+kNoa4coTqmE6MONR9Bf2bJg==
=Y0pU
-----END PGP SIGNATURE-----

--C7zPtVaVf+AK4Oqc--
