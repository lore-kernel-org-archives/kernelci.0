MIME-Version: 1.0
References: <CAJrz+7+ey-o8xEa9G_dkKzCz+HjGPLvf+jP9gC4ntt5VN8WFXw@mail.gmail.com>
In-Reply-To: <CAJrz+7+ey-o8xEa9G_dkKzCz+HjGPLvf+jP9gC4ntt5VN8WFXw@mail.gmail.com>
From: "Guillaume Tucker" <guillaume.tucker@gmail.com>
Date: Thu, 11 Oct 2018 09:31:16 +0100
Message-ID: <CAH1_8nDQ7D77QHtHkKiBLNkwaS5TgMOWB=HOAzJ3ayzC9QDv4Q@mail.gmail.com>
Subject: Re: [kernelci] KernelCI NG master plan
Content-Type: multipart/alternative; boundary="00000000000011c9ed0577efcc72"
List-ID: <kernelci.groups.io>
To: kernelci@groups.io
Cc: charles.oliveira@linaro.org

--00000000000011c9ed0577efcc72
Content-Type: text/plain; charset="UTF-8"

On Fri, Oct 5, 2018 at 1:19 PM Milosz Wasilewski <
milosz.wasilewski@linaro.org> wrote:

> Hi,
>
> This is follow up to the discussion we had on Monday meeting. The idea
> was also discussed at Linaro Connect in Vancouver so should not come
> as a surprise.
>
> The problem:
> As we want to present test results filtering becomes an issue. There
> are different users with different filtering needs. Current
> implementation at kernelci.org sorts tests results by board.
>
> Alternative implementation by Baylibre [1] sorts by build. There can
> be countless other options for filtering tests and for each of them
> someone would have to code that in the backend and frontend.
>
> Proposed solution:
> Replace backend with 'search engine'. Current proposals for the search
> engines are: elastic search, graylog. But we're not limited to them.
> One of the frontends should be a configurable dashboard (like Kibana
> for ES).
>

Following what I mentioned during the meeting this Monday, it
would seem worthwhile separating the logic that processes
incoming test results from the actual data storage in our current
kernelci-backend.  This would make it possible to keep using the
same code to parse LAVA callback data, generate email reports,
trigger automated bisections and keep developing this while other
parts of the system are moving.

Essentially, rather than storing data in MongoDB, it would be
abstracted in order to be able to replace it with an arbitrary
data storage service which may be remote (Elasticsearch,
SQUAD...).  We're already using abstract model classes in the
backend, so I think it's mostly the case of implementing
alternative database I/O handlers.  The assumption is that data
exchanges would only occur when receiving new data, so there
shouldn't be too much traffic.  It would however be quite
inefficient if a client service was still going through the
existing kernelci-backend API to retrieve data as each request
would generate more traffic with the actual storage service.


