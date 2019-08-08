MIME-Version: 1.0
References: <CAKohpomfjPajY6fp0CywZ-khzNZEjwmAzKz3dzc4=R9B-vOXgw@mail.gmail.com>
 <CAH+k93GJ=xJJR5dCb-Fwrc7nmcdGVJvCqLchg3fZBdVU9bEnTQ@mail.gmail.com>
 <20190806070817.3wrzstcvrcyac4d2@vireshk-i7> <20190808081454.5atort63pqt6glfo@vireshk-i7>
 <CAH1_8nCQiy8e7iQVgFf7MixMocefUMC09hQgA33ijK4QaqSEMg@mail.gmail.com> <20190808093433.c4b2x23opmee2bgt@vireshk-i7>
In-Reply-To: <20190808093433.c4b2x23opmee2bgt@vireshk-i7>
From: "Guillaume Tucker" <guillaume.tucker@gmail.com>
Date: Thu, 8 Aug 2019 12:01:08 +0200
Message-ID: <CAH1_8nAnWVea2hsChgLSYvQ4ZEnH=vx3pjJz-tQ8-V=tqwrx=Q@mail.gmail.com>
Subject: Re: My Branch not getting tested
Content-Type: multipart/alternative; boundary="000000000000a9bcf1058f9823c7"
List-ID: <kernelci.groups.io>
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: kernelci@groups.io, Matt Hart <matthew.hart@linaro.org>, info <info@kernelci.org>

--000000000000a9bcf1058f9823c7
Content-Type: text/plain; charset="UTF-8"

On Thu, Aug 8, 2019 at 11:34 AM Viresh Kumar <viresh.kumar@linaro.org>
wrote:

> HI Guillaume,
>
> On 08-08-19, 11:19, Guillaume Tucker wrote:
> > There's a PR to add your branch:
> > https://github.com/kernelci/kernelci-core/pull/135
> >
> > It will get enabled on kernelci.org during the next production
> > update once your PR has been merged, so probably tomorrow.
> >
> > I put a comment there, it would be a bit better to use https to
> > avoid all the redirections and reduce the number of requests with
> > git.kernel.org.
>
> Great, thanks.
>
> > Also, do you need your for-kernelci branch to be built for the
> > full range of architectures and defconfigs combinations?  That
> > amounts to about 200 builds, but if you only make changes related
> > to a subset of that then it could be greatly reduced (say, only
> > multi_v7_defconfig for arm, and only build arm, arm64 and x86_64
> > arches).  If your branch doesn't get updated very often then it's
> > OK to have more build configurations enabled.  There aren't any
> > strict rules about this but it's important that we tune each
> > branch to get optimum overall performance.
>
> I am more interested in boot testing as my tree is already getting
> build tested by 0 day build bot from Intel.
>

OK I've made another PR to reduce the number of builds with your
branch:

  https://github.com/kernelci/kernelci-core/pull/139

This will give you the same level of coverage as on linusw'
branches:

  https://kernelci.org/job/linusw/branch/devel/

Also, which email addresses do you want the build and boot
reports to be sent to?

Guillaume

--000000000000a9bcf1058f9823c7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"g=
mail_attr">On Thu, Aug 8, 2019 at 11:34 AM Viresh Kumar &lt;<a href=3D"mail=
to:viresh.kumar@linaro.org">viresh.kumar@linaro.org</a>&gt; wrote:<br></div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex">HI Guillaume,<br>
<br>
On 08-08-19, 11:19, Guillaume Tucker wrote:<br>
&gt; There&#39;s a PR to add your branch:<br>
&gt; <a href=3D"https://github.com/kernelci/kernelci-core/pull/135" rel=3D"=
noreferrer" target=3D"_blank">https://github.com/kernelci/kernelci-core/pul=
l/135</a><br>
&gt; <br>
&gt; It will get enabled on <a href=3D"http://kernelci.org" rel=3D"noreferr=
er" target=3D"_blank">kernelci.org</a> during the next production<br>
&gt; update once your PR has been merged, so probably tomorrow.<br>
&gt; <br>
&gt; I put a comment there, it would be a bit better to use https to<br>
&gt; avoid all the redirections and reduce the number of requests with<br>
&gt; <a href=3D"http://git.kernel.org" rel=3D"noreferrer" target=3D"_blank"=
>git.kernel.org</a>.<br>
<br>
Great, thanks.<br>
<br>
&gt; Also, do you need your for-kernelci branch to be built for the<br>
&gt; full range of architectures and defconfigs combinations?=C2=A0 That<br=
>
&gt; amounts to about 200 builds, but if you only make changes related<br>
&gt; to a subset of that then it could be greatly reduced (say, only<br>
&gt; multi_v7_defconfig for arm, and only build arm, arm64 and x86_64<br>
&gt; arches).=C2=A0 If your branch doesn&#39;t get updated very often then =
it&#39;s<br>
&gt; OK to have more build configurations enabled.=C2=A0 There aren&#39;t a=
ny<br>
&gt; strict rules about this but it&#39;s important that we tune each<br>
&gt; branch to get optimum overall performance.<br>
<br>
I am more interested in boot testing as my tree is already getting<br>
build tested by 0 day build bot from Intel.<br></blockquote><div>=C2=A0</di=
v><div>OK I&#39;ve made another PR to reduce the number of builds with your=
<br>branch:</div><div><br>=C2=A0 <a href=3D"https://github.com/kernelci/ker=
nelci-core/pull/139">https://github.com/kernelci/kernelci-core/pull/139</a>=
<br><br>This will give you the same level of coverage as on linusw&#39;<br>=
branches:<br><br>=C2=A0 <a href=3D"https://kernelci.org/job/linusw/branch/d=
evel/">https://kernelci.org/job/linusw/branch/devel/</a><br><br></div><div>=
Also, which email addresses do you want the build and boot<br>reports to be=
 sent to?<br></div><div><br></div><div>Guillaume=C2=A0</div></div></div>

--000000000000a9bcf1058f9823c7--
