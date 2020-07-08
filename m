MIME-Version: 1.0
From: "Nick Desaulniers" <ndesaulniers@google.com>
Date: Wed, 8 Jul 2020 12:24:07 -0700
Message-ID: <CAKwvOd=um1y=Ax2hK5YYQBxbxLK4kiQuDs9fZsr77YyNR5r=Ww@mail.gmail.com>
Subject: plumbers session on CI and LLVM
Content-Type: text/plain; charset="UTF-8"
List-ID: <kernelci.groups.io>
To: Kevin Hilman <khilman@baylibre.com>
Cc: kernelci@groups.io, Chen Rong <rong.a.chen@intel.com>, Philip Li <philip.li@intel.com>, Dan Rue <dan.rue@linaro.org>, clang-built-linux <clang-built-linux@googlegroups.com>, Mathieu Acher <mathieu.acher@irisa.fr>, Steven Rostedt <rostedt@goodmis.org>, Sasha Levin <sashal@kernel.org>

Hi Kevin and folks,
I'm trying to put together a Micro Conference for plumbers focused on
LLVM.  In particular, I'd like to have a session that focuses on
Continuous Integration (KernelCI, 0day bot, tuxbuild, kernel
configuration space, and LLVM buildbots).

I'm curious, are you all planning on attending the conference?

If so, would such a session be of interest to attend or speak at?

I saw the testing MC has already been approved and that Kevin and
Sasha are the leads.  I'm still working on the approval for our MC so
it may not happen ultimately, but I still would like to have such a
session regardless of which MC it's in.

Do folks who are planning to attend such a session have thoughts on
whether we can carve this out of the existing testing MC vs keep it in
the LLVM MC, or even if it is of value or not?  One thing I'm curious
is what happens for two concurrent MCs if leads need to attend both?
Maybe the conference committee can help us avoid such scheduling
contention?

Our compatibility matrix is a little complicated; Prof. Acher has some
eye opening statistics, and I'd like to cover why and what "it's
complicated" currently means for LLVM support for the benefit of CI
systems, and general info for attendees.
-- 
Thanks,
~Nick Desaulniers
