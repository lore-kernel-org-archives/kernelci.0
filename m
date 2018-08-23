MIME-Version: 1.0
References: <20180820162851.saybq7xfvkz7m2v2@xps.therub.org>
 <7hh8jori5m.fsf@baylibre.com> <CAH1_8nBS6YtRAt9gKCTGBSgxqZ=29dYWgB9cNe_-n_Kh+HHqMg@mail.gmail.com>
 <7hsh38lhnv.fsf@baylibre.com> <c1c6e626-7920-dc5f-bee9-36e88caa2eb7@collabora.com>
 <20180822172018.vl4u6ajkdjo54vfv@xps.therub.org> <7hk1oh68sb.fsf@baylibre.com>
In-Reply-To: <7hk1oh68sb.fsf@baylibre.com>
From: "Guillaume Tucker" <guillaume.tucker@gmail.com>
Date: Thu, 23 Aug 2018 08:35:33 +0100
Message-ID: <CAH1_8nBKSwYDetOTJR-a3Nzv-La9=SiqMbENoVVn9D0hhSTQ4A@mail.gmail.com>
Subject: Re: [kernelci] Meeting Minutes for 2018-08-20
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-ID: <kernelci.groups.io>
To: khilman@baylibre.com
Cc: dan.rue@linaro.org, tomeu.vizoso@collabora.com, kernelci@groups.io

On Thu, Aug 23, 2018 at 4:50 AM Kevin Hilman <khilman@baylibre.com> wrote:
>
> "Dan Rue" <dan.rue@linaro.org> writes:
>
> > On Wed, Aug 22, 2018 at 12:11:06PM +0200, Tomeu Vizoso wrote:
> >> Hi Kevin,
> >>
> >> On 08/21/2018 01:52 AM, Kevin Hilman wrote:
> >> > "Guillaume Tucker" <guillaume.tucker@gmail.com> writes:
> >> >
> >> > > On Mon, Aug 20, 2018 at 7:45 PM Kevin Hilman <khilman@baylibre.com=
> wrote:
> >> > > >
> >> > > > Dan, thanks again for the minutes!
> >> > > >
> >> > > > "Dan Rue" <dan.rue@linaro.org> writes:
> >> > > >
> >> > > > > - Attendees: Ana, Guillaume, Matt, Milosz, Rafael, Dan, Mark
> >> > > > >
> >> > > > > - Guillaume
> >> > > > >    - Dealing with test results:
> >> > > > >      - We currently have test suites/sets/cases, but test sets=
 aren=E2=80=99t
> >> > > > >        used and their implementation is broken.
> >> > > >
> >> > > > What is broken in the implementation?  LAVA? backend? frontend?
> >> > >
> >> > > The way we currently deal with test sets in the backend does not
> >> > > add any value with the short test plans we currently have.  As I
> >> > > explained in my previous email thread, both the test suite and
> >> > > test set entries have a list of test cases, making test sets
> >> > > effectively redundant.
> >> >
> >> > For the test plans we have, I see how that is redundant, but for tes=
t
> >> > plans that actually include test sets, is it still redunant?
> >> >
> >> > My understanding was that test suites contain test sets (at least on=
e
> >> > "default" if no others are defined), and that test sets contain test
> >> > cases.
> >>
> >> Can you explain what do you think KernelCI should do with the hierarch=
y
> >> information? That would allow me to understand the need for storing te=
sts
> >> within a multiple level hierarchy.
> >>
> >> For the use cases I currently care about, it's enough to have test pla=
ns
> >> (corresponding to a kernel subsystem, so we know where to send regress=
ion
> >> reports) containing tests.
> >>
> >> Note that for big test suites, it's normal to have 6 levels or more, s=
o I'm
> >> a bit concerned that if we decide to go now with 4 levels, we may need=
 we
> >> need more in the future. But right now I'm having trouble figuring out=
 what
