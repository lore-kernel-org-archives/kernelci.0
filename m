MIME-Version: 1.0
References: <20210129212009.GA2659554@localhost> <CAK8P3a19=Zdni0G2LQE58rrdgJ18zNoefio6GwVg36m5B0Eqdg@mail.gmail.com>
In-Reply-To: <CAK8P3a19=Zdni0G2LQE58rrdgJ18zNoefio6GwVg36m5B0Eqdg@mail.gmail.com>
From: "Nick Desaulniers" <ndesaulniers@google.com>
Date: Mon, 1 Feb 2021 13:19:29 -0800
Message-ID: <CAKwvOdm3sFE=hpai0NLJ_UAYNG2RO2mZGY33uHqmFgZm7fy_KQ@mail.gmail.com>
Subject: Re: Minimum supported version of LLVM
Content-Type: text/plain; charset="UTF-8"
List-ID: <kernelci.groups.io>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Sedat Dilek <sedat.dilek@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, Lukas Bulwahn <lukas.bulwahn@gmail.com>, Kees Cook <keescook@chromium.org>, Marco Elver <elver@google.com>, Dmitry Vyukov <dvyukov@google.com>, Arvind Sankar <nivedita@alum.mit.edu>, Ilie Halip <ilie.halip@gmail.com>, kernelci@groups.io, clang-built-linux <clang-built-linux@googlegroups.com>

On Fri, Jan 29, 2021 at 3:36 PM Arnd Bergmann <arnd@kernel.org> wrote:
>
> I'm actually more worried about the reverse: as there is six year
> long-term support for kernels, do we expect to be able to build
> the oldest kernel with the latest version of llvm at the end of that?
>
> E.g. would a linux-5.4 that today can be built with clang-8 through
> clang-12 allow being built with clang-8 through clang-21 at the
> end of its life in 2025, or do we assume that LTS kernel users also
> have to use old compilers?

I would think so.  The newer compiler should always be better or an
improvement.  Can you think of a case where an old compiler must be
used for older versions of kernel sources?  Stable has said they will
always accept patches for newer toolchain support.
-- 
Thanks,
~Nick Desaulniers
