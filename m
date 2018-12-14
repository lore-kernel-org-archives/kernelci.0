MIME-Version: 1.0
References: <156B05B433F3FE31.13312@groups.io> <156B0FC1529DA050.14370@groups.io>
 <CAH+k93GfA+iH65v=1Pae50UyTk8bjgG_5VHWqNF=ALCd+TC5ZA@mail.gmail.com>
In-Reply-To: <CAH+k93GfA+iH65v=1Pae50UyTk8bjgG_5VHWqNF=ALCd+TC5ZA@mail.gmail.com>
From: "Guillaume Tucker" <guillaume.tucker@gmail.com>
Date: Fri, 14 Dec 2018 14:50:45 +0000
Message-ID: <CAH1_8nCbPswTR84pGYQeXc7V2geKRcpaOret5=bfNUdierho1w@mail.gmail.com>
Subject: Re: [kernelci] Backend troubles - temporarily refusing to accept test results
Content-Type: multipart/alternative; boundary="00000000000006e844057cfc8fdd"
List-ID: <kernelci.groups.io>
To: kernelci@groups.io

--00000000000006e844057cfc8fdd
Content-Type: text/plain; charset="UTF-8"

On Wed, Nov 28, 2018 at 12:53 PM Matt Hart <matthew.hart@linaro.org> wrote:

> We've also had to disable the test views on the website, for the same
> reason, so all views of https://kernelci.org/test will get a 404.
>

This was all re-enabled last week after addressing some
performance problems in kernelci-backend.

Guillaume


> On Tue, 27 Nov 2018 at 18:50, Matt Hart <matthew.hart@linaro.org> wrote:
> >
> > This has now been done, and the backend load average is much improved.
> > If anyone continues to see an unresponsive part of the frontend
> > (https://kernelci.org) please let me know.
> >
> > On Tue, 27 Nov 2018 at 15:46, Matt Hart <matthew.hart@linaro.org> wrote:
> > >
> > > Hi all,
> > >
> > > The kernelci API has been struggling since last week, to the point
> > > that the celery service grinds to a halt and stops processing some
> > > requests. This causes the website to hang, the API to start timing
> > > out, and general failures in the service.
> > >
> > > For reasons we (Guillaume and I) have not yet been able to fully
> > > understand, the importing of test results takes much longer than other
> > > tasks and causes the highest load. We are now running more test jobs
> > > than before and the data structures will likely need tuning in the
> > > future.
> > >
> > > As the service failures are becoming more and more frequent, in an
> > > attempt to keep the core service up and running, we have decided to
> > > make a quick patch to production to temporarily stop processing test
> > > results, until such time as the problem is better understood.
> > >
> > > Matt
>

--00000000000006e844057cfc8fdd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br><div class=3D"gmail_quote"><div dir=
=3D"ltr">On Wed, Nov 28, 2018 at 12:53 PM Matt Hart &lt;<a href=3D"mailto:m=
atthew.hart@linaro.org">matthew.hart@linaro.org</a>&gt; wrote:<br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex">We&#39;ve also had to disabl=
e the test views on the website, for the same<br>
reason, so all views of <a href=3D"https://kernelci.org/test" rel=3D"norefe=
rrer" target=3D"_blank">https://kernelci.org/test</a> will get a 404.<br></=
blockquote><div>=C2=A0</div><div>This was all re-enabled last week after ad=
dressing some</div><div>performance problems in kernelci-backend.</div><div=
><br></div><div>Guillaume=C2=A0</div><div>=C2=A0</div><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex">
On Tue, 27 Nov 2018 at 18:50, Matt Hart &lt;<a href=3D"mailto:matthew.hart@=
linaro.org" target=3D"_blank">matthew.hart@linaro.org</a>&gt; wrote:<br>
&gt;<br>
&gt; This has now been done, and the backend load average is much improved.=
<br>
&gt; If anyone continues to see an unresponsive part of the frontend<br>
&gt; (<a href=3D"https://kernelci.org" rel=3D"noreferrer" target=3D"_blank"=
>https://kernelci.org</a>) please let me know.<br>
&gt;<br>
&gt; On Tue, 27 Nov 2018 at 15:46, Matt Hart &lt;<a href=3D"mailto:matthew.=
hart@linaro.org" target=3D"_blank">matthew.hart@linaro.org</a>&gt; wrote:<b=
r>
&gt; &gt;<br>
&gt; &gt; Hi all,<br>
&gt; &gt;<br>
&gt; &gt; The kernelci API has been struggling since last week, to the poin=
t<br>
&gt; &gt; that the celery service grinds to a halt and stops processing som=
e<br>
&gt; &gt; requests. This causes the website to hang, the API to start timin=
g<br>
&gt; &gt; out, and general failures in the service.<br>
&gt; &gt;<br>
&gt; &gt; For reasons we (Guillaume and I) have not yet been able to fully<=
br>
&gt; &gt; understand, the importing of test results takes much longer than =
other<br>
&gt; &gt; tasks and causes the highest load. We are now running more test j=
obs<br>
&gt; &gt; than before and the data structures will likely need tuning in th=
e<br>
&gt; &gt; future.<br>
&gt; &gt;<br>
&gt; &gt; As the service failures are becoming more and more frequent, in a=
n<br>
&gt; &gt; attempt to keep the core service up and running, we have decided =
to<br>
&gt; &gt; make a quick patch to production to temporarily stop processing t=
est<br>
&gt; &gt; results, until such time as the problem is better understood.<br>
&gt; &gt;<br>
&gt; &gt; Matt<br></blockquote></div></div></div>

--00000000000006e844057cfc8fdd--
