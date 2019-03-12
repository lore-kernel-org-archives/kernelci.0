MIME-Version: 1.0
References: <7himwxvr6m.fsf@baylibre.com> <CAH+k93EBGwnAbwvCDF3PmaCvS+Fpk6FTVtgdB37h-twqZf4hvQ@mail.gmail.com>
 <20190305170426.4kuzc4fq7fmvoeud@xps.therub.org> <15891FEF165BAE41.4955@groups.io>
In-Reply-To: <15891FEF165BAE41.4955@groups.io>
From: "Guillaume Tucker" <guillaume.tucker@gmail.com>
Date: Tue, 12 Mar 2019 10:22:06 +0000
Message-ID: <CAH1_8nC=aa9jOa1rTzb7=joDXqjTDty+qeGe4bqpE11fqOgN-A@mail.gmail.com>
Subject: Re: staging projects in github
Content-Type: multipart/alternative; boundary="00000000000045e9300583e310bb"
List-ID: <kernelci.groups.io>
To: kernelci@groups.io, Guillaume Tucker <guillaume.tucker@gmail.com>
Cc: Dan Rue <dan.rue@linaro.org>, Matt Hart <matthew.hart@linaro.org>, Kevin Hilman <khilman@baylibre.com>

--00000000000045e9300583e310bb
Content-Type: text/plain; charset="UTF-8"

On Tue, Mar 5, 2019 at 5:24 PM Guillaume Tucker via Groups.Io
<guillaume.tucker=gmail.com@groups.io> wrote:

>
> On Tue, Mar 5, 2019 at 5:04 PM Dan Rue <dan.rue@linaro.org> wrote:
>
>> On Tue, Mar 05, 2019 at 04:48:52PM +0000, Matt Hart wrote:
>> > On Tue, 5 Mar 2019 at 05:14, Kevin Hilman <khilman@baylibre.com> wrote:
>> > >
>> > > Can we consolidate the various "-staging" project in github with the
>> > > originals?  I've never fully understood why we created separate github
>> > > projects, when we should just be using a staging branch within the
>> main
>> > > project.
>
> [...]

> I'm not sure if I'm considering all of the use-cases, but in the past
>> I've much preferred having staging == "master" and then tagging for
>> production releases. This does make it difficult (but not impossible) to
>> have things in staging that are not promoted to production.
>>
>
> What would make most sense imo would be to have the master branch
> receiving the PRs (like Dan wrote) and a live "prod" branch used
> by Jenkins.
>

So how about having one last staging -> prod sync this week using
the kernelci-core-staging project, and then switch to using
kernelci-core only starting from next week?

Guillaume

--00000000000045e9300583e310bb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><br></div><div class=3D"=
gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Mar 5, 2019 at 5=
:24 PM Guillaume Tucker via Groups.Io &lt;guillaume.tucker=3D<a href=3D"mai=
lto:gmail.com@groups.io" target=3D"_blank">gmail.com@groups.io</a>&gt; wrot=
e:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"l=
tr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><di=
v dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=
=3D"ltr"><div dir=3D"ltr"><br></div><div class=3D"gmail_quote"><div dir=3D"=
ltr" class=3D"gmail_attr">On Tue, Mar 5, 2019 at 5:04 PM Dan Rue &lt;<a hre=
f=3D"mailto:dan.rue@linaro.org" target=3D"_blank">dan.rue@linaro.org</a>&gt=
; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Tue,=
 Mar 05, 2019 at 04:48:52PM +0000, Matt Hart wrote:<br>
&gt; On Tue, 5 Mar 2019 at 05:14, Kevin Hilman &lt;<a href=3D"mailto:khilma=
n@baylibre.com" target=3D"_blank">khilman@baylibre.com</a>&gt; wrote:<br>
&gt; &gt;<br>
&gt; &gt; Can we consolidate the various &quot;-staging&quot; project in gi=
thub with the<br>
&gt; &gt; originals?=C2=A0 I&#39;ve never fully understood why we created s=
eparate github<br>
&gt; &gt; projects, when we should just be using a staging branch within th=
e main<br>
&gt; &gt; project.</blockquote></div></div></div></div></div></div></div></=
div></div></div></div></blockquote><div>[...]</div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr=
"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div =
dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_quote"><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">
I&#39;m not sure if I&#39;m considering all of the use-cases, but in the pa=
st<br>
I&#39;ve much preferred having staging =3D=3D &quot;master&quot; and then t=
agging for<br>
production releases. This does make it difficult (but not impossible) to<br=
>
have things in staging that are not promoted to production.<br></blockquote=
><div><br></div><div>What would make most sense imo would be to have the ma=
ster branch</div><div>receiving the PRs (like Dan wrote) and a live &quot;p=
rod&quot; branch used</div><div>by Jenkins.</div></div></div></div></div></=
div></div></div></div></div></div></div></blockquote><div><br></div><div>So=
 how about having one last staging -&gt; prod sync this week using</div><di=
v>the kernelci-core-staging project, and then switch to using</div><div>ker=
nelci-core only starting from next week?=C2=A0</div><div><br></div><div>Gui=
llaume</div></div></div></div>

--00000000000045e9300583e310bb--
