Return-Path: <khilman@baylibre.com>
From: "Kevin Hilman" <khilman@baylibre.com>
Subject: Re: [kernelci] Meeting Minutes for 2018-08-20
References: <20180820162851.saybq7xfvkz7m2v2@xps.therub.org>
	<7hh8jori5m.fsf@baylibre.com>
	<CAH1_8nBS6YtRAt9gKCTGBSgxqZ=29dYWgB9cNe_-n_Kh+HHqMg@mail.gmail.com>
Date: Mon, 20 Aug 2018 16:52:52 -0700
In-Reply-To: <CAH1_8nBS6YtRAt9gKCTGBSgxqZ=29dYWgB9cNe_-n_Kh+HHqMg@mail.gmail.com>
	(Guillaume Tucker's message of "Mon, 20 Aug 2018 21:20:53 +0100")
Message-ID: <7hsh38lhnv.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
List-ID: <kernelci.groups.io>
To: Guillaume Tucker <guillaume.tucker@gmail.com>
Cc: kernelci@groups.io, dan.rue@linaro.org

"Guillaume Tucker" <guillaume.tucker@gmail.com> writes:

> On Mon, Aug 20, 2018 at 7:45 PM Kevin Hilman <khilman@baylibre.com> wrote:
>>
>> Dan, thanks again for the minutes!
>>
>> "Dan Rue" <dan.rue@linaro.org> writes:
>>
>> > - Attendees: Ana, Guillaume, Matt, Milosz, Rafael, Dan, Mark
>> >
>> > - Guillaume
>> >   - Dealing with test results:
>> >     - We currently have test suites/sets/cases, but test sets aren=E2=
=80=99t
>> >       used and their implementation is broken.
>>
>> What is broken in the implementation?  LAVA? backend? frontend?
>
> The way we currently deal with test sets in the backend does not
> add any value with the short test plans we currently have.  As I
> explained in my previous email thread, both the test suite and
> test set entries have a list of test cases, making test sets
> effectively redundant.

For the test plans we have, I see how that is redundant, but for test
plans that actually include test sets, is it still redunant?=20=20

My understanding was that test suites contain test sets (at least one
"default" if no others are defined), and that test sets contain test
cases.

>> >        They are mostly a side effect of parsing LAVA callback data,
>>
>> Not sure I'd call it a side effect.  LAVA supports the notion of suite,
>> set and case, and we need to deal with that if we're handling LAVA data
>> (even if there are no current kernelCI tests using it.)
>
> Yes we need to be able to deal with the data sent by LAVA, but it
> doesn't mean we need to follow the way the data is formatted in
> the LAVA callbacks.

Fully agree.  But as the examples that have already been presented (LTP,
kselftest, IGT, etc.) the 3-level hierarchy seems quite useful, not just
for LAVA.  I also suspect that when we start looking at test report
emails with multiple test suites, and lots of cases, having test sets
will be useful to make sense out of all the tests.

>> >       they are not meaningful from a user point of view.
>>
>> I disagree.  They are extrememly useful for large test suites (LTP,
>> kselftest, Android CTP, etc.)
>>
>> If you mean our *current* ways of visualizing them are not meaningful, I
>> agree, but that's different from whether they are useful at all.
>
> Right now, it's not clear what test sets are all about from our
> backend point of view.  There also seems to be some confusion
> around what they're supposed to be from a LAVA point of view, so
> here's some clarification from the docs:
>
> A test case is an individual test in a LAVA job, I think we all
> know that that is (run a command, get a single result).
>
> A test suite is a group of test cases run in a job:
>
>   https://validation.linaro.org/static/docs/v2/results-intro.html#test-su=
ite
>
> A test set is a subdivision of a test suite in a given LAVA job:
>
>   https://validation.linaro.org/static/docs/v2/results-intro.html#test-se=
t-results
>
> LAVA jobs can contain multiple test suites, each of them contain
> some test cases which can be optionally grouped as sets.
>
> So if we want to split big test suites across several jobs, test
> sets are not what we're after.

Agreed, I'm not talking about splittng across jobs. That just came up
because it seems to be what LKFT does, but I think that's a completely
different subject.

> Using test sets only make sense when running big jobs with a
> large test suite that needs to be split into smaller chunks.

Yes.

> We're not using these at the moment, and it goes against what we
> discussed today (i.e. having smaller tests with parts of a larger
> test suite).

I guess this is part of what I don't understand in what was discussed.
I don't understand how "smaller tests with parts of larger test suite"
implies that you only need 2 levels (suite, case.)  Even if you have 20
test cases in a test suite, it makes sense to me that you'd what to
logically group them into (sub)sets even if just for better reporting
purpose.

A simple example is this CAN bus test suite recently merged into
AGL[1]. There's only ~35 test cases, but we still grouped them into 5 sets.
One suite with ~35 tests is a lot to swallow from a
reporting/visualization PoV.

> Regarding the "broken" part, we're currently storing test cases
> twice: as a "default" test set as well as the actual test suite.
> So we have the same list of test cases in one test set entry and
> one test suite entry - which is why the test set part appears to
> be redundant.

In that case, seems like a simple fix to just not store them as part of
the test suite.

>> >     - Suggestion: Remove test sets to simplify things.  If we need a
>> >       better backend solution, we should consider SQUAD and rethink th=
is
>> >       from a global point of view.
>>
>> Not sure how squad helps here.  Seems it was designed with this same
>> limitation.  IMO we need the raw data to be coherent, and cleanly broken
>> down, and the frontend/UI used to view needs to be independent from
>> that.
>
> It's important to consider what SQUAD can bring to KernelCI -
> with what it can do now or what can be done with some changes.
> It may turn out to not be a good fit, but we can't ignore the
> fact that it was designed for a very similar use-case: storing
> results from multiple platforms running tests, and presenting
> these results.  Maybe SQUAD can provide a coherent data model
> that works perfectly well for KernelCI, maybe we need to mix it
> or merge it with our current backend solution somehow.
>
> We now have the KernelCI folks learning about SQUAD and the SQUAD
> folks learning about KernelCI, we'll see where that leads us.

I agree that we should be considering SQUAD.  As I've said a few times
now, I think we need more experimentation in the UI/visualization front.
I'm not opposed to that at all, and would love to see more.

Just in the context of the debate over test sets, I didn't understand
what SQUAD has to offer since it was a design decision to not use them,
but instead just create a new virtual suite which concatenates the suite
name and the set name (yuck.)

>> >     - If some test suites need to be broken down, then we can have
>> >       several smaller test plans.  We could also consider running
>> >       several test plans in a row with a single LAVA job. Example:
>> >       https://lava.collabora.co.uk/results/1240317
>> >       - [drue/Mark] - In LKFT we run LTP across several test runs, and
>> >         they end up getting called =E2=80=9Csuite=E2=80=9D LTP-subsetA=
, LTP-subsetB,
>> >         etc, because squad doesn=E2=80=99t support sets.
>>
>> IMO, acknowleding that some suites need to be broken up is acknowleging
>> that he notion of test sets is useful.  Just concatening the suite name
>> and set name is a hack, not a solution.
>
> As I explained above, test sets were not designed to be a group
> of test suites to run across multiple jobs, but parts of a test
> suite to run inside a job.

Sorry for the confusion, I'm not sure how I communicated that, but I
didn't mean to suggest that.  The hierarchy is suites contain sets
contain cases.

> Indeed, using naming convention is
> fragile.  What we could do however is have some reliable way of
> telling that some test jobs are meant to be grouped together,
> either with meta-data or maybe with something new in LAVA.  They
> could just be using the same test suite, with different test
> cases each.
>
> Whether this should be visible at all from a user point of view,
> I don't think so.  Say, if we split a test suite arbitrarily to
> better spread the load, get more reliable test runs and run tests
> in parallel, would this need to be shown to the user?  I would
> have thought that we just need to present the list of all the
> test cases for that suite.

IMO breaking up tests across multiple jobs is a totally different
subject.  First we need to resolve the basic hierarchy that the data
model should support within a single job.

>
>> >         - [broonie] The goal here is to both get faster runs when
>> >           there=E2=80=99s multiple boards and to improve robustness ag=
ainst test
>> >           runs crashing and losing a lot of results on larger
>> >           testsuites.
>>
>> So in LKFT, the seprate LTP sub-sets are run on separate boots?  Seems
>> like an LKFT implementation decision, not somthing you would want to
>> force on test writers, nor assume in the data model.
>>
>> >       - [ana] I would like to remove it because what we currently have
>> >         doesn=E2=80=99t work and we don=E2=80=99t use it
>>
>> By "we" you mean current kernelCI users and kernelCI tests.  IMO, that's
>> not a very good sample size, as there's currently only a few of us, and
>> we don't have very many tests, and the tests that we have are pretty
>> small.
>>
>> >       - [matt] this was all designed a while ago. A test set is suppos=
ed
>> >         to be a part of a bigger test suite. If it=E2=80=99s not usefu=
l now, we
>> >         can scrap it. There are performance issues too that you can see
>> >         when viewing the test data. +1 remove
>>
>> Are you saying LAVA is dropping the notion of test sets?
>>
>> >     - Decision: No objections to removing test sets
>>
>> I object.  (Can we please be careful about decision based on "no
>> objections" when not everyone is able to participate in the call.)
>
> You have the minutes (thanks Dan) to reply to here,=20

Yes, which is what I've done. :)

The minutes read as though a decision was made, which should not happen
(IMO) without all the interested partiese, especially when the topic
been raised earlier, and I had objected then as well[2].

I should've probably just interpreted that "Decision" line as "Proposal"
and then I would not have gotten worked up about it.

> and PR comments (if anything concrete lands on Github).
> Maybe we can have another call in your timezone to discuss this
> further?
>
>> What happens when trying to support LAVA test jobs that actually use
>> suite, set and case?  We're trying to expand kernelCI users and test
>> cases and there are lots of LAVA users out there with large test suites.
>> They may not be sharing results (yet), but it would be a shame to have
>> to have users restructure their test jobs because kCI doesn't support
>> test sets.
>
> We don't have to impose that on users, but we need to be clear on
> how we deal with the LAVA test results: how we store them in the
> backend, how we report them.  The backend is not a LAVA UI proxy,
> we don't have to stick to the LAVA data structure.

Agreed, we don't have to follow LAVA, but we have to deal with LAVA
data, and following it is one (easy) choice, especially when it's proven
to be useful for large test suites.

> If we do
> really think that having another layer of grouping of the test
> cases is useful, then we can make such a conscious decision -
> knowing the pros and cons, and the fact that it tends to mean
> running longer jobs.

Why does it mean longer running jobs?   A few extra shell commands to
run "lava-test-set start <name>" and "lava-test-set stop" are not going
to (noticably) increase the runtime.

>> Also, what about kselftest?  It has several suites (e.g. each subdir of
>> tools/testing/selftest) and within each suite can have sets
>> (e.g. net/forwarding, ftrace/test.d/*)
>>
>> I'd really like kernelCI to scale to multiple forms of frontend/UI etc.,
>> and for that the data model needs to be generic, flexible and especially
>> scalable.
>> To do that, I think it's very premature to eliminate one level of test
>> hierarchy, for the primary reason that it's convenient in the short
>> term.
>
> It's important to consider the whole picture, in particular
> whether SQUAD would be a better solution to store and report test
> results.

No objections to more variety in test reporting.  There will be lots of
ways to slice, dice and view the test data.

> It's also important to start sending email reports with
> test results.

Agreed, I think we should merge Ana's PR and start getting emails and
then start iterating on it.

Even looking at the gist examples[3] from that PR, the IGT one is
already massive, and IMO, difficult to process (1 test-suite: 185 test
cases !!).

Similar to the boot report emails, I suspect they will evolve to be a
quick summary, and just have links to the UI for all the details, rather
than a full list of all the test cases.

e.g. in the current email examples, it's missing the high-level
summary:  How many test suites ran? how many passed/failed?  on how many
boards. (Note that I dont' think this shoudl prevent us from merging
Ana's PR, but we should continue to iterate/improve.  I'll comment on
the PR directly)

> I guess the simplest thing we could do is to
> ignore test sets for the time being (on the UI and emails).  Once
> we've actually thought through how we want to be dealing with
> test results in the longer term, for more complex test suites,
> then we can decide whether we should fix or implement new things
> in the kernelci-backend or move to an alternative system.
>
> How does that sound?

Sounds OK, but IMO we're already running complex enough test suites that
are begging for test sets (e.g. IGT, kselftest)

We could also quite simply add sets to the "simple" test plan so that
our emails and UI can evolve accordingly with actual data in the
backend.  The emails/UIs can still choose to ignore (or concatenate) the
sets, but at least there will be a choice to be able to to finer-graned
grouping/reporting/visualization, and the data model can support it.

Kevin

[1] https://git.automotivelinux.org/src/qa-testdefinitions/tree/test-suites=
/short-smoke/test_can.yaml
[2] https://groups.io/g/kernelci/message/36
[3] https://gist.github.com/ana/af7f153384e95588132c588dac983215
[4] https://github.com/kernelci/lava-ci-staging/commit/b62b2823787cf67f96f8=
2da2248969c0feef3847
