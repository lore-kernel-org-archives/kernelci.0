From: "Chris Paterson" <chris.paterson2@renesas.com>
Subject: Re: Linking CIP testing with KernelCI
Date: Mon, 28 Jun 2021 12:06:24 +0000
Message-ID: 
 <OSZPR01MB68772BB9F21CF17039F6B109B7039@OSZPR01MB6877.jpnprd01.prod.outlook.com>
References: 
 <OSAPR01MB2385E0367B8CA545E1D66422B7890@OSAPR01MB2385.jpnprd01.prod.outlook.com>
 <CAH1_8nDMbmG-_Kgq51zgkwWXurfUC=OiACakeAbPz3Edh+xvhA@mail.gmail.com>
 <OSBPR01MB2392D13C9278C9A1F555DC79B7810@OSBPR01MB2392.jpnprd01.prod.outlook.com>
 <00e8563c-355d-24b1-d9b7-90cdaf91c87b@collabora.com>
In-Reply-To: <00e8563c-355d-24b1-d9b7-90cdaf91c87b@collabora.com>
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable
List-ID: <kernelci.groups.io>
To: Guillaume Tucker <guillaume.tucker@collabora.com>, Alice Ferrazzi <alicef@gentoo.org>
Cc: Kevin Hilman <khilman@baylibre.com>, "kernelci@groups.io" <kernelci@groups.io>, "masashi.kudo@cybertrust.co.jp" <masashi.kudo@cybertrust.co.jp>

Hello Guillaume,

> From: Guillaume Tucker <guillaume.tucker@collabora.com>
> Sent: 24 June 2021 20:31
>=20
> +Alice
>=20
> It's been one year already since the last reply on this thread!

Scary!
Thank you for getting the conversation moving again.

>=20
> On 12/06/2020 12:03, Chris Paterson wrote:
> > Hello Guillaume,
> >
> > Thank you for the feedback.
> > I=92ve added some comments below (sorry, email didn=92t come through i=
n
> plan text=85)
> >
> > Kind regards, Chris
> >
> >> From: Guillaume Tucker <guillaume.tucker@gmail.com>
> >> Sent: 11 June 2020 22:12
> >> To: Chris Paterson <Chris.Paterson2@renesas.com>
> >> Cc: Kevin Hilman <khilman@baylibre.com>; kernelci@groups.io
> >> Subject: Re: Linking CIP testing with KernelCI
> >>
> >> + kernelci@groups.io<mailto:kernelci@groups.io> as discussed
> >>
> >> Hi Chris,
> >>
> >> Thanks for starting this discussion, connecting the CIP test
> >> system with KernelCI sounds like a perfect example of how the
> >> project can grow.
> >>
> >> On Thu, Jun 4, 2020 at 11:15 AM Chris Paterson
> <Chris.Paterson2@renesas.com<mailto:Chris.Paterson2@renesas.com>
> wrote:
> >>> Hello Guillaume, Kevin,
> >>>
> >>> I'd really like to get CIP linked into KernelCI somehow before ELC-N=
A in a
> few weeks.
> >>> Are you both available for a quick chat this week/next to determine
> what kind of integration would be suitable, and how we can go about
> achieving it?
> >>
> >> Sure, let's try to find a slot next week.
>=20
> This did happen, we enabled some CIP branches on the main
> KernelCI instance:
>=20
>=20
> https://jpn01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flinu=
x.
> kernelci.org%2Fjob%2Fcip%2F&amp;data=3D04%7C01%7Cchris.paterson2%40r
> enesas.com%7Cb58d15bce49d427cc4ec08d93746ab91%7C53d82571da1947e4
> 9cb4625a166a4a2a%7C0%7C0%7C637601598937236465%7CUnknown%7CTWF
> pbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXV
> CI6Mn0%3D%7C1000&amp;sdata=3DLTDMkHbjR7X4TBN7k2jzE8NRb2z7%2B0iI
> m65W1QNBWZw%3D&amp;reserved=3D0
>=20
> It's running regular KernelCI tests, just with these CIP branches
> which are like "special" LTS branches.

And seems to be working well, thank you.

