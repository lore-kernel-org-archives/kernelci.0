Date: Tue, 28 May 2019 10:45:04 -0400 (EDT)
From: Veronika Kabatova <vkabatov@redhat.com>
Message-ID: <1580408239.22351724.1559054704550.JavaMail.zimbra@redhat.com>
In-Reply-To: <CAH1_8nAazaXOuuPjoh9qg9Yt+Q7wpPN8uZWa-ehqvGMnKp3W8w@mail.gmail.com>
References: <299272045.11819252.1554465036421.JavaMail.zimbra@redhat.com> <457016061.11846096.1554475313006.JavaMail.zimbra@redhat.com> <ECADFF3FD767C149AD96A924E7EA6EAF977191AE@USCULXMSG01.am.sony.com> <20190515203334.lbhpqpdyulqztr5c@xps.therub.org> <A0783550-C80A-4037-9B18-256AEA3CDAA7@linaro.org> <1070842434.21130927.1558366329557.JavaMail.zimbra@redhat.com> <CAH1_8nAazaXOuuPjoh9qg9Yt+Q7wpPN8uZWa-ehqvGMnKp3W8w@mail.gmail.com>
Subject: Re: A common place for CI results?
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
List-ID: <kernelci.groups.io>
To: Guillaume Tucker <guillaume.tucker@gmail.com>
Cc: kernelci@groups.io, Tom Gall <tom.gall@linaro.org>, Dan Rue <dan.rue@linaro.org>, Tim Bird <Tim.Bird@sony.com>, automated-testing@yoctoproject.org, info@kernelci.org

----- Original Message -----=20

> From: "Guillaume Tucker" <guillaume.tucker@gmail.com>
> To: kernelci@groups.io, vkabatov@redhat.com
> Cc: "Tom Gall" <tom.gall@linaro.org>, "Dan Rue" <dan.rue@linaro.org>, "Ti=
m
> Bird" <Tim.Bird@sony.com>, automated-testing@yoctoproject.org,
> info@kernelci.org
> Sent: Tuesday, May 28, 2019 10:24:44 AM
> Subject: Re: A common place for CI results?

> Hello,

> On Mon, May 20, 2019 at 4:38 PM Veronika Kabatova < vkabatov@redhat.com >
> wrote:

