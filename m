From: "Guillaume Tucker" <guillaume.tucker@collabora.com>
Subject: KernelCI backend redesign and generic lab support
Message-ID: <a78c7329-36dd-185e-5c3e-ec90686ad7d3@collabora.com>
Date: Fri, 5 Mar 2021 20:55:22 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
List-ID: <kernelci.groups.io>
To: =?UTF-8?B?TWljaGHFgiBHYcWCa2E=?= <michal.galka@collabora.com>, ticotimo@gmail.com, Nikolai Kondrashov <Nikolai.Kondrashov@redhat.com>, Michael Grzeschik <m.grzeschik@pengutronix.de>, santiago.esteban@microchip.com, =?UTF-8?Q?Jan_L=c3=bcbbe?= <j.luebbe@pengutronix.de>
Cc: "kernelci@groups.io" <kernelci@groups.io>, automated-testing@lists.yoctoproject.org

Hello,

As it has been mentioned multiple times recently, the
kernelci-backend code is ageing pretty badly: it's doing too
many things so it's hard to maintain, there are better ways to
implement a backend now with less code, and it's still Python
2.7.  Also, there is a need to better support non-LAVA labs such
as Labgrid.  Finally, in order to really implement a modular
KernelCI pipeline, we need a good messaging system to
orchestrate the different components - which is similar to
having a generic way to notify labs about tests to run.  For all
these reasons, it's now time to seriously consider how we should
replace it with a better architecture.

I've gathered some ideas in this email regarding how we might go
about doing that.  It seems like there are several people
motivated to help on different aspects of the work, so it would
be really great to organise this as a community development
effort.

Please feel free to share your thoughts about any of the points
below, and tell whether you're interested to take part in any of
it.  If there appears to be enough interest, we should schedule
a meeting to kick-start this in a couple of weeks or so.


* Design ideas

  * REST API to submit / retrieve data
    * same idea as existing one but simplified implementation using jsonschema
    * auth tokens but if possible using existing frameworks to simplify code

  * interface to database
    * same idea as now but with better models implementation

  * pub/sub mechanism to coordinate pipeline with events
    * new feature, framework to be decided (Cloud Events? Autobahn?)
    * no logic in backend, only messages
    * send notifications when things get added in database


* Client side

  Some features currently in kernelci-backend should be moved to client side
  and rely on the pub/sub and API instead:

  * LAVA callback handling (receive from LAVA, push via API)
  * log parsing (subscribe to events, get log when notified, send results)
  * email reports (subscribe to events, generate reports and send directly)
  * KCIDB bridge (subscribe to events, forward to KCIDB API)

  About getting tests to run in labs, this could then be unified
  to in fact deal with LAVA labs in the same way as non-LAVA
  ones.  At the moment, the Jenkins pipeline knows when builds
  are completed and directly schedules LAVA jobs to run.
  Instead, we should have a service listening to events to know
  when builds are available, and schedule LAVA jobs then.  Other
  labs could do that too, by receiving the same events but then
  performing actions that are specific to their own
  implementation.  For common ones such as LabGrid and
  Kubernetes, some code could be added to kernelci-core like we
  currently have for LAVA to facilitate translating KernelCI
  events into "lab dialects".

  About emails, we could also have a micro-service listening for
  emails such as replies to reports previously sent (say, to
  automatically change the status of a tracked regression...) or
  for specific ones such as stable reviews.


* Implementation ideas

  The current Python 2.7 implementation uses Tornado as the web
  framework, Redis for object caching and locking, Celery for
  asynchronous processing and interfaces with MongoDB.  Here's
  what I propose to do:

  * start new design using Python 3.x (minor version TBD) using current one as
    reference rather than doing a straight port

  * keep Tornado as the web framework since it still has a good community and
    is well suited for backend applications

  * keep Redis for caching and locking, but also use it for the pub/sub
    mechanism provided out of the box (we may host it on Azure)

  * see if we really need to keep Celery when we have client-side services

  * keep MongoDB as it's been working well for us, also to reduce the effort
    with the new design and have the ability to directly import existing data
    (we may host it in Azure)

  * separate the "storage" server from the backend, as it currently relies on
    it to be on the same host which is causing bad design and unnecessary
    dependencies (the backend shouldn't even need to read anything from
    storage, only client code would be doing this using URLs stored in the
    database)

  * use the "kernelci" Python package from kernelci-core to define common code
    as appropriate such as YAML configuration handling and JSON schema
    validation, to be shared between the backend and client code


* Schema

  The current schema has worked well for many years, but it has
  also become inconsistent and hard to maintain.  For example,
  the names of the fields are getting translated in several
  places from "tree" to "job", from "kernel" to "git_describe",
  from "build_environment" to "compiler"...  So it needs a big
  refresh.

  Also, one important thing to consider would be to have common
  object properties for all the database entries so we could
  make a tree structure with them.  For example, tests may
  depend on other tests and also on builds, and also on
  revisions.  Pretty much like object inheritance, we could have
  a basic "type" and then derivatives such as build and test.
  So I think we should take this opportunity to start with a new
  schema design, taking inspiration from the current one and
  what has been done with KCIDB in terms of content.

  It would somehow relate to the YAML configuration where
  dependencies should be better expressed (i.e. run this test
  once this build has completed, and this other test once the
  first test has completed...).  This is the same dependency
  tree as in the results, just without the runtime details and
  actual results.

  All this would deserve a discussion of its own, and I think we
  should start with an over-simplified schema to get the
  components up and running with the new design.


* Development

  It would seem like the different pieces can be worked on in
  parallel to some extent, so it would be good to create a
  backlog on GitHub to define some high-level objectives
  accordingly.  Then people who are interested can assign issues
  to them.

  We should try to have this working in Docker from the start,
  to it easier for all the contributors to have a a compatible
  environement and also to actually deploy it.  We can run an
  instance of it on staging.kernelci.org with an alternative
  port number than the current REST API.

  I believe it should be fine to ignore the web frontend
  initially, we can then adjust it to make it use the newly
  designed API.  We however have to keep its use-case in mind
  and the type of queries it would be typically making.  We may
  have a minimal frontend instance reworked with only one view
  as a basic end-to-end test.


How does that all sound?

Have a good week-end!

Best wishes,
Guillaume
