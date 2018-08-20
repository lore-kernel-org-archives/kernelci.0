Return-Path: <khilman@baylibre.com>
From: "Kevin Hilman" <khilman@baylibre.com>
Subject: Re: [kernelci] Meeting Minutes for 2018-08-20
References: <20180820162851.saybq7xfvkz7m2v2@xps.therub.org>
Date: Mon, 20 Aug 2018 11:45:41 -0700
In-Reply-To: <20180820162851.saybq7xfvkz7m2v2@xps.therub.org> (Dan Rue's
	message of "Mon, 20 Aug 2018 11:28:51 -0500")
Message-ID: <7hh8jori5m.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
List-ID: <kernelci.groups.io>
To: Dan Rue <dan.rue@linaro.org>
Cc: kernelci@groups.io

Dan, thanks again for the minutes!

"Dan Rue" <dan.rue@linaro.org> writes:

> - Attendees: Ana, Guillaume, Matt, Milosz, Rafael, Dan, Mark
>
> - Guillaume
>   - Dealing with test results:
>     - We currently have test suites/sets/cases, but test sets aren=E2=80=
=99t
>       used and their implementation is broken.

What is broken in the implementation?  LAVA? backend? frontend?

>       =C2=A0They are mostly a side effect of parsing LAVA callback data,

Not sure I'd call it a side effect.  LAVA supports the notion of suite,
set and case, and we need to deal with that if we're handling LAVA data
(even if there are no current kernelCI tests using it.)

>       they are not meaningful from a user point of view.

I disagree.  They are extrememly useful for large test suites (LTP,
kselftest, Android CTP, etc.)

If you mean our *current* ways of visualizing them are not meaningful, I
agree, but that's different from whether they are useful at all.

>     - Suggestion: Remove test sets to simplify things. =C2=A0If we need a
>       better backend solution, we should consider SQUAD and rethink this
>       from a global point of view.

Not sure how squad helps here.  Seems it was designed with this same
limitation.  IMO we need the raw data to be coherent, and cleanly broken
down, and the frontend/UI used to view needs to be independent from
that.

>     - If some test suites need to be broken down, then we can have
>       several smaller test plans. =C2=A0We could also consider running
>       several test plans in a row with a single LAVA job. Example:
>       https://lava.collabora.co.uk/results/1240317
>       - [drue/Mark] - In LKFT we run LTP across several test runs, and
>         they end up getting called =E2=80=9Csuite=E2=80=9D LTP-subsetA, L=
TP-subsetB,
>         etc, because squad doesn=E2=80=99t support sets.

IMO, acknowleding that some suites need to be broken up is acknowleging
that he notion of test sets is useful.  Just concatening the suite name
and set name is a hack, not a solution.

>         - [broonie] The goal here is to both get faster runs when
>           there=E2=80=99s multiple boards and to improve robustness again=
st test
>           runs crashing and losing a lot of results on larger
>           testsuites.

So in LKFT, the seprate LTP sub-sets are run on separate boots?  Seems
like an LKFT implementation decision, not somthing you would want to
force on test writers, nor assume in the data model.

>       - [ana] I would like to remove it because what we currently have
>         doesn=E2=80=99t work and we don=E2=80=99t use it

By "we" you mean current kernelCI users and kernelCI tests.  IMO, that's
not a very good sample size, as there's currently only a few of us, and
we don't have very many tests, and the tests that we have are pretty
small.

>       - [matt] this was all designed a while ago. A test set is supposed
>         to be a part of a bigger test suite. If it=E2=80=99s not useful n=
ow, we
>         can scrap it. There are performance issues too that you can see
>         when viewing the test data. +1 remove

Are you saying LAVA is dropping the notion of test sets?

>     - Decision: No objections to removing test sets

