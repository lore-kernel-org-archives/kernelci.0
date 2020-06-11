MIME-Version: 1.0
References: <OSAPR01MB2385E0367B8CA545E1D66422B7890@OSAPR01MB2385.jpnprd01.prod.outlook.com>
In-Reply-To: <OSAPR01MB2385E0367B8CA545E1D66422B7890@OSAPR01MB2385.jpnprd01.prod.outlook.com>
From: Guillaume Tucker <guillaume.tucker@gmail.com>
Date: Thu, 11 Jun 2020 22:11:57 +0100
Message-ID: <CAH1_8nDMbmG-_Kgq51zgkwWXurfUC=OiACakeAbPz3Edh+xvhA@mail.gmail.com>
Subject: Re: Linking CIP testing with KernelCI
Content-Type: multipart/alternative; boundary="000000000000d2bfc605a7d56930"
List-ID: <kernelci.groups.io>
To: Chris Paterson <Chris.Paterson2@renesas.com>
Cc: Kevin Hilman <khilman@baylibre.com>, kernelci@groups.io

--000000000000d2bfc605a7d56930
Content-Type: text/plain; charset="UTF-8"

+ kernelci@groups.io as discussed

Hi Chris,

Thanks for starting this discussion, connecting the CIP test
system with KernelCI sounds like a perfect example of how the
project can grow.

On Thu, Jun 4, 2020 at 11:15 AM Chris Paterson <Chris.Paterson2@renesas.com>
wrote:

> Hello Guillaume, Kevin,
>
> I'd really like to get CIP linked into KernelCI somehow before ELC-NA in a
> few weeks.
> Are you both available for a quick chat this week/next to determine what
> kind of integration would be suitable, and how we can go about achieving it?
>

Sure, let's try to find a slot next week.


> Some ramblings below to start the discussion...
>
> # Background on the current CIP CI setup
> - We have a GitLab mirror of our kernel.org kernel repo
> - Our branches contain a simple .gitlab-ci.yml file that links to our
> build/test GitLab CI pipeline repository
> - Kernel builds are kicked off using the various arches/configs supported
> by CIP
> - Test jobs are then submitted to our LAVA master
> - We currently run simple boot tests, spectre/meltdown checker,
> cyclictest+hackbench (RT configs only) and LTP (only run on CIP release
> candidates)
> - If the builds and tests finish okay then GitLab shows a green tick, if
> there is some kind of build error, or test infrastructure error then GitLab
> shows a red cross
> - If individual test cases fail, or there is a test regression, currently
> there is no way of knowing in the Gitlab UI. This is why I want to start
> using KernelCI
> - We follow a similar process for Greg's stable-rc 4.4 and 4.19 branches,
> but don't run LTP
>

This sounds very similar to the experiment Kevin did with his own
tree and Gitlab CI, except he's using the command line tools from
kernelci-core.


> # Options for KernelCI integration (?)
> 1) Keep our current build/test pipeline the same, just add a notify
> section to the LAVA jobs to send the results to kernelci.org
> - We'd need to include the correct metadata etc.
>

I think we might be able to have commands that generate just the
meta-data for a given kernel build without actually doing a
build.  That would allow you to keep your current build system
and also stay in sync with the kernelci meta-data definitions.


> - Would this work if there is no corresponding 'build job'?
>

I don't think anyone is doing this right now but in any case it's
something we need to support, for example with static analysis
and other tests that don't require any build.  The only thing
that should be really required is the kernel revision (tree,
branch, sha1, git describe).  So, "yes" this needs to work.


> - Would you allow test results from the CIP SLTS Kernels on kernelci.org?
> Or would we need to set up our own instance?
>

Ideally, only upstream-oriented branches should be built and
tested on kernelci.org to keep it in line with the project's
mission and upstream kernel development.  If the CIP branches
consist only of backported patches from mainline, maybe it could
be accepted in the same way that we have stable branches.  If
however there are patches that are not intended to get merged
upstream and are there for specific products, then in my opinion
that would not be acceptable - see below for an alternative as
you suggested.


> 1b) Same as 1) but using either cip.kernelci.org or
> kernelci.ciplatform.org


Yes, having a separate instance would enable a separate
configuration, separate database, special features etc... so no
possible interference with the main kernelci.org
activities.  Having it as cip.kernelci.org means it would
probably be managed by the KernelCI LF project, I guess that
would make sense for a member.  But then if you host and manage
your own instance on kernelci.ciplatform.org you're of course
free to do anything you want with it.


> 2) kernelci.org starts monitoring/building/testing the CIP SLTS Kernels
> - Tests would run through our LAVA master
> - Perhaps kernelci.org could make use of our build infrastructure?
> 2b) Same as 2) but using either cip.kernelci.org or
> kernelci.ciplatform.org
>

The question of kernelci.org vs another instance remains the
same, in my opinion it all hinges on what is on the branches.

Doing this would give you automated bisection since the KernelCI
pipeline would be able to run arbitrary jobs in the LAVA lab.
Using your own build infrastructure would probably be another
argument in favour of a separate instance (e.g. cip.kernelci.org)
as this would be a custom use-case, unless you're happy to have
any kernelci.org kernel builds run on your infrastructure.

