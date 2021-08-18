Return-Path: <keescook@chromium.org>
From: Kees Cook <keescook@chromium.org>
Subject: [PATCH 1/4] lkdtm/bugs: Add ARRAY_BOUNDS to selftests
Date: Wed, 18 Aug 2021 10:48:52 -0700
Message-Id: <20210818174855.2307828-2-keescook@chromium.org>
In-Reply-To: <20210818174855.2307828-1-keescook@chromium.org>
References: <20210818174855.2307828-1-keescook@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-ID: <kernelci.groups.io>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Kees Cook <keescook@chromium.org>, kernelci@groups.io, Guillaume Tucker <guillaume.tucker@collabora.com>, Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, linux-hardening@vger.kernel.org

Add CONFIG hints about why the ARRAY_BOUNDS test might fail, and
similarly include the CONFIGs needed to pass the ARRAY_BOUNDS test via
the selftests, and add to selftests.

Cc: kernelci@groups.io
Suggested-by: Guillaume Tucker <guillaume.tucker@collabora.com>
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 drivers/misc/lkdtm/bugs.c               | 1 +
 tools/testing/selftests/lkdtm/config    | 2 ++
 tools/testing/selftests/lkdtm/tests.txt | 1 +
 3 files changed, 4 insertions(+)

diff --git a/drivers/misc/lkdtm/bugs.c b/drivers/misc/lkdtm/bugs.c
index 88c218a9f8b3..03171e412356 100644
--- a/drivers/misc/lkdtm/bugs.c
+++ b/drivers/misc/lkdtm/bugs.c
@@ -267,6 +267,7 @@ void lkdtm_ARRAY_BOUNDS(void)
 	kfree(not_checked);
 	kfree(checked);
 	pr_err("FAIL: survived array bounds overflow!\n");
+	pr_expected_config(CONFIG_UBSAN_BOUNDS);
 }
 
 void lkdtm_CORRUPT_LIST_ADD(void)
diff --git a/tools/testing/selftests/lkdtm/config b/tools/testing/selftests/lkdtm/config
index 013446e87f1f..38edea25631b 100644
--- a/tools/testing/selftests/lkdtm/config
+++ b/tools/testing/selftests/lkdtm/config
@@ -6,3 +6,5 @@ CONFIG_HARDENED_USERCOPY=y
 # CONFIG_HARDENED_USERCOPY_FALLBACK is not set
 CONFIG_RANDOMIZE_KSTACK_OFFSET_DEFAULT=y
 CONFIG_INIT_ON_ALLOC_DEFAULT_ON=y
+CONFIG_UBSAN_BOUNDS=y
+CONFIG_UBSAN_TRAP=y
diff --git a/tools/testing/selftests/lkdtm/tests.txt b/tools/testing/selftests/lkdtm/tests.txt
index 846cfd508d3c..6a33dbea8491 100644
--- a/tools/testing/selftests/lkdtm/tests.txt
+++ b/tools/testing/selftests/lkdtm/tests.txt
@@ -7,6 +7,7 @@ EXCEPTION
 #EXHAUST_STACK Corrupts memory on failure
 #CORRUPT_STACK Crashes entire system on success
 #CORRUPT_STACK_STRONG Crashes entire system on success
+ARRAY_BOUNDS
 CORRUPT_LIST_ADD list_add corruption
 CORRUPT_LIST_DEL list_del corruption
 STACK_GUARD_PAGE_LEADING
-- 
2.30.2

