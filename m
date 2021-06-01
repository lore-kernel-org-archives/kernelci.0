Return-Path: <keescook@chromium.org>
Date: Tue, 1 Jun 2021 13:26:35 -0700
From: Kees Cook <keescook@chromium.org>
Subject: Re: #KCIDB engagement report
Message-ID: <202106011315.432A65D6@keescook>
References: <5a9bf050-0671-3273-cc4f-1b131445c1fe@redhat.com>
 <CAKwvOdmwRV6R6dcpcSL06SNVQ1_JwvOJMZPYiHKvjSx4sf_95g@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAKwvOdmwRV6R6dcpcSL06SNVQ1_JwvOJMZPYiHKvjSx4sf_95g@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-ID: <kernelci.groups.io>
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Nikolai Kondrashov <Nikolai.Kondrashov@redhat.com>, "automated-testing@yoctoproject.org" <automated-testing@yoctoproject.org>, kernelci@groups.io, clang-built-linux <clang-built-linux@googlegroups.com>, Vishal Bhoj <vishal.bhoj@linaro.org>, Antonio Terceiro <antonio.terceiro@linaro.org>, Remi Duraffort <remi.duraffort@linaro.org>

On Mon, May 24, 2021 at 10:38:22AM -0700, 'Nick Desaulniers' via Clang Built Linux wrote:
> On Mon, May 24, 2021 at 12:50 AM Nikolai Kondrashov
> <Nikolai.Kondrashov@redhat.com> wrote:
> > [...]
> >      KernelCI native
> >          Sending (a lot of) production build and test results.
> >          https://staging.kernelci.org:3000/?var-origin=kernelci
> > [...]

Apologies for the thread hijack, but does anyone know what's happening
with kselftest? It seems missing from the listed[1] build artifacts, but
it is actually present[2] (and I see the logs for generating the tarball
there too), but I can't find any builds that actually run the tests?

(Or how do I see a top-level list of all tests and search it?)

Thanks!

-Kees

[1] https://kcidb.kernelci.org/d/build/build?orgId=1&var-dataset=kernelci04&var-id=kernelci:kernelci.org:60b654321456eb7654b3afa6&fullscreen&panelId=17
[2] https://storage.kernelci.org//mainline/master/v5.13-rc4-11-gc2131f7e73c9/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-8/

-- 
Kees Cook
