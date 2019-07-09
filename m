MIME-Version: 1.0
References: <CAP245DXSaoGJ4STssCqa-Fr3eGE7Qu=BGGyNFgZnz+z0gAVXNw@mail.gmail.com>
 <CAH1_8nCuBHuGxgdPWWr0xLTXujeLv+S1obbdqqOJPZ45UZf8fg@mail.gmail.com> <CAP245DWZs+4MuSm4SEQLC==sk4F0K8NBMM-f_jc5pe9F8iszpA@mail.gmail.com>
In-Reply-To: <CAP245DWZs+4MuSm4SEQLC==sk4F0K8NBMM-f_jc5pe9F8iszpA@mail.gmail.com>
From: "Guillaume Tucker" <guillaume.tucker@gmail.com>
Date: Tue, 9 Jul 2019 14:01:52 +0100
Message-ID: <CAH1_8nBoT9b3ZjZY=REestht6Z1W5hhA4YwOOvTGr-a19tA3cw@mail.gmail.com>
Subject: Re: New experimental branch for Linaro Qualcomm Landing Team
Content-Type: multipart/alternative; boundary="000000000000ca70e2058d3f2acf"
List-ID: <kernelci.groups.io>
To: Amit Kucheria <amit.kucheria@linaro.org>
Cc: kernelci@groups.io, info <info@kernelci.org>, Kevin Hilman <khilman@baylibre.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, Nicolas Dechesne <nicolas.dechesne@linaro.org>

--000000000000ca70e2058d3f2acf
Content-Type: text/plain; charset="UTF-8"

On Tue, Jul 9, 2019 at 12:09 PM Amit Kucheria <amit.kucheria@linaro.org>
wrote:

> On Tue, Jul 9, 2019 at 4:27 PM Guillaume Tucker
> <guillaume.tucker@gmail.com> wrote:
> >
> >
> > On Tue, Jul 9, 2019 at 11:52 AM Amit Kucheria <amit.kucheria@linaro.org>
> wrote:
> >>
> >> Hi,
> >>
> >> I'd like to request a new branch to be tracked by kernelci.org to
> >> allow more experimental patches that could use much wider testing
> >> across boards and architectures.
> >>
> >> We currently use our 'integration' branch[1] for this but that causes
> >> disruption for people who depend on this branch to keep working.
> >>
> >> This experimental branch shouldn't see too many updates and would
> >> likely only be used to get better testing for experimental series.
> >> Would you be ok to pick up such a branch[2] into kernelci?
> >
> >
> > The links you've provided don't seem to work, the page says
> > "No repositories found".
>
> Curious. Either I missed a space between the URL and branch name or
> gmail seems to have combined them in the link. Try
> https://git.linaro.org/landing-teams/working/qualcomm/kernel.git


Oh I see, there was a space between the URL and the branch name.
Yeah I guess that got mangled somewhere, that link works for me.


> > Generally speaking I would say it's fine, as long as these aren't
> > downstream branches but experimental patches that are based on
> > current mainline and intended to be merged upstream.
>
> No, these will certainly be mainline-based branches.
>

Great, so yes these look like relevant branches to test on
kernelci.org.  Which configurations do you need to build?  The
full range means about 230 builds but if you only care about arm,
arm64 and x86_64 with just the defconfigs and maybe some qcom arm
defconfigs that should come down to a much smaller number.

Doing fewer builds means faster turnaround between when you push
a change and when you get the results, and makes it possible to
have more development trees for a given build capacity.

Best wishes,
Guillaume

--000000000000ca70e2058d3f2acf
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Tue, Jul 9, 2019 at 12:09 PM Amit Kuch=
eria &lt;<a href=3D"mailto:amit.kucheria@linaro.org" target=3D"_blank">amit=
.kucheria@linaro.org</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex">On Tue, Jul 9, 2019 at 4:27 =
PM Guillaume Tucker<br>
&lt;<a href=3D"mailto:guillaume.tucker@gmail.com" target=3D"_blank">guillau=
me.tucker@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt;<br>
&gt; On Tue, Jul 9, 2019 at 11:52 AM Amit Kucheria &lt;<a href=3D"mailto:am=
it.kucheria@linaro.org" target=3D"_blank">amit.kucheria@linaro.org</a>&gt; =
wrote:<br>
&gt;&gt;<br>
&gt;&gt; Hi,<br>
&gt;&gt;<br>
&gt;&gt; I&#39;d like to request a new branch to be tracked by <a href=3D"h=
ttp://kernelci.org" rel=3D"noreferrer" target=3D"_blank">kernelci.org</a> t=
o<br>
&gt;&gt; allow more experimental patches that could use much wider testing<=
br>
&gt;&gt; across boards and architectures.<br>
&gt;&gt;<br>
&gt;&gt; We currently use our &#39;integration&#39; branch[1] for this but =
that causes<br>
&gt;&gt; disruption for people who depend on this branch to keep working.<b=
r>
&gt;&gt;<br>
&gt;&gt; This experimental branch shouldn&#39;t see too many updates and wo=
uld<br>
&gt;&gt; likely only be used to get better testing for experimental series.=
<br>
&gt;&gt; Would you be ok to pick up such a branch[2] into kernelci?<br>
&gt;<br>
&gt;<br>
&gt; The links you&#39;ve provided don&#39;t seem to work, the page says<br=
>
&gt; &quot;No repositories found&quot;.<br>
<br>
Curious. Either I missed a space between the URL and branch name or<br>
gmail seems to have combined them in the link. Try<br>
<a href=3D"https://git.linaro.org/landing-teams/working/qualcomm/kernel.git=
" rel=3D"noreferrer" target=3D"_blank">https://git.linaro.org/landing-teams=
/working/qualcomm/kernel.git</a></blockquote><div><br></div><div>Oh I see, =
there was a space between the URL and the branch name.<br>Yeah I guess that=
 got mangled somewhere, that link works for me.<br></div><div>=C2=A0=C2=A0<=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt; Generally speaking I would say it&#39;s fine, as long as these aren&#3=
9;t<br>
&gt; downstream branches but experimental patches that are based on<br>
&gt; current mainline and intended to be merged upstream.<br>
<br>
No, these will certainly be mainline-based branches.<br></blockquote><div><=
br></div>Great, so yes these look like relevant branches to test on<br><a h=
ref=3D"http://kernelci.org" target=3D"_blank">kernelci.org</a>.=C2=A0 Which=
 configurations do you need to build?=C2=A0 The<br>full range means about 2=
30 builds but if you only care about arm,<br>arm64 and x86_64 with just the=
 defconfigs and maybe some qcom arm<br>defconfigs that should come down to =
a much smaller number.<br><div>=C2=A0</div><div>Doing fewer builds means fa=
ster turnaround between when you push<br>a change and when you get the resu=
lts, and makes it possible to<br>have more development trees for a given bu=
ild capacity.<br></div><div><br></div><div>Best wishes,</div><div>Guillaume=
=C2=A0</div></div></div>

--000000000000ca70e2058d3f2acf--
