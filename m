Return-Path: <Nikolai.Kondrashov@redhat.com>
Subject: Re: #KCIDB engagement report
References: <5a9bf050-0671-3273-cc4f-1b131445c1fe@redhat.com>
 <CAKwvOdmwRV6R6dcpcSL06SNVQ1_JwvOJMZPYiHKvjSx4sf_95g@mail.gmail.com>
 <d4c587c2-7eca-043f-06b3-7e1cfa125b38@gmail.com>
 <CAKwvOdkFqFoNUczEiTKY6o2E78bHLkMjeHjtQWKm=Qdg7-v26Q@mail.gmail.com>
 <0e70beb7-49fe-efba-ef41-a35fa996bdcf@redhat.com>
 <CAKwvOdkoCzf2+-Z2K8e22OF9odo21RxXJu3gkGxweSePoBRaVg@mail.gmail.com>
From: "Nikolai Kondrashov" <Nikolai.Kondrashov@redhat.com>
Message-ID: <c64167f2-23e7-4efa-4945-6398bf99683c@redhat.com>
Date: Thu, 10 Jun 2021 12:15:30 +0300
MIME-Version: 1.0
In-Reply-To: <CAKwvOdkoCzf2+-Z2K8e22OF9odo21RxXJu3gkGxweSePoBRaVg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
List-ID: <kernelci.groups.io>
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Nikolai Kondrashov <spbnick@gmail.com>, kernelci@groups.io, "automated-testing@yoctoproject.org" <automated-testing@yoctoproject.org>, clang-built-linux <clang-built-linux@googlegroups.com>, Vishal Bhoj <vishal.bhoj@linaro.org>, Antonio Terceiro <antonio.terceiro@linaro.org>, Remi Duraffort <remi.duraffort@linaro.org>

Hi Nick,

 > Cool.  Some notes from playing around with it:
 > - might need to de-duplicate
 > git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git vs
 > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git

We have a preference for https:// URLs in the schema, but sometimes submitters 
overlook that, and submit git:// anyway. It's a catch-up game, and I ping 
submitters when I see this happening, later fixing URLs in the database.

Similar thing happens with other fields (e.g. architecture). We'll be 
tightening the requirements as we converge on a common, better defined schema, 
but for now permissible schema (and messy data) allows us to ramp up 
participation quickly.

 > - consider sorting list of branches in drop down

They were sorted in descending order to have things like queue/5.9 on top, but 
I switched that to ascending, as that's more universal and easier to understand.

 > - "tuxsuite" seems to get truncated to "..." for me.

I assume you mean the "Origin" cell in the "Revisions" table. I substitute ". 
. . . ." for origin, when there's more than one, as more than one wouldn't fit 
the table. Full list is shown when you open the revision. You can also use the 
"Origin" filter on top of the page, if you're looking for data from specific 
origin.

 > - builds over time are useful, but it would be more empowering to know
 > which of those builds were green vs red.

Yes, I was thinking about that as well.

I added graphs for build status, as well as test status, over time, to the 
"Home", "Repository", and "Branch" dashboards. However, please be aware, that 
those are results over time the *result* was produced, not commit order. 
Strictly speaking, that can be any order, and results for some older commits 
might pop up e.g. a couple days later. Normally, though, they wouldn't, and 
there's some use in these graphs.

We don't have commit order/connectivity data in the database (at least yet), 
so this is the best I can do so far.

I also added a few basic graphs to the "Revision" dashboard, please tell me if 
any of those are useful.

Thanks for the feedback and the requests.
Give me some more, if you have them :)
Nick

On 6/7/21 9:09 PM, Nick Desaulniers wrote:
> On Mon, Jun 7, 2021 at 4:13 AM Nikolai Kondrashov
> <Nikolai.Kondrashov@redhat.com> wrote:
>>
>> Hi Nick,
>>
>>   >> We don't have a ready-made UI for this, but I think I can add a Grafana
>>   >> panel/dashboard for that rather quickly. What would be most helpful?
>>   >
>>   > I think so.
>>   >
>>   > For a given tuple of (tree, branch, configuration), it would be neat
>>   > to be able to link to a deterministic URL to quickly check who else
>>   > may have built this recently, and what was the result.
>>
>> I made a stab at it. I added "Repository" and "Branch" dashboards, showing
>> revisions for a particular repository and branch respectively. They are
>> accessible from the dropdown menu in the top left corner.
>>
>> Repositories are also linked from the "Home" dashboard, branches - from
>> "Repository" dashboard, and both are linked from "Revision" dashboard.
>>
>> Additionally, "Home", "Repository", "Branch", and "Revision" dashboards now
>> allow filtering builds by architecture and configuration name. Please be aware
>> that neither are really standardized across submitters yet.
>>
>> Finally, whoever is reading this, please be aware of the time range selector
>> in the top right corner. It affects every dashboard.
> 
> Cool.  Some notes from playing around with it:
> - might need to de-duplicate
> git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git vs
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
> - consider sorting list of branches in drop down
> - "tuxsuite" seems to get truncated to "..." for me.
> - builds over time are useful, but it would be more empowering to know
> which of those builds were green vs red.
> 
> I'm not sure quite yet how to drill down to see which builds were from
> which toolchain, but this looks pretty close to what I had in mind.
> 

