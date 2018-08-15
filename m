MIME-Version: 1.0
References: <CAH+k93God7SdCeet-S=n4iUmLvyJr4+hORa=W852N_tKWFo8Qw@mail.gmail.com>
 <7hefezlkoi.fsf@baylibre.com> <CACNq6_a4fBc3Q8H4rDZwOSNsWLCZ9tJ-_oi+iKs_=gkkZHGf+A@mail.gmail.com>
 <CAH+k93F_04KY43aUDaOuen8heG6-UVVgpbrgcW6DGXtNSEyLQw@mail.gmail.com>
In-Reply-To: <CAH+k93F_04KY43aUDaOuen8heG6-UVVgpbrgcW6DGXtNSEyLQw@mail.gmail.com>
From: "Mark Brown" <broonie@gmail.com>
Date: Wed, 15 Aug 2018 17:27:32 +0100
Message-ID: <CACNq6_Zuf+5cJXj41ZtALdKt3WtRUOurjCssL6FgfoDRXykETQ@mail.gmail.com>
Subject: Re: [kernelci] Compilers from.. debian?
Content-Type: multipart/alternative; boundary="000000000000711ccd05737bce8a"
List-ID: <kernelci.groups.io>
To: kernelci@groups.io

--000000000000711ccd05737bce8a
Content-Type: text/plain; charset="UTF-8"

On Wed, 15 Aug 2018, 5:05 pm Matt Hart, <matthew.hart@linaro.org> wrote:

> On 15 August 2018 at 16:39, Mark Brown <broonie@kernel.org> wrote:
> >
> >
> > On Wed, 15 Aug 2018, 4:21 pm Kevin Hilman, <khilman@baylibre.com> wrote:
> >>
> >> "Matt Hart" <matthew.hart@linaro.org> writes:
> >>
> >> > Does anyone have a strong opinion about where we get our compiler
> >> > releases from?
> >>
> >> I think the current tarball way is a hack and not scalable, so...
> >>
> >> > Currently it's a mash up of Linaro for ARM(32/64), MIPS from unknown,
> >> > and X86 from whatever ubuntu is installed on the builder
> >> >
> >> > As part of my work to start building with multiple compiler versions,
> >> > I've been creating Dockerfiles for the builders with different
> >> > compiler versions installed in them. As I've been doing this, it's
> >> > been really easy to just install the various compilers packages from
> >> > Debian. They also cover a lot of architectures we're hoping to add in
> >> > the future.
> >> >
> >> > Anyone mind if we start using Debian toolchain releases in future?
> >> > I'm no toolchain expert, so I'm looking for some opinions.
> >>
> >> It's better than what we're doing today, and has a much clearer
> >> upgrade/migration path, so I say go for it!
> >
> >
> > The only concern I can think of is that it's going to be a bit harder for
> > those not fortunate enough to run Debian to get the toolchains if there's
> > some reason to reproduce things. On the other hand that's a rare
> occurrence
> > and with moving the builders more to Docker there's always the option of
> > using the container to get the compilers on other OSs.
>
> I've been thinking about adding a section to the build page of "repeat
> this build" and a link to either a dockerfile or image which runs the
> identical steps in the same environment, it could be a really nice
> feature to add.
>

That'd be a neat thing to have!


> >
> >>
> >> Kevin
> >>
> >>
> >>
> >
>
> 
>
>

--000000000000711ccd05737bce8a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<br><br><div class=3D"gmail_quote"><div dir=3D"ltr">On Wed, 15 Aug 2018, 5:=
05 pm Matt Hart, &lt;<a href=3D"mailto:matthew.hart@linaro.org">matthew.har=
t@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On 15 A=
ugust 2018 at 16:39, Mark Brown &lt;<a href=3D"mailto:broonie@kernel.org" t=
arget=3D"_blank">broonie@kernel.org</a>&gt; wrote:<br>
&gt;<br>
&gt;<br>
&gt; On Wed, 15 Aug 2018, 4:21 pm Kevin Hilman, &lt;<a href=3D"mailto:khil=
man@baylibre.com" target=3D"_blank">khilman@baylibre.com</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; &quot;Matt Hart&quot; &lt;<a href=3D"mailto:matthew.hart@linaro.o=
rg" target=3D"_blank">matthew.hart@linaro.org</a>&gt; writes:<br>
&gt;&gt;<br>
&gt;&gt; &gt; Does anyone have a strong opinion about where we get our com=
piler<br>
&gt;&gt; &gt; releases from?<br>
&gt;&gt;<br>
&gt;&gt; I think the current tarball way is a hack and not scalable, so...=
<br>
&gt;&gt;<br>
&gt;&gt; &gt; Currently it&#39;s a mash up of Linaro for ARM(32/64), MIPS =
from unknown,<br>
&gt;&gt; &gt; and X86 from whatever ubuntu is installed on the builder<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; As part of my work to start building with multiple compiler =
versions,<br>
&gt;&gt; &gt; I&#39;ve been creating Dockerfiles for the builders with dif=
ferent<br>
&gt;&gt; &gt; compiler versions installed in them. As I&#39;ve been doing =
this, it&#39;s<br>
&gt;&gt; &gt; been really easy to just install the various compilers packa=
ges from<br>
&gt;&gt; &gt; Debian. They also cover a lot of architectures we&#39;re hop=
ing to add in<br>
&gt;&gt; &gt; the future.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Anyone mind if we start using Debian toolchain releases in f=
uture?<br>
&gt;&gt; &gt; I&#39;m no toolchain expert, so I&#39;m looking for some opi=
nions.<br>
&gt;&gt;<br>
&gt;&gt; It&#39;s better than what we&#39;re doing today, and has a much c=
learer<br>
&gt;&gt; upgrade/migration path, so I say go for it!<br>
&gt;<br>
&gt;<br>
&gt; The only concern I can think of is that it&#39;s going to be a bit ha=
rder for<br>
&gt; those not fortunate enough to run Debian to get the toolchains if the=
re&#39;s<br>
&gt; some reason to reproduce things. On the other hand that&#39;s a rare =
occurrence<br>
&gt; and with moving the builders more to Docker there&#39;s always the op=
tion of<br>
&gt; using the container to get the compilers on other OSs.<br>
<br>
I&#39;ve been thinking about adding a section to the build page of &quot;r=
epeat<br>
this build&quot; and a link to either a dockerfile or image which runs the=
<br>
identical steps in the same environment, it could be a really nice<br>
feature to add.<br></blockquote></div><div><br></div><div>That&#39;d be a =
neat thing to have!</div><div><br></div><div class=3D"gmail_quote"><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc s=
olid;padding-left:1ex">
<br>
&gt;<br>
&gt;&gt;<br>
&gt;&gt; Kevin<br>
&gt;&gt;<br>
&gt;&gt; <br>
&gt;&gt;<br>
&gt;<br>
<br>
<br>
<br>
</blockquote></div>

--000000000000711ccd05737bce8a--
