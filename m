Date: Thu, 10 Dec 2020 20:19:43 +0000
From: "Cristian Marussi" <cristian.marussi@arm.com>
Subject: Re: Contributing ARM tests results to KCIDB
Message-ID: <20201210201943.GE8455@e120937-lin>
References: <be42f631-897d-0cdf-0225-5d01256f39e5@redhat.com>
 <20200918164228.GA16509@e119603-lin.cambridge.arm.com>
 <20201105184631.GD24640@e120937-lin>
 <4db924ab-2f38-ac63-1b71-51ead907ba1f@redhat.com>
 <20201202092340.GB8455@e120937-lin>
 <d0c2936f-fab5-3aea-fbd0-22b59df9bfd3@redhat.com>
 <20201202120105.GC8455@e120937-lin>
 <008d1ca4-1b3f-c24f-9245-b19eb21c63a6@redhat.com>
 <20201210172243.GD8455@e120937-lin>
 <9809ec2c-84d0-8e56-9ebd-659cc8d666da@redhat.com>
MIME-Version: 1.0
In-Reply-To: <9809ec2c-84d0-8e56-9ebd-659cc8d666da@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
List-ID: <kernelci.groups.io>
To: kernelci@groups.io, Nikolai.Kondrashov@redhat.com
Cc: broonie@kernel.org, basil.eljuse@arm.com

Hi

On Thu, Dec 10, 2020 at 08:17:42PM +0200, Nikolai Kondrashov via groups.io=
 wrote:
> Hi Cristian,
>=20
> On 12/10/20 7:23 PM, Cristian Marussi wrote:
> > I fixed the issue about uniqueness of the tests IDs but left the valid
> > flag on the revision undefined as of now given the revision hash is
> > temporarily faked (as I told you)...just to have an indication that th=
e
> > revision is bogus.
> > Anyway I'll have that fixed in our backend soon, and once I'll start
> > receiving a proper real hash the system 'should' automatically start
> > tagging revisions as valid: True.
>=20
> Good plan!
>=20
> > Moreover, after fixing a few more annoyances on my side, today I switc=
hed to
> > KCIDB production and pushed December results; from tomorrow morning it=
 should
> > start feeding daily data to KCIDB production.
>=20
> Woo-hoo! Wonderful, this is a nice Christmas present :)
>=20
> > Thanks for the support and patience.
>=20
> Thank you for your work, Cristian!
>=20
> I notice a bit of strange data: failed builds have one (failed) boot tes=
t
> submitted. Is this on purpose, does this mean something special? Logical=
ly, we
> can't boot a build if it hasn't completed, don't we?
>=20
> Here's an example:
>=20
>     https://staging.kernelci.org:3000/d/build/build?orgId=3D1&var-id=3Da=
rm:2020-12-08:d6051b14fced47d1983fd70171b9bcd7170491ce
>=20
> Nick
>=20

So basically, everything I have on my side represents a test run of some k=
ind
of suite (LTP, KSELFTEST, KVM-UT...etc), because basically this is what we
trace currently (at least the data we accumulate in the DB); failed builds
(as in compilation failed) are not really tracked, so I would have all the
builds green in KCIDB in this scenario.

If a testrun(kernel) successfully boots and successfully runs till the end=
 I
gather a number of individual test results.
Then I 'synthetize' a boot test and a cumulative test-suite result in
addition to all the singular tests results I could find.

In order to fit the above in your schema currently, and give some info abo=
ut
the testrun(build) general health, I mark builds valid only if the testrun=
/
kernel has both:
  -> booted
  -> run the test_suite till completion (without hang) with or without
  singular tests failures

In all the other cases, so no boot or hang with imcomplete results, build
gets red but anyway, a failed boot test (on noboot) or a successfull boot
test and nothing else (on hang) could be present.
(and at the moment I don't have public logs to provide as you can see
which is not so useful)

Alternatively, sticking probably better to the intended usage of your sche=
ma,
I could just mark all builds valid for now, and then mark invalid in the
future only the broken compilations as expected (once and if such data wil=
l
be available programmatically on my side): in such case we'd anyway have t=
he
boot test results to see what's going on a green build with apparently
no other results.

Maybe it's better really going this latter way to fit the usual meaning of
the schema and be able to provide compilation issues results in the
future.
If you feel this is reasonable I can easily fix it immediately (for the re=
al
final deployment is still be fully done :D)

Thanks

Cristian


