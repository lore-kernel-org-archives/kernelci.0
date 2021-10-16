MIME-Version: 1.0
References: <CAJBmjuiicSdw8wr4ecGf+5VrCWsg6nO2HU-5UbBE40LXKk0zDQ@mail.gmail.com>
 <4663533c-5d82-0780-a77d-2cb870b7b33a@gmail.com> <CAJBmjuggPYrFPOt=+7Cc_QSpa+yhf77VWgLJRP2Eq=cfhzm66w@mail.gmail.com>
 <49aa7dab-07eb-e218-4709-c28c0d0001aa@gmail.com> <CAJBmjuhcEk+gj7VhLvGP=9T=ML2WvRjLBgRAtBbq9x+9X9nTLw@mail.gmail.com>
 <7867af2b-a8aa-769d-0aca-deb4da94ae46@redhat.com>
In-Reply-To: <7867af2b-a8aa-769d-0aca-deb4da94ae46@redhat.com>
From: Aya Mahfouz <mahfouz.saif.elyazal@gmail.com>
Date: Sat, 16 Oct 2021 21:40:52 +0200
Message-ID: <CAJBmjujoPCJ6PyP=JjYn+gLMq=zB0Q+YKQ+=9CDnKzTw-Fkd9w@mail.gmail.com>
Subject: Re: Notifications signup
Content-Type: multipart/alternative; boundary="00000000000004fe8f05ce7d7e6f"
List-ID: <kernelci.groups.io>
To: Nikolai Kondrashov <Nikolai.Kondrashov@redhat.com>
Cc: kernelci@groups.io, Nikolai Kondrashov <spbnick@gmail.com>

--00000000000004fe8f05ce7d7e6f
Content-Type: text/plain; charset="UTF-8"

On Sat, Oct 16, 2021 at 10:55 AM Nikolai Kondrashov <
Nikolai.Kondrashov@redhat.com> wrote:

> On 10/15/21 9:18 PM, Aya Mahfouz wrote:
>  >     An alternative to get *structured* KCIDB data could be to mine our
> dataset
>  >     directly with SQL. See examples in the slides for a presentation I
> did,
>  >     starting from this one:
>  >
>  >
>  >
>
> https://docs.google.com/presentation/d/1ZrU0z1LvQYYoLOb9vmXUH7aZ9jSFviaenZRcYtEWqVg/edit#slide=id.gbcaa06c4d2_0_44
>  >
> <
> https://docs.google.com/presentation/d/1ZrU0z1LvQYYoLOb9vmXUH7aZ9jSFviaenZRcYtEWqVg/edit#slide=id.gbcaa06c4d2_0_44
> >
>  >
>  >
>  >     Links at the bottom of slides should work. Beside the SQL console,
> there are
>  >     of course APIs available for querying.
>  >
>  > Thanks Nick. Yes, I would like to query the data and extract custom
> results.
>  > However, I can't access it publicly. If the public access is not
> available
> at the
>  > moment. Can you please direct me to how can I use the APIs?
>
> Yes, unfortunately, you need to be authenticated to Google, but any
> account
> should be able to access the database. If not, I will need to fix it.
> What didn't work for you?
>

Thanks Nick. Now that you have told me, I revised the list of public
projects available and
found that you have the project listed as tutorial. So, it is working fine.


>
> Regarding the APIs, here's the intro to libraries in various languages:
>
>      https://cloud.google.com/bigquery/docs/reference/libraries
>
> And here's the REST API reference:
>
>      https://cloud.google.com/bigquery/docs/reference/rest
>
>  >     Another alternative is to subscribe to our submission message queue
> to
>  >     receive
>  >     build (as well as test) results in (relative) real time, as they
> come
> in. We
>  >     have a formal, documented schema for those JSON messages.
>  >
>  > How can I subscribe to the message queue?
>
> Check out the available Google PubSub libraries:
>
>      https://cloud.google.com/pubsub/docs/reference/libraries
>
> I can create a subscription for you and a service account, then setup
> access,
> and send you the service account key, which you can use to receive the
> data as
> it comes in using the libraries, or just the gcloud or kcidb command-line
> tools for the start. A REST API is also available:
>
>      https://cloud.google.com/pubsub/docs/reference/rest
>
> If this works for you, I'll set it up and send you the key.
>
>
Ok, I will read the documentation first and let you know if I need further
permissions.

