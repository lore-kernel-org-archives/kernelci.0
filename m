Subject: Re: Common database and kcidb: what next?
References: <9e1beacd-c406-c234-479a-c2946698330c@collabora.com>
 <fd4315a7-f614-893d-6c76-0a2cd1b5f2bf@gmail.com>
From: "Guillaume Tucker" <guillaume.tucker@collabora.com>
Message-ID: <17452b4d-5724-6e51-d7a4-8b30d4fa322b@collabora.com>
Date: Fri, 23 Oct 2020 15:44:58 +0100
MIME-Version: 1.0
In-Reply-To: <fd4315a7-f614-893d-6c76-0a2cd1b5f2bf@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
List-ID: <kernelci.groups.io>
To: Nikolai Kondrashov <spbnick@gmail.com>, kernelci@groups.io
Cc: kernelci-members@groups.io, Sasha Levin <sashal@kernel.org>

On 10/03/2020 09:42, Nikolai Kondrashov wrote:
> Hi Guillaume, everyone,
>=20
> I'll be doing a good deal of disagreeing here, so brace yourselves :)
>=20
>> As things are starting to crystallise, it is now time to start
>> considering how to go about making this new database part of
>> KernelCI in a community-driven fashion.

Over the past six months, things have progressed a lot.  There is
a BoF session at ELCE-E next week[1] about KernelCI's lessons
learned, and looking back at the progress on common reporting is
going to be one of the main topics.

> We don't want things to crystallise, we're just starting. Our goals with=
 KCIDB
> is to get as many CI systems on board, find out how we can put all the t=
esting
> results together, and how we can get them to developers.

The KCIDB schema has been evolving in order to meet requirements
from new data submitters, in particular syzbot.  Things are still
moving in this area, but in essence the core part of the schema
has passed the initial test of being usable by new submitters.

As far as I can tell, the design has been crystallising quite a
bit: CKI have adopted the KCIDB schema natively and the KCIDB
dataset keeps being migrated when new versions are released.  So
we're effectively contributing data to a production-like dataset,
rather than a disposable one which was the original intent for
the PoC.

The kernelci.org data is not being submitted to KCIDB yet though,
due to performance issues such as the overhead of opening
connections with BigQuery.  This should soon be resolved with
improvements related to streaming the data submissions.

[...]

> For that matter, we need to avoid integrating into any existing systems,=
 or
> coming up with grand designs, as that will slow us down. Design without
> real-world involvement is worth little, and could actually cost us in wa=
sted
> effort. We need to show results quickly, show we're a worthy cause to jo=
in,
> and be responsive, in order to invite and retain cooperation.

I believe we have reached a first goal here: more and more people
now believe there is value in contributing test results.  We have
also engaged with the real world via the community survey[2], by
getting in touch directly with other test systems such as syzbot
and 0-Day, and generally speaking by putting the KernelCI project
in the hands of the kernel community with fruitful discussions at
Linux Plumbers Conference 2020[3].

[...]

> After this, we can fold this into Kernel CI proper, or whatever system w=
e
> want, do more design, integration, optimization, etc. We will have the t=
ime to
> think the details through, because we would have achieved the main goal:
> getting everyone to play together.

All the discussions around this topic made us realise that there
will always be a need for "native" KernelCI tests, orchestrated
directly on kernelci.org and focused on upstream.  Then there is
the need to collect data from a wide variety of other "external"
test systems: distributions such as Fedora with CKI or Gentoo
with GKernelCI, OEMs such as SONY with Fuego, specialised ones
such as syzbot which does exclusively fuzzing...

Being able to articulate how this all fits together clears the
path for making progress on every front.  We can keep increasing
the native coverage of Clang builds, add new LAVA labs with more
functional testing and expand our Kubernetes capabilities for
hardware-independent testing such as KUnit or static analysis,
and monitor arbitrary branches created by upstream kernel
maintainers.  Meanwhile, we can also keep evolving the common
reporting design with new submitters, a moving schema and growing
infrastructure.  All that can now co-exist happily.

The next steps are going to be about how to cope with the
increasing size of our "big kernel data" and to make best use of
it: visualisation, notifications of kernel issues...  The project
now has good enough foundations to start looking into this, which
is likely to be a highlight for 2021.

Best wishes,
Guillaume

