MIME-Version: 1.0
References: <20180820162851.saybq7xfvkz7m2v2@xps.therub.org> <7hh8jori5m.fsf@baylibre.com>
In-Reply-To: <7hh8jori5m.fsf@baylibre.com>
From: "Guillaume Tucker" <guillaume.tucker@gmail.com>
Date: Mon, 20 Aug 2018 21:20:53 +0100
Message-ID: <CAH1_8nBS6YtRAt9gKCTGBSgxqZ=29dYWgB9cNe_-n_Kh+HHqMg@mail.gmail.com>
Subject: Re: [kernelci] Meeting Minutes for 2018-08-20
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-ID: <kernelci.groups.io>
To: kernelci@groups.io
Cc: dan.rue@linaro.org

On Mon, Aug 20, 2018 at 7:45 PM Kevin Hilman <khilman@baylibre.com> wrote:
>
> Dan, thanks again for the minutes!
>
> "Dan Rue" <dan.rue@linaro.org> writes:
>
> > - Attendees: Ana, Guillaume, Matt, Milosz, Rafael, Dan, Mark
> >
> > - Guillaume
> >   - Dealing with test results:
> >     - We currently have test suites/sets/cases, but test sets aren=E2=
=80=99t
> >       used and their implementation is broken.
>
> What is broken in the implementation?  LAVA? backend? frontend?

The way we currently deal with test sets in the backend does not
add any value with the short test plans we currently have.  As I
explained in my previous email thread, both the test suite and
test set entries have a list of test cases, making test sets
effectively redundant.

> >        They are mostly a side effect of parsing LAVA callback data,
>
> Not sure I'd call it a side effect.  LAVA supports the notion of suite,
> set and case, and we need to deal with that if we're handling LAVA data
> (even if there are no current kernelCI tests using it.)

Yes we need to be able to deal with the data sent by LAVA, but it
doesn't mean we need to follow the way the data is formatted in
the LAVA callbacks.

> >       they are not meaningful from a user point of view.
>
> I disagree.  They are extrememly useful for large test suites (LTP,
> kselftest, Android CTP, etc.)
>
> If you mean our *current* ways of visualizing them are not meaningful, I
> agree, but that's different from whether they are useful at all.

Right now, it's not clear what test sets are all about from our
backend point of view.  There also seems to be some confusion
around what they're supposed to be from a LAVA point of view, so
here's some clarification from the docs:

A test case is an individual test in a LAVA job, I think we all
know that that is (run a command, get a single result).

A test suite is a group of test cases run in a job:

  https://validation.linaro.org/static/docs/v2/results-intro.html#test-sui=
te

A test set is a subdivision of a test suite in a given LAVA job:

  https://validation.linaro.org/static/docs/v2/results-intro.html#test-set=
-results

LAVA jobs can contain multiple test suites, each of them contain
some test cases which can be optionally grouped as sets.

So if we want to split big test suites across several jobs, test
sets are not what we're after.

Using test sets only make sense when running big jobs with a
large test suite that needs to be split into smaller chunks.
We're not using these at the moment, and it goes against what we
discussed today (i.e. having smaller tests with parts of a larger
test suite).

Regarding the "broken" part, we're currently storing test cases
twice: as a "default" test set as well as the actual test suite.
So we have the same list of test cases in one test set entry and
one test suite entry - which is why the test set part appears to
be redundant.

> >     - Suggestion: Remove test sets to simplify things.  If we need a
> >       better backend solution, we should consider SQUAD and rethink th=
is
> >       from a global point of view.
>
> Not sure how squad helps here.  Seems it was designed with this same
> limitation.  IMO we need the raw data to be coherent, and cleanly broken
> down, and the frontend/UI used to view needs to be independent from
> that.

It's important to consider what SQUAD can bring to KernelCI -
with what it can do now or what can be done with some changes.
It may turn out to not be a good fit, but we can't ignore the
fact that it was designed for a very similar use-case: storing
results from multiple platforms running tests, and presenting
these results.  Maybe SQUAD can provide a coherent data model
that works perfectly well for KernelCI, maybe we need to mix it
or merge it with our current backend solution somehow.

