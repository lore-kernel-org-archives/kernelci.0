Date: Wed, 2 Dec 2020 12:01:19 +0000
From: "Cristian Marussi" <cristian.marussi@arm.com>
Subject: Re: Contributing ARM tests results to KCIDB
Message-ID: <20201202120105.GC8455@e120937-lin>
References: <20200917162242.GA18067@e119603-lin.cambridge.arm.com>
 <e417bc86-da0f-0ab1-62c7-d771a24d41fb@redhat.com>
 <20200918152135.GA13088@e119603-lin.cambridge.arm.com>
 <3e86960e-9780-3e18-3d12-cb4ec3959d63@redhat.com>
 <be42f631-897d-0cdf-0225-5d01256f39e5@redhat.com>
 <20200918164228.GA16509@e119603-lin.cambridge.arm.com>
 <20201105184631.GD24640@e120937-lin>
 <4db924ab-2f38-ac63-1b71-51ead907ba1f@redhat.com>
 <20201202092340.GB8455@e120937-lin>
 <d0c2936f-fab5-3aea-fbd0-22b59df9bfd3@redhat.com>
MIME-Version: 1.0
In-Reply-To: <d0c2936f-fab5-3aea-fbd0-22b59df9bfd3@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
List-ID: <kernelci.groups.io>
To: Nikolai Kondrashov <Nikolai.Kondrashov@redhat.com>
Cc: kernelci@groups.io, broonie@kernel.org, basil.eljuse@arm.com

On Wed, Dec 02, 2020 at 12:16:10PM +0200, Nikolai Kondrashov wrote:
> On 12/2/20 11:23 AM, Cristian Marussi wrote:
> > On Wed, Dec 02, 2020 at 10:05:05AM +0200, Nikolai Kondrashov via group=
s.io wrote:
> >> On 11/5/20 8:46 PM, Cristian Marussi wrote:
> >>> after past month few experiments on ARM KCIDB submissions against yo=
ur
> >>> KCIDB staging instance , I was dragged a bit away from this by other=
 stuff
> >>> before effectively deploying some real automation on our side to pus=
h our
> >>> daily results to KCIDB...now I'm back at it and I'll keep on testing
> >>> some automation on our side for a bit against your KCIDB staging ins=
tance
> >>> before asking you to move to production eventually.
> >>
> >> I see your data has been steadily trickling into our playground datab=
ase and
> >> it looks quite good. Would you like to move to the production instanc=
e?
> >>
> >> I can review your data for you, we can fix the remaining issues if we=
 find
> >> them, and I can give you the permissions to push to production. Then =
you will
> >> only need to change the topic you push to from "playground_kernelci_n=
ew" to
> >> "kernelci_new".
> >
> > In fact I left one staging instance on our side to push data on your
> > staging instance to verify remaining issues on our side *and there are=
 a
> > couple of minor ones I spotted that I'd like to fix indeed);
>=20
> Sure, it's up to you when you decide to switch. However, if you'd like, =
list
> your issues here, and I would be able to tell you if those are important=
 from
