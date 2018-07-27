Subject: Re: [kernelci] Dealing with test results
References: <4333af11-ae7f-d8f2-ce36-4d2df411ac67@collabora.com>
 <20180726072402.GA6009@delenn> <7hwoth29u9.fsf@baylibre.com>
From: "Tomeu Vizoso" <tomeu.vizoso@collabora.com>
Message-ID: <8de9169e-4c9b-790c-a6bf-0d4980744540@collabora.com>
Date: Fri, 27 Jul 2018 08:28:04 +0200
MIME-Version: 1.0
In-Reply-To: <7hwoth29u9.fsf@baylibre.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
List-ID: <kernelci.groups.io>
To: kernelci@groups.io, Ana Guerrero Lopez <ana.guerrero@collabora.com>

On 07/26/2018 07:19 PM, Kevin Hilman wrote:
> "Ana Guerrero Lopez" <ana.guerrero@collabora.com> writes:
> 
> 
>> In the last two weeks I have been working on the backend code.
>> I already implemented the possibility of triggering emails with
>> the result of the test suites and I'm also working in the code
>> for reporting the regressions. So this discussion impacts directly
>> these two features.
>>
>> On Tue, Jul 17, 2018 at 02:39:15PM +0100, Guillaume Tucker wrote:
>> [...]
>>> So on one hand, I think we can start revisiting what we have in our
>>> database model.  Then on the other hand, we need to think about
>>> useful information we want to be able to extract from the database.
>>>
>>>
>>> At the moment, we have 3 collections to store these results.  Here's
>>> a simplified model:
>>>
>>> test suite
>>> * suite name
>>> * build info (revision, defconfig...)
>>> * lab name
>>> * test sets
>>> * test cases
>>>
>>> test set
>>> * set name
>>> * test cases
>>>
>>> test case
>>> * case name
>>> * status
>>> * measurements
>>>
>>> Here's an example:
>>>
>>>    https://staging.kernelci.org/test/suite/5b489cc8cf3a0fe42f9d9145/
>>>
>>> The first thing I can see here is that we don't actually use the test
>>> sets: each test suite has exactly one test set called "default", with
>>> all the test cases stored both in the suite and the set.  So I think
>>> we could simplify things by having only 2 collections: test suite and
>>> test case.  Does anyone know what the test sets were intended for?
> 
> IIRC, they were added because LAVA supports all three levels.
> 
>> Yes, please remove test sets. I don't know why they were added in the
>> past I don't see them being useful in the present.
>>
>> The test_case collection
>> stored in mongodb doesn't add any new information that's not already in the
>> test_suite and test_case collections.
>> See https://github.com/kernelci/kernelci-doc/wiki/Mongo-Database-Schema
>> for the mongodb schema.
>> I've been checking and they shouldn't be difficult to remove from the
>> current backend code and I expect the changes to be straighforward in the
>> frontend.
> 
> I disagree.  Looking at the IGT example above, there's a lot of test
> cases in that test suite.  It could (and probably should) be broken down
> into test sets.
> 
> Also if you think about large test suites (like LTP, or kselftest) it's
> quite easy to imagine using all 3 levels.  For example, for test-suite =
> kselftest, each dir under tools/testing/selftest would be a test-set,
> and each test in that dir would be a test-case.

Just a small note that we have one more level above those three: the job. 
So a kselftest job could have each dir as a test suite and each test a 
test-case, without needing test sets.

May be less awkward to get rid of the test-suite level if we only run one 
test suite per job. But if we want to have jobs that run multiple test 
suites that have lots of jobs, then we maybe need the 4 levels. But then, 
I would be worried about having lots of incomplete results when there's a 
crash.

I'm not particularly in favour of dropping one level now, but I hope we 
aren't planning to put too many tests in single jobs.

[...]
>> [...]
>>> Then the second part of this discussion would be, what do we want to
>>> get out of the database? (emails, visualisation, post-processing...)
>>> It seems worth gathering people's thoughts on this and look for some
>>> common ground.
>>
>> I'm afraid I have more questions that answers about this. IMHO it's a
>> discussion that should reach to potential users of kernelci to get
>> also their input and that's a wider group than people in this list.
>> This doesn't mean we will be able, or want, to implement all the ideas
>> but at least to get a sense of what would be more appreciated.
> 
> I think I have more questions than answers too, but, for starters we
> need the /test view to have more functionaliity.  Currently it only
> allows you to filter by a single board, but like our /boot views, we
> want to be able to filter by build (tree/branch), or specific test
> suite, etc.
> 
> We are working on some PoC view for some of this right now (should show
> up on github in the next week or two).
> 
> But, for the medium/long term, I think we need to rethink the frontend
> completely, and start thinking of all of this data we have as a "big
> data" problem.
> 
> If we step back and think of our boots and tests as micro-services that
> start up, spit out some logs, and disappear, it's not hugely different
> than any large distributed cloud app, and there are *lots* of logging
> and analytics tools geared towards monitoring, analyzing and
> visiualizing these kinds of systems (e.g. Apache Spark, Elastic/ELK
> Stack[1], graylog, to name only a few.)
> 
> In short, I don't think we can fully predict how people are going to
> want to use/visualize/analyze all the data, so we need to use a
> flexible, log-basd analytics framework that will grow as kernelCI grows.

Makes sense to me!

Cheers,

Tomeu

> 
> Kevin
> 
> [1] https://www.elastic.co/elk-stack
> 
> 
> 
> 
