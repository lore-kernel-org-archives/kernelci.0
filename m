MIME-Version: 1.0
References: <CACT4Y+YjOxmOzzPt_xaYE44QNZfq9haNfbnVBrTnPXe7zuSEfA@mail.gmail.com>
 <CACT4Y+ZaN900gwx=PHS10hrKofZib7HA7JFxE_DkwChyttYW+A@mail.gmail.com>
 <876a2abe-41ab-5819-4ae8-ad26186d0d1c@kernel.org> <226099bc-9763-3a73-e26a-b292f601494c@kernel.org>
 <20191011180248.GA24089@rei.lan> <b715f3d7-547f-9a43-dc41-2e46ec3bfd51@kernel.org>
 <20191014085414.GB31760@rei.lan> <CACT4Y+aKbgT=i8C5aZvp8ZV52PamGm=GdnR6kQecczLQOQSGqA@mail.gmail.com>
 <62903a33-8ffc-56b6-de1a-539f10b5de2a@oracle.com> <20191015134407.GA12523@rei.lan>
In-Reply-To: <20191015134407.GA12523@rei.lan>
From: "Dmitry Vyukov" <dvyukov@google.com>
Date: Wed, 23 Oct 2019 15:24:17 +0200
Message-ID: <CACT4Y+azc_6aoEf4GaVFwwZgLp9QcCk3jJB-spM9s5BUB8Gxqg@mail.gmail.com>
Subject: Re: [Automated-testing] syzkaller reproducers
Content-Type: text/plain; charset="UTF-8"
List-ID: <kernelci.groups.io>
To: Cyril Hrubis <chrubis@suse.cz>
Cc: George Kennedy <george.kennedy@oracle.com>, shuah <shuah@kernel.org>, "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, automated-testing@yoctoproject.org, kernelci@groups.io, Dhaval Giani <dhaval.giani@gmail.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Jan Setje-Eilers <jan.setjeeilers@oracle.com>, syzkaller <syzkaller@googlegroups.com>

On Tue, Oct 15, 2019 at 3:44 PM Cyril Hrubis <chrubis@suse.cz> wrote:
>
> Hi!
> > >> I do not think that these scripts are ever supposed to be the used in
> > >> production testing, you need much more than this to produce results
> > >> reliably. I would expect that they are supposed to be a form of very
> > >> minimal documentation.
> > > Yes, I just added them as quick hints: some repros are 32-bits; each
> > > needs a new dir; some external timeout is needed for each test.
> > Thank you again for the collection of repro C programs!
> >
> > Hitting a lot more crashes with the collection of repro C programs than
> > in all the hours of running Syzkaller. Wonder why? Any idea? This is
> > with the same kernel and VM that Syzkaller is run on.
>
> I would guess that these reproducers are product of countless hours of
> fuzzing, so it's about to be expected...


Probably. Hard to say.
If you used KCOV, KCOV_ENABLE_COMPARISONS, KASAN, LOCKDEP,
FAULT_INJECTION, all other debugging configs, compat instance and some
required image/cmdline features, then the only reason for difference
that I see is indeed longer fuzzing time.