Thanks,
Kind Regards,
Aya Saif El-yazal Mahfouz

Nick
>
> On 10/15/21 9:18 PM, Aya Mahfouz wrote:
> >
> >
> > On Fri, Oct 15, 2021 at 6:13 PM Nikolai Kondrashov <spbnick@gmail.com
> > <mailto:spbnick@gmail.com>> wrote:
> >
> >     Hi Aya,
> >
> >     On 10/15/21 6:39 PM, Aya Mahfouz wrote:
> >       >    I am looking for generic reports so any possible builds will
> be good.
> >
> >     If the maillists Guillaume suggest don't work for you, I'll be able
> to
> >     subscribe you to notification emails with the next release of KCIDB,
> coming
> >     this Autumn. Those would be human-targeted, though.
> >
> >     An alternative to get *structured* KCIDB data could be to mine our
> dataset
> >     directly with SQL. See examples in the slides for a presentation I
> did,
> >     starting from this one:
> >
> >
> >
> https://docs.google.com/presentation/d/1ZrU0z1LvQYYoLOb9vmXUH7aZ9jSFviaenZRcYtEWqVg/edit#slide=id.gbcaa06c4d2_0_44
> >     <
> https://docs.google.com/presentation/d/1ZrU0z1LvQYYoLOb9vmXUH7aZ9jSFviaenZRcYtEWqVg/edit#slide=id.gbcaa06c4d2_0_44
> >
> >
> >
> >     Links at the bottom of slides should work. Beside the SQL console,
> there are
> >     of course APIs available for querying.
> >
> > Thanks Nick. Yes, I would like to query the data and extract custom
> results.
> > However, I can't access it publicly. If the public access is not
> available at the
> > moment. Can you please direct me to how can I use the APIs?
> >
> >
> >     Another alternative is to subscribe to our submission message queue
> to
> >     receive
> >     build (as well as test) results in (relative) real time, as they
> come in. We
> >     have a formal, documented schema for those JSON messages.
> >
> > How can I subscribe to the message queue?
> >
> > Thanks,
> >
> > Kind Regards,
> > Aya Saif El-yazal Mahfouz
> >
> >     You can check out what data is available in KCIDB on the dashboard:
> >
> >     https://kcidb.kernelci.org/ <https://kcidb.kernelci.org/>
> >
> >     Nick
> >
> >     On 10/15/21 6:39 PM, Aya Mahfouz wrote:
> >      > Hello Nikolai,
> >      >
> >      >    I am looking for generic reports so any possible builds will
> be good.
> >      >
> >      > Thanks,
> >      >
> >      > Kind Regards,
> >      > Aya Saif El-yazal Mahfouz
> >      >
> >      >
> >      > On Fri, Oct 15, 2021 at 11:16 AM Nikolai Kondrashov <
> spbnick@gmail.com
> >     <mailto:spbnick@gmail.com>
> >      > <mailto:spbnick@gmail.com <mailto:spbnick@gmail.com>>> wrote:
> >      >
> >      >     Hi Aya,
> >      >
> >      >     On 10/14/21 9:28 PM, Aya Mahfouz wrote:
> >      >       > Hello,
> >      >       >
> >      >       >     I would like to sign up for receiving notifications of
> >     incoming build
> >      >       > results. In addition, I would like to ask if there is an
> API
> >     for the
> >      >     public to
> >      >       > fetch the build results in json format.
> >      >
> >      >     Do you want to receive native KernelCI build result
> notifications,
> >     or the
> >      >     KCIDB build notifications, which include build results from
> >     multiple other CI
> >      >     systems?
> >      >
> >      >     Which criteria do you want the notifications to be filtered
> by?
> >     Particular
> >      >     tree, repo, architecture, and so on?
> >      >
> >      >     Nick
> >      >
> >      >     On 10/14/21 9:28 PM, Aya Mahfouz wrote:
> >      >      > Hello,
> >      >      >
> >      >      >     I would like to sign up for receiving notifications of
> >     incoming build
> >      >      > results. In addition, I would like to ask if there is an
> API for the
> >      >     public to
> >      >      > fetch the build results in json format.
> >      >      >
> >      >      > Thanks,
> >      >      >
> >      >      > Kind Regards,
> >      >      > Aya Saif El-yazal Mahfouz >
> >
> > 
>
>

