MIME-Version: 1.0
References: <20210129212009.GA2659554@localhost>
In-Reply-To: <20210129212009.GA2659554@localhost>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 29 Jan 2021 23:00:11 +0100
Message-ID: <CANiq72kaAQ0KBx8mofyT-v0v6Tb+S5xX+_xEB4uPzzjnwafrPA@mail.gmail.com>
Subject: Re: Minimum supported version of LLVM
Content-Type: text/plain; charset="UTF-8"
List-ID: <kernelci.groups.io>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Nick Desaulniers <ndesaulniers@google.com>, Sedat Dilek <sedat.dilek@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, Lukas Bulwahn <lukas.bulwahn@gmail.com>, Kees Cook <keescook@chromium.org>, Marco Elver <elver@google.com>, Dmitry Vyukov <dvyukov@google.com>, Arvind Sankar <nivedita@alum.mit.edu>, Ilie Halip <ilie.halip@gmail.com>, kernelci@groups.io, clang-built-linux <clang-built-linux@googlegroups.com>

On Fri, Jan 29, 2021 at 10:20 PM Nathan Chancellor <nathan@kernel.org> wrote:
>
> Questions to address:
>
> I believe the first place to start is answering the question is there a
> minimum supported version of LLVM? Is it LLVM as a whole or one
> particular utility (such as ld.lld)?

Would this be the minimum version for LLVM=1 (in supported
architectures)? If yes, then yes (eventually). In other words, I think
there should be one minimum version for LLVM=1 eventually, even if for
the moment we only have one for CC=clang.

> If there is a minimum supported version of LLVM or ld.lld, is it the
> same as clang?

I would try to aim for that, yes. I think having it undefined for the
moment is fine, but when LLVM=1 works for all architectures that we
care for, then the minimum should be the same for both CC=clang and
LLVM=1 to simplify things and avoid regressing.

> If there is not a minimum supported version of LLVM, do we insert
> workarounds for issues that we know are fixed with newer versions of
> LLVM or do we just tell people to upgrade the version of LLVM they are
> using?

Until the minimum is defined, I'd simply tell them to use the latest
one for LLVM=1.

> If we decide that it is worth defining a minimum supported version of
> LLVM, I would vote that it be LLVM 11.0.0. If we decide that that
> version should stay in sync with the supported clang version, then I
> would vote that we update that for Linux 5.12. Taking a look across
> various distributions:

Well, this depends on how we look at it. Ideally, we want to reach a
point where we don't bump LLVM/Clang minimum versions unless there is
a reason for it, i.e. the same policy like we do so for GCC. That is
why I think it wouldn't hurt to wait to define a minimum version for
LLVM=1 until we are reasonably sure we can keep it stable for a while.

Having said that, bumping versions for LLVM is not as big of a deal as
for GCC so far, since the support is recent and distributions are not
building the kernel with it just yet (AFAIK, at least).

Cheers,
Miguel