> >> kernelci would do with the hierarchy information.
> >
> > I can give an example that we have run into in LKFT that would benefit
> > from my understanding of what test sets are. Since SQUAD doesn't have
> > test sets, I guess this is like a preview of what it might look like
> > without them.
> >
> > Browse to
> > https://qa-reports.linaro.org/lkft/linux-mainline-oe/build/v4.18-11219-=
gad1d69735878/
> >
> > This is the test results of a recent mainline revision. We run LTP, and
> > have it broken up into 20 separate test sets, which each correspond to =
a
> > runfile in LTP, and each set is run in a separate lava job.
> >
> > We want SQUAD to also show this distinction, since there are a lot of
> > tests. Now, click on the "+ Display more" link under the "Metadata" box=
.
> > You'll notice an explosion of metadata which is largely duplicate - the
> > version of LTP for each test set which culminates into this beauty:
> >
> >     suite_versions:
> >         {'kselftest': '4.18+gitAUTOINC+ad1d697358'}
> >         {'libhugetlbfs': '2.20+gitAUTOINC+02df38e93e+next'}
> >         {'ltp-cap_bounds-tests': '20180515'}
> >         {'ltp-containers-tests': '20180515'}
> >         {'ltp-cve-tests': '20180515'}
> >         {'ltp-fcntl-locktests-tests': '20180515'}
> >         {'ltp-filecaps-tests': '20180515'}
> >         {'ltp-fs-tests': '20180515'}
> >         {'ltp-fs_bind-tests': '20180515'}
> >         {'ltp-fs_perms_simple-tests': '20180515'}
> >         {'ltp-fsx-tests': '20180515'}
> >         {'ltp-hugetlb-tests': '20180515'}
> >         {'ltp-io-tests': '20180515'}
> >         {'ltp-ipc-tests': '20180515'}
> >         {'ltp-math-tests': '20180515'}
> >         {'ltp-nptl-tests': '20180515'}
> >         {'ltp-open-posix-tests': '20180515'}
> >         {'ltp-pty-tests': '20180515'}
> >         {'ltp-sched-tests': '20180515'}
> >         {'ltp-securebits-tests': '20180515'}
> >         {'ltp-syscalls-tests': '20180515'}
> >         {'ltp-timers-tests': '20180515'}
> >
> > Since SQUAD does not understand test sets, in order to tell squad what
> > version of each test 'suite' is running, we have to submit it for each
> > test 'set'. So we concatenate the suite name with the set name during
> > submission.
> >
> > So now we know what version each test set is running, but it creates a
> > bit of a mess which is hard to unroll in reporting :(
>
> Exactly.  Reporting is the key here.
>
> If we want to get to a point of concise reporting, having a hierarchy is
> crucial.

Essentially, when running test suites manually, you can typically
choose to only see the results you care about one way or another.
Either by choosing to run only some cases, or by filtering the
output.  We need to be able to reproduce this use-case via
KernelCI and not make it stand in the way between test suites and
results visible to the user.

So I belive the first step is to capture the output of the test
suites in a generic way that contains all the original
information.  It should then be possible to view the results in
any format, even maybe turning them back into a plain text log to
let users filter it themselves with grep...  I'm not saying
that's an amazing feature and user experience or even something
we should actually do, but if the system makes it impossible to
implement that then I think we have a problem.

> > All this discussion leads me to believe that the prudent course for the
> > time being seems to be to 'do nothing', and revisit this at a later dat=
e
> > once things are more clear.
>
> I disagree.  We're talking about the levels of hierarchy precisely
> because we're trying to put in place some better reporting.
>
> IMO, we need to get the hierarchy in the data model sorted out before
> we're going to have reporting and visualization that can scale to even
> medium sized test suites.

Following the principle that we need to capture all the data, we
can't just keep the implementation we have right now or ignore
anything beyond a single level of hierarchy.  I agree with Dan
that we still have a few things to clarify, so we should probably
do only the minimal required to store consistent data.  I don't
think we know exactly what we want to do with the data (how to
search, which flavours of email reports...), and if we want to
split tests between jobs we'll need a robust way of piecing them
back in the backend.

I like Kevin's suggestion of having sets in sets, in fact that's
something we were discussing yesterday with Ana.  Here's a
pseudo-schema I think would work well:

TestCase:
  * name
  * result
  * meta-data

TestGroup:
  * name
  * meta-data
  * list of test cases
  * list of test groups

Think of it a bit like a file system, with groups being
directories and cases files.  You can have groups within
groups...  This can scale both ways, to have sets within suites,
and also suites within a collection of suites or whatever we want
to do with this.  Then we can have a way of calling them with
some kind of path like suite/set/case, or suite.set.case, or just
suite.case, or super-plan.suite.case or whatever it takes to
store the test suite results.

I believe the changes should be relatively simple, and should
result in a simpler database schema than what we have now with
suites & sets mixed up.

Guillaume
