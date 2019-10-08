MIME-Version: 1.0
References: <CACT4Y+YjOxmOzzPt_xaYE44QNZfq9haNfbnVBrTnPXe7zuSEfA@mail.gmail.com>
 <87zhibwgzm.fsf@rpws.prws.suse.cz>
In-Reply-To: <87zhibwgzm.fsf@rpws.prws.suse.cz>
From: "Dmitry Vyukov" <dvyukov@google.com>
Date: Tue, 8 Oct 2019 14:53:24 +0200
Message-ID: <CACT4Y+akZ4h9kN1Gg329-fKq-G=QeDdoFxW_Bp_r7+0sDsE+mw@mail.gmail.com>
Subject: Re: [Automated-testing] syzkaller reproducers
Content-Type: text/plain; charset="UTF-8"
List-ID: <kernelci.groups.io>
To: rpalethorpe@suse.de
Cc: automated-testing@yoctoproject.org, Shuah Khan <shuah@kernel.org>, "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, kernelci@groups.io, syzkaller <syzkaller@googlegroups.com>

On Tue, Oct 8, 2019 at 2:37 PM Richard Palethorpe <rpalethorpe@suse.de> wrote:
>
> Hello,
>
> Dmitry Vyukov <dvyukov@google.com> writes:
>
> > Hi Shuah,
> >
> > We discussed collecting and uploading all syzkaller reproducers
> > somewhere. You wanted to see how they look. I've uploaded all current
> > reproducers here:
> > https://github.com/dvyukov/syzkaller-repros
> > Minimalistic build/run scripts are included.
> > +some testing mailing lists too as this can be used as a test suite
> > If you have any potential uses for this, you are welcome to use it.
> > But then we probably need to find some more official and shared place
> > for them than my private github.
> > The test programs can also be bulk updated if necessary, because all
> > of this is auto-generated.
> >
> > Thanks
>
> I discussed this a bit with Metan. We think it would be fairly trivial
> to create an LTP wrapper for these.
>
> So we just create an LTP test which forks and execs one of these
> reproducers then checks for kernel taints after the child completes or
> is killed. It can take the reproducer path as an argument and we can
> generate a runtest file with all the reproducers in that we are able to
> compile.
>
> I imagine a lot of these reproducers will not work on older kernels, so
> this would just be a best efforts basis. We would ignore any problems
> during execution unless there is a kernel error.
>
> This should work with existing LTP runners with maybe a minor change or
> two to building and configuration.
>
> I will start experimenting with this and post the results to the LTP
> mailing list.


Hi Richard,

Sounds great!

Yes, these are totally best effort. May also require some configs, etc.
Also note that each should be run in a clean temp dir and with a
timeout b/c some have an infinite loop.
