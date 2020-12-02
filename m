Subject: Re: Contributing ARM tests results to KCIDB
References: <20200917125044.GA29636@e119603-lin.cambridge.arm.com>
 <a46c273f-cc69-6748-d74f-02f5034be999@redhat.com>
 <20200917162242.GA18067@e119603-lin.cambridge.arm.com>
 <e417bc86-da0f-0ab1-62c7-d771a24d41fb@redhat.com>
 <20200918152135.GA13088@e119603-lin.cambridge.arm.com>
 <3e86960e-9780-3e18-3d12-cb4ec3959d63@redhat.com>
 <be42f631-897d-0cdf-0225-5d01256f39e5@redhat.com>
 <20200918164228.GA16509@e119603-lin.cambridge.arm.com>
 <20201105184631.GD24640@e120937-lin>
From: "Nikolai Kondrashov" <Nikolai.Kondrashov@redhat.com>
Message-ID: <4db924ab-2f38-ac63-1b71-51ead907ba1f@redhat.com>
Date: Wed, 2 Dec 2020 10:05:05 +0200
MIME-Version: 1.0
In-Reply-To: <20201105184631.GD24640@e120937-lin>
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
List-ID: <kernelci.groups.io>
To: kernelci@groups.io, cristian.marussi@arm.com
Cc: broonie@kernel.org, basil.eljuse@arm.com

Hi Cristian,

On 11/5/20 8:46 PM, Cristian Marussi wrote:
 > Hi Nick,
 >
 > after past month few experiments on ARM KCIDB submissions against your
 > KCIDB staging instance , I was dragged a bit away from this by other stuff
 > before effectively deploying some real automation on our side to push our
 > daily results to KCIDB...now I'm back at it and I'll keep on testing
 > some automation on our side for a bit against your KCIDB staging instance
 > before asking you to move to production eventually.

I see your data has been steadily trickling into our playground database and
it looks quite good. Would you like to move to the production instance?

I can review your data for you, we can fix the remaining issues if we find
them, and I can give you the permissions to push to production. Then you will
only need to change the topic you push to from "playground_kernelci_new" to
"kernelci_new".

Nick

