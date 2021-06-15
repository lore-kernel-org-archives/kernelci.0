Subject: Re: #KCIDB engagement report
References: <5a9bf050-0671-3273-cc4f-1b131445c1fe@redhat.com>
 <CAKwvOdmwRV6R6dcpcSL06SNVQ1_JwvOJMZPYiHKvjSx4sf_95g@mail.gmail.com>
 <202106011315.432A65D6@keescook>
 <774899c5-c20a-3d7e-3289-ee257b86e06e@collabora.com>
 <CAMbaCcc4-n022x97S-6ur8P9xKcp3cNMhK31y2GJLnd5PVOM-g@mail.gmail.com>
From: "Guillaume Tucker" <guillaume.tucker@collabora.com>
Message-ID: <b42c0a0d-8764-3e8d-f195-f2c231878c60@collabora.com>
Date: Tue, 15 Jun 2021 11:36:34 +0100
MIME-Version: 1.0
In-Reply-To: <CAMbaCcc4-n022x97S-6ur8P9xKcp3cNMhK31y2GJLnd5PVOM-g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
List-ID: <kernelci.groups.io>
To: Nikolai Kondrashov <Nikolai.Kondrashov@redhat.com>, kernelci@groups.io, =?UTF-8?B?TWljaGHFgiBHYcWCa2E=?= <michal.galka@collabora.com>
Cc: keescook@chromium.org, Nick Desaulniers <ndesaulniers@google.com>, "automated-testing@yoctoproject.org" <automated-testing@yoctoproject.org>, clang-built-linux <clang-built-linux@googlegroups.com>, Vishal Bhoj <vishal.bhoj@linaro.org>, Antonio Terceiro <antonio.terceiro@linaro.org>, Remi Duraffort <remi.duraffort@linaro.org>

On 15/06/2021 10:58, Nikolai Kondrashov wrote:
> Guillaume,
>=20
> I checked the database, and the submission queue logs and could only fin=
d the build itself, but no tests. They were probably lost somewhere before =
KCIDB.

Right, I think this is at least part of the issue:

  ValidationError: 'kselftest-futex.breakpoints:step_after_suspend_test' d=
oes not match '^[.a-zA-Z0-9_-]*$'

Micha=C5=82, is this going to get resolved with the fix you're making
for invalid characters in test case names?

Cheers,
Guillaume

> On Fri, 11 Jun 2021 at 19:12, Guillaume Tucker <guillaume.tucker@collabo=
ra.com <mailto:guillaume.tucker@collabora.com>> wrote:
>=20
>     Hi Kees,
>=20
>     On 01/06/2021 21:26, Kees Cook wrote:
>     > On Mon, May 24, 2021 at 10:38:22AM -0700, 'Nick Desaulniers' via C=
lang Built Linux wrote:
>     >> On Mon, May 24, 2021 at 12:50 AM Nikolai Kondrashov
>     >> <Nikolai.Kondrashov@redhat.com <mailto:Nikolai.Kondrashov@redhat.=
com>> wrote:
>     >>> [...]
>     >>>=C2=A0 =C2=A0 =C2=A0 KernelCI native
>     >>>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Sending (a lot of) production =
build and test results.
>     >>>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 https://staging.kernelci.org:3=
000/?var-origin=3Dkernelci
>     >>> [...]
>     >
>     > Apologies for the thread hijack, but does anyone know what's happe=
ning
>     > with kselftest? It seems missing from the listed[1] build artifact=
s, but
>     > it is actually present[2] (and I see the logs for generating the t=
arball
>     > there too), but I can't find any builds that actually run the test=
s?
>     >
>     > (Or how do I see a top-level list of all tests and search it?)
>=20
>     The kselftest results are all there on the KernelCI native
>     dashboard, for example the futex tests:
>=20
>     =C2=A0 https://linux.kernelci.org/test/job/mainline/branch/master/ke=
rnel/v5.13-rc5-74-g06af8679449d/plan/kselftest-futex/
>=20
>=20
>     Here's a set of passing results on a "coral" x86 Chromebook, with
>     a bunch of unknowns but that's because other kselftests are being
>     run when they shouldn't (net, mqueue, ptrace) so it's noise which
>     should get resolved with a fix soon:
>=20
>     =C2=A0 https://linux.kernelci.org/test/plan/id/60c2bf67ed48b86ffe0c0=
df8/
>=20
>=20
>     And here are the full kernel build details:
>=20
>     =C2=A0 https://linux.kernelci.org/build/id/60c2bdeea60229633d0c0f0c/
>=20
>     and artifacts (logs, binaries, meta-data in JSON):
>=20
>     =C2=A0 https://storage.kernelci.org/mainline/master/v5.13-rc5-74-g06=
af8679449d/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-8/
>=20
>=20
>     So this is the original data, now let's look at what we have in
>     KCIDB.=C2=A0 Here's the matching build:
>=20
>     =C2=A0 https://kcidb.kernelci.org/d/build/build?orgId=3D1&var-datase=
t=3Dkernelci04&var-id=3Dkernelci:kernelci.org:60c2bdeea60229633d0c0f0c
>=20
>     However there's no results, probably because submitting the data
>     failed for some reason.=C2=A0 It could be due to some invalid
>     characters in the test names.=C2=A0 The Log link works though, it
>     takes you to the directory with all the log files - to be
>     improved as it's advertised as a single build log...
>=20
>     So we'll take a closer look, see if there were any errors in the
>     logs to find out why the results aren't in KCIDB.=C2=A0 But the
>     kselftests were definitely run.
>=20
>=20
>     Thanks,
>     Guillaume
>=20
>     > [1] https://kcidb.kernelci.org/d/build/build?orgId=3D1&var-dataset=
=
=3Dkernelci04&var-id=3Dkernelci:kernelci.org:60b654321456eb7654b3afa6&full=
screen&panelId=3D17
>     > [2] https://storage.kernelci.org//mainline/master/v5.13-rc4-11-gc2=
131f7e73c9/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-8/
>=20
>=20
>    =20
>=20
>=20

