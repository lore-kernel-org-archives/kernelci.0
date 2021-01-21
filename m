Date: Thu, 21 Jan 2021 11:17:41 +0100 (CET)
From: "Mathieu Acher" <mathieu.acher@irisa.fr>
Message-ID: <1546612940.5670843.1611224261504.JavaMail.zimbra@irisa.fr>
In-Reply-To: <ef0cf85a-1bb3-c3eb-7193-da39d7d8152f@redhat.com>
References: <ef0cf85a-1bb3-c3eb-7193-da39d7d8152f@redhat.com>
Subject: Re: KCIDB engagement report #kcidb
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
List-ID: <kernelci.groups.io>
To: kernelci <kernelci@groups.io>, Nikolai Kondrashov <Nikolai.Kondrashov@redhat.com>
Cc: automated-testing@yoctoproject.org

Hi,=20

TuxML https://github.com/TuxML/tuxml has a plan to synchronize with KCIDB =
in the upcoming months.=20
Our focus is on testing random configurations of the Linux kernel in the l=
arge.=20
We have two use cases (at least):=20
 * configuration bug prevention/prediction/fixing (when the kernel config.=
 does not build)
 * binary kernel size prediction (for whatever kernel version and compiler=
)=20

We have some data here: https://tuxmlweb.istic.univ-rennes1.fr/
We plan to discuss this in february with KernelCI's team for further refin=
ing how we can integrate/interoperate.=20

Best,=20

--
Dr. Mathieu ACHER, Associate Professor
Univ Rennes, Inria, CNRS, IRISA, France (DiverSE team)
http://www.mathieuacher.com/

----- Mail original -----
> De: "Nikolai Kondrashov" <Nikolai.Kondrashov@redhat.com>
> =C0: "kernelci" <kernelci@groups.io>, automated-testing@yoctoproject.org
> Envoy=E9: Jeudi 21 Janvier 2021 11:07:02
> Objet: KCIDB engagement report

> Hi everyone,
>=20
> Below is the monthly report on KCIDB* engagement. It lists various CI sy=
stems
> and their status of engagement with KCIDB, and once we get to that, will=
 list
> developer engagement.
>=20
> Lines with updates are marked with "!".
>=20
> The main news is that Gentoo GKernelCI have started sending their prelim=
inary
> data to our "playground" setup. Linaro have also started work on sending
> tuxmake build results, but no reports have arrived yet.
>=20
>     KernelCI native
>         Sending staging results.
>         Transitioning to production results is at 50%
>         (KCIDB support done, backend work started).
>         https://staging.kernelci.org:3000/?var-origin=3Dkernelci
>=20
>     Red Hat CKI
>         Sending production results.
>         https://staging.kernelci.org:3000/?var-origin=3Dredhat
>=20
>     Google Syzbot
>         Sending a subset of production results (failures only).
>         https://staging.kernelci.org:3000/?var-origin=3Dsyzbot
>=20
>     ARM
>         Sending production results to "production" KCIDB.
>         Full commit hashes are currently not available, are spoofed, and=
 don't
>         match the ones reported by others. To be fixed soon.
>         https://staging.kernelci.org:3000/?var-origin=3Darm
>=20
>     Sony Fuego
>         Internal design in progress.
>=20
> !   Gentoo GKernelCI
> !       Preliminary data (revisions and builds) have started flowing int=
o
> !       "playground" KCIDB. No timestamps yet.
> !
> https://staging.kernelci.org:3000/d/home/home?var-origin=3Dgkernelci&var=
-dataset=3Dplayground_kernelci04
>=20
>     Intel 0day
>         Initial conversation concluded, general interest expressed,
>         no contact since.
>=20
> !   Linaro
> !       Work has started on sending tuxmake build results
> !       (a part of https://tuxsuite.com/). No reports have arrived yet.
>=20
> Please respond with corrections or suggestions of other CI systems to co=
ntact.
>=20
> Nick
>=20
> *KCIDB is an effort to unify Linux Kernel CI reporting, maintained by Li=
nux
>  Foundation's KernelCI project:
>  https://foundation.kernelci.org/blog/2020/08/21/introducing-common-repo=
rting/
>=20
>=20
>=20
>=20
