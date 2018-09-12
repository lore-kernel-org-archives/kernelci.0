Date: Wed, 12 Sep 2018 11:34:27 +0100
From: "Mark Brown" <broonie@kernel.org>
Subject: Re: [kernelci] media subsystem test pilot
Message-ID: <20180912103427.GD6062@sirena.org.uk>
References: <d0113fd0-801a-feff-af96-12a71ca27dc7@collabora.com>
MIME-Version: 1.0
In-Reply-To: <d0113fd0-801a-feff-af96-12a71ca27dc7@collabora.com>
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="SO98HVl1bnMOfKZd"
Content-Disposition: inline
List-ID: <kernelci.groups.io>
To: kernelci@groups.io
Cc: ezequiel Garcia <ezequiel@collabora.com>, Gustavo Padovan <gustavo.padovan@collabora.com>, anders.roxell@linaro.org

--SO98HVl1bnMOfKZd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 12, 2018 at 09:13:23AM +0100, Guillaume Tucker wrote:

> * add config fragment (similar to the kselftest one) with virtual
>   video drivers enabled to test v4l2 framework on QEMU and get
>   reference test results

Semi-orthogonal (and definitely not a blocker) but Anders Roxell (CCed)
was looking at proposing a config fragment for inclusion upstream which
would enable all the config options that add ABIs, mainly for use with
testsuites.  The idea was that with such a fragment enabled there'd be a
good chance that any random testsuite would have what it needs from the
kernel without needing to maintain lots of testsuite specific fragments,=20
especially if the config options change with kernel versions.  I wonder
if it's also a good idea to have a fragment which enables all test/virtual=
=20
drivers for similar reasons.

> Does this sound like a good plan?  If so, it would be good to start
> working on it next week if we want to get something done in time for
> ELCE and give a chance to developers to provide some feedback on the
> test results.

Makes sense to me.

--SO98HVl1bnMOfKZd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAluY67MACgkQJNaLcl1U
h9C1IQf/XWx2jSVaCtcLp4ks+tZrJEMzzu5x1diahg7gYvRqKOhjzZB1PNnPAvj8
5Js0jQ5EuinOddKF81Hb62pRxMhwFhJzhhwCxSCtMNrYBlOZN/4t0J0WDYkV6nNM
qzGlDCqm5kz4GaId2m5ea8DI0djRpgd9/jcc/m5oelmKfEF/0nLXtPgi9dqG0piy
3gkWwWCfWWwMLpkkAkHGQTevmORZslGQXkK1dXPpV7QRGzFkqyNtJ5WbS6nsq3+y
xL+70qGIDowYcESPhNOSDKmgOeZUnsjP3QXUSeu+OVK1s/ScOnU+G3PIP5/SkIfg
k+WFlhUTHDn422SMU36Vdj0RkY/yLQ==
=b0By
-----END PGP SIGNATURE-----

--SO98HVl1bnMOfKZd--
