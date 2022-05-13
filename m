MIME-Version: 1.0
References: <CACT4Y+YjOxmOzzPt_xaYE44QNZfq9haNfbnVBrTnPXe7zuSEfA@mail.gmail.com>
 <CACT4Y+ZaN900gwx=PHS10hrKofZib7HA7JFxE_DkwChyttYW+A@mail.gmail.com>
 <876a2abe-41ab-5819-4ae8-ad26186d0d1c@kernel.org> <226099bc-9763-3a73-e26a-b292f601494c@kernel.org>
 <20191011180248.GA24089@rei.lan> <b715f3d7-547f-9a43-dc41-2e46ec3bfd51@kernel.org>
 <20191014085414.GB31760@rei.lan> <CACT4Y+aKbgT=i8C5aZvp8ZV52PamGm=GdnR6kQecczLQOQSGqA@mail.gmail.com>
 <62903a33-8ffc-56b6-de1a-539f10b5de2a@oracle.com> <86bde120-e5fe-4bb1-9b93-769a444500f9@oracle.com>
 <e8b11b09-37ac-6ae2-0908-b803b4160f7c@oracle.com> <CACT4Y+bShy-3vO3ifNKVcGGNf3X9XA7zL-Ja9-T+gZv5=QNe4w@mail.gmail.com>
 <8a4dbbb1-f8ba-00ba-41d2-d82a35fc0f81@oracle.com> <CACT4Y+aZ=rBZXdnrU0D-21QqSK0G3vqHU+iD=k0PhGgo3TL6rA@mail.gmail.com>
 <fe365a78-0768-ea1f-25b8-6bd05a57c751@kernel.org> <cd301033-f152-4eeb-bce3-2d95f39a05fbn@googlegroups.com>
 <CAGyP=7cb=5Hse-xJsyzdVKpOru_Uptjm529owLfVMqjv3VSMtw@mail.gmail.com>
In-Reply-To: <CAGyP=7cb=5Hse-xJsyzdVKpOru_Uptjm529owLfVMqjv3VSMtw@mail.gmail.com>
From: "Dmitry Vyukov" <dvyukov@google.com>
Date: Fri, 13 May 2022 11:29:27 +0200
Message-ID: <CACT4Y+aSy4LOmXfWxA2KrkLwwn-qWxVKxGsz_LxuF32CxaLYeQ@mail.gmail.com>
Subject: Re: [Automated-testing] syzkaller reproducers
Content-Type: text/plain; charset="UTF-8"
List-ID: <kernelci.groups.io>
To: kernelci@groups.io, oswalpalash@gmail.com
Cc: syzkaller <syzkaller@googlegroups.com>, Shuah Khan <skhan@linuxfoundation.org>, automated-testing@yoctoproject.org, george.kennedy@oracle.com

On Fri, 13 May 2022 at 02:54, Palash Oswal <oswalpalash@gmail.com> wrote:
>
> + Shuah, George and mailing lists
>
> Google groups did not CC all of the members in the thread for my
> reply. It would be valuable to get everyone's feedback on this thread.
>
> On Sat, May 7, 2022 at 11:34 PM Palash <oswalpalash@gmail.com> wrote:
> >
> > Hello all,
> >
> > Reviving this old thread. Do we think there's value in automatically publishing a C reproducer(if it exists) whenever syzkaller determines a reported bug is patched and fixed?
> > This allows us to track these reproducers more diligently and we only have reproducers for the bugs that have been patched.
> > If this is valuable, then we could think about answering these questions -
> > 1. Is there a particular way we want to format the reproducers? (Example : SKIP/OK/FAIL/TIMEOUT (if output is possible))
> > 2. Where do we want to submit the reproducers to be added to the testing project and what is the process we want to use?
> > 3. Is it valuable to record the crash report information for the original fuzzer crash when the c reproducer is filed to add context to it; in case developers want to troubleshoot? This could save valuable debugging time.
> >
> > Happy to contribute on this change to the upstream fuzzing system.


More automation is definitely welcome.
I am not sure how widely used is the current base of reproducers. But
George keeps asking for updates and I keep failing at doing it in a
timely manner.

It would be easiest for the syzbot app to upload reproducers to a GCS
bucket. But I am not sure what's a good format for this. Everything I
can think of is somewhat clumsy. It could upload weekly archives, but
then there is an issue of discoverability of new archives (since GCS
is HTTP rather than FTP).

Not sure if it's feasible to give it an auth token for a github repo
to push individual files as we do now.

Re format. Bonus points if the system will be able to regenerate and
update meta-information. The chances that we will come up with the
ultimately right format from day 1 are low. But that may complicate
the implementation.




> > Thanks,
> > Palash
> > On Friday, March 13, 2020 at 11:59:31 AM UTC-4 shuah wrote:
> >>
> >> On 3/3/20 1:45 AM, Dmitry Vyukov wrote:
> >> > Shauh,
> >> >
> >> > We've added more reproducers to:
> >> > https://github.com/dvyukov/syzkaller-repros/tree/master/linux
> >> >
> >> > It makes sense to pull in them to the kernel-arts repo. Not sure
> >> > what's the most convenient way for you since it's not exactly a
> >> > traditional "patch"? Perhaps you just copy linux/*.c files and commit?
> >> >
> >>
> >> Thanks Dmitry. I will pull these in. I will pull these in.
> >>
> >> thanks,
> >> -- Shuah
> >
> > --
> > You received this message because you are subscribed to a topic in the Google Groups "syzkaller" group.
> > To unsubscribe from this topic, visit https://groups.google.com/d/topic/syzkaller/RQFLqAvdsEc/unsubscribe.
> > To unsubscribe from this group and all its topics, send an email to syzkaller+unsubscribe@googlegroups.com.
> > To view this discussion on the web visit https://groups.google.com/d/msgid/syzkaller/cd301033-f152-4eeb-bce3-2d95f39a05fbn%40googlegroups.com.
>
>
> 
>
>