> KCIDB POV.
>=20
> Looking at your data, I can only find one serious issue: the test run ("=
test")
> IDs are not unique. E.g. there are 1460 objects with ID "arm:LTP:11" whi=
ch
> use 643 distinct build_id's among them.
>=20
> The test run IDs should correspond to a single execution of a test. Othe=
rwise
> we won't be able to tell them apart. You can send multiple reports conta=
ining
> test runs ("tests") with the same ID, but that would still mean the same
> execution, only repeating the same data, or adding more.
>=20
> A little more explanation:
> https://github.com/kernelci/kcidb/blob/master/SUBMISSION_HOWTO.md#submit=
ting-objects-multiple-times
>=20
> From POV of KCIDB, what you're sending now is overwriting the same test =
runs
> over and over, and we can't really tell which one of those objects is th=
e
> final version.


Ah, that was exactly what I used to do in my first initial experiments and=
 then,
looking at the data on the UI, I was dumb enough to decide that I should h=
ave got
it wrong and I started using the test_id instead of the test_execution_id,=
 because
I thought that, anyway, you can recognize the different test executions of=
 the
same test_id looking at the different build_id is part of (which for us re=
present
the different test suite runs)....but I suppose this wrong assumption of m=
ine
sparked from the relational data model I use on our side. I'll fix it.

>=20
> Aside from that, you might want to add `"valid": true` to your "revision=
"
> objects to indicate they're alright. You never seem to send patched revi=
sions,
> so it should always be true for you. Then instead of the blank "Status" =
field:
>=20
>     https://staging.kernelci.org:3000/d/revision/revision?orgId=3D1&var-=
dataset=3Dplayground_kernelci04&var-id=3Df0d5c8f71bbb1aa1e98cb1a89adb9d57c0=
4ede3d
>=20
> you would get a nice green check mark, like this:
>=20
>     https://staging.kernelci.org:3000/d/revision/revision?orgId=3D1&var-=
dataset=3Dkernelci04&var-id=3D8af5fe40bd59d8aa26dd76d9971435177aacbfce
>=20

Ah I missed this valid flag on revision too, I'll fix.

> Finally, at this stage we really need a breadth of data coming from
> different CI system, rather than its depth or precision, so we can under=
stand
> the problem at hand better and faster. It would do us no good to concent=
rate
> on just a few, and solidify the design around them. That would make it m=
ore
> difficult for others to join.
>=20
> You can refine and add more data afterwards.
>=20

Sure, in fact, as of now I still have to ask for some changes in our repor=
ting
backend, (which generates the original data stored in our DB and then push=
ed
to you), so I have to admit the git commit hash are partially faked (since=
 I
have only a git describe string to start from) and as a consequence they w=
on't
really be so much useful for comparisons amongst different origins (given
they don't refer real kernel commits), BUT I thought this NOT to be a
blocking problem for now, so that I can start pushing data to KCIDB and
then later on (once I get real full hashes on my side) I'll start pushing =
the
real valid ones, does it sounds good ?


> > moreover I saw a little while a go that you're going to switch to sche=
ma v4
> > with some minor changes in revisions and commit_hashes so I wanted to
> > conform to that once it's published (even though you're back compatibl=
e with
> > v3 AFAIU)....
>=20
> I would rather you didn't wait for that, as I'm neck deep in research fo=
r the
> next release right now, and it doesn't seem like it's gonna come out soo=
n.
> I'm concentrating on getting our result notifications in a good shape so=
 we
> can reach actual kernel developers ASAP.
>=20
> We can work on upgrading your setup later, when it comes out. And there =
are
> going to be other changes, anyway. So, I'd rather we released early and
> iterated.
>=20

Good I'l stick to v3.

Side question...for dynamic schema validation purposes...is there any URL
where I can fetch the latest currently valid schema ... something like:

https://github.com/kernelci/kcidb/releases/kcidb.latest.schema.json

so that I can check automatically against the latest greatest instead of
using a builtin predownloaded one (or is it a bad idea in your opinion ?)

> > ... then I've got dragged away again from this past week :D
> >
> > In fact my next steps (possibly next week) would have been (beside my =
fixes)
> > to ask you how to proceed further to production KCIDB.
>=20
> There's never enough time for everything :)
>=20

eh..

> > Would you want me to stop flooding your staging instance in the meanti=
me (:D)
> > till I'm back at it at least , I think I have enugh data now to debug =
anyway.
> > (I could made a few more check next week though)
>=20
> Don't worry about that, and keep pushing, maybe you'll manage to break i=
t
> again and then we can fix it :)
>=20

Fine :D

> > If it's just a matter of switching project (once got enhanced permissi=
ons
> > from you) please do it, and I'll try to finalize all next week on our
> > side and move to production.
>=20
> Permission granted! Switch when you feel ready, and don't hesitate to pi=
ng me
> for another review, if you need it.
>=20
> Just replace "playground_kernelci_new" topic with "kernelci_new" in your
> setup when you're ready.
>=20

Cool, thanks.

> > Thanks for the patience
>=20
> Thank you for your effort, we need your data :D
>=20
> Nick
>=20

Thank you Nick

Cheers,

Cristian


> On 12/2/20 11:23 AM, Cristian Marussi wrote:
> > Hi Nick
> >
> > On Wed, Dec 02, 2020 at 10:05:05AM +0200, Nikolai Kondrashov via group=
s.io wrote:
> >> Hi Cristian,
> >>
> >> On 11/5/20 8:46 PM, Cristian Marussi wrote:
> >>> Hi Nick,
> >>>
> >>> after past month few experiments on ARM KCIDB submissions against yo=
ur
> >>> KCIDB staging instance , I was dragged a bit away from this by other=
 stuff
