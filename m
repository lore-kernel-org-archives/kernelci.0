MIME-Version: 1.0
References: <CAJrz+7+ey-o8xEa9G_dkKzCz+HjGPLvf+jP9gC4ntt5VN8WFXw@mail.gmail.com>
 <CAH1_8nDQ7D77QHtHkKiBLNkwaS5TgMOWB=HOAzJ3ayzC9QDv4Q@mail.gmail.com>
In-Reply-To: <CAH1_8nDQ7D77QHtHkKiBLNkwaS5TgMOWB=HOAzJ3ayzC9QDv4Q@mail.gmail.com>
From: "Milosz Wasilewski" <milosz.wasilewski@linaro.org>
Date: Thu, 11 Oct 2018 10:43:13 +0100
Message-ID: <CAJrz+7JpTapeJGYn1yU83xpbL7s+tNNvbJ3_JphbOs92J15YkA@mail.gmail.com>
Subject: Re: [kernelci] KernelCI NG master plan
Content-Type: text/plain; charset="UTF-8"
List-ID: <kernelci.groups.io>
To: kernelci@groups.io
Cc: Charles Oliveira <charles.oliveira@linaro.org>

On Thu, 11 Oct 2018 at 09:31, Guillaume Tucker
<guillaume.tucker@gmail.com> wrote:
>
>
>
> On Fri, Oct 5, 2018 at 1:19 PM Milosz Wasilewski <milosz.wasilewski@linaro.org> wrote:
>>
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
>
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
> SQUAD...).  We're already using abstract model classes in the
> backend, so I think it's mostly the case of implementing
> alternative database I/O handlers.  The assumption is that data
> exchanges would only occur when receiving new data, so there
> shouldn't be too much traffic.  It would however be quite
> inefficient if a client service was still going through the
> existing kernelci-backend API to retrieve data as each request
> would generate more traffic with the actual storage service.

Sounds pretty much how I think it should be done. It might be a slight
problem for the existing UI as it routes all queries through backend.
But IMHO that's something that can be discussed later. Current API
towards frontend can be kept intact for some time. What needs to be
changed is abstraction of DB layer. I guess we're on the same page
here.

>
>>
>> Current frontend will have to stay, so it needs to be migrated to new
>> backend. If we move from redis-mongo to ES for example this would only
>> require changing search criteria (they're most likely not compatible).
>>
>> Scope of the project:
>> 1. get the list of possible backends (search engines)
>> 2. get the list of possible configurable dashboards (Kibana etc.)
>> 3. create proof of concept for new solution (with existing data) and
>> present for discussion
>
>
> How about listing pros and cons with each option to justify which
> ones were chosen and maybe open this for discussion?

Yes, totally agree.
I did some research in the area of 'log storing' and it turns out
there are 2 major competitors - MongoDB and Elastic Search. So not
much to choose from :)

>
>> Once we get here, following steps might be:
>>
>> 4. select search engine to be used
>> 5. start pushing data to both old and new backends
>
>
> This may be done by still writing results in a local MongoDB and
> forwarding them to another storage engine from the code that
> handlers test results, rather than posting the results
> twice (based on what I explained earlier with splitting the
> kernelci-backend code).

Hmm, I'm not sure it's worth the effort. Adding another callback in
LAVA jobs sounds much cheaper. This is however an 'implementation
detail'. I wanted to highlight the idea that the transition from 'old'
to 'new' should be gradual with some period of overlap.

>
>>
>> 6. migrate current frontend to the new backend
>
>
> And this should hopefully mean we can shrink the API on
> kernelci-backend to only post data and schedule email reports.

Ideally yes, but as I explained above it might require some period
when both methods are present.

>
>>
>> 7. enable configurable dashboard for the search engine
>> 8. prepare set of predefined dashboards that should cover 90% of use
>> cases (mainly for test results)
>
>
> It sounds like we would need to do a study and have a clear
> picture of the use-cases before we can claim we cover 90% of
> them.  Do we already have this somewhere?

I took the 90% figure out of thin air. I guess the predefined
dashboards should include most looked for features reported/requested
on ML. Beside that I hope adding new dashboards will be cheap enough
that we won't have to worry about creating a couple of 'not-so-useful'
ones.

milosz

>
>> Any comments are welcome. Together with Charles we're starting on 1-3 next week.
>>
>> [1] http://kernelci.dev.baylibre.com:8080/test-build/
>>
>> Best Regards,
>> milosz
>>
>>
>>
> 
