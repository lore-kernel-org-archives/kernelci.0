Date: Mon, 29 Nov 2021 17:56:02 +0000
From: "Mark Brown" <broonie@kernel.org>
Subject: Re: [PATCH RFC 0/6] Bump minimum supported version of LLVM to 11.0.0
Message-ID: <YaUUMn6noJQRXp1q@sirena.org.uk>
References: <20211129165803.470795-1-nathan@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20211129165803.470795-1-nathan@kernel.org>
Content-Type: multipart/mixed; boundary="Groupsio=C7imn6Nici7ib96KRI1B"
List-ID: <kernelci.groups.io>
To: kernelci@groups.io, nathan@kernel.org
Cc: Nick Desaulniers <ndesaulniers@google.com>, Kees Cook <keescook@chromium.org>, Andrew Morton <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>, Masahiro Yamada <masahiroy@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, Tom Stellard <tstellar@redhat.com>, Michael Ellerman <mpe@ellerman.id.au>, Naresh Kamboju <naresh.kamboju@linaro.org>, Jakub Kicinski <kuba@kernel.org>, cki-project@redhat.com, llvm@lists.linux.dev, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org

--Groupsio=C7imn6Nici7ib96KRI1B
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 29, 2021 at 09:57:57AM -0700, Nathan Chancellor wrote:
> This patch series raises the minimum supported version of LLVM to
> 11.0.0.
>=20
> Patch #1 outlines the issue, goes over the potential impact of the
> change, and does the actual bump. Subsequent patches clean up the
> various checks that are always true after the bump.

Reviewed-by: Mark Brown <broonie@kernel.org>

--Groupsio=C7imn6Nici7ib96KRI1B
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmGlFDEACgkQJNaLcl1U
h9BjEwgAhdF9+7Ne92+Um8gDokv0S14rpQ9x/g0wU3cO0ktDZp5NMlriwkIG0FgQ
jnV8PvO9oWWvkK9BFr7d1IXGV9ZK1tFyrU6UzuUrPejstZX7vi2NGI21SESCaitj
OivGUpyOIMi0nsLYlDrvNojRKOh+bZwugAkJh5wGVy+tllvQAWiX8318K0YHipKT
52IlJ15xt4S7A/RzqLBoGHklutUK0WnFZoEQ7INb4Sdja+KEUeCAIQyuIP7c5TG4
H0Ys5k8PKegJ7c7u3wCXbBjwOKjz+WjBqzS1gSyILKBHMsBBy8tswwdZznPBceWl
jMB8V10GZDzyA+N9cGCx/NlKyxZDiA==
=CplQ
-----END PGP SIGNATURE-----

--Groupsio=C7imn6Nici7ib96KRI1B--