--00000000000004fe8f05ce7d7e6f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><div class=3D"gmail_quote"><div=
 dir=3D"ltr" class=3D"gmail_attr">On Sat, Oct 16, 2021 at 10:55 AM Nikolai =
Kondrashov &lt;<a href=3D"mailto:Nikolai.Kondrashov@redhat.com">Nikolai.Kon=
drashov@redhat.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">On 10/15/21 9:18 PM, Aya Mahfouz wrote:<br>
=C2=A0&gt;=C2=A0 =C2=A0 =C2=A0An alternative to get *structured* KCIDB data=
 could be to mine our dataset<br>
=C2=A0&gt;=C2=A0 =C2=A0 =C2=A0directly with SQL. See examples in the slides=
 for a presentation I did,<br>
=C2=A0&gt;=C2=A0 =C2=A0 =C2=A0starting from this one:<br>
=C2=A0&gt;<br>
=C2=A0&gt;<br>
=C2=A0&gt; <br>
<a href=3D"https://docs.google.com/presentation/d/1ZrU0z1LvQYYoLOb9vmXUH7aZ=
9jSFviaenZRcYtEWqVg/edit#slide=3Did.gbcaa06c4d2_0_44" rel=3D"noreferrer" ta=
rget=3D"_blank">https://docs.google.com/presentation/d/1ZrU0z1LvQYYoLOb9vmX=
UH7aZ9jSFviaenZRcYtEWqVg/edit#slide=3Did.gbcaa06c4d2_0_44</a><br>
=C2=A0&gt; <br>
&lt;<a href=3D"https://docs.google.com/presentation/d/1ZrU0z1LvQYYoLOb9vmXU=
H7aZ9jSFviaenZRcYtEWqVg/edit#slide=3Did.gbcaa06c4d2_0_44" rel=3D"noreferrer=
" target=3D"_blank">https://docs.google.com/presentation/d/1ZrU0z1LvQYYoLOb=
9vmXUH7aZ9jSFviaenZRcYtEWqVg/edit#slide=3Did.gbcaa06c4d2_0_44</a>&gt;<br>
=C2=A0&gt;<br>
=C2=A0&gt;<br>
=C2=A0&gt;=C2=A0 =C2=A0 =C2=A0Links at the bottom of slides should work. Be=
side the SQL console, <br>
there are<br>
=C2=A0&gt;=C2=A0 =C2=A0 =C2=A0of course APIs available for querying.<br>
=C2=A0&gt;<br>
=C2=A0&gt; Thanks Nick. Yes, I would like to query the data and extract cus=
tom results.<br>
=C2=A0&gt; However, I can&#39;t access it publicly. If the public access is=
 not available <br>
at the<br>
=C2=A0&gt; moment. Can you please direct me to how can I use the APIs?<br>
<br>
Yes, unfortunately, you need to be authenticated to Google, but any account=
 <br>
should be able to access the database. If not, I will need to fix it.<br>
What didn&#39;t work for you?<br></blockquote><div><br></div><div>Thanks Ni=
ck. Now that you have told me, I revised the list of public projects availa=
ble and</div><div>found that you have the project listed as tutorial. So, i=
t is working fine.<br></div><div>=C2=A0</div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex">
<br>
Regarding the APIs, here&#39;s the intro to libraries in various languages:=
<br>
<br>
=C2=A0 =C2=A0 =C2=A0<a href=3D"https://cloud.google.com/bigquery/docs/refer=
ence/libraries" rel=3D"noreferrer" target=3D"_blank">https://cloud.google.c=
om/bigquery/docs/reference/libraries</a><br>
<br>
And here&#39;s the REST API reference:<br>
<br>
=C2=A0 =C2=A0 =C2=A0<a href=3D"https://cloud.google.com/bigquery/docs/refer=
ence/rest" rel=3D"noreferrer" target=3D"_blank">https://cloud.google.com/bi=
gquery/docs/reference/rest</a><br>
<br>
=C2=A0&gt;=C2=A0 =C2=A0 =C2=A0Another alternative is to subscribe to our su=
bmission message queue to<br>
=C2=A0&gt;=C2=A0 =C2=A0 =C2=A0receive<br>
=C2=A0&gt;=C2=A0 =C2=A0 =C2=A0build (as well as test) results in (relative)=
 real time, as they come <br>
