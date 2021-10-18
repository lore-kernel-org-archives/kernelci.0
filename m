Return-Path: <spbnick@gmail.com>
Subject: Re: Notifications signup
References: <CAJBmjuiicSdw8wr4ecGf+5VrCWsg6nO2HU-5UbBE40LXKk0zDQ@mail.gmail.com>
 <4663533c-5d82-0780-a77d-2cb870b7b33a@gmail.com>
 <CAJBmjuggPYrFPOt=+7Cc_QSpa+yhf77VWgLJRP2Eq=cfhzm66w@mail.gmail.com>
 <49aa7dab-07eb-e218-4709-c28c0d0001aa@gmail.com>
 <CAJBmjuhcEk+gj7VhLvGP=9T=ML2WvRjLBgRAtBbq9x+9X9nTLw@mail.gmail.com>
 <7867af2b-a8aa-769d-0aca-deb4da94ae46@redhat.com>
 <CAJBmjujoPCJ6PyP=JjYn+gLMq=zB0Q+YKQ+=9CDnKzTw-Fkd9w@mail.gmail.com>
From: "Nikolai Kondrashov" <spbnick@gmail.com>
Message-ID: <7551afdf-0e66-f541-aad9-8054eabd07af@gmail.com>
Date: Mon, 18 Oct 2021 12:25:07 +0300
MIME-Version: 1.0
In-Reply-To: <CAJBmjujoPCJ6PyP=JjYn+gLMq=zB0Q+YKQ+=9CDnKzTw-Fkd9w@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
List-ID: <kernelci.groups.io>
To: Aya Mahfouz <mahfouz.saif.elyazal@gmail.com>, Nikolai Kondrashov <Nikolai.Kondrashov@redhat.com>
Cc: kernelci@groups.io

Hi Aya,

On 10/16/21 10:40 PM, Aya Mahfouz wrote:
 > On Sat, Oct 16, 2021 at 10:55 AM Nikolai Kondrashov
 > <Nikolai.Kondrashov@redhat.com <mailto:Nikolai.Kondrashov@redhat.com>> wrote:
 >     Yes, unfortunately, you need to be authenticated to Google, but any account
 >     should be able to access the database. If not, I will need to fix it.
 >     What didn't work for you?
 >
 > Thanks Nick. Now that you have told me, I revised the list of public projects
 > available and
 > found that you have the project listed as tutorial. So, it is working fine.

Not sure what you mean by "listed as tutorial", and where, but here's a 
BigQuery console query showing the current database schema:

https://console.cloud.google.com/bigquery?sq=415818378487:e8503e2aadfa4beeae8da378ceecdfe9

And here's an example query on the console as well:

https://docs.google.com/presentation/d/1ZrU0z1LvQYYoLOb9vmXUH7aZ9jSFviaenZRcYtEWqVg/edit#slide=id.gbcaa06c4d2_0_107

Those two should get you started exploring the database.

 >     If this works for you, I'll set it up and send you the key.
 >
 > Ok, I will read the documentation first and let you know if I need further
 > permissions.

Great!

Don't hesitate to ping me, if you have any questions or problems.

You can also find me as "spbnick" on #kernelci channel on libera.chat.

Nick

