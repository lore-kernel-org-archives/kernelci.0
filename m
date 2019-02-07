MIME-Version: 1.0
References: <e32f672f-da87-7f89-c9b3-93a0a56aaad0@collabora.com>
In-Reply-To: <e32f672f-da87-7f89-c9b3-93a0a56aaad0@collabora.com>
From: "Anibal Limon" <anibal.limon@linaro.org>
Date: Thu, 7 Feb 2019 13:49:23 -0600
Message-ID: <CA+_AqiusdwymYU_xmCRmnn70dMHz28km03dMbXVx_bs88V7fsw@mail.gmail.com>
Subject: Re: Baseline test plan and bootrr
Content-Type: multipart/alternative; boundary="00000000000043512f05815324cc"
List-ID: <kernelci.groups.io>
To: kernelci@groups.io, Guillaume Tucker <guillaume.tucker@gmail.com>, Enric Balletbo i Serra <enric.balletbo@collabora.com>
Cc: Nicolas Dechesne <nicolas.dechesne@linaro.org>, Bjorn Andersson <bjorn.andersson@linaro.org>

--00000000000043512f05815324cc
Content-Type: text/plain; charset="UTF-8"

Hi Guillaume and Enric,

I have been working on bootrr testing for Linux mainline and our
integration branch in dragonboard{410,820}c devices [1][2], basically it
takes KernelCI binaries (kernel, dt, modules) and
built an Android boot image with our generated ramdisk (using
Openembedded). [3]

I'm trying to push back results to Kernel CI using notify block in LAVA
definition without success [4] (I need to debug), will be good if KernelCI
creates an bootrr test plan taking into account the possibility to specify
the bootrr repo/branch and ramdisk to use.

Regards,
Anibal

[1 ]https://validation.linaro.org/scheduler/job/1905654
[2] https://validation.linaro.org/scheduler/job/1905579
[3] http://snapshots.linaro.org/member-builds/qcomlt/testimages/arm64/17/
[4] https://validation.linaro.org/scheduler/job/1905579/definition#defline13


On Thu, 7 Feb 2019 at 12:55, Guillaume Tucker <guillaume.tucker@gmail.com>
wrote:

> Hi,
>
> Currently, boot tests entirely rely on the LAVA logic to detect
> when a login prompt has been reached.  While this mostly works,
> it does not guarantee that the platform is actually usable or
> that everything went smoothly during the boot.
>
> For this reason, it would seem useful to introduce a "baseline"
> test plan which would essentially boot and then do some fast
> checks to verify that nothing is obviously broken.  This can
> include things like grepping the kernel log for any errors and
> checking that drivers have been initialised correctly.  There's a
> lot that can be done in a few seconds with a basic ramdisk.
>
>
> So we could have a list of regular expressions to detect any
> issues in the kernel log and report a LAVA test case result for
> each of them.  The log fragment associated with each match should
> also be available to include the actual errors in a report.
> Doing this on the device means we keep the test definition in the
> same location as the other test plans, and we can run it like any
> test suite.
>
>
> Another useful tool is bootrr, which my colleague Enric has
> started to use on some Chromebook devices.  It can check that
> drivers have been loaded and devices probed correctly.  It's
> entirely written in shell scripts so it can be run in our current
> buildroot rootfs and can easily be extended to run other checks.
> It looks up the device tree platform name and uses that to call a
> platform-specific script with relevant drivers and devices.
> Here's Enric's branch with such scripts for a few devices and a
> LAVA test definition:
>
>   https://github.com/eballetbo/bootrr/commits/master
>
> and some sample runs with buildroot:
>
>   https://lava.collabora.co.uk/scheduler/job/1478554
>   https://lava.collabora.co.uk/scheduler/job/1478553
>
>
> Does this look like something worth running in KernelCI?  Should
> we just have a bootrr test plan or go for the "baseline" test
> plan I'm suggesting, to be run on all devices and ultimately
> instead of the current boot-to-login jobs?
>
> Best wishes,
> Guillaume
>
> 
>
>

--00000000000043512f05815324cc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div di=
r=3D"ltr">Hi Guillaume and Enric,<div><br></div><div>I have been working on=
 bootrr testing for Linux mainline and our integration branch in dragonboar=
