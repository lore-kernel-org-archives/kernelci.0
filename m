Date: Wed, 2 Dec 2020 09:23:54 +0000
From: "Cristian Marussi" <cristian.marussi@arm.com>
Subject: Re: Contributing ARM tests results to KCIDB
Message-ID: <20201202092340.GB8455@e120937-lin>
References: <20200917125044.GA29636@e119603-lin.cambridge.arm.com>
 <a46c273f-cc69-6748-d74f-02f5034be999@redhat.com>
 <20200917162242.GA18067@e119603-lin.cambridge.arm.com>
 <e417bc86-da0f-0ab1-62c7-d771a24d41fb@redhat.com>
 <20200918152135.GA13088@e119603-lin.cambridge.arm.com>
 <3e86960e-9780-3e18-3d12-cb4ec3959d63@redhat.com>
 <be42f631-897d-0cdf-0225-5d01256f39e5@redhat.com>
 <20200918164228.GA16509@e119603-lin.cambridge.arm.com>
 <20201105184631.GD24640@e120937-lin>
 <4db924ab-2f38-ac63-1b71-51ead907ba1f@redhat.com>
MIME-Version: 1.0
In-Reply-To: <4db924ab-2f38-ac63-1b71-51ead907ba1f@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
List-ID: <kernelci.groups.io>
To: kernelci@groups.io, Nikolai.Kondrashov@redhat.com
Cc: broonie@kernel.org, basil.eljuse@arm.com

Hi Nick

On Wed, Dec 02, 2020 at 10:05:05AM +0200, Nikolai Kondrashov via groups.io=
 wrote:
> Hi Cristian,
>=20
> On 11/5/20 8:46 PM, Cristian Marussi wrote:
> > Hi Nick,
> >
> > after past month few experiments on ARM KCIDB submissions against your
> > KCIDB staging instance , I was dragged a bit away from this by other s=
tuff
> > before effectively deploying some real automation on our side to push =
our
> > daily results to KCIDB...now I'm back at it and I'll keep on testing
> > some automation on our side for a bit against your KCIDB staging insta=
nce
> > before asking you to move to production eventually.
>=20
> I see your data has been steadily trickling into our playground database=
 and
> it looks quite good. Would you like to move to the production instance?
>=20
> I can review your data for you, we can fix the remaining issues if we fi=
nd
> them, and I can give you the permissions to push to production. Then you=
 will
> only need to change the topic you push to from "playground_kernelci_new"=
 to
> "kernelci_new".

In fact I left one staging instance on our side to push data on your
staging instance to verify remaining issues on our side *and there are a
couple of minor ones I spotted that I'd like to fix indeed); moreover I sa=
w
a little while a go that you're going to switch to schema v4 with some min=
or
changes in revisions and commit_hashes so I wanted to conform to that once
it's published (even though you're back compatible with v3 AFAIU)....

... then I've got dragged away again from this past week :D

In fact my next steps (possibly next week) would have been (beside my fixe=
s)
to ask you how to proceed further to production KCIDB.

Would you want me to stop flooding your staging instance in the meantime (=
:D)
till I'm back at it at least , I think I have enugh data now to debug anyw=
ay.
(I could made a few more check next week though)

If it's just a matter of switching project (once got enhanced permissions
from you) please do it, and I'll try to finalize all next week on our
side and move to production.

Thanks for the patience

Cristian


