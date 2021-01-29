MIME-Version: 1.0
References: <20210129212009.GA2659554@localhost>
In-Reply-To: <20210129212009.GA2659554@localhost>
From: Arnd Bergmann <arnd@kernel.org>
Date: Sat, 30 Jan 2021 00:35:43 +0100
Message-ID: <CAK8P3a19=Zdni0G2LQE58rrdgJ18zNoefio6GwVg36m5B0Eqdg@mail.gmail.com>
Subject: Re: Minimum supported version of LLVM
Content-Type: text/plain; charset="UTF-8"
List-ID: <kernelci.groups.io>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Nick Desaulniers <ndesaulniers@google.com>, Sedat Dilek <sedat.dilek@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, Lukas Bulwahn <lukas.bulwahn@gmail.com>, Kees Cook <keescook@chromium.org>, Marco Elver <elver@google.com>, Dmitry Vyukov <dvyukov@google.com>, Arvind Sankar <nivedita@alum.mit.edu>, Ilie Halip <ilie.halip@gmail.com>, kernelci@groups.io, clang-built-linux <clang-built-linux@googlegroups.com>

On Fri, Jan 29, 2021 at 10:20 PM Nathan Chancellor <nathan@kernel.org> wrote:
>
> 2. There are still outstanding issues with LLVM utilities that prevent
>    recommending LLVM=1 for some architectures so committing to a minimum
>    supported version might mean we would need to insert more workarounds
>    as time goes on. For example:
>
>    * ld.lld for MIPS big-endian:
>      https://github.com/ClangBuiltLinux/linux/issues/1025
>    * ld.lld and llvm-objdump for PowerPC64 big-endian:
>      https://github.com/ClangBuiltLinux/linux/issues/602
>      https://github.com/ClangBuiltLinux/linux/issues/666
>    * ld.lld for PowerPC64 little-endian:
>      https://github.com/ClangBuiltLinux/linux/issues/811
>    * ld.lld for RISC-V:
>      https://github.com/ClangBuiltLinux/linux/issues/1020

What about armv4 support and big-endian arm32/arm64?

I had disabled lld for those in my randconfig builds last year
and did not expect them to get fixed. Has this changed?

I think pretty much by definition there will always be corner
cases that require a newer version than the minimum, or that
might not work at all.

> If we decide that it is worth defining a minimum supported version of
> LLVM, I would vote that it be LLVM 11.0.0. If we decide that that
> version should stay in sync with the supported clang version, then I
> would vote that we update that for Linux 5.12. Taking a look across
> various distributions:

I agree requiring llvm-11 as the minimum starting with the following
releases makes sense. The last stable release is still fresh, and that
can be built with llvm-10 on many architectures, but requiring llvm-11
now would probably let us remove some workarounds and stop caring
about things breaking in the future.

In the long run, I think we'll want to support more versions,
so if the current stable kernel (5.10) can be built with three versions
(10, 11, 12pre), the next one (5.15?) would go with four ones (11, 12,
13, 14pre), and the one after that could build with five ones
(12, 13, 14, 15, 16pre), all depending on actual technical requirements
that will come up of course.

We probably won't ever want the same 7+ years of old compilers
that Linux supports with gcc, but I would certainly plan on more than
just one or two year old releases.

I'm actually more worried about the reverse: as there is six year
long-term support for kernels, do we expect to be able to build
the oldest kernel with the latest version of llvm at the end of that?

E.g. would a linux-5.4 that today can be built with clang-8 through
clang-12 allow being built with clang-8 through clang-21 at the
end of its life in 2025, or do we assume that LTS kernel users also
have to use old compilers?

        Arnd
