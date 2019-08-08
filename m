MIME-Version: 1.0
References: <20190808130322.je447ur4flzkisvn@xps.therub.org>
In-Reply-To: <20190808130322.je447ur4flzkisvn@xps.therub.org>
From: "Nick Desaulniers" <ndesaulniers@google.com>
Date: Thu, 8 Aug 2019 09:47:24 -0700
Message-ID: <CAKwvOdkoYNe7mMj_r6SrtXj4LxLUO+=sLsMXTKz16NtzObYgsQ@mail.gmail.com>
Subject: Re: Weekly Meeting 2019-08-06 #minutes
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-ID: <kernelci.groups.io>
To: kernelci@groups.io, Dan Rue <dan.rue@linaro.org>

On Thu, Aug 8, 2019 at 6:03 AM Dan Rue <dan.rue@linaro.org> wrote:
>
> - broonie
>   - arm64+BIG_ENDIAN still failing noisily
>     - Can someone check if we=E2=80=99re sending the right rootfs to the
>       devices?
>       - [Matt] I=E2=80=99ve run the LAVA job generating script and the
>         CONFIG_CPU_BIG_ENDIAN=3Dy jobs all have the correct url to the B=
E
>         ramdisk. I=E2=80=99ve also checked that the rootfs is actually b=
ig
>         endian.
>     - Also one v7 machine with a similar symptom
>       https://kernelci.org/boot/id/5d4807f559b514d97f31b28e/
>       - bug in Kevin=E2=80=99s scripts: unique to my lab
>     - Looks like it=E2=80=99s the kernel, Matt has confirmed that we sho=
uld be
>       sending the right rootfs
>       - Nick to test boots with clang kernels in qemu
>       - Mark to send patch upstream disabling BE+clang builds until this
>         works.

https://github.com/kernelci/kernelci-core/issues/136

>     - Should look at getting big endian booted on other hardware, having
>       more labs would make life a lot easier.
>
> - Kevin`
>   - handling LAVA multinode jobs:
>     https://github.com/kernelci/kernelci-backend/pull/152
>     - motivation
>     - backend data model [gtucker] see also
>       https://baylibre.com/tpmp-power-measurement-platform/
>
> - Matt
>   - Email bugs and adding clang builds to my to-do this week
>   - My lab will be offline from next week for the foreseeable future
>
>
>=20
>


--=20
Thanks,
~Nick Desaulniers
