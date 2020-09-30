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
Date: Wed, 30 Sep 2020 09:07:23 +0200
Message-ID: <CACT4Y+ZkseZrnnCg4JNZJFjsSnZMuQaZcJrQ_sKLcfJ6gZZZBQ@mail.gmail.com>
Subject: Re: [kernelci-members] Working with the KernelCI project
Content-Type: text/plain; charset="UTF-8"
List-ID: <kernelci.groups.io>
To: Nikolai Kondrashov <Nikolai.Kondrashov@redhat.com>
Cc: kernelci@groups.io, Guillaume Tucker <guillaume.tucker@collabora.com>, Philip Li <philip.li@intel.com>, kernelci-members@groups.io, nkondras@redhat.com, Don Zickus <dzickus@redhat.com>, syzkaller <syzkaller@googlegroups.com>, =?UTF-8?Q?I=C3=B1aki_Malerba?= <imalerba@redhat.com>

On Tue, Sep 29, 2020 at 7:13 PM Nikolai Kondrashov
<Nikolai.Kondrashov@redhat.com> wrote:
>
> Hi Dmitry,
> On 9/29/20 10:52 AM, Dmitry Vyukov wrote:
>  > I managed to upload some data manually! Woohoo!
>  > https://staging.kernelci.org:3000/d/home/home?orgId=1&refresh=30m&var-origin=syzbot&var-git_repository_url=All&var-dataset=playground_kernelci04
>
> Aweeesooomeee :)
>
>  > Some questions regarding data conversion:
>  >
>  > 1. We usually first get just a crash on 1 instance. Then later we may
>  > get a reproducer, or we see it happen on more trees, or we've got
>  > bisection results, or something tested a proposed fix. How can we
>  > "add" more to the same instance of the bug?
>
> Currently we don't have support for issues/incidents, so we can only accept
> test results without the issue context. That will have to do for the start.
>
> Once we have support for issues/incidents I think we would be able to use the
> feature I'm working on next - an ability to add previously-missing fields to
> an already-submitted object.
>
> So, you would send a test result object, then an issue object with minimal
> information, and then an incident object linking the two. As you get to know
> more about the issue, you can send it again, omitting the fields you already
> sent (or sending them with exact same values), but adding the
> previously-missing fields with the new data. I.e. you first send the issue
> without the proposed fix, and then send it again with the fix.
>
> This feature is still in the research stage, but I'll be working on it after
> the next kcidb release, which is coming in one or two weeks.
>
> Regarding bisection results I was hoping we could represent that data
> implicitly. I.e. by having information about which 'revision' comes after
> which, and executing a query to find a pair of adjacent revisions one of which
> has the bug and another doesn't. In theory that should be possible, but in
> practice... well, you know :) If that fails, we can attach that data
> explicitly somewhere. Or we can simply start with that to have it faster.

Humm... interesting. I guess it can work. We could mark the issue as
happening on the cause commit and as not happening on the previous
commit.
However, one problem is that we don't keep info about the previous
commit as of now, we only store the root cause commit in the database.
Another is that in git it's possible to have several preceding
commits.
