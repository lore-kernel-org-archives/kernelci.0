Return-Path: <keescook@chromium.org>
Date: Tue, 15 Jun 2021 15:03:46 -0700
From: Kees Cook <keescook@chromium.org>
Subject: Re: #KCIDB engagement report
Message-ID: <202106151501.235746C5@keescook>
References: <5a9bf050-0671-3273-cc4f-1b131445c1fe@redhat.com>
 <CAKwvOdmwRV6R6dcpcSL06SNVQ1_JwvOJMZPYiHKvjSx4sf_95g@mail.gmail.com>
 <202106011315.432A65D6@keescook>
 <774899c5-c20a-3d7e-3289-ee257b86e06e@collabora.com>
MIME-Version: 1.0
In-Reply-To: <774899c5-c20a-3d7e-3289-ee257b86e06e@collabora.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-ID: <kernelci.groups.io>
To: Guillaume Tucker <guillaume.tucker@collabora.com>
Cc: kernelci@groups.io, Nick Desaulniers <ndesaulniers@google.com>, Nikolai Kondrashov <Nikolai.Kondrashov@redhat.com>, "automated-testing@yoctoproject.org" <automated-testing@yoctoproject.org>, clang-built-linux <clang-built-linux@googlegroups.com>, Vishal Bhoj <vishal.bhoj@linaro.org>, Antonio Terceiro <antonio.terceiro@linaro.org>, Remi Duraffort <remi.duraffort@linaro.org>

On Fri, Jun 11, 2021 at 05:11:59PM +0100, Guillaume Tucker wrote:
> Hi Kees,
> 
> On 01/06/2021 21:26, Kees Cook wrote:
> > On Mon, May 24, 2021 at 10:38:22AM -0700, 'Nick Desaulniers' via Clang Built Linux wrote:
> >> On Mon, May 24, 2021 at 12:50 AM Nikolai Kondrashov
> >> <Nikolai.Kondrashov@redhat.com> wrote:
> >>> [...]
> >>>      KernelCI native
> >>>          Sending (a lot of) production build and test results.
> >>>          https://staging.kernelci.org:3000/?var-origin=kernelci
> >>> [...]
> > 
> > Apologies for the thread hijack, but does anyone know what's happening
> > with kselftest? It seems missing from the listed[1] build artifacts, but
> > it is actually present[2] (and I see the logs for generating the tarball
> > there too), but I can't find any builds that actually run the tests?
> > 
> > (Or how do I see a top-level list of all tests and search it?)
> 
> The kselftest results are all there on the KernelCI native
> dashboard, for example the futex tests:
> 
>   https://linux.kernelci.org/test/job/mainline/branch/master/kernel/v5.13-rc5-74-g06af8679449d/plan/kselftest-futex/

Thanks for looking at this for me! :)

How do I find the other kselftest stuff? I just see "kselftest-futex"
and "kselftest-filesystem". I was expecting _all_ of the kselftests, but
I can't find them.

(Specifically, I can't find a top-level "list of all test plans")

-Kees

-- 
Kees Cook