> On 3/6/20 7:43 PM, Guillaume Tucker wrote:
>> You may not have noticed yet but there is an ongoing effort to
>> have a common database where test results for the upstream
>> Linux kernel can all converge.=C2=A0 The initial steps towards this
>> goal have taken the form of a proof-of-concept project called
>> kcidb[1].=C2=A0 Nikolai has been making fast progress on this over
>> the past few months and I would like to thank him on behalf of
>> the KernelCI TSC for all his efforts so far.
>>
>> As things are starting to crystallise, it is now time to start
>> considering how to go about making this new database part of
>> KernelCI in a community-driven fashion.=C2=A0 There are several ways
>> to do so, and making key design decisions now is essential in
>> order to be able to plan things in the medium and longer term.
>>
>> I propose to take a look at what kernelci.org currently has to
>> offer, the lessons we have learnt so far from the kcidb project
>> and the mission statement[2] as defined by the advisory board
>> of members.=C2=A0 This should provide us with the basis we need to
>> plan our way forward in alignment with the kernel community.
>>
>> Your feedback is needed at every step, so please do not
>> hesitate to reply and discuss any aspect of it.
>>
>>
>> What does kernelci.org currently have to offer?
>> -----------------------------------------------
>>
>> The well known parts are:
>>
>> * a distributed architecture with labs running around the world
>>
>> * a very diverse pool of hardware across many CPU architectures
>>
>> * many upstream-oriented kernel branches being built and tested
>>
>> * no single organisation in charge to provide a neutral ground
>>=C2=A0=C2=A0=C2=A0 oriented towards the upstream Linux kernel
>>
>> * automated tracking of test regressions and bisections
>>
>> * email reports and custom-tailored web dashboard
>>
>> * public-facing web API to submit and query test results
>>
>> * a well established ecosystem of labs, contributors and users
>>
>> * portable tools[3] that can be reused in any test environment
>>
>>
>> Things currently being worked on include:
>>
>> * a growing test coverage to end the era of doing purely boot
>>=C2=A0=C2=A0=C2=A0 testing (KUnit, kselftest, LTP...)
>>
>> * improved web dashboard to show detailed test results rather
>>=C2=A0=C2=A0=C2=A0 than plain boots
>>
>> * more effective email reports as a result
>>
>>
>> * What lessons have we learnt from kcidb so far?
>> ------------------------------------------------
>>
>> Defining a schema for a common database is a patchwork of
>> compromises.=C2=A0 Each system doing upstream Linux kernel testing
>> has a slightly different approach, and a balance needs to be
>> struck between simplifying the data and causing extra
>> translations for the submitters.=C2=A0 We seem to have started to
>> converge on something that works for the existing kernelci.org
>> results and Red Hat's CKI.=C2=A0 We need to remain flexible enough
>> to refine things and be able to include other sources of data
>> as the project grows.
>>
>> Still, we are essentially now very close to be able to start
>> storing production data in the common database.=C2=A0 This is why we
>> are also at a turning point where we have to start thinking
>> beyond the proof-of-concept, to agree on how we want to design
>> things going forward.=C2=A0 If we neglect this step, we may well end
>> up with a new system completely unrelated to kernelci.org
>> except by name.=C2=A0 While it may be a great new design if done on
>> purpose, if this happened by accident it would most likely be a
>> failure.
>>
>> For example, kcidb is currently based on Google BigQuery, which
>> is fine for a proof-of-concept but we know that being tied to a
>> cloud provider has major drawbacks.=C2=A0 In particular, we lose the
>> ability to run an autonomous KernelCI instance.=C2=A0 It is this
>> kind of design decisions that we need to make now so we can
>> move on to the next stage with enough confidence.
>>
>>
>> * What are the options going forward?
>> -------------------------------------
>>
>> The main thing we need now is engagement in the decision
>> process from the KernelCI community.=C2=A0 For this, we need to
>> collect feedback and ideas.=C2=A0 There are many experienced people
>> who care about KernelCI, this is the chance to make a system
>> designed by the community and for the community.
>>
>> To get started, here are a few key topics that I would like to
>> shed some light upon:
>>
>> 1. Converting the kernelci-backend web API as an abstraction
>>=C2=A0=C2=A0=C2=A0=C2=A0 layer for submitting results
>>
>>=C2=A0=C2=A0=C2=A0=C2=A0 Anyone can set up a kernelci-backend instance, =
but it is
>>=C2=A0=C2=A0=C2=A0=C2=A0 currently tied to Mongo DB.=C2=A0 It wouldn't b=
e difficult to
>>=C2=A0=C2=A0=C2=A0=C2=A0 make it also work with other database engines s=
ince it has
>>=C2=A0=C2=A0=C2=A0=C2=A0 abstract data models and already uses hooks to =
submit to
>>=C2=A0=C2=A0=C2=A0=C2=A0 BigQuery.
>>
>> 2. Keeping core functions in kernelci-core
>>
>>=C2=A0=C2=A0=C2=A0=C2=A0 While kcidb has explored a few things around su=
bmitting data
>>=C2=A0=C2=A0=C2=A0=C2=A0 and triggering email reports, the kernelci-core=
 project is