>=20
> Nick
>=20
> On 11/5/20 8:46 PM, Cristian Marussi wrote:
> > Hi Nick,
> >
> > after past month few experiments on ARM KCIDB submissions against your
> > KCIDB staging instance , I was dragged a bit away from this by other s=
tuff
> > before effectively deploying some real automation on our side to push =
our
> > daily results to KCIDB...now I'm back at it and I'll keep on testing
> > some automation on our side for a bit against your KCIDB staging insta=
nce
> > before asking you to move to production eventually.
> >
> > But, today I realized, though, that I cannot push anymore data success=
fully
> > into staging even using the same test script I used one month ago to p=
ush
> > some new test data seems to fail now (I tested a few different days an=
d
> > JSON validates fine with jsonschema...with proper dates with hours...)=
...
> > ...I cannot see any of my today tests' pushes on:
> >
> > https://staging.kernelci.org:3000/d/home/home?orgId=3D1&from=3Dnow-1y&=
to=3Dnow&refresh=3D30m&var-origin=3Darm&var-git_repository_url=3DAll&var-da=
taset=3Dplayground_kernelci04
> >
> > Auth seems to proceed fine, but I cannot find any submission dated aft=
er
> > the old ~15/18-09-2020 submissions. I'm using the same kci-submit tool=
s
> > version installed past months from your github though.
> >
> > Do you see any errors on your side that can shed a light on this ?
> >
> > Thanks
> >
> > Regards
> >
> > Cristian
> >
> > On Fri, Sep 18, 2020 at 05:42:28PM +0100, Cristian Marussi wrote:
> >> Hi Nick,
> >>
> >> On Fri, Sep 18, 2020 at 06:53:28PM +0300, Nikolai Kondrashov wrote:
> >>> On 9/18/20 6:30 PM, Nikolai Kondrashov wrote:
> >>>> Yes, I think it's one of the problems you uncovered :)
> >>>>
> >>>> The schema allows for fully-compliant RFC3339 timestamps, but the B=
igQuery
> >>>> database on the backend doesn't understand some of them. In particu=
lar it
> >>>> doesn't understand the date-only timestamps you send. E.g. "2020-09=
-13".
> >>>> That's what I wanted to fix today, but ran out of time.
> >>>
> >>> Looking at this more it seems that Python's jsonschema module simply=
 doesn't
> >>> enforce the requirements we put on those fields =F0=9F=A4=A6. You ca=
n send essentially
> >>> what you want and then hit BigQuery, which is serious about them.
> >>
> >> ...in fact on my side I check too with jsonschema in my script before=
 using kcidb :D
> >>>
> >>> Sorry about that.
> >>>
> >>
> >> No worries.
> >>
> >>> I opened an issue for this: https://github.com/kernelci/kcidb/issues=
/108
> >>>
> >>> For now please just make sure your timestamp comply with RFC3339.
> >>>
> >>> You can produce such a timestamp e.g. using "date --rfc-3339=3Ds".
> >>
> >> I'll anyway fix my data on my side too, to have the real discovery ti=
mestamp.
> >>
> >>>
> >>> Nick
> >>>
> >>
> >> Thanks
> >>
> >> Cristian
> >>
> >>> On 9/18/20 6:30 PM, Nikolai Kondrashov wrote:
> >>>> On 9/18/20 6:21 PM, Cristian Marussi wrote:
> >>>>   > So in order to carry on my experiments, I've just tried to push=
 a new dataset
> >>>>   > with a few changes in my data-layout to mimic what I see other =
origins do; this
> >>>>   > contained something like 38 builds across 4 different revisions=
 (with brand new
> >>>>   > revisions IDs), but I cannot see anything on the UI: I just kee=
p seeing the old
> >>>>   > push from yesterday.
> >>>>   >
> >>>>   > JSON seems valid and kcidb-submit does not report any error eve=
n using -l DEBUG.
> >>>>   > (I pushed >30mins ago)
> >>>>   >
> >>>>   > Any idea ?
> >>>>
> >>>> Yes, I think it's one of the problems you uncovered :)
> >>>>
> >>>> The schema allows for fully-compliant RFC3339 timestamps, but the B=
igQuery
> >>>> database on the backend doesn't understand some of them. In particu=
lar it
> >>>> doesn't understand the date-only timestamps you send. E.g. "2020-09=
-13".
> >>>> That's what I wanted to fix today, but ran out of time.
> >>>>
> >>>> Additionally, the backend doesn't have a way to report a problem to=
 the
> >>>> submitter at the moment. We intend to fix that, but for now it's po=
ssible only
> >>>> through us looking at the logs and sending a message to the submitt=
er :)
> >>>>
> >>>> To work around this you can pad your timestamps with dummy date and=
 time
