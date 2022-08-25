MIME-Version: 1.0
References: <bc992951-6d3b-4ccc-c3b6-ae8dbe32ec1c@collabora.com>
In-Reply-To: <bc992951-6d3b-4ccc-c3b6-ae8dbe32ec1c@collabora.com>
From: "Alice Ferrazzi" <alice.ferrazzi@miraclelinux.com>
Date: Thu, 25 Aug 2022 23:37:19 +0900
Message-ID: <CANgtXuMD7DCovSi8=82B6Z5bj01=edZqBj=3NZ0ug=N+jezqaA@mail.gmail.com>
Subject: Re: Moving lava-docker out of the KernelCI GitHub organisation
Content-Type: text/plain; charset="UTF-8"
List-ID: <kernelci.groups.io>
To: Guillaume Tucker <guillaume.tucker@collabora.com>
Cc: Remi Duraffort <remi.duraffort@linaro.org>, Corentin Labbe <clabbe@baylibre.com>, Antonio Terceiro <antonio.terceiro@linaro.org>, Kevin Hilman <khilman@baylibre.com>, "kernelci-tsc@groups.io" <kernelci-tsc@groups.io>, "kernelci@groups.io" <kernelci@groups.io>

Hello Guillaume,

On Thu, Aug 25, 2022 at 11:05 PM Guillaume Tucker
<guillaume.tucker@collabora.com> wrote:
>
> Hello,
>
> The idea of adding BayLibre's lava-healthchecks-binary[1]
> repository to the KernelCI GitHub organisation was brought up
> during a KernelCI weekly meeting last month.  This appears to be
> related to the lava-docker[2] project which is currently in the
> KernelCI organisation, to bring the two repositories together.

That's was because I was trying to solve a problem with
lava-healthckecks-binary,
by creating a new format for managing multiple healthcheck binary
automatically instead of statically
moving such binary from the Dockerfile one by one.
Done by the following pull request (
https://github.com/kernelci/lava-docker/pull/154 ) that is creating a
new healthcheck-binary repository format that can give the possibility
to easily manage multiple lava-healthckecks-binary binary and giving
the possibility to easily fork the repository with new binaries but
still keeping the compatibility with lava-docker.
I also sended a pull request to lava-healthckecks-binary
https://github.com/BayLibre/lava-healthchecks-binary/pull/1
but as lava-healthckecks-binary looks only partially maintained, that
was the reason of why I asked if we could maintain
lava-healthckecks-binary under kernelci, togheter with lava-docker for
better maintaining and keeping maintained lava-docker and lava-docker
related repositories.

>
> It seems to me that lava-docker and anything related to providing
> LAVA support is not something that KernelCI should be responsible
> for as a project.  In fact, the lava-docker repository has been
> managed entirely autonomously since the beginning by different
> maintainers than the core KernelCI repositories, and I believe it
> was originally added to the KernelCI org by Kevin as it was an
> easy thing to do that made sense at the time.

lava-docker is still documented in the KernelCI TSC documentation
https://kernelci.org/docs/org/tsc/#lava-docker and currently lava is
the only documented working laboratory in the KernelCI documentation.
https://kernelci.org/docs/labs/
That would suggest to me that is currently to early for making
KernelCI currently main laboratory system easy orchestration
implementation (lava-docker) depart from KernelCI organization. As
discussed during the recent KernelCI weekly meeting.

>
> Rather than having one more LAVA-related project under this org,
> how about either creating a dedicated GitHub organisation for
> lava-docker and related repositories, or adding lava-docker and
> the healthchecks to the LAVA GitLab instance on
> https://git.lavasoftware.org/?
>
> Having a dedicated org on GitHub would give the actual
> maintainers of the project full control over it, to add and move
> repositories, manage members, permissions etc. as they wish.
>
> However, if the LAVA maintainers think that lava-docker could
> become the main solution for running LAVA in Docker, then maybe
> it should be merged with some existing project on
> git.lavasoftware.org or added as a new project there.  That would
> give it more visibility and potentially remove duplicated
> efforts.
>
> I'm not sure I'm aware of all the implications for each of these
> options so I thought I would bring it up for discussion here.
> What do you think?

if we decide to move lava-docker to is own organization or to
git.lavasoftware.org,
I would like to propose to having KernelCI writing a news about the
decision for enabling the currently users of lava-docker to move to
the new upstream version and make it clear that lava-docker will be
still maintained under the new organization and suggested by KernelCI.
As discussed during the recent KernelCI weekly meeting.

Thanks,
Alice
-- 
======================================
Cybertrust Japan Co.,Ltd.
Alice Ferrazzi
alice.ferrazzi@miraclelinux.com
======================================
