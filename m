Subject: Re: [kernelci-members] Working with the KernelCI project
References: <20200707222342.scrz75265etaqlmd@redhat.com>
 <bbeeb467-1571-5404-7408-9b112d64e928@redhat.com>
 <CACT4Y+a1t-9sT7xz7d=Wmesnn_QoUqfipmoZXBu40_B+GQy=nQ@mail.gmail.com>
 <031d1941-2842-fc79-2a21-66bccb17f91c@redhat.com>
 <adb7924d-b524-2f86-05fd-dc0233004652@redhat.com>
 <CACT4Y+beU9XoOt5XXLEarKyWvkhyRKC5aJRc6djmHsUqO+AbJA@mail.gmail.com>
 <8d422dcf-d4ef-8e74-be82-f52272d9a966@redhat.com>
 <CACT4Y+a5spdA8TZNeaXFYj4QEw_=howfhu9YGsNm3rC8XPAJnA@mail.gmail.com>
 <d9919812-9763-9c02-3e5d-978fac8fe1f7@redhat.com>
 <CACT4Y+a3L+_8kpXq-WdNZxJESCvnCvfakJ3CymVwmZZA6kv+0w@mail.gmail.com>
 <CACT4Y+aFc7DoUBF=DLh2oBHy=3pKLACnhb3v88Tt4bkjarGUTg@mail.gmail.com>
 <CACT4Y+YR-Gv5NnTbs+04gjA7LABRnCidAkbE9_tE=YrGDgYL2Q@mail.gmail.com>
 <863511a8-090a-6ee1-ddce-f32d70458ee8@redhat.com>
 <CACT4Y+biFKO-Bauixm_DtEGTAUzHXTf0iXuFx1A=WTLmBhvSDg@mail.gmail.com>
 <1ff4a09c-4529-017c-5b0b-43712575771b@redhat.com>
 <CACT4Y+YKmKxv1nzOjFzou6ec3crfEWBectJAEwka_MTAE3pntw@mail.gmail.com>
From: "Nikolai Kondrashov" <Nikolai.Kondrashov@redhat.com>
Message-ID: <a3da899f-d911-b4f4-25cf-fa4734826d4d@redhat.com>
Date: Thu, 1 Oct 2020 11:53:08 +0300
MIME-Version: 1.0
In-Reply-To: <CACT4Y+YKmKxv1nzOjFzou6ec3crfEWBectJAEwka_MTAE3pntw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
List-ID: <kernelci.groups.io>
To: Dmitry Vyukov <dvyukov@google.com>
Cc: kernelci@groups.io, Guillaume Tucker <guillaume.tucker@collabora.com>, Philip Li <philip.li@intel.com>, kernelci-members@groups.io, nkondras@redhat.com, Don Zickus <dzickus@redhat.com>, syzkaller <syzkaller@googlegroups.com>, =?UTF-8?Q?I=c3=b1aki_Malerba?= <imalerba@redhat.com>

On 9/30/20 10:21 AM, Dmitry Vyukov wrote:
 > On Tue, Sep 29, 2020 at 7:13 PM Nikolai Kondrashov
 > <Nikolai.Kondrashov@redhat.com> wrote:
 >>   > 2. Maybe a related question: we generally identify bugs and bucket
 >>   > crashes based on "crash title" (obtained from the kernel oops message
 >>   > via some non-trivial transformation), e.g. "KASAN: use-after-free in
 >>   > open_file". If we've got a reproducer, this string is used to link it
 >>   > to the previously happened crash. I don't see where I can put this
 >>   > string. test.description?
 >>
 >> So far my idea was to leave the identification and handling of such strings to
 >> you. We could then represent that link using an incident object linking a test
 >> execution to an issue, and the issue could then have the reproducer
 >> linked/attached in a property.
 >>
 >> For now, you can put that information into the "description" (which I plan to
 >> rename into "comment" sometime soon), or perhaps into the "misc" object.
 >
 > Wouldn't it be useful to have at least some information about the
 > actual kernel oops in kcidb?
 > It would allow searches and interconnect things reported by different
 > systems. E.g. are there any known issues in this function? Or
 > understanding that several tests fail due to the same root cause. Or
 > doing some flakiness analysis, e.g. episodic failures on random tests
 > but all have similar kernel oopses. Or interconnecting bugs reported
 > by different syzbot deployments