d{410,820}c devices [1][2], basically it takes KernelCI binaries (kernel, d=
t, modules) and</div><div>built an Android boot image with our generated ra=
mdisk (using Openembedded). [3]</div><div><br></div><div>I&#39;m trying to =
push back results to Kernel CI using notify block in LAVA definition withou=
t success [4] (I need to debug), will be good if KernelCI creates an bootrr=
 test plan taking into account the possibility to specify the bootrr repo/b=
ranch and ramdisk to use.</div><div><br></div><div>Regards,</div><div>Aniba=
l</div><div><br></div><div>[1 ]<a href=3D"https://validation.linaro.org/sch=
eduler/job/1905654">https://validation.linaro.org/scheduler/job/1905654</a>=
</div><div>[2]=C2=A0<a href=3D"https://validation.linaro.org/scheduler/job/=
1905579">https://validation.linaro.org/scheduler/job/1905579</a></div><div>=
[3]=C2=A0<a href=3D"http://snapshots.linaro.org/member-builds/qcomlt/testim=
ages/arm64/17/">http://snapshots.linaro.org/member-builds/qcomlt/testimages=
/arm64/17/</a><br></div><div>[4]=C2=A0<a href=3D"https://validation.linaro.=
org/scheduler/job/1905579/definition#defline13">https://validation.linaro.o=
rg/scheduler/job/1905579/definition#defline13</a></div><div>=C2=A0</div></d=
iv></div></div></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Thu, 7 Feb 2019 at 12:55, Guillaume Tucker &lt;<a h=
ref=3D"mailto:guillaume.tucker@gmail.com">guillaume.tucker@gmail.com</a>&gt=
; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi,<br>
<br>
Currently, boot tests entirely rely on the LAVA logic to detect<br>
when a login prompt has been reached.=C2=A0 While this mostly works,<br>
it does not guarantee that the platform is actually usable or<br>
that everything went smoothly during the boot.<br>
<br>
For this reason, it would seem useful to introduce a &quot;baseline&quot;<=
br>
test plan which would essentially boot and then do some fast<br>
checks to verify that nothing is obviously broken.=C2=A0 This can<br>
include things like grepping the kernel log for any errors and<br>
checking that drivers have been initialised correctly.=C2=A0 There&#39;s a=
<br>
lot that can be done in a few seconds with a basic ramdisk.<br>
<br>
<br>
So we could have a list of regular expressions to detect any<br>
issues in the kernel log and report a LAVA test case result for<br>
each of them.=C2=A0 The log fragment associated with each match should<br>
also be available to include the actual errors in a report.<br>
Doing this on the device means we keep the test definition in the<br>
same location as the other test plans, and we can run it like any<br>
test suite.<br>
<br>
<br>
Another useful tool is bootrr, which my colleague Enric has<br>
started to use on some Chromebook devices.=C2=A0 It can check that<br>
drivers have been loaded and devices probed correctly.=C2=A0 It&#39;s<br>
entirely written in shell scripts so it can be run in our current<br>
buildroot rootfs and can easily be extended to run other checks.<br>
It looks up the device tree platform name and uses that to call a<br>
platform-specific script with relevant drivers and devices.<br>
Here&#39;s Enric&#39;s branch with such scripts for a few devices and a<br=
>
LAVA test definition:<br>
<br>
=C2=A0 <a href=3D"https://github.com/eballetbo/bootrr/commits/master" rel=
=3D"noreferrer" target=3D"_blank">https://github.com/eballetbo/bootrr/comm=
its/master</a><br>
<br>
and some sample runs with buildroot:<br>
<br>
=C2=A0 <a href=3D"https://lava.collabora.co.uk/scheduler/job/1478554" rel=
=3D"noreferrer" target=3D"_blank">https://lava.collabora.co.uk/scheduler/j=
ob/1478554</a><br>
=C2=A0 <a href=3D"https://lava.collabora.co.uk/scheduler/job/1478553" rel=
=3D"noreferrer" target=3D"_blank">https://lava.collabora.co.uk/scheduler/j=
ob/1478553</a><br>
<br>
<br>
Does this look like something worth running in KernelCI?=C2=A0 Should<br>
we just have a bootrr test plan or go for the &quot;baseline&quot; test<br=
>
plan I&#39;m suggesting, to be run on all devices and ultimately<br>
instead of the current boot-to-login jobs?<br>
<br>
Best wishes,<br>
Guillaume<br>
<br>
<br>
<br>
</blockquote></div>

--00000000000043512f05815324cc--
