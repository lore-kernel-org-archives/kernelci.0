MIME-Version: 1.0
References: <20191015202114.GA120152@google.com> <CAHRSSExkad8q8bdjF77t_JOwfFmDpERfq4CDthSZp8p23HoJ+w@mail.gmail.com>
 <20191016095636.GA4881@sirena.co.uk> <20191016123833.GG49619@arrakis.emea.arm.com>
 <20191016125416.GA11371@sirena.co.uk> <20191016164621.xa2nc6li2luiujug@willie-the-truck>
 <CAH1_8nDFfrScfM87pNJrT8TeQU7Q9muNMH34AiKx=5_7vc5GOQ@mail.gmail.com>
 <20191023164208.GC27010@willie-the-truck> <CAH1_8nCXvjm0TziMY9EeNFirK5Z4MLKgNYNdmQBAHG_dCQ=T8Q@mail.gmail.com>
 <20191025160124.GA10854@willie-the-truck>
In-Reply-To: <20191025160124.GA10854@willie-the-truck>
From: "Guillaume Tucker" <guillaume.tucker@gmail.com>
Date: Mon, 28 Oct 2019 21:10:09 +0000
Message-ID: <CAH1_8nC_SvwVd_0LtyjgQ=hAtEx5O93vM9vJ-379ZNEphS4=Qg@mail.gmail.com>
Subject: Re: Branch for kernelci
Content-Type: multipart/alternative; boundary="00000000000069a4450595feedb9"
List-ID: <kernelci.groups.io>
To: Will Deacon <will@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, kernelci@groups.io, Todd Kjos <tkjos@google.com>

--00000000000069a4450595feedb9
Content-Type: text/plain; charset="UTF-8"

Hi Will,

On Fri, Oct 25, 2019 at 5:01 PM Will Deacon <will@kernel.org> wrote:

> Hi Guillaume,
>
> On Wed, Oct 23, 2019 at 07:16:42PM +0100, Guillaume Tucker wrote:
> >    On Wed, Oct 23, 2019 at 5:42 PM Will Deacon <[1]will@kernel.org>
> wrote:
> >      On Tue, Oct 22, 2019 at 08:53:03PM +0100, Guillaume Tucker wrote:
> >      >      [3][4]
> https://github.com/kernelci/kernelci-core/issues/new/choose
> >      >
> >      >    Would you be so kind as to filing one of those?  You'll be the
> >      >    first one actually using this template so I hope it'll be
> >      >    self-explanatory but please let us know if you have any
> questions
> >      >    or comments.
> >
> >      Hmm, so I don't actually have a github account anymore and it feels
> a
> >      bit OTT to create one just to fill in a form... Is the form
> >      accessible some other way?
> >
> >     Alright then, I'll ask you a couple of things here instead:
> >    How much build coverage do you need for your branch?  Is it just
> >    for arm64, or do you need other architectures to be built as
> >    well?  Do you need only the main defconfig or do you want all the
> >    variants such as allmodconfig, defconfig with big-endian...
>
> arm64 only, with build coverage for allnoconfig, defconfig and
> allmodconfig.
> The boot/runtime tests only need to worry about defconfig.
>

Sure.

Meanwhile, we should hopefully soon have a bootable allmodconfig
on arm64 using KBUILD_ALLCONFIG to pick default choices from the
regular defconfig.  You might be interested in that when it
happens, the KernelCI parts are all in place and Anders is now on
the case to make it actually work with tweaks in the defconfig.


> >    How often do you expect your branch to be updated?  Every branch
> >    is monitored hourly on [5]kernelci.org, so if it's updated less
> >    often then it's easier to cope with a larger build coverage.
>
> Hard to tell, but at most maybe once a day?
>

That's fine, it's mostly an issue for branches that get built
with the full range of combinations and new each revision
produces over 200 kernels binaries...


> >    Which recipients should receive the email reports?  The standard
> >    reports are for builds and basic tests (boot and checks for
> >    kernel errors).  I guess that should be Catalin, you and
> >    linux-arm-kernel as for CKI?
>
> Yes, please.
>

OK here's the pull request for the record:

    https://github.com/kernelci/kernelci-core/pull/224

If all goes well this should be enabled later this week during
the next kernelci.org update.

Thanks,
Guillaume

