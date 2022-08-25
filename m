Message-ID: <bc992951-6d3b-4ccc-c3b6-ae8dbe32ec1c@collabora.com>
Date: Thu, 25 Aug 2022 16:05:47 +0200
MIME-Version: 1.0
From: "Guillaume Tucker" <guillaume.tucker@collabora.com>
Subject: Moving lava-docker out of the KernelCI GitHub organisation
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-ID: <kernelci.groups.io>
To: Remi Duraffort <remi.duraffort@linaro.org>, Alice Ferrazzi <alice.ferrazzi@miraclelinux.com>, Corentin Labbe <clabbe@baylibre.com>, Antonio Terceiro <antonio.terceiro@linaro.org>, Kevin Hilman <khilman@baylibre.com>
Cc: "kernelci-tsc@groups.io" <kernelci-tsc@groups.io>, "kernelci@groups.io" <kernelci@groups.io>

Hello,

The idea of adding BayLibre's lava-healthchecks-binary[1]
repository to the KernelCI GitHub organisation was brought up
during a KernelCI weekly meeting last month.  This appears to be
related to the lava-docker[2] project which is currently in the
KernelCI organisation, to bring the two repositories together.

It seems to me that lava-docker and anything related to providing
LAVA support is not something that KernelCI should be responsible
for as a project.  In fact, the lava-docker repository has been
managed entirely autonomously since the beginning by different
maintainers than the core KernelCI repositories, and I believe it
was originally added to the KernelCI org by Kevin as it was an
easy thing to do that made sense at the time.

Rather than having one more LAVA-related project under this org,
how about either creating a dedicated GitHub organisation for
lava-docker and related repositories, or adding lava-docker and
the healthchecks to the LAVA GitLab instance on
https://git.lavasoftware.org/?

Having a dedicated org on GitHub would give the actual
maintainers of the project full control over it, to add and move
repositories, manage members, permissions etc. as they wish.

However, if the LAVA maintainers think that lava-docker could
become the main solution for running LAVA in Docker, then maybe
it should be merged with some existing project on
git.lavasoftware.org or added as a new project there.  That would
give it more visibility and potentially remove duplicated
efforts.

I'm not sure I'm aware of all the implications for each of these
options so I thought I would bring it up for discussion here.
What do you think?


Thanks,
Guillaume

[1] https://github.com/BayLibre/lava-healthchecks-binary
[2] https://github.com/kernelci/lava-docker
