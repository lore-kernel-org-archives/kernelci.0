MIME-Version: 1.0
References: <158129CBC2E3B0B8.7959@groups.io> <CAH1_8nCtNfBQwO=o3GCLfcrCc2L9==zRafZaULRT-5kwo995Kw@mail.gmail.com>
 <7hpnruno7b.fsf@baylibre.com>
In-Reply-To: <7hpnruno7b.fsf@baylibre.com>
From: "Guillaume Tucker" <guillaume.tucker@gmail.com>
Date: Thu, 2 May 2019 12:27:57 +0100
Message-ID: <CAH1_8nAF=21nXp-W-Gn=BmUx1qhLs8SM=2yfuWP-dVew7oAZwQ@mail.gmail.com>
Subject: Re: Baseline test plan and bootrr
Content-Type: multipart/alternative; boundary="000000000000b4de1d0587e5ed2f"
List-ID: <kernelci.groups.io>
To: Kevin Hilman <khilman@baylibre.com>
Cc: kernelci@groups.io, Enric Balletbo i Serra <enric.balletbo@collabora.com>

--000000000000b4de1d0587e5ed2f
Content-Type: text/plain; charset="UTF-8"

On Thu, Feb 14, 2019 at 7:51 PM Kevin Hilman <khilman@baylibre.com> wrote:

> "Guillaume Tucker" <guillaume.tucker@gmail.com> writes:
>
> > On Thu, Feb 7, 2019 at 6:55 PM Guillaume Tucker via Groups.Io
> > <guillaume.tucker=gmail.com@groups.io> wrote:
> >
> >> Hi,
> >>
> >> Currently, boot tests entirely rely on the LAVA logic to detect
> >> when a login prompt has been reached.  While this mostly works,
> >> it does not guarantee that the platform is actually usable or
> >> that everything went smoothly during the boot.
> >>
> >> For this reason, it would seem useful to introduce a "baseline"
> >> test plan which would essentially boot and then do some fast
> >> checks to verify that nothing is obviously broken.  This can
> >> include things like grepping the kernel log for any errors and
> >> checking that drivers have been initialised correctly.  There's a
> >> lot that can be done in a few seconds with a basic ramdisk.
> >>
> >>
> >> So we could have a list of regular expressions to detect any
> >> issues in the kernel log and report a LAVA test case result for
> >> each of them.  The log fragment associated with each match should
> >> also be available to include the actual errors in a report.
> >> Doing this on the device means we keep the test definition in the
> >> same location as the other test plans, and we can run it like any
> >> test suite.
> >>
> >
> > Any thoughts on this part?  Does anyone see any issue with having
> > a series of patterns to grep the kernel log and have a test case
> > result for each of them in LAVA? (i.e. pass if pattern was not
> > matched...)
>
> I think this is a good idea.
>
> The difficulty comes in looking for device/board specific stuff, but
> that shouldn't stop us from doing something generic that looks for the
> obvious stuff.
>
> It could also look for (and count) kernel errors, warnings, backtraces,
> etc. etc.
>

Thanks for the feedback so far.  I've now created an initial PR
to start testing this on staging:

  https://github.com/kernelci/kernelci-core/pull/55

I believe the bootrr script should be part of the rootfs before
we can merge this and roll it out in production.

Guillaume

--000000000000b4de1d0587e5ed2f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><br></div><div class=3D"=
gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Feb 14, 2019 at =
7:51 PM Kevin Hilman &lt;<a href=3D"mailto:khilman@baylibre.com">khilman@ba=
ylibre.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">&quot;Guillaume Tucker&quot; &lt;<a href=3D"mailto:guillaume.tuc=
ker@gmail.com" target=3D"_blank">guillaume.tucker@gmail.com</a>&gt; writes:=
<br>
<br>
&gt; On Thu, Feb 7, 2019 at 6:55 PM Guillaume Tucker via Groups.Io<br>
&gt; &lt;guillaume.tucker=3D<a href=3D"mailto:gmail.com@groups.io" target=
=3D"_blank">gmail.com@groups.io</a>&gt; wrote:<br>
&gt;<br>
&gt;&gt; Hi,<br>
&gt;&gt;<br>
&gt;&gt; Currently, boot tests entirely rely on the LAVA logic to detect<br=
>
&gt;&gt; when a login prompt has been reached.=C2=A0 While this mostly work=
s,<br>
&gt;&gt; it does not guarantee that the platform is actually usable or<br>
&gt;&gt; that everything went smoothly during the boot.<br>
&gt;&gt;<br>
&gt;&gt; For this reason, it would seem useful to introduce a &quot;baselin=
e&quot;<br>
&gt;&gt; test plan which would essentially boot and then do some fast<br>
&gt;&gt; checks to verify that nothing is obviously broken.=C2=A0 This can<=
br>
&gt;&gt; include things like grepping the kernel log for any errors and<br>
&gt;&gt; checking that drivers have been initialised correctly.=C2=A0 There=
&#39;s a<br>
&gt;&gt; lot that can be done in a few seconds with a basic ramdisk.<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; So we could have a list of regular expressions to detect any<br>
&gt;&gt; issues in the kernel log and report a LAVA test case result for<br=
>
&gt;&gt; each of them.=C2=A0 The log fragment associated with each match sh=
ould<br>
&gt;&gt; also be available to include the actual errors in a report.<br>
&gt;&gt; Doing this on the device means we keep the test definition in the<=
br>
&gt;&gt; same location as the other test plans, and we can run it like any<=
br>
&gt;&gt; test suite.<br>
&gt;&gt;<br>
&gt;<br>
&gt; Any thoughts on this part?=C2=A0 Does anyone see any issue with having=
<br>
&gt; a series of patterns to grep the kernel log and have a test case<br>
&gt; result for each of them in LAVA? (i.e. pass if pattern was not<br>
&gt; matched...)<br>
<br>
I think this is a good idea.<br>
<br>
The difficulty comes in looking for device/board specific stuff, but<br>
that shouldn&#39;t stop us from doing something generic that looks for the<=
br>
obvious stuff.<br>
<br>
It could also look for (and count) kernel errors, warnings, backtraces,<br>
etc. etc.<br></blockquote><div>=C2=A0</div><div><div>Thanks for the feedbac=
k so far.=C2=A0 I&#39;ve now created an initial PR</div><div>to start testi=
ng this on staging:</div><div><br></div><div>=C2=A0 <a href=3D"https://gith=
ub.com/kernelci/kernelci-core/pull/55">https://github.com/kernelci/kernelci=
-core/pull/55</a></div><div><br></div><div>I believe the bootrr script shou=
ld be part of the rootfs before</div><div>we can merge this and roll it out=
 in production.</div></div><div><br></div><div>Guillaume=C2=A0</div></div><=
/div></div>

--000000000000b4de1d0587e5ed2f--