> On 12/10/20 7:23 PM, Cristian Marussi wrote:
> > Hi Nick
> >
> > On Wed, Dec 02, 2020 at 03:38:19PM +0200, Nikolai Kondrashov via group=
s.io wrote:
> >> On 12/2/20 2:01 PM, Cristian Marussi wrote:
> >>>>   From POV of KCIDB, what you're sending now is overwriting the sam=
e test runs
> >>>> over and over, and we can't really tell which one of those objects =
is the
> >>>> final version.
> >>>
> >>>
> >>> Ah, that was exactly what I used to do in my first initial experimen=
ts and then,
> >>> looking at the data on the UI, I was dumb enough to decide that I sh=
ould have got
> >>> it wrong and I started using the test_id instead of the test_executi=
on_id, because
> >>> I thought that, anyway, you can recognize the different test executi=
ons of the
> >>> same test_id looking at the different build_id is part of (which for=
 us represent
> >>> the different test suite runs)....but I suppose this wrong assumptio=
n of mine
> >>> sparked from the relational data model I use on our side. I'll fix i=
t.
> >>
> >> Yes, that would work, but then we get a "foreign key explosion" as we=
 start
> >> linking to tests from other objects beside builds. So, for now we're =
sticking
> >> to the "one ID column per table" policy.
> >>
> >> Thanks for bearing with us, and am glad to hear you already have
> >> `test_execution_id` in your database, so the fix shouldn't take long =
:)
> >>
> >>> Sure, in fact, as of now I still have to ask for some changes in our=
 reporting
> >>> backend, (which generates the original data stored in our DB and the=
n pushed
> >>> to you), so I have to admit the git commit hash are partially faked =
(since I
> >>> have only a git describe string to start from) and as a consequence =
they won't
> >>> really be so much useful for comparisons amongst different origins (=
given
> >>> they don't refer real kernel commits), BUT I thought this NOT to be =
a
> >>> blocking problem for now, so that I can start pushing data to KCIDB =
and
> >>> then later on (once I get real full hashes on my side) I'll start pu=
shing the
> >>> real valid ones, does it sounds good ?
> >>
> >> Yes, no problem. We don't have maintainers/developers to get angry ye=
t :D
> >>
> >> I'm looking forward to having four-origin revisions in the dashboard,=
 though,
> >> one more than e.g. this one:
> >>
> >>      https://staging.kernelci.org:3000/d/revision/revision?var-id=3D3=
650b228f83adda7e5ee532e2b90429c03f7b9ec
> >>
> >
> > I fixed the issue about uniqueness of the tests IDs but left the valid
> > flag on the revision undefined as of now given the revision hash is
> > temporarily faked (as I told you)...just to have an indication that th=
e
> > revision is bogus.
> > Anyway I'll have that fixed in our backend soon, and once I'll start
> > receiving a proper real hash the system 'should' automatically start
> > tagging revisions as valid: True.
> >
> >>> Side question...for dynamic schema validation purposes...is there an=
y URL
> >>> where I can fetch the latest currently valid schema ... something li=
ke:
> >>>
> >>> https://github.com/kernelci/kcidb/releases/kcidb.latest.schema.json
> >>>
> >>> so that I can check automatically against the latest greatest instea=
d of
> >>> using a builtin predownloaded one (or is it a bad idea in your opini=
on ?)
> >>
> >> The JSON schemas we generate with `kcidb-schema`, and use inside KCID=
B, only
> >> validate *one* major version. So v3 data would only validate with v3 =
schema,
> >> but not with e.g. v4.
> >>
> >> So if you e.g. download and validate against the latest-release schem=
a
> >> automatically, validation will start failing the moment a release wit=
h v4
> >> comes out.
> >>
> >> Automatic data upgrades between major versions are done in Python whe=
never we
> >> see a difference between the numbers.
> >>
> >> OTOH, minor version bumps of the schema are backwards-compatible, and=
 you
> >> would be fine upgrading validation to those. However, we don't have m=
any of
> >> those at all yet, as we're still changing the schema a lot.
> >>
> >> So, I think a reasonable workflow right now is to download and switch=
 to a new
> >> version at the same time you're upgrading your submission code to the=
 next
> >> major release of the schema. You'll need more work on the code than j=
ust
> >> switching the schema, anyway.
> >>
> >> However, let's get back to this further along the way, perhaps we can=
 think of
> >> something smoother and more automated. E.g. set up a way to have auto=
matic
> >> upgrades between minor versions.
> >
> > Agreed, using v3 for the moment.
> >
> > Moreover, after fixing a few more annoyances on my side, today I switc=
hed to
> > KCIDB production and pushed December results; from tomorrow morning it=
 should
> > start feeding daily data to KCIDB production.
> >
> > Thanks for the support and patience.
> >
> > Cristian
> >
> >>
> >> Thanks :)
> >> Nick
> >>
> >> On 12/2/20 2:01 PM, Cristian Marussi wrote:
> >>> On Wed, Dec 02, 2020 at 12:16:10PM +0200, Nikolai Kondrashov wrote:
> >>>> On 12/2/20 11:23 AM, Cristian Marussi wrote:
> >>>>> On Wed, Dec 02, 2020 at 10:05:05AM +0200, Nikolai Kondrashov via g=
roups.io wrote:
> >>>>>> On 11/5/20 8:46 PM, Cristian Marussi wrote:
> >>>>>>> after past month few experiments on ARM KCIDB submissions agains=
t your
> >>>>>>> KCIDB staging instance , I was dragged a bit away from this by o=
ther stuff
> >>>>>>> before effectively deploying some real automation on our side to=
 push our
