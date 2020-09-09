Date: Thu, 10 Sep 2020 09:17:52 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: next/pending-fixes build: 213 builds: 0 failed, 213 passed, 1437 errors, 244 warnings (v5.9-rc4-322-g03ef16f8dff9)
Message-ID: <20200910091752.74f327f0@canb.auug.org.au>
In-Reply-To: <5f58c669.1c69fb81.db1a2.5f8e@mx.google.com>
References: <5f58c669.1c69fb81.db1a2.5f8e@mx.google.com>
MIME-Version: 1.0
List-ID: <info.kernelci.org>
List-Post: <https://groups.google.com/a/kernelci.org/group/info/post>, <mailto:info@kernelci.org>
List-Help: <https://support.google.com/a/kernelci.org/bin/topic.py?topic=25838>,
 <mailto:info+help@kernelci.org>
List-Archive: <https://groups.google.com/a/kernelci.org/group/info/>
List-Unsubscribe: <mailto:googlegroups-manage+1098402462627+unsubscribe@googlegroups.com>,
 <https://groups.google.com/a/kernelci.org/group/info/subscribe>
Content-Type: multipart/signed; boundary="Sig_/4MY/+3/=elqnp2.2uJ_oEQU";
 protocol="application/pgp-signature"; micalg=pgp-sha256
List-ID: <kernelci.groups.io>
To: "kernelci.org bot" <bot@kernelci.org>, info@kernelci.org

--Sig_/4MY/+3/=elqnp2.2uJ_oEQU
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi kernelci.org,

On Wed, 09 Sep 2020 05:11:21 -0700 (PDT) "kernelci.org bot" <bot@kernelci.o=
rg> wrote:
>
> next/pending-fixes build: 213 builds: 0 failed, 213 passed, 1437 errors, =
244 warnings (v5.9-rc4-322-g03ef16f8dff9)
>=20
> Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/=
kernel/v5.9-rc4-322-g03ef16f8dff9/
>=20
> Tree: next
> Branch: pending-fixes
> Git Describe: v5.9-rc4-322-g03ef16f8dff9
> Git Commit: 03ef16f8dff93dcaf454582ffb92d47b62db096a
> Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.=
git
> Built: 7 unique architectures
>=20
> Errors and Warnings Detected:
>=20
> Errors summary:
>=20
>     582  /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No suc=
h file or directory
>     375  /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10=
: fatal error: asm/types.h: No such file or directory
>     120  /usr/include/stdio.h:27:10: fatal error: bits/libc-header-start.=
h: No such file or directory
>     16   /usr/include/stdlib.h:25:10: fatal error: bits/libc-header-start=
.h: No such file or directory
>     15   arc-elf32-gcc: error: unrecognized command line option =E2=80=98=
-pthread=E2=80=99
>     14   /bin/sh: 1: llc: not found
>     13   /bin/sh: 3: llc: not found
>     13   /bin/sh: 1: clang: not found
>     11   test_execve.c:4:10: fatal error: cap-ng.h: No such file or direc=
tory
>     9    get_size.c:29:10: fatal error: sys/sysinfo.h: No such file or di=
rectory
>     9    execveat.c:11:10: fatal error: sys/sendfile.h: No such file or d=
irectory
>     8    seccomp_bpf.c:9:10: fatal error: sys/types.h: No such file or di=
rectory
>     8    posix_timers.c:10:10: fatal error: sys/time.h: No such file or d=
irectory
>     8    kselftest_harness.h:56:10: fatal error: asm/types.h: No such fil=
e or directory
>     8    collect2: error: ld returned 1 exit status

It looks like something has gone wrong with the build system ...

--=20
Cheers,
Stephen Rothwell

--Sig_/4MY/+3/=elqnp2.2uJ_oEQU
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl9ZYqEACgkQAVBC80lX
0GwexAf/bS4Fz6/R+4Sej7vOU7ysnu6Pn1XEoAWxaAXQncqndHwzyl/5dUvJW1dg
fgnX1ZtarJrf2GTHHb44GSlorvcvNSQAjTrxzwUGhfn1jyFoih7VLjFr6mS0d76y
3fI6CADDtKjbAt5iTgPLGgjy7aIbCl4h5lBM/zWnghlA3aVZL9jZ7X7u5OEh8OSc
/mmTDvBQvpghG+g4eqEVblEpUhDmpp4XbfWId72yaQBtJB/zD69DyVsoci1BlXJF
+18Ms7EnWZ9LVHNSDyp98dmWuok6QfF/5zqIJdkafRTXNLvR/H574bxA6isHS1+P
l6SAIlIQq28LxpAhS6NI5OycJotegw==
=Dr/5
-----END PGP SIGNATURE-----

--Sig_/4MY/+3/=elqnp2.2uJ_oEQU--