> >>>> data.
> >>>>
> >>>> E.g. instead of sending:
> >>>>
> >>>>       2020-09-13
> >>>>
> >>>> you can send:
> >>>>
> >>>>       2020-09-13 00:00:00+00:00
> >>>>
> >>>> Hopefully that's the only problem. It could be, since you managed t=
o send data
> >>>> before :)
> >>>>
> >>>> Nick
> >>>>
> >>>> On 9/18/20 6:21 PM, Cristian Marussi wrote:
> >>>>   > Hi Nikolai,
> >>>>   >
> >>>>   > On Thu, Sep 17, 2020 at 08:26:15PM +0300, Nikolai Kondrashov wr=
ote:
> >>>>   >> On 9/17/20 7:22 PM, Cristian Marussi wrote:
> >>>>   >>> It works too ... :D
> >>>>   >>>
> >>>>   >>> https://staging.kernelci.org:3000/d/build/build?orgId=3D1&var=
-dataset=3Dplayground_kernelci04&var-id=3Darm:2020-07-07:d3d7689c2cc9503266=
cac3bc777bb4ddae2e5f2e
> >>>>   >>
> >>>>   >> Whoa, awesome!
> >>>>   >>
> >>>>   >> And you have already uncovered a few issues we need to fix, to=
o!
> >>>>   >> I will deal with them tomorrow.
> >>>>   >>
> >>>>   >>> ..quick question though....given that now I'll have to play q=
uite a bit
> >>>>   >>> with it and see how's better to present our data, if anythinj=
g missing etc etc,
> >>>>   >>> is there any chance (or way) that if I submmit the same JSON =
report multiple
> >>>>   >>> times with slight differences here and there (but with the sa=
me IDs clearly)
> >>>>   >>> I'll get my DB updated in the bits I have changed: as an exam=
ple I've just
> >>>>   >>> resubmitted the same report with added discovery_time and des=
criptions, and got
> >>>>   >>> NO errors, but I cannot see the changes in the UI (unless the=
y have still to
> >>>>   >>> propagate...)..or maybe I can obtain the same effect by dropp=
ing my dataset
> >>>>   >>> before re-submitting ?
> >>>>   >>
> >>>>   >> Right now it's not supported (with various possible quirks if =
attempted).
> >>>>   >> So, preferably, submit only one, complete and final instance o=
f each object
> >>>>   >> (with unique ID) for now.
> >>>>   >>
> >>>>   >> We have a plan to support merging missing properties across mu=
ltiple reported
> >>>>   >> objects with the same ID.
> >>>>   >>
> >>>>   >>              Object A        Object B    Dashboard/Notificatio=
ns
> >>>>   >>
> >>>>   >> FieldX:     Foo             Foo         Foo
> >>>>   >> FieldY:                     Bar         Bar
> >>>>   >> FieldZ:     Baz                         Baz
> >>>>   >> FieldU:     Red             Blue        Red/Blue
> >>>>   >>
> >>>>   >> Since we're using a distributed database we cannot really main=
tain order
> >>>>   >> (without introducing artificial global lock), so the order of =
the reports
> >>>>   >> doesn't matter. We can only guarantee that a present value wou=
ld override
> >>>>   >> missing value. It would be undefined which value would be pick=
ed among
> >>>>   >> multiple different values.
> >>>>   >>
> >>>>   >> This would allow gradual reporting of each object, but no edit=
ing, sorry.
> >>>>   >>
> >>>>   >> However, once again, this is a plan with some research done, o=
nly.
> >>>>   >> I plan to start implementing it within a few weeks.
> >>>>   >>
> >>>>   >
> >>>>   > So in order to carry on my experiments, I've just tried to push=
 a new dataset
> >>>>   > with a few changes in my data-layout to mimic what I see other =
origins do; this
> >>>>   > contained something like 38 builds across 4 different revisions=
 (with brand new
> >>>>   > revisions IDs), but I cannot see anything on the UI: I just kee=
p seeing the old
> >>>>   > push from yesterday.
> >>>>   >
> >>>>   > JSON seems valid and kcidb-submit does not report any error eve=
n using -l DEBUG.
> >>>>   > (I pushed >30mins ago)
> >>>>   >
> >>>>   > Any idea ?
> >>>>   >
> >>>>   > Thanks
> >>>>   >
> >>>>   > Cristian
> >>>>   >
> >>>>   >> Nick
> >>>>   >>
> >>>>   >> On 9/17/20 7:22 PM, Cristian Marussi wrote:
> >>>>   >>> On Thu, Sep 17, 2020 at 04:52:30PM +0300, Nikolai Kondrashov =
wrote:
> >>>>   >>>> Hi Christian,
> >>>>   >>>>
> >>>>   >>>> On 9/17/20 3:50 PM, Cristian Marussi wrote:
> >>>>   >>>>> Hi Nikolai,
> >>>>   >>>>>
> >>>>   >>>>> I work at ARM in the Kernel team and, in short, we'd like c=
ertainly to
> >>>>   >>>>> contribute our internal Kernel test results to KCIDB.
> >>>>   >>>>
> >>>>   >>>> Wonderful!
> >>>>   >>>>
> >>>>   >>>>> After having attended your LPC2020 TestMC and KernelCI/BoF,=
 I've now cooked
