Return-Path: <khilman@baylibre.com>
From: "Kevin Hilman" <khilman@baylibre.com>
Subject: Re: plumbers session on CI and LLVM
In-Reply-To: <CAKwvOd=um1y=Ax2hK5YYQBxbxLK4kiQuDs9fZsr77YyNR5r=Ww@mail.gmail.com>
References: <CAKwvOd=um1y=Ax2hK5YYQBxbxLK4kiQuDs9fZsr77YyNR5r=Ww@mail.gmail.com>
Date: Thu, 09 Jul 2020 09:19:27 -0700
Message-ID: <7h36603blc.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
List-ID: <kernelci.groups.io>
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: kernelci@groups.io, Chen Rong <rong.a.chen@intel.com>, Philip Li <philip.li@intel.com>, Dan Rue <dan.rue@linaro.org>, clang-built-linux <clang-built-linux@googlegroups.com>, Mathieu Acher <mathieu.acher@irisa.fr>, Steven Rostedt <rostedt@goodmis.org>, Sasha Levin <sashal@kernel.org>

Nick Desaulniers <ndesaulniers@google.com> writes:

> Hi Kevin and folks,
> I'm trying to put together a Micro Conference for plumbers focused on
> LLVM.  In particular, I'd like to have a session that focuses on
> Continuous Integration (KernelCI, 0day bot, tuxbuild, kernel
> configuration space, and LLVM buildbots).
>
> I'm curious, are you all planning on attending the conference?

Yes, I plan to attend and most KernelCI folks will be there as well as
we'll have a few topics at the testing/fuzzing microconf.

> If so, would such a session be of interest to attend or speak at?

Yes.

> I saw the testing MC has already been approved and that Kevin and
> Sasha are the leads.  I'm still working on the approval for our MC so
> it may not happen ultimately, but I still would like to have such a
> session regardless of which MC it's in.
>
> Do folks who are planning to attend such a session have thoughts on
> whether we can carve this out of the existing testing MC vs keep it in
> the LLVM MC, or even if it is of value or not?

If you don't get your approved, feel free to submit to testing/fuzzing,
but it looks to me that doing so would limit the scope of topics you
want to discuss.  It sounds to me like you have enough non-CI topics for
your own MC.

> One thing I'm curious is what happens for two concurrent MCs if leads
> need to attend both?  Maybe the conference committee can help us avoid
> such scheduling contention?

When you submit your MC you can request to be scheduled separately from
testing/fuzzing so we can attend both.

Kevin