in. We<br>
=C2=A0&gt;=C2=A0 =C2=A0 =C2=A0have a formal, documented schema for those JS=
ON messages.<br>
=C2=A0&gt;<br>
=C2=A0&gt; How can I subscribe to the message queue?<br>
<br>
Check out the available Google PubSub libraries:<br>
<br>
=C2=A0 =C2=A0 =C2=A0<a href=3D"https://cloud.google.com/pubsub/docs/referen=
ce/libraries" rel=3D"noreferrer" target=3D"_blank">https://cloud.google.com=
/pubsub/docs/reference/libraries</a><br>
<br>
I can create a subscription for you and a service account, then setup acces=
s, <br>
and send you the service account key, which you can use to receive the data=
 as <br>
it comes in using the libraries, or just the gcloud or kcidb command-line <=
br>
tools for the start. A REST API is also available:<br>
<br>
=C2=A0 =C2=A0 =C2=A0<a href=3D"https://cloud.google.com/pubsub/docs/referen=
ce/rest" rel=3D"noreferrer" target=3D"_blank">https://cloud.google.com/pubs=
ub/docs/reference/rest</a><br>
<br>
If this works for you, I&#39;ll set it up and send you the key.<br>
<br></blockquote><div>=C2=A0</div><div>Ok, I will read the documentation fi=
rst and let you know if I need further permissions.</div><div><br></div><di=
v>Thanks,</div><div>Kind Regards,</div><div>Aya Saif El-yazal Mahfouz</div>=
<div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
Nick<br>
<br>
On 10/15/21 9:18 PM, Aya Mahfouz wrote:<br>
&gt; <br>
&gt; <br>
&gt; On Fri, Oct 15, 2021 at 6:13 PM Nikolai Kondrashov &lt;<a href=3D"mail=
to:spbnick@gmail.com" target=3D"_blank">spbnick@gmail.com</a> <br>
&gt; &lt;mailto:<a href=3D"mailto:spbnick@gmail.com" target=3D"_blank">spbn=
ick@gmail.com</a>&gt;&gt; wrote:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Hi Aya,<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0On 10/15/21 6:39 PM, Aya Mahfouz wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 I am looking for generic r=
eports so any possible builds will be good.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0If the maillists Guillaume suggest don&#39;t work f=
or you, I&#39;ll be able to<br>
&gt;=C2=A0 =C2=A0 =C2=A0subscribe you to notification emails with the next =
release of KCIDB, coming<br>
&gt;=C2=A0 =C2=A0 =C2=A0this Autumn. Those would be human-targeted, though.=
<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0An alternative to get *structured* KCIDB data could=
 be to mine our dataset<br>
&gt;=C2=A0 =C2=A0 =C2=A0directly with SQL. See examples in the slides for a=
 presentation I did,<br>
