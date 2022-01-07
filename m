MIME-Version: 1.0
References: <CACT4Y+ZtsKROJu13VSZcJDCb=rHbF7oh09LVUe3NKGDO3X4L0g@mail.gmail.com>
 <c0585fe0-6502-8c7c-45ad-e6f2e6a99383@gmail.com>
In-Reply-To: <c0585fe0-6502-8c7c-45ad-e6f2e6a99383@gmail.com>
From: "Dmitry Vyukov" <dvyukov@google.com>
Date: Fri, 7 Jan 2022 17:31:27 +0100
Message-ID: <CACT4Y+aiR==TQdpEDbVCOPej0CzcaLF_xvw7XTiwFaZb3fi_ag@mail.gmail.com>
Subject: Re: Resource not found (resource=kernelci_new)
Content-Type: text/plain; charset="UTF-8"
List-ID: <kernelci.groups.io>
To: Nikolai Kondrashov <spbnick@gmail.com>
Cc: kernelci@groups.io, syzkaller <syzkaller@googlegroups.com>, Taras Madan <tarasmadan@google.com>

On Fri, 7 Jan 2022 at 17:25, Nikolai Kondrashov <spbnick@gmail.com> wrote:
>
> Hi Dmitry,
>
> This is due to the rename of the submission topic I announced in the "#KCIDB
> v9 release" thread. You were in the recipients, but perhaps the address was
> wrong, or you didn't get it for some other reason?

No, I just missed that part.

> It should work again, if you switch to using "kcidb_new" topic, instead of
> "kernelci_new".

Aha! Thanks

> Thank you.
> Nick
>
> On 1/7/22 17:38, Dmitry Vyukov via groups.io wrote:
> > Hi,
> >
> > We've started getting the following errors on syzbot while trying to
> > submit KCIDB reports:
> >
> > Jan  5 12:09:00: 200 GET /kcidb_poll "kcidb: upstream failed: rpc
> > error: code = NotFound desc = Resource not found
> > (resource=kernelci_new)."
> > Jan  5 12:14:00: 200 GET /kcidb_poll "kcidb: upstream failed: rpc
> > error: code = NotFound desc = Resource not found
> > (resource=kernelci_new)."
> > Jan  5 12:19:00: 200 GET /kcidb_poll "kcidb: upstream failed: rpc
> > error: code = NotFound desc = Resource not found
> > (resource=kernelci_new)."
> >
> > There may be something changed/broken on our side. But I don't see
> > anything obvious yet. So wanted to ask if it rings any bells on your
> > end?
> >
> > Thanks
> >
> >
> > 
> >
> >
>
