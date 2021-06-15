Return-Path: <keescook@chromium.org>
Date: Tue, 15 Jun 2021 16:02:29 -0700
From: Kees Cook <keescook@chromium.org>
Subject: Re: #KCIDB engagement report
Message-ID: <202106151557.B2C839D@keescook>
References: <5a9bf050-0671-3273-cc4f-1b131445c1fe@redhat.com>
 <CAKwvOdmwRV6R6dcpcSL06SNVQ1_JwvOJMZPYiHKvjSx4sf_95g@mail.gmail.com>
 <202106011315.432A65D6@keescook>
 <774899c5-c20a-3d7e-3289-ee257b86e06e@collabora.com>
 <202106151501.235746C5@keescook>
 <f68058fe-a047-2c02-ce35-8349a95f69b8@collabora.com>
MIME-Version: 1.0
In-Reply-To: <f68058fe-a047-2c02-ce35-8349a95f69b8@collabora.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-ID: <kernelci.groups.io>
To: Guillaume Tucker <guillaume.tucker@collabora.com>
Cc: kernelci@groups.io, Nick Desaulniers <ndesaulniers@google.com>, Nikolai Kondrashov <Nikolai.Kondrashov@redhat.com>, "automated-testing@yoctoproject.org" <automated-testing@yoctoproject.org>, clang-built-linux <clang-built-linux@googlegroups.com>, Vishal Bhoj <vishal.bhoj@linaro.org>, Antonio Terceiro <antonio.terceiro@linaro.org>, Remi Duraffort <remi.duraffort@linaro.org>, Alexandra da Silva Pereira <alexandra.pereira@collabora.com>

On Tue, Jun 15, 2021 at 11:23:35PM +0100, Guillaume Tucker wrote:
> +alex 
> 
> On 15/06/2021 23:03, Kees Cook wrote:
> > On Fri, Jun 11, 2021 at 05:11:59PM +0100, Guillaume Tucker wrote:
> >> Hi Kees,
> >>
> >> On 01/06/2021 21:26, Kees Cook wrote:
> >>> On Mon, May 24, 2021 at 10:38:22AM -0700, 'Nick Desaulniers' via Clang Built Linux wrote:
> >>>> On Mon, May 24, 2021 at 12:50 AM Nikolai Kondrashov
> >>>> <Nikolai.Kondrashov@redhat.com> wrote:
> >>>>> [...]
> >>>>>      KernelCI native
> >>>>>          Sending (a lot of) production build and test results.
> >>>>>          https://staging.kernelci.org:3000/?var-origin=kernelci
> >>>>> [...]
> >>>
> >>> Apologies for the thread hijack, but does anyone know what's happening
> >>> with kselftest? It seems missing from the listed[1] build artifacts, but
> >>> it is actually present[2] (and I see the logs for generating the tarball
> >>> there too), but I can't find any builds that actually run the tests?
> >>>
> >>> (Or how do I see a top-level list of all tests and search it?)
> >>
> >> The kselftest results are all there on the KernelCI native
> >> dashboard, for example the futex tests:
> >>
> >>   https://linux.kernelci.org/test/job/mainline/branch/master/kernel/v5.13-rc5-74-g06af8679449d/plan/kselftest-futex/
> > 
> > Thanks for looking at this for me! :)
> > 
> > How do I find the other kselftest stuff? I just see "kselftest-futex"
> > and "kselftest-filesystem". I was expecting _all_ of the kselftests, but
> > I can't find them.
> > 
> > (Specifically, I can't find a top-level "list of all test plans")
> 
> That's because kselftest is rather large, and we're only enabling
> subsets of it one at a time.  As more test labs and more devices

Ah-ha! Okay.

> become available, we'll gradually expand coverage.  We might also
> choose to have full coverage only on say, linux-next, mainline
> and LTS branches but not everywhere to not overload the labs.

Doing this for -next, mainline, and LTS would be extremely helpful for
me, though I suppose I mostly only care about the lkdtm, seccomp, and
pstore tests.

> To answer your question about "all the tests", well you can look
> at any kernel revision to see the tests that were run for it
> since it won't be the same for all of them.  Typically,
> linux-next has the highest number of tests so here's an example:
> 
>   https://linux.kernelci.org/test/job/next/branch/master/kernel/next-20210615/

Right, that's helpful, but I need to know which kernel to test. It'd be
nice to have a top-level "all the tests", and for each test, it should
list the kernels that run those tests, etc.

> As you've already found, there are only 3 kselftest subsets
> or "collections" being run there at the moment.  That's by design
> in the KernelCI configuration, but at least we have good enough
> support for running kselftest now which wasn't completely
> trivial to put in place...

Right, totally understood. I spent time tweaking those pieces too. :)

> There are still a few issues to fix, but I would expect kselftest
> coverage to keep growing over the coming weeks.
> 
> If there are kselftest collections you really want to have
> enabled, you can always make a PR to add them to this file:
> 
>   https://github.com/kernelci/kernelci-core/blob/main/config/core/test-configs.yaml#L187
> 
> As long as there's capacity for it at least on some types of
> devices and it runs as expected, we should be able to get this
> deployed in production pretty easily.

Awesome. I will do so immediately. :)

Thanks!

-Kees

-- 
Kees Cook