> Current frontend will have to stay, so it needs to be migrated to new
> backend. If we move from redis-mongo to ES for example this would only
> require changing search criteria (they're most likely not compatible).
>
> Scope of the project:
> 1. get the list of possible backends (search engines)
> 2. get the list of possible configurable dashboards (Kibana etc.)
> 3. create proof of concept for new solution (with existing data) and
> present for discussion
>

How about listing pros and cons with each option to justify which
ones were chosen and maybe open this for discussion?

Once we get here, following steps might be:
>
> 4. select search engine to be used
> 5. start pushing data to both old and new backends
>

This may be done by still writing results in a local MongoDB and
forwarding them to another storage engine from the code that
handlers test results, rather than posting the results
twice (based on what I explained earlier with splitting the
kernelci-backend code).


> 6. migrate current frontend to the new backend
>

And this should hopefully mean we can shrink the API on
kernelci-backend to only post data and schedule email reports.


> 7. enable configurable dashboard for the search engine
> 8. prepare set of predefined dashboards that should cover 90% of use
> cases (mainly for test results)
>

It sounds like we would need to do a study and have a clear
picture of the use-cases before we can claim we cover 90% of
them.  Do we already have this somewhere?

Any comments are welcome. Together with Charles we're starting on 1-3 next
> week.
>
> [1] http://kernelci.dev.baylibre.com:8080/test-build/
>
> Best Regards,
> milosz
>
> 
>
>

--00000000000011c9ed0577efcc72
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div di=
r=3D"ltr"><div dir=3D"ltr"><br><br><div class=3D"gmail_quote"><div dir=3D"l=
tr">On Fri, Oct 5, 2018 at 1:19 PM Milosz Wasilewski &lt;<a href=3D"mailto:=
milosz.wasilewski@linaro.org">milosz.wasilewski@linaro.org</a>&gt; wrote:<b=
r></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi,<br>
<br>
This is follow up to the discussion we had on Monday meeting. The idea<br>
was also discussed at Linaro Connect in Vancouver so should not come<br>
as a surprise.<br>
<br>
The problem:<br>
As we want to present test results filtering becomes an issue. There<br>
are different users with different filtering needs. Current<br>
implementation at <a href=3D"http://kernelci.org" rel=3D"noreferrer" targe=
t=3D"_blank">kernelci.org</a> sorts tests results by board.<br>
<br>
Alternative implementation by Baylibre [1] sorts by build. There can<br>
be countless other options for filtering tests and for each of them<br>
someone would have to code that in the backend and frontend.<br>
<br>
Proposed solution:<br>
Replace backend with &#39;search engine&#39;. Current proposals for the se=
arch<br>
engines are: elastic search, graylog. But we&#39;re not limited to them.<b=
r>
One of the frontends should be a configurable dashboard (like Kibana<br>
for ES).<br></blockquote><div><br></div><div><div>Following what I mention=
ed during the meeting this Monday, it</div><div>would seem worthwhile separ=
ating the logic that processes</div><div>incoming test results from the act=
ual data storage in our current</div><div>kernelci-backend.=C2=A0 This woul=
d make it possible to keep using the</div><div>same code to parse LAVA call=
back data, generate email reports,</div><div>trigger automated bisections a=
nd keep developing this while other</div><div>parts of the system are movin=
g.</div><div><br></div><div>Essentially, rather than storing data in MongoD=
B, it would be</div><div>abstracted in order to be able to replace it with =
an arbitrary</div><div>data storage service which may be remote (Elasticsea=
rch,</div><div>SQUAD...).=C2=A0 We&#39;re already using abstract model clas=
ses in the</div><div>backend, so I think it&#39;s mostly the case of implem=
enting</div><div>alternative database I/O handlers.=C2=A0 The assumption is=
 that data</div><div>exchanges would only occur when receiving new data, so=
 there</div><div>shouldn&#39;t be too much traffic.=C2=A0 It would however =
be quite</div><div>inefficient if a client service was still going through =
the</div><div>existing kernelci-backend API to retrieve data as each reques=
t</div><div>would generate more traffic with the actual storage service.</d=
iv></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>
Current frontend will have to stay, so it needs to be migrated to new<br>
backend. If we move from redis-mongo to ES for example this would only<br>
require changing search criteria (they&#39;re most likely not compatible).=
<br>
<br>
Scope of the project:<br>
1. get the list of possible backends (search engines)<br>
2. get the list of possible configurable dashboards (Kibana etc.)<br>
3. create proof of concept for new solution (with existing data) and<br>
present for discussion<br></blockquote><div>=C2=A0</div><div><div>How abou=
t listing pros and cons with each option to justify which</div><div>ones we=
re chosen and maybe open this for discussion?</div></div><div><br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex">
Once we get here, following steps might be:<br>
<br>
4. select search engine to be used<br>
5. start pushing data to both old and new backends<br></blockquote><div><b=
r></div><div><div>This may be done by still writing results in a local Mong=
oDB and</div><div>forwarding them to another storage engine from the code t=
hat</div><div>handlers test results, rather than posting the results</div><=
div>twice (based on what I explained earlier with splitting the</div><div>k=
ernelci-backend code).</div></div><div>=C2=A0</div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex">
6. migrate current frontend to the new backend<br></blockquote><div><br></=
div><div><div>And this should hopefully mean we can shrink the API on</div>=
<div>kernelci-backend to only post data and schedule email reports.</div></=
div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
7. enable configurable dashboard for the search engine<br>
8. prepare set of predefined dashboards that should cover 90% of use<br>
cases (mainly for test results)<br></blockquote><div>=C2=A0</div><div><div=
>It sounds like we would need to do a study and have a clear</div><div>pict=
ure of the use-cases before we can claim we cover 90% of</div><div>them.=C2=
=
=A0 Do we already have this somewhere?</div></div><div><br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex">
Any comments are welcome. Together with Charles we&#39;re starting on 1-3 =
next week.<br>
<br>
[1] <a href=3D"http://kernelci.dev.baylibre.com:8080/test-build/" rel=3D"n=
oreferrer" target=3D"_blank">http://kernelci.dev.baylibre.com:8080/test-bui=
ld/</a><br>
<br>
Best Regards,<br>
milosz<br>
<br>
<br>
<br>
</blockquote></div></div></div></div></div></div></div>

--00000000000011c9ed0577efcc72--
