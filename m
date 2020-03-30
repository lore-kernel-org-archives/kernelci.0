MIME-Version: 1.0
References: <20200327223646.20779-1-gpiccoli@canonical.com>
 <7fe65aef-94e1-b51a-0434-b1fe9d402d7b@i-love.sakura.ne.jp>
 <CAHD1Q_zx29ZP37WcUr34ZEyqWkA9J23RmLa8jFyuLDrS_yC50A@mail.gmail.com> <CACT4Y+bjsEFsP1ELGuTXbZV5m3gWys444p5cq=375KPkpFk0Gg@mail.gmail.com>
In-Reply-To: <CACT4Y+bjsEFsP1ELGuTXbZV5m3gWys444p5cq=375KPkpFk0Gg@mail.gmail.com>
From: "Dmitry Vyukov" <dvyukov@google.com>
Date: Mon, 30 Mar 2020 11:01:49 +0200
Message-ID: <CACT4Y+YE-j5ncjTGN6UhngfCNRgVo-QDZ3VCBGACdbs9-v+axQ@mail.gmail.com>
Subject: Re: [PATCH V3] kernel/hung_task.c: Introduce sysctl to print all traces when a hung task is detected
Content-Type: text/plain; charset="UTF-8"
List-ID: <kernelci.groups.io>
To: Guilherme Piccoli <gpiccoli@canonical.com>
Cc: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>, LKML <linux-kernel@vger.kernel.org>, syzkaller <syzkaller@googlegroups.com>, kernelci@groups.io, CKI Project <cki-project@redhat.com>, kbuild test robot <lkp@intel.com>, workflows@vger.kernel.org

On Mon, Mar 30, 2020 at 10:49 AM Dmitry Vyukov <dvyukov@google.com> wrote:
>
> On Mon, Mar 30, 2020 at 2:43 AM Guilherme Piccoli
> <gpiccoli@canonical.com> wrote:
> >
> > Hi Tetsuo and Dmitry, thanks for noticing this Tetsuo. And sorry for
> > not looping you in the patch Dmitry, I wasn't aware that you were
> > working with testing. By the way, I suggest people interested in linux
> > testing to create a ML; I'd be glad to have looped such list, but I
> > couldn't find information about a group dealing with testing.
> >
> > So Tetsuo, you got it right: just change it to
> > "sysctl.kernel.hung_task_all_cpu_backtrace=1" and that should work
> > fine, once Vlastimil's patch gets merged (and I hope it happens soon).
> > Cheers,
> >
> >
> > Guilherme
>
> +LKML, workflows, syzkaller, kernelci, cki, kbuild
>
> Tetsuo, thanks for notifying again.
>
> Yes, kernel devs breaking all testing happens from time to time and
> currently there is no good way to address this.
> Other things I remember is the introduction of CONFIG_DEBUG_MEMORY,
> which defaults to =n and disables KASAN, which in turn produced an
> explosion of assorted crashes caused by memory corruptions; also
> periodic changes in kernel crash messages which I assume all testing
> systems parse and need to understand.
>
> Is there already a mailing list for this? Or should we create one?
> I.e. announce and changes that may need actions from all testing
> systems.
> Another thing that may benefit from announcements is addition of new
> useful debugging configs. Currently they are introduced silently and
> don't reach the target audience.

I've fixed this up:
https://github.com/google/syzkaller/commit/c8d1cc20df5ca5d9ea437054720fa3cfdfa1f578

But what would be even better is some kind of canned configs/settings
for testing systems so that I enable it once and then such changes
magically auto-happen for me.
Imposing work on N testing systems maintainers is not good.
And there really is no good point in the current kernel dev process
for this. Announcing unmerged changes is too early (as this patch
showed). And once it's in linux-next it's already too late..
And I don't want to be inventing a new unique kernel configuration for
testing. I don't think it's the right way to approach this. Whatever
is "the testing configuration", whatever kernel developers want to see
in task hang reports, I just want the system to provide that.
