Return-Path: <khilman@baylibre.com>
From: "Kevin Hilman" <khilman@baylibre.com>
Subject: Re: [kernelci] Meeting Minutes for 2018-08-20
References: <20180820162851.saybq7xfvkz7m2v2@xps.therub.org>
	<7hh8jori5m.fsf@baylibre.com>
	<CAH1_8nBS6YtRAt9gKCTGBSgxqZ=29dYWgB9cNe_-n_Kh+HHqMg@mail.gmail.com>
	<7hsh38lhnv.fsf@baylibre.com>
	<c1c6e626-7920-dc5f-bee9-36e88caa2eb7@collabora.com>
	<20180822172018.vl4u6ajkdjo54vfv@xps.therub.org>
Date: Wed, 22 Aug 2018 20:50:28 -0700
In-Reply-To: <20180822172018.vl4u6ajkdjo54vfv@xps.therub.org> (Dan Rue's
	message of "Wed, 22 Aug 2018 12:20:18 -0500")
Message-ID: <7hk1oh68sb.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
List-ID: <kernelci.groups.io>
To: Dan Rue <dan.rue@linaro.org>
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>, kernelci@groups.io, Guillaume Tucker <guillaume.tucker@gmail.com>

"Dan Rue" <dan.rue@linaro.org> writes:

> On Wed, Aug 22, 2018 at 12:11:06PM +0200, Tomeu Vizoso wrote:
>> Hi Kevin,
>>=20
>> On 08/21/2018 01:52 AM, Kevin Hilman wrote:
>> > "Guillaume Tucker" <guillaume.tucker@gmail.com> writes:
>> >=20
>> > > On Mon, Aug 20, 2018 at 7:45 PM Kevin Hilman <khilman@baylibre.com> =
wrote:
>> > > >=20
>> > > > Dan, thanks again for the minutes!
>> > > >=20
>> > > > "Dan Rue" <dan.rue@linaro.org> writes:
>> > > >=20
>> > > > > - Attendees: Ana, Guillaume, Matt, Milosz, Rafael, Dan, Mark
>> > > > >=20
>> > > > > - Guillaume
>> > > > >    - Dealing with test results:
>> > > > >      - We currently have test suites/sets/cases, but test sets a=
ren=E2=80=99t
>> > > > >        used and their implementation is broken.
>> > > >=20
>> > > > What is broken in the implementation?  LAVA? backend? frontend?
>> > >=20
>> > > The way we currently deal with test sets in the backend does not
>> > > add any value with the short test plans we currently have.  As I
>> > > explained in my previous email thread, both the test suite and
>> > > test set entries have a list of test cases, making test sets
>> > > effectively redundant.
>> >=20
>> > For the test plans we have, I see how that is redundant, but for test
>> > plans that actually include test sets, is it still redunant?
>> >=20
>> > My understanding was that test suites contain test sets (at least one
>> > "default" if no others are defined), and that test sets contain test
>> > cases.
>>=20
>> Can you explain what do you think KernelCI should do with the hierarchy
>> information? That would allow me to understand the need for storing tests
>> within a multiple level hierarchy.
>>=20
>> For the use cases I currently care about, it's enough to have test plans
>> (corresponding to a kernel subsystem, so we know where to send regression
>> reports) containing tests.
>>=20
>> Note that for big test suites, it's normal to have 6 levels or more, so =
I'm
>> a bit concerned that if we decide to go now with 4 levels, we may need we
>> need more in the future. But right now I'm having trouble figuring out w=
hat
>> kernelci would do with the hierarchy information.
>
> I can give an example that we have run into in LKFT that would benefit
> from my understanding of what test sets are. Since SQUAD doesn't have
> test sets, I guess this is like a preview of what it might look like
> without them.
>
> Browse to
> https://qa-reports.linaro.org/lkft/linux-mainline-oe/build/v4.18-11219-ga=
d1d69735878/
>
> This is the test results of a recent mainline revision. We run LTP, and
> have it broken up into 20 separate test sets, which each correspond to a
> runfile in LTP, and each set is run in a separate lava job.
>
> We want SQUAD to also show this distinction, since there are a lot of
> tests. Now, click on the "+ Display more" link under the "Metadata" box.
> You'll notice an explosion of metadata which is largely duplicate - the
> version of LTP for each test set which culminates into this beauty:
>
>     suite_versions:
>         {'kselftest': '4.18+gitAUTOINC+ad1d697358'}
>         {'libhugetlbfs': '2.20+gitAUTOINC+02df38e93e+next'}
>         {'ltp-cap_bounds-tests': '20180515'}
>         {'ltp-containers-tests': '20180515'}
>         {'ltp-cve-tests': '20180515'}
>         {'ltp-fcntl-locktests-tests': '20180515'}
>         {'ltp-filecaps-tests': '20180515'}
>         {'ltp-fs-tests': '20180515'}
>         {'ltp-fs_bind-tests': '20180515'}
>         {'ltp-fs_perms_simple-tests': '20180515'}
>         {'ltp-fsx-tests': '20180515'}
>         {'ltp-hugetlb-tests': '20180515'}
>         {'ltp-io-tests': '20180515'}
>         {'ltp-ipc-tests': '20180515'}
>         {'ltp-math-tests': '20180515'}
>         {'ltp-nptl-tests': '20180515'}
>         {'ltp-open-posix-tests': '20180515'}
>         {'ltp-pty-tests': '20180515'}
>         {'ltp-sched-tests': '20180515'}
>         {'ltp-securebits-tests': '20180515'}
>         {'ltp-syscalls-tests': '20180515'}
>         {'ltp-timers-tests': '20180515'}
>
> Since SQUAD does not understand test sets, in order to tell squad what
> version of each test 'suite' is running, we have to submit it for each
> test 'set'. So we concatenate the suite name with the set name during
> submission.
>
> So now we know what version each test set is running, but it creates a
> bit of a mess which is hard to unroll in reporting :(

Exactly.  Reporting is the key here.

If we want to get to a point of concise reporting, having a hierarchy is
crucial.

> All this discussion leads me to believe that the prudent course for the
> time being seems to be to 'do nothing', and revisit this at a later date
> once things are more clear.

I disagree.  We're talking about the levels of hierarchy precisely
because we're trying to put in place some better reporting.

IMO, we need to get the hierarchy in the data model sorted out before
we're going to have reporting and visualization that can scale to even
medium sized test suites.

Kevin
