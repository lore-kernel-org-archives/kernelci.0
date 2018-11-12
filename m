From: "Guillaume Tucker" <guillaume.tucker@gmail.com>
Subject: Dealing with test results
Message-ID: <787f38db-ee04-071a-ee79-8bee6c78fe7c@collabora.com>
Date: Mon, 12 Nov 2018 13:58:29 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
List-ID: <kernelci.groups.io>
To: kernelci@groups.io

A recurring topic is how to deal with test results, from the
point in the test code where they're generated to how the result
is stored in a database.  This was brought up again during last
week's meeting while discussing kernel warnings in boot tests, so
let's take another look at it and try to break it down into
smaller problems to solve:


* generating the test results

Each test suite currently has its own way of generating test
results, typically with some arbitrary format on stdout.  This
means a custom parser for each test suite, which is tedious to
maintain and error-prone, but a first step at getting results.
In some cases, such as boot testing, there isn't any real
alternative.

There are however several standards for encoding test results, I
think this is being discussed quite a lot already (LKFT people?).
There's also a thread on linux-media about this, following the
work we've done with them to improve testing in that area of the
kernel:

  https://www.spinics.net/lists/linux-media/msg142520.html

The bottom line is: we need a good machine-readable test output
format try to align test suites to be compatible with it.


* handling the test results

The next step is about writing the results somewhere: on the
console, in a file, or even directly to a remote API.  Some
devices may not have a functionarl network interface with access
to the internet, so it's hard to require the devices to push
results directly.  The least common denominator is that the
results need to eventually land in the database, so how they get
there isn't necessarily relevant.  It is useful though to store
the full log of the job to do some manual investigation later on.


* importing the results

This is the crucial part here in my opinion: turning the output
of a test suite into results that can be stored into the
database.  It can be done in several places, and how to do it is
often directly linked to the definition of the test: the format
of the results may depend on options passed when calling the test
etc...

The standard way to do this with LAVA is to call "lava-test-case"
and "lava-test-set" while the test is running on the device, then
have the resulting data sent to a remote API via the callback
mechanism.  This seems to be working rather well, with some
things that can probably be improved (sub-groups limited to 1
level, noise in the log with LAVA messages...).

Another place where this could be done is on a test server,
between the device and the database API.  In the case of LAVA,
this may be the dispatcher which has direct access to the device.
I believe this is how the "regex" pattern approach works.  The
inconvenient here is that the test server needs to have the
capability to parse the results, so doing custom things may not
always be possible.

Then it's also possible in principle to send all the raw results
as-is to a remote API which will parse it itself and store it in
the database directly.  The difference with what we're doing with
the LAVA callback is that it provides the pass/fail data for each
test case already populated.  It seems to me that adding more
parsing capability in the backend is only sustainable if the
results are provided in a structured format, as having test-suite
specific parsers in the backend is bound to break when the test
suites change.


* determining pass / fail based on measurements

While it's not something we've been doing much yet, we can't
ignore this aspect as well.  Things like power consumption, CPU
cycles and memory usage don't have an absolute pass/fail criteria
but are based on previous results.  We need to be able to access
at least the last results for the same test configuration to
determine whether a new result is pass or fail.

To keep all the test logic self-contained, it could also be done
on the device as long as it has access to the required
data (i.e. last result and relative thresholds).  With LAVA, the
part doing the test generation (Python script in Jenkins) could
be querying the database API for this and pass it to the test
suite via the job definition.

Just like for importing the results, this could be done
elsewhere (test server, database API...) but I think it would
also mean fragmenting the test suite definition.


* storing the results

Right now the kernelci-backend API has a built-in Mongo database.
As previously discussed, it would seem good to be able to replace
the database with any engine and keep the logic we have as a
separate service.  That way, we could still use our
kernelci-specific code that tracks regressions, triggers
bisections, sends emails etc... but also enable arbitrary
searches and direct access to the test data.


I think that covers the main aspects of the problem, now we
probably have a few solutions to look for.  Overall, it would
seem like a good idea to describe a "reference" workflow based on
LAVA with a standard format for test results etc...  Still we
have to allow non-LAVA labs and other test frameworks to
contribute to KernelCI especially as new members are likely to be
joining the LF project with their own mature test infrastructure.

Does anyone see anything important missing here?  We could start
a wiki page to explain what the reference workflow would look
like.

Cheers,
Guillaume
