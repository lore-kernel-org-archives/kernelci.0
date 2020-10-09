MIME-Version: 1.0
References: <f4894658cfcb94263c859a57f016a06d7fb32347.camel@sipsolutions.net>
In-Reply-To: <f4894658cfcb94263c859a57f016a06d7fb32347.camel@sipsolutions.net>
From: "Dmitry Vyukov" <dvyukov@google.com>
Date: Fri, 9 Oct 2020 11:08:19 +0200
Message-ID: <CACT4Y+ZTHxLvH3VGZWfMsGfhK0fWeixcMTc99Xs65VVVPz2apg@mail.gmail.com>
Subject: Re: syzkaller/syzbot query?
Content-Type: text/plain; charset="UTF-8"
List-ID: <kernelci.groups.io>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: syzkaller <syzkaller@googlegroups.com>, kernelci@groups.io

On Fri, Oct 9, 2020 at 10:50 AM Johannes Berg <johannes@sipsolutions.net> wrote:
>
> Hi,
>
> Since I'm sort of drowning in syzbot reports (just recorded 23 I should
> look at), and I'm afraid I'd probably miss some.
>
> Is there a way to go filter
>
> https://syzkaller.appspot.com/upstream#open
>
> by ... something? I mean, clearly syzbot _knows_ something about where
> to send the emails, so it'd be useful if I could - in addition to having
> the emails - query that list as well, so nothing gets missed?
>
> I don't see anything obvious there, hence the question.

Hi Johannes,

Currently there is no way to cross open bugs with a particular
recipient/subsystem.
There are some outstanding related feature requests for this, but this
is not implemented yet:
https://github.com/google/syzkaller/issues/544
https://github.com/google/syzkaller/issues/550
https://github.com/google/syzkaller/issues/608

The best I can suggest is searches on lore:
https://lore.kernel.org/linux-wireless/?q=f%3Asyzbot
but this obviously does not cross it with "open" status. Lore can
filter based on dates, receivers, etc.

We recently started exporting info into KCIDB and it may solve the
problem long term, but probably not yet as well:
https://staging.kernelci.org:3000/d/home/home?orgId=1&var-origin=syzbot&var-dataset=kernelci04&from=now-90d&to=now&refresh=30m

In the end the problem is not syzbot-specific. How would you do this
if the bugs were reported by somebody else? ;)
