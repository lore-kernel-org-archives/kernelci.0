Return-Path: <keescook@chromium.org>
From: Kees Cook <keescook@chromium.org>
Subject: [PATCH 3/9] selftests/lkdtm: Fix expected text for free poison
Date: Wed, 23 Jun 2021 13:39:30 -0700
Message-Id: <20210623203936.3151093-4-keescook@chromium.org>
In-Reply-To: <20210623203936.3151093-1-keescook@chromium.org>
References: <20210623203936.3151093-1-keescook@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-ID: <kernelci.groups.io>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Kees Cook <keescook@chromium.org>, Guillaume Tucker <guillaume.tucker@collabora.com>, David Laight <David.Laight@ACULAB.COM>, Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org, kernelci@groups.io, linux-kselftest@vger.kernel.org, linux-hardening@vger.kernel.org

Freed memory poisoning can be tested a few ways, so update the expected
text to reflect the non-Oopsing alternative.

Signed-off-by: Kees Cook <keescook@chromium.org>
---
 tools/testing/selftests/lkdtm/tests.txt | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/lkdtm/tests.txt b/tools/testing/selftests/lkdtm/tests.txt
index a5fce7fd4520..a94d4d8eeb5c 100644
--- a/tools/testing/selftests/lkdtm/tests.txt
+++ b/tools/testing/selftests/lkdtm/tests.txt
@@ -17,9 +17,9 @@ CORRUPT_PAC
 UNALIGNED_LOAD_STORE_WRITE
 #OVERWRITE_ALLOCATION Corrupts memory on failure
 #WRITE_AFTER_FREE Corrupts memory on failure
-READ_AFTER_FREE
+READ_AFTER_FREE call trace:|Memory correctly poisoned
 #WRITE_BUDDY_AFTER_FREE Corrupts memory on failure
-READ_BUDDY_AFTER_FREE
+READ_BUDDY_AFTER_FREE call trace:|Memory correctly poisoned
 SLAB_FREE_DOUBLE
 SLAB_FREE_CROSS
 SLAB_FREE_PAGE
-- 
2.30.2