> >>> before effectively deploying some real automation on our side to pus=
h our
> >>> daily results to KCIDB...now I'm back at it and I'll keep on testing
> >>> some automation on our side for a bit against your KCIDB staging ins=
tance
> >>> before asking you to move to production eventually.
> >>
> >> I see your data has been steadily trickling into our playground datab=
ase and
> >> it looks quite good. Would you like to move to the production instanc=
e?
> >>
> >> I can review your data for you, we can fix the remaining issues if we=
 find
> >> them, and I can give you the permissions to push to production. Then =
you will
> >> only need to change the topic you push to from "playground_kernelci_n=
ew" to
> >> "kernelci_new".
> >
> > In fact I left one staging instance on our side to push data on your
> > staging instance to verify remaining issues on our side *and there are=
 a
> > couple of minor ones I spotted that I'd like to fix indeed); moreover =
I saw
> > a little while a go that you're going to switch to schema v4 with some=
 minor
> > changes in revisions and commit_hashes so I wanted to conform to that =
once
> > it's published (even though you're back compatible with v3 AFAIU)....
> >
> > ... then I've got dragged away again from this past week :D
> >
> > In fact my next steps (possibly next week) would have been (beside my =
fixes)
> > to ask you how to proceed further to production KCIDB.
> >
> > Would you want me to stop flooding your staging instance in the meanti=
me (:D)
> > till I'm back at it at least , I think I have enugh data now to debug =
anyway.
> > (I could made a few more check next week though)
> >
> > If it's just a matter of switching project (once got enhanced permissi=
ons
> > from you) please do it, and I'll try to finalize all next week on our
> > side and move to production.
> >
> > Thanks for the patience
> >
> > Cristian
> >
> >
> >>
> >> Nick
> >>
> >> On 11/5/20 8:46 PM, Cristian Marussi wrote:
> >>> Hi Nick,
> >>>
> >>> after past month few experiments on ARM KCIDB submissions against yo=
ur
> >>> KCIDB staging instance , I was dragged a bit away from this by other=
 stuff
> >>> before effectively deploying some real automation on our side to pus=
h our
> >>> daily results to KCIDB...now I'm back at it and I'll keep on testing
> >>> some automation on our side for a bit against your KCIDB staging ins=
tance
> >>> before asking you to move to production eventually.
> >>>
> >>> But, today I realized, though, that I cannot push anymore data succe=
ssfully
> >>> into staging even using the same test script I used one month ago to=
 push
> >>> some new test data seems to fail now (I tested a few different days =
and
> >>> JSON validates fine with jsonschema...with proper dates with hours..=
.)...
> >>> ...I cannot see any of my today tests' pushes on:
> >>>
> >>> https://staging.kernelci.org:3000/d/home/home?orgId=3D1&from=3Dnow-1=
y&to=3Dnow&refresh=3D30m&var-origin=3Darm&var-git_repository_url=3DAll&var-=
dataset=3Dplayground_kernelci04
> >>>
> >>> Auth seems to proceed fine, but I cannot find any submission dated a=
fter
> >>> the old ~15/18-09-2020 submissions. I'm using the same kci-submit to=
ols
> >>> version installed past months from your github though.
> >>>
> >>> Do you see any errors on your side that can shed a light on this ?
> >>>
> >>> Thanks
> >>>
> >>> Regards
> >>>
> >>> Cristian
> >>>
> >>> On Fri, Sep 18, 2020 at 05:42:28PM +0100, Cristian Marussi wrote:
> >>>> Hi Nick,
> >>>>
> >>>> On Fri, Sep 18, 2020 at 06:53:28PM +0300, Nikolai Kondrashov wrote:
> >>>>> On 9/18/20 6:30 PM, Nikolai Kondrashov wrote:
> >>>>>> Yes, I think it's one of the problems you uncovered :)
> >>>>>>
> >>>>>> The schema allows for fully-compliant RFC3339 timestamps, but the=
 BigQuery
