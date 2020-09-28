Subject: Re: [kernelci-members] Working with the KernelCI project
References: <20200707222342.scrz75265etaqlmd@redhat.com>
 <42d15463-e4ee-4c0b-c63f-dce7acb05e35@collabora.com>
 <CACT4Y+ZLoBLFWRM+RcKZJyR2Hh5az9W8_329ShM9JuSg6V4uVw@mail.gmail.com>
 <bbeeb467-1571-5404-7408-9b112d64e928@redhat.com>
 <CACT4Y+a1t-9sT7xz7d=Wmesnn_QoUqfipmoZXBu40_B+GQy=nQ@mail.gmail.com>
 <031d1941-2842-fc79-2a21-66bccb17f91c@redhat.com>
 <adb7924d-b524-2f86-05fd-dc0233004652@redhat.com>
 <CACT4Y+beU9XoOt5XXLEarKyWvkhyRKC5aJRc6djmHsUqO+AbJA@mail.gmail.com>
 <8d422dcf-d4ef-8e74-be82-f52272d9a966@redhat.com>
 <CACT4Y+a5spdA8TZNeaXFYj4QEw_=howfhu9YGsNm3rC8XPAJnA@mail.gmail.com>
 <d9919812-9763-9c02-3e5d-978fac8fe1f7@redhat.com>
 <CACT4Y+a3L+_8kpXq-WdNZxJESCvnCvfakJ3CymVwmZZA6kv+0w@mail.gmail.com>
From: "Nikolai Kondrashov" <Nikolai.Kondrashov@redhat.com>
Message-ID: <53f80709-7797-fdb6-6e5b-619619065fb2@redhat.com>
Date: Mon, 28 Sep 2020 19:49:31 +0300
MIME-Version: 1.0
In-Reply-To: <CACT4Y+a3L+_8kpXq-WdNZxJESCvnCvfakJ3CymVwmZZA6kv+0w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
List-ID: <kernelci.groups.io>
To: Dmitry Vyukov <dvyukov@google.com>
Cc: kernelci@groups.io, Guillaume Tucker <guillaume.tucker@collabora.com>, Philip Li <philip.li@intel.com>, kernelci-members@groups.io, nkondras@redhat.com, Don Zickus <dzickus@redhat.com>, syzkaller <syzkaller@googlegroups.com>, =?UTF-8?Q?I=c3=b1aki_Malerba?= <imalerba@redhat.com>

Hi Dmitry,

On 9/28/20 6:23 PM, Dmitry Vyukov wrote:
 > On Mon, Sep 28, 2020 at 3:16 PM Nikolai Kondrashov
 > <Nikolai.Kondrashov@redhat.com> wrote:
 >> Do you mean you can't run executables, or that having the Python stack in
 >> there as well is not possible/burdensome? Just curious.
 >
 > Appengine is what's called "serverless" today. There are no servers,
 > filesystem, custom binaries. I just upload a set of source Go files
 > and Appengine takes care of the rest. So there is no way to deploy a
 > custom binary written in a different language.

I see, thank you.

We're using Google Cloud Functions written in Python to do submission
processing, and are considering using the Appengine, so I think can imagine
what you're talking about.

 >> Do you mean "deploying the dashboard"?
 >
 > I meant when/how do we deploy this uploading to production. I mean if
 > I do a prototype and it works with a playground, what's next?
 > ... answering my own question, I guess we can make production syzbot
 > upload to the playground kcidb first and then see how it works. If it
 > works well, then we can switch to production kcidb.

Yes, sounds like a good plan! I don't think we need to hang out in the
"playground" beyond the point where you see that your data is consistently
validated and submitted. As soon as it fits the schema and you're satisfied
with what you send, we can switch to production.

 > I have a question re schema. You mentioned "incidents" above. But I
 > don't see them in the kcidb-schema output.

Unfortunately I didn't have the time to work on that yet, but it's one of my
top priorities. Meanwhile you can start sending test results without
correllating them to issues and incidents - you will be able to see what else
we're missing, we'll see how much data you produce and whether we can handle
it, and so on.

