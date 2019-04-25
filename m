MIME-Version: 1.0
References: <DBBPR04MB63298113754D73EF48762E40993D0@DBBPR04MB6329.eurprd04.prod.outlook.com>
In-Reply-To: <DBBPR04MB63298113754D73EF48762E40993D0@DBBPR04MB6329.eurprd04.prod.outlook.com>
From: "Milosz Wasilewski" <milosz.wasilewski@linaro.org>
Date: Thu, 25 Apr 2019 08:21:05 +0100
Message-ID: <CAJrz+7LvJw4vE0=1qFw5QeN658w_QFtbjsZVh2Zcwakn-W_vHQ@mail.gmail.com>
Subject: Re: [Lava-users] What's the difference between kernel ci's docker and official docker?
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-ID: <kernelci.groups.io>
To: Larry Shen <larry.shen@nxp.com>
Cc: "lava-users@lists.lavasoftware.org" <lava-users@lists.lavasoftware.org>, kernelci@groups.io

+kernelci

On Thu, 25 Apr 2019 at 03:33, Larry Shen <larry.shen@nxp.com> wrote:
>
> Hi,
>
>
>
> I=E2=80=99d like to know is this site official? https://github.com/kernel=
ci/lava-docker
>

This is the 1st historical implementation. At the time KCI created
docker container there were no containers coming from LAVA project.

>
>
> Does this project same as the one in dockerhub, lavasoftware/lava-server?

I'm not exactly sure what the differences are between kernelci and
official LAVA containers. I suspect the might at least differ when it
comes to the version of LAVA release inside.
lavasoftware/lava-{server,dispatcher} are official containers provided
by LAVA project.

milosz

>
> _______________________________________________
> Lava-users mailing list
> Lava-users@lists.lavasoftware.org
> https://lists.lavasoftware.org/mailman/listinfo/lava-users
