Return-Path: <spbnick@gmail.com>
Subject: Re: Notifications signup
References: <CAJBmjuiicSdw8wr4ecGf+5VrCWsg6nO2HU-5UbBE40LXKk0zDQ@mail.gmail.com>
 <4663533c-5d82-0780-a77d-2cb870b7b33a@gmail.com>
 <CAJBmjuggPYrFPOt=+7Cc_QSpa+yhf77VWgLJRP2Eq=cfhzm66w@mail.gmail.com>
From: "Nikolai Kondrashov" <spbnick@gmail.com>
Message-ID: <49aa7dab-07eb-e218-4709-c28c0d0001aa@gmail.com>
Date: Fri, 15 Oct 2021 19:13:02 +0300
MIME-Version: 1.0
In-Reply-To: <CAJBmjuggPYrFPOt=+7Cc_QSpa+yhf77VWgLJRP2Eq=cfhzm66w@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
List-ID: <kernelci.groups.io>
To: Aya Mahfouz <mahfouz.saif.elyazal@gmail.com>
Cc: kernelci@groups.io

Hi Aya,

On 10/15/21 6:39 PM, Aya Mahfouz wrote:
 >    I am looking for generic reports so any possible builds will be good.

If the maillists Guillaume suggest don't work for you, I'll be able to 
subscribe you to notification emails with the next release of KCIDB, coming 
this Autumn. Those would be human-targeted, though.

An alternative to get *structured* KCIDB data could be to mine our dataset 
directly with SQL. See examples in the slides for a presentation I did, 
starting from this one:

 
https://docs.google.com/presentation/d/1ZrU0z1LvQYYoLOb9vmXUH7aZ9jSFviaenZRcYtEWqVg/edit#slide=id.gbcaa06c4d2_0_44

Links at the bottom of slides should work. Beside the SQL console, there are 
of course APIs available for querying.

Another alternative is to subscribe to our submission message queue to receive 
build (as well as test) results in (relative) real time, as they come in. We 
have a formal, documented schema for those JSON messages.

You can check out what data is available in KCIDB on the dashboard:

     https://kcidb.kernelci.org/

Nick

On 10/15/21 6:39 PM, Aya Mahfouz wrote:
> Hello Nikolai,
> 
>    I am looking for generic reports so any possible builds will be good.
> 
> Thanks,
> 
> Kind Regards,
> Aya Saif El-yazal Mahfouz
> 
> 
> On Fri, Oct 15, 2021 at 11:16 AM Nikolai Kondrashov <spbnick@gmail.com 
> <mailto:spbnick@gmail.com>> wrote:
> 
>     Hi Aya,
> 
>     On 10/14/21 9:28 PM, Aya Mahfouz wrote:
>       > Hello,
>       >
>       >     I would like to sign up for receiving notifications of incoming build
>       > results. In addition, I would like to ask if there is an API for the
>     public to
>       > fetch the build results in json format.
> 
>     Do you want to receive native KernelCI build result notifications, or the
>     KCIDB build notifications, which include build results from multiple other CI
>     systems?
> 
>     Which criteria do you want the notifications to be filtered by? Particular
>     tree, repo, architecture, and so on?
> 
>     Nick
> 
>     On 10/14/21 9:28 PM, Aya Mahfouz wrote:
>      > Hello,
>      >
>      >     I would like to sign up for receiving notifications of incoming build
>      > results. In addition, I would like to ask if there is an API for the
>     public to
>      > fetch the build results in json format.
>      >
>      > Thanks,
>      >
>      > Kind Regards,
>      > Aya Saif El-yazal Mahfouz
>      > 
> 

