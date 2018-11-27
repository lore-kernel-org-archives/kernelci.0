Return-Path: <khilman@baylibre.com>
From: "Kevin Hilman" <khilman@baylibre.com>
Subject: Re: [kernelci] Dealing with test results
In-Reply-To: <CAJrz+7+YGrzKRYVA_MaTgQqZTmUZyJU=EDTdqR0uqusyC3bKpQ@mail.gmail.com>
References: <787f38db-ee04-071a-ee79-8bee6c78fe7c@collabora.com> <CAJrz+7+YGrzKRYVA_MaTgQqZTmUZyJU=EDTdqR0uqusyC3bKpQ@mail.gmail.com>
Date: Tue, 27 Nov 2018 14:57:21 -0800
Message-ID: <7hwooyi0xa.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
List-ID: <kernelci.groups.io>
To: Milosz Wasilewski <milosz.wasilewski@linaro.org>, kernelci@groups.io

"Milosz Wasilewski" <milosz.wasilewski@linaro.org> writes:

> On Mon, 12 Nov 2018 at 13:58, Guillaume Tucker
> <guillaume.tucker@gmail.com> wrote:
>>
>> A recurring topic is how to deal with test results, from the
>> point in the test code where they're generated to how the result
>> is stored in a database.  This was brought up again during last
>> week's meeting while discussing kernel warnings in boot tests, so
>> let's take another look at it and try to break it down into
>> smaller problems to solve:
>>
>>
>> * generating the test results
>>
>> Each test suite currently has its own way of generating test
>> results, typically with some arbitrary format on stdout.  This
>> means a custom parser for each test suite, which is tedious to
>> maintain and error-prone, but a first step at getting results.
>> In some cases, such as boot testing, there isn't any real
>> alternative.
>>
>> There are however several standards for encoding test results, I
>> think this is being discussed quite a lot already (LKFT people?).
>
> from my experience there are as many formats as test suites out there :)
> However it might be a good idea to try to output in some 'standard'
> way. TAP13 seems to be a fairly well defined format that is both human
> and machine readable. IIUC there were some efforts to enable TAP13 in
> kselftets. It would also make offline parsing a bit easier.
>
>> There's also a thread on linux-media about this, following the
>> work we've done with them to improve testing in that area of the
>> kernel:
>>
>>   https://www.spinics.net/lists/linux-media/msg142520.html
>>
>> The bottom line is: we need a good machine-readable test output
>> format try to align test suites to be compatible with it.
>>
>>
>> * handling the test results
>>
>> The next step is about writing the results somewhere: on the
>> console, in a file, or even directly to a remote API.  Some
>> devices may not have a functionarl network interface with access
>> to the internet, so it's hard to require the devices to push
>> results directly.  The least common denominator is that the
>> results need to eventually land in the database, so how they get
>> there isn't necessarily relevant.  It is useful though to store
>> the full log of the job to do some manual investigation later on.
>>
>
> I would go with console or file as other media might not be available
> for all use cases.
>
>>
>> * importing the results
>>
>> This is the crucial part here in my opinion: turning the output
>> of a test suite into results that can be stored into the
>> database.  It can be done in several places, and how to do it is
>> often directly linked to the definition of the test: the format
>> of the results may depend on options passed when calling the test
>> etc...
>>
>> The standard way to do this with LAVA is to call "lava-test-case"
>> and "lava-test-set" while the test is running on the device, then
>> have the resulting data sent to a remote API via the callback
>> mechanism.  This seems to be working rather well, with some
>> things that can probably be improved (sub-groups limited to 1
>> level, noise in the log with LAVA messages...).
>
> using lava-test-case locks you into LAVA and makes it hard for others
> to reproduce your results.
>
>>
>> Another place where this could be done is on a test server,
>> between the device and the database API.  In the case of LAVA,
>> this may be the dispatcher which has direct access to the device.
>> I believe this is how the "regex" pattern approach works.  The
>> inconvenient here is that the test server needs to have the
>> capability to parse the results, so doing custom things may not
>> always be possible.
>>
>> Then it's also possible in principle to send all the raw results
>> as-is to a remote API which will parse it itself and store it in
>> the database directly.  The difference with what we're doing with
>> the LAVA callback is that it provides the pass/fail data for each
>> test case already populated.  It seems to me that adding more
>> parsing capability in the backend is only sustainable if the
>> results are provided in a structured format, as having test-suite
>> specific parsers in the backend is bound to break when the test
>> suites change.
>
> I would go with processing the results 'offline' after all logs were
> collected. This means that result processing is done somewhere in
> kernelCI backend. The workflow would look sth like:
> 1. execute the test and collect the raw logs (output files)
> 2. save the raw logs/output files somewhere (kernelCI db?)

This step give me anothe opportunity to argue for fluentd:
https://www.fluentd.org/

Expecially for this step, we should not try to reinvent the wheel.
Tools like fluentd were written exactly for the problem of unifiying the
log/data colletion from a wide variety of inputsources, in order to be
processed by higher level tools (databases, elasticsearch, distributed
storage, etc. etc.)

> 3. process the results using the parser obtained from the test suite
>
> This approach assumes that each test suite contains some parser that
> allows to translate from log or human readable output to machine
> readable format.

Or that fluentd would grow a "data sources"[1] plugin to understand any
new formats and do basic parsing and collecting.

Once the raw data is in fluentd, it's then available for any of the
fluentd "data outputs"[2].

Of particular interest with fluent is that the data can be consumed by
multiple "data sources".  e.g. We could do basic storage/backup to
Hadoop or AWS, but also have more sophisticaed search and visualization
using elasticsearch+Kibana.

> Again TAP13 seems a handy approach. Also this kind of
> approach was recently discussed at ELC-E (automated testing summit).

Full ack.  A TAP13 data sources plugin might be a good first project for
fluentd.

Kevin

[1] https://www.fluentd.org/datasources
[2] https://www.fluentd.org/dataoutputs

