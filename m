Return-Path: <dan.rue@linaro.org>
Date: Wed, 13 Jan 2021 12:02:06 -0600
From: "Dan Rue" <dan.rue@linaro.org>
Subject: Re: tuxbuilds in kcidb?
Message-ID: <20210113180206.lv45oscrshsocapz@jug>
References: <20210113001320.qreaohq2hzzmlxxu@jug>
 <0fd95437-74c4-1ab0-d53e-41fd6fe4f759@redhat.com>
 <20210113162845.xugh6v5p6talrm7h@jug>
 <CAKwvOd=Z8HYcz1zdccUHUWcQkgh9cFfpVRjcAfPF+ug4_NX5iw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAKwvOd=Z8HYcz1zdccUHUWcQkgh9cFfpVRjcAfPF+ug4_NX5iw@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-ID: <kernelci.groups.io>
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: kernelci@groups.io, Nikolai Kondrashov <Nikolai.Kondrashov@redhat.com>, clang-built-linux <clang-built-linux@googlegroups.com>

On Wed, Jan 13, 2021 at 09:52:22AM -0800, Nick Desaulniers wrote:
> On Wed, Jan 13, 2021 at 8:28 AM Dan Rue <dan.rue@linaro.org> wrote:
> >
> > On Wed, Jan 13, 2021 at 01:00:11PM +0200, Nikolai Kondrashov wrote:
> > > Hi Dan,
> > >
> > > On 1/13/21 2:13 AM, Dan Rue wrote:
> > > > Hi Nikolai,
> > > >
> > >
> > > Just want to make sure it stays (relatively) stable and is recognizable.
> > >
> > > > I'm not sure how to represent the result of the build (pass/fail) - I
> > > > used "valid".
> > >
> > > Yes, that's the right field for now.
> > >
> > > I'm thinking about replacing it with "PASS"/"FAIL" "status", to match tests
> > > after all, but not sure about that yet.
> >
> > So if a build passes, i'll set it to True. Otherwise, False.
> >
> > Note that sometimes users do somewhat foul things (i'm looking at you,
> > ClangBuiltLinux), which cause builds to fail through no fault of the
> > source tree. Things like setting various binutils to llvm variants, or
> > building configs which don't pass with llvm. In other words, these
> > aren't necessarily curated expected-to-pass builds in all cases. But I
> > plan to just start with the production LKFT builds, which are expected
> > to pass in pretty much all cases.
> 
> Right, theoretically we can have build failures that are regressions
> on the toolchain side.  It's still probably worthwhile to record them.
> For example, while I'm using github actions for orchestration and
> reporting/visualization of results/reporting, I envision having it
> just send results to KCIDB then having some interface or query to see
> the results of my build.
> 
> We might also have builds that are "not regressed" in the sense of
> they were never green to begin with. That likely happens when we're in
> the process of bringing online a new arch (like s390, csky, m68k,
> riscv) (new in the sense new for us to support) or config.
> 
> Otherwise, I'm pretty sure we're using standard Kbuild invocations and
> not doing anything "foul" per se.

Sorry I didn't mean to imply impropriety; I meant "foul" in the good and
productive sense :)

Dan

> -- 
> Thanks,
> ~Nick Desaulniers