I object.  (Can we please be careful about decision based on "no
objections" when not everyone is able to participate in the call.)

What happens when trying to support LAVA test jobs that actually use
suite, set and case?  We're trying to expand kernelCI users and test
cases and there are lots of LAVA users out there with large test suites.
They may not be sharing results (yet), but it would be a shame to have
to have users restructure their test jobs because kCI doesn't support
test sets.

Also, what about kselftest?  It has several suites (e.g. each subdir of
tools/testing/selftest) and within each suite can have sets
(e.g. net/forwarding, ftrace/test.d/*)

I'd really like kernelCI to scale to multiple forms of frontend/UI etc.,
and for that the data model needs to be generic, flexible and especially
scalable.

To do that, I think it's very premature to eliminate one level of test
hierarchy, for the primary reason that it's convenient in the short
term.

>   - Reshaping test configurations:
>     - YAML-based description now being tested
>     - In the process of adding all the devices and test plans to achieve
>       same test coverage as we currently have with the =E2=80=9Cdevice_ma=
p=E2=80=9D
>     - Removing dead LAVA v1 code
>     - Aiming at eventually merging kernelci-build and lava-ci.
>     - Looking for feedback on
>       https://github.com/kernelci/lava-ci-staging/pull/96
>   - Multiple bisections run for single regression: investigating...
>
> - Ana
>   - Reporting test suite results:
>     - Sent v2 of mail reports last week
>       https://github.com/kernelci/kernelci-backend/pull/70 Comments
>       welcome. This is a first step to start getting the results of the
>       test suites by mail.
>     - Sent small PR fixing a problem with the template for sending
>       duplicate mails
>   - Start reporting on regressions: this is blocked by the point
>     mentioned above about test suites/sets/cases. I would like to send a
>     PR to the backend for tracking and reporting test suites regressions
>     in the test suites but If we want to use test sets, some code needs
>     to be added to fix its usage in the backend.

I would much prefer fixing the backend than removing test sets all
together.

>   - Documentations update
>     - Added 2 new pages documenting the test suites (on-going) and the
>       rootfs images used by the test suites.
>     - http://wiki.kernelci.org now tell readers about the github wiki.
>     - Help welcome savaging the useful parts from wiki.kci.o

IMO, there is a lot useful there.

>     - Diagrams and other graphics can be added in the github wiki via
>       git : git@github.com:kernelci/kernelci-doc.wiki.git
>     - [drue] it looks like you can=E2=80=99t host a github wiki at its ow=
n url,
>       can you? I looked.
>       - [ana] no, but it=E2=80=99s stored in markdown in a git repo and w=
e could
>         use something else to render and host it in the future.
>     - Github permissions - right now I can=E2=80=99t ask people to review
>       kernelci related pull requests
>       - [matt] https://github.com/orgs/kernelci/teams exists but needs
>         to be made better

Kevin

> - Milosz
>   - Kernelci testing data presentation in SQUAD:
>     https://staging-qa-reports.linaro.org/kernelci/
>   - [ana] can results be filtered by date?
>     - [milosz] you can use theAPI to get that. In the UI it=E2=80=99s sor=
ted by
>       date, but you can=E2=80=99t filter by date
>   - [matt] it looks better than kernelci=E2=80=99s views. Some of the sor=
ting
>     and mapping can be improved
>     - https://staging-qa-reports.linaro.org/kernelci/ shows it by
>       branch, but what if someone wants to see it by board or by
>       architecture/defconfig
>     - [milosz] i=E2=80=99m working on filtering by environment (architect=
ure,
>       board), so that users can view results by board, or by config
>       - [milosz] I=E2=80=99m currently working on
>         https://github.com/Linaro/squad/issues/245
>     - [guill] custom views would be really nice so that an individual
>       could have a search for what they=E2=80=99re interested in that cou=
ld be
>       saved in a link, and shared that way
>       - [milosz] this is a nice idea
>       - [matt] here=E2=80=99s an example of a multi-field search in kerne=
lci
>         https://kernelci.org/boot/?apq8016-sbc%20lab-mhart%20master%20next
>         - lava/squad doesn=E2=80=99t do that because of django=E2=80=99s =
default filter
>           implementation

Configurable, custom views is really the killer feature, but also the
hardest part.  That's why, IMO, we need to get the data model right, and
start using more generic analytic stacks (e.g. Elastic stack[1], or
Apache Spark, etc.)

Kevin

[1] https://www.elastic.co/webinars/introduction-elk-stack

