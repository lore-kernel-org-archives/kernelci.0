MIME-Version: 1.0
References: <7himwxvr6m.fsf@baylibre.com> <CAH+k93EBGwnAbwvCDF3PmaCvS+Fpk6FTVtgdB37h-twqZf4hvQ@mail.gmail.com>
 <20190305170426.4kuzc4fq7fmvoeud@xps.therub.org> <15891FEF165BAE41.4955@groups.io>
 <CAH1_8nC=aa9jOa1rTzb7=joDXqjTDty+qeGe4bqpE11fqOgN-A@mail.gmail.com> <7hr2bct26z.fsf@baylibre.com>
In-Reply-To: <7hr2bct26z.fsf@baylibre.com>
From: "Guillaume Tucker" <guillaume.tucker@gmail.com>
Date: Mon, 18 Mar 2019 10:33:11 +0000
Message-ID: <CAH1_8nBRcPX5teqpM773KZGhiV3nrPwWToE3_RFZLZn2idN8yg@mail.gmail.com>
Subject: Re: staging projects in github
Content-Type: multipart/alternative; boundary="000000000000f0898f05845bea19"
List-ID: <kernelci.groups.io>
To: Kevin Hilman <khilman@baylibre.com>
Cc: kernelci@groups.io, Dan Rue <dan.rue@linaro.org>, Matt Hart <matthew.hart@linaro.org>

--000000000000f0898f05845bea19
Content-Type: text/plain; charset="UTF-8"

On Tue, Mar 12, 2019 at 5:47 PM Kevin Hilman <khilman@baylibre.com> wrote:

> Guillaume Tucker <guillaume.tucker@gmail.com> writes:
>
> > On Tue, Mar 5, 2019 at 5:24 PM Guillaume Tucker via Groups.Io
> > <guillaume.tucker=gmail.com@groups.io> wrote:
> >
> >>
> >> On Tue, Mar 5, 2019 at 5:04 PM Dan Rue <dan.rue@linaro.org> wrote:
> >>
> >>> On Tue, Mar 05, 2019 at 04:48:52PM +0000, Matt Hart wrote:
> >>> > On Tue, 5 Mar 2019 at 05:14, Kevin Hilman <khilman@baylibre.com>
> wrote:
> >>> > >
> >>> > > Can we consolidate the various "-staging" project in github with
> the
> >>> > > originals?  I've never fully understood why we created separate
> github
> >>> > > projects, when we should just be using a staging branch within the
> >>> main
> >>> > > project.
> >>
> >> [...]
> >
> >> I'm not sure if I'm considering all of the use-cases, but in the past
> >>> I've much preferred having staging == "master" and then tagging for
> >>> production releases. This does make it difficult (but not impossible)
> to
> >>> have things in staging that are not promoted to production.
> >>>
> >>
> >> What would make most sense imo would be to have the master branch
> >> receiving the PRs (like Dan wrote) and a live "prod" branch used
> >> by Jenkins.
> >>
> >
> > So how about having one last staging -> prod sync this week using
> > the kernelci-core-staging project, and then switch to using
> > kernelci-core only starting from next week?
>
> Sounds good to me.


So staging-20190315 was merged and deployed on Friday.  I've now
updated the kernelci.org Jenkins jobs in production to use a
kernelci.org branch from kernelci-core.

We can start using kernelci-core/master branch for pull requests
instead of the kernelci-core-staging repository.  There are a few
PRs left in kernelci-core-staging, I suggest we try to merge
those that are almost ready by Thursday and cherry-pick the
changes in kernelci-core, and any PR left open on Friday should
be closed and probably opened again in kernelci-core.

See the kernelci-core project in Github:

  https://github.com/kernelci/kernelci-core

Open PRs in kernelci-core-staging:

  https://github.com/kernelci/kernelci-core-staging/pulls

I've also created a staging.kernelci.org branch in kernelci-core,
the idea being that we can use that to run some jobs on
staging.kernelci.org.  This should be especially useful for
occasional contributors who don't have an account on the staging
Jennkins instance: someone can put the code from their PRs on
that branch to have it tested for them.  It can also be used like
the staging branch in kernelci-backend, to test that on-going PRs
work when integrated together.

Both the kernelci.org and staging.kernelci.org branches are not
for merging pull requests, they are just a way to configure the
Jenkins jobs on the corresponding instances.

The next step is to update the README file in kernelci-core and
the wiki accordingly.  Essentially, the workflow now becomes very
simple from a contributor's point of view with regular PRs
against the master branch.  For production updates, we should
create a tag on the master branch and update the kernelci.org
branch to match that rather than create a "staging" PR.  We
should however sent notes to the mailing list with a summary like
in past staging PRs with things going into production.  Please
let me know if you have any suggestions to do things differently.

Guillaume

--000000000000f0898f05845bea19
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div di=
r=3D"ltr">On Tue, Mar 12, 2019 at 5:47 PM Kevin Hilman &lt;<a href=3D"mailt=
o:khilman@baylibre.com">khilman@baylibre.com</a>&gt; wrote:<br></div><div c=
lass=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Guil=
laume Tucker &lt;<a href=3D"mailto:guillaume.tucker@gmail.com" target=3D"_b=
lank">guillaume.tucker@gmail.com</a>&gt; writes:<br>
<br>
&gt; On Tue, Mar 5, 2019 at 5:24 PM Guillaume Tucker via Groups.Io<br>
&gt; &lt;guillaume.tucker=3D<a href=3D"mailto:gmail.com@groups.io" target=
=3D"_blank">gmail.com@groups.io</a>&gt; wrote:<br>
&gt;<br>
&gt;&gt;<br>
&gt;&gt; On Tue, Mar 5, 2019 at 5:04 PM Dan Rue &lt;<a href=3D"mailto:dan.r=
ue@linaro.org" target=3D"_blank">dan.rue@linaro.org</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt;&gt; On Tue, Mar 05, 2019 at 04:48:52PM +0000, Matt Hart wrote:<br>
&gt;&gt;&gt; &gt; On Tue, 5 Mar 2019 at 05:14, Kevin Hilman &lt;<a href=3D"=
mailto:khilman@baylibre.com" target=3D"_blank">khilman@baylibre.com</a>&gt;=
 wrote:<br>
