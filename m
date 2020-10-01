MIME-Version: 1.0
References: <20200707222342.scrz75265etaqlmd@redhat.com> <CACT4Y+beU9XoOt5XXLEarKyWvkhyRKC5aJRc6djmHsUqO+AbJA@mail.gmail.com>
 <8d422dcf-d4ef-8e74-be82-f52272d9a966@redhat.com> <CACT4Y+a5spdA8TZNeaXFYj4QEw_=howfhu9YGsNm3rC8XPAJnA@mail.gmail.com>
 <d9919812-9763-9c02-3e5d-978fac8fe1f7@redhat.com> <CACT4Y+a3L+_8kpXq-WdNZxJESCvnCvfakJ3CymVwmZZA6kv+0w@mail.gmail.com>
 <CACT4Y+aFc7DoUBF=DLh2oBHy=3pKLACnhb3v88Tt4bkjarGUTg@mail.gmail.com>
 <CACT4Y+YR-Gv5NnTbs+04gjA7LABRnCidAkbE9_tE=YrGDgYL2Q@mail.gmail.com>
 <863511a8-090a-6ee1-ddce-f32d70458ee8@redhat.com> <CACT4Y+biFKO-Bauixm_DtEGTAUzHXTf0iXuFx1A=WTLmBhvSDg@mail.gmail.com>
 <1ff4a09c-4529-017c-5b0b-43712575771b@redhat.com> <16397F50C12D08DD.21243@groups.io>
 <CACT4Y+aqdTZ7r-tvFcajqcX5n7gO1RJ+9_vsbsYJPsypeYH3vQ@mail.gmail.com>
 <521cc33e-62fc-55c1-aeb2-682007243d97@redhat.com> <ff5139e8-b8e5-93dc-9654-d53e4888c2bc@redhat.com>
 <CACT4Y+Y561P7oJYYNn7XuqieTS-dJmaFH+NTS7OzRi=X_STD3w@mail.gmail.com>
 <ac531987-4600-f48c-4fe6-8a1abd8ccf51@gmail.com> <8c580a6a-e24e-4c67-5202-ec35612094f3@redhat.com>
In-Reply-To: <8c580a6a-e24e-4c67-5202-ec35612094f3@redhat.com>
From: "Dmitry Vyukov" <dvyukov@google.com>
Date: Thu, 1 Oct 2020 18:00:57 +0200
Message-ID: <CACT4Y+bO_FZsDkrBh2LtxQ+QyxXP5S7e+szO-HYxuj=GyKjUMA@mail.gmail.com>
Subject: Re: [kernelci-members] Working with the KernelCI project
Content-Type: text/plain; charset="UTF-8"
List-ID: <kernelci.groups.io>
To: Nikolai Kondrashov <Nikolai.Kondrashov@redhat.com>
Cc: Nikolai Kondrashov <spbnick@gmail.com>, kernelci@groups.io, Guillaume Tucker <guillaume.tucker@collabora.com>, Philip Li <philip.li@intel.com>, kernelci-members@groups.io, nkondras@redhat.com, Don Zickus <dzickus@redhat.com>, syzkaller <syzkaller@googlegroups.com>, =?UTF-8?Q?I=C3=B1aki_Malerba?= <imalerba@redhat.com>

On Thu, Oct 1, 2020 at 5:52 PM Nikolai Kondrashov
<Nikolai.Kondrashov@redhat.com> wrote:
>
> On 10/1/20 6:49 PM, Nikolai Kondrashov wrote:
> > On 10/1/20 5:48 PM, Dmitry Vyukov via groups.io wrote:
> >  > On Thu, Oct 1, 2020 at 3:32 PM Nikolai Kondrashov
> >  > <Nikolai.Kondrashov@redhat.com> wrote:
> >  >>
> >  >> On 10/1/20 1:48 PM, Nikolai Kondrashov wrote:
> >  >>   > Here are the things which could be improved:
> >  >>
> >  >> Oh, and another thing: could you avoid re-sending the identical
> >  >> revisions/builds you've already sent? I.e. send them only once, unless you
> >  >> have fields to add? Each of those costs us a row in the database, which is not
> >  >> a big deal, but would be good to avoid.
> >  >
> >  > Do you see that we send dups? I've added logic to not send dups and
> >  > from what I see it's working.
> >
> > Please find attached a zip archive with seven submissions from about six hours
> > ago. Each has revisions with the same id and git_commit_hash. Some of those
> > revisions have different discovery_time, and that alone shouldn't really be
> > the reason to resend. Each of those submissions have a build object, but some
> > of them are repeated.
> >
> > Revision with that git_commit_hash was submitted at least 72 times.
>
> And now the file is attached :D

This is intentional (in the current implementation) and is a
consequence of the fact that we always send all 3 entities for each
issue/test failure. It's much simpler on our side this way. If we
would send a test failure multiple times it would be unintentional.

Identical builds should have the same id, though. And if they have
different id's, then these are different builds.

Revisions were discovered separately by different instances, that's
why they have different discovery time. Consider that as if different
origin systems would discover it separately. Since discovery time is
not an inherent property of the commit itself, there is no way they
can agree on it. Will it be better if we don't send discovery time at
all?

Amount of duplication for builds/revisions is capped by the number of
bugs we discover, since build/revision is only sent with a bug once.
So it's not that it's unlimited.
