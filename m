Return-Path: <keescook@chromium.org>
From: Kees Cook <keescook@chromium.org>
Subject: [PATCH 0/9] LKDTM: Improvements for kernelci.org
Date: Wed, 23 Jun 2021 13:39:27 -0700
Message-Id: <20210623203936.3151093-1-keescook@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-ID: <kernelci.groups.io>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Kees Cook <keescook@chromium.org>, Guillaume Tucker <guillaume.tucker@collabora.com>, David Laight <David.Laight@ACULAB.COM>, Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org, kernelci@groups.io, linux-kselftest@vger.kernel.org, linux-hardening@vger.kernel.org

This is a bunch of LKDTM clean-ups to improve and expand testing,
given feedback from testing at kernelci.org. Adds a few new tests as
well.

(If a pull-request is preferred, please let me know.)

Thanks!

-Kees

Kees Cook (9):
  selftests/lkdtm: Avoid needing explicit sub-shell
  selftests/lkdtm: Fix expected text for CR4 pinning
  selftests/lkdtm: Fix expected text for free poison
  lkdtm/bugs: XFAIL UNALIGNED_LOAD_STORE_WRITE
  lkdtm/heap: Add vmalloc linear overflow test
  lkdtm: Enable DOUBLE_FAULT on all architectures
  lkdtm: Add CONFIG hints in errors where possible
  selftests/lkdtm: Enable various testable CONFIGs
  lkdtm/heap: Add init_on_alloc tests

 drivers/misc/lkdtm/bugs.c                     | 11 ++-
 drivers/misc/lkdtm/cfi.c                      |  3 +-
 drivers/misc/lkdtm/core.c                     | 58 ++++++++++-
 drivers/misc/lkdtm/fortify.c                  |  3 +-
 drivers/misc/lkdtm/heap.c                     | 97 ++++++++++++++++++-
 drivers/misc/lkdtm/lkdtm.h                    | 46 ++++++++-
 drivers/misc/lkdtm/stackleak.c                |  4 +-
 drivers/misc/lkdtm/usercopy.c                 |  7 +-
 tools/testing/selftests/lkdtm/config          |  7 ++
 tools/testing/selftests/lkdtm/run.sh          | 12 ++-
 .../testing/selftests/lkdtm/stack-entropy.sh  |  1 +
 tools/testing/selftests/lkdtm/tests.txt       | 11 ++-
 12 files changed, 236 insertions(+), 24 deletions(-)

-- 
2.30.2

