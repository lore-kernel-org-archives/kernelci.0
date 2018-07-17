From: "Guillaume Tucker" <guillaume.tucker@gmail.com>
Subject: Dealing with test results
Message-ID: <4333af11-ae7f-d8f2-ce36-4d2df411ac67@collabora.com>
Date: Tue, 17 Jul 2018 14:39:15 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
List-ID: <kernelci.groups.io>
To: kernelci@groups.io

Hi,

As we're expanding the number of tests being run, one crucial point
to consider is how to store the results in the backend.  It needs to
be designed in such a way to enable relevant reports, searches,
visualisation and a remote API.  It's also important to be able to
detect regressions and run bisections with the correct data set.

So on one hand, I think we can start revisiting what we have in our
database model.  Then on the other hand, we need to think about
useful information we want to be able to extract from the database.


At the moment, we have 3 collections to store these results.  Here's
a simplified model:

test suite
* suite name
* build info (revision, defconfig...)
* lab name
* test sets
* test cases

test set
* set name
* test cases

test case
* case name
* status
* measurements

Here's an example:

   https://staging.kernelci.org/test/suite/5b489cc8cf3a0fe42f9d9145/

The first thing I can see here is that we don't actually use the test
sets: each test suite has exactly one test set called "default", with
all the test cases stored both in the suite and the set.  So I think
we could simplify things by having only 2 collections: test suite and
test case.  Does anyone know what the test sets were intended for?


Then the next thing to look into is actually about the results
themselves.  They are currently stored as "status" and
"measurements".  Status can take one of 4 values: error, fail, pass
or skip.  Measurements are an arbitrary dictionary.  This works fine
when the test case has an absolute pass/fail result, and when the
measurement is only additional information such as the time it took
to run it.

It's not that simple for test results which use the measurement to
determine the pass/fail criteria.  For these, there needs to be some
logic with some thresholds stored somewhere to determine whether the
measurement results in pass or fail.  This could either be done as
part of the test case, or in the backend.  Then some similar logic
needs to be run to detect regressions, as some tests don't have an
absolute threshold but must not be giving lower scores than previous
runs.

It seems to me that having all the logic related to the test case
stored in the test definition would be ideal, to keep it
self-contained.  For example, previous test results could be fetched
from the backend API and passed as meta-data to the LAVA job to
determine whether the new result is a pass or fail.  The concept of
pass/fail in this case may actually not be too accurate, rather that
a score drop needs to be detected as a regression.  The advantage of
this approach is that there is no need for any test-specific logic in
the backend, regressions would still just be based on the status
field.

How does that all sound?


It is only a starting point, as Kevin mentioned we should probably
get some advice from experts in the field of data in general.  This
thread could easily split into several to discus the different
aspects of this issue.  Still reviewing what we have and making basic
changes should help us scale to the extent of what we're aiming for
at the moment with small test suites.

Then the second part of this discussion would be, what do we want to
get out of the database? (emails, visualisation, post-processing...)
It seems worth gathering people's thoughts on this and look for some
common ground.

Best wishes,
Guillaume
