Date: Thu, 26 Jul 2018 09:24:03 +0200
From: "Ana Guerrero Lopez" <ana.guerrero@collabora.com>
Subject: Re: [kernelci] Dealing with test results
Message-ID: <20180726072402.GA6009@delenn>
References: <4333af11-ae7f-d8f2-ce36-4d2df411ac67@collabora.com>
MIME-Version: 1.0
In-Reply-To: <4333af11-ae7f-d8f2-ce36-4d2df411ac67@collabora.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-ID: <kernelci.groups.io>
To: kernelci@groups.io

Hi!

In the last two weeks I have been working on the backend code.
I already implemented the possibility of triggering emails with 
the result of the test suites and I'm also working in the code 
for reporting the regressions. So this discussion impacts directly
these two features.

On Tue, Jul 17, 2018 at 02:39:15PM +0100, Guillaume Tucker wrote:
[...]
> So on one hand, I think we can start revisiting what we have in our
> database model.  Then on the other hand, we need to think about
> useful information we want to be able to extract from the database.
> 
> 
> At the moment, we have 3 collections to store these results.  Here's
> a simplified model:
> 
> test suite
> * suite name
> * build info (revision, defconfig...)
> * lab name
> * test sets
> * test cases
> 
> test set
> * set name
> * test cases
> 
> test case
> * case name
> * status
> * measurements
> 
> Here's an example:
> 
>   https://staging.kernelci.org/test/suite/5b489cc8cf3a0fe42f9d9145/
> 
> The first thing I can see here is that we don't actually use the test
> sets: each test suite has exactly one test set called "default", with
> all the test cases stored both in the suite and the set.  So I think
> we could simplify things by having only 2 collections: test suite and
> test case.  Does anyone know what the test sets were intended for?

Yes, please remove test sets. I don't know why they were added in the
past I don't see them being useful in the present. The test_case collection
stored in mongodb doesn't add any new information that's not already in the 
test_suite and test_case collections. 
See https://github.com/kernelci/kernelci-doc/wiki/Mongo-Database-Schema
for the mongodb schema.
I've been checking and they shouldn't be difficult to remove from the
current backend code and I expect the changes to be straighforward in the
frontend.

> Then the next thing to look into is actually about the results
> themselves.  They are currently stored as "status" and
> "measurements".  Status can take one of 4 values: error, fail, pass
> or skip.  Measurements are an arbitrary dictionary.  This works fine
> when the test case has an absolute pass/fail result, and when the
> measurement is only additional information such as the time it took
> to run it.
> 
> It's not that simple for test results which use the measurement to
> determine the pass/fail criteria.  For these, there needs to be some
> logic with some thresholds stored somewhere to determine whether the
> measurement results in pass or fail.  This could either be done as
> part of the test case, or in the backend.  Then some similar logic
> needs to be run to detect regressions, as some tests don't have an
> absolute threshold but must not be giving lower scores than previous
> runs.
> 
> It seems to me that having all the logic related to the test case
> stored in the test definition would be ideal, to keep it
> self-contained.  For example, previous test results could be fetched
> from the backend API and passed as meta-data to the LAVA job to
> determine whether the new result is a pass or fail.  The concept of
> pass/fail in this case may actually not be too accurate, rather that
> a score drop needs to be detected as a regression.  The advantage of
> this approach is that there is no need for any test-specific logic in
> the backend, regressions would still just be based on the status
> field.
> 
> How does that all sound?

Sounds good to me.

[...]
> Then the second part of this discussion would be, what do we want to
> get out of the database? (emails, visualisation, post-processing...)
> It seems worth gathering people's thoughts on this and look for some
> common ground.

I'm afraid I have more questions that answers about this. IMHO it's a
discussion that should reach to potential users of kernelci to get
also their input and that's a wider group than people in this list.
This doesn't mean we will be able, or want, to implement all the ideas 
but at least to get a sense of what would be more appreciated.

Ana