3) kernelci.org start submitting their usual test jobs to the CIP LAVA
> master
> - CIP currently have 11 different device-types (20 boards in total) which
> should help expand what is available to KernelCI
>

Maybe we could do that anyway, with filters to limit the upstream
branches and test suites to run if you want, and also work out a
solution for the CIP SLTS branches?


> My preferred option would be 1) as it would be nice not to lose all the
> work spent on the GitLab CI setup
> (or perhaps integrating the GitLab CI approach into KernelCI's setup is a
> worthwhile task, but it'll take time)
>

Yes I think Option 1 would be good given the timeframe you've
set.  Also it's going to be a recurring use-case, KernelCI is all
about being flexible enough to integrate existing CI systems with
no real modifications to them.  We can try things out with
staging.kernelci.org initially.  Option 2 could be done as a
follow-up if you think the added features justify the extra
efforts.

And Option 3 seems really straightforward to me, any LAVA lab can
be added to kernelci.org with an API token and a bit of YAML
configuration.  That would definitely be a quick win if you want
to be sure to have something to show at ELC-NA :)

Best wishes,
Guillaume

--000000000000d2bfc605a7d56930
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>+ <a href=3D"mailto:kernelci@groups.io">kernelci@grou=
ps.io</a> as discussed<br></div><div dir=3D"ltr"><br></div><div dir=3D"ltr"=
>Hi Chris,</div><div><br></div><div>Thanks for starting this discussion, co=
nnecting the CIP test<br>system with KernelCI sounds like a perfect example=
 of how the<br>project can grow.<br></div><br><div class=3D"gmail_quote"><d=
iv dir=3D"ltr" class=3D"gmail_attr">On Thu, Jun 4, 2020 at 11:15 AM Chris P=
aterson &lt;<a href=3D"mailto:Chris.Paterson2@renesas.com" target=3D"_blank=
">Chris.Paterson2@renesas.com</a>&gt; wrote:<br></div><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex">Hello Guillaume, Kevin,<br>
<br>
I&#39;d really like to get CIP linked into KernelCI somehow before ELC-NA i=
n a few weeks.<br>
Are you both available for a quick chat this week/next to determine what ki=
nd of integration would be suitable, and how we can go about achieving it?<=
br></blockquote><div><br></div><div>Sure, let&#39;s try to find a slot next=
 week.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex">
Some ramblings below to start the discussion...<br>
<br>
# Background on the current CIP CI setup<br>
- We have a GitLab mirror of our <a href=3D"http://kernel.org" rel=3D"noref=
errer" target=3D"_blank">kernel.org</a> kernel repo<br>
- Our branches contain a simple .gitlab-ci.yml file that links to our build=
/test GitLab CI pipeline repository<br>
- Kernel builds are kicked off using the various arches/configs supported b=
y CIP<br>
- Test jobs are then submitted to our LAVA master<br>
- We currently run simple boot tests, spectre/meltdown checker, cyclictest+=
hackbench (RT configs only) and LTP (only run on CIP release candidates)<br=
>
- If the builds and tests finish okay then GitLab shows a green tick, if th=
ere is some kind of build error, or test infrastructure error then GitLab s=
hows a red cross<br>
- If individual test cases fail, or there is a test regression, currently t=
here is no way of knowing in the Gitlab UI. This is why I want to start usi=
ng KernelCI<br>
- We follow a similar process for Greg&#39;s stable-rc 4.4 and 4.19 branche=
s, but don&#39;t run LTP<br></blockquote><div><br></div><div>This sounds ve=
ry similar to the experiment Kevin did with his own<br>tree and Gitlab CI, =
except he&#39;s using the command line tools from<br>kernelci-core.<br>=C2=
=A0<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
# Options for KernelCI integration (?)<br>
1) Keep our current build/test pipeline the same, just add a notify section=
 to the LAVA jobs to send the results to <a href=3D"http://kernelci.org" re=
l=3D"noreferrer" target=3D"_blank">kernelci.org</a><br>
- We&#39;d need to include the correct metadata etc.<br></blockquote><div><=
br></div><div>I think we might be able to have commands that generate just =
the<br>meta-data for a given kernel build without actually doing a<br>build=
.=C2=A0 That would allow you to keep your current build system<br>and also =
stay in sync with the kernelci meta-data definitions.<br></div><div>=C2=A0<=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex">
- Would this work if there is no corresponding &#39;build job&#39;?<br></bl=
ockquote><div class=3D"gmail_quote"><br></div>I don&#39;t think anyone is d=
oing this right now but in any case it&#39;s<br>something we need to suppor=
t, for example with static analysis<br>and other tests that don&#39;t requi=
re any build.=C2=A0 The only thing<br>that should be really required is the=
 kernel revision (tree,<br><div>branch, sha1, git describe).=C2=A0 So, &quo=
