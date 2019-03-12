Return-Path: <khilman@baylibre.com>
From: "Kevin Hilman" <khilman@baylibre.com>
Subject: Re: staging projects in github
In-Reply-To: <CAH1_8nC=aa9jOa1rTzb7=joDXqjTDty+qeGe4bqpE11fqOgN-A@mail.gmail.com>
References: <7himwxvr6m.fsf@baylibre.com> <CAH+k93EBGwnAbwvCDF3PmaCvS+Fpk6FTVtgdB37h-twqZf4hvQ@mail.gmail.com> <20190305170426.4kuzc4fq7fmvoeud@xps.therub.org> <15891FEF165BAE41.4955@groups.io> <CAH1_8nC=aa9jOa1rTzb7=joDXqjTDty+qeGe4bqpE11fqOgN-A@mail.gmail.com>
Date: Tue, 12 Mar 2019 10:47:16 -0700
Message-ID: <7hr2bct26z.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
List-ID: <kernelci.groups.io>
To: Guillaume Tucker <guillaume.tucker@gmail.com>, kernelci@groups.io, Guillaume Tucker <guillaume.tucker@gmail.com>
Cc: Dan Rue <dan.rue@linaro.org>, Matt Hart <matthew.hart@linaro.org>

Guillaume Tucker <guillaume.tucker@gmail.com> writes:

> On Tue, Mar 5, 2019 at 5:24 PM Guillaume Tucker via Groups.Io
> <guillaume.tucker=gmail.com@groups.io> wrote:
>
>>
>> On Tue, Mar 5, 2019 at 5:04 PM Dan Rue <dan.rue@linaro.org> wrote:
>>
>>> On Tue, Mar 05, 2019 at 04:48:52PM +0000, Matt Hart wrote:
>>> > On Tue, 5 Mar 2019 at 05:14, Kevin Hilman <khilman@baylibre.com> wrote:
>>> > >
>>> > > Can we consolidate the various "-staging" project in github with the
>>> > > originals?  I've never fully understood why we created separate github
>>> > > projects, when we should just be using a staging branch within the
>>> main
>>> > > project.
>>
>> [...]
>
>> I'm not sure if I'm considering all of the use-cases, but in the past
>>> I've much preferred having staging == "master" and then tagging for
>>> production releases. This does make it difficult (but not impossible) to
>>> have things in staging that are not promoted to production.
>>>
>>
>> What would make most sense imo would be to have the master branch
>> receiving the PRs (like Dan wrote) and a live "prod" branch used
>> by Jenkins.
>>
>
> So how about having one last staging -> prod sync this week using
> the kernelci-core-staging project, and then switch to using
> kernelci-core only starting from next week?

Sounds good to me.

Kevin