Absolutely, that would be useful. We just had to start doing this without
implementing everything at once. We have a plan to allow submitting short,
most-relevant log/file snippets into the database directly (I probably
mentioned that before). E.g. 0day would need that from the start.

For now we only take links to files, but hopefully snippets soon :)

 > (yes, there are others, I don't know if they will want to participate, but
 > with support in syzbot code they will just need to flip a config flag).

Awesooomeeee, this situation is exactly what we're aiming at :D

 >>   > Currently I also add this link as a resource named "dashboard".  But
 >>   > that's a custom name that KCIDB won't understand.
 >>
 >> We have the "misc" object specifically for things like that: data you'd like
 >> to see represented in an object, but which isn't supported by the schema yet.
 >>
 >> You can put there whatever you want (within reasonable size limit), dashboard
 >> users can get it now, and we can have a sample of what we need to support in
 >> the schema.
 >>
 >> See https://github.com/kernelci/kcidb/blob/master/SUBMISSION_HOWTO.md#extra-data
 >
 > Got it.
 > Yes, some support for "link to external dashboard" would be useful.
 > Perhaps just a canonical name for resource?

At the moment resources are intended for files, which could e.g. be downloaded
and re-hosted on KCIDB side, if necessary. Page links shouldn't go in there.

Ping Guillaume in the associated PR, and explain your requirements to nudge
him to take a look at it again, and perhaps we can get this moved forward
sooner :)

That PR needs to move to another repo now, but it's good enough to continue
the discussion.

 >>   > 5. We figure out emails (maintainers+lists) that we think should be
 >>   > looking at this bug report. Where should we put them?
 >>   > There is revision.contacts, but this is not related to revision but
 >>   > rather test (or issue).
 >>
 >> Yes, there's revision.contacts, which comes from initial CKI needs, and we
 >> could add the same to the issues, when we have them.
 >>
 >> However, with KCIDB, I'd like to try a reverse approach: instead of the CI
 >> system deciding who to send reports to, give developers control on what they
 >> receive via a "subscription" system. I.e. let them pick what they'll be
 >> interested in: which CI systems, which trees, architectures, tests, results,
 >> and so on. With that approach such data becomes unnecessary.
 >>
 >> There's, of course many questions to answer and a proper implementation to
 >> write before we know how that works, and perhaps we could start with using
 >> that data, but that's the direction I'd like to try.
 >>
 >> With many people submitting and the amount of data we're already getting we
 >> need to give the developers the upper hand. I think it should be up to the CI
 >> systems to submit the best data they can, up to KCIDB to provide
 >> discoverability of that data, and up to developers to decide which data they
 >> care about.
 >
 > I see. Makes sense.
 > But then we need to ensure that kcidb has the necessary info for this.
 > Again, fuzzing is different from unit testing in this regard. We
 > effectively have 1 test case "syzkaller" and crashes happen on an
 > "upstream" tree and the commit we point to is not related to the crash
 > (it just describes the state of the tree). That's no useful
 > information to subscribe to at all.
 >
 > The way we do it is as follows. We analyze the oops message to find
 > what we assume is the guilty source file and then run
 > get_maintainers.pl on the file. I assume it's very reasonable for
 > developers to subscribe to parts of the source tree they are
 > interested in (e.g. net/sctp/*). But for this kcidb will need either
 > the file name or the oops message (in machine discoverable form).

Yes, the file where the fault happened could definitely be useful. This needs
more thinking, and I think we have too big an implementation gap for that yet.

For the start, we can perhaps let people subscribe to test failures which
happened to revisions with parents which don't have those same failures. Plus
e.g. let them check that the failure has a bug with a reproducer, or such.

Nick