> >>>>>>> daily results to KCIDB...now I'm back at it and I'll keep on tes=
ting
> >>>>>>> some automation on our side for a bit against your KCIDB staging=
 instance
> >>>>>>> before asking you to move to production eventually.
> >>>>>>
> >>>>>> I see your data has been steadily trickling into our playground d=
atabase and
> >>>>>> it looks quite good. Would you like to move to the production ins=
tance?
> >>>>>>
> >>>>>> I can review your data for you, we can fix the remaining issues i=
f we find
> >>>>>> them, and I can give you the permissions to push to production. T=
hen you will
> >>>>>> only need to change the topic you push to from "playground_kernel=
ci_new" to
> >>>>>> "kernelci_new".
> >>>>>
> >>>>> In fact I left one staging instance on our side to push data on yo=
ur
> >>>>> staging instance to verify remaining issues on our side *and there=
 are a
> >>>>> couple of minor ones I spotted that I'd like to fix indeed);
> >>>>
> >>>> Sure, it's up to you when you decide to switch. However, if you'd l=
ike, list
> >>>> your issues here, and I would be able to tell you if those are impo=
rtant from
> >>>> KCIDB POV.
> >>>>
> >>>> Looking at your data, I can only find one serious issue: the test r=
un ("test")
> >>>> IDs are not unique. E.g. there are 1460 objects with ID "arm:LTP:11=
" which
> >>>> use 643 distinct build_id's among them.
> >>>>
> >>>> The test run IDs should correspond to a single execution of a test.=
 Otherwise
> >>>> we won't be able to tell them apart. You can send multiple reports =
containing
> >>>> test runs ("tests") with the same ID, but that would still mean the=
 same
> >>>> execution, only repeating the same data, or adding more.
> >>>>
> >>>> A little more explanation:
> >>>> https://github.com/kernelci/kcidb/blob/master/SUBMISSION_HOWTO.md#s=
ubmitting-objects-multiple-times
> >>>>
> >>>>   From POV of KCIDB, what you're sending now is overwriting the sam=
e test runs
> >>>> over and over, and we can't really tell which one of those objects =
is the
> >>>> final version.
> >>>
> >>>
> >>> Ah, that was exactly what I used to do in my first initial experimen=
ts and then,
> >>> looking at the data on the UI, I was dumb enough to decide that I sh=
ould have got
> >>> it wrong and I started using the test_id instead of the test_executi=
on_id, because
> >>> I thought that, anyway, you can recognize the different test executi=
ons of the
> >>> same test_id looking at the different build_id is part of (which for=
 us represent
> >>> the different test suite runs)....but I suppose this wrong assumptio=
n of mine
> >>> sparked from the relational data model I use on our side. I'll fix i=
t.
> >>>
> >>>>
> >>>> Aside from that, you might want to add `"valid": true` to your "rev=
ision"
> >>>> objects to indicate they're alright. You never seem to send patched=
 revisions,
> >>>> so it should always be true for you. Then instead of the blank "Sta=
tus" field:
> >>>>
> >>>>       https://staging.kernelci.org:3000/d/revision/revision?orgId=
=3D1&var-dataset=3Dplayground_kernelci04&var-id=3Df0d5c8f71bbb1aa1e98cb1a8=
9adb9d57c04ede3d
> >>>>
> >>>> you would get a nice green check mark, like this:
> >>>>
> >>>>       https://staging.kernelci.org:3000/d/revision/revision?orgId=
=3D1&var-dataset=3Dkernelci04&var-id=3D8af5fe40bd59d8aa26dd76d9971435177aa=
cbfce
> >>>>
> >>>
> >>> Ah I missed this valid flag on revision too, I'll fix.
> >>>
> >>>> Finally, at this stage we really need a breadth of data coming from
> >>>> different CI system, rather than its depth or precision, so we can =
understand
> >>>> the problem at hand better and faster. It would do us no good to co=
ncentrate
> >>>> on just a few, and solidify the design around them. That would make=
 it more
> >>>> difficult for others to join.
> >>>>
> >>>> You can refine and add more data afterwards.
> >>>>
> >>>
> >>> Sure, in fact, as of now I still have to ask for some changes in our=
 reporting
