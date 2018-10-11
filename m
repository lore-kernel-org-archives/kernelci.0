Return-Path: <khilman@baylibre.com>
From: "Kevin Hilman" <khilman@baylibre.com>
Subject: Re: [kernelci] KernelCI NG master plan
References: <CAJrz+7+ey-o8xEa9G_dkKzCz+HjGPLvf+jP9gC4ntt5VN8WFXw@mail.gmail.com>
	<CAH1_8nDQ7D77QHtHkKiBLNkwaS5TgMOWB=HOAzJ3ayzC9QDv4Q@mail.gmail.com>
Date: Thu, 11 Oct 2018 13:49:26 +0200
In-Reply-To: <CAH1_8nDQ7D77QHtHkKiBLNkwaS5TgMOWB=HOAzJ3ayzC9QDv4Q@mail.gmail.com>
	(Guillaume Tucker's message of "Thu, 11 Oct 2018 09:31:16 +0100")
Message-ID: <7h7eioput5.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
List-ID: <kernelci.groups.io>
To: Guillaume Tucker <guillaume.tucker@gmail.com>
Cc: kernelci@groups.io, charles.oliveira@linaro.org

"Guillaume Tucker" <guillaume.tucker@gmail.com> writes:

> On Fri, Oct 5, 2018 at 1:19 PM Milosz Wasilewski <
> milosz.wasilewski@linaro.org> wrote:
>
>> Hi,
>>
>> This is follow up to the discussion we had on Monday meeting. The idea
>> was also discussed at Linaro Connect in Vancouver so should not come
>> as a surprise.
>>
>> The problem:
>> As we want to present test results filtering becomes an issue. There
>> are different users with different filtering needs. Current
>> implementation at kernelci.org sorts tests results by board.
>>
>> Alternative implementation by Baylibre [1] sorts by build. There can
>> be countless other options for filtering tests and for each of them
>> someone would have to code that in the backend and frontend.
>>
>> Proposed solution:
>> Replace backend with 'search engine'. Current proposals for the search
>> engines are: elastic search, graylog. But we're not limited to them.
>> One of the frontends should be a configurable dashboard (like Kibana
>> for ES).
>>
>
> Following what I mentioned during the meeting this Monday, it
> would seem worthwhile separating the logic that processes
> incoming test results from the actual data storage in our current
> kernelci-backend.  This would make it possible to keep using the
> same code to parse LAVA callback data, generate email reports,
> trigger automated bisections and keep developing this while other
> parts of the system are moving.
>
> Essentially, rather than storing data in MongoDB, it would be
> abstracted in order to be able to replace it with an arbitrary
> data storage service which may be remote (Elasticsearch,
> SQUAD...).

This is what I was thinking too.

But, I think we should take it one step further and use some existing
open-source tooling for this rather than come up with our own
abstraction.

I've been looking closely at fluentd[1] since it seems widely used in
distributed web apps and the kubernetes universe, and is also an
official project of the LF cloud-native compute foundation (CNCF).  It
also already supports a bunch of storage/search (including mongodb,
elasticsearch, hadoop, etc.)  The Elastic ecosystem also has somethingy
they call "beats" that's similar to fluentd, but I'm not sure how
broadly that's used outside of their ecosystem.

One thing I really like about fluentd, is that there's also "fluent bit"
which is a tiny client we could even run directly on the DUTs and
collect a lot more data than what we get from just LAVA (e.g
CPU/memory/disk usage, network stats, /proc, syslog, systemd, etc[3])

To add LAVA support to all of that nice stuff, To support LAVA jobs in
fluentd, we'd simply need to write a plugin that knows about LAVA
formats (and lava-test-shell), but we could take advantage of the rest
of the fluentd universe "for free."

> We're already using abstract model classes in the
> backend, so I think it's mostly the case of implementing
> alternative database I/O handlers.  The assumption is that data
> exchanges would only occur when receiving new data, so there
> shouldn't be too much traffic.  It would however be quite
> inefficient if a client service was still going through the
> existing kernelci-backend API to retrieve data as each request
> would generate more traffic with the actual storage service.
>
>
>> Current frontend will have to stay, so it needs to be migrated to new
>> backend. If we move from redis-mongo to ES for example this would only
>> require changing search criteria (they're most likely not compatible).
>>
>> Scope of the project:
>> 1. get the list of possible backends (search engines)
>> 2. get the list of possible configurable dashboards (Kibana etc.)
>> 3. create proof of concept for new solution (with existing data) and
>> present for discussion

A while ago, I've done a (very) basic PoC using ELK (more on that
below.)  But before we go too much further down that path, I think step
0.5 is to rethink the data abstraction and tooling as I mentioned above.

Using someting like fluentd also means we don't have to come up with our
own data formats/structure and abstractions that suit the various
storage backends because that's already taken care of.

> How about listing pros and cons with each option to justify which
> ones were chosen and maybe open this for discussion?
>
> Once we get here, following steps might be:
>>
>> 4. select search engine to be used
>> 5. start pushing data to both old and new backends
>>
>
> This may be done by still writing results in a local MongoDB and
> forwarding them to another storage engine from the code that
> handlers test results, rather than posting the results
> twice (based on what I explained earlier with splitting the
> kernelci-backend code).

FWIW, the backend already dumps the "raw" JSON that comes from the LAVA
callbacks (e.g. see the lava-json*.json) files[4], so it's already
pretty easy to forward the raw data to another engine.

I've already been using that raw data and ingesting that into
elasticsearch (via logstash) in order to do some basic experiments with
Kibana dashboards.  For example, knowing very little about kibana, it
only took me ~1h to write this basic dashboard:
http://kernelci.dev.baylibre.com:5601/goto/ff8bb29fd1479a7aaf23d5e4436badc2
That's a *lot* faster than it would take anyone to write a new UI for
the current frontend.

Doing this has convinced me that elasticsearch + kibana are quite
powerful, but it still requires having a good data abstraction before
ingesting the data.  The current way I did it is a hack, and limits the
ways I can handle the data, so I really think it's worth investing in
existing, open-source tooling for collecting (and forwarding) our raw
data.

Kevin

[1] https://www.fluentd.org/
[2] https://fluentbit.io/
[3] https://docs.fluentbit.io/manual/input
[4] e.g. https://storage.kernelci.org/mainline/master/v4.19-rc7/arm64/defconfig/lab-baylibre/lava-json-meson-gxbb-p200.json
