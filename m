Return-Path: <keescook@chromium.org>
From: Kees Cook <keescook@chromium.org>
Subject: [PATCH 0/4] LKDTM: Various CI improvements
Date: Wed, 18 Aug 2021 10:48:51 -0700
Message-Id: <20210818174855.2307828-1-keescook@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-ID: <kernelci.groups.io>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Kees Cook <keescook@chromium.org>, Guillaume Tucker <guillaume.tucker@collabora.com>, Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org, kernelci@groups.io, linux-kselftest@vger.kernel.org, linux-hardening@vger.kernel.org

Hi Greg,

Can you please pull these LKDTM changes for drivers/misc? I forgot
to flush this queue of enhancements earlier. :) Here's what I've got
built up, mostly tweaks for kernelCI, configs, consolidation. This also
includes the __alloc_size hint adjustment I'd sent earlier, now fixed
with a better comment.

Thanks!

-Kees

Kees Cook (4):
  lkdtm/bugs: Add ARRAY_BOUNDS to selftests
  lkdtm/fortify: Consolidate FORTIFY_SOURCE tests
  lkdtm: Add kernel version to failure hints
  lkdtm/heap: Avoid __alloc_size hint warning for
    VMALLOC_LINEAR_OVERFLOW

 drivers/misc/lkdtm/bugs.c               | 51 +-----------------------
 drivers/misc/lkdtm/core.c               |  4 +-
 drivers/misc/lkdtm/fortify.c            | 53 +++++++++++++++++++++++++
 drivers/misc/lkdtm/heap.c               |  9 ++++-
 drivers/misc/lkdtm/lkdtm.h              | 24 ++++++-----
 tools/testing/selftests/lkdtm/config    |  2 +
 tools/testing/selftests/lkdtm/tests.txt |  3 ++
 7 files changed, 83 insertions(+), 63 deletions(-)

-- 
2.30.2