If you'd like to be careful and actively avoid sending failure notifications,
you can set the "waived" flag for your tests to "true", which would ask the
system to avoid considering your test results for reporting, but it would
still record them.

Nick

On 9/28/20 6:23 PM, Dmitry Vyukov wrote:
 > On Mon, Sep 28, 2020 at 3:16 PM Nikolai Kondrashov
 > <Nikolai.Kondrashov@redhat.com> wrote:
 >>
 >> Hi Dmitry,
 >>
 >> On 9/28/20 3:48 PM, Dmitry Vyukov wrote:
 >>   > The examples are helpful. I think this should be doable. The ability
 >>   > to send everything in a single request is handy, and since we don't
 >>   > send bulky data (only links), should not cause any issues.
 >>
 >> Awesome!
 >>
 >>   > I need an API key, right? How are they distributed? Could you send me
 >>   > one to my email privately?
 >>
 >> Yep, just sent it.
 >>
 >>   > However, we don't use any Python and use of kcidb-submit will be
 >>   > problematic as the app is a Go App Engine app.
 >>
 >> Do you mean you can't run executables, or that having the Python stack in
 >> there as well is not possible/burdensome? Just curious.
 >
 > Appengine is what's called "serverless" today. There are no servers,
 > filesystem, custom binaries. I just upload a set of source Go files
 > and Appengine takes care of the rest. So there is no way to deploy a
 > custom binary written in a different language.
 >
 >
 >>   > I looked what's the actual protocol and got to here:
 >>   > https://github.com/kernelci/kcidb/blob/master/kcidb/mq/__init__.py#L69
 >>   > and this "client" seems to come from google.cloud.pubsub.
 >>   >
 >>   > Go has https://pkg.go.dev/cloud.google.com/go/pubsub package as well,
 >>   > it would be much more practical for syzbot to use that directly. But
 >>   > what exactly is the protocol? I assume it's that JSON, but is it
 >>   > wrapped into some other layers? What's the topic name to publish? Is
 >>   > there description/example on this level?
 >>
 >> There's no documentation available for this level, yet, just the code.
 >>
 >> However, yes, it's just JSON submitted to a PubSub topic, currently, and the
 >> schema is exactly as output by "kcidb-schema".
 >>
 >> Please validate JSON fully before submitting to the PubSub topic
 >> ("kcidb-validate" could help you start). We don't have error reporting to
 >> submitters from the server side yet, we'll have to read the logs to find out
 >> what happened, if it breaks :)
 >>
 >> I sent you the project/topic names in the message with the credentials.
 >>
 >> Oh, and we would definitely appreciate a contribution of the Go submission
 >> module, if you make one :)
 >>
 >>   > Also, how can I test things? Is there a test instance? Or if I push
 >>   > something, can I observe it on the KernelCI dashboard or something?
 >>
 >> Yes, there's a "playground" instance, details are in the message with the
 >> credentials. You can see the results on the "playground" dashboard, and query
 >> them from the "playground" database with "kcidb-query".
 >>
 >>   > What would be the procedure for deploying it on the syzbot side?
 >>
 >> Do you mean "deploying the dashboard"?
 >
 > I meant when/how do we deploy this uploading to production. I mean if
 > I do a prototype and it works with a playground, what's next?
 > ... answering my own question, I guess we can make production syzbot
 > upload to the playground kcidb first and then see how it works. If it
 > works well, then we can switch to production kcidb.
 >
 >
 >
 > I have a question re schema. You mentioned "incidents" above. But I
 > don't see them in the kcidb-schema output.
 >
 >
 >
 >> Excited to have you join the effort!
 >>
 >> Nick
 >>
 >> On 9/28/20 3:48 PM, Dmitry Vyukov wrote:
 >>   > On Fri, Aug 21, 2020 at 12:10 PM Nikolai Kondrashov
 >>   > <Nikolai.Kondrashov@redhat.com> wrote:
 >>   >>
 >>   >> Hi Dmitry,
 >>   >>
 >>   >> On 8/5/20 9:44 PM, Dmitry Vyukov wrote:
 >>   >>   > On Mon, Aug 3, 2020 at 11:25 AM Nikolai Kondrashov
 >>   >>   >> Did you have time to take a look at my mock-up? It probably looks like too
 >>   >>   >> much text, but please don't hesitate to reach me with any questions or
 >>   >>   >> suggestions you have as you look through it, if you haven't already.
 >>   >>   >>
 >>   >>   >> Please note that you don't have to start with sending all this data. In fact,
 >>   >>   >> only a few structural fields are required and we can start with the absolute
 >>   >>   >> minimum. The mock-up is showing what you *could* already send, but you don't
 >>   >>   >> have to go that far.
 >>   >>   >>
 >>   >>   >> I'd like to schedule a hacking session at Plumbers where we go and try to get
 >>   >>   >> some data out of participants' systems and into KCIDB. Would you be interested
 >>   >>   >> to attend, perhaps?
 >>   >>   >
 >>   >>   > Hi Nick,
 >>   >>   >
 >>   >>   > I've seen your reply and seen that you provided an example of how to
 >>   >>   > fill in the data. I was starred in my inbox, but I did not have time
 >>   >>   > to look at the details yet (we have somewhat crazy intern season). I
 >>   >>   > still want to do this.
 >>   >>
 >>   >> Glad to hear that, and I understand about the time.
 >>   >>
 >>   >>   > I am not sure how a remote virtual hacking session is different from
 >>   >>   > just doing this normally and some email exchange :)
 >>   >>
 >>   >> I would say the low response latency helps move faster :)
 >>   >>
 >>   >> We could have a video call in background and/or share a screen or a tmate
 >>   >> session, as we try to make things work. Even just having someone available in
 >>   >> an IRC chat for quick responses helps, I'd say.
 >>   >>
 >>   >> Everyone has their own preferences, of course, I'm just offering to be there
 >>   >> and discuss things and maybe work on something :)
 >>   >>
 >>   >> As I just wrote to Philip, I've finally published the schema introduction
 >>   >> article:
 >>   >>
 >>   >>       https://foundation.kernelci.org/blog/2020/08/21/introducing-common-reporting/
 >>   >>
 >>   >> Here's our talk, same MC as yours, but later:
 >>   >>
 >>   >>       https://linuxplumbersconf.org/event/7/contributions/730/
 >>   >>
 >>   >> and the BoF session next day:
 >>   >>
 >>   >>       https://linuxplumbersconf.org/event/7/contributions/731/
 >>   >>
 >>   >> Will be glad to meet you there, even though we won't be able to do
 >>   >> much in the 45 minutes we were allocated.
 >>   >>
 >>   >> So please also drop by our "hallway chat", whenever you have time:
 >>   >>
 >>   >>       https://chat.2020.linuxplumbersconf.org/channel/kcidb
 >>   >>
 >>   >> I'll be there every day of the conference, during Europe's working hours.
 >>   >
 >>   >
 >>   > Hi Nikolai,
 >>   >
 >>   > The examples are helpful. I think this should be doable. The ability
 >>   > to send everything in a single request is handy, and since we don't
 >>   > send bulky data (only links), should not cause any issues.
 >>   >
 >>   > I need an API key, right? How are they distributed? Could you send me
 >>   > one to my email privately?
 >>   >
 >>   > However, we don't use any Python and use of kcidb-submit will be
 >>   > problematic as the app is a Go App Engine app.
 >>   > I looked what's the actual protocol and got to here:
 >>   > https://github.com/kernelci/kcidb/blob/master/kcidb/mq/__init__.py#L69
 >>   > and this "client" seems to come from google.cloud.pubsub.
 >>   >
 >>   > Go has https://pkg.go.dev/cloud.google.com/go/pubsub package as well,
 >>   > it would be much more practical for syzbot to use that directly. But
 >>   > what exactly is the protocol? I assume it's that JSON, but is it
 >>   > wrapped into some other layers? What's the topic name to publish? Is
 >>   > there description/example on this level?
 >>   >
 >>   > Also, how can I test things? Is there a test instance? Or if I push
 >>   > something, can I observe it on the KernelCI dashboard or something?
 >>   > What would be the procedure for deploying it on the syzbot side?
 >>   >
 >>   > Thanks
 >>   >
 >>
 >

