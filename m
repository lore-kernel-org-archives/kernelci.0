MIME-Version: 1.0
References: <20190423173631.kgcbxmewtota4rhc@xps.therub.org>
In-Reply-To: <20190423173631.kgcbxmewtota4rhc@xps.therub.org>
From: anders.roxell@gmail.com
Date: Wed, 24 Apr 2019 11:13:00 +0200
Message-ID: <CAEUf8FuMFS5HvuE1etA1dTQrC44PcMThzMrNRX9WsN7tTUdT_A@mail.gmail.com>
Subject: Re: Weekly Meeting 2019-04-23 #minutes
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-ID: <kernelci.groups.io>
To: kernelci@groups.io, dan.rue@linaro.org

On Tue, Apr 23, 2019 at 7:36 PM Dan Rue <dan.rue@linaro.org> wrote:
>
> - Attendees: Guillaume, Mark, Daniel, Dan, Guenter, Matt, Anders, Kevin,
>   Michal
>
> - gtucker
>   - kci_build PR now being tested on staging
>   - Email recipients for staging reports?
>     - [drue] +1 please add me
>     - [Matt] as well
>     - [broonie] Sure, my mail server deserves to be punished
>     - [khilman] yes, please
>   - [drue] any update/info on the downtime on ci.kernelci.org from the
>     weekend?
>     - [Matt] I noticed the 2 baylibre builders havent come up
>       - one is connected to staging
>       - [khilman] other one is old/unused, I just deleted
>       - [Matt] ack
>     - Box became unavailable in hetzner. Needed to do a reboot through
>       collabora=E2=80=99s hetzner interface to recover. Unknown root cau=
se.
>
> - Anders
>   - Quickhit on x86 it takes 4-16min
>   - Ltp-math 4-11min
>   - Ltp-ipc 3-6min, hikey 8-11m
>   - Ltp-timers 3-11min

urgh, I have to correct my self. The actuall ipc test suite takes less tha=
n a
minute to run on all the boards in lkft. The rest of the time is for flash=
ing
and booting and stuff.

Cheers,
Anders

>   - [drue] what=E2=80=99s going on with ltp rootfs pr?
>     - [anders] On me to get back with some numbers=E2=80=A6 like above I=
 guess
>       =3D)
>   - Need to demonstrate it running under the debos build on an arm64
>     host
>
> - Broonie
>   - Who has admin access to the builders/core services?
>     - [anders] where=E2=80=99s the doc?
>       - Private google doc that contains lots of admin secrets. Matt
>         will create new doc with contact details for server owners which
>         more people can view.
>         - [drue] maybe secrets should be managed more properly too=E2=80=
=
=A6 i
>           don=E2=80=99t have a suggestion
>         - [Matt] Suggestions welcome :D
>           - Lastpass or 1password? Dunno if either=E2=80=99s free versio=
n would
>             cover this usecase.
>           - [broonie] Not sure either of them is substantially better
>             than the doc for secrets - fundamentally it=E2=80=99s just a=
bout
>             sharing access to something where you can read everything,
>             the ACL support in google docs is actually pretty advanced.
>
> - Misc Discussion
>   - Docker daemon on the build slave died quietly on staging gce host
>     last week. Not happening in production gce - unknown cause.
>   - [Kevin] Any updates on elastic search work
>     - [matt] I will ask the Linaro guys to join meeting next week
>   - LF project
>     - MSFT joining
>     - Kevin had brief call w/Redhat (Veronica) about joining
>
>
>=20
>