> >>>>>> database on the backend doesn't understand some of them. In parti=
cular it
> >>>>>> doesn't understand the date-only timestamps you send. E.g. "2020-=
09-13".
> >>>>>> That's what I wanted to fix today, but ran out of time.
> >>>>>
> >>>>> Looking at this more it seems that Python's jsonschema module simp=
ly doesn't
> >>>>> enforce the requirements we put on those fields =F0=9F=A4=A6. You =
can send essentially
> >>>>> what you want and then hit BigQuery, which is serious about them.
> >>>>
> >>>> ...in fact on my side I check too with jsonschema in my script befo=
re using kcidb :D
> >>>>>
> >>>>> Sorry about that.
> >>>>>
> >>>>
> >>>> No worries.
> >>>>
> >>>>> I opened an issue for this: https://github.com/kernelci/kcidb/issu=
es/108
> >>>>>
> >>>>> For now please just make sure your timestamp comply with RFC3339.
> >>>>>
> >>>>> You can produce such a timestamp e.g. using "date --rfc-3339=3Ds".
> >>>>
> >>>> I'll anyway fix my data on my side too, to have the real discovery =
timestamp.
> >>>>
> >>>>>
> >>>>> Nick
> >>>>>
> >>>>
> >>>> Thanks
> >>>>
> >>>> Cristian
> >>>>
> >>>>> On 9/18/20 6:30 PM, Nikolai Kondrashov wrote:
> >>>>>> On 9/18/20 6:21 PM, Cristian Marussi wrote:
> >>>>>>    > So in order to carry on my experiments, I've just tried to p=
ush a new dataset
> >>>>>>    > with a few changes in my data-layout to mimic what I see oth=
er origins do; this
> >>>>>>    > contained something like 38 builds across 4 different revisi=
ons (with brand new
> >>>>>>    > revisions IDs), but I cannot see anything on the UI: I just =
keep seeing the old
> >>>>>>    > push from yesterday.
> >>>>>>    >
> >>>>>>    > JSON seems valid and kcidb-submit does not report any error =
even using -l DEBUG.
> >>>>>>    > (I pushed >30mins ago)
> >>>>>>    >
> >>>>>>    > Any idea ?
> >>>>>>
> >>>>>> Yes, I think it's one of the problems you uncovered :)
> >>>>>>
> >>>>>> The schema allows for fully-compliant RFC3339 timestamps, but the=
 BigQuery
> >>>>>> database on the backend doesn't understand some of them. In parti=
cular it
> >>>>>> doesn't understand the date-only timestamps you send. E.g. "2020-=
09-13".
> >>>>>> That's what I wanted to fix today, but ran out of time.
> >>>>>>
> >>>>>> Additionally, the backend doesn't have a way to report a problem =
to the
> >>>>>> submitter at the moment. We intend to fix that, but for now it's =
possible only
> >>>>>> through us looking at the logs and sending a message to the submi=
tter :)
> >>>>>>
> >>>>>> To work around this you can pad your timestamps with dummy date a=
nd time
> >>>>>> data.
> >>>>>>
> >>>>>> E.g. instead of sending:
> >>>>>>
> >>>>>>        2020-09-13
> >>>>>>
> >>>>>> you can send:
> >>>>>>
> >>>>>>        2020-09-13 00:00:00+00:00
> >>>>>>
> >>>>>> Hopefully that's the only problem. It could be, since you managed=
 to send data
> >>>>>> before :)
> >>>>>>
> >>>>>> Nick
> >>>>>>
> >>>>>> On 9/18/20 6:21 PM, Cristian Marussi wrote:
> >>>>>>    > Hi Nikolai,
> >>>>>>    >
> >>>>>>    > On Thu, Sep 17, 2020 at 08:26:15PM +0300, Nikolai Kondrashov=
 wrote:
> >>>>>>    >> On 9/17/20 7:22 PM, Cristian Marussi wrote:
> >>>>>>    >>> It works too ... :D
> >>>>>>    >>>
> >>>>>>    >>> https://staging.kernelci.org:3000/d/build/build?orgId=3D1&=
var-dataset=3Dplayground_kernelci04&var-id=3Darm:2020-07-07:d3d7689c2cc9503=
266cac3bc777bb4ddae2e5f2e
> >>>>>>    >>
> >>>>>>    >> Whoa, awesome!
> >>>>>>    >>
> >>>>>>    >> And you have already uncovered a few issues we need to fix,=
 too!
> >>>>>>    >> I will deal with them tomorrow.
> >>>>>>    >>
> >>>>>>    >>> ..quick question though....given that now I'll have to pla=
y quite a bit
> >>>>>>    >>> with it and see how's better to present our data, if anyth=
injg missing etc etc,
> >>>>>>    >>> is there any chance (or way) that if I submmit the same JS=
ON report multiple
> >>>>>>    >>> times with slight differences here and there (but with the=
 same IDs clearly)