We now have the KernelCI folks learning about SQUAD and the SQUAD
folks learning about KernelCI, we'll see where that leads us.

> >     - If some test suites need to be broken down, then we can have
> >       several smaller test plans.  We could also consider running
> >       several test plans in a row with a single LAVA job. Example:
> >       https://lava.collabora.co.uk/results/1240317
> >       - [drue/Mark] - In LKFT we run LTP across several test runs, and
> >         they end up getting called =E2=80=9Csuite=E2=80=9D LTP-subsetA=
, LTP-subsetB,
> >         etc, because squad doesn=E2=80=99t support sets.
>
> IMO, acknowleding that some suites need to be broken up is acknowleging
> that he notion of test sets is useful.  Just concatening the suite name
> and set name is a hack, not a solution.

As I explained above, test sets were not designed to be a group
of test suites to run across multiple jobs, but parts of a test
suite to run inside a job.  Indeed, using naming convention is
fragile.  What we could do however is have some reliable way of
telling that some test jobs are meant to be grouped together,
either with meta-data or maybe with something new in LAVA.  They
could just be using the same test suite, with different test
cases each.

Whether this should be visible at all from a user point of view,
I don't think so.  Say, if we split a test suite arbitrarily to
better spread the load, get more reliable test runs and run tests
in parallel, would this need to be shown to the user?  I would
have thought that we just need to present the list of all the
test cases for that suite.

