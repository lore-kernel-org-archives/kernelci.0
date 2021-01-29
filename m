Return-Path: <maskray@google.com>
Date: Fri, 29 Jan 2021 14:26:20 -0800
From: Fangrui Song <maskray@google.com>
Subject: Re: Minimum supported version of LLVM
Message-ID: <20210129222620.7y6sg25fwcr3zhx6@google.com>
References: <20210129212009.GA2659554@localhost>
MIME-Version: 1.0
In-Reply-To: <20210129212009.GA2659554@localhost>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
List-ID: <kernelci.groups.io>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Nick Desaulniers <ndesaulniers@google.com>, Sedat Dilek <sedat.dilek@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, Lukas Bulwahn <lukas.bulwahn@gmail.com>, Kees Cook <keescook@chromium.org>, Marco Elver <elver@google.com>, Dmitry Vyukov <dvyukov@google.com>, Arvind Sankar <nivedita@alum.mit.edu>, Ilie Halip <ilie.halip@gmail.com>, kernelci@groups.io, clang-built-linux@googlegroups.com

Hi Nathan,

Thanks for starting this topic.

On 2021-01-29, Nathan Chancellor wrote:
>Hi all,
>
>I am starting this thread to spur some discussion about our support
>model for the minimum supported version of LLVM and how that might
>impact bumping the minimum supported version of LLVM/Clang in the
>future. I am adding what I hope are relevant parties (individual testers
>and maintainers/lists of CI systems). Feel free to add anyone that I
>might have missed.
>
>Some history:
>
>For the longest time, ClangBuiltLinux as a project rejected the idea of
>a minimum supported version as we did not have as many resources for
>testing or a good idea of "what works" and "what doesn't work". After
>Linux Plumbers 2020, we decided that we would support from clang 10.0.1
>on, which resulted in commit 1f7a44f63e6c ("compiler-clang: add build
>check for clang 10.0.1").
>
>The problem:
>
>I would say there are three different levels of support:
>
>1. CC=clang: Compiling with clang, GNU binutils for everything else
>2. LLVM=1: Compiling with clang, LLVM binutils, GNU as
>3. LLVM=1 LLVM_IAS=1: Compiling with clang, LLVM binutils, and LLVM's
>   integrated assembler.
>
>We have started to address these different levels of support in the LLVM
>documentation in the kernel:
>
>https://lore.kernel.org/linux-doc/20210114003447.7363-1-natechancellor@gmail.com/
>
>The issue that has been coming up more recently is whether or not the
>minimum supported version of clang (the first tier of support) equals
>the minimum supported version of LLVM (the second and third tier of
>support) when it comes to inserting workarounds or disabling configs
>that are known broken.
>
>Some considerations:
>
>1. LLVM 10.0.1 has a few issues that are not present in LLVM 11.x that
>   will or have required workarounds in the kernel:
>
>   * https://github.com/ClangBuiltLinux/linux/issues/732
>   * https://github.com/ClangBuiltLinux/linux/issues/1187
>
>2. There are still outstanding issues with LLVM utilities that prevent
>   recommending LLVM=1 for some architectures so committing to a minimum
>   supported version might mean we would need to insert more workarounds
>   as time goes on. For example:
>
>   * ld.lld for MIPS big-endian:
>     https://github.com/ClangBuiltLinux/linux/issues/1025

[Facepalm] I know really little about mips...

>   * ld.lld and llvm-objdump for PowerPC64 big-endian:

>     https://github.com/ClangBuiltLinux/linux/issues/602

LLD has removed incomplete and legacy PPC64 ELFv1 support and may never
support it in the future.

>     https://github.com/ClangBuiltLinux/linux/issues/666

Yes, this require llvm-objdump 11.0.0 (display style issue).

>   * ld.lld for PowerPC64 little-endian:
>     https://github.com/ClangBuiltLinux/linux/issues/811

This is due to GNU ld and LLD's different -z notext semantics.
It is not relevant to LLD versions.

I have a bit more decription in
https://maskray.me/blog/2020-12-19-lld-and-gnu-linker-incompatibilities

>   * ld.lld for RISC-V:
>     https://github.com/ClangBuiltLinux/linux/issues/1020

Not relevant to LLD versions.
R_RISCV_ALIGN support may take an extended period of time.
In the meantile, users can use -mno-relax as we already notified the CI
maintainers(?).


Other relevant commits between 10.x and 11.x:

LLD
https://github.com/ClangBuiltLinux/linux/issues/1186
https://github.com/ClangBuiltLinux/linux/issues/951
https://github.com/ClangBuiltLinux/linux/issues/953
https://github.com/ClangBuiltLinux/linux/issues/773
https://github.com/ClangBuiltLinux/linux/issues/812


There are some commits between 11.x -> 12.x but they are less concerned:

https://github.com/ClangBuiltLinux/linux/issues/1260 (R_PPC64_ADDR16_HIGH)
https://github.com/ClangBuiltLinux/linux/issues/1186 (only with LTO)
https://github.com/ClangBuiltLinux/linux/issues/1141 (the input was already corrupted)

>Questions to address:
>
>I believe the first place to start is answering the question is there a
>minimum supported version of LLVM? Is it LLVM as a whole or one
>particular utility (such as ld.lld)?
>
>If there is a minimum supported version of LLVM or ld.lld, is it the
>same as clang?
>
>If there is not a minimum supported version of LLVM, do we insert
>workarounds for issues that we know are fixed with newer versions of
>LLVM or do we just tell people to upgrade the version of LLVM they are
>using?
>
>If we decide that it is worth defining a minimum supported version of
>LLVM, I would vote that it be LLVM 11.0.0. If we decide that that
>version should stay in sync with the supported clang version, then I
>would vote that we update that for Linux 5.12. Taking a look across
>various distributions:

I vote 11.0.0 as a minimum supported version, too. I don't maintain a CI
system. Note LTO/R_PPC64_ADDR16_HIGH would be better with 12.0.0.


Note, LLD needs to be newer than Clang if you use LTO. Newer Clang may
emit bitcode files not recognizable by older LLD.  If the bitcode files
are older, it may need IR auto upgrade. This serial process may take
some linker time.  Old format + new linker also gets less testing.

If you don't LTO, an older LLD usually works. This combo has very little
testing because most LLD LTO users use lock-stepped Clang+LLD.  Some
utilities llvm-nm/llvm-ar/llvm-ranlib understand bitcode files.  While
the format is stable it is the best to make these binary utilities
lock-stepped with clang+LLD as well.

>archlinux/base:latest: clang version 11.0.1
>debian:stable-slim: clang version 7.0.1-8+deb10u2 (tags/RELEASE_701/final)
>debian:testing-slim: Debian clang version 11.0.1-2
>debian:unstable-slim: Debian clang version 11.0.1-2
>fedora:latest: clang version 11.0.0 (Fedora 11.0.0-2.fc33)
>fedora:rawhide: clang version 11.1.0 (Fedora 11.1.0-0.3.rc2.fc34)
>opensuse/leap:latest: clang version 9.0.1
>opensuse/tumbleweed:latest: clang version 11.0.1
>ubuntu:18.04: clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)
>ubuntu:20.04: clang version 10.0.0-4ubuntu1
>ubuntu:latest: clang version 10.0.0-4ubuntu1
>ubuntu:rolling: Ubuntu clang version 11.0.0-2
>ubuntu:devel: Ubuntu clang version 11.0.1-2
>
>I am not so concerned for Ubuntu and Debian, as there are updated
>versions of LLVM available from apt.llvm.org and OpenSUSE Leap is
>already unable to build the upstream kernel with its version of
>clang. Everyone else should be unaffected by that bump.
>
>Hopefully all of that makes sense and spurs some good discussion.
>
>Cheers,
>Nathan
>
>-- 
>You received this message because you are subscribed to the Google Groups "Clang Built Linux" group.
>To unsubscribe from this group and stop receiving emails from it, send an email to clang-built-linux+unsubscribe@googlegroups.com.
>To view this discussion on the web visit https://groups.google.com/d/msgid/clang-built-linux/20210129212009.GA2659554%40localhost.
