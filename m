MIME-Version: 1.0
References: <20210129212009.GA2659554@localhost> <CAK8P3a19=Zdni0G2LQE58rrdgJ18zNoefio6GwVg36m5B0Eqdg@mail.gmail.com>
 <CAKwvOdm3sFE=hpai0NLJ_UAYNG2RO2mZGY33uHqmFgZm7fy_KQ@mail.gmail.com>
In-Reply-To: <CAKwvOdm3sFE=hpai0NLJ_UAYNG2RO2mZGY33uHqmFgZm7fy_KQ@mail.gmail.com>
From: "Guenter Roeck" <groeck@google.com>
Date: Mon, 1 Feb 2021 15:30:33 -0800
Message-ID: <CABXOdTeQQv1kVF9uvU2DPf8ddWd6tzunVmjoGz77eOgbiQgOvA@mail.gmail.com>
Subject: Re: Minimum supported version of LLVM
Content-Type: text/plain; charset="UTF-8"
List-ID: <kernelci.groups.io>
To: kernelci@groups.io, Nick Desaulniers <ndesaulniers@google.com>
Cc: Arnd Bergmann <arnd@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Sedat Dilek <sedat.dilek@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, Lukas Bulwahn <lukas.bulwahn@gmail.com>, Kees Cook <keescook@chromium.org>, Marco Elver <elver@google.com>, Dmitry Vyukov <dvyukov@google.com>, Arvind Sankar <nivedita@alum.mit.edu>, Ilie Halip <ilie.halip@gmail.com>, clang-built-linux <clang-built-linux@googlegroups.com>

On Mon, Feb 1, 2021 at 1:19 PM Nick Desaulniers via groups.io <ndesaulniers=
google.com@groups.io> wrote:

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
>

v4.4.y, v4.9.y, and v4.14.y require old versions of gcc for some
architectures.
New versions of gcc don't work for all architectures either, even
in the latest kernel, thanks to a variety of gcc bugs. See
https://github.com/groeck/linux-build-test/blob/master/bin/stable-build-arch.sh
for details.

Maybe clang/llvm is going to be better, but I would not bet on it. Maybe we
should archive this exchange and, 10 years from now, dig it out and have
a good laugh (sorry, my sarcasm is strong today).

Guenter


> --
> Thanks,
> ~Nick Desaulniers
>
>
> 
>
>
>
