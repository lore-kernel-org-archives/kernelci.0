MIME-Version: 1.0
References: <CACT4Y+YjOxmOzzPt_xaYE44QNZfq9haNfbnVBrTnPXe7zuSEfA@mail.gmail.com>
 <CACT4Y+ZaN900gwx=PHS10hrKofZib7HA7JFxE_DkwChyttYW+A@mail.gmail.com>
 <876a2abe-41ab-5819-4ae8-ad26186d0d1c@kernel.org> <226099bc-9763-3a73-e26a-b292f601494c@kernel.org>
 <20191011180248.GA24089@rei.lan> <b715f3d7-547f-9a43-dc41-2e46ec3bfd51@kernel.org>
 <20191014085414.GB31760@rei.lan> <CACT4Y+aKbgT=i8C5aZvp8ZV52PamGm=GdnR6kQecczLQOQSGqA@mail.gmail.com>
 <62903a33-8ffc-56b6-de1a-539f10b5de2a@oracle.com> <86bde120-e5fe-4bb1-9b93-769a444500f9@oracle.com>
 <e8b11b09-37ac-6ae2-0908-b803b4160f7c@oracle.com>
In-Reply-To: <e8b11b09-37ac-6ae2-0908-b803b4160f7c@oracle.com>
From: "Dmitry Vyukov" <dvyukov@google.com>
Date: Mon, 27 Jan 2020 16:26:42 +0100
Message-ID: <CACT4Y+bShy-3vO3ifNKVcGGNf3X9XA7zL-Ja9-T+gZv5=QNe4w@mail.gmail.com>
Subject: Re: [Automated-testing] syzkaller reproducers
Content-Type: text/plain; charset="UTF-8"
List-ID: <kernelci.groups.io>
To: George Kennedy <george.kennedy@oracle.com>
Cc: Cyril Hrubis <chrubis@suse.cz>, shuah <shuah@kernel.org>, "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, automated-testing@yoctoproject.org, kernelci@groups.io, Dhaval Giani <dhaval.giani@gmail.com>, Jan Setje-Eilers <jan.setjeeilers@oracle.com>, syzkaller <syzkaller@googlegroups.com>, Dan Carpenter <dan.carpenter@oracle.com>

Hi George,

This was still starred in my inbox, but I never got to actually do
anything with it. Thanks for pinging me. I thought that the script to
extract the repros won't work for some reason and that I will need to
fix it first. But turns out it's still working as-is (I wanted to
submit some changes that would break it, but I never go to that as
well. Good! :)).

So here is a new drop in with 692 repros:
https://github.com/dvyukov/syzkaller-repros/commit/6a06992209c328a3115c89c020f45b844b103573
Enjoy!

Yes, we have separate managers for each version, the entries in the
Instances table correspond to syz-manager one-to-one:
https://syzkaller.appspot.com/upstream
https://syzkaller.appspot.com/linux-4.19
https://syzkaller.appspot.com/android-54



On Mon, Jan 27, 2020 at 3:20 PM George Kennedy
<george.kennedy@oracle.com> wrote:
>
> Hi Dmitry,
>
> Re-sending this request.
>
> Also, how do you track the Upstream branches with Syzkaller? Do you have
> a version of Syzkaller for each (i.e. 4.14, 4.19, etc)?
>
> Thank you,
> George
>
> On 12/6/2019 3:06 PM, George Kennedy wrote:
> > Hello Dmitry,
> >
> > Could we get another drop of the Syzkaller C reproducers?
> >
> > Wonder if we could get the drop periodically (i.e. a drop/quarter or a
> > drop to match a major linux release)?
> >
> > Thank you,
> > George
>
