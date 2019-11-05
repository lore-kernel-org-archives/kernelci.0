MIME-Version: 1.0
References: <CAFd5g44tCPhoe5UkEkbTAX+z5x9Dyt29+ZGAZBHp1XV5JxLWGQ@mail.gmail.com>
In-Reply-To: <CAFd5g44tCPhoe5UkEkbTAX+z5x9Dyt29+ZGAZBHp1XV5JxLWGQ@mail.gmail.com>
From: "Guillaume Tucker" <guillaume.tucker@gmail.com>
Date: Tue, 5 Nov 2019 10:06:08 +0000
Message-ID: <CAH1_8nDy9V+h-o72HrkWWgOYKCDZk06QtmUw+jsur70QXLeEqQ@mail.gmail.com>
Subject: Re: Investigating where to put KUnit in the KernelCI build pipeline
Content-Type: multipart/alternative; boundary="00000000000071ec45059696956c"
List-ID: <kernelci.groups.io>
To: "Brendan Higgins via Groups.Io" <brendanhiggins=google.com@groups.io>
Cc: kernelci@groups.io, KUnit Development <kunit-dev@googlegroups.com>, Kevin Hilman <khilman@baylibre.com>

--00000000000071ec45059696956c
Content-Type: text/plain; charset="UTF-8"

On Tue, Nov 5, 2019 at 12:40 AM Brendan Higgins via Groups.Io
<brendanhiggins=google.com@groups.io> wrote:

> # Recapping discussion at OSS Europe:
>
> At OSS Europe Kevin and I talked about how to integrate KUnit into
> KernelCI.
>
> It sounded like there where two distinct cases to consider:
>
> 1) Including KUnit as a stage in the normal KernelCI build and test
> process.
>
> 2) Figuring out presubmit for KUnit/KernelCI.
>

What do you mean by "presumbit"?  Testing patches from mailing
lists before they get applied to git branches?


> As the latter case requires a lot more work/thought/discussion, I will
> focus on just the first in this email.
>
> For integrating KUnit into the KernelCI build and test process, Kevin
> suggested that we should treat KUnit like a "static analysis step"
> that would run within the build pipeline before the install/test
> phase.
>
> I know that "static analysis step/pipeline" doesn't exist yet, but
> Kevin suggested that KUnit could be the first prototype "static
> analysis" thing and could establish the pattern that subsequent static
> analysis tools would implement.
>
> # My initial idea on how to add KUnit to KernelCI
>
> Based on my initial investigation, it seems that this KUnit step would
> probably fit somewhere in-between the "build-trigger[1]" and
> "build[2]" nodes. Does this make sense? (Forgive me, I am new to
> Jenkins pipelines, and the KernelCI infrastructure in general.)
>

I think the first step is to be able to run KUnit and send the
results to the kernelci-backend using the command line.  We may
need to add some commands to kci_test for that (i.e. kci_test
send_results).  Then we can look into running it in Jenkins.

While KUnit needs a kernel build, I think it's an implementation
detail and we can treat it as plain static analysis unlike the
other kernel builds.  Would there be any value in pushing the UML
build used by KUnit to the KernelCI storage server like we do
with other builds?

In any case, it seems like we should add a kunit test plan
definition in test-configs.yaml and a new type of lab in
lab-configs.yaml to run static analysis tests.  This could be
reused for Coccinelle or anything that takes a source tarball and
produces some test results.

Then we can decide where to run these static tests, should it be
on Jenkins builders?  We could also use some cloud VMs I guess.
Provided we had some account with credits for that (GCE,
Azure...), it would be easy to implement a kernelci.lab.cloud (or
.gce or .azure...)  module which can start a VM and run a test
there to produce a results file which can then be pushed to the
backend.

The only change we would need to make in Jenkins jobs for this is
to trigger a test-runner.jpl with no kernel build but with the
kernel source tarball URL, to run tests in a "cloud" lab.

If we wanted to run the static analysis tests on Jenkins
builders, we could also have a kernelci.lab.jenkins module which
would kind of loop back into Jenkins - or take some shortcut by
checking the type of lab in a Jenkins job and do something there
directly.  If we go down that route, based on my experience the
best way to work out a solution is to try in practice as it's
very hard to guess what would be the best Jenkins Pipeline job
design on paper.  We have staging.kernelci.org for that.

Then I also think we should try and decouple KernelCI from
Jenkins, and KUnit would seem like a good way of starting to run
jobs in cloud VMs.


> It seems like it might make sense to add a new pipeline file for
> "static analysis" type things, does this seem reasonable?
>

The current KernelCI pipeline and configuration should already be
flexible enough to cover this, and if not I would rather make it
more versatile than append extra corner cases with new pipeline
jobs.  The Jenkins implementation is a bit of a detail, but
KernelCI will need to be able to run more diverse kinds of tests
in the future than just "booting dev boards" and I see this as
one first step in this direction.

Guillaume


> Thanks!
>
> [1]
> https://github.com/kernelci/kernelci-core/blob/master/jenkins/build-trigger.jpl
> [2]
> https://github.com/kernelci/kernelci-core/blob/master/jenkins/build.jpl
>
> 
>
>

