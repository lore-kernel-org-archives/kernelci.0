MIME-Version: 1.0
References: <20180813144959.2zubcbojvnlk75sv@xps.therub.org> <7hlg97lkqr.fsf@baylibre.com>
In-Reply-To: <7hlg97lkqr.fsf@baylibre.com>
From: groeck@google.com
Date: Wed, 15 Aug 2018 08:28:18 -0700
Message-ID: <CABXOdTfK6CN6EKyHgQ8M2EinrDF-L4M04t0c=3XBJbk3nS0mfA@mail.gmail.com>
Subject: Re: [kernelci] Meeting Minutes for 2018-08-13
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-ID: <kernelci.groups.io>
To: kernelci@groups.io
Cc: dan.rue@linaro.org

On Wed, Aug 15, 2018 at 8:20 AM Kevin Hilman <khilman@baylibre.com> wrote:
>
> "Dan Rue" <dan.rue@linaro.org> writes:
>
> > - Attendees - Ana, Guillaume, Guenter, Mark, Matt, Dan
> >
> > - Dan - ok with everyone to post minutes to mailing list after meeting=
?
> >   - Mark - concern about unstructured mailing list discussions
> >   - Dan - I=E2=80=99d like to try and see how it goes
>
> I really appreciate the minutes.  It's Monday 6am for me when the
> meeting happens, so I'm unlikely to attend, but I still like being able
> to follow what happens and contribute.
>
> > - Guillaume
> >   - Rewriting the device map as =E2=80=9Ctest configs=E2=80=9D, first =
PR for early
> >     feedback: https://github.com/kernelci/lava-ci-staging/pull/96
> >     - Suggestion to add support to use yaml config files, rather than
> >     having them defined in python
> >   - Can we drop lava-v1?
> >     - [matt] Looks like the last lab that uses v1 is offline since Jul=
y
> >     11, but they don=E2=80=99t have any v1 devices anymore either
> >     - [matt] +1
>
> +1  Drop it.  Anyone who cares about v1 at this point can submit patches
> to add it back, or migrate to v2 (preferably the latter.)
>
> >   - Should we test with =E2=80=9CSMP=3Dn=E2=80=9D all ARM devices? Som=
e failures are seen
> >   on veyron-jaq and nyan-big only with SMP=3Dn, they should not fail b=
ut
> >   otoh it=E2=80=99s not a config normally used in production devices.
> >     - [mark] yes, it=E2=80=99s good to check to catch issues that were=
 assumed
> >     by developers and find real problems. Similar to testing what
> >     testing RT used to do before SMP was common.
>
> Agree with Mark.  Another useful thing is when a boot fails with the
> normal (SMP=3Dy) but passes with SMP=3Dn, it helps narrow down the failu=
re.
> (this happened recently on Amlogic SoCs and helped us narrow down the
> regression to broadcast timers that are only enabled in SMP mode)
>

I second that. In my testbed, I boot various configurations for
several architectures with SMP=3Dn simply for the purpose of catching
SMP related problems.

Guenter

> >   - Improve coordination when syncing staging with prod (and merging
> >   kernelci-build with lava-ci)
> >     - If kernelci-build and lava-ci were combined, it would make
> >     deployment simpler (less need to do an atomic sync when making big
> >     changes)
> >     - Last week deploying the changes wasn=E2=80=99t easy because Matt=
 wasn=E2=80=99t
> >     highly available at the same time as Guillaume
> >     - Matt, ana, +1
> >     - [guillaume] should we put them in lavaci ?
> >     - 6 hours without builds on friday. Staging -> prod requires
> >     downtime. Better to do it during quiet period
> >
> > - Ana
> >   - PR for https://github.com/kernelci/kernelci-backend/pull/70 open f=
or
> >   review, code to send the test suite report emails
> >   - Rootfs with test suites - pulling test suite from git repo. Need a
> >   way to handle versioning
> >   - Support for building mips - do we need to support the 3 mips
> >   architectures? The advantage of having all mips arches is we have mi=
ps
> >   32 bits little endian and bit endian and also mips 64 bits little
> >   endian.
> >     - [Matt] Kevin will known which
>
> buildroot, debian and the kernel support all 3.  I think we should build
> toolchains/rootfs for all 3 so we're ready, and those won't continually
> consume build resources.
>
> For kernels, until we have more build capacity, I think we should enable
> kernels as we get hardware (or as MIPS people request specific
> kernels/defconfigs)
>
> > - [Matt] Updating builders with tmpfs
> >   - Could add it to docker runtime
> >     - But then couldn=E2=80=99t run docker builds on the builder
> >   - Needs more testing in staging, with jenkins pipeline
> >   - For now, just tag one box as the docker builder. In the future it
> >   won=E2=80=99t be an issue once everything is using containers
> >   - Every step should run inside a container
> >
> > - Guillaume - looking to convert 3 more jobs to pipeline
>
> FYI Re: docker builders.
>
> If you mount /var/run/docker.sock and /dev/kvm into the docker
> container, and then install docker in the container, then the dockerized
> builders could also pull/run docker images.   NOTE: that this
> technically isn't "docker in docker" because it's actually just
> (re)using the main host docker.
>
> Kevin
>
>
>=20
>