> > ----- Original Message -----
>=20
> > > From: "Tom Gall" < tom.gall@linaro.org >
>=20
> > > To: kernelci@groups.io , "Dan Rue" < dan.rue@linaro.org >
>=20
> > > Cc: "Tim Bird" < Tim.Bird@sony.com >, vkabatov@redhat.com ,
> > > automated-testing@yoctoproject.org , info@kernelci.org
>=20
> > > Sent: Wednesday, May 15, 2019 11:06:33 PM
>=20
> > > Subject: Re: A common place for CI results?
>=20
> > >
>=20
> > >
>=20
> > >
>=20
> > > > On May 15, 2019, at 3:33 PM, Dan Rue < dan.rue@linaro.org > wrote:
>=20
> > > >
>=20
> > > > On Tue, May 14, 2019 at 11:01:35PM +0000, Tim.Bird@sony.com wrote:
>=20
> > > >>
>=20
> > > >>
>=20
> > > >>> -----Original Message-----
>=20
> > > >>> From: Veronika Kabatova
>=20
> > > >>>
>=20
> > > >>> Hi,
>=20
> > > >>>
>=20
> > > >>> as we know from this list, there's plenty CI systems doing some
> > > >>> testing
>=20
> > > >>> on
>=20
> > > >>> the
>=20
> > > >>> upstream kernels (and maybe some others we don't know about).
>=20
> > > >>>
>=20
> > > >>> It would be great if there was a single common place where all th=
e CI
>=20
> > > >>> systems
>=20
> > > >>> can put their results. This would make it much easier for the ker=
nel
>=20
> > > >>> maintainers and developers to see testing status since they only =
need
> > > >>> to
>=20
> > > >>> check one place instead of having a list of sites/mailing lists w=
here
>=20
> > > >>> each CI
>=20
> > > >>> posts their contributions.
>=20
> > > >>>
>=20
> > > >>>
>=20
> > > >>> A few weeks ago, with some people we've been talking about
> > > >>> kernelci.org
>=20
> > > >>> being
>=20
> > > >>> in a good place to act as the central upstream kernel CI piece th=
at
> > > >>> most
>=20
> > > >>> maintainers already know about. So I'm wondering if it would be
> > > >>> possible
>=20
> > > >>> for
>=20
> > > >>> kernelci to also act as an aggregator of all results? There's alr=
eady
> > > >>> an
>=20
> > > >>> API
>=20
> > > >>> for publishing a report [0] so it shouldn't be too hard to adjust=
 it
> > > >>> to
>=20
> > > >>> handle and show more information. I also found the beta version f=
or
> > > >>> test
>=20
> > > >>> results [1] so actually, most of the needed functionality seems t=
o be
>=20
> > > >>> already
>=20
> > > >>> there. Since there will be multiple CI systems, the source and
> > > >>> contact
>=20
> > > >>> point
>=20
> > > >>> for the contributor (so maintainers know whom to ask about result=
s if
>=20
> > > >>> needed)
>=20
> > > >>> would likely be the only missing essential data point.
>=20
> > > >>>
>=20
> > > >>>
>=20
> > > >>> The common place for results would also make it easier for new CI
> > > >>> systems
>=20
> > > >>> to
>=20
> > > >>> get involved with upstream. There are likely other companies out
> > > >>> there
>=20
> > > >>> running
>=20
> > > >>> some tests on kernel internally but don't publish the results
> > > >>> anywhere.
>=20
> > > >>> Only
>=20
> > > >>> adding some API calls into their code (with the data they are all=
owed
> > > >>> to
>=20
> > > >>> publish) would make it very simple for them to start contributing=
. If
> > > >>> we
>=20
> > > >>> want
>=20
> > > >>> to make them interested, the starting point needs to be trivial.
>=20
> > > >>> Different
>=20
> > > >>> companies have different setups and policies and they might not b=
e
> > > >>> able
>=20
> > > >>> to
>=20
> > > >>> fulfill arbitrary requirements so they opt to not get involved at
> > > >>> all,
>=20
> > > >>> which
>=20
> > > >>> is a shame because their results can be useful. After the initial
>=20
> > > >>> "onboarding"
>=20
> > > >>> step they might be willing to contribute more and more too.
>=20
> > > >>>
>=20
> > > >>>
>=20
> > > >>> Please let me know if the idea makes sense or if something simila=
r is
>=20
> > > >>> already
>=20
> > > >>> in plans. I'd be happy to contribute to the effort because I beli=
eve
> > > >>> it
>=20
> > > >>> would
>=20
> > > >>> make everyone's life easier and we'd all benefit from it (and may=
be
>=20
> > > >>> someone
>=20
> > > >>> else from my team would be willing to help out too if needed).
>=20
> > > >>
>=20
> > > >> I never responded to this,
>=20
> > > >
>=20
> > > > yea, you did. ;)
>=20
> > > >
>=20
> > > >> but this sounds like a really good idea to me. I don't care much w=
hich
>=20
> > > >> backend we aggregate to, but it would be good as a community to st=
art
>=20
> > > >> using one service to start with. It would help to find issues with
>=20
> > > >> the API, or the results schema, if multiple people started using i=
t.
>=20
> > > >>
>=20
> > > >> I know that people using Fuego are sending data to their own insta=
nces
>=20
> > > >> of KernelCI. But I don't know what the issues are for sending this
>=20
> > > >> data to a shared KernelCI service.
>=20
> > > >>
>=20
> > > >> I would be interested in hooking up my lab to send Fuego results t=
o
>=20
> > > >> KernelCI. This would be a good exercise. I'm not sure what the nex=
t
>=20
> > > >> steps would be, but maybe we could discuss this on the next automa=
ted
>=20
> > > >> testing conference call.
>=20
> > > >
>=20
> > > > OK here's my idea.
>=20
> > > >
>=20
> > > > I don't personally think kernelci (or LKFT) are set up to aggregate
>=20
> > > > results currently. We have too many assumptions about where tests a=
re
>=20
> > > > coming from, how things are built, etc. In other words, dealing wit=
h
>=20
> > > > noisy data is going to be non-trivial in any existing project.
>=20
> > >
>=20
> > > I completely agree.
>=20
> > >
>=20

> > This is a good point. I'm totally fine with having a separate independe=
nt
>=20
> > place for aggregation.
>=20

> > > > I would propose aggregating data into something like google's BigQu=
ery.
>=20
> > > > This has a few benefits:
>=20
> > > > - Non-opinionated place to hold structured data
>=20
> > > > - Allows many downstream use-cases
>=20
> > > > - Managed hosting, and data is publicly available
>=20
> > > > - Storage is sponsored by google as a part of
>=20
> > > > https://cloud.google.com/bigquery/public-data/
>=20
> > > > - First 1TB of query per 'project' is free, and users pay for more
>=20
> > > > queries than that
>=20
> > >
>=20
> > > I very much like this idea. I do lots of android kernel testing
>=20
> > > and being able to work with / compare / contribute to what
>=20
> > > is essentially a pile of data in BQ would be great. As an
>=20
> > > end user working with the data I=E2=80=99d also have lots of dash
>=20
> > > board options to customize and share queries with others.
>=20
> > >
>=20
> > > > With storage taken care of, how do we get the data in?
>=20
> > >
>=20
> > > > First, we'll need some canonical data structure defined. I would
>=20
> > > > approach defining the canonical structure in conjunction with the f=
irst
>=20
> > > > few projects that are interested in contributing their results. Eac=
h
>=20
> > > > project will have an ETL pipeline which will extract the test resul=
ts
>=20
> > > > from a given project (such as kernelci, lkft, etc), translate it in=
to
>=20
> > > > the canonical data structure, and load it into the google bigquery
>=20
> > > > dataset at a regular interval or in real-time. The translation laye=
r is
>=20
> > > > where things like test names are handled.
>=20
> > >
>=20

