MIME-Version: 1.0
References: <20190123145037.ejmrlqzwjqewmgcr@xps.therub.org>
In-Reply-To: <20190123145037.ejmrlqzwjqewmgcr@xps.therub.org>
From: "Guillaume Tucker" <guillaume.tucker@gmail.com>
Date: Wed, 23 Jan 2019 23:32:16 +0000
Message-ID: <CAH1_8nAacp5i5A8vA-n92cVr372R5GQuFSE38kvb=BCGqD5s2g@mail.gmail.com>
Subject: Re: Weekly Meeting 2019-01-21 #minutes
Content-Type: multipart/alternative; boundary="000000000000cd107a0580288147"
List-ID: <kernelci.groups.io>
To: kernelci@groups.io, Dan Rue <dan.rue@linaro.org>

--000000000000cd107a0580288147
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 23, 2019 at 2:50 PM Dan Rue <dan.rue@linaro.org> wrote:

> - [gtucker]
>
[...]

>   - This week: reducing bisection duplicates, increasing bisection LAVA
>     job priority from =E2=80=9Clow=E2=80=9D to =E2=80=9Cmedium=E2=80=9D t=
o match other kernelci tests,
>     avoid sending the same bisection report more than once
>     - Idea: reply to previous bisection report when more platforms fail
>       with the same commit
>     - Use some kind of logic to avoid running many redundant bisections
>       when one change breaks tens of platforms


After considering several options, I think this is an efficient
way of using the build and lab resources while reporting all the
useful information we can:

* when several regressions are caused by a same commit, only run
  bisections on a handful of them (say, if it breaks all arm
  platforms, only pick a few arm boards randomly)

* when a bisection completes and passes all the checks (verify
  and revert), also run these checks on other platforms that were
  impacted by the regression

* list all the platforms on which the bisection results have been
  checked in the report, or keep replying to the report as extra
  checks come in, to increase the likelihood of someone having
  access to one and being able to debug the issue

* if other bisections complete and land on the same commit, don't
  send a report again as it would effectively be redundant

This will need to be done in several steps.  The first one is to
limit the number of bisections run with the same good/bad commit
range.  The next one is to make it possible for the bisection job
to know about the other platforms/arch/defconfig/labs that were
impacted by the regression to run checks on them (a GET request
from the HTTP API should do the job).  Then the last step is to
avoid sending the same report multiple times.

I'm working on the first step this week and I'll plan the other
parts to be done as a follow-up.  There are probably a few
subtleties and corner cases to take into account, but this is the
idea.  Please let me know if you have any thoughts.

Guillaume

--000000000000cd107a0580288147
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr">On Wed, Jan 23, 2019 at 2:50 PM Dan Rue &=
lt;<a href=3D"mailto:dan.rue@linaro.org">dan.rue@linaro.org</a>&gt; wrote:<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">- [gtucker]<br><=
/blockquote><div>[...]=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
=C2=A0 - This week: reducing bisection duplicates, increasing bisection LAV=
A<br>
=C2=A0 =C2=A0 job priority from =E2=80=9Clow=E2=80=9D to =E2=80=9Cmedium=E2=
=80=9D to match other kernelci tests,<br>
=C2=A0 =C2=A0 avoid sending the same bisection report more than once<br>
=C2=A0 =C2=A0 - Idea: reply to previous bisection report when more platform=
s fail<br>
=C2=A0 =C2=A0 =C2=A0 with the same commit<br>
=C2=A0 =C2=A0 - Use some kind of logic to avoid running many redundant bise=
ctions<br>
=C2=A0 =C2=A0 =C2=A0 when one change breaks tens of platforms</blockquote><=
div><br></div><div>After considering several options, I think this is an ef=
ficient</div><div>way of using the build and lab resources while reporting =
all the</div><div>useful information we can:</div><div><br></div><div>* whe=
n several regressions are caused by a same commit, only run</div><div>=C2=
=A0 bisections on a handful of them (say, if it breaks all arm</div><div>=
=C2=A0 platforms, only pick a few arm boards randomly)</div><div><br></div>=
<div>* when a bisection completes and passes all the checks (verify</div><d=
iv>=C2=A0 and revert), also run these checks on other platforms that were</=
div><div>=C2=A0 impacted by the regression</div><div><br></div><div>* list =
all the platforms on which the bisection results have been</div><div>=C2=A0=
 checked in the report, or keep replying to the report as extra</div><div>=
=C2=A0 checks come in, to increase the likelihood of someone having</div><d=
iv>=C2=A0 access to one and being able to debug the issue</div><div><br></d=
iv><div>* if other bisections complete and land on the same commit, don&#39=
;t</div><div>=C2=A0 send a report again as it would effectively be redundan=
t</div><div><br></div><div>This will need to be done in several steps.=C2=
=A0 The first one is to</div><div>limit the number of bisections run with t=
he same good/bad commit</div><div>range.=C2=A0 The next one is to make it p=
ossible for the bisection job</div><div>to know about the other platforms/a=
rch/defconfig/labs that were</div><div>impacted by the regression to run ch=
ecks on them (a GET request</div><div>from the HTTP API should do the job).=
=C2=A0 Then the last step is to</div><div>avoid sending the same report mul=
tiple times.</div><div><br></div><div>I&#39;m working on the first step thi=
s week and I&#39;ll plan the other</div><div>parts to be done as a follow-u=
p.=C2=A0 There are probably a few</div><div>subtleties and corner cases to =
take into account, but this is the</div><div>idea.=C2=A0 Please let me know=
 if you have any thoughts.</div><div><br></div><div>Guillaume=C2=A0</div></=
div></div></div>

--000000000000cd107a0580288147--
