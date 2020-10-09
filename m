MIME-Version: 1.0
References: <f4894658cfcb94263c859a57f016a06d7fb32347.camel@sipsolutions.net>
 <CACT4Y+ZTHxLvH3VGZWfMsGfhK0fWeixcMTc99Xs65VVVPz2apg@mail.gmail.com> <3a1c4487c17a95749db499eb3aa5ef33fb53a862.camel@sipsolutions.net>
In-Reply-To: <3a1c4487c17a95749db499eb3aa5ef33fb53a862.camel@sipsolutions.net>
From: "Dmitry Vyukov" <dvyukov@google.com>
Date: Fri, 9 Oct 2020 12:07:07 +0200
Message-ID: <CACT4Y+aKxd4nN8Avb52Kd7WFV5T5Ch0H7Ba30tLhOpgHjRbN5A@mail.gmail.com>
Subject: Re: syzkaller/syzbot query?
Content-Type: text/plain; charset="UTF-8"
List-ID: <kernelci.groups.io>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: syzkaller <syzkaller@googlegroups.com>, kernelci@groups.io

On Fri, Oct 9, 2020 at 11:35 AM Johannes Berg <johannes@sipsolutions.net> wrote:
>
> Hi Dmitry,
>
> > Currently there is no way to cross open bugs with a particular
> > recipient/subsystem.
> > There are some outstanding related feature requests for this, but this
> > is not implemented yet:
> > https://github.com/google/syzkaller/issues/544
> > https://github.com/google/syzkaller/issues/550
> > https://github.com/google/syzkaller/issues/608
>
> OK, thanks.
>
> > The best I can suggest is searches on lore:
> > https://lore.kernel.org/linux-wireless/?q=f%3Asyzbot
> > but this obviously does not cross it with "open" status. Lore can
> > filter based on dates, receivers, etc.
>
> Right. I guess I could cross-reference that with the syzbot ID from the
> "open" list on syzkaller.appspot.com, but it seemed a bit odd to have to
> do that :)

I totally agree.

> > We recently started exporting info into KCIDB and it may solve the
> > problem long term, but probably not yet as well:
> > https://staging.kernelci.org:3000/d/home/home?orgId=1&var-origin=syzbot&var-dataset=kernelci04&from=now-90d&to=now&refresh=30m
>
> :)
>
> > In the end the problem is not syzbot-specific. How would you do this
> > if the bugs were reported by somebody else? ;)
>
> Why, we ask them to report to bugzilla.kernel.org :)

+1
Well, the kernel project creates interesting situation for maintainers
and testing systems by rejecting to create common infrastructure,
rules and tooling... That's claimed to be the right positive thing but
every reporter cannot adopt and implement custom rules of each of 2000
kernel subsystems :)
So here we are. Reporting to mailing lists looked like the main way to
report bugs for the kernel and early on Greg KH confirmed that that's
the way to go.

Okay. I am getting carried away.
Grepping the syzbot page for "80211" and maybe a few other function
prefixes ("sta") may be another reasonably practical solution for now.
