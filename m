Return-Path: <khilman@baylibre.com>
From: "Kevin Hilman" <khilman@baylibre.com>
Subject: Re: Moving lava-docker out of the KernelCI GitHub organisation
In-Reply-To: <CANJfhHfPWEmTkvXW1fNeQ7H2p4teOYTU9Dt26D-S1ZdPogD6_Q@mail.gmail.com>
References: <bc992951-6d3b-4ccc-c3b6-ae8dbe32ec1c@collabora.com>
 <YwkTphNM4mRI3aF4@linaro.org>
 <CANgtXuN=z-JzBs5R534TUje8M90jVUMM8Z-cRs=LR3Ut5D-fvg@mail.gmail.com>
 <CANJfhHfPWEmTkvXW1fNeQ7H2p4teOYTU9Dt26D-S1ZdPogD6_Q@mail.gmail.com>
Date: Sun, 04 Sep 2022 04:01:42 -0700
Message-ID: <7hv8q3h089.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
List-ID: <kernelci.groups.io>
To: Remi Duraffort <remi.duraffort@linaro.org>, Alice Ferrazzi <alice.ferrazzi@miraclelinux.com>
Cc: Antonio Terceiro <antonio.terceiro@linaro.org>, Guillaume Tucker <guillaume.tucker@collabora.com>, Corentin Labbe <clabbe@baylibre.com>, "kernelci-tsc@groups.io" <kernelci-tsc@groups.io>, "kernelci@groups.io" <kernelci@groups.io>

Remi Duraffort <remi.duraffort@linaro.org> writes:

[...]

> With Antonio we agreed that we can host the lava-docker project along with
> lava if that's what the maintainers want.

I think it makes sense to be under the LAVA as long as it's OK with
whoever maintains that.

> But keep in mind that we (Antonio and myself) don't have time to make any
> changes/maintenance on this project.

That's OK.  BayLibre will continue to maintain it.  If you don't want it
under the main lava org, we can put it under ours too.

> If lava-docker is moved into the lava namespace, maybe the project
> should be documented into the lava official documentation.

OK.  lava-docker is already using the base images provided by your team
already, we just build on that to make configuing a full LAVA env easier.

> We are planning to migrate the lava project from a self-hosted gitlab
> instance to the gitlab.com instance soon. If lava-docker is moved into the
> lava namespace it would be better to wait for the migration to gitlab.com
> (to avoid two migrations).

That makes sense,

Kevin