&gt;=C2=A0 =C2=A0 =C2=A0starting from this one:<br>
&gt; <br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"https://docs.google.com/presentation/d/1=
ZrU0z1LvQYYoLOb9vmXUH7aZ9jSFviaenZRcYtEWqVg/edit#slide=3Did.gbcaa06c4d2_0_4=
4" rel=3D"noreferrer" target=3D"_blank">https://docs.google.com/presentatio=
n/d/1ZrU0z1LvQYYoLOb9vmXUH7aZ9jSFviaenZRcYtEWqVg/edit#slide=3Did.gbcaa06c4d=
2_0_44</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://docs.google.com/presentation=
/d/1ZrU0z1LvQYYoLOb9vmXUH7aZ9jSFviaenZRcYtEWqVg/edit#slide=3Did.gbcaa06c4d2=
_0_44" rel=3D"noreferrer" target=3D"_blank">https://docs.google.com/present=
ation/d/1ZrU0z1LvQYYoLOb9vmXUH7aZ9jSFviaenZRcYtEWqVg/edit#slide=3Did.gbcaa0=
6c4d2_0_44</a>&gt;<br>
&gt; <br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Links at the bottom of slides should work. Beside t=
he SQL console, there are<br>
&gt;=C2=A0 =C2=A0 =C2=A0of course APIs available for querying.<br>
&gt; <br>
&gt; Thanks Nick. Yes, I would like to query the data and extract custom re=
sults.<br>
&gt; However, I can&#39;t access it publicly. If the public access is not a=
vailable at the<br>
&gt; moment. Can you please direct me to how can I use the APIs?<br>
&gt; <br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Another alternative is to subscribe to our submissi=
on message queue to<br>
&gt;=C2=A0 =C2=A0 =C2=A0receive<br>
&gt;=C2=A0 =C2=A0 =C2=A0build (as well as test) results in (relative) real =
time, as they come in. We<br>
&gt;=C2=A0 =C2=A0 =C2=A0have a formal, documented schema for those JSON mes=
sages. <br>
&gt; <br>
&gt; How can I subscribe to the message queue?<br>
&gt; <br>
&gt; Thanks,<br>
&gt; <br>
&gt; Kind Regards,<br>
&gt; Aya Saif El-yazal Mahfouz<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0You can check out what data is available in KCIDB o=
n the dashboard:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"https://kcidb.kernelci.org/" rel=3D"nore=
ferrer" target=3D"_blank">https://kcidb.kernelci.org/</a> &lt;<a href=3D"ht=
tps://kcidb.kernelci.org/" rel=3D"noreferrer" target=3D"_blank">https://kci=
db.kernelci.org/</a>&gt;<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Nick<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0On 10/15/21 6:39 PM, Aya Mahfouz wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; Hello Nikolai,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 I am looking for generic reports=
 so any possible builds will be good.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; Thanks,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; Kind Regards,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; Aya Saif El-yazal Mahfouz<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; On Fri, Oct 15, 2021 at 11:16 AM Nikolai Kond=
rashov &lt;<a href=3D"mailto:spbnick@gmail.com" target=3D"_blank">spbnick@g=
mail.com</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:spbnick@gmail.com" tar=
get=3D"_blank">spbnick@gmail.com</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; &lt;mailto:<a href=3D"mailto:spbnick@gmail.co=
m" target=3D"_blank">spbnick@gmail.com</a> &lt;mailto:<a href=3D"mailto:spb=
nick@gmail.com" target=3D"_blank">spbnick@gmail.com</a>&gt;&gt;&gt; wrote:<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0Hi Aya,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0On 10/14/21 9:28 PM, Aya M=
ahfouz wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; Hello,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =
=C2=A0I would like to sign up for receiving notifications of<br>
&gt;=C2=A0 =C2=A0 =C2=A0incoming build<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; results. In ad=
dition, I would like to ask if there is an API<br>
&gt;=C2=A0 =C2=A0 =C2=A0for the<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0public to<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; fetch the buil=
d results in json format.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0Do you want to receive nat=
ive KernelCI build result notifications,<br>
&gt;=C2=A0 =C2=A0 =C2=A0or the<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0KCIDB build notifications,=
 which include build results from<br>
&gt;=C2=A0 =C2=A0 =C2=A0multiple other CI<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0systems?<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0Which criteria do you want=
 the notifications to be filtered by?<br>
&gt;=C2=A0 =C2=A0 =C2=A0Particular<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0tree, repo, architecture, =
and so on?<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0Nick<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0On 10/14/21 9:28 PM, Aya M=
ahfouz wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt; Hello,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0=C2=A0 I=
 would like to sign up for receiving notifications of<br>
&gt;=C2=A0 =C2=A0 =C2=A0incoming build<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt; results. In addition=
, I would like to ask if there is an API for the<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0public to<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt; fetch the build resu=
lts in json format.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt; Thanks,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt; Kind Regards,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt; Aya Saif El-yazal Ma=
hfouz &gt;<br>
&gt;=20
<br>
</blockquote></div></div>

--00000000000004fe8f05ce7d7e6f--