--00000000000071ec45059696956c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Nov 5, 2019 at 12:40 AM Brend=
an Higgins via Groups.Io &lt;brendanhiggins=3D<a href=3D"mailto:google.com@=
groups.io" target=3D"_blank">google.com@groups.io</a>&gt; wrote:<br></div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex"># Recapping discussion at =
OSS Europe:<br>
<br>
At OSS Europe Kevin and I talked about how to integrate KUnit into KernelC=
I.<br>
<br>
It sounded like there where two distinct cases to consider:<br>
<br>
1) Including KUnit as a stage in the normal KernelCI build and test proces=
s.<br>
<br>
2) Figuring out presubmit for KUnit/KernelCI.<br></blockquote><div><br></d=
iv>What do you mean by &quot;presumbit&quot;?=C2=A0 Testing patches from ma=
iling<br><div>lists before they get applied to git branches?</div><div>=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
As the latter case requires a lot more work/thought/discussion, I will<br>
focus on just the first in this email.<br>
<br>
For integrating KUnit into the KernelCI build and test process, Kevin<br>
suggested that we should treat KUnit like a &quot;static analysis step&quo=
t;<br>
that would run within the build pipeline before the install/test<br>
phase.<br>
<br>
I know that &quot;static analysis step/pipeline&quot; doesn&#39;t exist ye=
t, but<br>
Kevin suggested that KUnit could be the first prototype &quot;static<br>
analysis&quot; thing and could establish the pattern that subsequent stati=
c<br>
analysis tools would implement.<br>
<br>
# My initial idea on how to add KUnit to KernelCI<br>
<br>
Based on my initial investigation, it seems that this KUnit step would<br>
probably fit somewhere in-between the &quot;build-trigger[1]&quot; and<br>
&quot;build[2]&quot; nodes. Does this make sense? (Forgive me, I am new to=
<br>
Jenkins pipelines, and the KernelCI infrastructure in general.)<br></block=
quote><div><br></div><div>I think the first step is to be able to run KUnit=
 and send the<br>results to the kernelci-backend using the command line.=C2=
=
=A0 We may<br>need to add some commands to kci_test for that (i.e. kci_tes=
t<br>send_results).=C2=A0 Then we can look into running it in Jenkins.<br><=
br>While KUnit needs a kernel build, I think it&#39;s an implementation<br>=
detail and we can treat it as plain static analysis unlike the<br>other ker=
nel builds.=C2=A0 Would there be any value in pushing the UML<br>build used=
 by KUnit to the KernelCI storage server like we do<br>with other builds?<b=
r><br>In any case, it seems like we should add a kunit test plan<br>definit=
ion in test-configs.yaml and a new type of lab in<br>lab-configs.yaml to ru=
n static analysis tests.=C2=A0 This could be<br>reused for Coccinelle or an=
ything that takes a source tarball and<br>produces some test results.<br><b=
r>Then we can decide where to run these static tests, should it be<br>on Je=
nkins builders?=C2=A0 We could also use some cloud VMs I guess.<br>Provided=
 we had some account with credits for that (GCE,<br>Azure...), it would be =
easy to implement a kernelci.lab.cloud (or<br>.gce or .azure...) =C2=A0modu=
le which can start a VM and run a test<br>there to produce a results file w=
hich can then be pushed to the<br>backend.<br><br>The only change we would =
need to make in Jenkins jobs for this is<br>to trigger a test-runner.jpl wi=
th no kernel build but with the<br>kernel source tarball URL, to run tests =
in a &quot;cloud&quot; lab.<br><br>If we wanted to run the static analysis =
tests on Jenkins<br>builders, we could also have a kernelci.lab.jenkins mod=
ule which<br>would kind of loop back into Jenkins - or take some shortcut b=
y<br>checking the type of lab in a Jenkins job and do something there<br>di=
rectly.=C2=A0 If we go down that route, based on my experience the<br>best =
way to work out a solution is to try in practice as it&#39;s<br>very hard t=
o guess what would be the best Jenkins Pipeline job<br>design on paper.=C2=
=A0 We have <a href=3D"http://staging.kernelci.org">staging.kernelci.org</=
a> for that.<br><br></div>Then I also think we should try and decouple Kern=
elCI from<br>Jenkins, and KUnit would seem like a good way of starting to r=
un<br><div>jobs in cloud VMs.</div><div>=C2=A0</div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,=
204,204);padding-left:1ex">
It seems like it might make sense to add a new pipeline file for<br>
&quot;static analysis&quot; type things, does this seem reasonable?<br></b=
lockquote><div><br></div><div class=3D"gmail_quote"></div><div>The current =
KernelCI pipeline and configuration should already be<br>flexible enough to=
 cover this, and if not I would rather make it<br>more versatile than appen=
d extra corner cases with new pipeline<br>jobs.=C2=A0 The Jenkins implement=
ation is a bit of a detail, but<br>KernelCI will need to be able to run mor=
e diverse kinds of tests<br>in the future than just &quot;booting dev board=
s&quot; and I see this as<br>one first step in this direction.<br></div><di=
v><br></div><div>Guillaume</div><div>=C2=A0</div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex">
Thanks!<br>
<br>
[1] <a href=3D"https://github.com/kernelci/kernelci-core/blob/master/jenki=
ns/build-trigger.jpl" rel=3D"noreferrer" target=3D"_blank">https://github.c=
om/kernelci/kernelci-core/blob/master/jenkins/build-trigger.jpl</a><br>
[2] <a href=3D"https://github.com/kernelci/kernelci-core/blob/master/jenki=
ns/build.jpl" rel=3D"noreferrer" target=3D"_blank">https://github.com/kerne=
lci/kernelci-core/blob/master/jenkins/build.jpl</a><br>
<br>
<br>
<br>
</blockquote></div></div>

--00000000000071ec45059696956c--
