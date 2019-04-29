Return-Path: <khilman@baylibre.com>
From: "Kevin Hilman" <khilman@baylibre.com>
Subject: Re: [Lava-users] What's the difference between kernel ci's docker and official docker?
In-Reply-To: <CAJrz+7LvJw4vE0=1qFw5QeN658w_QFtbjsZVh2Zcwakn-W_vHQ@mail.gmail.com>
References: <DBBPR04MB63298113754D73EF48762E40993D0@DBBPR04MB6329.eurprd04.prod.outlook.com> <CAJrz+7LvJw4vE0=1qFw5QeN658w_QFtbjsZVh2Zcwakn-W_vHQ@mail.gmail.com>
Date: Mon, 29 Apr 2019 14:48:32 -0700
Message-ID: <7hftq0qy8f.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
List-ID: <kernelci.groups.io>
To: kernelci@groups.io, milosz.wasilewski@linaro.org, Larry Shen <larry.shen@nxp.com>
Cc: "lava-users@lists.lavasoftware.org" <lava-users@lists.lavasoftware.org>

"Milosz Wasilewski" <milosz.wasilewski@linaro.org> writes:

> +kernelci
>
> On Thu, 25 Apr 2019 at 03:33, Larry Shen <larry.shen@nxp.com> wrote:
>>
>> Hi,
>>
>>
>>
>> I=E2=80=99d like to know is this site official? https://github.com/kerne=
lci/lava-docker
>>
>
> This is the 1st historical implementation. At the time KCI created
> docker container there were no containers coming from LAVA project.

Correct.

>>
>> Does this project same as the one in dockerhub, lavasoftware/lava-server?
>
> I'm not exactly sure what the differences are between kernelci and
> official LAVA containers. I suspect the might at least differ when it
> comes to the version of LAVA release inside.
> lavasoftware/lava-{server,dispatcher} are official containers provided
> by LAVA project.

The kernelCI docker images have 2 parts

1) the base LAVA images
2) kernelCI specific customizations

For (1), we're currently building our own images, but are planning to
switch to the official ones supplied by the lavasoftware dockerhub.
The only reason we have our own is because these didn't exist when we
started doing docker images.

For (2), there's all sorts of stuff we're doing for the lava-docker
project that is not directly related to LAVA.  In particular, we're
providing an abstraction for describing your master/slave configuration
and DUTs via a YAML config file, so you really don't have to know
anything about LAVA.   All of that is lava-docker specific, and out of
the scope of what the lavasoftware dockerhub would provide.

For all the details on (2), see the main README here:
https://github.com/kernelci/lava-docker/

Kevin
