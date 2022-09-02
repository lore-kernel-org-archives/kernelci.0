MIME-Version: 1.0
References: <bc992951-6d3b-4ccc-c3b6-ae8dbe32ec1c@collabora.com>
 <YwkTphNM4mRI3aF4@linaro.org> <CANgtXuN=z-JzBs5R534TUje8M90jVUMM8Z-cRs=LR3Ut5D-fvg@mail.gmail.com>
 <CANJfhHfPWEmTkvXW1fNeQ7H2p4teOYTU9Dt26D-S1ZdPogD6_Q@mail.gmail.com>
In-Reply-To: <CANJfhHfPWEmTkvXW1fNeQ7H2p4teOYTU9Dt26D-S1ZdPogD6_Q@mail.gmail.com>
From: "Alice Ferrazzi" <alice.ferrazzi@miraclelinux.com>
Date: Fri, 2 Sep 2022 13:33:37 +0900
Message-ID: <CANgtXuN0L=2Udvo5vL_HjBwvHiA7EPf=CYhW+aMkpvvGNScsrQ@mail.gmail.com>
Subject: Re: Moving lava-docker out of the KernelCI GitHub organisation
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-ID: <kernelci.groups.io>
To: Remi Duraffort <remi.duraffort@linaro.org>
Cc: Antonio Terceiro <antonio.terceiro@linaro.org>, Guillaume Tucker <guillaume.tucker@collabora.com>, Corentin Labbe <clabbe@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, "kernelci-tsc@groups.io" <kernelci-tsc@groups.io>, "kernelci@groups.io" <kernelci@groups.io>

On Thu, Sep 1, 2022 at 11:56 PM Remi Duraffort <remi.duraffort@linaro.org>
wrote:
>
> Hello,
>
> Le lun. 29 ao=C3=BBt 2022 =C3=A0 08:18, Alice Ferrazzi <
alice.ferrazzi@miraclelinux.com> a =C3=A9crit :
>>
>> Hello Antonio,
>>
>> On Sat, Aug 27, 2022 at 3:40 AM Antonio Terceiro
>> <antonio.terceiro@linaro.org> wrote:
>> >
>> > On Thu, Aug 25, 2022 at 04:05:47PM +0200, Guillaume Tucker wrote:
>> > > Hello,
>> > >
>> > > The idea of adding BayLibre's lava-healthchecks-binary[1]
>> > > repository to the KernelCI GitHub organisation was brought up
>> > > during a KernelCI weekly meeting last month.  This appears to be
>> > > related to the lava-docker[2] project which is currently in the
>> > > KernelCI organisation, to bring the two repositories together.
>> > >
>> > > It seems to me that lava-docker and anything related to providing
>> > > LAVA support is not something that KernelCI should be responsible
>> > > for as a project.  In fact, the lava-docker repository has been
>> > > managed entirely autonomously since the beginning by different
>> > > maintainers than the core KernelCI repositories, and I believe it
>> > > was originally added to the KernelCI org by Kevin as it was an
>> > > easy thing to do that made sense at the time.
>> > >
>> > > Rather than having one more LAVA-related project under this org,
>> > > how about either creating a dedicated GitHub organisation for
>> > > lava-docker and related repositories, or adding lava-docker and
>> > > the healthchecks to the LAVA GitLab instance on
>> > > https://git.lavasoftware.org/?
>> > >
>> > > Having a dedicated org on GitHub would give the actual
>> > > maintainers of the project full control over it, to add and move
>> > > repositories, manage members, permissions etc. as they wish.
>> > >
>> > > However, if the LAVA maintainers think that lava-docker could
>> > > become the main solution for running LAVA in Docker, then maybe
>> > > it should be merged with some existing project on
>> > > git.lavasoftware.org or added as a new project there.  That would
>> > > give it more visibility and potentially remove duplicated
>> > > efforts.
>> >
>> > FWIW, there is also
>> > https://git.lavasoftware.org/lava/pkg/docker-compose which seems
>> > similar, but not the same, as kernelci's lava-docker (e.g. there is no
>> > autogeneration of config files AFAICT). That's used by a few people,
but
>> > mostly for development purposes I think.
>> >
>>
>> yes, from what I could see is a different approach.
>> We are offering a orchestration system that is generated
>> programmatically by a yaml file (boards.yaml)
>> that is creating the necessary docker-compose settings and unloading
>> the already set up lava
>> files and folders.
>>
>> > > I'm not sure I'm aware of all the implications for each of these
>> > > options so I thought I would bring it up for discussion here.
>> > > What do you think?
>> >
>> > I don't really have an opinion on what to do with lava-docker. In
>> > principle, consolidation and collaboration is good, but we would need
to
>> > agree on the details. Also, moving it around must be done in a way tha=
t
>> > the current maintainers still have the necessary access to keep
>> > maintaining it (because the move won't make new maintainers magically
>> > appear).
>>
>> I agree on doing it in a way that the current maintainers have still
>> the necessary access rights for continue
>> the development,
>> I also would like to do it in a way that the current lava-docker users
>> don't get confused on
>> where the upstream repository moved to.
>>
>> Thanks,
>> Alice
>> --
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> Cybertrust Japan Co.,Ltd.
>> Alice Ferrazzi
>> alice.ferrazzi@miraclelinux.com
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
>
> With Antonio we agreed that we can host the lava-docker project along
with lava if that's what the maintainers want.
> But keep in mind that we (Antonio and myself) don't have time to make any
changes/maintenance on this project. If lava-docker is moved into the lava
namespace, maybe the project should be documented into the lava official
documentation.
>
> We are planning to migrate the lava project from a self-hosted gitlab
instance to the gitlab.com instance soon. If lava-docker is moved into the
lava namespace it would be better to wait for the migration to gitlab.com
(to avoid two migrations).
>

I think is good to keep the current lava-docker KernelCI TSC maintainer as
main maintainer of the new repository (me and montjoie).
https://kernelci.org/docs/org/tsc/#lava-docker
I will help on the maintenance of lava-docker repository if you add me to
the lava-docker repository under lava namespace.
My gitlab username is https://gitlab.com/alice.ferrazzi it have enabled 2FA
for security.
We need to move also lava-healthchecks-binary repository that is currently
hosted under https://github.com/BayLibre/lava-healthchecks-binary as is
part of the lava-docker selfhosted healthcheck system.

Thanks,
Alice

--=20
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Cybertrust Japan Co.,Ltd.
Alice Ferrazzi
alice.ferrazzi@miraclelinux.com
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
