MIME-Version: 1.0
References: <20200707222342.scrz75265etaqlmd@redhat.com> <42d15463-e4ee-4c0b-c63f-dce7acb05e35@collabora.com>
 <CACT4Y+ZLoBLFWRM+RcKZJyR2Hh5az9W8_329ShM9JuSg6V4uVw@mail.gmail.com>
 <bbeeb467-1571-5404-7408-9b112d64e928@redhat.com> <CACT4Y+a1t-9sT7xz7d=Wmesnn_QoUqfipmoZXBu40_B+GQy=nQ@mail.gmail.com>
 <031d1941-2842-fc79-2a21-66bccb17f91c@redhat.com> <adb7924d-b524-2f86-05fd-dc0233004652@redhat.com>
 <CACT4Y+beU9XoOt5XXLEarKyWvkhyRKC5aJRc6djmHsUqO+AbJA@mail.gmail.com>
 <8d422dcf-d4ef-8e74-be82-f52272d9a966@redhat.com> <CACT4Y+a5spdA8TZNeaXFYj4QEw_=howfhu9YGsNm3rC8XPAJnA@mail.gmail.com>
 <d9919812-9763-9c02-3e5d-978fac8fe1f7@redhat.com> <CACT4Y+a3L+_8kpXq-WdNZxJESCvnCvfakJ3CymVwmZZA6kv+0w@mail.gmail.com>
 <CACT4Y+aFc7DoUBF=DLh2oBHy=3pKLACnhb3v88Tt4bkjarGUTg@mail.gmail.com>
 <CACT4Y+YR-Gv5NnTbs+04gjA7LABRnCidAkbE9_tE=YrGDgYL2Q@mail.gmail.com> <863511a8-090a-6ee1-ddce-f32d70458ee8@redhat.com>
In-Reply-To: <863511a8-090a-6ee1-ddce-f32d70458ee8@redhat.com>
From: "Dmitry Vyukov" <dvyukov@google.com>
Date: Tue, 29 Sep 2020 09:52:10 +0200
Message-ID: <CACT4Y+biFKO-Bauixm_DtEGTAUzHXTf0iXuFx1A=WTLmBhvSDg@mail.gmail.com>
Subject: Re: [kernelci-members] Working with the KernelCI project
Content-Type: text/plain; charset="UTF-8"
List-ID: <kernelci.groups.io>
To: Nikolai Kondrashov <Nikolai.Kondrashov@redhat.com>
Cc: kernelci@groups.io, Guillaume Tucker <guillaume.tucker@collabora.com>, Philip Li <philip.li@intel.com>, kernelci-members@groups.io, nkondras@redhat.com, Don Zickus <dzickus@redhat.com>, syzkaller <syzkaller@googlegroups.com>, =?UTF-8?Q?I=C3=B1aki_Malerba?= <imalerba@redhat.com>

