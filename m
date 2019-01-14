Return-Path: <khilman@baylibre.com>
From: "Kevin Hilman" <khilman@baylibre.com>
Subject: Re: Weekly Meeting 2019-01-14 #minutes
In-Reply-To: <20190114155044.g2xy3a5e42ynivj7@xps.therub.org>
References: <20190114155044.g2xy3a5e42ynivj7@xps.therub.org>
Date: Mon, 14 Jan 2019 13:56:29 -0800
Message-ID: <7hfttukinm.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
List-ID: <kernelci.groups.io>
To: kernelci@groups.io, dan.rue@linaro.org, kernelci@groups.io

"Dan Rue" <dan.rue@linaro.org> writes:

> - Attendees: Charles Oliveira, Daniel D=C3=ADaz, Guenter Roeck, Guillaume
>   Tucker, Dan Rue, Mark Brown, Matt Hart
>
> - [matt]
>   - Scrap HTML emails everywhere?
>     - Ask HTML receivers
>   - In kernel defconfig build lists
>     - Kernel tree owner can update the defconfig list without us having
>       to roll out updated configs
>       - [mark] let=E2=80=99s see what 0day does and others; how do they s=
olve
>         this?
>       - [drue] perhaps a separate repo that manages configs like this
>         out of band from the kernel tree and out of band from kernelci=E2=
=80=99s
>         release cycle. This could also be useful to manage and support
>         fragments.
>       - [gtucker] what=E2=80=99s the actual usecase of wanting to filter
>         defconfigs?
>         - [matt] speed
>         - [mark] well kernelci=E2=80=99s point is coverage. If you just w=
ant one
>           built, you don=E2=80=99t need kernelci.
>       - [matt] we=E2=80=99ll wait until the yaml work is completed by gtu=
cker
>         before making any changes here
>     - Very useful for testing
>       - [gtucker] Other way to do this is in build-configs.yaml with all
>         the other build configuration settings (see initial work in
>         kernelci-core-staging PR #75)

We need flexibility in which defconfigs are built per tree, but also per
arch and probably per toolchain, so having this in a simple file in tree
is not sufficient.

IMO, the build-configs.yaml stuff that Guillaume is working on is the
way to go forward.

> - [gtucker]
>   - Test regressions merged on staging, testing last changes to the test
>     reports
>   - Adding fix for MIPS (remove hacks and use gcc-7)

Thanks!

>   - V4l2 & dynamic metadata: adding a template parameter to the
>     test-configs.yaml test plans settings to specify the video driver to
>     use in the test (discovering the driver name at runtime isn=E2=80=99t
>     practical with current LAVA)
>
> - [drue]
>   - Next steps on =E2=80=98[Help] How to use kernelci to establish a loca=
l CI
>     lab?=E2=80=99?
>     - [chaws] I mentioned this repo:
>       https://github.com/kernelci/kernelci-core, but still unsure what
>       the next step is
>     - Li=E2=80=99s asking for support using kernelci-docker locally, not =
adding
>       a lab to kernelci. There are a lot of versions of this repo in the
>       wild, so it=E2=80=99s not clear who should help him. Matt can show =
him how
>       he does it.

I'm not sure about a lot of versions, but we (BayLibre) are working
primarily on this one, which is also deployed for AGL:
https://github.com/lucj/kernelci-docker

Kevin
