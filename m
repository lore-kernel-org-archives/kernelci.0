Return-Path: <keescook@chromium.org>
From: Kees Cook <keescook@chromium.org>
Subject: [PATCH 2/9] selftests/lkdtm: Fix expected text for CR4 pinning
Date: Wed, 23 Jun 2021 13:39:29 -0700
Message-Id: <20210623203936.3151093-3-keescook@chromium.org>
In-Reply-To: <20210623203936.3151093-1-keescook@chromium.org>
References: <20210623203936.3151093-1-keescook@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-ID: <kernelci.groups.io>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Kees Cook <keescook@chromium.org>, stable@vger.kernel.org, Guillaume Tucker <guillaume.tucker@collabora.com>, David Laight <David.Laight@ACULAB.COM>, Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org, kernelci@groups.io, linux-kselftest@vger.kernel.org, linux-hardening@vger.kernel.org

The error text for CR4 pinning changed. Update the test to match.

Fixes: a13b9d0b9721 ("x86/cpu: Use pinning mask for CR4 bits needing to be 0")
Cc: stable@vger.kernel.org
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 tools/testing/selftests/lkdtm/tests.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/lkdtm/tests.txt b/tools/testing/selftests/lkdtm/tests.txt
index 11ef159be0fd..a5fce7fd4520 100644
--- a/tools/testing/selftests/lkdtm/tests.txt
+++ b/tools/testing/selftests/lkdtm/tests.txt
@@ -11,7 +11,7 @@ CORRUPT_LIST_ADD list_add corruption
 CORRUPT_LIST_DEL list_del corruption
 STACK_GUARD_PAGE_LEADING
 STACK_GUARD_PAGE_TRAILING
-UNSET_SMEP CR4 bits went missing
+UNSET_SMEP pinned CR4 bits changed:
 DOUBLE_FAULT
 CORRUPT_PAC
 UNALIGNED_LOAD_STORE_WRITE
-- 
2.30.2