On 11/5/20 8:46 PM, Cristian Marussi wrote:
 > Hi Nick,
 >
 > after past month few experiments on ARM KCIDB submissions against your
 > KCIDB staging instance , I was dragged a bit away from this by other stuff
 > before effectively deploying some real automation on our side to push our
 > daily results to KCIDB...now I'm back at it and I'll keep on testing
 > some automation on our side for a bit against your KCIDB staging instance
 > before asking you to move to production eventually.
 >
 > But, today I realized, though, that I cannot push anymore data successfully
 > into staging even using the same test script I used one month ago to push
 > some new test data seems to fail now (I tested a few different days and
 > JSON validates fine with jsonschema...with proper dates with hours...)...
 > ...I cannot see any of my today tests' pushes on:
 >
 > https://staging.kernelci.org:3000/d/home/home?orgId=1&from=now-1y&to=now&refresh=30m&var-origin=arm&var-git_repository_url=All&var-dataset=playground_kernelci04
 >
 > Auth seems to proceed fine, but I cannot find any submission dated after
 > the old ~15/18-09-2020 submissions. I'm using the same kci-submit tools
 > version installed past months from your github though.
 >
 > Do you see any errors on your side that can shed a light on this ?
 >
 > Thanks
 >
 > Regards
 >
 > Cristian
 >
 > On Fri, Sep 18, 2020 at 05:42:28PM +0100, Cristian Marussi wrote:
 >> Hi Nick,
 >>
 >> On Fri, Sep 18, 2020 at 06:53:28PM +0300, Nikolai Kondrashov wrote:
 >>> On 9/18/20 6:30 PM, Nikolai Kondrashov wrote:
 >>>> Yes, I think it's one of the problems you uncovered :)
 >>>>
 >>>> The schema allows for fully-compliant RFC3339 timestamps, but the BigQuery
 >>>> database on the backend doesn't understand some of them. In particular it
 >>>> doesn't understand the date-only timestamps you send. E.g. "2020-09-13".
 >>>> That's what I wanted to fix today, but ran out of time.
 >>>
 >>> Looking at this more it seems that Python's jsonschema module simply doesn't
 >>> enforce the requirements we put on those fields 🤦. You can send essentially
 >>> what you want and then hit BigQuery, which is serious about them.
 >>
 >> ...in fact on my side I check too with jsonschema in my script before using kcidb :D
 >>>
 >>> Sorry about that.
 >>>
 >>
 >> No worries.
 >>
 >>> I opened an issue for this: https://github.com/kernelci/kcidb/issues/108
 >>>
 >>> For now please just make sure your timestamp comply with RFC3339.
 >>>
 >>> You can produce such a timestamp e.g. using "date --rfc-3339=s".
 >>
 >> I'll anyway fix my data on my side too, to have the real discovery timestamp.
 >>
 >>>
 >>> Nick
 >>>
 >>
 >> Thanks
 >>
 >> Cristian
 >>
 >>> On 9/18/20 6:30 PM, Nikolai Kondrashov wrote:
 >>>> On 9/18/20 6:21 PM, Cristian Marussi wrote:
 >>>>   > So in order to carry on my experiments, I've just tried to push a new dataset
 >>>>   > with a few changes in my data-layout to mimic what I see other origins do; this
 >>>>   > contained something like 38 builds across 4 different revisions (with brand new
 >>>>   > revisions IDs), but I cannot see anything on the UI: I just keep seeing the old
 >>>>   > push from yesterday.
 >>>>   >
 >>>>   > JSON seems valid and kcidb-submit does not report any error even using -l DEBUG.
 >>>>   > (I pushed >30mins ago)
 >>>>   >
 >>>>   > Any idea ?
 >>>>
 >>>> Yes, I think it's one of the problems you uncovered :)
 >>>>
 >>>> The schema allows for fully-compliant RFC3339 timestamps, but the BigQuery
 >>>> database on the backend doesn't understand some of them. In particular it
 >>>> doesn't understand the date-only timestamps you send. E.g. "2020-09-13".
 >>>> That's what I wanted to fix today, but ran out of time.
 >>>>
 >>>> Additionally, the backend doesn't have a way to report a problem to the
 >>>> submitter at the moment. We intend to fix that, but for now it's possible only
 >>>> through us looking at the logs and sending a message to the submitter :)
 >>>>
 >>>> To work around this you can pad your timestamps with dummy date and time
 >>>> data.
 >>>>
 >>>> E.g. instead of sending:
 >>>>
 >>>>       2020-09-13
 >>>>
 >>>> you can send:
 >>>>
 >>>>       2020-09-13 00:00:00+00:00
 >>>>
 >>>> Hopefully that's the only problem. It could be, since you managed to send data
 >>>> before :)
 >>>>
 >>>> Nick
 >>>>
 >>>> On 9/18/20 6:21 PM, Cristian Marussi wrote:
 >>>>   > Hi Nikolai,
 >>>>   >
 >>>>   > On Thu, Sep 17, 2020 at 08:26:15PM +0300, Nikolai Kondrashov wrote:
 >>>>   >> On 9/17/20 7:22 PM, Cristian Marussi wrote:
 >>>>   >>> It works too ... :D
 >>>>   >>>
 >>>>   >>> https://staging.kernelci.org:3000/d/build/build?orgId=1&var-dataset=playground_kernelci04&var-id=arm:2020-07-07:d3d7689c2cc9503266cac3bc777bb4ddae2e5f2e
 >>>>   >>
 >>>>   >> Whoa, awesome!
 >>>>   >>
 >>>>   >> And you have already uncovered a few issues we need to fix, too!
 >>>>   >> I will deal with them tomorrow.
 >>>>   >>
 >>>>   >>> ..quick question though....given that now I'll have to play quite a bit
 >>>>   >>> with it and see how's better to present our data, if anythinjg missing etc etc,
 >>>>   >>> is there any chance (or way) that if I submmit the same JSON report multiple
 >>>>   >>> times with slight differences here and there (but with the same IDs clearly)
 >>>>   >>> I'll get my DB updated in the bits I have changed: as an example I've just
 >>>>   >>> resubmitted the same report with added discovery_time and descriptions, and got
 >>>>   >>> NO errors, but I cannot see the changes in the UI (unless they have still to
 >>>>   >>> propagate...)..or maybe I can obtain the same effect by dropping my dataset
 >>>>   >>> before re-submitting ?
 >>>>   >>
 >>>>   >> Right now it's not supported (with various possible quirks if attempted).
 >>>>   >> So, preferably, submit only one, complete and final instance of each object
 >>>>   >> (with unique ID) for now.
 >>>>   >>
 >>>>   >> We have a plan to support merging missing properties across multiple reported
 >>>>   >> objects with the same ID.
 >>>>   >>
 >>>>   >>              Object A        Object B    Dashboard/Notifications
 >>>>   >>
 >>>>   >> FieldX:     Foo             Foo         Foo
 >>>>   >> FieldY:                     Bar         Bar
 >>>>   >> FieldZ:     Baz                         Baz
 >>>>   >> FieldU:     Red             Blue        Red/Blue
 >>>>   >>
 >>>>   >> Since we're using a distributed database we cannot really maintain order
 >>>>   >> (without introducing artificial global lock), so the order of the reports
 >>>>   >> doesn't matter. We can only guarantee that a present value would override
 >>>>   >> missing value. It would be undefined which value would be picked among
 >>>>   >> multiple different values.
 >>>>   >>
 >>>>   >> This would allow gradual reporting of each object, but no editing, sorry.
 >>>>   >>
 >>>>   >> However, once again, this is a plan with some research done, only.
 >>>>   >> I plan to start implementing it within a few weeks.
 >>>>   >>
 >>>>   >
 >>>>   > So in order to carry on my experiments, I've just tried to push a new dataset
 >>>>   > with a few changes in my data-layout to mimic what I see other origins do; this
 >>>>   > contained something like 38 builds across 4 different revisions (with brand new
 >>>>   > revisions IDs), but I cannot see anything on the UI: I just keep seeing the old
 >>>>   > push from yesterday.
 >>>>   >
 >>>>   > JSON seems valid and kcidb-submit does not report any error even using -l DEBUG.
 >>>>   > (I pushed >30mins ago)
 >>>>   >
 >>>>   > Any idea ?
 >>>>   >
 >>>>   > Thanks
 >>>>   >
 >>>>   > Cristian
 >>>>   >
 >>>>   >> Nick
 >>>>   >>
 >>>>   >> On 9/17/20 7:22 PM, Cristian Marussi wrote:
 >>>>   >>> On Thu, Sep 17, 2020 at 04:52:30PM +0300, Nikolai Kondrashov wrote:
 >>>>   >>>> Hi Christian,
 >>>>   >>>>
 >>>>   >>>> On 9/17/20 3:50 PM, Cristian Marussi wrote:
 >>>>   >>>>> Hi Nikolai,
 >>>>   >>>>>
 >>>>   >>>>> I work at ARM in the Kernel team and, in short, we'd like certainly to
 >>>>   >>>>> contribute our internal Kernel test results to KCIDB.
 >>>>   >>>>
 >>>>   >>>> Wonderful!
 >>>>   >>>>
 >>>>   >>>>> After having attended your LPC2020 TestMC and KernelCI/BoF, I've now cooked
 >>>>   >>>>> up some KCIDB JSON test report (seemingly valid against your KCIDB v3 schema)
 >>>>   >>>>> and I'd like to start experimenting with kci-submit (on non-production
 >>>>   >>>>> instances), so as to assess how to fit our results into your schema and maybe
 >>>>   >>>>> contribute with some new KCIDB requirements if strictly needed.
 >>>>   >>>>
 >>>>   >>>> Great, this is exactly what we need, welcome aboard :)
 >>>>   >>>>
 >>>>   >>>> Please don't hesitate to reach out on kernelci@groups.io or on #kernelci on
 >>>>   >>>> freenode.net, if you have any questions, problems, or requirements.
 >>>>   >>>>
 >>>>   >>>>> Is it possible to get some valid credentials and a playground instance to
 >>>>   >>>>> point at ?
 >>>>   >>>>
 >>>>   >>>> Absolutely, I created credentials for you and sent them in a separate message.
 >>>>   >>>>
 >>>>   >>>> You can use origin "arm" for the start, unless you have multiple CI systems
 >>>>   >>>> and want to differentiate them somehow in your reports.
 >>>>   >>>>
 >>>>   >>>> Nick
 >>>>   >>>>
 >>>>   >>>    Thanks !
 >>>>   >>>
 >>>>   >>> It works too ... :D
 >>>>   >>>
 >>>>   >>> https://staging.kernelci.org:3000/d/build/build?orgId=1&var-dataset=playground_kernelci04&var-id=arm:2020-07-07:d3d7689c2cc9503266cac3bc777bb4ddae2e5f2e
 >>>>   >>>
 >>>>   >>> ..quick question though....given that now I'll have to play quite a bit
 >>>>   >>> with it and see how's better to present our data, if anythinjg missing etc etc,
 >>>>   >>> is there any chance (or way) that if I submmit the same JSON report multiple
 >>>>   >>> times with slight differences here and there (but with the same IDs clearly)
 >>>>   >>> I'll get my DB updated in the bits I have changed: as an example I've just
 >>>>   >>> resubmitted the same report with added discovery_time and descriptions, and got
 >>>>   >>> NO errors, but I cannot see the changes in the UI (unless they have still to
 >>>>   >>> propagate...)..or maybe I can obtain the same effect by dropping my dataset
 >>>>   >>> before re-submitting ?
 >>>>   >>>
 >>>>   >>> Regards
 >>>>   >>>
 >>>>   >>> Thanks
 >>>>   >>>
 >>>>   >>> Cristian
 >>>>   >>>
 >>>>   >>>> On 9/17/20 3:50 PM, Cristian Marussi wrote:
 >>>>   >>>>> Hi Nikolai,
 >>>>   >>>>>
 >>>>   >>>>> I work at ARM in the Kernel team and, in short, we'd like certainly to
 >>>>   >>>>> contribute our internal Kernel test results to KCIDB.
 >>>>   >>>>>
 >>>>   >>>>> After having attended your LPC2020 TestMC and KernelCI/BoF, I've now cooked
 >>>>   >>>>> up some KCIDB JSON test report (seemingly valid against your KCIDB v3 schema)
 >>>>   >>>>> and I'd like to start experimenting with kci-submit (on non-production
 >>>>   >>>>> instances), so as to assess how to fit our results into your schema and maybe
 >>>>   >>>>> contribute with some new KCIDB requirements if strictly needed.
 >>>>   >>>>>
 >>>>   >>>>> Is it possible to get some valid credentials and a playground instance to
 >>>>   >>>>> point at ?
 >>>>   >>>>>
 >>>>   >>>>> Thanks
 >>>>   >>>>>
 >>>>   >>>>> Regards
 >>>>   >>>>>
 >>>>   >>>>> Cristian
 >>>>   >>>>>
 >>>>   >>>>>
 >>>>   >>>>>
 >>>>   >>>>>
 >>>>   >>>>>
 >>>>   >>>>
 >>>>   >>>
 >>>>   >>
 >>>>   >
 >>>>   >
 >>>>   > >
 >>>>   >
 >>>>
 >>>>
 >>>>
 >>>>
 >>>>
 >>>>
 >>>
 >
 >
 > 
 >
 >