On Mon, Sep 28, 2020 at 7:16 PM Nikolai Kondrashov
<Nikolai.Kondrashov@redhat.com> wrote:
>
> On 9/28/20 7:24 PM, Dmitry Vyukov wrote:
>  > I've submitted the following json to the pubsub endpoint, and it seems
>  > to succeed as I got server message ID back: 1592574115213643
>
> Weeeell, the message ID is only a confirmation that the message reached the
> queue, we could still fail after taking it out of the queue :)
>
> The PubSub protocol (or any message queue for that matter) simply doesn't
> provide a way to report on how the message was used on the other end.
>
>  > But I can't find this entry on the dashboard, among other places I've looked at:
>  > https://staging.kernelci.org:3000/d/home/home?orgId=1&from=now-30m&to=now&var-origin=syzbot&var-git_repository_url=All&var-dataset=playground_kernelci04&refresh=30m
>  > Wasn't it submitted? Or am I looking in  a wrong place? Or is there some log?
>
> It was submitted, but it wasn't valid according to the schema.
>
> As I said earlier, we haven't implemented sending server-side errors to
> submitters yet, although I have some ideas how that could be done.
>
> So, to minimize the errors on the server side, please make sure to validate
> your JSON before submitting. You can take the schema produced by kcidb-schema
> and use it with a Go module for JSON validation. Apparently there are at least
> three of them: https://json-schema.org/implementations.html#validator-go
>
> For the start, though, you can also use "kcidb-validate". Its output is
> somewhat more verbose than it should be, and we're working on that, but if you
> feed the JSON you sent to it like this:
>
>      kcidb-validate < syzbot.json
>
> somewhere closer to the end of the output you'll find:
>
>      ValidationError: None is not of type 'array'
>
>      Failed validating 'type' in schema['properties']['revisions']['items']['properties']['patch_mboxes']:
>
> It basically says that it didn't expect to find "null" as the value for the
> "patch_mboxes" property.
>
> In general "null"s are not accepted by the schema, to minimize ambiguity and
> the number of checks when interpreting the data. If you want to omit any data,
> just don't add the corresponding property.
>
> Other errors are:
>
> * "message_id" is specified as an empty string, but it should be an e-mail
>    address. Just omit the property if you have nothing to send.
> * "publishing_time" is an empty string and not an RFC3339 timestamp. Again,
>    just omit it, if you don't have it.
> * "log_url" should be a URL, but is an empty string. Same approach.
>
> After the above is fixed, the file will validate. However, there are still
> issues of the same sort - empty properties, which would be good to just
> remove: "command", "config_name", "description", "git_commit_name",
> "tree_name". Perhaps we should make the schema check those as well.
>
> I've fixed all of the issues in the JSON you provided and attached it as
> "syzbot_fixed.json".

I managed to upload some data manually! Woohoo!
https://staging.kernelci.org:3000/d/home/home?orgId=1&refresh=30m&var-origin=syzbot&var-git_repository_url=All&var-dataset=playground_kernelci04

Some questions regarding data conversion:

1. We usually first get just a crash on 1 instance. Then later we may
get a reproducer, or we see it happen on more trees, or we've got
bisection results, or something tested a proposed fix. How can we
"add" more to the same instance of the bug?

2. Maybe a related question: we generally identify bugs and bucket
crashes based on "crash title" (obtained from the kernel oops message
via some non-trivial transformation), e.g. "KASAN: use-after-free in
open_file". If we've got a reproducer, this string is used to link it
to the previously happened crash. I don't see where I can put this
string. test.description?

3. The build.id and test.id: should they just be unique? Or the system
needs to be able to map these IDs back to objects? In particular does
KCIDB need to generate links back to the external system?
E.g. for each bug we have a page with full info, like this one:
https://syzkaller.appspot.com/bug?extid=8afc256dce324523609d
I think it would be useful for KCIDB to be able to provide this link.
However, the test.id generation that I am thinking of now will give
unique IDs, but we won't be able to map them back to anything useful.
Is it fine or not?
Currently I also add this link as a resource named "dashboard".  But
that's a custom name that KCIDB won't understand.

4. Should we add the kernel oops message itself inline? Or only via a link?
We have kernel oops messages nicely symbolized, cleaned of noise,
cleaned of unrelated threads, etc as you can see here:
https://syzkaller.appspot.com/bug?extid=8afc256dce324523609d

5. We figure out emails (maintainers+lists) that we think should be
looking at this bug report. Where should we put them?
There is revision.contacts, but this is not related to revision but
rather test (or issue).

6. We have that tagged Reported-by line that we very much want
developers to use in the fixing commit to understand when bugs are
fixed.
If we detach them from info/reports available in KCIDB, then nobody
will use them in commits.
How can we pass it to KCIDB? Perhaps it's a useful feature for all
reports/test failures? If a bug is reported by Fuego and KCIDB
notifications/dashboard will ask to use "Reported-by: fuego", it will
give nice credits. We also found use of the hashes in the tag very
useful for statistics/tracking purposes. It makes it possible to link
failures to fixing commits and understand if a fix (1) exists in
general, (2) present in a particular tree, (3) or even if somebody
just mailed a proposed fix (useful to identify lost fixes that were
never merged, or avoid several people fixing the same bug if you can
show that somebody mailed a fix already).