On 10/16/21 10:40 PM, Aya Mahfouz wrote:
> 
> On Sat, Oct 16, 2021 at 10:55 AM Nikolai Kondrashov 
> <Nikolai.Kondrashov@redhat.com <mailto:Nikolai.Kondrashov@redhat.com>> wrote:
> 
>     On 10/15/21 9:18 PM, Aya Mahfouz wrote:
>       >     An alternative to get *structured* KCIDB data could be to mine our
>     dataset
>       >     directly with SQL. See examples in the slides for a presentation I
>     did,
>       >     starting from this one:
>       >
>       >
>       >
>     https://docs.google.com/presentation/d/1ZrU0z1LvQYYoLOb9vmXUH7aZ9jSFviaenZRcYtEWqVg/edit#slide=id.gbcaa06c4d2_0_44
>     <https://docs.google.com/presentation/d/1ZrU0z1LvQYYoLOb9vmXUH7aZ9jSFviaenZRcYtEWqVg/edit#slide=id.gbcaa06c4d2_0_44>
>       >
>     <https://docs.google.com/presentation/d/1ZrU0z1LvQYYoLOb9vmXUH7aZ9jSFviaenZRcYtEWqVg/edit#slide=id.gbcaa06c4d2_0_44
>     <https://docs.google.com/presentation/d/1ZrU0z1LvQYYoLOb9vmXUH7aZ9jSFviaenZRcYtEWqVg/edit#slide=id.gbcaa06c4d2_0_44>>
>       >
>       >
>       >     Links at the bottom of slides should work. Beside the SQL console,
>     there are
>       >     of course APIs available for querying.
>       >
>       > Thanks Nick. Yes, I would like to query the data and extract custom
>     results.
>       > However, I can't access it publicly. If the public access is not
>     available
>     at the
>       > moment. Can you please direct me to how can I use the APIs?
> 
>     Yes, unfortunately, you need to be authenticated to Google, but any account
>     should be able to access the database. If not, I will need to fix it.
>     What didn't work for you?
> 
> 
> Thanks Nick. Now that you have told me, I revised the list of public projects 
> available and
> found that you have the project listed as tutorial. So, it is working fine.
> 
> 
>     Regarding the APIs, here's the intro to libraries in various languages:
> 
>     https://cloud.google.com/bigquery/docs/reference/libraries
>     <https://cloud.google.com/bigquery/docs/reference/libraries>
> 
>     And here's the REST API reference:
> 
>     https://cloud.google.com/bigquery/docs/reference/rest
>     <https://cloud.google.com/bigquery/docs/reference/rest>
> 
>       >     Another alternative is to subscribe to our submission message queue to
>       >     receive
>       >     build (as well as test) results in (relative) real time, as they come
>     in. We
>       >     have a formal, documented schema for those JSON messages.
>       >
>       > How can I subscribe to the message queue?
> 
>     Check out the available Google PubSub libraries:
> 
>     https://cloud.google.com/pubsub/docs/reference/libraries
>     <https://cloud.google.com/pubsub/docs/reference/libraries>
> 
>     I can create a subscription for you and a service account, then setup access,
>     and send you the service account key, which you can use to receive the
>     data as
>     it comes in using the libraries, or just the gcloud or kcidb command-line
>     tools for the start. A REST API is also available:
> 
>     https://cloud.google.com/pubsub/docs/reference/rest
>     <https://cloud.google.com/pubsub/docs/reference/rest>
> 
>     If this works for you, I'll set it up and send you the key.
> 
> Ok, I will read the documentation first and let you know if I need further 
> permissions.
> 
> Thanks,
> Kind Regards,
> Aya Saif El-yazal Mahfouz
> 
>     Nick
> 
>     On 10/15/21 9:18 PM, Aya Mahfouz wrote:
>      >
>      >
>      > On Fri, Oct 15, 2021 at 6:13 PM Nikolai Kondrashov <spbnick@gmail.com
>     <mailto:spbnick@gmail.com>
>      > <mailto:spbnick@gmail.com <mailto:spbnick@gmail.com>>> wrote:
>      >
>      >     Hi Aya,
>      >
>      >     On 10/15/21 6:39 PM, Aya Mahfouz wrote:
>      >       >    I am looking for generic reports so any possible builds will
>     be good.
>      >
>      >     If the maillists Guillaume suggest don't work for you, I'll be able to
>      >     subscribe you to notification emails with the next release of
>     KCIDB, coming
>      >     this Autumn. Those would be human-targeted, though.
>      >
>      >     An alternative to get *structured* KCIDB data could be to mine our
>     dataset
>      >     directly with SQL. See examples in the slides for a presentation I did,
>      >     starting from this one:
>      >
>      >
>      >
>     https://docs.google.com/presentation/d/1ZrU0z1LvQYYoLOb9vmXUH7aZ9jSFviaenZRcYtEWqVg/edit#slide=id.gbcaa06c4d2_0_44
>     <https://docs.google.com/presentation/d/1ZrU0z1LvQYYoLOb9vmXUH7aZ9jSFviaenZRcYtEWqVg/edit#slide=id.gbcaa06c4d2_0_44>
>      >   
>       <https://docs.google.com/presentation/d/1ZrU0z1LvQYYoLOb9vmXUH7aZ9jSFviaenZRcYtEWqVg/edit#slide=id.gbcaa06c4d2_0_44>
>      >
>      >
>      >     Links at the bottom of slides should work. Beside the SQL console,
>     there are
>      >     of course APIs available for querying.
>      >
>      > Thanks Nick. Yes, I would like to query the data and extract custom
>     results.
>      > However, I can't access it publicly. If the public access is not
>     available at the
>      > moment. Can you please direct me to how can I use the APIs?
>      >
>      >
>      >     Another alternative is to subscribe to our submission message queue to
>      >     receive
>      >     build (as well as test) results in (relative) real time, as they
>     come in. We
>      >     have a formal, documented schema for those JSON messages.
>      >
>      > How can I subscribe to the message queue?
>      >
>      > Thanks,
>      >
>      > Kind Regards,
>      > Aya Saif El-yazal Mahfouz
>      >
>      >     You can check out what data is available in KCIDB on the dashboard:
>      >
>      > https://kcidb.kernelci.org/
>     <https://kcidb.kernelci.org/>
>      >
>      >     Nick
>      >
>      >     On 10/15/21 6:39 PM, Aya Mahfouz wrote:
>      >      > Hello Nikolai,
>      >      >
>      >      >    I am looking for generic reports so any possible builds will
>     be good.
>      >      >
>      >      > Thanks,
>      >      >
>      >      > Kind Regards,
>      >      > Aya Saif El-yazal Mahfouz
>      >      >
>      >      >
>      >      > On Fri, Oct 15, 2021 at 11:16 AM Nikolai Kondrashov
>     <spbnick@gmail.com <mailto:spbnick@gmail.com>
>      >     <mailto:spbnick@gmail.com <mailto:spbnick@gmail.com>>
>      >      > <mailto:spbnick@gmail.com <mailto:spbnick@gmail.com>
>     <mailto:spbnick@gmail.com <mailto:spbnick@gmail.com>>>> wrote:
>      >      >
>      >      >     Hi Aya,
>      >      >
>      >      >     On 10/14/21 9:28 PM, Aya Mahfouz wrote:
>      >      >       > Hello,
>      >      >       >
>      >      >       >     I would like to sign up for receiving notifications of
>      >     incoming build
>      >      >       > results. In addition, I would like to ask if there is an API
>      >     for the
>      >      >     public to
>      >      >       > fetch the build results in json format.
>      >      >
>      >      >     Do you want to receive native KernelCI build result
>     notifications,
>      >     or the
>      >      >     KCIDB build notifications, which include build results from
>      >     multiple other CI
>      >      >     systems?
>      >      >
>      >      >     Which criteria do you want the notifications to be filtered by?
>      >     Particular
>      >      >     tree, repo, architecture, and so on?
>      >      >
>      >      >     Nick
>      >      >
>      >      >     On 10/14/21 9:28 PM, Aya Mahfouz wrote:
>      >      >      > Hello,
>      >      >      >
>      >      >      >     I would like to sign up for receiving notifications of
>      >     incoming build
>      >      >      > results. In addition, I would like to ask if there is an
>     API for the
>      >      >     public to
>      >      >      > fetch the build results in json format.
>      >      >      >
>      >      >      > Thanks,
>      >      >      >
>      >      >      > Kind Regards,
>      >      >      > Aya Saif El-yazal Mahfouz >
>      >
>      > 
> 

