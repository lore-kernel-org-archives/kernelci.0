MIME-Version: 1.0
References: <CAKohpomfjPajY6fp0CywZ-khzNZEjwmAzKz3dzc4=R9B-vOXgw@mail.gmail.com>
 <CAH+k93GJ=xJJR5dCb-Fwrc7nmcdGVJvCqLchg3fZBdVU9bEnTQ@mail.gmail.com>
 <20190806070817.3wrzstcvrcyac4d2@vireshk-i7> <20190808081454.5atort63pqt6glfo@vireshk-i7>
In-Reply-To: <20190808081454.5atort63pqt6glfo@vireshk-i7>
From: "Guillaume Tucker" <guillaume.tucker@gmail.com>
Date: Thu, 8 Aug 2019 11:19:03 +0200
Message-ID: <CAH1_8nCQiy8e7iQVgFf7MixMocefUMC09hQgA33ijK4QaqSEMg@mail.gmail.com>
Subject: Re: My Branch not getting tested
Content-Type: multipart/alternative; boundary="00000000000036cecf058f978d20"
List-ID: <kernelci.groups.io>
To: kernelci@groups.io, viresh.kumar@linaro.org
Cc: Matt Hart <matthew.hart@linaro.org>, info <info@kernelci.org>

--00000000000036cecf058f978d20
Content-Type: text/plain; charset="UTF-8"

Hi Viresh,

On Thu, Aug 8, 2019 at 11:04 AM Viresh Kumar <viresh.kumar@linaro.org>
wrote:

> On 06-08-19, 12:38, Viresh Kumar wrote:
> > On 06-08-19, 08:06, Matt Hart wrote:
> > > On Mon, 5 Aug 2019 at 14:00, Viresh Kumar <viresh.kumar@linaro.org>
> wrote:
> > > >
> > > > Hi,
> > > >
> > > > I have pushed my branch again yesterday and it looks like my
> > > > branch isn't getting tested anymore now.
> > > >
> > > > Can someone please confirm ?
> > > >
> > > > http://git.kernel.org/pub/scm/linux/kernel/git/vireshk/linux.git
> for-kernelci
> > >
> > > Hi Viresh, I've had a look at the current build configs and I don't
> > > see your tree.
> > > It hasn't been triggered since August 2017 so was probably removed due
> > > to inactivity.
> > >
> > > How often do you expect this tree to be updated?
> >
> > This doesn't get updated unless I have a big group of patches to test,
> > like backporting spectre to 4.4 in this case. So the frequency may not
> > be huge that way.
>
> Can you please enable it for now at least? As I have few branches to
> get tested urgently.
>

There's a PR to add your branch:
https://github.com/kernelci/kernelci-core/pull/135

It will get enabled on kernelci.org during the next production
update once your PR has been merged, so probably tomorrow.

I put a comment there, it would be a bit better to use https to
avoid all the redirections and reduce the number of requests with
git.kernel.org.

Also, do you need your for-kernelci branch to be built for the
full range of architectures and defconfigs combinations?  That
amounts to about 200 builds, but if you only make changes related
to a subset of that then it could be greatly reduced (say, only
multi_v7_defconfig for arm, and only build arm, arm64 and x86_64
arches).  If your branch doesn't get updated very often then it's
OK to have more build configurations enabled.  There aren't any
strict rules about this but it's important that we tune each
branch to get optimum overall performance.

Guillaume

--00000000000036cecf058f978d20
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Viresh,</div><br><div class=3D"gmail_quote"><div d=
ir=3D"ltr" class=3D"gmail_attr">On Thu, Aug 8, 2019 at 11:04 AM Viresh Kuma=
r &lt;<a href=3D"mailto:viresh.kumar@linaro.org">viresh.kumar@linaro.org</a=
>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On =
06-08-19, 12:38, Viresh Kumar wrote:<br>
&gt; On 06-08-19, 08:06, Matt Hart wrote:<br>
&gt; &gt; On Mon, 5 Aug 2019 at 14:00, Viresh Kumar &lt;<a href=3D"mailto:v=
iresh.kumar@linaro.org" target=3D"_blank">viresh.kumar@linaro.org</a>&gt; w=
rote:<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Hi,<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; I have pushed my branch again yesterday and it looks like my=
<br>
&gt; &gt; &gt; branch isn&#39;t getting tested anymore now.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Can someone please confirm ?<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; <a href=3D"http://git.kernel.org/pub/scm/linux/kernel/git/vi=
reshk/linux.git" rel=3D"noreferrer" target=3D"_blank">http://git.kernel.org=
/pub/scm/linux/kernel/git/vireshk/linux.git</a> for-kernelci<br>
&gt; &gt; <br>
&gt; &gt; Hi Viresh, I&#39;ve had a look at the current build configs and I=
 don&#39;t<br>
&gt; &gt; see your tree.<br>
&gt; &gt; It hasn&#39;t been triggered since August 2017 so was probably re=
moved due<br>
&gt; &gt; to inactivity.<br>
&gt; &gt; <br>
&gt; &gt; How often do you expect this tree to be updated?<br>
&gt; <br>
&gt; This doesn&#39;t get updated unless I have a big group of patches to t=
est,<br>
&gt; like backporting spectre to 4.4 in this case. So the frequency may not=
<br>
&gt; be huge that way.<br>
<br>
Can you please enable it for now at least? As I have few branches to<br>
get tested urgently.<br></blockquote><div><br></div><div>There&#39;s a PR t=
o add your branch:</div><div><a href=3D"https://github.com/kernelci/kernelc=
i-core/pull/135">https://github.com/kernelci/kernelci-core/pull/135</a></di=
v><div><br></div><div>It will get enabled on <a href=3D"http://kernelci.org=
">kernelci.org</a> during the next production<br>update once your PR has be=
en merged, so probably tomorrow.<br></div><div><br></div><div>I put a comme=
nt there, it would be a bit better to use https to<br>avoid all the redirec=
tions and reduce the number of requests with<br><a href=3D"http://git.kerne=
l.org">git.kernel.org</a>.<br><br>Also, do you need your for-kernelci branc=
h to be built for the<br>full range of architectures and defconfigs combina=
tions?=C2=A0 That<br>amounts to about 200 builds, but if you only make chan=
ges related<br>to a subset of that then it could be greatly reduced (say, o=
nly<br>multi_v7_defconfig for arm, and only build arm, arm64 and x86_64<br>=
arches).=C2=A0 If your branch doesn&#39;t get updated very often then it&#3=
9;s<br>OK to have more build configurations enabled.=C2=A0 There aren&#39;t=
 any<br>strict rules about this but it&#39;s important that we tune each<br=
>branch to get optimum overall performance.<br></div><div><br></div><div>Gu=
illaume</div></div></div>

--00000000000036cecf058f978d20--
