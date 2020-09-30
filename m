MIME-Version: 1.0
References: <20200707222342.scrz75265etaqlmd@redhat.com> <42d15463-e4ee-4c0b-c63f-dce7acb05e35@collabora.com>
 <CACT4Y+ZLoBLFWRM+RcKZJyR2Hh5az9W8_329ShM9JuSg6V4uVw@mail.gmail.com>
 <bbeeb467-1571-5404-7408-9b112d64e928@redhat.com> <CACT4Y+a1t-9sT7xz7d=Wmesnn_QoUqfipmoZXBu40_B+GQy=nQ@mail.gmail.com>
 <031d1941-2842-fc79-2a21-66bccb17f91c@redhat.com> <adb7924d-b524-2f86-05fd-dc0233004652@redhat.com>
 <CACT4Y+beU9XoOt5XXLEarKyWvkhyRKC5aJRc6djmHsUqO+AbJA@mail.gmail.com>
 <8d422dcf-d4ef-8e74-be82-f52272d9a966@redhat.com> <CACT4Y+a5spdA8TZNeaXFYj4QEw_=howfhu9YGsNm3rC8XPAJnA@mail.gmail.com>
 <d9919812-9763-9c02-3e5d-978fac8fe1f7@redhat.com> <CACT4Y+a3L+_8kpXq-WdNZxJESCvnCvfakJ3CymVwmZZA6kv+0w@mail.gmail.com>
 <CACT4Y+aFc7DoUBF=DLh2oBHy=3pKLACnhb3v88Tt4bkjarGUTg@mail.gmail.com>
 <CACT4Y+YR-Gv5NnTbs+04gjA7LABRnCidAkbE9_tE=YrGDgYL2Q@mail.gmail.com>
 <863511a8-090a-6ee1-ddce-f32d70458ee8@redhat.com> <CACT4Y+biFKO-Bauixm_DtEGTAUzHXTf0iXuFx1A=WTLmBhvSDg@mail.gmail.com>
 <1ff4a09c-4529-017c-5b0b-43712575771b@redhat.com>
In-Reply-To: <1ff4a09c-4529-017c-5b0b-43712575771b@redhat.com>
From: "Dmitry Vyukov" <dvyukov@google.com>
Date: Wed, 30 Sep 2020 09:21:13 +0200
Message-ID: <CACT4Y+YKmKxv1nzOjFzou6ec3crfEWBectJAEwka_MTAE3pntw@mail.gmail.com>
Subject: Re: [kernelci-members] Working with the KernelCI project
Content-Type: text/plain; charset="UTF-8"
List-ID: <kernelci.groups.io>
To: Nikolai Kondrashov <Nikolai.Kondrashov@redhat.com>
Cc: kernelci@groups.io, Guillaume Tucker <guillaume.tucker@collabora.com>, Philip Li <philip.li@intel.com>, kernelci-members@groups.io, nkondras@redhat.com, Don Zickus <dzickus@redhat.com>, syzkaller <syzkaller@googlegroups.com>, =?UTF-8?Q?I=C3=B1aki_Malerba?= <imalerba@redhat.com>

On Tue, Sep 29, 2020 at 7:13 PM Nikolai Kondrashov
<Nikolai.Kondrashov@redhat.com> wrote:
>  > 2. Maybe a related question: we generally identify bugs and bucket
>  > crashes based on "crash title" (obtained from the kernel oops message
>  > via some non-trivial transformation), e.g. "KASAN: use-after-free in
>  > open_file". If we've got a reproducer, this string is used to link it
>  > to the previously happened crash. I don't see where I can put this
>  > string. test.description?
>
> So far my idea was to leave the identification and handling of such strings to
> you. We could then represent that link using an incident object linking a test
> execution to an issue, and the issue could then have the reproducer
> linked/attached in a property.
>
> For now, you can put that information into the "description" (which I plan to
> rename into "comment" sometime soon), or perhaps into the "misc" object.