> >>> backend, (which generates the original data stored in our DB and the=
n pushed
> >>> to you), so I have to admit the git commit hash are partially faked =
(since I
> >>> have only a git describe string to start from) and as a consequence =
they won't
> >>> really be so much useful for comparisons amongst different origins (=
given
> >>> they don't refer real kernel commits), BUT I thought this NOT to be =
a
> >>> blocking problem for now, so that I can start pushing data to KCIDB =
and
> >>> then later on (once I get real full hashes on my side) I'll start pu=
shing the
> >>> real valid ones, does it sounds good ?
> >>>
> >>>
> >>>>> moreover I saw a little while a go that you're going to switch to =
schema v4
> >>>>> with some minor changes in revisions and commit_hashes so I wanted=
 to
> >>>>> conform to that once it's published (even though you're back compa=
tible with
> >>>>> v3 AFAIU)....
> >>>>
> >>>> I would rather you didn't wait for that, as I'm neck deep in resear=
ch for the
> >>>> next release right now, and it doesn't seem like it's gonna come ou=
t soon.
> >>>> I'm concentrating on getting our result notifications in a good sha=
pe so we
> >>>> can reach actual kernel developers ASAP.
> >>>>
> >>>> We can work on upgrading your setup later, when it comes out. And t=
here are
> >>>> going to be other changes, anyway. So, I'd rather we released early=
 and
> >>>> iterated.
> >>>>
> >>>
> >>> Good I'l stick to v3.
> >>>
> >>> Side question...for dynamic schema validation purposes...is there an=
y URL
> >>> where I can fetch the latest currently valid schema ... something li=
ke:
> >>>
> >>> https://github.com/kernelci/kcidb/releases/kcidb.latest.schema.json
> >>>
> >>> so that I can check automatically against the latest greatest instea=
d of
> >>> using a builtin predownloaded one (or is it a bad idea in your opini=
on ?)
> >>>
> >>>>> ... then I've got dragged away again from this past week :D
> >>>>>
> >>>>> In fact my next steps (possibly next week) would have been (beside=
 my fixes)
> >>>>> to ask you how to proceed further to production KCIDB.
> >>>>
> >>>> There's never enough time for everything :)
> >>>>
> >>>
> >>> eh..
> >>>
> >>>>> Would you want me to stop flooding your staging instance in the me=
antime (:D)
> >>>>> till I'm back at it at least , I think I have enugh data now to de=
bug anyway.
> >>>>> (I could made a few more check next week though)
> >>>>
> >>>> Don't worry about that, and keep pushing, maybe you'll manage to br=
eak it
> >>>> again and then we can fix it :)
> >>>>
> >>>
> >>> Fine :D
> >>>
> >>>>> If it's just a matter of switching project (once got enhanced perm=
issions
> >>>>> from you) please do it, and I'll try to finalize all next week on =
our
> >>>>> side and move to production.
> >>>>
> >>>> Permission granted! Switch when you feel ready, and don't hesitate =
to ping me
> >>>> for another review, if you need it.
> >>>>
> >>>> Just replace "playground_kernelci_new" topic with "kernelci_new" in=
 your
> >>>> setup when you're ready.
> >>>>
> >>>
> >>> Cool, thanks.
> >>>
> >>>>> Thanks for the patience
> >>>>
> >>>> Thank you for your effort, we need your data :D
> >>>>
> >>>> Nick
> >>>>
> >>>
> >>> Thank you Nick
> >>>
> >>> Cheers,
> >>>
> >>> Cristian
> >>>
> >>>
> >>>> On 12/2/20 11:23 AM, Cristian Marussi wrote:
> >>>>> Hi Nick
> >>>>>
> >>>>> On Wed, Dec 02, 2020 at 10:05:05AM +0200, Nikolai Kondrashov via g=
roups.io wrote:
> >>>>>> Hi Cristian,
> >>>>>>
> >>>>>> On 11/5/20 8:46 PM, Cristian Marussi wrote:
> >>>>>>> Hi Nick,
> >>>>>>>
> >>>>>>> after past month few experiments on ARM KCIDB submissions agains=
t your
> >>>>>>> KCIDB staging instance , I was dragged a bit away from this by o=
ther stuff
> >>>>>>> before effectively deploying some real automation on our side to=
 push our
> >>>>>>> daily results to KCIDB...now I'm back at it and I'll keep on tes=
ting
> >>>>>>> some automation on our side for a bit against your KCIDB staging=
 instance
> >>>>>>> before asking you to move to production eventually.
> >>>>>>
> >>>>>> I see your data has been steadily trickling into our playground d=
atabase and
> >>>>>> it looks quite good. Would you like to move to the production ins=
tance?
> >>>>>>
> >>>>>> I can review your data for you, we can fix the remaining issues i=
f we find
> >>>>>> them, and I can give you the permissions to push to production. T=
hen you will
> >>>>>> only need to change the topic you push to from "playground_kernel=
ci_new" to
> >>>>>> "kernelci_new".
> >>>>>
> >>>>> In fact I left one staging instance on our side to push data on yo=
ur
> >>>>> staging instance to verify remaining issues on our side *and there=
 are a
> >>>>> couple of minor ones I spotted that I'd like to fix indeed); moreo=
ver I saw
> >>>>> a little while a go that you're going to switch to schema v4 with =
some minor
> >>>>> changes in revisions and commit_hashes so I wanted to conform to t=
hat once
> >>>>> it's published (even though you're back compatible with v3 AFAIU).=
...
> >>>>>
> >>>>> ... then I've got dragged away again from this past week :D
> >>>>>
> >>>>> In fact my next steps (possibly next week) would have been (beside=
 my fixes)
