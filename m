Subject: Re: syzkaller/syzbot query?
References: <f4894658cfcb94263c859a57f016a06d7fb32347.camel@sipsolutions.net>
 <CACT4Y+ZTHxLvH3VGZWfMsGfhK0fWeixcMTc99Xs65VVVPz2apg@mail.gmail.com>
From: "Nikolai Kondrashov" <Nikolai.Kondrashov@redhat.com>
Message-ID: <bfd8777b-2c42-8a40-3e22-9de2e9331703@redhat.com>
Date: Fri, 9 Oct 2020 12:14:01 +0300
MIME-Version: 1.0
In-Reply-To: <CACT4Y+ZTHxLvH3VGZWfMsGfhK0fWeixcMTc99Xs65VVVPz2apg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
List-ID: <kernelci.groups.io>
To: kernelci@groups.io, dvyukov@google.com, Johannes Berg <johannes@sipsolutions.net>
Cc: syzkaller <syzkaller@googlegroups.com>

On 10/9/20 12:08 PM, Dmitry Vyukov via groups.io wrote:
 > On Fri, Oct 9, 2020 at 10:50 AM Johannes Berg <johannes@sipsolutions.net> wrote:
 >> Is there a way to go filter
 >>
 >> https://syzkaller.appspot.com/upstream#open
 >>
 >> by ... something? I mean, clearly syzbot _knows_ something about where
 >> to send the emails, so it'd be useful if I could - in addition to having
 >> the emails - query that list as well, so nothing gets missed?
 > We recently started exporting info into KCIDB and it may solve the
 > problem long term, but probably not yet as well:
 > https://staging.kernelci.org:3000/d/home/home?orgId=1&var-origin=syzbot&var-dataset=kernelci04&from=now-90d&to=now&refresh=30m

The ultimate plan with KCIDB is to let developers manage their own
subscriptions (what results/tests/trees/architectures/etc. they're interested
in), and naturally it then should then be possible to get a list of objects
(results) matching the subscription.

There's a lot of work left to reach that, though.

Nick

On 10/9/20 12:08 PM, Dmitry Vyukov via groups.io wrote:
 > On Fri, Oct 9, 2020 at 10:50 AM Johannes Berg <johannes@sipsolutions.net> wrote:
 >>
 >> Hi,
 >>
 >> Since I'm sort of drowning in syzbot reports (just recorded 23 I should
 >> look at), and I'm afraid I'd probably miss some.
 >>
 >> Is there a way to go filter
 >>
 >> https://syzkaller.appspot.com/upstream#open
 >>
 >> by ... something? I mean, clearly syzbot _knows_ something about where
 >> to send the emails, so it'd be useful if I could - in addition to having
 >> the emails - query that list as well, so nothing gets missed?
 >>
 >> I don't see anything obvious there, hence the question.
 >
 > Hi Johannes,
 >
 > Currently there is no way to cross open bugs with a particular
 > recipient/subsystem.
 > There are some outstanding related feature requests for this, but this
 > is not implemented yet:
 > https://github.com/google/syzkaller/issues/544
 > https://github.com/google/syzkaller/issues/550
 > https://github.com/google/syzkaller/issues/608
 >
 > The best I can suggest is searches on lore:
 > https://lore.kernel.org/linux-wireless/?q=f%3Asyzbot
 > but this obviously does not cross it with "open" status. Lore can
 > filter based on dates, receivers, etc.
 >
 > We recently started exporting info into KCIDB and it may solve the
 > problem long term, but probably not yet as well:
 > https://staging.kernelci.org:3000/d/home/home?orgId=1&var-origin=syzbot&var-dataset=kernelci04&from=now-90d&to=now&refresh=30m
 >
 > In the end the problem is not syzbot-specific. How would you do this
 > if the bugs were reported by somebody else? ;)
 >
 >
 > 
 >
 >

