Date: Fri, 29 Jan 2021 18:23:23 -0700
From: Nathan Chancellor <nathan@kernel.org>
Subject: Re: Minimum supported version of LLVM
Message-ID: <20210130012323.GA2709294@localhost>
References: <20210129212009.GA2659554@localhost>
 <CAK8P3a19=Zdni0G2LQE58rrdgJ18zNoefio6GwVg36m5B0Eqdg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAK8P3a19=Zdni0G2LQE58rrdgJ18zNoefio6GwVg36m5B0Eqdg@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-ID: <kernelci.groups.io>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Nick Desaulniers <ndesaulniers@google.com>, Sedat Dilek <sedat.dilek@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, Lukas Bulwahn <lukas.bulwahn@gmail.com>, Kees Cook <keescook@chromium.org>, Marco Elver <elver@google.com>, Dmitry Vyukov <dvyukov@google.com>, Arvind Sankar <nivedita@alum.mit.edu>, Ilie Halip <ilie.halip@gmail.com>, kernelci@groups.io, clang-built-linux <clang-built-linux@googlegroups.com>, Tom Stellard <tstellar@redhat.com>, Fangrui Song <maskray@google.com>

Thank you to everyone for their input so far. I am replying to Arnd
because I think we are all generally on the same page so far.

On Sat, Jan 30, 2021 at 12:35:43AM +0100, Arnd Bergmann wrote:
> On Fri, Jan 29, 2021 at 10:20 PM Nathan Chancellor <nathan@kernel.org> wrote:
> >
> > 2. There are still outstanding issues with LLVM utilities that prevent
> >    recommending LLVM=1 for some architectures so committing to a minimum
> >    supported version might mean we would need to insert more workarounds
> >    as time goes on. For example:
> >
> >    * ld.lld for MIPS big-endian:
> >      https://github.com/ClangBuiltLinux/linux/issues/1025
> >    * ld.lld and llvm-objdump for PowerPC64 big-endian:
> >      https://github.com/ClangBuiltLinux/linux/issues/602
> >      https://github.com/ClangBuiltLinux/linux/issues/666
> >    * ld.lld for PowerPC64 little-endian:
> >      https://github.com/ClangBuiltLinux/linux/issues/811
> >    * ld.lld for RISC-V:
> >      https://github.com/ClangBuiltLinux/linux/issues/1020
> 
> What about armv4 support and big-endian arm32/arm64?
> 
> I had disabled lld for those in my randconfig builds last year
> and did not expect them to get fixed. Has this changed?

I don't believe so (as I commented on the issue tracker) and I don't
expect it to. There is not a ton of bandwidth for lld to support older
architectures or less common endianness combinations, as Fangrui has
commented in the past.

> I think pretty much by definition there will always be corner
> cases that require a newer version than the minimum, or that
> might not work at all.

This is a fair point and I suppose that is what Kconfig is for.

> > If we decide that it is worth defining a minimum supported version of
> > LLVM, I would vote that it be LLVM 11.0.0. If we decide that that
> > version should stay in sync with the supported clang version, then I
> > would vote that we update that for Linux 5.12. Taking a look across
> > various distributions:
> 
> I agree requiring llvm-11 as the minimum starting with the following
> releases makes sense. The last stable release is still fresh, and that
> can be built with llvm-10 on many architectures, but requiring llvm-11
> now would probably let us remove some workarounds and stop caring
> about things breaking in the future.

This is generally what I am getting at, namely with the first point in
the considerations section. I would like to avoid sending patches to
workaround lld-10 bugs when we know that lld-11 has them fixed. I would
rather tell people to just use lld-11.

I feel that we as a project have gotten a lot better about caring about
the quality of the stable releases of LLVM because we testing the main
branch while also testing the stable branches and help with getting
fixes in there that are relevant to the kernel. I put a lot of effort
forward to do that for LLVM 10.0.1 and LLVM 11.0.0. Now that our testing
matrix is growing, I think it will be easier to support older versions.

> In the long run, I think we'll want to support more versions,
> so if the current stable kernel (5.10) can be built with three versions
> (10, 11, 12pre), the next one (5.15?) would go with four ones (11, 12,
> 13, 14pre), and the one after that could build with five ones
> (12, 13, 14, 15, 16pre), all depending on actual technical requirements
> that will come up of course.
> 
> We probably won't ever want the same 7+ years of old compilers
> that Linux supports with gcc, but I would certainly plan on more than
> just one or two year old releases.

Tom brings up a good point that due to the nature of LLVM's support
period, this is going to be really difficult. With GCC, it is possible
to get fixes into the compiler a couple of years down the line. With
clang, it will usually see two releases: the major release then a minor
stable release three months later. If there is something that is broken
with LLVM, we have no choice than to workaround it or tell people to
upgrade. I have been tempted to start a conversation upstream about
improving that situation but that is a much bigger issue.

> I'm actually more worried about the reverse: as there is six year
> long-term support for kernels, do we expect to be able to build
> the oldest kernel with the latest version of llvm at the end of that?

I think the answer is yes. For example, we can currently build a 4.4
arm64 and x86_64 kernel with clang 13.x.

> E.g. would a linux-5.4 that today can be built with clang-8 through
> clang-12 allow being built with clang-8 through clang-21 at the
> end of its life in 2025, or do we assume that LTS kernel users also
> have to use old compilers?

I think that this depends on if you see a newer compiler as a feature.
Given that fixes for newer versions of GCC are taken into the stable
kernels, I would argue that the same thing should happen for clang (and
currently, it does). However, we have had some people push back on us
for that because clang is the new kid on the block. There is also the
weird question of what is more of a fix versus a new feature. For
example, building an architecture with clang: is that a fix that should
be backported to older kernels or is it a new feature that people should
upgrade their kernel for? Ultimately, I would say that if a compiler
upgrade breaks a build that was working on an older kernel release, the
older kernel release should be fixed or patched in some way, unless the
compiler is clearly buggy or wrong.

Cheers,
Nathan