> >>>>> to ask you how to proceed further to production KCIDB.
> >>>>>
> >>>>> Would you want me to stop flooding your staging instance in the me=
antime (:D)
> >>>>> till I'm back at it at least , I think I have enugh data now to de=
bug anyway.
> >>>>> (I could made a few more check next week though)
> >>>>>
> >>>>> If it's just a matter of switching project (once got enhanced perm=
issions
> >>>>> from you) please do it, and I'll try to finalize all next week on =
our
> >>>>> side and move to production.
> >>>>>
> >>>>> Thanks for the patience
> >>>>>
> >>>>> Cristian
> >>>>>
> >>>>>
> >>>>>>
> >>>>>> Nick
> >>>>>>
> >>>>>> On 11/5/20 8:46 PM, Cristian Marussi wrote:
> >>>>>>> Hi Nick,
> >>>>>>>
> >>>>>>> after past month few experiments on ARM KCIDB submissions agains=
t your
> >>>>>>> KCIDB staging instance , I was dragged a bit away from this by o=
ther stuff
> >>>>>>> before effectively deploying some real automation on our side to=
 push our
> >>>>>>> daily results to KCIDB...now I'm back at it and I'll keep on tes=
ting
> >>>>>>> some automation on our side for a bit against your KCIDB staging=
 instance
> >>>>>>> before asking you to move to production eventually.
> >>>>>>>
> >>>>>>> But, today I realized, though, that I cannot push anymore data s=
uccessfully
> >>>>>>> into staging even using the same test script I used one month ag=
o to push
> >>>>>>> some new test data seems to fail now (I tested a few different d=
ays and
> >>>>>>> JSON validates fine with jsonschema...with proper dates with hou=
rs...)...
> >>>>>>> ...I cannot see any of my today tests' pushes on:
> >>>>>>>
> >>>>>>> https://staging.kernelci.org:3000/d/home/home?orgId=3D1&from=3Dn=
ow-1y&to=3Dnow&refresh=3D30m&var-origin=3Darm&var-git_repository_url=3DAll&=
var-dataset=3Dplayground_kernelci04
> >>>>>>>
> >>>>>>> Auth seems to proceed fine, but I cannot find any submission dat=
ed after
> >>>>>>> the old ~15/18-09-2020 submissions. I'm using the same kci-submi=
t tools
> >>>>>>> version installed past months from your github though.
> >>>>>>>
> >>>>>>> Do you see any errors on your side that can shed a light on this=
 ?
> >>>>>>>
> >>>>>>> Thanks
> >>>>>>>
> >>>>>>> Regards
> >>>>>>>
> >>>>>>> Cristian
> >>>>>>>
> >>>>>>> On Fri, Sep 18, 2020 at 05:42:28PM +0100, Cristian Marussi wrote=
:
> >>>>>>>> Hi Nick,
> >>>>>>>>
> >>>>>>>> On Fri, Sep 18, 2020 at 06:53:28PM +0300, Nikolai Kondrashov wr=
ote:
> >>>>>>>>> On 9/18/20 6:30 PM, Nikolai Kondrashov wrote:
> >>>>>>>>>> Yes, I think it's one of the problems you uncovered :)
> >>>>>>>>>>
> >>>>>>>>>> The schema allows for fully-compliant RFC3339 timestamps, but=
 the BigQuery
> >>>>>>>>>> database on the backend doesn't understand some of them. In p=
articular it
> >>>>>>>>>> doesn't understand the date-only timestamps you send. E.g. "2=
020-09-13".
> >>>>>>>>>> That's what I wanted to fix today, but ran out of time.
> >>>>>>>>>
> >>>>>>>>> Looking at this more it seems that Python's jsonschema module =
simply doesn't
> >>>>>>>>> enforce the requirements we put on those fields =F0=9F=A4=A6. =
You can send essentially
> >>>>>>>>> what you want and then hit BigQuery, which is serious about th=
em.
> >>>>>>>>
> >>>>>>>> ...in fact on my side I check too with jsonschema in my script =
before using kcidb :D
> >>>>>>>>>
> >>>>>>>>> Sorry about that.
> >>>>>>>>>
> >>>>>>>>
> >>>>>>>> No worries.
> >>>>>>>>
> >>>>>>>>> I opened an issue for this: https://github.com/kernelci/kcidb/=
issues/108
> >>>>>>>>>
> >>>>>>>>> For now please just make sure your timestamp comply with RFC33=
39.
> >>>>>>>>>
> >>>>>>>>> You can produce such a timestamp e.g. using "date --rfc-3339=
=3Ds".
> >>>>>>>>
> >>>>>>>> I'll anyway fix my data on my side too, to have the real discov=
ery timestamp.
> >>>>>>>>
> >>>>>>>>>
> >>>>>>>>> Nick
> >>>>>>>>>
> >>>>>>>>
> >>>>>>>> Thanks
> >>>>>>>>
> >>>>>>>> Cristian
> >>>>>>>>
> >>>>>>>>> On 9/18/20 6:30 PM, Nikolai Kondrashov wrote:
> >>>>>>>>>> On 9/18/20 6:21 PM, Cristian Marussi wrote:
> >>>>>>>>>>      > So in order to carry on my experiments, I've just trie=
d to push a new dataset
> >>>>>>>>>>      > with a few changes in my data-layout to mimic what I s=
ee other origins do; this
> >>>>>>>>>>      > contained something like 38 builds across 4 different =
revisions (with brand new
> >>>>>>>>>>      > revisions IDs), but I cannot see anything on the UI: I=
 just keep seeing the old
