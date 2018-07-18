Return-Path: <dan.rue@linaro.org>
Date: Wed, 18 Jul 2018 19:37:05 +0000
From: dan.rue@linaro.org
Subject: Re: [kernelci] Dealing with test results
Message-ID: <20180718193705.exynbrdc5ekwite7@linode.therub.org>
References: <4333af11-ae7f-d8f2-ce36-4d2df411ac67@collabora.com>
MIME-Version: 1.0
In-Reply-To: <4333af11-ae7f-d8f2-ce36-4d2df411ac67@collabora.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-ID: <kernelci.groups.io>
To: kernelci@groups.io
Cc: Antonio Terceiro <antonio.terceiro@linaro.org>, Milosz Wasilewski <milosz.wasilewski@linaro.org>

Hi Guillaume -

On Tue, Jul 17, 2018 at 02:39:15PM +0100, Guillaume Tucker wrote:
> Hi,
> 
> As we're expanding the number of tests being run, one crucial point
> to consider is how to store the results in the backend.  It needs to
> be designed in such a way to enable relevant reports, searches,
> visualisation and a remote API.  It's also important to be able to
> detect regressions and run bisections with the correct data set.

So, I'm relatively new to kernelci, linaro, and linux testing in
general. As I've become involved with and lurked on the various efforts,
I've been trying to figure out where the various projects can
collaborate to make better tools and solutions than any of us are able
to make individually. Kernelci is a great example of such an effort.

When it comes to this discussion, I guess I am biased, but it seems to
me that squad has already solved many of these questions, and that
kernelci should be able to benefit from it directly.

Details aside, if we put our efforts into working together on the same
stack, we will end up ahead.

So this raises two questions: Does the work proposed here represent
duplicate work? If it does, is there a way to avoid it and join efforts?

As to the first question, there are differences between squad and
kernelci. Primarily, that squad is a general purpose result engine,
while kernelci is written specifically for kernel testing. Sometimes,
this makes certain features (especially in squad's generic front end), a
bit more difficult than they are in kernelci.

Also, I sense there is a desire to keep kernelci's backend all within
the same database and API, which I agree is better (when no other
considerations are made).

That said, I would much rather see people helping out to improve squad,
which already has many of the features requested, than spending their
time re-implementing it. It's certainly not perfect, but neither will
another implementation be.

It would be straight forward to use squad for test results, and use
kernelci's existing back end for build and boot results. The kernelci
front end could stay consistent and pull results from either API,
depending on what page and data is being viewed.

We could re-use qa-reports.linaro.org, which already has an automated
scaled out (3 tier) architecture in AWS, or re-use its automation to
deploy it for kernelci specifically (but it would be more expensive).

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

This is similar to squad's model, though most things are generic
versions of what's listed above. For example, similar to lava, each
testrun can have arbitrary metadata assigned (such as lab name, build
info, etc). Squad assumes nothing about such data. Here's a diagram
from https://github.com/Linaro/squad/blob/master/doc/intro.rst.

    +----+  * +-------+  * +-----+  * +-------+  * +----+ *   1 +-----+
    |Team|--->|Project|--->|Build|--->|TestRun|--->|Test|------>|Suite|
    +----+    +---+---+    +-----+    +-------+    +----+       +-----+
                  ^ *         ^         | *   |                    ^ 1
                  |           |         |     |  * +------+ *      |
              +---+--------+  |         |     +--->|Metric|--------+
              |Subscription|  |         |          +------+
              +------------+  |         v 1
              +-------------+ |       +-----------+
              |ProjectStatus|-+       |Environment|
              +-------------+         +-----------+

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

Squad doesn't have a concept of a test set, but in practice we do have a
division smaller than suite and larger than a single test case. For
example in LKFT, we break LTP up into 20 different LAVA jobs, each
running a subset of LTP. Each of these 20 get put into squad as a
separate 'suite'. This actually causes us a bit of a problem because
each of these reports their version of LTP used, which should all always
be the same, but we can't guarantee it because it is only by convention.

If we had 'set', we could use set instead of suite when submitting the
ltp subset, and have them all associated with the same suite (ltp).

> Then the next thing to look into is actually about the results
> themselves.  They are currently stored as "status" and
> "measurements".  Status can take one of 4 values: error, fail, pass
> or skip.  Measurements are an arbitrary dictionary.  This works fine
> when the test case has an absolute pass/fail result, and when the
> measurement is only additional information such as the time it took
> to run it.

Squad is quite similar here. Again see the previous url that describes
squad's data model. Squad calls them metrics instead of measurements.

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

If the threshold is stored with the test or test definition, then the
test can just report pass/fail directly. This is a common pattern for
lots of tests. Defining boundaries for metrics is a hard problem. Basing
it on past results is fraught with perils, and quickly leads to ML type
solutions. In squad, we detect regressions by naively just looking at
the status of a given test in the previous build, and I think that it
has proved to be inadequate. Doing so for metrics would be more-so.

> It is only a starting point, as Kevin mentioned we should probably
> get some advice from experts in the field of data in general.  This
> thread could easily split into several to discus the different
> aspects of this issue.  Still reviewing what we have and making basic
> changes should help us scale to the extent of what we're aiming for
> at the moment with small test suites.
> 
> Then the second part of this discussion would be, what do we want to
> get out of the database? (emails, visualisation, post-processing...)
> It seems worth gathering people's thoughts on this and look for some
> common ground.

If we keep the components loosely coupled, we retain the ability to do
reporting, visualisation, analytics, etc, as we see fit. Trying to
predict all the ways the data will be used is difficult and I don't want
to get stuck with analysis paralysis.

Thanks,
Dan

> 
> Best wishes,
> Guillaume
> 
> 
> 