>=20
> >>> Some ramblings below to start the discussion...
> >>>
> >>> # Background on the current CIP CI setup
> >>> - We have a GitLab mirror of our kernel.org kernel repo
> >>> - Our branches contain a simple .gitlab-ci.yml file that links to ou=
r
> build/test GitLab CI pipeline repository
> >>> - Kernel builds are kicked off using the various arches/configs supp=
orted
> by CIP
> >>> - Test jobs are then submitted to our LAVA master
> >>> - We currently run simple boot tests, spectre/meltdown checker,
> cyclictest+hackbench (RT configs only) and LTP (only run on CIP release
> candidates)
> >>> - If the builds and tests finish okay then GitLab shows a green tick=
, if
> there is some kind of build error, or test infrastructure error then Git=
Lab
> shows a red cross
> >>> - If individual test cases fail, or there is a test regression, curr=
ently there
> is no way of knowing in the Gitlab UI. This is why I want to start using
> KernelCI
> >>> - We follow a similar process for Greg's stable-rc 4.4 and 4.19 bran=
ches,
> but don't run LTP
> >>
> >> This sounds very similar to the experiment Kevin did with his own
> >> tree and Gitlab CI, except he's using the command line tools from
> >> kernelci-core.
> >>
> >>> # Options for KernelCI integration (?)
> >>> 1) Keep our current build/test pipeline the same, just add a notify
> section to the LAVA jobs to send the results to kernelci.org
> >>> - We'd need to include the correct metadata etc.
> >>
> >> I think we might be able to have commands that generate just the
> >> meta-data for a given kernel build without actually doing a
> >> build.  That would allow you to keep your current build system
> >> and also stay in sync with the kernelci meta-data definitions.
> >
> > CPA: Sounds sensible.
>=20
> What I've heard this time is that maybe CIP would like to
> completely adopt KernelCI's build tools.  Is that right?

Maybe. We're still working out what the best approach may be.

>=20
> If that was the case, it would of course be easier to integrate
> CIP tests with KernelCI.  In the same way that we're starting to
> have specific kernel builds on chromeos.kernelci.org using the
> same Kubernetes build infrastructure as the main instance, we
> could do that for CIP kernels with particular defconfigs or
> toolchains.

This would probably be the "easiest" approach, but I'm guess we don't want=
 to use KernelCI's build resources for our project.
This is the main point for me, if we were to use all of KernelCI's tooling=
 - should we add GitLab CI integration (to use CIP's GitLab runners), or do=
nate money/EC2 instances to KernelCI?

>=20
> >>> - Would this work if there is no corresponding 'build job'?
> >>
> >> I don't think anyone is doing this right now but in any case it's
> >> something we need to support, for example with static analysis
> >> and other tests that don't require any build.  The only thing
> >> that should be really required is the kernel revision (tree,
> >> branch, sha1, git describe).  So, "yes" this needs to work.
> >
> > CPA: Presumably this information could be provided as part of the LAVA
> job notification?
> >
> >>> - Would you allow test results from the CIP SLTS Kernels on kernelci=
.org?
> Or would we need to set up our own instance?
> >>
> >> Ideally, only upstream-oriented branches should be built and
> >> tested on kernelci.org to keep it in line with the project's
> >> mission and upstream kernel development.  If the CIP branches
> >> consist only of backported patches from mainline, maybe it could
> >> be accepted in the same way that we have stable branches.  If
> >> however there are patches that are not intended to get merged
> >> upstream and are there for specific products, then in my opinion
> >> that would not be acceptable - see below for an alternative as
> >> you suggested.
> >>
> > CPA: CIP follow an upstream first policy, so almost every patch comes =
from
> mainline, mostly via the stable LTS releases.
> > CPA: The SLTS Kernels aren=92t focused at a particular product. It=92s=
 meant to
> be part of a base layer for end users.
> > CPA: They consist of LTS + some extra board support that has been
> backported from mainline. Sometimes a novel patch is required when addin=
g
> the extra board support, as v5.7 is a lot different to v4.4.
> > CPA: When LTS support from Greg ends on the Kernels CIP are using
> (currently v4.4 & v4.19) CIP aims to pick up a very similar role.
>=20
> As mentioned earlier, this has now been enabled as the branches
> are considered close enough to upstream.
>=20
> >>> 1b) Same as 1) but using either cip.kernelci.org or kernelci.ciplatf=
orm.org
> >>
> >> Yes, having a separate instance would enable a separate
> >> configuration, separate database, special features etc... so no
> >> possible interference with the main kernelci.org
> >> activities.  Having it as cip.kernelci.org means it would
> >> probably be managed by the KernelCI LF project, I guess that
> >> would make sense for a member.  But then if you host and manage
> >> your own instance on kernelci.ciplatform.org you're of course
> >> free to do anything you want with it.
> >
> > CPA: I agree that it may make most sense to have a separate frontend f=
or
> CIP=92s test efforts =96 this will avoid confusion. Especially as many w=
ould
> consider CIP=92s Kernels a =91downstream=92 product.
> > CPA: cip.kernelci.org, (partly)managed by the KernelCI project would
> should a good benefit of joining the KernelCI project, perhaps helping a=
ttract
> new members.
>=20
> Do you still agree it would be worthwhile having a separate
> frontend on cip.kernelci.org with extra tests and special builds
> that aren't on linux.kernelci.org?

