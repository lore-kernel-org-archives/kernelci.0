MIME-Version: 1.0
References: <CACT4Y+YjOxmOzzPt_xaYE44QNZfq9haNfbnVBrTnPXe7zuSEfA@mail.gmail.com>
 <20191014085414.GB31760@rei.lan> <CACT4Y+aKbgT=i8C5aZvp8ZV52PamGm=GdnR6kQecczLQOQSGqA@mail.gmail.com>
 <62903a33-8ffc-56b6-de1a-539f10b5de2a@oracle.com> <86bde120-e5fe-4bb1-9b93-769a444500f9@oracle.com>
 <e8b11b09-37ac-6ae2-0908-b803b4160f7c@oracle.com> <CACT4Y+bShy-3vO3ifNKVcGGNf3X9XA7zL-Ja9-T+gZv5=QNe4w@mail.gmail.com>
 <8a4dbbb1-f8ba-00ba-41d2-d82a35fc0f81@oracle.com> <CACT4Y+aZ=rBZXdnrU0D-21QqSK0G3vqHU+iD=k0PhGgo3TL6rA@mail.gmail.com>
 <fe365a78-0768-ea1f-25b8-6bd05a57c751@kernel.org> <cd301033-f152-4eeb-bce3-2d95f39a05fbn@googlegroups.com>
 <CAGyP=7cb=5Hse-xJsyzdVKpOru_Uptjm529owLfVMqjv3VSMtw@mail.gmail.com>
 <CACT4Y+aSy4LOmXfWxA2KrkLwwn-qWxVKxGsz_LxuF32CxaLYeQ@mail.gmail.com>
 <1cecad9d-36cf-4703-3f2e-6b2454761f0f@oracle.com> <CACT4Y+b8MS65P1xou+-QuDCXOWb2dvsK0p7xzY3-TrSxV94onw@mail.gmail.com>
 <CACT4Y+av8=XtWwhYJ2cRJUUq+kp5dXNBsb2mdXDF4o320owGJw@mail.gmail.com> <304dfaf0-4b57-5cf4-be69-460f8ec08a2c@linuxfoundation.org>
In-Reply-To: <304dfaf0-4b57-5cf4-be69-460f8ec08a2c@linuxfoundation.org>
From: "Dmitry Vyukov" <dvyukov@google.com>
Date: Tue, 17 May 2022 11:12:58 +0200
Message-ID: <CACT4Y+aH+-CdcSfvZVpXXWgQ4tjk7imKS=rzRYwQ4eXatTfc9w@mail.gmail.com>
Subject: Re: [Automated-testing] syzkaller reproducers
Content-Type: text/plain; charset="UTF-8"
List-ID: <kernelci.groups.io>
To: Shuah Khan <skhan@linuxfoundation.org>
Cc: George Kennedy <george.kennedy@oracle.com>, kernelci@groups.io, oswalpalash@gmail.com, syzkaller <syzkaller@googlegroups.com>, automated-testing@yoctoproject.org, Vegard Nossum <vegard.nossum@oracle.com>

On Mon, 16 May 2022 at 18:51, Shuah Khan <skhan@linuxfoundation.org> wrote:
>
> On 5/16/22 1:41 AM, Dmitry Vyukov wrote:
> > On Fri, 13 May 2022 at 14:16, Dmitry Vyukov <dvyukov@google.com> wrote:
> >>
> >> On Fri, 13 May 2022 at 13:35, George Kennedy <george.kennedy@oracle.com> wrote:
> >>>>> + Shuah, George and mailing lists
> >>>>>
> >>>>> Google groups did not CC all of the members in the thread for my
> >>>>> reply. It would be valuable to get everyone's feedback on this thread.
> >>>>>
> >>>>> On Sat, May 7, 2022 at 11:34 PM Palash <oswalpalash@gmail.com> wrote:
> >>>>>> Hello all,
> >>>>>>
> >>>>>> Reviving this old thread. Do we think there's value in automatically publishing a C reproducer(if it exists) whenever syzkaller determines a reported bug is patched and fixed?
> >>>>>> This allows us to track these reproducers more diligently and we only have reproducers for the bugs that have been patched.
> >>>>>> If this is valuable, then we could think about answering these questions -
> >>>>>> 1. Is there a particular way we want to format the reproducers? (Example : SKIP/OK/FAIL/TIMEOUT (if output is possible))
> >>>>>> 2. Where do we want to submit the reproducers to be added to the testing project and what is the process we want to use?
> >>>>>> 3. Is it valuable to record the crash report information for the original fuzzer crash when the c reproducer is filed to add context to it; in case developers want to troubleshoot? This could save valuable debugging time.
> >>>>>>
> >>>>>> Happy to contribute on this change to the upstream fuzzing system.
> >>>>
> >>>> More automation is definitely welcome.
> >>>> I am not sure how widely used is the current base of reproducers. But
> >>>> George keeps asking for updates and I keep failing at doing it in a
> >>>> timely manner.
> >>> We run the ~6000 reproducers as a regression test. Test takes ~4 hours.
> >>>
> >>> Having the reproducer before there is a patch is valuable to us as we
> >>> know whether or not our distro branches have the same failure.
> >>>
> >>> As a way to reduce test time, some sort of repro classification would be
> >>> helpful (i.e. open/closed/invalid).
> >>>
> >>> For crash troubleshooting info we try to match the crash string with
> >>> syzbot's crash string.
> >>>
> >>> Thank you,
> >>> George
> >>>>
> >>>> It would be easiest for the syzbot app to upload reproducers to a GCS
> >>>> bucket. But I am not sure what's a good format for this. Everything I
> >>>> can think of is somewhat clumsy. It could upload weekly archives, but
> >>>> then there is an issue of discoverability of new archives (since GCS
> >>>> is HTTP rather than FTP).
> >>>>
> >>>> Not sure if it's feasible to give it an auth token for a github repo
> >>>> to push individual files as we do now.
> >>>>
> >>>> Re format. Bonus points if the system will be able to regenerate and
> >>>> update meta-information. The chances that we will come up with the
> >>>> ultimately right format from day 1 are low. But that may complicate
> >>>> the implementation.
> >>
> >> The most feasible for syzbot automation seems to be to push to a
> >> public GCS bucket and then users will need to do "gsutil rsync" to
> >> download updates.
> >>
> >> Or another option is to expose a new json API to get reproducers list
> >> and then to fetch individual reproducers. Though this will need some
> >> custom tooling on the user side to fetch updates.
> >>
> >> Re exporting status open/closed/invalid and e.g. fixing patch, that
> >> would also be more natural to expose via the API since this
> >> information changes dynamically.
> >>
> >> It's also possible to use both. Namely, reproducers are uploaded to
> >> the GCS bucket and each repro file contains just some bug ID. Then the
> >> bug ID can be used to fetch any additional dynamically changing info
> >> via json API.
> >
> >
> > I've pushed a new drop of 898 reproducers:
> > https://github.com/dvyukov/syzkaller-repros/commit/026c8891a19e672bba71481be250080e1a302ed8
> >
>
> Thank you. I will update the linux-arts repo with this drop

Thank you!