> >>>>>>>>>>      > push from yesterday.
> >>>>>>>>>>      >
> >>>>>>>>>>      > JSON seems valid and kcidb-submit does not report any =
error even using -l DEBUG.
> >>>>>>>>>>      > (I pushed >30mins ago)
> >>>>>>>>>>      >
> >>>>>>>>>>      > Any idea ?
> >>>>>>>>>>
> >>>>>>>>>> Yes, I think it's one of the problems you uncovered :)
> >>>>>>>>>>
> >>>>>>>>>> The schema allows for fully-compliant RFC3339 timestamps, but=
 the BigQuery
> >>>>>>>>>> database on the backend doesn't understand some of them. In p=
articular it
> >>>>>>>>>> doesn't understand the date-only timestamps you send. E.g. "2=
020-09-13".
> >>>>>>>>>> That's what I wanted to fix today, but ran out of time.
> >>>>>>>>>>
> >>>>>>>>>> Additionally, the backend doesn't have a way to report a prob=
lem to the
> >>>>>>>>>> submitter at the moment. We intend to fix that, but for now i=
t's possible only
> >>>>>>>>>> through us looking at the logs and sending a message to the s=
ubmitter :)
> >>>>>>>>>>
> >>>>>>>>>> To work around this you can pad your timestamps with dummy da=
te and time
> >>>>>>>>>> data.
> >>>>>>>>>>
> >>>>>>>>>> E.g. instead of sending:
> >>>>>>>>>>
> >>>>>>>>>>          2020-09-13
> >>>>>>>>>>
> >>>>>>>>>> you can send:
> >>>>>>>>>>
> >>>>>>>>>>          2020-09-13 00:00:00+00:00
> >>>>>>>>>>
> >>>>>>>>>> Hopefully that's the only problem. It could be, since you man=
aged to send data
> >>>>>>>>>> before :)
> >>>>>>>>>>
> >>>>>>>>>> Nick
> >>>>>>>>>>
> >>>>>>>>>> On 9/18/20 6:21 PM, Cristian Marussi wrote:
> >>>>>>>>>>      > Hi Nikolai,
> >>>>>>>>>>      >
> >>>>>>>>>>      > On Thu, Sep 17, 2020 at 08:26:15PM +0300, Nikolai Kond=
rashov wrote:
> >>>>>>>>>>      >> On 9/17/20 7:22 PM, Cristian Marussi wrote:
> >>>>>>>>>>      >>> It works too ... :D
> >>>>>>>>>>      >>>
> >>>>>>>>>>      >>> https://staging.kernelci.org:3000/d/build/build?orgI=
d=3D1&var-dataset=3Dplayground_kernelci04&var-id=3Darm:2020-07-07:d3d7689c2=
cc9503266cac3bc777bb4ddae2e5f2e
> >>>>>>>>>>      >>
> >>>>>>>>>>      >> Whoa, awesome!
> >>>>>>>>>>      >>
> >>>>>>>>>>      >> And you have already uncovered a few issues we need t=
o fix, too!
> >>>>>>>>>>      >> I will deal with them tomorrow.
> >>>>>>>>>>      >>
> >>>>>>>>>>      >>> ..quick question though....given that now I'll have =
to play quite a bit
> >>>>>>>>>>      >>> with it and see how's better to present our data, if=
 anythinjg missing etc etc,
> >>>>>>>>>>      >>> is there any chance (or way) that if I submmit the s=
ame JSON report multiple
> >>>>>>>>>>      >>> times with slight differences here and there (but wi=
th the same IDs clearly)
> >>>>>>>>>>      >>> I'll get my DB updated in the bits I have changed: a=
s an example I've just
> >>>>>>>>>>      >>> resubmitted the same report with added discovery_tim=
e and descriptions, and got
> >>>>>>>>>>      >>> NO errors, but I cannot see the changes in the UI (u=
nless they have still to
> >>>>>>>>>>      >>> propagate...)..or maybe I can obtain the same effect=
 by dropping my dataset