Yes. With our testing we'd want to use our own filesystem, and start addin=
g in more userspace testing.
Whilst we're happy to upstream such support, there may be some functionali=
ty that doesn't fit in with KernelCI's scope.

So running a fork on a different subdomain may be a sensible approach.

>=20
> >>> 2) kernelci.org starts monitoring/building/testing the CIP SLTS Kern=
els
> >>> - Tests would run through our LAVA master
> >>> - Perhaps kernelci.org could make use of our build infrastructure?
> >>> 2b) Same as 2) but using either cip.kernelci.org or kernelci.ciplatf=
orm.org
> >>
> >> The question of kernelci.org vs another instance remains the
> >> same, in my opinion it all hinges on what is on the branches.
> >>
> >> Doing this would give you automated bisection since the KernelCI
> >> pipeline would be able to run arbitrary jobs in the LAVA lab.
> >> Using your own build infrastructure would probably be another
> >> argument in favour of a separate instance (e.g. cip.kernelci.org)
> >> as this would be a custom use-case, unless you're happy to have
> >> any kernelci.org kernel builds run on your infrastructure.
> >
> > CPA: This would be something to explore at a later point. We=92d have =
to
> evaluate the cost impact etc.
>=20
> What are your thoughts on this now?  Would you want to keep using
> your own build tools, or use kci_build but with your build infra,
> or just rely on the KernelCI Kubernetes build infra as mentioned
> earlier?
>=20
> >>> 3) kernelci.org start submitting their usual test jobs to the CIP LA=
VA
> master
> >>> - CIP currently have 11 different device-types (20 boards in total) =
which
> should help expand what is available to KernelCI
> >>
> >> Maybe we could do that anyway, with filters to limit the upstream
> >> branches and test suites to run if you want, and also work out a
> >> solution for the CIP SLTS branches?
> >>
> > CPA: This would be easy to set up and I=92m all for it, seeing as we=
=92re
> members of the project
> > CPA: Our current testing load isn=92t huge.
>=20
> That's already done, for regular KernelCI tests.

Let me know if you want to expand the list of tests run in our labs.

>=20
> >>> My preferred option would be 1) as it would be nice not to lose all =
the
> work spent on the GitLab CI setup
> >>> (or perhaps integrating the GitLab CI approach into KernelCI's setup=
 is a
> worthwhile task, but it'll take time)
> >>
> >> Yes I think Option 1 would be good given the timeframe you've
> >> set.  Also it's going to be a recurring use-case, KernelCI is all
> >> about being flexible enough to integrate existing CI systems with
> >> no real modifications to them.  We can try things out with
> >> staging.kernelci.org initially.  Option 2 could be done as a
> >> follow-up if you think the added features justify the extra
> >> efforts.
> >>
> >> And Option 3 seems really straightforward to me, any LAVA lab can
> >> be added to kernelci.org with an API token and a bit of YAML
> >> configuration.  That would definitely be a quick win if you want
> >> to be sure to have something to show at ELC-NA :)
> >
> > CPA: Fantastic. Thanks Guillaume.
>=20
> I guess all these aspects are still relevant, except the ones
> that have already been implemented.  Basically, has CIP's point
> of view changed since last year with regards to your existing
> Gitlab CI system?

Our current approach, whilst it works, isn't overly scalable if we want to=
 add more and more test cases in the long run.
Whilst obviously we could improve the current scripts, it may be more effi=
cient to just use KernelCI's approach.
This way both projects can easily benefit from any improvements/test case =
expansion down the line.

>=20
> It would probably be good to go through this again in next
> Tuesday's meeting if Chris can make it.  Otherwise we can
> schedule a specific meeting at another time.

Alice and I will join on Tuesday.
Thank you for the time.

Kind regards, Chris

>=20
> Best wishes,
> Guillaume
