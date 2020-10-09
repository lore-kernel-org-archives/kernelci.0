Message-ID: <3a1c4487c17a95749db499eb3aa5ef33fb53a862.camel@sipsolutions.net>
Subject: Re: syzkaller/syzbot query?
From: Johannes Berg <johannes@sipsolutions.net>
Date: Fri, 09 Oct 2020 11:35:12 +0200
In-Reply-To: <CACT4Y+ZTHxLvH3VGZWfMsGfhK0fWeixcMTc99Xs65VVVPz2apg@mail.gmail.com> (sfid-20201009_110833_452271_CACBB076)
References: 
	<f4894658cfcb94263c859a57f016a06d7fb32347.camel@sipsolutions.net>
	 <CACT4Y+ZTHxLvH3VGZWfMsGfhK0fWeixcMTc99Xs65VVVPz2apg@mail.gmail.com>
	 (sfid-20201009_110833_452271_CACBB076)
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
List-ID: <kernelci.groups.io>
To: Dmitry Vyukov <dvyukov@google.com>
Cc: syzkaller <syzkaller@googlegroups.com>, kernelci@groups.io

Hi Dmitry,

> Currently there is no way to cross open bugs with a particular
> recipient/subsystem.
> There are some outstanding related feature requests for this, but this
> is not implemented yet:
> https://github.com/google/syzkaller/issues/544
> https://github.com/google/syzkaller/issues/550
> https://github.com/google/syzkaller/issues/608

OK, thanks.

> The best I can suggest is searches on lore:
> https://lore.kernel.org/linux-wireless/?q=f%3Asyzbot
> but this obviously does not cross it with "open" status. Lore can
> filter based on dates, receivers, etc.

Right. I guess I could cross-reference that with the syzbot ID from the
"open" list on syzkaller.appspot.com, but it seemed a bit odd to have to
do that :)

> We recently started exporting info into KCIDB and it may solve the
> problem long term, but probably not yet as well:
> https://staging.kernelci.org:3000/d/home/home?orgId=1&var-origin=syzbot&var-dataset=kernelci04&from=now-90d&to=now&refresh=30m

:)

> In the end the problem is not syzbot-specific. How would you do this
> if the bugs were reported by somebody else? ;)

Why, we ask them to report to bugzilla.kernel.org :)

johannes