> >>>>>>    >>> I'll get my DB updated in the bits I have changed: as an e=
xample I've just
> >>>>>>    >>> resubmitted the same report with added discovery_time and =
descriptions, and got
> >>>>>>    >>> NO errors, but I cannot see the changes in the UI (unless =
they have still to
> >>>>>>    >>> propagate...)..or maybe I can obtain the same effect by dr=
opping my dataset
> >>>>>>    >>> before re-submitting ?
> >>>>>>    >>
> >>>>>>    >> Right now it's not supported (with various possible quirks =
if attempted).
> >>>>>>    >> So, preferably, submit only one, complete and final instanc=
e of each object
> >>>>>>    >> (with unique ID) for now.
> >>>>>>    >>
> >>>>>>    >> We have a plan to support merging missing properties across=
 multiple reported
> >>>>>>    >> objects with the same ID.
> >>>>>>    >>
> >>>>>>    >>              Object A        Object B    Dashboard/Notifica=
tions
> >>>>>>    >>
> >>>>>>    >> FieldX:     Foo             Foo         Foo
> >>>>>>    >> FieldY:                     Bar         Bar
> >>>>>>    >> FieldZ:     Baz                         Baz
> >>>>>>    >> FieldU:     Red             Blue        Red/Blue
> >>>>>>    >>
> >>>>>>    >> Since we're using a distributed database we cannot really m=
aintain order
> >>>>>>    >> (without introducing artificial global lock), so the order =
of the reports
> >>>>>>    >> doesn't matter. We can only guarantee that a present value =
would override
> >>>>>>    >> missing value. It would be undefined which value would be p=
icked among
> >>>>>>    >> multiple different values.
> >>>>>>    >>
> >>>>>>    >> This would allow gradual reporting of each object, but no e=
diting, sorry.
> >>>>>>    >>
> >>>>>>    >> However, once again, this is a plan with some research done=
, only.
> >>>>>>    >> I plan to start implementing it within a few weeks.
> >>>>>>    >>
> >>>>>>    >
> >>>>>>    > So in order to carry on my experiments, I've just tried to p=
ush a new dataset
> >>>>>>    > with a few changes in my data-layout to mimic what I see oth=
er origins do; this
> >>>>>>    > contained something like 38 builds across 4 different revisi=
ons (with brand new
> >>>>>>    > revisions IDs), but I cannot see anything on the UI: I just =
keep seeing the old
> >>>>>>    > push from yesterday.
> >>>>>>    >
> >>>>>>    > JSON seems valid and kcidb-submit does not report any error =
even using -l DEBUG.
> >>>>>>    > (I pushed >30mins ago)
> >>>>>>    >
> >>>>>>    > Any idea ?
> >>>>>>    >
> >>>>>>    > Thanks
> >>>>>>    >
> >>>>>>    > Cristian
> >>>>>>    >
> >>>>>>    >> Nick
> >>>>>>    >>
> >>>>>>    >> On 9/17/20 7:22 PM, Cristian Marussi wrote:
> >>>>>>    >>> On Thu, Sep 17, 2020 at 04:52:30PM +0300, Nikolai Kondrash=
ov wrote:
> >>>>>>    >>>> Hi Christian,
> >>>>>>    >>>>
> >>>>>>    >>>> On 9/17/20 3:50 PM, Cristian Marussi wrote:
> >>>>>>    >>>>> Hi Nikolai,
> >>>>>>    >>>>>
> >>>>>>    >>>>> I work at ARM in the Kernel team and, in short, we'd lik=
e certainly to
> >>>>>>    >>>>> contribute our internal Kernel test results to KCIDB.
> >>>>>>    >>>>
> >>>>>>    >>>> Wonderful!
> >>>>>>    >>>>
> >>>>>>    >>>>> After having attended your LPC2020 TestMC and KernelCI/B=
oF, I've now cooked
> >>>>>>    >>>>> up some KCIDB JSON test report (seemingly valid against =
your KCIDB v3 schema)
> >>>>>>    >>>>> and I'd like to start experimenting with kci-submit (on =
non-production
> >>>>>>    >>>>> instances), so as to assess how to fit our results into =
your schema and maybe
> >>>>>>    >>>>> contribute with some new KCIDB requirements if strictly =
needed.
> >>>>>>    >>>>
> >>>>>>    >>>> Great, this is exactly what we need, welcome aboard :)
> >>>>>>    >>>>
> >>>>>>    >>>> Please don't hesitate to reach out on kernelci@groups.io =
or on #kernelci on
> >>>>>>    >>>> freenode.net, if you have any questions, problems, or req=
uirements.
> >>>>>>    >>>>
> >>>>>>    >>>>> Is it possible to get some valid credentials and a playg=
round instance to
> >>>>>>    >>>>> point at ?
> >>>>>>    >>>>
> >>>>>>    >>>> Absolutely, I created credentials for you and sent them i=
n a separate message.
> >>>>>>    >>>>
> >>>>>>    >>>> You can use origin "arm" for the start, unless you have m=
ultiple CI systems
> >>>>>>    >>>> and want to differentiate them somehow in your reports.
> >>>>>>    >>>>
> >>>>>>    >>>> Nick
> >>>>>>    >>>>
> >>>>>>    >>>    Thanks !
> >>>>>>    >>>
> >>>>>>    >>> It works too ... :D
> >>>>>>    >>>
> >>>>>>    >>> https://staging.kernelci.org:3000/d/build/build?orgId=3D1&=
var-dataset=3Dplayground_kernelci04&var-id=3Darm:2020-07-07:d3d7689c2cc9503=
266cac3bc777bb4ddae2e5f2e
> >>>>>>    >>>
> >>>>>>    >>> ..quick question though....given that now I'll have to pla=
y quite a bit
> >>>>>>    >>> with it and see how's better to present our data, if anyth=
injg missing etc etc,
> >>>>>>    >>> is there any chance (or way) that if I submmit the same JS=
ON report multiple
> >>>>>>    >>> times with slight differences here and there (but with the=
 same IDs clearly)
