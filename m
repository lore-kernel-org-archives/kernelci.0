MIME-Version: 1.0
References: <CAH+k93God7SdCeet-S=n4iUmLvyJr4+hORa=W852N_tKWFo8Qw@mail.gmail.com>
 <7hefezlkoi.fsf@baylibre.com>
In-Reply-To: <7hefezlkoi.fsf@baylibre.com>
From: broonie@gmail.com
Date: Wed, 15 Aug 2018 16:39:49 +0100
Message-ID: <CACNq6_a4fBc3Q8H4rDZwOSNsWLCZ9tJ-_oi+iKs_=gkkZHGf+A@mail.gmail.com>
Subject: Re: [kernelci] Compilers from.. debian?
Content-Type: multipart/alternative; boundary="000000000000c0cc2005737b23d0"
List-ID: <kernelci.groups.io>
To: kernelci@groups.io
Cc: Matt Hart <matthew.hart@linaro.org>

--000000000000c0cc2005737b23d0
Content-Type: text/plain; charset="UTF-8"

On Wed, 15 Aug 2018, 4:21 pm Kevin Hilman, <khilman@baylibre.com> wrote:

> "Matt Hart" <matthew.hart@linaro.org> writes:
>
> > Does anyone have a strong opinion about where we get our compiler
> releases from?
>
> I think the current tarball way is a hack and not scalable, so...
>
> > Currently it's a mash up of Linaro for ARM(32/64), MIPS from unknown,
> > and X86 from whatever ubuntu is installed on the builder
> >
> > As part of my work to start building with multiple compiler versions,
> > I've been creating Dockerfiles for the builders with different
> > compiler versions installed in them. As I've been doing this, it's
> > been really easy to just install the various compilers packages from
> > Debian. They also cover a lot of architectures we're hoping to add in
> > the future.
> >
> > Anyone mind if we start using Debian toolchain releases in future?
> > I'm no toolchain expert, so I'm looking for some opinions.
>
> It's better than what we're doing today, and has a much clearer
> upgrade/migration path, so I say go for it!
>

The only concern I can think of is that it's going to be a bit harder for
those not fortunate enough to run Debian to get the toolchains if there's
some reason to reproduce things. On the other hand that's a rare occurrence
and with moving the builders more to Docker there's always the option of
using the container to get the compilers on other OSs.


> Kevin
>
> 
>
>

--000000000000c0cc2005737b23d0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<br><br><div class=3D"gmail_quote"><div dir=3D"ltr">On Wed, 15 Aug 2018, 4:=
21 pm Kevin Hilman, &lt;<a href=3D"mailto:khilman@baylibre.com">khilman@bay=
libre.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">&quot;M=
att Hart&quot; &lt;<a href=3D"mailto:matthew.hart@linaro.org" target=3D"_bl=
ank">matthew.hart@linaro.org</a>&gt; writes:<br>
<br>
&gt; Does anyone have a strong opinion about where we get our compiler rel=
eases from?<br>
<br>
I think the current tarball way is a hack and not scalable, so...<br>
<br>
&gt; Currently it&#39;s a mash up of Linaro for ARM(32/64), MIPS from unkn=
own,<br>
&gt; and X86 from whatever ubuntu is installed on the builder<br>
&gt;<br>
&gt; As part of my work to start building with multiple compiler versions,=
<br>
&gt; I&#39;ve been creating Dockerfiles for the builders with different<br=
>
&gt; compiler versions installed in them. As I&#39;ve been doing this, it&=
#39;s<br>
&gt; been really easy to just install the various compilers packages from<=
br>
&gt; Debian. They also cover a lot of architectures we&#39;re hoping to ad=
d in<br>
&gt; the future.<br>
&gt;<br>
&gt; Anyone mind if we start using Debian toolchain releases in future?<br=
>
&gt; I&#39;m no toolchain expert, so I&#39;m looking for some opinions.<br=
>
<br>
It&#39;s better than what we&#39;re doing today, and has a much clearer<br=
>
upgrade/migration path, so I say go for it!<br></blockquote></div><div><br=
></div><div>The only concern I can think of is that it&#39;s going to be a =
bit harder for those not fortunate enough to run Debian to get the toolchai=
ns if there&#39;s some reason to reproduce things. On the other hand that&#=
39;s a rare occurrence and with moving the builders more to Docker there&#3=
9;s always the option of using the container to get the compilers on other =
OSs.=C2=A0</div><div><br></div><div class=3D"gmail_quote"><blockquote class=
=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;pad=
ding-left:1ex">
<br>
Kevin<br>
<br>
<br>
<br>
</blockquote></div>

--000000000000c0cc2005737b23d0--
