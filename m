Return-Path: <khilman@baylibre.com>
From: "Kevin Hilman" <khilman@baylibre.com>
Subject: =?UTF-8?B?UmU6IOetlOWkjTogW0hlbHBdIEhvdyB0byB1c2Uga2VybmVsY2kgdG8gZWFzdGFibGlzaCBhIGxvY2FsIENJIGxhYj8=?=
In-Reply-To: <62079D2F712F7747B0BDCC6821B8DF0D013FB32B@G08CNEXMBPEKD02.g08.fujitsu.local>
References: <11625.1547100077211683125@groups.io> <20190110154222.atzjtmmjbkcxl3zx@xps.therub.org> <62079D2F712F7747B0BDCC6821B8DF0D013FB32B@G08CNEXMBPEKD02.g08.fujitsu.local>
Date: Mon, 14 Jan 2019 13:55:26 -0800
Message-ID: <7hlg3mkipd.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
List-ID: <kernelci.groups.io>
To: kernelci@groups.io, lixm.fnst@cn.fujitsu.com, "kernelci@groups.io" <kernelci@groups.io>, "dan.rue@linaro.org" <dan.rue@linaro.org>

Hi Li,

"Li, Xiaoming" <lixm.fnst@cn.fujitsu.com> writes:

> Reply is inline
>
>> On Wed, Jan 09, 2019 at 10:01:17PM -0800, Li, Xiaoming wrote:
>> > hi,all
>> >
>> > I am a rookie to kernelci.
>> > I have already install kernelci-docker and lava, then what should=C2=
=A0 I do=C2=A0 to
>> connetc them together?
>> > I have investigate the kernelci-wiki and kernelci related presentation=
s, but still
>> got no clues.
>> > Could anyone give some hints or link?
>> > Thank you all.
>>=20
>> Hi Li Xiaoming!
>>=20
>> I'm working on something similar and so maybe we can work together on th=
is.
>>=20
>> Do you have a lava instance online with boards attached already? It's no=
t clear
>> if you already have LAVA, and are trying to add it as a kernelci lab, or=
 if you're
>> asking how to set up LAVA.
>
> I know how to install LAVA, by lava-docker or the linaro's default method.
> Our lab has servral lava instance, so I can connect kernelci with lava ei=
ther local or remote, if possible.
> Yes=EF=BC=8CI want to know how add lava to kernelci lab.

There are several steps in the process, but it's not clear (to me) which
steps you're asking about, so let me crudely summarize the steps, and
see which ones you're having questions about:

- kernelci-core: jenkins jobs to watch kernel trees for changes

- kernelci-core: create LAVA jobs and submit to multiple LAVA labs
  API: LAVA's XML-RPC API.
  Auth: requies LAVA auth token to be shared with kernelci-core admins

- LAVA labs: run LAVA jobs on hardware/VMs etc.

- LAVA labs: submit results to kernelci-backend
  (NOTE: the LAVA jobs include "notify" sections which tell the LAVA
   where to post results after each LAVA Job)

  API: REST API (api.kernelci.org).  In particular /boot, /test
  Auth: kernelci-backend admin generates token to be shared with LAVA
        lab=20

For the main kernelci.org site, there is a main instance of the
kernelci-backend and kernelci-frontend, so you don't have to run those
(via kernelci-docker) if you're just hoping to contribute to the main
site.  However, you still need to exchange tokens for both the "Auth"
steps I list above.

If however, you want to run your own kernelci-backend and -frontend,
which I gather you do since you've setup kernelci-docker, then you can
create and share all the auth tokens yourself.

I hope that clarifies the process a little bit.  When we know which
steps you're struggling with, we can answer more detailed questions.

BTW, for kernelci-docker, I strongly recommend using this fork for now:
https://github.com/lucj/kernelci-docker.   We (BayLibre) have been
working on that fork and are using it regularily.  I recommend using
that until we get those enhancements merged back into the main repo.

Thanks,

Kevin



