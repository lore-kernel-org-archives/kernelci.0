Return-Path: <khilman@baylibre.com>
From: "Kevin Hilman" <khilman@baylibre.com>
Subject: Re: [kernelci] Dealing with test results
References: <4333af11-ae7f-d8f2-ce36-4d2df411ac67@collabora.com>
	<20180726072402.GA6009@delenn>
Date: Thu, 26 Jul 2018 12:19:42 -0500
In-Reply-To: <20180726072402.GA6009@delenn> (Ana Guerrero Lopez's message of
	"Thu, 26 Jul 2018 09:24:03 +0200")
Message-ID: <7hwoth29u9.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
List-ID: <kernelci.groups.io>
To: Ana Guerrero Lopez <ana.guerrero@collabora.com>
Cc: kernelci@groups.io

"Ana Guerrero Lopez" <ana.guerrero@collabora.com> writes:


> In the last two weeks I have been working on the backend code.
> I already implemented the possibility of triggering emails with 
> the result of the test suites and I'm also working in the code 
> for reporting the regressions. So this discussion impacts directly
> these two features.
>
> On Tue, Jul 17, 2018 at 02:39:15PM +0100, Guillaume Tucker wrote:
> [...]
>> So on one hand, I think we can start revisiting what we have in our
>> database model.  Then on the other hand, we need to think about
>> useful information we want to be able to extract from the database.
>> 
>> 
>> At the moment, we have 3 collections to store these results.  Here's
>> a simplified model:
>> 
>> test suite
>> * suite name
>> * build info (revision, defconfig...)
>> * lab name
>> * test sets
>> * test cases
>> 
>> test set
>> * set name
>> * test cases
>> 
>> test case
>> * case name
>> * status
>> * measurements
>> 
>> Here's an example:
>> 
>>   https://staging.kernelci.org/test/suite/5b489cc8cf3a0fe42f9d9145/
>> 
>> The first thing I can see here is that we don't actually use the test
>> sets: each test suite has exactly one test set called "default", with
>> all the test cases stored both in the suite and the set.  So I think
>> we could simplify things by having only 2 collections: test suite and
>> test case.  Does anyone know what the test sets were intended for?

IIRC, they were added because LAVA supports all three levels.

> Yes, please remove test sets. I don't know why they were added in the
> past I don't see them being useful in the present.
>
> The test_case collection
> stored in mongodb doesn't add any new information that's not already in the 
> test_suite and test_case collections. 
> See https://github.com/kernelci/kernelci-doc/wiki/Mongo-Database-Schema
> for the mongodb schema.
> I've been checking and they shouldn't be difficult to remove from the
> current backend code and I expect the changes to be straighforward in the
> frontend.

I disagree.  Looking at the IGT example above, there's a lot of test
cases in that test suite.  It could (and probably should) be broken down
into test sets.

Also if you think about large test suites (like LTP, or kselftest) it's
quite easy to imagine using all 3 levels.  For example, for test-suite =
kselftest, each dir under tools/testing/selftest would be a test-set,
and each test in that dir would be a test-case.

>> Then the next thing to look into is actually about the results
>> themselves.  They are currently stored as "status" and
>> "measurements".  Status can take one of 4 values: error, fail, pass
>> or skip.  Measurements are an arbitrary dictionary.  This works fine
>> when the test case has an absolute pass/fail result, and when the
>> measurement is only additional information such as the time it took
>> to run it.
>> 
>> It's not that simple for test results which use the measurement to
>> determine the pass/fail criteria.  For these, there needs to be some
>> logic with some thresholds stored somewhere to determine whether the
>> measurement results in pass or fail.  This could either be done as
>> part of the test case, or in the backend.  Then some similar logic
>> needs to be run to detect regressions, as some tests don't have an
>> absolute threshold but must not be giving lower scores than previous
>> runs.
>> 
>> It seems to me that having all the logic related to the test case
>> stored in the test definition would be ideal, to keep it
>> self-contained.  For example, previous test results could be fetched
>> from the backend API and passed as meta-data to the LAVA job to
>> determine whether the new result is a pass or fail.  The concept of
>> pass/fail in this case may actually not be too accurate, rather that
>> a score drop needs to be detected as a regression.  The advantage of
>> this approach is that there is no need for any test-specific logic in
>> the backend, regressions would still just be based on the status
>> field.
>> 
>> How does that all sound?
>
> Sounds good to me.
>

I agree, test-specific login in the backend sounds difficult to
manage/maintain.

> [...]
>> Then the second part of this discussion would be, what do we want to
>> get out of the database? (emails, visualisation, post-processing...)
>> It seems worth gathering people's thoughts on this and look for some
>> common ground.
>
> I'm afraid I have more questions that answers about this. IMHO it's a
> discussion that should reach to potential users of kernelci to get
> also their input and that's a wider group than people in this list.
> This doesn't mean we will be able, or want, to implement all the ideas 
> but at least to get a sense of what would be more appreciated.

I think I have more questions than answers too, but, for starters we
need the /test view to have more functionaliity.  Currently it only
allows you to filter by a single board, but like our /boot views, we
want to be able to filter by build (tree/branch), or specific test
suite, etc.

We are working on some PoC view for some of this right now (should show
up on github in the next week or two).

But, for the medium/long term, I think we need to rethink the frontend
completely, and start thinking of all of this data we have as a "big
data" problem.

If we step back and think of our boots and tests as micro-services that
start up, spit out some logs, and disappear, it's not hugely different
than any large distributed cloud app, and there are *lots* of logging
and analytics tools geared towards monitoring, analyzing and
visiualizing these kinds of systems (e.g. Apache Spark, Elastic/ELK
Stack[1], graylog, to name only a few.)

In short, I don't think we can fully predict how people are going to
want to use/visualize/analyze all the data, so we need to use a
flexible, log-basd analytics framework that will grow as kernelCI grows.

Kevin

[1] https://www.elastic.co/elk-stack

