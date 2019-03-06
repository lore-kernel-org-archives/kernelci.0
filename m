MIME-Version: 1.0
References: <1588C97FEBB21F35.22229@groups.io> <20190304153001.zzpbeanpbgejcj25@xps.therub.org>
In-Reply-To: <20190304153001.zzpbeanpbgejcj25@xps.therub.org>
From: "Guillaume Tucker" <guillaume.tucker@gmail.com>
Date: Wed, 6 Mar 2019 17:55:12 +0000
Message-ID: <CAH1_8nCtKJZkmig6J8xMvLZsoM-Dg7MH0VFb5g128xn-u3shVg@mail.gmail.com>
Subject: Re: Weekly Meeting 2019-03-04 #minutes
Content-Type: multipart/alternative; boundary="0000000000009a4f3f058370b172"
List-ID: <kernelci.groups.io>
To: kernelci@groups.io, Dan Rue <dan.rue@linaro.org>

--0000000000009a4f3f058370b172
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 4, 2019 at 3:30 PM Dan Rue <dan.rue@linaro.org> wrote:

> On Mon, Mar 04, 2019 at 09:00:19AM -0600, Dan Rue via Groups.Io wrote:
> > - Attendees: Charles Oliveira, Guenter Roeck, Dan Rue, Mark Brown, Matt
> >   Hart, Amro Hassan, Anders Roxell, Michal Galka, Daniel D=C3=ADaz, Gui=
llaume
> >   Tucker, Alice Ferrazzi
> > - Matt
> >   - I will do the PR to move clang builds to production
>

Is the agreement as discussed on IRC, to enable clang-8 in
production and have all the linux-next build results in the same
email report?

In this scenario, the clang-9 builds would still be run on
staging and sent to a smaller audience.


> >     - Will also move the google builders
> >   - Using idle cpu time on builders to run randconfig builds
> >     - Ask Arnd
> > - Broonie
> >   - rmk complaining it=E2=80=99s taking ~4 days to build his tree
> >     - There was a massive backlog last week somehow
> >     - Looks like it might=E2=80=99ve been to do with rolling out gtucke=
r=E2=80=99s
> >       changes, cleared now anyway.
>

Yes, that was the glitch I mentioned on IRC.  It's all fixed now.
There wasn't actually a big build backlog, just a problem with
the tree monitor job that got jammed.

Guillaume

--0000000000009a4f3f058370b172
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr">On Mon,=
 Mar 4, 2019 at 3:30 PM Dan Rue &lt;<a href=3D"mailto:dan.rue@linaro.org">d=
an.rue@linaro.org</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex">On Mon, Mar 04, 2019 at 09:00:1=
9AM -0600, Dan Rue via Groups.Io wrote:<br>
&gt; - Attendees: Charles Oliveira, Guenter Roeck, Dan Rue, Mark Brown, Mat=
t<br>
&gt;=C2=A0 =C2=A0Hart, Amro Hassan, Anders Roxell, Michal Galka, Daniel D=
=C3=ADaz, Guillaume<br>
&gt;=C2=A0 =C2=A0Tucker, Alice Ferrazzi<br>
&gt; - Matt<br>
&gt;=C2=A0 =C2=A0- I will do the PR to move clang builds to production<br><=
/blockquote><div><br></div><div><div>Is the agreement as discussed on IRC, =
to enable clang-8 in</div><div>production and have all the linux-next build=
 results in the same</div><div>email report?</div><div><br></div><div>In th=
is scenario, the clang-9 builds would still be run on</div><div>staging and=
 sent to a smaller audience.</div></div><div>=C2=A0</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">
&gt;=C2=A0 =C2=A0 =C2=A0- Will also move the google builders<br>
&gt;=C2=A0 =C2=A0- Using idle cpu time on builders to run randconfig builds=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0- Ask Arnd<br>
&gt; - Broonie<br>
&gt;=C2=A0 =C2=A0- rmk complaining it=E2=80=99s taking ~4 days to build his=
 tree<br>
&gt;=C2=A0 =C2=A0 =C2=A0- There was a massive backlog last week somehow<br>
&gt;=C2=A0 =C2=A0 =C2=A0- Looks like it might=E2=80=99ve been to do with ro=
lling out gtucker=E2=80=99s<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0changes, cleared now anyway.<br></blockquote=
><div><br></div><div><div>Yes, that was the glitch I mentioned on IRC.=C2=
=A0 It&#39;s all fixed now.</div><div>There wasn&#39;t actually a big build=
 backlog, just a problem with</div><div>the tree monitor job that got jamme=
d.</div></div><div><br></div><div>Guillaume</div></div></div></div></div>

--0000000000009a4f3f058370b172--
