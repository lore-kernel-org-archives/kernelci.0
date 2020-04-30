MIME-Version: 1.0
References: <CAPDyKFoP_zTja189oGvUm0NuOe1ihi8u-XfPUwxbz3DVHrjP_w@mail.gmail.com>
In-Reply-To: <CAPDyKFoP_zTja189oGvUm0NuOe1ihi8u-XfPUwxbz3DVHrjP_w@mail.gmail.com>
From: "Guillaume Tucker" <guillaume.tucker@gmail.com>
Date: Thu, 30 Apr 2020 14:28:32 +0100
Message-ID: <CAH1_8nDa6f3gJJtdpS8UDDj6ZhTCCW-VPK5Ps_jqxPhH2SETpw@mail.gmail.com>
Subject: Re: MMC tree not building anymore
Content-Type: multipart/alternative; boundary="00000000000026b05c05a4820bc2"
List-ID: <kernelci.groups.io>
To: kernelci@groups.io, ulf.hansson@linaro.org
Cc: info <info@kernelci.org>

--00000000000026b05c05a4820bc2
Content-Type: text/plain; charset="UTF-8"

Hi Ulf,

On Thu, Apr 30, 2020 at 2:14 PM Ulf Hansson <ulf.hansson@linaro.org> wrote:

> Hi KernelCI folkz,
>
> My MMC tree seems not to be included in the kernelCI infrastructure
> anymore, as I receive no more reports.
> Would it possible to re-enable my tree?
>

Sorry, some of our kernel builders had to be turned off
temporarily and as a result we've had to scale down the number of
branches being monitored.  We have now started re-enabling some
gradually to see how much the system can cope with, until we add
a new set of builders and go back to normal.

I've just enabled your ulfh/next branch again, it should be fine
if you don't push new revisions more than once a day to limit the
total number of builds.

Actually, maybe this would also be the opportunity to review the
number of kernels built from your branch.  Do you need all the
CPU architectures and all the defconfigs to be built?  For
example, some maintainers are happy with just the main defconfigs
such as linusw:


https://kernelci.org/build/linusw/branch/for-next/kernel/v5.7-rc2-34-g9e581cd14663/

Some even just need 3 builds, for arm, arm64 and x86_64.  This is
typically the best tests/build ratio.  Having fewer builds also
means you'll get email reports quicker.  It's easy enough to
adjust the KernelCI configuration to make it optimal, please let
us know.

Thanks,
Guillaume

--00000000000026b05c05a4820bc2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Ulf,</div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Thu, Apr 30, 2020 at 2:14 PM Ulf Hansson &=
lt;<a href=3D"mailto:ulf.hansson@linaro.org">ulf.hansson@linaro.org</a>&gt;=
 wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi Kerne=
lCI folkz,<br>
<br>
My MMC tree seems not to be included in the kernelCI infrastructure<br>
anymore, as I receive no more reports.<br>
Would it possible to re-enable my tree?<br></blockquote><div><br></div>Sorr=
y, some of our kernel builders had to be turned off<br>temporarily and as a=
 result we&#39;ve had to scale down the number of<br>branches being monitor=
ed.=C2=A0 We have now started re-enabling some<br>gradually to see how much=
 the system can cope with, until we add<br>a new set of builders and go bac=
k to normal.<br><br>I&#39;ve just enabled your ulfh/next branch again, it s=
hould be fine<br>if you don&#39;t push new revisions more than once a day t=
o limit the<br>total number of builds.<br><br>Actually, maybe this would al=
so be the opportunity to review the<br>number of kernels built from your br=
anch.=C2=A0 Do you need all the<br>CPU architectures and all the defconfigs=
 to be built?=C2=A0 For<br>example, some maintainers are happy with just th=
e main defconfigs<br>such as linusw:<br><br>=C2=A0 =C2=A0 <a href=3D"https:=
//kernelci.org/build/linusw/branch/for-next/kernel/v5.7-rc2-34-g9e581cd1466=
3/">https://kernelci.org/build/linusw/branch/for-next/kernel/v5.7-rc2-34-g9=
e581cd14663/</a><br><br><div>Some even just need 3 builds, for arm, arm64 a=
nd x86_64.=C2=A0 This is<br>typically the best tests/build ratio.=C2=A0 Hav=
ing fewer builds also<br>means you&#39;ll get email reports quicker.=C2=A0 =
It&#39;s easy enough to<br>adjust the KernelCI configuration to make it opt=
imal, please let<br>us know.<br></div><div><br></div><div>Thanks,</div><div=
>Guillaume</div></div></div>

--00000000000026b05c05a4820bc2--