Wouldn't it be useful to have at least some information about the
actual kernel oops in kcidb?
It would allow searches and interconnect things reported by different
systems. E.g. are there any known issues in this function? Or
understanding that several tests fail due to the same root cause. Or
doing some flakiness analysis, e.g. episodic failures on random tests
but all have similar kernel oopses. Or interconnecting bugs reported
by different syzbot deployments (yes, there are others, I don't know
if they will want to participate, but with support in syzbot code they
will just need to flip a config flag).

>  > 3. The build.id and test.id: should they just be unique?
>
> They need to be unique among all the corresponding objects you're submitting.
> That's the only requirement.
>
>  > Or the system
>  > needs to be able to map these IDs back to objects? In particular does
>  > KCIDB need to generate links back to the external system?
>  > E.g. for each bug we have a page with full info, like this one:
>  > https://syzkaller.appspot.com/bug?extid=8afc256dce324523609d
>  > I think it would be useful for KCIDB to be able to provide this link.
>
> We're considering that, and I agree it could be useful.
> See https://github.com/kernelci/kcidb/issues/93
>
>  > However, the test.id generation that I am thinking of now will give
>  > unique IDs, but we won't be able to map them back to anything useful.
>  > Is it fine or not?
>
> It's OK, as long as it's unique.
>
>  > Currently I also add this link as a resource named "dashboard".  But
>  > that's a custom name that KCIDB won't understand.
>
> We have the "misc" object specifically for things like that: data you'd like
> to see represented in an object, but which isn't supported by the schema yet.
>
> You can put there whatever you want (within reasonable size limit), dashboard
> users can get it now, and we can have a sample of what we need to support in
> the schema.
>
> See https://github.com/kernelci/kcidb/blob/master/SUBMISSION_HOWTO.md#extra-data

Got it.
Yes, some support for "link to external dashboard" would be useful.
Perhaps just a canonical name for resource?


>  > 4. Should we add the kernel oops message itself inline? Or only via a link?
>  > We have kernel oops messages nicely symbolized, cleaned of noise,
>  > cleaned of unrelated threads, etc as you can see here:
>  > https://syzkaller.appspot.com/bug?extid=8afc256dce324523609d
>
> Yes, those are very nice! We're planning to add support for embedding log
> snippets and such into reports (0day needs that too), but for now you'll
> have to submit that as a link to a file hosted somewhere, via test's
> "output_files".
>
>  > 5. We figure out emails (maintainers+lists) that we think should be
>  > looking at this bug report. Where should we put them?
>  > There is revision.contacts, but this is not related to revision but
>  > rather test (or issue).
>
> Yes, there's revision.contacts, which comes from initial CKI needs, and we
> could add the same to the issues, when we have them.
>
> However, with KCIDB, I'd like to try a reverse approach: instead of the CI
> system deciding who to send reports to, give developers control on what they
> receive via a "subscription" system. I.e. let them pick what they'll be
> interested in: which CI systems, which trees, architectures, tests, results,
> and so on. With that approach such data becomes unnecessary.
>
> There's, of course many questions to answer and a proper implementation to
> write before we know how that works, and perhaps we could start with using
> that data, but that's the direction I'd like to try.
>
> With many people submitting and the amount of data we're already getting we
> need to give the developers the upper hand. I think it should be up to the CI
> systems to submit the best data they can, up to KCIDB to provide
> discoverability of that data, and up to developers to decide which data they
> care about.

I see. Makes sense.
But then we need to ensure that kcidb has the necessary info for this.
Again, fuzzing is different from unit testing in this regard. We
effectively have 1 test case "syzkaller" and crashes happen on an
"upstream" tree and the commit we point to is not related to the crash
(it just describes the state of the tree). That's no useful
information to subscribe to at all.

The way we do it is as follows. We analyze the oops message to find
what we assume is the guilty source file and then run
get_maintainers.pl on the file. I assume it's very reasonable for
developers to subscribe to parts of the source tree they are
interested in (e.g. net/sctp/*). But for this kcidb will need either
the file name or the oops message (in machine discoverable form).
