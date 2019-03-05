MIME-Version: 1.0
References: <7himwxvr6m.fsf@baylibre.com> <CAH+k93EBGwnAbwvCDF3PmaCvS+Fpk6FTVtgdB37h-twqZf4hvQ@mail.gmail.com>
 <20190305170426.4kuzc4fq7fmvoeud@xps.therub.org>
In-Reply-To: <20190305170426.4kuzc4fq7fmvoeud@xps.therub.org>
From: "Guillaume Tucker" <guillaume.tucker@gmail.com>
Date: Tue, 5 Mar 2019 17:24:05 +0000
Message-ID: <CAH1_8nCxQXatG+nquLXPPFqUnpKzGcHfyj_Lek7bNtW82E4F-g@mail.gmail.com>
Subject: Re: staging projects in github
Content-Type: multipart/alternative; boundary="0000000000008b12b905835c243c"
List-ID: <kernelci.groups.io>
To: kernelci@groups.io, Dan Rue <dan.rue@linaro.org>
Cc: Matt Hart <matthew.hart@linaro.org>, Kevin Hilman <khilman@baylibre.com>

--0000000000008b12b905835c243c
Content-Type: text/plain; charset="UTF-8"

On Tue, Mar 5, 2019 at 5:04 PM Dan Rue <dan.rue@linaro.org> wrote:

> On Tue, Mar 05, 2019 at 04:48:52PM +0000, Matt Hart wrote:
> > On Tue, 5 Mar 2019 at 05:14, Kevin Hilman <khilman@baylibre.com> wrote:
> > >
> > > Can we consolidate the various "-staging" project in github with the
> > > originals?  I've never fully understood why we created separate github
> > > projects, when we should just be using a staging branch within the main
> > > project.
>

I never understood it either, and when I suggested to do
something else when I joined the project I was told that it would
be too complicated.  I guess maybe the dual repo set-up worked
initially when there weren't many changes going on.

In fact we're not actually using the master branch on
kernelci-core-staging any more for anything else than just
merging PRs. It's a much better workflow to be able to test each
PR branch individually before merging it using separate jobs on
the staging Jenkins server.

And by the way, the whole point is to not merge a PR before it
has been tested.  We're a CI project, remember?

> I *think* it was because you couldnt make a pull request against a branch,
> > however I think you can now set the default branch for PR on a project.
> > As long as that works, I'm all for it.
>
> I'm not sure if I'm considering all of the use-cases, but in the past
> I've much preferred having staging == "master" and then tagging for
> production releases. This does make it difficult (but not impossible) to
> have things in staging that are not promoted to production.
>

What would make most sense imo would be to have the master branch
receiving the PRs (like Dan wrote) and a live "prod" branch used
by Jenkins.  We can use tags as well, for every time we sync the
master branch with the production one, but I don't think it's
practical to use tags with Jenkins as you would need to update
all the jobs every time.


> As a user of kernelci, it does seem quite slow to get changes included
> into staging, and then also to wait for them get into production. I'm
> really interested in anything we can do to improve this turnaround time.
>

The key things in this respect are the time it takes to test
something on staging, which has improved recently with the extra
builders, and how to automate the steps to update production.  I
think we should soon consider automated testing on the PR
branches, but that's a whole topic of its own.

Guillaume

> > I've seen this come up a couple times now in causing confusion with new
> > > developers.
> > >
> > > Thanks,
> > >
> > > Kevin
>

--0000000000008b12b905835c243c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div di=
r=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"lt=
r"><div dir=3D"ltr"><div dir=3D"ltr"><br></div><div class=3D"gmail_quote"><=
div dir=3D"ltr" class=3D"gmail_attr">On Tue, Mar 5, 2019 at 5:04 PM Dan Rue=
 &lt;<a href=3D"mailto:dan.rue@linaro.org">dan.rue@linaro.org</a>&gt; wrote=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Tue, Mar 05=
, 2019 at 04:48:52PM +0000, Matt Hart wrote:<br>
&gt; On Tue, 5 Mar 2019 at 05:14, Kevin Hilman &lt;<a href=3D"mailto:khilma=
n@baylibre.com" target=3D"_blank">khilman@baylibre.com</a>&gt; wrote:<br>
&gt; &gt;<br>
&gt; &gt; Can we consolidate the various &quot;-staging&quot; project in gi=
thub with the<br>
&gt; &gt; originals?=C2=A0 I&#39;ve never fully understood why we created s=
eparate github<br>
&gt; &gt; projects, when we should just be using a staging branch within th=
e main<br>
&gt; &gt; project.<br></blockquote><div><br></div><div><div><div><div>I nev=
er understood it either, and when I suggested to do</div><div>something els=
e when I joined the project I was told that it would</div><div>be too compl=
icated.=C2=A0 I guess maybe the dual repo set-up worked</div><div>initially=
 when there weren&#39;t many changes going on.</div></div></div></div><div>=
<br></div><div><div><div>In fact we&#39;re not actually using the master br=
anch on</div><div>kernelci-core-staging any more for anything else than jus=
t</div><div>merging PRs. It&#39;s a much better workflow to be able to test=
 each</div><div>PR branch individually before merging it using separate job=
s on</div><div>the staging Jenkins server.</div><div><br></div><div>And by =
the way, the whole point is to not merge a PR before it</div><div>has been =
tested.=C2=A0 We&#39;re a CI project, remember?</div></div></div><div><br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt; I *think* it was because you couldnt make a pull request against a bra=
nch,<br>
&gt; however I think you can now set the default branch for PR on a project=
.<br>
&gt; As long as that works, I&#39;m all for it.<br>
<br>
I&#39;m not sure if I&#39;m considering all of the use-cases, but in the pa=
st<br>
I&#39;ve much preferred having staging =3D=3D &quot;master&quot; and then t=
agging for<br>
production releases. This does make it difficult (but not impossible) to<br=
>
have things in staging that are not promoted to production.<br></blockquote=
><div><br></div><div>What would make most sense imo would be to have the ma=
ster branch</div><div>receiving the PRs (like Dan wrote) and a live &quot;p=
rod&quot; branch used</div><div>by Jenkins.=C2=A0 We can use tags as well, =
for every time we sync the</div><div>master branch with the production one,=
 but I don&#39;t think it&#39;s</div><div>practical to use tags with Jenkin=
s as you would need to update</div><div>all the jobs every time.</div><div>=
=C2=A0<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
As a user of kernelci, it does seem quite slow to get changes included<br>
into staging, and then also to wait for them get into production. I&#39;m<b=
r>
really interested in anything we can do to improve this turnaround time.<br=
></blockquote><div>=C2=A0</div><div><div><div>The key things in this respec=
t are the time it takes to test</div><div>something on staging, which has i=
mproved recently with the extra</div><div>builders, and how to automate the=
 steps to update production.=C2=A0 I</div><div>think we should soon conside=
r automated testing on the PR</div><div>branches, but that&#39;s a whole to=
pic of its own.</div></div></div><div><br></div><div>Guillaume</div><div><b=
r></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex">&gt; &gt; I&#39;v=
e seen this come up a couple times now in causing confusion with new<br>
&gt; &gt; developers.<br>
&gt; &gt;<br>
&gt; &gt; Thanks,<br>
&gt; &gt;<br>
&gt; &gt; Kevin<br>
</blockquote></div></div></div></div></div></div></div></div></div></div></=
div>

--0000000000008b12b905835c243c--
