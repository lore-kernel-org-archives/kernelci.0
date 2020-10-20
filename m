Return-Path: <khilman@baylibre.com>
From: "Kevin Hilman" <khilman@baylibre.com>
Subject: Re: RFC: dashboards, visualization and analytics for test results
In-Reply-To: <CAKwvOdks7ih0yaVKPtnUzCRNs=VE6uRNtjRt9beH=tWbVpu8gw@mail.gmail.com>
References: <7hk0w2c4i3.fsf@baylibre.com> <CAKwvOdks7ih0yaVKPtnUzCRNs=VE6uRNtjRt9beH=tWbVpu8gw@mail.gmail.com>
Date: Tue, 20 Oct 2020 14:39:13 -0700
Message-ID: <7h8sc0k266.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
List-ID: <kernelci.groups.io>
To: Nick Desaulniers <ndesaulniers@google.com>, kernelci@groups.io

Nick Desaulniers <ndesaulniers@google.com> writes:

> On Wed, Oct 7, 2020 at 10:47 AM Kevin Hilman <khilman@baylibre.com> wrote:
>>
>> Hello folks interested in kernel testing/automation,
>>
>> The KernelCI project is starting to look at what's next for dashboards,
>> visualization and analytics for the various Linux focused testing
>> projects.
>>
>> At Linux Plumbers, we launched some discussions[1] around common ways to
>> collect test results, logs and metadata into a public, shared dataset,
>> and we've already started collecting data from several different
>> sources.
>>
>> So the next question is... how do we best use all of this data?
>>
>> We're beginning to brainstorm how to visualize, analyze and learn from
>> this data in useful ways.
>>
>> To that end, we're starting to collect a set of user stories to help us
>> brainstorm a new design for web based dashboard and analytics, and we'd
>> like to hear from you.
>>
>> Below is the start of a list of user stories[2], but we want to grow
>> this list with your ideas, so please share them on this thread.
>>
>> We're also very interested in talking with any big data people and data
>> scientists who might be willing to look at this growing set of data and
>> help us better plan for the future full of lots of test data.
>>
>> We appreciate your ideas and feedback,
>>
>> Kevin (on behalf of the KernelCI team)
>>
>>
>> [1] c.f. Unifying Test Reporting with KernelCI from the testing/fuzzing
>>     micro-conference:
>>     https://linuxplumbersconf.org/event/7/sessions/80/#20200826
>>
>>
>>
>> [2] Example user stories
>
> additional user story:
>
> A developer wants to slice and dice warnings by toolchain and
> toolchain version to see what errors or warnings are compiler
> specific/need to be fixed.

Excellent, thanks!

Kevin