> >         - [broonie] The goal here is to both get faster runs when
> >           there=E2=80=99s multiple boards and to improve robustness ag=
ainst test
> >           runs crashing and losing a lot of results on larger
> >           testsuites.
>
> So in LKFT, the seprate LTP sub-sets are run on separate boots?  Seems
> like an LKFT implementation decision, not somthing you would want to
> force on test writers, nor assume in the data model.
>
> >       - [ana] I would like to remove it because what we currently have
> >         doesn=E2=80=99t work and we don=E2=80=99t use it
>
> By "we" you mean current kernelCI users and kernelCI tests.  IMO, that's
> not a very good sample size, as there's currently only a few of us, and
> we don't have very many tests, and the tests that we have are pretty
> small.
>
> >       - [matt] this was all designed a while ago. A test set is suppos=
ed
> >         to be a part of a bigger test suite. If it=E2=80=99s not usefu=
l now, we
> >         can scrap it. There are performance issues too that you can se=
e
> >         when viewing the test data. +1 remove
>
> Are you saying LAVA is dropping the notion of test sets?
>
> >     - Decision: No objections to removing test sets
>
> I object.  (Can we please be careful about decision based on "no
> objections" when not everyone is able to participate in the call.)

You have the minutes (thanks Dan) to reply to here, and PR
comments (if anything concrete lands on Github).  Maybe we can
have another call in your timezone to discuss this further?

> What happens when trying to support LAVA test jobs that actually use
> suite, set and case?  We're trying to expand kernelCI users and test
> cases and there are lots of LAVA users out there with large test suites.
> They may not be sharing results (yet), but it would be a shame to have
> to have users restructure their test jobs because kCI doesn't support
> test sets.

We don't have to impose that on users, but we need to be clear on
how we deal with the LAVA test results: how we store them in the
backend, how we report them.  The backend is not a LAVA UI proxy,
we don't have to stick to the LAVA data structure.  If we do
really think that having another layer of grouping of the test
cases is useful, then we can make such a conscious decision -
knowing the pros and cons, and the fact that it tends to mean
running longer jobs.

> Also, what about kselftest?  It has several suites (e.g. each subdir of
> tools/testing/selftest) and within each suite can have sets
> (e.g. net/forwarding, ftrace/test.d/*)
>
> I'd really like kernelCI to scale to multiple forms of frontend/UI etc.,
> and for that the data model needs to be generic, flexible and especially
> scalable.
> To do that, I think it's very premature to eliminate one level of test
> hierarchy, for the primary reason that it's convenient in the short
> term.

It's important to consider the whole picture, in particular
whether SQUAD would be a better solution to store and report test
results.  It's also important to start sending email reports with
test results.  I guess the simplest thing we could do is to
ignore test sets for the time being (on the UI and emails).  Once
we've actually thought through how we want to be dealing with
test results in the longer term, for more complex test suites,
then we can decide whether we should fix or implement new things
in the kernelci-backend or move to an alternative system.

How does that sound?

Guillaume

> >   - Reshaping test configurations:
> >     - YAML-based description now being tested
> >     - In the process of adding all the devices and test plans to achie=
ve
> >       same test coverage as we currently have with the =E2=80=9Cdevice=
_map=E2=80=9D
> >     - Removing dead LAVA v1 code
> >     - Aiming at eventually merging kernelci-build and lava-ci.
> >     - Looking for feedback on
> >       https://github.com/kernelci/lava-ci-staging/pull/96
> >   - Multiple bisections run for single regression: investigating...
> >
> > - Ana
> >   - Reporting test suite results:
> >     - Sent v2 of mail reports last week
> >       https://github.com/kernelci/kernelci-backend/pull/70 Comments
> >       welcome. This is a first step to start getting the results of th=
e
> >       test suites by mail.
> >     - Sent small PR fixing a problem with the template for sending
> >       duplicate mails
> >   - Start reporting on regressions: this is blocked by the point
> >     mentioned above about test suites/sets/cases. I would like to send=
 a
> >     PR to the backend for tracking and reporting test suites regressio=
ns
> >     in the test suites but If we want to use test sets, some code need=
s
> >     to be added to fix its usage in the backend.
>
> I would much prefer fixing the backend than removing test sets all
> together.
>
> >   - Documentations update
> >     - Added 2 new pages documenting the test suites (on-going) and the
> >       rootfs images used by the test suites.
> >     - http://wiki.kernelci.org now tell readers about the github wiki.
> >     - Help welcome savaging the useful parts from wiki.kci.o
>
> IMO, there is a lot useful there.
>
> >     - Diagrams and other graphics can be added in the github wiki via
> >       git : git@github.com:kernelci/kernelci-doc.wiki.git
> >     - [drue] it looks like you can=E2=80=99t host a github wiki at its=
 own url,
> >       can you? I looked.
> >       - [ana] no, but it=E2=80=99s stored in markdown in a git repo an=
d we could
> >         use something else to render and host it in the future.
> >     - Github permissions - right now I can=E2=80=99t ask people to rev=
iew
> >       kernelci related pull requests
> >       - [matt] https://github.com/orgs/kernelci/teams exists but needs
> >         to be made better
>
> Kevin
>
> > - Milosz
> >   - Kernelci testing data presentation in SQUAD:
> >     https://staging-qa-reports.linaro.org/kernelci/
> >   - [ana] can results be filtered by date?
> >     - [milosz] you can use theAPI to get that. In the UI it=E2=80=99s =
sorted by
> >       date, but you can=E2=80=99t filter by date
> >   - [matt] it looks better than kernelci=E2=80=99s views. Some of the =
sorting
> >     and mapping can be improved
> >     - https://staging-qa-reports.linaro.org/kernelci/ shows it by
> >       branch, but what if someone wants to see it by board or by
> >       architecture/defconfig
> >     - [milosz] i=E2=80=99m working on filtering by environment (archit=
ecture,
> >       board), so that users can view results by board, or by config
> >       - [milosz] I=E2=80=99m currently working on
> >         https://github.com/Linaro/squad/issues/245
> >     - [guill] custom views would be really nice so that an individual
> >       could have a search for what they=E2=80=99re interested in that =
could be
> >       saved in a link, and shared that way
> >       - [milosz] this is a nice idea
> >       - [matt] here=E2=80=99s an example of a multi-field search in ke=
rnelci
> >         https://kernelci.org/boot/?apq8016-sbc%20lab-mhart%20master%20=
next
> >         - lava/squad doesn=E2=80=99t do that because of django=E2=80=
=99s default filter
> >           implementation
>
> Configurable, custom views is really the killer feature, but also the
> hardest part.  That's why, IMO, we need to get the data model right, and
> start using more generic analytic stacks (e.g. Elastic stack[1], or
> Apache Spark, etc.)
>
> Kevin
>
> [1] https://www.elastic.co/webinars/introduction-elk-stack
>
>
>=20
>
