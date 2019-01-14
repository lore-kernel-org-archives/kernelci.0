MIME-Version: 1.0
References: <11625.1547100077211683125@groups.io> <20190110154222.atzjtmmjbkcxl3zx@xps.therub.org>
 <62079D2F712F7747B0BDCC6821B8DF0D013FB32B@G08CNEXMBPEKD02.g08.fujitsu.local>
In-Reply-To: <62079D2F712F7747B0BDCC6821B8DF0D013FB32B@G08CNEXMBPEKD02.g08.fujitsu.local>
From: charles.oliveira@linaro.org
Date: Mon, 14 Jan 2019 08:34:19 -0200
Message-ID: <CAGkC9eeY-75cJYeeHiDABNjLc8q37F7VTzo1hQPOKA0H96PR1g@mail.gmail.com>
Subject: Re: [Help] How to use kernelci to eastablish a local CI lab?
Content-Type: multipart/alternative; boundary="000000000000031d2c057f6897a4"
List-ID: <kernelci.groups.io>
To: kernelci@groups.io, lixm.fnst@cn.fujitsu.com
Cc: "dan.rue@linaro.org" <dan.rue@linaro.org>

--000000000000031d2c057f6897a4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Dan, Li,

I've been trying to understand that as well. If you have kernelci up and
running already, then you might be close to success.
Please visit: https://github.com/kernelci/kernelci-core. This is kernelci'=
s
repo for storing building schemes & templates as well as lab infos.
If I understand correctly, after setting up these scripts with a jenkins
instance, you should be ready to add you lab by editing this file:
https://github.com/kernelci/kernelci-core/blob/master/labs.ini.


Cheers,
Charles

On Fri, 11 Jan 2019 at 00:08, Li, Xiaoming <lixm.fnst@cn.fujitsu.com> wrot=
e:

> Reply is inline
>
> > On Wed, Jan 09, 2019 at 10:01:17PM -0800, Li, Xiaoming wrote:
> > > hi,all
> > >
> > > I am a rookie to kernelci.
> > > I have already install kernelci-docker and lava, then what should  I
> do  to
> > connetc them together?
> > > I have investigate the kernelci-wiki and kernelci related
> presentations, but still
> > got no clues.
> > > Could anyone give some hints or link?
> > > Thank you all.
> >
> > Hi Li Xiaoming!
> >
> > I'm working on something similar and so maybe we can work together on
> this.
> >
> > Do you have a lava instance online with boards attached already? It's
> not clear
> > if you already have LAVA, and are trying to add it as a kernelci lab, =
or
> if you're
> > asking how to set up LAVA.
>
> I know how to install LAVA, by lava-docker or the linaro's default metho=
d.
> Our lab has servral lava instance, so I can connect kernelci with lava
> either local or remote, if possible.
> Yes=EF=BC=8CI want to know how add lava to kernelci lab.
>
>
> >
> > As a side note, do you work with Liu Wenlong? I was reviewing his work=
 on
> > LAVA+Fuego yesterday, which may be related.
> Yes, Liu is my colleague.
> And Liu is not familiar with it.
>
> >
> > Thanks,
> > Dan
> >
> > --
> > Linaro - Kernel Validation
> >
> >
> >
> >
>
>
>
>
>=20
>
>

--000000000000031d2c057f6897a4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr">Hi Dan, Li,<div><br></di=
v><div>I&#39;ve been trying to understand that as well. If you have kernelc=
i up and running already, then you might be close to success.</div><div>Ple=
ase visit:=C2=A0<a href=3D"https://github.com/kernelci/kernelci-core">https=
://github.com/kernelci/kernelci-core</a>. This is kernelci&#39;s repo for s=
toring building schemes &amp; templates as well as lab infos.=C2=A0</div><d=
iv>If I understand correctly, after setting up these scripts with a jenkins=
 instance, you should be ready to add you lab by editing this file:=C2=A0<a=
 href=3D"https://github.com/kernelci/kernelci-core/blob/master/labs.ini">ht=
tps://github.com/kernelci/kernelci-core/blob/master/labs.ini</a>.</div><div=
><br></div><div><br></div><div>Cheers,</div><div>Charles</div></div></div><=
/div><br><div class=3D"gmail_quote"><div dir=3D"ltr">On Fri, 11 Jan 2019 at=
 00:08, Li, Xiaoming &lt;<a href=3D"mailto:lixm.fnst@cn.fujitsu.com">lixm.f=
nst@cn.fujitsu.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">Reply is inline<br>
<br>
&gt; On Wed, Jan 09, 2019 at 10:01:17PM -0800, Li, Xiaoming wrote:<br>
&gt; &gt; hi,all<br>
&gt; &gt;<br>
&gt; &gt; I am a rookie to kernelci.<br>
&gt; &gt; I have already install kernelci-docker and lava, then what shoul=
d=C2=A0 I do=C2=A0 to<br>
&gt; connetc them together?<br>
&gt; &gt; I have investigate the kernelci-wiki and kernelci related presen=
tations, but still<br>
&gt; got no clues.<br>
&gt; &gt; Could anyone give some hints or link?<br>
&gt; &gt; Thank you all.<br>
&gt; <br>
&gt; Hi Li Xiaoming!<br>
&gt; <br>
&gt; I&#39;m working on something similar and so maybe we can work togethe=
r on this.<br>
&gt; <br>
&gt; Do you have a lava instance online with boards attached already? It&#=
39;s not clear<br>
&gt; if you already have LAVA, and are trying to add it as a kernelci lab,=
 or if you&#39;re<br>
&gt; asking how to set up LAVA.<br>
<br>
I know how to install LAVA, by lava-docker or the linaro&#39;s default met=
hod.<br>
Our lab has servral lava instance, so I can connect kernelci with lava eit=
her local or remote, if possible.<br>
Yes=EF=BC=8CI want to know how add lava to kernelci lab.<br>
<br>
<br>
&gt; <br>
&gt; As a side note, do you work with Liu Wenlong? I was reviewing his wor=
k on<br>
&gt; LAVA+Fuego yesterday, which may be related.<br>
Yes, Liu is my colleague.<br>
And Liu is not familiar with it.<br>
<br>
&gt; <br>
&gt; Thanks,<br>
&gt; Dan<br>
&gt; <br>
&gt; --<br>
&gt; Linaro - Kernel Validation<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; <br>
<br>
<br>
<br>
<br>
<br>
<br>
</blockquote></div>

--000000000000031d2c057f6897a4--