> > +1, exactly how I imagined this part.
>=20

> > > Exactly. I would hope that the various projects that are producing
>=20
> > > data would be motived to plug in. After all, it makes the data
>=20
> > > they are producing more useful and available to a larger group
>=20
> > > of people.
>=20
> > >
>=20
> > > > The things this leaves me wanting are:
>=20
> > > > - raw data storage. It would be nice if raw data were stored somewh=
ere
>=20
> > > > permanent in some intermediary place so that later implementations
>=20
> > > > could happen, and for data that doesn't fit into whatever structure=
 we
>=20
> > > > end up with.
>=20
> > >
>=20
> > > I agree.
>=20

> > +1
>=20

> > >
>=20
> > > > - time, to actually try it and find the gaps. This is just an idea =
I've
>=20
> > > > been thinking about. Anyone with experience here that can help fles=
h
>=20
> > > > this out?
>=20
> > >
>=20
> > > I=E2=80=99m willing to lend a hand.
>=20
> > >
>=20

> > Thanks for starting up a specific proposal! I agree with everything tha=
t
> > was
>=20
> > brought up. I'll try to find time to participate in the implementation =
part
>=20
> > too (although my experience with data storage is.. limited, I should be
> > able
>=20
> > to help out with the structure prototyping and maybe other parts too).
>=20

> This all sounds great: having a common location to store the
> results that is scalable and definitions of test case names.

> However, there is a whole layer of logic above and around this
> which KernelCI does, and I'm sure other CI systems also do with
> some degree of overlap. So it seems to me that solving how to
> deal with the results is only one piece in the puzzle to get a
> common CI architecture for upstream kernel testing. Sorry I'm a
> bit late to the party so I'll add my 2=C2=A2 here...

> Around the end of last year I made this document and mentioned it
> on this list, about making KernelCI more modular:

> https://docs.google.com/document/d/15F42HdHTO6NbSL53_iLl77lfe1XQKdWaHAf7X=
CNkKD8/edit?usp=3Dsharing
> https://groups.io/g/kernelci/topic/kernelci_modular_pipeline/29692355

I have a plan to read this document but still didn't get around it :(


> The idea is to make it possible to have alternative components in
> the KernelCI "pipeline". Right now, KernelCI has these
> components:

> * Jenkins job to monitor git branches and build kernels
> * LAVA to run tests
> * Custom backend and storage server to keep binaries and data
> * Custom web frontend to show the results

> They could all be replaced or used in conjunction with
> alternative build systems, database engines, test lab schedulers
> and dashboards. The key thing is the code orchestrating all
> this, which is kept in the kernelci-core repository.

> For example, when a change has been detected in a tree, rather
> than triggering kernel builds on Jenkins there could be a request
> sent to another build system to do that elsewhere. Likewise,
> when some builds are ready to be tested, jobs could be scheduled
> in non-LAVA labs simply by sending another kind of HTTP request
> than the ones we're currently sending to the LAVA APIs. This
> could be easily described in some config files, in fact we
> already have one with the list of labs where to submit jobs to.
> Builds and tests are configured in YAML files in KernelCI, which
> could easily be extended too with new attributes.

> The big advantage of having a central way to orchestrate all this
> is that results are going to be consistent and higher-level
> features can be enabled: each tree will be sampled at the same
> commit, so we don't end up with one CI lab running a version of
> mainline a few patches than another one etc... It means we can
> expand some KernelCI features to a larger ecosystem of CI labs,
> such as:

> * redundancy checks when the same test / hardware is tested in
> multiple places (say, if a RPi fails to boot in a LAVA lab but
> not in CKI's lab...)

> * regression tracking across the whole spectrum of CI labs

> * common reports for each single kernel revision being tested

> * bisections extended to non-LAVA labs

> It feels like a diagram would be needed to really give an idea of
> how this would work. APIs and callback mechanisms would need to
> be well defined to have clear entry points for the various
> components in a modular system like this. I think we would be
> able to reuse some of the things currently used by KernelCI and
> improve them, taking into account what other CI labs have been
> doing (LKFT, CKI...).

> I'm only scratching the surface here, but I wanted to raise this
> point to see if others shared the same vision. It would be
> unfortunate if we came up with a great solution focused on
> results, but then realised that it had big design limitations
> when trying to add more abstract functionality across all the
> contributing CI labs.

This is definitely something I'd love to see in the (likely very far)
future too.

However, I'd say that it would require changes in the CI systems and not
necessarily in the result format / way of displaying the data, which is
what we are trying to set up and agree on here. Each of the CI systems in
question would be responsible for their API calls and the receiving side
would just validate what it got, and this is likely not something that
would change even in the far future when we get more integrated.


I agree with all the points you made and we should definitely keep them
in mind going forward, but unless I overlooked something (which is
totally possible :) these two things don't depend on each other.

> Well, I tried to keep it short - hope this makes any sense.

It does. I really have to find some time to get through that doc.


Veronika

> Cheers,
> Guillaume
