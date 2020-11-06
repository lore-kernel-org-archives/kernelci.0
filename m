Subject: Re: Common database and kcidb: what next?
References: <9e1beacd-c406-c234-479a-c2946698330c@collabora.com>
 <fd4315a7-f614-893d-6c76-0a2cd1b5f2bf@gmail.com>
 <17452b4d-5724-6e51-d7a4-8b30d4fa322b@collabora.com>
From: "Nikolai Kondrashov" <Nikolai.Kondrashov@redhat.com>
Message-ID: <7075ab2d-b42c-e8a6-0c8a-37da71c9cc15@redhat.com>
Date: Fri, 6 Nov 2020 14:01:49 +0200
MIME-Version: 1.0
In-Reply-To: <17452b4d-5724-6e51-d7a4-8b30d4fa322b@collabora.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
List-ID: <kernelci.groups.io>
To: kernelci@groups.io, guillaume.tucker@collabora.com, Nikolai Kondrashov <spbnick@gmail.com>
Cc: kernelci-members@groups.io, Sasha Levin <sashal@kernel.org>

On 10/23/20 5:44 PM, Guillaume Tucker wrote:
 > On 10/03/2020 09:42, Nikolai Kondrashov wrote:
 >> Hi Guillaume, everyone,
 >>
 >> I'll be doing a good deal of disagreeing here, so brace yourselves :)
 >>
 >>> As things are starting to crystallise, it is now time to start
 >>> considering how to go about making this new database part of
 >>> KernelCI in a community-driven fashion.
 >
 > Over the past six months, things have progressed a lot.  There is
 > a BoF session at ELCE-E next week[1] about KernelCI's lessons
 > learned, and looking back at the progress on common reporting is
 > going to be one of the main topics.
 >
 >> We don't want things to crystallise, we're just starting. Our goals with KCIDB
 >> is to get as many CI systems on board, find out how we can put all the testing
 >> results together, and how we can get them to developers.
 >
 > The KCIDB schema has been evolving in order to meet requirements
 > from new data submitters, in particular syzbot.  Things are still
 > moving in this area, but in essence the core part of the schema
 > has passed the initial test of being usable by new submitters.
 >
 > As far as I can tell, the design has been crystallising quite a
 > bit: CKI have adopted the KCIDB schema natively and the KCIDB
 > dataset keeps being migrated when new versions are released.  So
 > we're effectively contributing data to a production-like dataset,
 > rather than a disposable one which was the original intent for
 > the PoC.

This is mostly true. Basic parts of the schema seem to hold well so far in the
face of new submitters pushing or trying to push their data. CKI is
transitioning to KCIDB format internally, and so far we managed to migrate the
data without (much) loss across a few releases. It definitely feels like
production at least in some areas :)

Still, we need considerable changes to accommodate wider data from syzbot
("issues" and "incidents"), smaller but still considerable changes for 0day
("checks"), and more for email notifications in general. CKI is not fully on
KCIDB data yet either, some internal parts definitely need work still.

Finally, we haven't reached a single actual developer yet, and that's what I
think goes against qualifying KCIDB as being really in production: KCIDB is
not having any effect on development yet, i.e. we're not *really* *producing*
anything. This is what I'm focusing on for this release: getting engagement
from developers through e-mail notifications.

 > The kernelci.org data is not being submitted to KCIDB yet though,
 > due to performance issues such as the overhead of opening
 > connections with BigQuery.  This should soon be resolved with
 > improvements related to streaming the data submissions.

Yes, we hopefully have the necessary support in KCIDB now, and will get the
data flowing soon!

 > [...]
 >
 >> For that matter, we need to avoid integrating into any existing systems, or
 >> coming up with grand designs, as that will slow us down. Design without
 >> real-world involvement is worth little, and could actually cost us in wasted
 >> effort. We need to show results quickly, show we're a worthy cause to join,
 >> and be responsive, in order to invite and retain cooperation.
 >
 > I believe we have reached a first goal here: more and more people
 > now believe there is value in contributing test results.  We have
 > also engaged with the real world via the community survey[2], by
 > getting in touch directly with other test systems such as syzbot
 > and 0-Day, and generally speaking by putting the KernelCI project
 > in the hands of the kernel community with fruitful discussions at
 > Linux Plumbers Conference 2020[3].

