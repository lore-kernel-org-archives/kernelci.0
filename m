MIME-Version: 1.0
References: <158129CBC2E3B0B8.7959@groups.io>
In-Reply-To: <158129CBC2E3B0B8.7959@groups.io>
From: "Guillaume Tucker" <guillaume.tucker@gmail.com>
Date: Tue, 12 Feb 2019 13:46:26 +0000
Message-ID: <CAH1_8nCtNfBQwO=o3GCLfcrCc2L9==zRafZaULRT-5kwo995Kw@mail.gmail.com>
Subject: Re: Baseline test plan and bootrr
Content-Type: multipart/alternative; boundary="00000000000086b0940581b2a798"
List-ID: <kernelci.groups.io>
To: kernelci@groups.io, Guillaume Tucker <guillaume.tucker@gmail.com>
Cc: Enric Balletbo i Serra <enric.balletbo@collabora.com>

--00000000000086b0940581b2a798
Content-Type: text/plain; charset="UTF-8"

On Thu, Feb 7, 2019 at 6:55 PM Guillaume Tucker via Groups.Io
<guillaume.tucker=gmail.com@groups.io> wrote:

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

Any thoughts on this part?  Does anyone see any issue with having
a series of patterns to grep the kernel log and have a test case
result for each of them in LAVA? (i.e. pass if pattern was not
matched...)

Guillaume

--00000000000086b0940581b2a798
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr">On Thu, Feb 7, 2019 at 6:55 PM Guillaume =
Tucker via Groups.Io &lt;guillaume.tucker=3D<a href=3D"mailto:gmail.com@gro=
ups.io">gmail.com@groups.io</a>&gt; wrote:<br></div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,=
204,204);padding-left:1ex">Hi,<br>
<br>
Currently, boot tests entirely rely on the LAVA logic to detect<br>
when a login prompt has been reached.=C2=A0 While this mostly works,<br>
it does not guarantee that the platform is actually usable or<br>
that everything went smoothly during the boot.<br>
<br>
For this reason, it would seem useful to introduce a &quot;baseline&quot;<b=
r>
test plan which would essentially boot and then do some fast<br>
checks to verify that nothing is obviously broken.=C2=A0 This can<br>
include things like grepping the kernel log for any errors and<br>
checking that drivers have been initialised correctly.=C2=A0 There&#39;s a<=
br>
lot that can be done in a few seconds with a basic ramdisk.<br>
<br>
<br>
So we could have a list of regular expressions to detect any<br>
issues in the kernel log and report a LAVA test case result for<br>
each of them.=C2=A0 The log fragment associated with each match should<br>
also be available to include the actual errors in a report.<br>
Doing this on the device means we keep the test definition in the<br>
same location as the other test plans, and we can run it like any<br>
test suite.<br></blockquote><div><br></div><div>Any thoughts on this part?=
=C2=A0 Does anyone see any issue with having</div><div>a series of patterns=
 to grep the kernel log and have a test case</div><div>result for each of t=
hem in LAVA? (i.e. pass if pattern was not</div><div>matched...)</div><div>=
<br></div><div>Guillaume=C2=A0</div></div></div></div>

--00000000000086b0940581b2a798--
