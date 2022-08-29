MIME-Version: 1.0
References: <bc992951-6d3b-4ccc-c3b6-ae8dbe32ec1c@collabora.com> <YwkTphNM4mRI3aF4@linaro.org>
In-Reply-To: <YwkTphNM4mRI3aF4@linaro.org>
From: "Alice Ferrazzi" <alice.ferrazzi@miraclelinux.com>
Date: Mon, 29 Aug 2022 15:18:22 +0900
Message-ID: <CANgtXuN=z-JzBs5R534TUje8M90jVUMM8Z-cRs=LR3Ut5D-fvg@mail.gmail.com>
Subject: Re: Moving lava-docker out of the KernelCI GitHub organisation
Content-Type: text/plain; charset="UTF-8"
List-ID: <kernelci.groups.io>
To: Antonio Terceiro <antonio.terceiro@linaro.org>
Cc: Guillaume Tucker <guillaume.tucker@collabora.com>, Remi Duraffort <remi.duraffort@linaro.org>, Corentin Labbe <clabbe@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, "kernelci-tsc@groups.io" <kernelci-tsc@groups.io>, "kernelci@groups.io" <kernelci@groups.io>

Hello Antonio,

On Sat, Aug 27, 2022 at 3:40 AM Antonio Terceiro
<antonio.terceiro@linaro.org> wrote:
>
> On Thu, Aug 25, 2022 at 04:05:47PM +0200, Guillaume Tucker wrote:
> > Hello,
> >
> > The idea of adding BayLibre's lava-healthchecks-binary[1]
> > repository to the KernelCI GitHub organisation was brought up
> > during a KernelCI weekly meeting last month.  This appears to be
> > related to the lava-docker[2] project which is currently in the
> > KernelCI organisation, to bring the two repositories together.
> >
> > It seems to me that lava-docker and anything related to providing
> > LAVA support is not something that KernelCI should be responsible
> > for as a project.  In fact, the lava-docker repository has been
> > managed entirely autonomously since the beginning by different
> > maintainers than the core KernelCI repositories, and I believe it
> > was originally added to the KernelCI org by Kevin as it was an
> > easy thing to do that made sense at the time.
> >
> > Rather than having one more LAVA-related project under this org,
> > how about either creating a dedicated GitHub organisation for
> > lava-docker and related repositories, or adding lava-docker and
> > the healthchecks to the LAVA GitLab instance on
> > https://git.lavasoftware.org/?
> >
> > Having a dedicated org on GitHub would give the actual
> > maintainers of the project full control over it, to add and move
> > repositories, manage members, permissions etc. as they wish.
> >
> > However, if the LAVA maintainers think that lava-docker could
> > become the main solution for running LAVA in Docker, then maybe
> > it should be merged with some existing project on
> > git.lavasoftware.org or added as a new project there.  That would
> > give it more visibility and potentially remove duplicated
> > efforts.
>
> FWIW, there is also
> https://git.lavasoftware.org/lava/pkg/docker-compose which seems
> similar, but not the same, as kernelci's lava-docker (e.g. there is no
> autogeneration of config files AFAICT). That's used by a few people, but
> mostly for development purposes I think.
>

yes, from what I could see is a different approach.
We are offering a orchestration system that is generated
programmatically by a yaml file (boards.yaml)
that is creating the necessary docker-compose settings and unloading
the already set up lava
files and folders.

> > I'm not sure I'm aware of all the implications for each of these
> > options so I thought I would bring it up for discussion here.
> > What do you think?
>
> I don't really have an opinion on what to do with lava-docker. In
> principle, consolidation and collaboration is good, but we would need to
> agree on the details. Also, moving it around must be done in a way that
> the current maintainers still have the necessary access to keep
> maintaining it (because the move won't make new maintainers magically
> appear).

I agree on doing it in a way that the current maintainers have still
the necessary access rights for continue
the development,
I also would like to do it in a way that the current lava-docker users
don't get confused on
where the upstream repository moved to.

Thanks,
Alice
-- 
======================================
Cybertrust Japan Co.,Ltd.
Alice Ferrazzi
alice.ferrazzi@miraclelinux.com
======================================