Yes, this is super-exciting :D!

 > [...]
 >
 >> After this, we can fold this into Kernel CI proper, or whatever system we
 >> want, do more design, integration, optimization, etc. We will have the time to
 >> think the details through, because we would have achieved the main goal:
 >> getting everyone to play together.
 >
 > All the discussions around this topic made us realise that there
 > will always be a need for "native" KernelCI tests, orchestrated
 > directly on kernelci.org and focused on upstream.  Then there is
 > the need to collect data from a wide variety of other "external"
 > test systems: distributions such as Fedora with CKI or Gentoo
 > with GKernelCI, OEMs such as SONY with Fuego, specialised ones
 > such as syzbot which does exclusively fuzzing...

Absolutely! I think there should be a continuum of ways to contribute to
kernel testing. Apart from getting independent CI systems involved with KCIDB,
in addition to the existing native testing, I believe there are still some
unexplored avenues which could drive it further. Maybe simplifying
contributing a single or just a few boards to testing (without the hassle of
setting up LAVA), contributing general-purpose (non-embedded) machines?

 > Being able to articulate how this all fits together clears the
 > path for making progress on every front.  We can keep increasing
 > the native coverage of Clang builds, add new LAVA labs with more
 > functional testing and expand our Kubernetes capabilities for
 > hardware-independent testing such as KUnit or static analysis,
 > and monitor arbitrary branches created by upstream kernel
 > maintainers.  Meanwhile, we can also keep evolving the common
 > reporting design with new submitters, a moving schema and growing
 > infrastructure.  All that can now co-exist happily.

Awesome :)

 > The next steps are going to be about how to cope with the
 > increasing size of our "big kernel data" and to make best use of
 > it: visualisation, notifications of kernel issues...  The project
 > now has good enough foundations to start looking into this, which
 > is likely to be a highlight for 2021.