> >>>>>>    >>> I'll get my DB updated in the bits I have changed: as an e=
xample I've just
> >>>>>>    >>> resubmitted the same report with added discovery_time and =
descriptions, and got
> >>>>>>    >>> NO errors, but I cannot see the changes in the UI (unless =
they have still to
> >>>>>>    >>> propagate...)..or maybe I can obtain the same effect by dr=
opping my dataset
> >>>>>>    >>> before re-submitting ?
> >>>>>>    >>>
> >>>>>>    >>> Regards
> >>>>>>    >>>
> >>>>>>    >>> Thanks
> >>>>>>    >>>
> >>>>>>    >>> Cristian
> >>>>>>    >>>
> >>>>>>    >>>> On 9/17/20 3:50 PM, Cristian Marussi wrote:
> >>>>>>    >>>>> Hi Nikolai,
> >>>>>>    >>>>>
> >>>>>>    >>>>> I work at ARM in the Kernel team and, in short, we'd lik=
e certainly to
> >>>>>>    >>>>> contribute our internal Kernel test results to KCIDB.
> >>>>>>    >>>>>
> >>>>>>    >>>>> After having attended your LPC2020 TestMC and KernelCI/B=
oF, I've now cooked
> >>>>>>    >>>>> up some KCIDB JSON test report (seemingly valid against =
your KCIDB v3 schema)
> >>>>>>    >>>>> and I'd like to start experimenting with kci-submit (on =
non-production
> >>>>>>    >>>>> instances), so as to assess how to fit our results into =
your schema and maybe
> >>>>>>    >>>>> contribute with some new KCIDB requirements if strictly =
needed.
> >>>>>>    >>>>>
> >>>>>>    >>>>> Is it possible to get some valid credentials and a playg=
round instance to
> >>>>>>    >>>>> point at ?
> >>>>>>    >>>>>
> >>>>>>    >>>>> Thanks
> >>>>>>    >>>>>
> >>>>>>    >>>>> Regards
> >>>>>>    >>>>>
> >>>>>>    >>>>> Cristian
> >>>>>>    >>>>>
> >>>>>>    >>>>>
> >>>>>>    >>>>>
> >>>>>>    >>>>>
> >>>>>>    >>>>>
> >>>>>>    >>>>
> >>>>>>    >>>
> >>>>>>    >>
> >>>>>>    >
> >>>>>>    >
> >>>>>>    > >
> >>>>>>    >
> >>>>>>
> >>>>>>
> >>>>>>
> >>>>>>
> >>>>>>
> >>>>>>
> >>>>>
> >>>
> >>>
> >>>>
> >>>
> >>
> >>
> >>
> >>=20
> >>
> >>
> >
>=20
