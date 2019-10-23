MIME-Version: 1.0
References: <20191015202114.GA120152@google.com> <CAHRSSExkad8q8bdjF77t_JOwfFmDpERfq4CDthSZp8p23HoJ+w@mail.gmail.com>
 <20191016095636.GA4881@sirena.co.uk> <20191016123833.GG49619@arrakis.emea.arm.com>
 <20191016125416.GA11371@sirena.co.uk> <20191016164621.xa2nc6li2luiujug@willie-the-truck>
 <CAH1_8nDFfrScfM87pNJrT8TeQU7Q9muNMH34AiKx=5_7vc5GOQ@mail.gmail.com> <20191023164208.GC27010@willie-the-truck>
In-Reply-To: <20191023164208.GC27010@willie-the-truck>
From: "Guillaume Tucker" <guillaume.tucker@gmail.com>
Date: Wed, 23 Oct 2019 19:16:42 +0100
Message-ID: <CAH1_8nCXvjm0TziMY9EeNFirK5Z4MLKgNYNdmQBAHG_dCQ=T8Q@mail.gmail.com>
Subject: Re: Branch for kernelci
Content-Type: multipart/alternative; boundary="000000000000fa8c21059597eba1"
List-ID: <kernelci.groups.io>
To: Will Deacon <will@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, kernelci@groups.io, tkjos@google.com

--000000000000fa8c21059597eba1
Content-Type: text/plain; charset="UTF-8"

On Wed, Oct 23, 2019 at 5:42 PM Will Deacon <will@kernel.org> wrote:

> Hi Guillaume,
>
> Thanks for the reply.
>
> On Tue, Oct 22, 2019 at 08:53:03PM +0100, Guillaume Tucker wrote:
> >    On Wed, Oct 16, 2019 at 5:55 PM Will Deacon <[1]will@kernel.org>
> wrote:
> >      So yes, I'm interested in having our for-kernelci branch picked up
> >      despite
> >      not seeing the benefit in the past.
> >
> >    Sure, sorry for the delay in getting this sorted out.  There are
> >    a few pieces of information needed in order to add a branch to
> >    [2]kernelci.org, and to avoid repeating the same questions every
> >    time I've now made a Github issue template just for that:
> >
> >      [3]https://github.com/kernelci/kernelci-core/issues/new/choose
> >
> >    Would you be so kind as to filing one of those?  You'll be the
> >    first one actually using this template so I hope it'll be
> >    self-explanatory but please let us know if you have any questions
> >    or comments.
>
> Hmm, so I don't actually have a github account anymore and it feels a bit
> OTT to create one just to fill in a form... Is the form accessible some
> other way?


 Alright then, I'll ask you a couple of things here instead:

How much build coverage do you need for your branch?  Is it just
for arm64, or do you need other architectures to be built as
well?  Do you need only the main defconfig or do you want all the
variants such as allmodconfig, defconfig with big-endian...

How often do you expect your branch to be updated?  Every branch
is monitored hourly on kernelci.org, so if it's updated less
often then it's easier to cope with a larger build coverage.

Which recipients should receive the email reports?  The standard
reports are for builds and basic tests (boot and checks for
kernel errors).  I guess that should be Catalin, you and
linux-arm-kernel as for CKI?

Guillaume

--000000000000fa8c21059597eba1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Oct 23, 2019 at 5:42 PM Will =
Deacon &lt;<a href=3D"mailto:will@kernel.org">will@kernel.org</a>&gt; wrote=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi Guillaume,<=
br>
<br>
Thanks for the reply.<br>
<br>
On Tue, Oct 22, 2019 at 08:53:03PM +0100, Guillaume Tucker wrote:<br>
&gt;=C2=A0 =C2=A0 On Wed, Oct 16, 2019 at 5:55 PM Will Deacon &lt;[1]<a hre=
f=3D"mailto:will@kernel.org" target=3D"_blank">will@kernel.org</a>&gt; wrot=
e:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 So yes, I&#39;m interested in having our for-kerne=
lci branch picked up<br>
&gt;=C2=A0 =C2=A0 =C2=A0 despite<br>
&gt;=C2=A0 =C2=A0 =C2=A0 not seeing the benefit in the past.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 Sure, sorry for the delay in getting this sorted out.=C2=
=A0 There are<br>
&gt;=C2=A0 =C2=A0 a few pieces of information needed in order to add a bran=
ch to<br>
&gt;=C2=A0 =C2=A0 [2]<a href=3D"http://kernelci.org" rel=3D"noreferrer" tar=
get=3D"_blank">kernelci.org</a>, and to avoid repeating the same questions =
every<br>
&gt;=C2=A0 =C2=A0 time I&#39;ve now made a Github issue template just for t=
hat:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 [3]<a href=3D"https://github.com/kernelci/kernelci=
-core/issues/new/choose" rel=3D"noreferrer" target=3D"_blank">https://githu=
b.com/kernelci/kernelci-core/issues/new/choose</a><br>
&gt; <br>
&gt;=C2=A0 =C2=A0 Would you be so kind as to filing one of those?=C2=A0 You=
&#39;ll be the<br>
&gt;=C2=A0 =C2=A0 first one actually using this template so I hope it&#39;l=
l be<br>
&gt;=C2=A0 =C2=A0 self-explanatory but please let us know if you have any q=
uestions<br>
&gt;=C2=A0 =C2=A0 or comments.<br>
<br>
Hmm, so I don&#39;t actually have a github account anymore and it feels a b=
it<br>
OTT to create one just to fill in a form... Is the form accessible some<br>
other way?</blockquote><div><br></div><div>=C2=A0Alright then, I&#39;ll ask=
 you a couple of things here instead:</div><br>How much build coverage do y=
ou need for your branch?=C2=A0 Is it just<br>for arm64, or do you need othe=
r architectures to be built as<br>well?=C2=A0 Do you need only the main def=
config or do you want all the<br>variants such as allmodconfig, defconfig w=
ith big-endian...<br><br>How often do you expect your branch to be updated?=
=C2=A0 Every branch<br>is monitored hourly on <a href=3D"http://kernelci.or=
g">kernelci.org</a>, so if it&#39;s updated less<br>often then it&#39;s eas=
ier to cope with a larger build coverage.<br><br>Which recipients should re=
ceive the email reports?=C2=A0 The standard<br>reports are for builds and b=
asic tests (boot and checks for<br>kernel errors).=C2=A0 I guess that shoul=
d be Catalin, you and<br>linux-arm-kernel as for CKI?</div><div class=3D"gm=
ail_quote"><br></div><div class=3D"gmail_quote">Guillaume</div></div>

--000000000000fa8c21059597eba1--
