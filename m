MIME-Version: 1.0
References: <CAFd5g44tCPhoe5UkEkbTAX+z5x9Dyt29+ZGAZBHp1XV5JxLWGQ@mail.gmail.com>
 <CAH1_8nDy9V+h-o72HrkWWgOYKCDZk06QtmUw+jsur70QXLeEqQ@mail.gmail.com>
In-Reply-To: <CAH1_8nDy9V+h-o72HrkWWgOYKCDZk06QtmUw+jsur70QXLeEqQ@mail.gmail.com>
From: "Brendan Higgins" <brendanhiggins@google.com>
Date: Tue, 5 Nov 2019 11:20:16 -0800
Message-ID: <CAFd5g45ip8uhT5wUMR_5OvHx7+29JLfL0MN0m6WZxL_TjSFRkw@mail.gmail.com>
Subject: Re: Investigating where to put KUnit in the KernelCI build pipeline
Content-Type: multipart/alternative; boundary="000000000000227e0305969e5357"
List-ID: <kernelci.groups.io>
To: Guillaume Tucker <guillaume.tucker@gmail.com>
Cc: "Brendan Higgins via Groups.Io" <brendanhiggins=google.com@groups.io>, kernelci@groups.io, KUnit Development <kunit-dev@googlegroups.com>, Kevin Hilman <khilman@baylibre.com>

--000000000000227e0305969e5357
Content-Type: text/plain; charset="UTF-8"

On Tue, Nov 5, 2019 at 2:06 AM Guillaume Tucker <guillaume.tucker@gmail.com>
wrote:

>
>
> On Tue, Nov 5, 2019 at 12:40 AM Brendan Higgins via Groups.Io
> <brendanhiggins=google.com@groups.io> wrote:
>
>> # Recapping discussion at OSS Europe:
>>
>> At OSS Europe Kevin and I talked about how to integrate KUnit into
>> KernelCI.
>>
>> It sounded like there where two distinct cases to consider:
>>
>> 1) Including KUnit as a stage in the normal KernelCI build and test
>> process.
>>
>> 2) Figuring out presubmit for KUnit/KernelCI.
>>
>
> What do you mean by "presumbit"?  Testing patches from mailing
> lists before they get applied to git branches?
>

Yep. As I understand it, testing patches before they are applied to git
branches is not currently on the roadmap for KernelCI. Nevertheless, this
is something we, KUnit, have an interest in. I have an idea of how to do
this, but I figured it would be best to focus on getting KUnit support into
KernelCI first, but now that I have read your response, it might be good to
share what my longer term plan is for adding support for presubmit.