> >>>>   >>>>> up some KCIDB JSON test report (seemingly valid against you=
r KCIDB v3 schema)
> >>>>   >>>>> and I'd like to start experimenting with kci-submit (on non=
-production
> >>>>   >>>>> instances), so as to assess how to fit our results into you=
r schema and maybe
> >>>>   >>>>> contribute with some new KCIDB requirements if strictly nee=
ded.
> >>>>   >>>>
> >>>>   >>>> Great, this is exactly what we need, welcome aboard :)
> >>>>   >>>>
> >>>>   >>>> Please don't hesitate to reach out on kernelci@groups.io or =
on #kernelci on
> >>>>   >>>> freenode.net, if you have any questions, problems, or requir=
ements.
> >>>>   >>>>
> >>>>   >>>>> Is it possible to get some valid credentials and a playgrou=
nd instance to
> >>>>   >>>>> point at ?
> >>>>   >>>>
> >>>>   >>>> Absolutely, I created credentials for you and sent them in a=
 separate message.
> >>>>   >>>>
> >>>>   >>>> You can use origin "arm" for the start, unless you have mult=
iple CI systems
> >>>>   >>>> and want to differentiate them somehow in your reports.
> >>>>   >>>>
> >>>>   >>>> Nick
> >>>>   >>>>
> >>>>   >>>    Thanks !
> >>>>   >>>
> >>>>   >>> It works too ... :D
> >>>>   >>>
> >>>>   >>> https://staging.kernelci.org:3000/d/build/build?orgId=3D1&var=
-dataset=3Dplayground_kernelci04&var-id=3Darm:2020-07-07:d3d7689c2cc9503266=
cac3bc777bb4ddae2e5f2e
> >>>>   >>>
> >>>>   >>> ..quick question though....given that now I'll have to play q=
uite a bit
> >>>>   >>> with it and see how's better to present our data, if anythinj=
g missing etc etc,
> >>>>   >>> is there any chance (or way) that if I submmit the same JSON =
report multiple
> >>>>   >>> times with slight differences here and there (but with the sa=
me IDs clearly)
> >>>>   >>> I'll get my DB updated in the bits I have changed: as an exam=
ple I've just
> >>>>   >>> resubmitted the same report with added discovery_time and des=
criptions, and got
> >>>>   >>> NO errors, but I cannot see the changes in the UI (unless the=
y have still to
> >>>>   >>> propagate...)..or maybe I can obtain the same effect by dropp=
ing my dataset
> >>>>   >>> before re-submitting ?
> >>>>   >>>
> >>>>   >>> Regards
> >>>>   >>>
> >>>>   >>> Thanks
> >>>>   >>>
> >>>>   >>> Cristian
> >>>>   >>>
> >>>>   >>>> On 9/17/20 3:50 PM, Cristian Marussi wrote:
> >>>>   >>>>> Hi Nikolai,
> >>>>   >>>>>
> >>>>   >>>>> I work at ARM in the Kernel team and, in short, we'd like c=
ertainly to
> >>>>   >>>>> contribute our internal Kernel test results to KCIDB.
> >>>>   >>>>>
> >>>>   >>>>> After having attended your LPC2020 TestMC and KernelCI/BoF,=
 I've now cooked
> >>>>   >>>>> up some KCIDB JSON test report (seemingly valid against you=
r KCIDB v3 schema)
> >>>>   >>>>> and I'd like to start experimenting with kci-submit (on non=
-production
> >>>>   >>>>> instances), so as to assess how to fit our results into you=
r schema and maybe
> >>>>   >>>>> contribute with some new KCIDB requirements if strictly nee=
ded.
> >>>>   >>>>>
> >>>>   >>>>> Is it possible to get some valid credentials and a playgrou=
nd instance to
> >>>>   >>>>> point at ?
> >>>>   >>>>>
> >>>>   >>>>> Thanks
> >>>>   >>>>>
> >>>>   >>>>> Regards
> >>>>   >>>>>
> >>>>   >>>>> Cristian
> >>>>   >>>>>
> >>>>   >>>>>
> >>>>   >>>>>
> >>>>   >>>>>
> >>>>   >>>>>
> >>>>   >>>>
> >>>>   >>>
> >>>>   >>
> >>>>   >
> >>>>   >
> >>>>   > >
> >>>>   >
> >>>>
> >>>>
> >>>>
> >>>>
> >>>>
> >>>>
> >>>
> >
> >
> > >
> >
>=20
>=20
>=20
>=20
>=20
>=20
