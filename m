Return-Path: <khilman@baylibre.com>
From: "Kevin Hilman" <khilman@baylibre.com>
Subject: Re: [kernelci] Meeting Minutes for 2018-08-13
References: <20180813144959.2zubcbojvnlk75sv@xps.therub.org>
Date: Wed, 15 Aug 2018 08:20:28 -0700
In-Reply-To: <20180813144959.2zubcbojvnlk75sv@xps.therub.org> (Dan Rue's
	message of "Mon, 13 Aug 2018 09:49:59 -0500")
Message-ID: <7hlg97lkqr.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
List-ID: <kernelci.groups.io>
To: Dan Rue <dan.rue@linaro.org>
Cc: kernelci@groups.io

"Dan Rue" <dan.rue@linaro.org> writes:

> - Attendees - Ana, Guillaume, Guenter, Mark, Matt, Dan
>
> - Dan - ok with everyone to post minutes to mailing list after meeting?
>   - Mark - concern about unstructured mailing list discussions
>   - Dan - I=E2=80=99d like to try and see how it goes

I really appreciate the minutes.  It's Monday 6am for me when the
meeting happens, so I'm unlikely to attend, but I still like being able
to follow what happens and contribute.

> - Guillaume
>   - Rewriting the device map as =E2=80=9Ctest configs=E2=80=9D, first PR =
for early
>     feedback: https://github.com/kernelci/lava-ci-staging/pull/96
>     - Suggestion to add support to use yaml config files, rather than
>     having them defined in python
>   - Can we drop lava-v1?
>     - [matt] Looks like the last lab that uses v1 is offline since July
>     11, but they don=E2=80=99t have any v1 devices anymore either
>     - [matt] +1

+1  Drop it.  Anyone who cares about v1 at this point can submit patches
to add it back, or migrate to v2 (preferably the latter.)

>   - Should we test with =E2=80=9CSMP=3Dn=E2=80=9D all ARM devices? Some f=
ailures are seen
>   on veyron-jaq and nyan-big only with SMP=3Dn, they should not fail but
>   otoh it=E2=80=99s not a config normally used in production devices.
>     - [mark] yes, it=E2=80=99s good to check to catch issues that were as=
sumed
>     by developers and find real problems. Similar to testing what
>     testing RT used to do before SMP was common.

Agree with Mark.  Another useful thing is when a boot fails with the
normal (SMP=3Dy) but passes with SMP=3Dn, it helps narrow down the failure.
(this happened recently on Amlogic SoCs and helped us narrow down the
regression to broadcast timers that are only enabled in SMP mode)

>   - Improve coordination when syncing staging with prod (and merging
>   kernelci-build with lava-ci)
>     - If kernelci-build and lava-ci were combined, it would make
>     deployment simpler (less need to do an atomic sync when making big
>     changes)
>     - Last week deploying the changes wasn=E2=80=99t easy because Matt wa=
sn=E2=80=99t
>     highly available at the same time as Guillaume
>     - Matt, ana, +1
>     - [guillaume] should we put them in lavaci ?
>     - 6 hours without builds on friday. Staging -> prod requires
>     downtime. Better to do it during quiet period
>
> - Ana
>   - PR for https://github.com/kernelci/kernelci-backend/pull/70 open for
>   review, code to send the test suite report emails
>   - Rootfs with test suites - pulling test suite from git repo. Need a
>   way to handle versioning
>   - Support for building mips - do we need to support the 3 mips
>   architectures? The advantage of having all mips arches is we have mips
>   32 bits little endian and bit endian and also mips 64 bits little
>   endian.
>     - [Matt] Kevin will known which

buildroot, debian and the kernel support all 3.  I think we should build
toolchains/rootfs for all 3 so we're ready, and those won't continually
consume build resources.

For kernels, until we have more build capacity, I think we should enable
kernels as we get hardware (or as MIPS people request specific
kernels/defconfigs)

> - [Matt] Updating builders with tmpfs
>   - Could add it to docker runtime
>     - But then couldn=E2=80=99t run docker builds on the builder
>   - Needs more testing in staging, with jenkins pipeline
>   - For now, just tag one box as the docker builder. In the future it
>   won=E2=80=99t be an issue once everything is using containers
>   - Every step should run inside a container
>
> - Guillaume - looking to convert 3 more jobs to pipeline

FYI Re: docker builders.

If you mount /var/run/docker.sock and /dev/kvm into the docker
container, and then install docker in the container, then the dockerized
builders could also pull/run docker images.   NOTE: that this
technically isn't "docker in docker" because it's actually just
(re)using the main host docker.

Kevin