> >>>>>>>>>>      >>> before re-submitting ?
> >>>>>>>>>>      >>
> >>>>>>>>>>      >> Right now it's not supported (with various possible q=
uirks if attempted).
> >>>>>>>>>>      >> So, preferably, submit only one, complete and final i=
nstance of each object
> >>>>>>>>>>      >> (with unique ID) for now.
> >>>>>>>>>>      >>
> >>>>>>>>>>      >> We have a plan to support merging missing properties =
across multiple reported
> >>>>>>>>>>      >> objects with the same ID.
> >>>>>>>>>>      >>
> >>>>>>>>>>      >>              Object A        Object B    Dashboard/No=
tifications
> >>>>>>>>>>      >>
> >>>>>>>>>>      >> FieldX:     Foo             Foo         Foo
> >>>>>>>>>>      >> FieldY:                     Bar         Bar
> >>>>>>>>>>      >> FieldZ:     Baz                         Baz
> >>>>>>>>>>      >> FieldU:     Red             Blue        Red/Blue
> >>>>>>>>>>      >>
> >>>>>>>>>>      >> Since we're using a distributed database we cannot re=
ally maintain order
> >>>>>>>>>>      >> (without introducing artificial global lock), so the =
order of the reports
> >>>>>>>>>>      >> doesn't matter. We can only guarantee that a present =
value would override
> >>>>>>>>>>      >> missing value. It would be undefined which value woul=
d be picked among
> >>>>>>>>>>      >> multiple different values.
> >>>>>>>>>>      >>
> >>>>>>>>>>      >> This would allow gradual reporting of each object, bu=
t no editing, sorry.
> >>>>>>>>>>      >>
> >>>>>>>>>>      >> However, once again, this is a plan with some researc=
h done, only.
> >>>>>>>>>>      >> I plan to start implementing it within a few weeks.
> >>>>>>>>>>      >>
> >>>>>>>>>>      >
> >>>>>>>>>>      > So in order to carry on my experiments, I've just trie=
d to push a new dataset
> >>>>>>>>>>      > with a few changes in my data-layout to mimic what I s=
ee other origins do; this
> >>>>>>>>>>      > contained something like 38 builds across 4 different =
revisions (with brand new
> >>>>>>>>>>      > revisions IDs), but I cannot see anything on the UI: I=
 just keep seeing the old
> >>>>>>>>>>      > push from yesterday.
> >>>>>>>>>>      >
> >>>>>>>>>>      > JSON seems valid and kcidb-submit does not report any =
error even using -l DEBUG.
> >>>>>>>>>>      > (I pushed >30mins ago)
> >>>>>>>>>>      >
> >>>>>>>>>>      > Any idea ?
> >>>>>>>>>>      >
> >>>>>>>>>>      > Thanks
> >>>>>>>>>>      >
> >>>>>>>>>>      > Cristian
> >>>>>>>>>>      >
> >>>>>>>>>>      >> Nick
> >>>>>>>>>>      >>
> >>>>>>>>>>      >> On 9/17/20 7:22 PM, Cristian Marussi wrote:
> >>>>>>>>>>      >>> On Thu, Sep 17, 2020 at 04:52:30PM +0300, Nikolai Ko=
ndrashov wrote:
> >>>>>>>>>>      >>>> Hi Christian,
> >>>>>>>>>>      >>>>
> >>>>>>>>>>      >>>> On 9/17/20 3:50 PM, Cristian Marussi wrote:
> >>>>>>>>>>      >>>>> Hi Nikolai,
> >>>>>>>>>>      >>>>>
> >>>>>>>>>>      >>>>> I work at ARM in the Kernel team and, in short, we=
'd like certainly to
> >>>>>>>>>>      >>>>> contribute our internal Kernel test results to KCI=
DB.
> >>>>>>>>>>      >>>>
> >>>>>>>>>>      >>>> Wonderful!
> >>>>>>>>>>      >>>>
> >>>>>>>>>>      >>>>> After having attended your LPC2020 TestMC and Kern=
elCI/BoF, I've now cooked
> >>>>>>>>>>      >>>>> up some KCIDB JSON test report (seemingly valid ag=
ainst your KCIDB v3 schema)
> >>>>>>>>>>      >>>>> and I'd like to start experimenting with kci-submi=
t (on non-production
> >>>>>>>>>>      >>>>> instances), so as to assess how to fit our results=
 into your schema and maybe
> >>>>>>>>>>      >>>>> contribute with some new KCIDB requirements if str=
ictly needed.
> >>>>>>>>>>      >>>>
> >>>>>>>>>>      >>>> Great, this is exactly what we need, welcome aboard=
 :)
> >>>>>>>>>>      >>>>
> >>>>>>>>>>      >>>> Please don't hesitate to reach out on kernelci@grou=
ps.io or on #kernelci on
> >>>>>>>>>>      >>>> freenode.net, if you have any questions, problems, =
or requirements.
> >>>>>>>>>>      >>>>
> >>>>>>>>>>      >>>>> Is it possible to get some valid credentials and a=
 playground instance to
