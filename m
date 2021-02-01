MIME-Version: 1.0
References: <20210129212009.GA2659554@localhost> <CAK8P3a19=Zdni0G2LQE58rrdgJ18zNoefio6GwVg36m5B0Eqdg@mail.gmail.com>
 <CAKwvOdm3sFE=hpai0NLJ_UAYNG2RO2mZGY33uHqmFgZm7fy_KQ@mail.gmail.com>
In-Reply-To: <CAKwvOdm3sFE=hpai0NLJ_UAYNG2RO2mZGY33uHqmFgZm7fy_KQ@mail.gmail.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Mon, 1 Feb 2021 22:40:02 +0100
Message-ID: <CAK8P3a0Wgcp__qHepBU06dPr44PsOxMkL_SvTssqYyWtGA0EQA@mail.gmail.com>
Subject: Re: Minimum supported version of LLVM
Content-Type: text/plain; charset="UTF-8"
List-ID: <kernelci.groups.io>
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Nathan Chancellor <nathan@kernel.org>, Sedat Dilek <sedat.dilek@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, Lukas Bulwahn <lukas.bulwahn@gmail.com>, Kees Cook <keescook@chromium.org>, Marco Elver <elver@google.com>, Dmitry Vyukov <dvyukov@google.com>, Arvind Sankar <nivedita@alum.mit.edu>, Ilie Halip <ilie.halip@gmail.com>, kernelci@groups.io, clang-built-linux <clang-built-linux@googlegroups.com>

On Mon, Feb 1, 2021 at 10:19 PM 'Nick Desaulniers' via Clang Built
Linux <clang-built-linux@googlegroups.com> wrote:
>
> On Fri, Jan 29, 2021 at 3:36 PM Arnd Bergmann <arnd@kernel.org> wrote:
> >
> > I'm actually more worried about the reverse: as there is six year
> > long-term support for kernels, do we expect to be able to build
> > the oldest kernel with the latest version of llvm at the end of that?
> >
> > E.g. would a linux-5.4 that today can be built with clang-8 through
> > clang-12 allow being built with clang-8 through clang-21 at the
> > end of its life in 2025, or do we assume that LTS kernel users also
> > have to use old compilers?
>
> I would think so.  The newer compiler should always be better or an
> improvement.  Can you think of a case where an old compiler must be
> used for older versions of kernel sources?  Stable has said they will
> always accept patches for newer toolchain support.

The most common reason is compiler warnings. New compiler versions
tend to add warnings for stuff that used to be accepted by older compilers,
and that's generally a good thing, but it can clutter up your builds if it
happens a lot. We generally backport those warning fixes.

Feature removal is another case, but there is clearly nothing to do
about that: If clang drops support for unmaintained architectures, those
architectures architectures are frozen in time, and presumably mainline
clang won't remove them before the kernel has already dropped them
first.

The hardest part would be kernel code that accidentally relies on
undefined behavior, which can get changed by the compiler. There
are sometimes regressions that cause a kernel not to boot when
built with a newer kernel. If the kernel fix is too complex, e.g. because
it requires dropping support for an older compiler in return, backporting
might get tricky.

       Arnd