>>=C2=A0=C2=A0=C2=A0=C2=A0 about providing portable tools to run each Kern=
elCI step.
>>=C2=A0=C2=A0=C2=A0=C2=A0 As such, it would seem like the canonical place=
 to provide
>>=C2=A0=C2=A0=C2=A0=C2=A0 any new tools of this kind.
>>
>> 3. Comparative study of web dashboard solutions
>>
>>=C2=A0=C2=A0=C2=A0=C2=A0 The current kernelci.org web dashboard was desi=
gned
>>=C2=A0=C2=A0=C2=A0=C2=A0 especially for showing kernel test results.=C2=
=A0 It wasn't well
>>=C2=A0=C2=A0=C2=A0=C2=A0 maintained for several years but we are now imp=
roving it to
>>=C2=A0=C2=A0=C2=A0=C2=A0 show test results.=C2=A0 As such, it is still a=
 very good
>>=C2=A0=C2=A0=C2=A0=C2=A0 candidate.=C2=A0 However, there are many other =
possible
>>=C2=A0=C2=A0=C2=A0=C2=A0 solutions, and we may create a combination of s=
everal tools
>>=C2=A0=C2=A0=C2=A0=C2=A0 to address different needs.=C2=A0 Previous atte=
mpts at using
>>=C2=A0=C2=A0=C2=A0=C2=A0 SQUAD and ElasticStack did not give satisfactor=
y results or
>>=C2=A0=C2=A0=C2=A0=C2=A0 were aborted.=C2=A0 The attention has now moved=
 towards Grafana,
>>=C2=A0=C2=A0=C2=A0=C2=A0 we don't know yet what the outcome will be.=C2=
=A0 It seems
>>=C2=A0=C2=A0=C2=A0=C2=A0 worthwhile listing all these tools as well as o=
ther web
>>=C2=A0=C2=A0=C2=A0=C2=A0 frameworks and libraries to compare them, and d=
efine what
>>=C2=A0=C2=A0=C2=A0=C2=A0 the requirements are in terms of users (develop=
ers,
>>=C2=A0=C2=A0=C2=A0=C2=A0 maintainers, OEMs...).=C2=A0 Based on that we w=
ould be able to
>>=C2=A0=C2=A0=C2=A0=C2=A0 spend our energy with reduced risks of missing =
the goals.
>>
>>
>> Sorry for the very long email...=C2=A0 It seemed like the best way
>> to get everyone on the same page.=C2=A0 Please take the time you
>> need to digest it, we are not (yet) in a state of emergency.
>> As KernelCI is going through a transformative phase it is
>> important for all of us to see the bigger picture and make
>> conscious decisions as much as possible.=C2=A0 Thank you!
>>
>> Best wishes,
>> Guillaume
>>
>>
>> [1] https://github.com/kernelci/kcidb
>>
>> [2] "To ensure the quality, stability and long-term maintenance
>>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 of the Linux kernel by maintaining =
an open ecosystem
>>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 around test automation practices an=
d principles."
>>
>> [3] https://github.com/kernelci/kernelci-core
>>
>=20

[1] KernelCI BoF at ELC-E next week:
    https://osseu2020.sched.com/event/eCC4/bof-kernelci-lessons-learned-gu=
illaume-tucker-collabora

[2] KernelCI Community Survey report:
    https://foundation.kernelci.org/blog/2020/07/09/kernelci-community-sur=
vey-report/

[3] LPC 2020 KernelCI notes
    https://foundation.kernelci.org/blog/2020/09/23/kernelci-notes-from-pl=
umbers-2020/