> >>>>>>>>>>      >>>>> point at ?
> >>>>>>>>>>      >>>>
> >>>>>>>>>>      >>>> Absolutely, I created credentials for you and sent =
them in a separate message.
> >>>>>>>>>>      >>>>
> >>>>>>>>>>      >>>> You can use origin "arm" for the start, unless you =
have multiple CI systems
> >>>>>>>>>>      >>>> and want to differentiate them somehow in your repo=
rts.
> >>>>>>>>>>      >>>>
> >>>>>>>>>>      >>>> Nick
> >>>>>>>>>>      >>>>
> >>>>>>>>>>      >>>    Thanks !
> >>>>>>>>>>      >>>
> >>>>>>>>>>      >>> It works too ... :D
> >>>>>>>>>>      >>>
> >>>>>>>>>>      >>> https://staging.kernelci.org:3000/d/build/build?orgI=
d=3D1&var-dataset=3Dplayground_kernelci04&var-id=3Darm:2020-07-07:d3d7689c2=
cc9503266cac3bc777bb4ddae2e5f2e
> >>>>>>>>>>      >>>
> >>>>>>>>>>      >>> ..quick question though....given that now I'll have =
to play quite a bit
> >>>>>>>>>>      >>> with it and see how's better to present our data, if=
 anythinjg missing etc etc,
> >>>>>>>>>>      >>> is there any chance (or way) that if I submmit the s=
ame JSON report multiple
> >>>>>>>>>>      >>> times with slight differences here and there (but wi=
th the same IDs clearly)
> >>>>>>>>>>      >>> I'll get my DB updated in the bits I have changed: a=
s an example I've just
> >>>>>>>>>>      >>> resubmitted the same report with added discovery_tim=
e and descriptions, and got
> >>>>>>>>>>      >>> NO errors, but I cannot see the changes in the UI (u=
nless they have still to
> >>>>>>>>>>      >>> propagate...)..or maybe I can obtain the same effect=
 by dropping my dataset
> >>>>>>>>>>      >>> before re-submitting ?
> >>>>>>>>>>      >>>
> >>>>>>>>>>      >>> Regards
> >>>>>>>>>>      >>>
> >>>>>>>>>>      >>> Thanks
> >>>>>>>>>>      >>>
> >>>>>>>>>>      >>> Cristian
> >>>>>>>>>>      >>>
> >>>>>>>>>>      >>>> On 9/17/20 3:50 PM, Cristian Marussi wrote:
> >>>>>>>>>>      >>>>> Hi Nikolai,
> >>>>>>>>>>      >>>>>
> >>>>>>>>>>      >>>>> I work at ARM in the Kernel team and, in short, we=
'd like certainly to
> >>>>>>>>>>      >>>>> contribute our internal Kernel test results to KCI=
DB.
> >>>>>>>>>>      >>>>>
> >>>>>>>>>>      >>>>> After having attended your LPC2020 TestMC and Kern=
elCI/BoF, I've now cooked
> >>>>>>>>>>      >>>>> up some KCIDB JSON test report (seemingly valid ag=
ainst your KCIDB v3 schema)
> >>>>>>>>>>      >>>>> and I'd like to start experimenting with kci-submi=
t (on non-production
> >>>>>>>>>>      >>>>> instances), so as to assess how to fit our results=
 into your schema and maybe
> >>>>>>>>>>      >>>>> contribute with some new KCIDB requirements if str=
ictly needed.
> >>>>>>>>>>      >>>>>
> >>>>>>>>>>      >>>>> Is it possible to get some valid credentials and a=
 playground instance to
> >>>>>>>>>>      >>>>> point at ?
> >>>>>>>>>>      >>>>>
> >>>>>>>>>>      >>>>> Thanks
> >>>>>>>>>>      >>>>>
> >>>>>>>>>>      >>>>> Regards
> >>>>>>>>>>      >>>>>
> >>>>>>>>>>      >>>>> Cristian
> >>>>>>>>>>      >>>>>
> >>>>>>>>>>      >>>>>
> >>>>>>>>>>      >>>>>
> >>>>>>>>>>      >>>>>
> >>>>>>>>>>      >>>>>
> >>>>>>>>>>      >>>>
> >>>>>>>>>>      >>>
> >>>>>>>>>>      >>
> >>>>>>>>>>      >
> >>>>>>>>>>      >
> >>>>>>>>>>      > >
> >>>>>>>>>>      >
> >>>>>>>>>>
> >>>>>>>>>>
> >>>>>>>>>>
> >>>>>>>>>>
> >>>>>>>>>>
> >>>>>>>>>>
> >>>>>>>>>
> >>>>>>>
> >>>>>>>
> >>>>>>>>
> >>>>>>>
> >>>>>>
> >>>>>>
> >>>>>>
> >>>>>>>>>>
> >>>>>>
> >>>>>
> >>>>
> >>>
> >>
> >>
> >>
> >> >>
> >>
> >
>=20
>=20
>=20
>=20
>=20
>=20
