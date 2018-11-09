MIME-Version: 1.0
References: <20181026151956.GG2015@sasha-vm> <CAH1_8nAAAw+2yunnWtet=OreRtD_u3M_Su3S7Dnd+2suypfczQ@mail.gmail.com>
 <CAOi56cUp1TL126gFmP9Aw84EASMNd=Yt1xiQ8N7WiNf_oNQh-g@mail.gmail.com>
In-Reply-To: <CAOi56cUp1TL126gFmP9Aw84EASMNd=Yt1xiQ8N7WiNf_oNQh-g@mail.gmail.com>
From: "Guillaume Tucker" <guillaume.tucker@gmail.com>
Date: Fri, 9 Nov 2018 16:26:17 +0000
Message-ID: <CAH1_8nDHRWV-eaM9YDA2hLtQ4efb-xmFfjw8QbRFrgmFX9ZxhQ@mail.gmail.com>
Subject: Re: [kernelci] branch inclusion request
Content-Type: multipart/alternative; boundary="0000000000003d7622057a3dd07c"
List-ID: <kernelci.groups.io>
To: kernelci@groups.io

--0000000000003d7622057a3dd07c
Content-Type: text/plain; charset="UTF-8"

On Mon, Oct 29, 2018 at 3:35 PM Kevin Hilman <khilman@baylibre.com> wrote:

> On Fri, Oct 26, 2018 at 9:35 AM Guillaume Tucker
> <guillaume.tucker@gmail.com> wrote:
> >
> > Hi Sasha,
> >
> > On Fri, Oct 26, 2018 at 5:08 PM Sasha Levin <sashal@kernel.org> wrote:
> >>
> >> Hi all,
> >>
> >> Right now I'm pushing stable patches to Greg for his weekly releases,
> >> and for those branches I only do basic cross-compilation and no
> >> boot/functional testing at all.
> >>
> >> I'd like to modify my process to rely on KernelCI testing instead. This
> >> means I'd like to include my branches (one for each stable kernel) into
> >> the build system.
> >>
> >> These branches get pushed a few times per week, and sometimes a few
> >> times a day, so this will generate a fair amount of builds. OTOH, I
> >> don't really need to keep the build results for too long as I try to
> >> address any issues that come up the same day.
> >
> >
> > This sounds like a good idea in principle, but what is the actual
> > gain given the extra load it would take to build and test all
> > these branches?
> >
> > Of course it's very important to test stable releases, but they
> > typically show very few build or test failures and there is
> > already stable-rc to catch any of these.  It seems to me that
> > development branches are where extra testing efforts would be
> > required the most, to catch issues earlier.
> >
> > If adding your stable branches to KernelCI would save you a lot
> > of manual effort, then yes I guess that would probably be a good
> > reason.  If you'll still be doing the same manual builds and
> > checks before pushing your branches, then I'm not really sure
> > it's worth adding them to KernelCI as it currently stands.
> >
> > Let's see what others think the priorities should be wrt adding
> > more branches.
>
> IMO, since we're trying to make stable rock solid, this is a good
> addition.  Also, since Sasha is also helping with build horsepower, I
> think we should add these trees.
>

Sounds like the overal consensus is to enable them.

Sasha, could you please provide the list of the branch names and
send a PR with the URL of your tree in kernelci-core-staging?

Guillaume

--0000000000003d7622057a3dd07c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br><br><div class=3D"gmail_quote"><div d=
ir=3D"ltr">On Mon, Oct 29, 2018 at 3:35 PM Kevin Hilman &lt;<a href=3D"mail=
to:khilman@baylibre.com">khilman@baylibre.com</a>&gt; wrote:<br></div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex">On Fri, Oct 26, 2018 at 9:35 A=
M Guillaume Tucker<br>
&lt;<a href=3D"mailto:guillaume.tucker@gmail.com" target=3D"_blank">guillau=
me.tucker@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Hi Sasha,<br>
&gt;<br>
&gt; On Fri, Oct 26, 2018 at 5:08 PM Sasha Levin &lt;<a href=3D"mailto:sash=
al@kernel.org" target=3D"_blank">sashal@kernel.org</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; Hi all,<br>
&gt;&gt;<br>
&gt;&gt; Right now I&#39;m pushing stable patches to Greg for his weekly re=
leases,<br>
&gt;&gt; and for those branches I only do basic cross-compilation and no<br=
>
&gt;&gt; boot/functional testing at all.<br>
&gt;&gt;<br>
&gt;&gt; I&#39;d like to modify my process to rely on KernelCI testing inst=
ead. This<br>
&gt;&gt; means I&#39;d like to include my branches (one for each stable ker=
nel) into<br>
&gt;&gt; the build system.<br>
&gt;&gt;<br>
&gt;&gt; These branches get pushed a few times per week, and sometimes a fe=
w<br>
&gt;&gt; times a day, so this will generate a fair amount of builds. OTOH, =
I<br>
&gt;&gt; don&#39;t really need to keep the build results for too long as I =
try to<br>
&gt;&gt; address any issues that come up the same day.<br>
&gt;<br>
&gt;<br>
&gt; This sounds like a good idea in principle, but what is the actual<br>
&gt; gain given the extra load it would take to build and test all<br>
&gt; these branches?<br>
&gt;<br>
&gt; Of course it&#39;s very important to test stable releases, but they<br=
>
&gt; typically show very few build or test failures and there is<br>
&gt; already stable-rc to catch any of these.=C2=A0 It seems to me that<br>
&gt; development branches are where extra testing efforts would be<br>
&gt; required the most, to catch issues earlier.<br>
&gt;<br>
&gt; If adding your stable branches to KernelCI would save you a lot<br>
&gt; of manual effort, then yes I guess that would probably be a good<br>
&gt; reason.=C2=A0 If you&#39;ll still be doing the same manual builds and<=
br>
&gt; checks before pushing your branches, then I&#39;m not really sure<br>
&gt; it&#39;s worth adding them to KernelCI as it currently stands.<br>
&gt;<br>
&gt; Let&#39;s see what others think the priorities should be wrt adding<br=
>
&gt; more branches.<br>
<br>
IMO, since we&#39;re trying to make stable rock solid, this is a good<br>
addition.=C2=A0 Also, since Sasha is also helping with build horsepower, I<=
br>
think we should add these trees.<br></blockquote><div>=C2=A0</div><div>Soun=
ds like the overal consensus is to enable them.</div><div><br></div><div>Sa=
sha, could you please provide the list of the branch names and</div><div>se=
nd a PR with the URL of your tree in kernelci-core-staging?</div><div><br><=
/div><div>Guillaume</div></div></div></div>

--0000000000003d7622057a3dd07c--