--00000000000069a4450595feedb9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Will,</div><div><br></div><div class=3D"gmail_quot=
e"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Oct 25, 2019 at 5:01 PM Wi=
ll Deacon &lt;<a href=3D"mailto:will@kernel.org">will@kernel.org</a>&gt; wr=
ote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi Guillaum=
e,<br>
<br>
On Wed, Oct 23, 2019 at 07:16:42PM +0100, Guillaume Tucker wrote:<br>
&gt;=C2=A0 =C2=A0 On Wed, Oct 23, 2019 at 5:42 PM Will Deacon &lt;[1]<a hre=
f=3D"mailto:will@kernel.org" target=3D"_blank">will@kernel.org</a>&gt; wrot=
e:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 On Tue, Oct 22, 2019 at 08:53:03PM +0100, Guillaum=
e Tucker wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 [3][4]<a href=3D"https://=
github.com/kernelci/kernelci-core/issues/new/choose" rel=3D"noreferrer" tar=
get=3D"_blank">https://github.com/kernelci/kernelci-core/issues/new/choose<=
/a><br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 Would you be so kind as to filin=
g one of those?=C2=A0 You&#39;ll be the<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 first one actually using this te=
mplate so I hope it&#39;ll be<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 self-explanatory but please let =
us know if you have any questions<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 or comments.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 Hmm, so I don&#39;t actually have a github account=
 anymore and it feels a<br>
&gt;=C2=A0 =C2=A0 =C2=A0 bit OTT to create one just to fill in a form... Is=
 the form<br>
&gt;=C2=A0 =C2=A0 =C2=A0 accessible some other way?<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Alright then, I&#39;ll ask you a couple of things h=
ere instead:<br>
&gt;=C2=A0 =C2=A0 How much build coverage do you need for your branch?=C2=
=A0 Is it just<br>
&gt;=C2=A0 =C2=A0 for arm64, or do you need other architectures to be built=
 as<br>
&gt;=C2=A0 =C2=A0 well?=C2=A0 Do you need only the main defconfig or do you=
 want all the<br>
&gt;=C2=A0 =C2=A0 variants such as allmodconfig, defconfig with big-endian.=
..<br>
<br>
arm64 only, with build coverage for allnoconfig, defconfig and allmodconfig=
.<br>
The boot/runtime tests only need to worry about defconfig.<br></blockquote>=
<div><br></div><div>Sure.<br><br>Meanwhile, we should hopefully soon have a=
 bootable allmodconfig<br>on arm64 using KBUILD_ALLCONFIG to pick default c=
hoices from the<br>regular defconfig.=C2=A0 You might be interested in that=
 when it<br>happens, the KernelCI parts are all in place and Anders is now =
on<br>the case to make it actually work with tweaks in the defconfig.<br></=
div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt;=C2=A0 =C2=A0 How often do you expect your branch to be updated?=C2=A0 =
Every branch<br>
&gt;=C2=A0 =C2=A0 is monitored hourly on [5]<a href=3D"http://kernelci.org"=
 rel=3D"noreferrer" target=3D"_blank">kernelci.org</a>, so if it&#39;s upda=
ted less<br>
&gt;=C2=A0 =C2=A0 often then it&#39;s easier to cope with a larger build co=
verage.<br>
<br>
Hard to tell, but at most maybe once a day?<br></blockquote><div><br></div>=
That&#39;s fine, it&#39;s mostly an issue for branches that get built<br>wi=
th the full range of combinations and new each revision<br><div>produces ov=
er 200 kernels binaries...</div><div>=C2=A0</div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex">
&gt;=C2=A0 =C2=A0 Which recipients should receive the email reports?=C2=A0 =
The standard<br>
&gt;=C2=A0 =C2=A0 reports are for builds and basic tests (boot and checks f=
or<br>
&gt;=C2=A0 =C2=A0 kernel errors).=C2=A0 I guess that should be Catalin, you=
 and<br>
&gt;=C2=A0 =C2=A0 linux-arm-kernel as for CKI?<br>
<br>
Yes, please.<br></blockquote><div><br></div><div>OK here&#39;s the pull req=
uest for the record:<br><br>=C2=A0 =C2=A0 <a href=3D"https://github.com/ker=
nelci/kernelci-core/pull/224">https://github.com/kernelci/kernelci-core/pul=
l/224</a><br><br>If all goes well this should be enabled later this week du=
ring<br>the next <a href=3D"http://kernelci.org">kernelci.org</a> update.<b=
r><br>Thanks,<br>Guillaume<br></div><div>=C2=A0</div></div></div>

--00000000000069a4450595feedb9--
