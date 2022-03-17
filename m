MIME-Version: 1.0
References: <20220223191016.1658728-1-usama.anjum@collabora.com> <63c5d7ad-b0b2-9b37-16c3-354ac10858b6@collabora.com>
In-Reply-To: <63c5d7ad-b0b2-9b37-16c3-354ac10858b6@collabora.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Fri, 18 Mar 2022 03:08:50 +0900
Message-ID: <CAK7LNATkTPEBPWBSv6Rum0siHiHcJ0Q7VvPVoUQFH=S0M1fqow@mail.gmail.com>
Subject: Re: [PATCH] Makefile: Fix separate output directory build of kselftests
Content-Type: text/plain; charset="UTF-8"
List-ID: <kernelci.groups.io>
To: Muhammad Usama Anjum <usama.anjum@collabora.com>
Cc: Michal Marek <michal.lkml@markovi.net>, Nick Desaulniers <ndesaulniers@google.com>, kernel@collabora.com, kernelci@groups.io, "Cc: Shuah Khan" <shuah@kernel.org>, "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, Kees Cook <keescook@chromium.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Thu, Mar 17, 2022 at 7:49 PM Muhammad Usama Anjum
<usama.anjum@collabora.com> wrote:
>
> Reminder. Shuah is okay with this patch. Any thoughts?

I do not think this is the right fix,
but something you just happen to find working.


The Make is working in a wrong directory, that is why
the relative path does not work
(and you use the absolute path to work around it)








>
> On 2/24/22 12:10 AM, Muhammad Usama Anjum wrote:
> > Build of kselftests fail if kernel's top most Makefile is used for
> > running or building kselftests with separate output directory. The
> > absolute path is needed to reference other files during this kind of
> > build. Set KBUILD_ABS_SRCTREE to use absolute path during the build. It
> > fixes the following different types of errors:
> >
> > make kselftest-all O=/linux_mainline/build
> > Makefile:1080: ../scripts/Makefile.extrawarn: No such file or directory
> >
> > make kselftest-all O=build
> > Makefile:1080: ../scripts/Makefile.extrawarn: No such file or directory
> >
> > Signed-off-by: Muhammad Usama Anjum <usama.anjum@collabora.com>
> > ---
> > I've tested this patch on top of next-20220217. The latest next-20220222
> > have missing patches.
> > ---
> >  Makefile | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/Makefile b/Makefile
> > index 86f633c2809ea..62b3eb8a102ab 100644
> > --- a/Makefile
> > +++ b/Makefile
> > @@ -1411,10 +1411,10 @@ tools/%: FORCE
> >
> >  PHONY += kselftest
> >  kselftest:
> > -     $(Q)$(MAKE) -C $(srctree)/tools/testing/selftests run_tests
> > +     $(Q)$(MAKE) -C $(srctree)/tools/testing/selftests KBUILD_ABS_SRCTREE=1 run_tests
> >
> >  kselftest-%: FORCE
> > -     $(Q)$(MAKE) -C $(srctree)/tools/testing/selftests $*
> > +     $(Q)$(MAKE) -C $(srctree)/tools/testing/selftests KBUILD_ABS_SRCTREE=1 $*
> >
> >  PHONY += kselftest-merge
> >  kselftest-merge:
>
> --
> Muhammad Usama Anjum



--
Best Regards
Masahiro Yamada