t;yes&quot; this needs to work.</div><div>=C2=A0</div><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex">
- Would you allow test results from the CIP SLTS Kernels on <a href=3D"http=
://kernelci.org" rel=3D"noreferrer" target=3D"_blank">kernelci.org</a>? Or =
would we need to set up our own instance?<br></blockquote><div><br></div><d=
iv>Ideally, only upstream-oriented branches should be built and<br>tested o=
n <a href=3D"http://kernelci.org">kernelci.org</a> to keep it in line with =
the project&#39;s<br>mission and upstream kernel development.=C2=A0 If the =
CIP branches<br>consist only of backported patches from mainline, maybe it =
could<br>be accepted in the same way that we have stable branches.=C2=A0 If=
<br>however there are patches that are not intended to get merged<br>upstre=
am and are there for specific products, then in my opinion<br>that would no=
t be acceptable - see below for an alternative as<br>you suggested.<br></di=
v><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
1b) Same as 1) but using either <a href=3D"http://cip.kernelci.org" rel=3D"=
noreferrer" target=3D"_blank">cip.kernelci.org</a> or <a href=3D"http://ker=
nelci.ciplatform.org" rel=3D"noreferrer" target=3D"_blank">kernelci.ciplatf=
orm.org</a></blockquote><div><br></div>Yes, having a separate instance woul=
d enable a separate<br>configuration, separate database, special features e=
tc... so no<br>possible interference with the main <a href=3D"http://kernel=
ci.org">kernelci.org</a><br>activities.=C2=A0 Having it as <a href=3D"http:=
//cip.kernelci.org">cip.kernelci.org</a> means it would<br>probably be mana=
ged by the KernelCI LF project, I guess that<br>would make sense for a memb=
er.=C2=A0 But then if you host and manage<br>your own instance on <a href=
=3D"http://kernelci.ciplatform.org">kernelci.ciplatform.org</a> you&#39;re =
of course<br>free to do anything you want with it.<br><div>=C2=A0</div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex">
2) <a href=3D"http://kernelci.org" rel=3D"noreferrer" target=3D"_blank">ker=
nelci.org</a> starts monitoring/building/testing the CIP SLTS Kernels<br>
- Tests would run through our LAVA master<br>
- Perhaps <a href=3D"http://kernelci.org" rel=3D"noreferrer" target=3D"_bla=
nk">kernelci.org</a> could make use of our build infrastructure?<br>
2b) Same as 2) but using either <a href=3D"http://cip.kernelci.org" rel=3D"=
noreferrer" target=3D"_blank">cip.kernelci.org</a> or <a href=3D"http://ker=
nelci.ciplatform.org" rel=3D"noreferrer" target=3D"_blank">kernelci.ciplatf=
orm.org</a><br></blockquote><div><br></div><div>The question of <a href=3D"=
http://kernelci.org">kernelci.org</a> vs another instance remains the<br>sa=
me, in my opinion it all hinges on what is on the branches.<br><br>Doing th=
is would give you automated bisection since the KernelCI<br>pipeline would =
be able to run arbitrary jobs in the LAVA lab.<br>Using your own build infr=
astructure would probably be another<br>argument in favour of a separate in=
stance (e.g. <a href=3D"http://cip.kernelci.org">cip.kernelci.org</a>)<br>a=
s this would be a custom use-case, unless you&#39;re happy to have<br>any <=
a href=3D"http://kernelci.org">kernelci.org</a> kernel builds run on your i=
nfrastructure.<br></div><div><br></div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex">
3) <a href=3D"http://kernelci.org" rel=3D"noreferrer" target=3D"_blank">ker=
nelci.org</a> start submitting their usual test jobs to the CIP LAVA master=
<br>
- CIP currently have 11 different device-types (20 boards in total) which s=
hould help expand what is available to KernelCI<br></blockquote><div><br></=
div>Maybe we could do that anyway, with filters to limit the upstream<br>br=
anches and test suites to run if you want, and also work out a<br><div>solu=
tion for the CIP SLTS branches?</div><div>=C2=A0</div><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex">
My preferred option would be 1) as it would be nice not to lose all the wor=
k spent on the GitLab CI setup<br>
(or perhaps integrating the GitLab CI approach into KernelCI&#39;s setup is=
 a worthwhile task, but it&#39;ll take time)<br></blockquote><div><br></div=
><div>Yes I think Option 1 would be good given the timeframe you&#39;ve<br>=
set.=C2=A0 Also it&#39;s going to be a recurring use-case, KernelCI is all<=
br>about being flexible enough to integrate existing CI systems with<br>no =
real modifications to them.=C2=A0 We can try things out with<br><a href=3D"=
http://staging.kernelci.org">staging.kernelci.org</a> initially.=C2=A0 Opti=
on 2 could be done as a<br>follow-up if you think the added features justif=
y the extra<br>efforts.<br><br>And Option 3 seems really straightforward to=
 me, any LAVA lab can<br>be added to <a href=3D"http://kernelci.org">kernel=
ci.org</a> with an API token and a bit of YAML<br>configuration.=C2=A0 That=
 would definitely be a quick win if you want<br>to be sure to have somethin=
g to show at ELC-NA :)<br></div><div>=C2=A0<br>
</div><div>Best wishes,<br>Guillaume</div></div></div>

--000000000000d2bfc605a7d56930--