We already have a system (
https://prow.gflocks.com/job-history/oss-prow/pr-logs/directory/kunit-test-presubmit)
that supports presubmit on Gerrit and GitHub; it's built on an open source
project called Prow (
https://github.com/kubernetes/test-infra/tree/master/prow#readme). We have
an experimental module to allow it to work with patches from LKML. My
thought is, once we can get KUnit running on KernelCI, if you have no plan
to support presubmit, we can just use Prow with the LKML adapter and upload
the test results to KernelCI.

At a very high level, does that make sense? Am I correct in saying that you
have no plans to support presubmit? Does this conflict with anything that
you are planning on doing?

As the latter case requires a lot more work/thought/discussion, I will
>> focus on just the first in this email.
>>
>> For integrating KUnit into the KernelCI build and test process, Kevin
>> suggested that we should treat KUnit like a "static analysis step"
>> that would run within the build pipeline before the install/test
>> phase.
>>
>> I know that "static analysis step/pipeline" doesn't exist yet, but
>> Kevin suggested that KUnit could be the first prototype "static
>> analysis" thing and could establish the pattern that subsequent static
>> analysis tools would implement.
>>
>> # My initial idea on how to add KUnit to KernelCI
>>
>> Based on my initial investigation, it seems that this KUnit step would
>> probably fit somewhere in-between the "build-trigger[1]" and
>> "build[2]" nodes. Does this make sense? (Forgive me, I am new to
>> Jenkins pipelines, and the KernelCI infrastructure in general.)
>>
>
> I think the first step is to be able to run KUnit and send the
> results to the kernelci-backend using the command line.  We may
> need to add some commands to kci_test for that (i.e. kci_test
> send_results).  Then we can look into running it in Jenkins.
>

Makes sense. I imagined the first first step would be to get KUnit to
output the test_group (https://api.kernelci.org/schema-test-group.html)
format used by KernelCI; nevertheless, I think it makes sense to make KUnit
speak the format used by KernelCI rather than having a converter built in
to KernelCI.

After that, yeah, I think adding KUnit to the kernelci-backend using the
command line makes sense. I don't know what is entailed to get kci_test to
send_results, but that seems like it is probably something we will need to
tackle at this stage.

Once we do all that, I imagine we would then want to add it Jenkins, right?
(I know that there is a decent amount of work in both KernelCI and KUnit to
get to this point, but I have someone who will be joining us temporarily
who I am planning on doing this work, so I want to get an idea of what she
will be needing to do before she starts.) Either via the cloud builders as
you mention below, or using what I think you are describing as the existing
method?

While KUnit needs a kernel build, I think it's an implementation
> detail and we can treat it as plain static analysis unlike the
> other kernel builds.
>

I think that is the right approach, and Kevin seemed to also think so when
I talked with him about it.


> Would there be any value in pushing the UML
> build used by KUnit to the KernelCI storage server like we do
> with other builds?
>

Probably not. They are pretty easy to deterministically recreate if you
have the config and the source ref.

In any case, it seems like we should add a kunit test plan
> definition in test-configs.yaml and a new type of lab in
> lab-configs.yaml to run static analysis tests.  This could be
> reused for Coccinelle or anything that takes a source tarball and
> produces some test results.
>

Makes sense. For the labs-config.yaml, we are basically just using it to
provide a name and to tell it what trees to test against, right? Will we
want to provide a new lab_type called "static-analysis" or something like
that?

I think the test-configs.yaml entry would be empty, since there is no
rootfs, no bios, etc. Is that right?

Then we can decide where to run these static tests, should it be
> on Jenkins builders?
>

That's what I was thinking. Most of the cost of running the tests comes
from building the kernel. I did some back of the napkin math, and
determined that it would easily take years to accumulate enough tests for
the amount of tests to consume enough resources to match the amount of
resources consumed just by building the kernel (and I was pretty optimistic
about the rate of adding tests). I can throw up some numbers if you like.


> We could also use some cloud VMs I guess.
> Provided we had some account with credits for that (GCE,
> Azure...), it would be easy to implement a kernelci.lab.cloud (or
> .gce or .azure...)  module which can start a VM and run a test
> there to produce a results file which can then be pushed to the
> backend.
>
> The only change we would need to make in Jenkins jobs for this is
> to trigger a test-runner.jpl with no kernel build but with the
> kernel source tarball URL, to run tests in a "cloud" lab.
>

I am fine with this too. I don't really have strong feelings either way. I
think it comes down to where you want to do static analysis in the future.
The one advantage I see with this approach is it makes it easier for the
person adding support for the static analysis tool to set up a custom
environment (I assume you can provide your own Docker container, no?). I
don't think KUnit will need to take advantage of running our own Docker
container (at least not for a while), but I could see it being useful for
other static analysis tools.

If we wanted to run the static analysis tests on Jenkins
> builders, we could also have a kernelci.lab.jenkins module which
> would kind of loop back into Jenkins - or take some shortcut by
> checking the type of lab in a Jenkins job and do something there
> directly.  If we go down that route, based on my experience the
> best way to work out a solution is to try in practice as it's
> very hard to guess what would be the best Jenkins Pipeline job
> design on paper.  We have staging.kernelci.org for that.
>

Cool. Very good to know.

I imagine you administer it, and you do testing by cutting branches that
you cherry-pick experimental commits on?

Then I also think we should try and decouple KernelCI from
> Jenkins, and KUnit would seem like a good way of starting to run
> jobs in cloud VMs.
>

Can you elaborate on how you are thinking about decoupling KernelCI from
Jenkins? This doesn't sound like something I think we feel strongly about,
unless it helps/hurts the eventual goal of providing presubmit, but it
would nevertheless, be good to know about so we can make sure what we do
helps you with this goal.

It seems like it might make sense to add a new pipeline file for
>> "static analysis" type things, does this seem reasonable?
>>
>
> The current KernelCI pipeline and configuration should already be
> flexible enough to cover this, and if not I would rather make it
> more versatile than append extra corner cases with new pipeline
> jobs.
>

Sure, I don't want to add unnecessary complexity, I just thought that it
looked necessary to add what we wanted. Are you saying that KernelCI
already has a generic notion of a builder and we can just add a config that
makes KUnit a type of builder with no downstream tests? Or am I completely
misunderstanding?


> The Jenkins implementation is a bit of a detail, but
> KernelCI will need to be able to run more diverse kinds of tests
> in the future than just "booting dev boards" and I see this as
> one first step in this direction.
>

Agreed!

Cheers!

Guillaume
>
>
>> Thanks!
>>
>> [1]
>> https://github.com/kernelci/kernelci-core/blob/master/jenkins/build-trigger.jpl
>> [2]
>> https://github.com/kernelci/kernelci-core/blob/master/jenkins/build.jpl
>>
>

--000000000000227e0305969e5357
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Tue, Nov 5, 2019 at 2:06 AM Guillaume =
Tucker &lt;<a href=3D"mailto:guillaume.tucker@gmail.com" target=3D"_blank">=
guillaume.tucker@gmail.com</a>&gt; wrote:<br></div><div class=3D"gmail_quot=
e"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div =
dir=3D"ltr"><br></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Tue, Nov 5, 2019 at 12:40 AM Brendan Higgins via Groups.=
Io &lt;brendanhiggins=3D<a href=3D"mailto:google.com@groups.io" target=3D"_=
blank">google.com@groups.io</a>&gt; wrote:<br></div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,=
204,204);padding-left:1ex"># Recapping discussion at OSS Europe:<br>
<br>
At OSS Europe Kevin and I talked about how to integrate KUnit into KernelCI=
.<br>
<br>
It sounded like there where two distinct cases to consider:<br>
<br>
1) Including KUnit as a stage in the normal KernelCI build and test process=
.<br>
<br>
2) Figuring out presubmit for KUnit/KernelCI.<br></blockquote><div><br></di=
v>What do you mean by &quot;presumbit&quot;?=C2=A0 Testing patches from mai=
ling<br><div>lists before they get applied to git branches?</div></div></di=
v></blockquote><div><br></div><div>Yep. As I understand it, testing patches=
 before they are applied to git branches is not currently on the roadmap fo=
