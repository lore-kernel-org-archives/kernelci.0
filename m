From: Nathan Chancellor <nathan@kernel.org>
Subject: [PATCH RFC 0/6] Bump minimum supported version of LLVM to 11.0.0
Date: Mon, 29 Nov 2021 09:57:57 -0700
Message-Id: <20211129165803.470795-1-nathan@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-ID: <kernelci.groups.io>
To: Nick Desaulniers <ndesaulniers@google.com>, Kees Cook <keescook@chromium.org>, Andrew Morton <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, Tom Stellard <tstellar@redhat.com>, Michael Ellerman <mpe@ellerman.id.au>, Naresh Kamboju <naresh.kamboju@linaro.org>, Jakub Kicinski <kuba@kernel.org>, cki-project@redhat.com, kernelci@groups.io, llvm@lists.linux.dev, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>

This patch series raises the minimum supported version of LLVM to
11.0.0.

Patch #1 outlines the issue, goes over the potential impact of the
change, and does the actual bump. Subsequent patches clean up the
various checks that are always true after the bump.

I have marked this revision as RFC to give various parties the option to
comment on this bump before it is done, namely KernelCI and Linaro's
LKFT, who are still testing clang-10. I have added some other folks to
CC that I know are testing with clang to see if this impacts them in any
way (as I would like to impact as few people as possible) but as far as
I am aware, most other CIs and developers are testing closer to tip of
tree. If that is not true, scream so that we can see what can be done
about that. If I missed anyone who is actively testing with clang,
please key them in and I will make sure to include them in future
revisions (if any are needed).

It probably makes sense for this series to live in -mm.

Nathan Chancellor (6):
  Documentation: Raise the minimum supported version of LLVM to 11.0.0
  mm, slab: Remove compiler check in __kmalloc_index
  arch/Kconfig: Remove CLANG_VERSION check in HAS_LTO_CLANG
  Revert "ARM: 9070/1: Make UNWINDER_ARM depend on ld.bfd or ld.lld
    11.0.0+"
  gcov: Remove compiler version check
  init/Kconfig: Drop linker version check for LD_ORPHAN_WARN

 Documentation/process/changes.rst | 2 +-
 arch/Kconfig                      | 3 +--
 arch/arm/Kconfig.debug            | 2 --
 include/linux/slab.h              | 3 +--
 init/Kconfig                      | 1 -
 kernel/gcov/Kconfig               | 1 -
 scripts/min-tool-version.sh       | 2 +-
 7 files changed, 4 insertions(+), 10 deletions(-)


base-commit: d58071a8a76d779eedab38033ae4c821c30295a5
--=20
2.34.1

