Subject: Re: KernelCI backend redesign and generic lab support
References: <a78c7329-36dd-185e-5c3e-ec90686ad7d3@collabora.com>
 <20210413025408.GJ1538589@yoga>
From: "Guillaume Tucker" <guillaume.tucker@collabora.com>
Message-ID: <faadff29-7365-15ac-6269-28026086bb27@collabora.com>
Date: Tue, 19 Oct 2021 12:42:12 +0100
MIME-Version: 1.0
In-Reply-To: <20210413025408.GJ1538589@yoga>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
List-ID: <kernelci.groups.io>
To: Bjorn Andersson <bjorn.andersson@linaro.org>, kernelci@groups.io
Cc: ticotimo@gmail.com, Nikolai Kondrashov <Nikolai.Kondrashov@redhat.com>, Michael Grzeschik <m.grzeschik@pengutronix.de>, santiago.esteban@microchip.com, automated-testing@lists.yoctoproject.org, =?UTF-8?Q?Jan_L=c3=bcbbe?= <j.luebbe@pengutronix.de>, =?UTF-8?B?TWljaGHFgiBHYcWCa2E=?= <michal.galka@collabora.com>

On 13/04/2021 03:54, Bjorn Andersson wrote:
> On Fri 05 Mar 14:55 CST 2021, Guillaume Tucker wrote:
> 
>> Hello,
>>
> 
> Hi Guillaume,
> 
> Sorry for taking the time to give you some feedback on this.

No worries, it's a long-term redesign :)

The good news is that we've now got something off the ground with
the new KernelCI API project:

  https://github.com/kernelci/kernelci-api

See below some notes based on the initial ideas in this thread.
The proof-of-concept has helped shed some light on a few things,
now I think there's enough to start designing things in a way
that would overcome the limitations of the current
kernelci-backend.

It seems like a great opportunity for new people to start
contributing and to really make it a collaborative work.  We
could have a hackfest dedicated to it in a few months' time.
There is also an Outreachy project about it, with a few
candidates already contributing:

  https://www.outreachy.org/outreachy-december-2021-internship-round/communities/kernelci/create-new-kernelci-api/cfp/

While kernelci-backend is entirely monolithic, this new
architecture should be very modular with more logic on the client
side.  This should facilitate people working on different things
in parallel.

Feel free to join any of the weekly calls to discuss this, every
Tuesday at 17:00 BST (https://meet.kernel.social/kernelci-dev).

>> As it has been mentioned multiple times recently, the
>> kernelci-backend code is ageing pretty badly: it's doing too
>> many things so it's hard to maintain, there are better ways to
>> implement a backend now with less code, and it's still Python
>> 2.7.  Also, there is a need to better support non-LAVA labs such
>> as Labgrid.  Finally, in order to really implement a modular
>> KernelCI pipeline, we need a good messaging system to
>> orchestrate the different components - which is similar to
>> having a generic way to notify labs about tests to run.  For all
>> these reasons, it's now time to seriously consider how we should
>> replace it with a better architecture.
>>
>> I've gathered some ideas in this email regarding how we might go
>> about doing that.  It seems like there are several people
>> motivated to help on different aspects of the work, so it would
>> be really great to organise this as a community development
>> effort.
>>
>> Please feel free to share your thoughts about any of the points
>> below, and tell whether you're interested to take part in any of
>> it.  If there appears to be enough interest, we should schedule
>> a meeting to kick-start this in a couple of weeks or so.
>>
>>
>> * Design ideas
>>
>>   * REST API to submit / retrieve data
>>     * same idea as existing one but simplified implementation using jsonschema

Actually, the new design is using FastAPI which relies on
Pydantic and OpenAPI.  This provides validation of the data
schema, automatically generated API documentation and
interoperability with other web services.

>>     * auth tokens but if possible using existing frameworks to simplify code

FastAPI provides OAuth2 support, that's what the new design is
using.  It's based on username / password accounts but tokens can
be used too (JWT).  It also means we could use third-party
authentication e.g. GitHub...

>>   * interface to database
>>     * same idea as now but with better models implementation

That's where Pydantic comes into play, and it's a key part of
FastAPI which can directly validate incoming data and create
objects following Pydantic models.

Also, FastAPI relies on the asynchronous features provided
natively by Python 3 which we can use with Redis and Mongo DB via
the aioredis and motor Python packages.  This means we can have
the same benefits as Celery but without the added complexity of
managing tasks "by hand".  It also means the client can be
blocked and get an HTTP error if the async task failed without
blocking any backend threads.  That's an advantage compared to
the current Celery-based solution, where the client gets an HTTP
202 right away when the task starts but never gets to know if the
task failed later on.

>>   * pub/sub mechanism to coordinate pipeline with events
>>     * new feature, framework to be decided (Cloud Events? Autobahn?)

I just made a PR for this:

  https://github.com/kernelci/kernelci-api/pull/7

See the README on the incoming branch with some examples of how
to use it.  It's based on Redis, but with the authentication
provided by FastAPI.  It's using CloudEvents to format the
messages in a standard way, which should help interacting with
other web services that also use CloudEvents (I guess it's
becoming a standard but I don't know how widespread it is yet).

>>     * no logic in backend, only messages

By "no logic", this means keeping things such as email
notifications, regression tracking, job submission, log parsing
all on the client side.  I think this is still a valid principle.

>>     * send notifications when things get added in database

The idea is that the backend will provide some basic mechanism to
generate event messages when events occur (e.g. when some data is
being pushed to it) in a systematic way and without any actual
application logic.  I believe this makes more sense than having
every client submit both data _and_ an event to say it has
submitted some data, since this should be entirely deterministic.

> My current approach for lab-bjorn is to poll the REST api from time to
> time for builds that matches some search criteria relevant for my boards
> and submit these builds to a RabbitMQ "topic" exchange. Then I have
> individual jobs per board that consumes these builds, run tests and
> submits test results in a queue, which finally is consumed by a thing
> that reports back using the REST api.
> 
> The scraper in the beginning works, but replacing it with a subscriber
> model would feel like a better design. Perhaps RabbitMQ is too low
> level? But the model would be nice to have.

This is of course one of the main use-cases for the new pub/sub
mechanism.  It should in fact be a generic way of triggering
anything: builds, tests, data post-processing, email reports...

Please feel free to compare the proposed solution based on Redis
and FastAPI with other frameworks, it's still very easy to move
things around at this stage of development.

>> * Client side
>>
>>   Some features currently in kernelci-backend should be moved to client side
>>   and rely on the pub/sub and API instead:
>>
>>   * LAVA callback handling (receive from LAVA, push via API)
>>   * log parsing (subscribe to events, get log when notified, send results)

As I already mentioned above, this still seems valid to me.

> Since I moved to the REST api for reporting, instead of faking a LAVA
> instance, I lost a few details - such as the LAVA parser generating html
> logs. Nothing serious, but unifying the interface here would be good.

Absolutely.

Best wishes,
Guillaume