&gt;&gt;&gt; &gt; &gt;<br>
&gt;&gt;&gt; &gt; &gt; Can we consolidate the various &quot;-staging&quot; =
project in github with the<br>
&gt;&gt;&gt; &gt; &gt; originals?=C2=A0 I&#39;ve never fully understood why=
 we created separate github<br>
&gt;&gt;&gt; &gt; &gt; projects, when we should just be using a staging bra=
nch within the<br>
&gt;&gt;&gt; main<br>
&gt;&gt;&gt; &gt; &gt; project.<br>
&gt;&gt;<br>
&gt;&gt; [...]<br>
&gt;<br>
&gt;&gt; I&#39;m not sure if I&#39;m considering all of the use-cases, but =
in the past<br>
&gt;&gt;&gt; I&#39;ve much preferred having staging =3D=3D &quot;master&quo=
t; and then tagging for<br>
&gt;&gt;&gt; production releases. This does make it difficult (but not impo=
ssible) to<br>
&gt;&gt;&gt; have things in staging that are not promoted to production.<br=
>
&gt;&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; What would make most sense imo would be to have the master branch<=
br>
&gt;&gt; receiving the PRs (like Dan wrote) and a live &quot;prod&quot; bra=
nch used<br>
&gt;&gt; by Jenkins.<br>
&gt;&gt;<br>
&gt;<br>
&gt; So how about having one last staging -&gt; prod sync this week using<b=
r>
&gt; the kernelci-core-staging project, and then switch to using<br>
&gt; kernelci-core only starting from next week?<br>
<br>
Sounds good to me.</blockquote><div><br></div><div><div><div>So staging-201=
90315 was merged and deployed on Friday.=C2=A0 I&#39;ve now</div><div>updat=
ed the <a href=3D"http://kernelci.org">kernelci.org</a> Jenkins jobs in pro=
duction to use a</div><div><a href=3D"http://kernelci.org">kernelci.org</a>=
 branch from kernelci-core.</div></div><div><br></div><div>We can start usi=
ng kernelci-core/master branch for pull requests<br></div><div>instead of t=
he kernelci-core-staging repository.=C2=A0 There are a few</div><div>PRs le=
ft in kernelci-core-staging, I suggest we try to merge</div><div>those that=
 are almost ready by Thursday and cherry-pick the</div><div>changes in kern=
elci-core, and any PR left open on Friday should</div><div>be closed and pr=
obably opened again in kernelci-core.</div><div><br></div><div><div>See the=
 kernelci-core project in Github:</div><div><br></div><div>=C2=A0 <a href=
=3D"https://github.com/kernelci/kernelci-core">https://github.com/kernelci/=
kernelci-core</a></div><div><br></div></div><div>Open PRs in kernelci-core-=
staging:</div><div><br></div><div>=C2=A0 <a href=3D"https://github.com/kern=
elci/kernelci-core-staging/pulls">https://github.com/kernelci/kernelci-core=
-staging/pulls</a></div><div><br></div><div>I&#39;ve also created a <a href=
=3D"http://staging.kernelci.org">staging.kernelci.org</a> branch in kernelc=
i-core,</div><div>the idea being that we can use that to run some jobs on</=
div><div><a href=3D"http://staging.kernelci.org">staging.kernelci.org</a>.=
=C2=A0 This should be especially useful for</div><div>occasional contributo=
rs who don&#39;t have an account on the staging</div><div>Jennkins instance=
: someone can put the code from their PRs on</div><div>that branch to have =
it tested for them.=C2=A0 It can also be used like</div><div>the staging br=
anch in kernelci-backend, to test that on-going PRs</div><div>work when int=
egrated together.</div><div><br></div><div>Both the <a href=3D"http://kerne=
lci.org">kernelci.org</a> and <a href=3D"http://staging.kernelci.org">stagi=
ng.kernelci.org</a> branches are not</div><div>for merging pull requests, t=
hey are just a way to configure the</div><div>Jenkins jobs on the correspon=
ding instances.</div><div><br></div><div>The next step is to update the REA=
DME file in kernelci-core and</div><div>the wiki accordingly.=C2=A0 Essenti=
ally, the workflow now becomes very</div><div>simple from a contributor&#39=
;s point of view with regular PRs</div><div>against the master branch.=C2=
=A0 For production updates, we should</div><div>create a tag on the master =
branch and update the <a href=3D"http://kernelci.org">kernelci.org</a></div=
><div>branch to match that rather than create a &quot;staging&quot; PR.=C2=
=A0 We</div><div>should however sent notes to the mailing list with a summa=
ry like</div><div>in past staging PRs with things going into production.=C2=
=A0 Please</div><div>let me know if you have any suggestions to do things d=
ifferently.</div></div><div><br></div><div>Guillaume=C2=A0</div></div></div=
></div></div></div>

--000000000000f0898f05845bea19--
