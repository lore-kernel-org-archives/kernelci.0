MIME-Version: 1.0
From: "Dmitry Vyukov" <dvyukov@google.com>
Date: Wed, 16 Sep 2020 08:42:05 +0200
Message-ID: <CACT4Y+bYGnyqBH4a29wR_02Skw3LW8GNGJNz94_WupK8fy6ObA@mail.gmail.com>
Subject: Providing machine info for reported bugs
Content-Type: text/plain; charset="UTF-8"
List-ID: <kernelci.groups.io>
To: LKML <linux-kernel@vger.kernel.org>
Cc: syzkaller <syzkaller@googlegroups.com>, kernelci@groups.io, KVM list <kvm@vger.kernel.org>, Takashi Iwai <tiwai@suse.com>, Eric Biggers <ebiggers@google.com>

Hello,

We've recently added a feature to collect some machine info on syzbot
and provide it with crashes, in the case it is useful for
debugging/understanding what happened.

Here are 2 example crashes, check out "VM info" column for crashes:
https://syzkaller.appspot.com/bug?id=7f42f0f8b84628785150a192bafc24fca25e817d
https://syzkaller.appspot.com/bug?id=7c451a21f5159f1993ed44bcbacd5018e4428219

And here is a direct link with a sample of machine info:
https://syzkaller.appspot.com/text?tag=MachineInfo&x=873d2426f38045aa

Currently it includes only /proc/cpuinfo and some info from /sys/module/kvm*

This was a long-standing user feature request, in particular for
debugging KVM bugs (may be highly dependent on HW):
https://github.com/google/syzkaller/issues/466

So please be aware of this new feature. Currently it's only shown on
the dashboard, we decided to not pollute emails with it yet.

What other info may be useful for debugging of bugs in your subsystem?
We don't want to dump just every bit of info in all sysfs/debugfs/dev
(can be gigs of text). But if there is some critical bit that you
really need to know for debugging of bugs, we will try to include it.
Basically: if you are receiving an external bug report, what info are
you generally asking for?
As far as I remember +Takashi asked for something in the past, like a
list of sound devices present, but I don't remember exactly what it
was.

I've added kernelci@ because such a list may be useful for other
testing systems as well. Is there a prior art on this? LKML is not
read directly by lots of people, so if you know who may answer this
question for a particular subsystem, please CC.

Thank you
