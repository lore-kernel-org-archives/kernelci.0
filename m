Subject: Re: [kernelci-members] Working with the KernelCI project
References: <20200707222342.scrz75265etaqlmd@redhat.com>
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
 <CACT4Y+ZkseZrnnCg4JNZJFjsSnZMuQaZcJrQ_sKLcfJ6gZZZBQ@mail.gmail.com>
 <355fdccc-718f-5c2a-c75e-471f7b870e93@redhat.com>
 <CACT4Y+afQg88A4sJMaxe5tqLN3=rsCEBKCThLf5n4H24Mk3KBQ@mail.gmail.com>
From: "Nikolai Kondrashov" <Nikolai.Kondrashov@redhat.com>
Message-ID: <8635f854-d04a-628d-4930-2aa8030bc60a@redhat.com>
Date: Thu, 1 Oct 2020 13:51:28 +0300
MIME-Version: 1.0
In-Reply-To: <CACT4Y+afQg88A4sJMaxe5tqLN3=rsCEBKCThLf5n4H24Mk3KBQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
List-ID: <kernelci.groups.io>
To: Dmitry Vyukov <dvyukov@google.com>
Cc: kernelci@groups.io, Guillaume Tucker <guillaume.tucker@collabora.com>, Philip Li <philip.li@intel.com>, kernelci-members@groups.io, nkondras@redhat.com, Don Zickus <dzickus@redhat.com>, syzkaller <syzkaller@googlegroups.com>, =?UTF-8?Q?I=c3=b1aki_Malerba?= <imalerba@redhat.com>

On 10/1/20 11:43 AM, Dmitry Vyukov wrote:
 > On Thu, Oct 1, 2020 at 10:30 AM Nikolai Kondrashov
 > <Nikolai.Kondrashov@redhat.com> wrote:
 >>
 >> On 9/30/20 10:07 AM, Dmitry Vyukov wrote:
 >>   > On Tue, Sep 29, 2020 at 7:13 PM Nikolai Kondrashov
 >>   > <Nikolai.Kondrashov@redhat.com> wrote:
 >>   >> Regarding bisection results I was hoping we could represent that data
 >>   >> implicitly. I.e. by having information about which 'revision' comes after
 >>   >> which, and executing a query to find a pair of adjacent revisions one of which
 >>   >> has the bug and another doesn't. In theory that should be possible, but in
 >>   >> practice... well, you know :) If that fails, we can attach that data
 >>   >> explicitly somewhere. Or we can simply start with that to have it faster.
 >>   >
 >>   > Humm... interesting. I guess it can work. We could mark the issue as
 >>   > happening on the cause commit and as not happening on the previous
 >>   > commit.
 >>   > However, one problem is that we don't keep info about the previous
 >>   > commit as of now, we only store the root cause commit in the database.
 >>
 >> Something has to maintain the information on history connectivity, and so far
 >> the plan was to let the submitting system do it. E.g. refer to a clone of the
 >> repo they're testing. There's definitely more research and design to be done.
 >>
 >> However, you should've been testing the previous commit to be able to find the
 >> root cause commit? Shouldn't you?
 >
 > We do. But that happens in a very different part of the system and
 > that info is not kept in a structured form because it's not useful for
 > anything in our system.
 >
 > Well, it actually turned out that it's not necessary to test all of
 > the parents of a commit during bisection to point at a particular
 > commit in some interesting git tree topologies.

Ah, I see I'll need to ask you more questions about bisections once we get to
that :)

 >>   > Another is that in git it's possible to have several preceding
 >>   > commits.
 >>
 >> Right, I didn't think through that yet. We might need a separate history link
 >> object, then. Do you know if a commit can have more than two parents?
 >
 > Octopus merge commits can have lots of parents.

Right, I forgot about those.

Thank you!
Nick

