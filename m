MIME-Version: 1.0
References: <20191015202114.GA120152@google.com> <CAHRSSExkad8q8bdjF77t_JOwfFmDpERfq4CDthSZp8p23HoJ+w@mail.gmail.com>
 <20191016095636.GA4881@sirena.co.uk> <20191016123833.GG49619@arrakis.emea.arm.com>
 <20191016125416.GA11371@sirena.co.uk> <20191016164621.xa2nc6li2luiujug@willie-the-truck>
In-Reply-To: <20191016164621.xa2nc6li2luiujug@willie-the-truck>
From: "Guillaume Tucker" <guillaume.tucker@gmail.com>
Date: Tue, 22 Oct 2019 20:53:03 +0100
Message-ID: <CAH1_8nDFfrScfM87pNJrT8TeQU7Q9muNMH34AiKx=5_7vc5GOQ@mail.gmail.com>
Subject: Re: Branch for kernelci
Content-Type: multipart/alternative; boundary="00000000000098aa130595852647"
List-ID: <kernelci.groups.io>
To: Will Deacon <will@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, kernelci@groups.io, tkjos@google.com

--00000000000098aa130595852647
Content-Type: text/plain; charset="UTF-8"

On Wed, Oct 16, 2019 at 5:55 PM Will Deacon <will@kernel.org> wrote:

> On Wed, Oct 16, 2019 at 01:54:16PM +0100, Mark Brown wrote:
> > On Wed, Oct 16, 2019 at 01:38:34PM +0100, Catalin Marinas wrote:
> > > On Wed, Oct 16, 2019 at 10:56:36AM +0100, Mark Brown wrote:
> >
> > > > Are you sure they are interested in this?  When asked previously they
> > > > indicated that they didn't see any extra value in covering their tree
> > > > specifically separately to -next.
> >
> > > Will can comment on the reasoning but I guess it came as a request from
> > > him since he also created the arm64/for-kernelci branch. This might as
> > > well be the same as for-next/core but tested in isolation rather than
> > > with the whole linux-next tree.
> >
> > Yeah, that was what you'd both rejected doing before which was why I was
> > surprised (plus the fact that this was coming via Todd rather than one
> > of you).
>
> I asked Todd about this yesterday because we're dealing with an ABI
> regression in 5.4 which wasn't picked up until -rc3, so figured that this
> was probably worth doing after all. Perhaps it wouldn't have helped for
> this
> specific case, but it turns out that one person's LTP isn't quite the same
> as another person's LTP!
>
> So yes, I'm interested in having our for-kernelci branch picked up despite
> not seeing the benefit in the past.
>

Sure, sorry for the delay in getting this sorted out.  There are
a few pieces of information needed in order to add a branch to
kernelci.org, and to avoid repeating the same questions every
time I've now made a Github issue template just for that:

  https://github.com/kernelci/kernelci-core/issues/new/choose

Would you be so kind as to filing one of those?  You'll be the
first one actually using this template so I hope it'll be
self-explanatory but please let us know if you have any questions
or comments.

Thanks,
Guillaume


> 
>
>

--00000000000098aa130595852647
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Oct 16, 2019 at 5:55 PM Will =
Deacon &lt;<a href=3D"mailto:will@kernel.org">will@kernel.org</a>&gt; wrote=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Wed, Oct 16=
, 2019 at 01:54:16PM +0100, Mark Brown wrote:<br>
&gt; On Wed, Oct 16, 2019 at 01:38:34PM +0100, Catalin Marinas wrote:<br>
&gt; &gt; On Wed, Oct 16, 2019 at 10:56:36AM +0100, Mark Brown wrote:<br>
&gt; <br>
&gt; &gt; &gt; Are you sure they are interested in this?=C2=A0 When asked =
previously they<br>
&gt; &gt; &gt; indicated that they didn&#39;t see any extra value in cover=
ing their tree<br>
&gt; &gt; &gt; specifically separately to -next.<br>
&gt; <br>
&gt; &gt; Will can comment on the reasoning but I guess it came as a reque=
st from<br>
&gt; &gt; him since he also created the arm64/for-kernelci branch. This mi=
ght as<br>
&gt; &gt; well be the same as for-next/core but tested in isolation rather=
 than<br>
&gt; &gt; with the whole linux-next tree.<br>
&gt; <br>
&gt; Yeah, that was what you&#39;d both rejected doing before which was wh=
y I was<br>
&gt; surprised (plus the fact that this was coming via Todd rather than on=
e<br>
&gt; of you).<br>
<br>
I asked Todd about this yesterday because we&#39;re dealing with an ABI<br=
>
regression in 5.4 which wasn&#39;t picked up until -rc3, so figured that t=
his<br>
was probably worth doing after all. Perhaps it wouldn&#39;t have helped fo=
r this<br>
specific case, but it turns out that one person&#39;s LTP isn&#39;t quite =
the same<br>
as another person&#39;s LTP!<br>
<br>
So yes, I&#39;m interested in having our for-kernelci branch picked up des=
pite<br>
not seeing the benefit in the past.<br></blockquote><div><br></div><div>Su=
re, sorry for the delay in getting this sorted out.=C2=A0 There are<br>a fe=
w pieces of information needed in order to add a branch to<br><a href=3D"ht=
tp://kernelci.org">kernelci.org</a>, and to avoid repeating the same questi=
ons every<br>time I&#39;ve now made a Github issue template just for that:<=
br><br>=C2=A0 <a href=3D"https://github.com/kernelci/kernelci-core/issues/n=
ew/choose">https://github.com/kernelci/kernelci-core/issues/new/choose</a><=
br><br>Would you be so kind as to filing one of those?=C2=A0 You&#39;ll be =
the<br>first one actually using this template so I hope it&#39;ll be<br>sel=
f-explanatory but please let us know if you have any questions<br>or commen=
ts.<br></div><div><br></div><div>Thanks,<br>Guillaume</div><div>=C2=A0</div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
<br>
</blockquote></div></div>

--00000000000098aa130595852647--