Yes, fun and exciting times are ahead :)

 > Best wishes,
 > Guillaume
 >
 >> On 3/6/20 7:43 PM, Guillaume Tucker wrote:
 >>> You may not have noticed yet but there is an ongoing effort to
 >>> have a common database where test results for the upstream
 >>> Linux kernel can all converge.  The initial steps towards this
 >>> goal have taken the form of a proof-of-concept project called
 >>> kcidb[1].  Nikolai has been making fast progress on this over
 >>> the past few months and I would like to thank him on behalf of
 >>> the KernelCI TSC for all his efforts so far.
 >>>
 >>> As things are starting to crystallise, it is now time to start
 >>> considering how to go about making this new database part of
 >>> KernelCI in a community-driven fashion.  There are several ways
 >>> to do so, and making key design decisions now is essential in
 >>> order to be able to plan things in the medium and longer term.
 >>>
 >>> I propose to take a look at what kernelci.org currently has to
 >>> offer, the lessons we have learnt so far from the kcidb project
 >>> and the mission statement[2] as defined by the advisory board
 >>> of members.  This should provide us with the basis we need to
 >>> plan our way forward in alignment with the kernel community.
 >>>
 >>> Your feedback is needed at every step, so please do not
 >>> hesitate to reply and discuss any aspect of it.
 >>>
 >>>
 >>> What does kernelci.org currently have to offer?
 >>> -----------------------------------------------
 >>>
 >>> The well known parts are:
 >>>
 >>> * a distributed architecture with labs running around the world
 >>>
 >>> * a very diverse pool of hardware across many CPU architectures
 >>>
 >>> * many upstream-oriented kernel branches being built and tested
 >>>
 >>> * no single organisation in charge to provide a neutral ground
 >>>      oriented towards the upstream Linux kernel
 >>>
 >>> * automated tracking of test regressions and bisections
 >>>
 >>> * email reports and custom-tailored web dashboard
 >>>
 >>> * public-facing web API to submit and query test results
 >>>
 >>> * a well established ecosystem of labs, contributors and users
 >>>
 >>> * portable tools[3] that can be reused in any test environment
 >>>
 >>>
 >>> Things currently being worked on include:
 >>>
 >>> * a growing test coverage to end the era of doing purely boot
 >>>      testing (KUnit, kselftest, LTP...)
 >>>
 >>> * improved web dashboard to show detailed test results rather
 >>>      than plain boots
 >>>
 >>> * more effective email reports as a result
 >>>
 >>>
 >>> * What lessons have we learnt from kcidb so far?
 >>> ------------------------------------------------
 >>>
 >>> Defining a schema for a common database is a patchwork of
 >>> compromises.  Each system doing upstream Linux kernel testing
 >>> has a slightly different approach, and a balance needs to be
 >>> struck between simplifying the data and causing extra
 >>> translations for the submitters.  We seem to have started to
 >>> converge on something that works for the existing kernelci.org
 >>> results and Red Hat's CKI.  We need to remain flexible enough
 >>> to refine things and be able to include other sources of data
 >>> as the project grows.
 >>>
 >>> Still, we are essentially now very close to be able to start
 >>> storing production data in the common database.  This is why we
 >>> are also at a turning point where we have to start thinking
 >>> beyond the proof-of-concept, to agree on how we want to design
 >>> things going forward.  If we neglect this step, we may well end
 >>> up with a new system completely unrelated to kernelci.org
 >>> except by name.  While it may be a great new design if done on
 >>> purpose, if this happened by accident it would most likely be a
 >>> failure.
 >>>
 >>> For example, kcidb is currently based on Google BigQuery, which
 >>> is fine for a proof-of-concept but we know that being tied to a
 >>> cloud provider has major drawbacks.  In particular, we lose the
 >>> ability to run an autonomous KernelCI instance.  It is this
 >>> kind of design decisions that we need to make now so we can
 >>> move on to the next stage with enough confidence.
 >>>
 >>>
 >>> * What are the options going forward?
 >>> -------------------------------------
 >>>
 >>> The main thing we need now is engagement in the decision
 >>> process from the KernelCI community.  For this, we need to
 >>> collect feedback and ideas.  There are many experienced people
 >>> who care about KernelCI, this is the chance to make a system
 >>> designed by the community and for the community.
 >>>
 >>> To get started, here are a few key topics that I would like to
 >>> shed some light upon:
 >>>
 >>> 1. Converting the kernelci-backend web API as an abstraction
 >>>       layer for submitting results
 >>>
 >>>       Anyone can set up a kernelci-backend instance, but it is
 >>>       currently tied to Mongo DB.  It wouldn't be difficult to
 >>>       make it also work with other database engines since it has
 >>>       abstract data models and already uses hooks to submit to
 >>>       BigQuery.
 >>>
 >>> 2. Keeping core functions in kernelci-core
 >>>
 >>>       While kcidb has explored a few things around submitting data
 >>>       and triggering email reports, the kernelci-core project is
 >>>       about providing portable tools to run each KernelCI step.
 >>>       As such, it would seem like the canonical place to provide
 >>>       any new tools of this kind.
 >>>
 >>> 3. Comparative study of web dashboard solutions
 >>>
 >>>       The current kernelci.org web dashboard was designed
 >>>       especially for showing kernel test results.  It wasn't well
 >>>       maintained for several years but we are now improving it to
 >>>       show test results.  As such, it is still a very good
 >>>       candidate.  However, there are many other possible
 >>>       solutions, and we may create a combination of several tools
 >>>       to address different needs.  Previous attempts at using
 >>>       SQUAD and ElasticStack did not give satisfactory results or
 >>>       were aborted.  The attention has now moved towards Grafana,
 >>>       we don't know yet what the outcome will be.  It seems
 >>>       worthwhile listing all these tools as well as other web
 >>>       frameworks and libraries to compare them, and define what
 >>>       the requirements are in terms of users (developers,
 >>>       maintainers, OEMs...).  Based on that we would be able to
 >>>       spend our energy with reduced risks of missing the goals.
 >>>
 >>>
 >>> Sorry for the very long email...  It seemed like the best way
 >>> to get everyone on the same page.  Please take the time you
 >>> need to digest it, we are not (yet) in a state of emergency.
 >>> As KernelCI is going through a transformative phase it is
 >>> important for all of us to see the bigger picture and make
 >>> conscious decisions as much as possible.  Thank you!
 >>>
 >>> Best wishes,
 >>> Guillaume
 >>>
 >>>
 >>> [1] https://github.com/kernelci/kcidb
 >>>
 >>> [2] "To ensure the quality, stability and long-term maintenance
 >>>         of the Linux kernel by maintaining an open ecosystem
 >>>         around test automation practices and principles."
 >>>
 >>> [3] https://github.com/kernelci/kernelci-core
 >>>
 >>
 >
 > [1] KernelCI BoF at ELC-E next week:
 >      https://osseu2020.sched.com/event/eCC4/bof-kernelci-lessons-learned-guillaume-tucker-collabora
 >
 > [2] KernelCI Community Survey report:
 >      https://foundation.kernelci.org/blog/2020/07/09/kernelci-community-survey-report/
 >
 > [3] LPC 2020 KernelCI notes
 >      https://foundation.kernelci.org/blog/2020/09/23/kernelci-notes-from-plumbers-2020/
 >
 >
 > 
 >
 >