r KernelCI. Nevertheless, this is something we, KUnit, have an interest in.=
 I have an idea of how to do this, but I figured it would be best to focus =
on getting KUnit support into KernelCI first, but now that I have read your=
 response, it might be good to share what my longer term plan is for adding=
 support for presubmit.</div><div><br></div><div>We already have a system (=
<a href=3D"https://prow.gflocks.com/job-history/oss-prow/pr-logs/directory/=
kunit-test-presubmit">https://prow.gflocks.com/job-history/oss-prow/pr-logs=
/directory/kunit-test-presubmit</a>) that supports presubmit on Gerrit and =
GitHub; it&#39;s built on an open source project called Prow (<a href=3D"ht=
tps://github.com/kubernetes/test-infra/tree/master/prow#readme">https://git=
hub.com/kubernetes/test-infra/tree/master/prow#readme</a>). We have an expe=
rimental module to allow it to work with patches from LKML. My thought is, =
once we can get KUnit running on KernelCI, if you have no plan to support p=
resubmit, we can just use Prow with the LKML adapter and upload the test re=
sults to KernelCI.</div><div><br></div><div>At a very high level, does that=
 make sense? Am I correct in saying that you have no plans to support presu=
bmit? Does this conflict with anything that you are planning on doing?</div=
><div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=
=3D"ltr"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
As the latter case requires a lot more work/thought/discussion, I will<br>
focus on just the first in this email.<br>
<br>
For integrating KUnit into the KernelCI build and test process, Kevin<br>
suggested that we should treat KUnit like a &quot;static analysis step&quot=
;<br>
that would run within the build pipeline before the install/test<br>
phase.<br>
<br>
I know that &quot;static analysis step/pipeline&quot; doesn&#39;t exist yet=
, but<br>
Kevin suggested that KUnit could be the first prototype &quot;static<br>
analysis&quot; thing and could establish the pattern that subsequent static=
<br>
analysis tools would implement.<br>
<br>
# My initial idea on how to add KUnit to KernelCI<br>
<br>
Based on my initial investigation, it seems that this KUnit step would<br>
probably fit somewhere in-between the &quot;build-trigger[1]&quot; and<br>
&quot;build[2]&quot; nodes. Does this make sense? (Forgive me, I am new to<=
br>
Jenkins pipelines, and the KernelCI infrastructure in general.)<br></blockq=
uote><div><br></div><div>I think the first step is to be able to run KUnit =
and send the<br>results to the kernelci-backend using the command line.=C2=
=A0 We may<br>need to add some commands to kci_test for that (i.e. kci_test=
<br>send_results).=C2=A0 Then we can look into running it in Jenkins.<br></=
div></div></div></blockquote><div><br></div><div>Makes sense. I imagined th=
e first first step would be to get KUnit to output the test_group (<a href=
=3D"https://api.kernelci.org/schema-test-group.html" target=3D"_blank">http=
s://api.kernelci.org/schema-test-group.html</a>) format used by KernelCI; n=
evertheless, I think it makes sense to make KUnit speak the format used by =
KernelCI rather than having a converter built in to KernelCI.</div><div><br=
></div><div>After that, yeah, I think adding KUnit to the kernelci-backend =
using the command line makes sense. I don&#39;t know what is entailed to ge=
t kci_test to send_results, but that seems like it is probably something we=
 will need to tackle at this stage.</div><div><br></div><div>Once we do all=
 that, I imagine we would then want to add it Jenkins, right? (I know that =
there is a decent amount of work in both KernelCI and KUnit to get to this =
point, but I have someone who will be joining us temporarily who I am plann=
ing on doing this work, so I want to get an idea of what she will be needin=
g to do before she starts.) Either via the cloud builders as you mention be=
low, or using what I think you are describing as the existing method?</div>=
<div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=
=3D"ltr"><div class=3D"gmail_quote"><div>While KUnit needs a kernel build, =
I think it&#39;s an implementation<br>detail and we can treat it as plain s=
tatic analysis unlike the<br>other kernel builds.</div></div></div></blockq=
uote><div><br></div><div>I think that is the right approach, and Kevin seem=
ed to also think so when I talked with him about it.</div><div>=C2=A0</div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div cla=
ss=3D"gmail_quote"><div>Would there be any value in pushing the UML<br>buil=
d used by KUnit to the KernelCI storage server like we do<br>with other bui=
lds?<br></div></div></div></blockquote><div><br></div><div>Probably not. Th=
ey are pretty easy to deterministically recreate if you have the config and=
 the source ref.</div><div><br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_quote"><div>In any case, i=
t seems like we should add a kunit test plan<br>definition in test-configs.=
yaml and a new type of lab in<br>lab-configs.yaml to run static analysis te=
sts.=C2=A0 This could be<br>reused for Coccinelle or anything that takes a =
source tarball and<br>produces some test results.<br></div></div></div></bl=
ockquote><div><br></div><div>Makes sense. For the labs-config.yaml, we are =
basically just using it to provide a name and to tell it what trees to test=
 against, right? Will we want to provide a new lab_type called &quot;static=
-analysis&quot; or something like that?</div><div><br></div><div>I think th=
e test-configs.yaml entry would be empty, since there is no rootfs, no bios=
, etc. Is that right?</div><div><br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_quote"><div>Then we c=
an decide where to run these static tests, should it be<br>on Jenkins build=
ers?</div></div></div></blockquote><div><br></div><div>That&#39;s what I wa=
s thinking. Most of the cost of running the tests comes from building the k=
ernel. I did some back of the napkin math, and determined that it would eas=
ily take years to accumulate enough tests for the amount of tests to consum=
e enough resources to match the amount of resources consumed just by buildi=
ng the kernel (and I was pretty optimistic about the rate of adding tests).=
 I can throw up some numbers if you like.</div><div>=C2=A0</div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px so=
lid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail=
_quote"><div>We could also use some cloud VMs I guess.<br>Provided we had s=
ome account with credits for that (GCE,<br>Azure...), it would be easy to i=
mplement a kernelci.lab.cloud (or<br>.gce or .azure...) =C2=A0module which =
can start a VM and run a test<br>there to produce a results file which can =
then be pushed to the<br>backend.<br><br>The only change we would need to m=
ake in Jenkins jobs for this is<br>to trigger a test-runner.jpl with no ker=
nel build but with the<br>kernel source tarball URL, to run tests in a &quo=
t;cloud&quot; lab.<br></div></div></div></blockquote><div><br></div><div>I =
am fine with this too. I don&#39;t really have strong feelings either way. =
I think it comes down to where you want to do static analysis in the future=
. The one advantage I see with this approach is it makes it easier for the =
person adding support for the static analysis tool to set up a custom envir=
onment (I assume you can provide your own Docker container, no?). I don&#39=
;t think KUnit will need to take advantage of running our own Docker contai=
ner (at least not for a while), but I could see it being useful for other s=
tatic analysis tools.<br></div><div><br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_quote"><div>If we=
 wanted to run the static analysis tests on Jenkins<br>builders, we could a=
lso have a kernelci.lab.jenkins module which<br>would kind of loop back int=
o Jenkins - or take some shortcut by<br>checking the type of lab in a Jenki=
ns job and do something there<br>directly.=C2=A0 If we go down that route, =
based on my experience the<br>best way to work out a solution is to try in =
practice as it&#39;s<br>very hard to guess what would be the best Jenkins P=
ipeline job<br>design on paper.=C2=A0 We have <a href=3D"http://staging.ker=
nelci.org" target=3D"_blank">staging.kernelci.org</a> for that.<br></div></=
div></div></blockquote><div><br></div><div>Cool. Very good to know.</div><d=
iv><br></div><div>I imagine you administer it, and you do testing by cuttin=
g branches that you cherry-pick experimental commits on?</div><div><br></di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div c=
lass=3D"gmail_quote"><div></div>Then I also think we should try and decoupl=
e KernelCI from<br>Jenkins, and KUnit would seem like a good way of startin=
g to run<br><div>jobs in cloud VMs.=C2=A0</div></div></div></blockquote><di=
v><br></div><div>Can you elaborate on how you are thinking about decoupling=
 KernelCI from Jenkins? This doesn&#39;t sound like something I think we fe=
el strongly about, unless it helps/hurts the eventual goal of providing pre=
submit, but it would nevertheless, be good to know about so we can make sur=
e what we do helps you with this goal.</div><div><br></div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_quot=
e"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex">
It seems like it might make sense to add a new pipeline file for<br>
&quot;static analysis&quot; type things, does this seem reasonable?<br></bl=
ockquote><div><br></div><div class=3D"gmail_quote"></div><div>The current K=
ernelCI pipeline and configuration should already be<br>flexible enough to =
cover this, and if not I would rather make it<br>more versatile than append=
 extra corner cases with new pipeline<br>jobs.</div></div></div></blockquot=
e><div><br></div><div>Sure, I don&#39;t want to add unnecessary complexity,=
 I just thought that it looked necessary to add what we wanted. Are you say=
ing that KernelCI already has a generic notion of a builder and we can just=
 add a config that makes KUnit a type of builder with no downstream tests? =
Or am I completely misunderstanding?</div><div>=C2=A0</div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_quot=
e"><div>The Jenkins implementation is a bit of a detail, but<br>KernelCI wi=
ll need to be able to run more diverse kinds of tests<br>in the future than=
 just &quot;booting dev boards&quot; and I see this as<br>one first step in=
 this direction.</div></div></div></blockquote><div><br></div><div>Agreed!<=
/div><div><br></div><div>Cheers!=C2=A0</div><div><br></div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_quot=
e"><div></div><div>Guillaume</div><div>=C2=A0</div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex">
Thanks!<br>
<br>
[1] <a href=3D"https://github.com/kernelci/kernelci-core/blob/master/jenkin=
s/build-trigger.jpl" rel=3D"noreferrer" target=3D"_blank">https://github.co=
m/kernelci/kernelci-core/blob/master/jenkins/build-trigger.jpl</a><br>
[2] <a href=3D"https://github.com/kernelci/kernelci-core/blob/master/jenkin=
s/build.jpl" rel=3D"noreferrer" target=3D"_blank">https://github.com/kernel=
ci/kernelci-core/blob/master/jenkins/build.jpl</a><br></blockquote></div></=
div>
</blockquote></div></div>

--000000000000227e0305969e5357--
