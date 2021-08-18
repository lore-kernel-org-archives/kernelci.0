Return-Path: <keescook@chromium.org>
From: Kees Cook <keescook@chromium.org>
Subject: [PATCH 2/4] lkdtm/fortify: Consolidate FORTIFY_SOURCE tests
Date: Wed, 18 Aug 2021 10:48:53 -0700
Message-Id: <20210818174855.2307828-3-keescook@chromium.org>
In-Reply-To: <20210818174855.2307828-1-keescook@chromium.org>
References: <20210818174855.2307828-1-keescook@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-ID: <kernelci.groups.io>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Kees Cook <keescook@chromium.org>, Arnd Bergmann <arnd@arndb.de>, Guillaume Tucker <guillaume.tucker@collabora.com>, linux-kernel@vger.kernel.org, kernelci@groups.io, linux-kselftest@vger.kernel.org, linux-hardening@vger.kernel.org

The FORTIFY_SOURCE tests were split between bugs.c and fortify.c. Move
tests into fortify.c, standardize their naming, add CONFIG hints, and
add them to the lkdtm selftests.

Cc: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 drivers/misc/lkdtm/bugs.c               | 50 -----------------------
 drivers/misc/lkdtm/core.c               |  4 +-
 drivers/misc/lkdtm/fortify.c            | 53 +++++++++++++++++++++++++
 drivers/misc/lkdtm/lkdtm.h              |  4 +-
 tools/testing/selftests/lkdtm/tests.txt |  2 +
 5 files changed, 59 insertions(+), 54 deletions(-)

diff --git a/drivers/misc/lkdtm/bugs.c b/drivers/misc/lkdtm/bugs.c
index 03171e412356..4282b625200f 100644
--- a/drivers/misc/lkdtm/bugs.c
+++ b/drivers/misc/lkdtm/bugs.c
@@ -507,53 +507,3 @@ noinline void lkdtm_CORRUPT_PAC(void)
 	pr_err("XFAIL: this test is arm64-only\n");
 #endif
 }
-
-void lkdtm_FORTIFY_OBJECT(void)
-{
-	struct target {
-		char a[10];
-	} target[2] = {};
-	int result;
-
-	/*
-	 * Using volatile prevents the compiler from determining the value of
-	 * 'size' at compile time. Without that, we would get a compile error
-	 * rather than a runtime error.
-	 */
-	volatile int size = 11;
-
-	pr_info("trying to read past the end of a struct\n");
-
-	result = memcmp(&target[0], &target[1], size);
-
-	/* Print result to prevent the code from being eliminated */
-	pr_err("FAIL: fortify did not catch an object overread!\n"
-	       "\"%d\" was the memcmp result.\n", result);
-}
-
-void lkdtm_FORTIFY_SUBOBJECT(void)
-{
-	struct target {
-		char a[10];
-		char b[10];
-	} target;
-	char *src;
-
-	src = kmalloc(20, GFP_KERNEL);
-	strscpy(src, "over ten bytes", 20);
-
-	pr_info("trying to strcpy past the end of a member of a struct\n");
-
-	/*
-	 * strncpy(target.a, src, 20); will hit a compile error because the
-	 * compiler knows at build time that target.a < 20 bytes. Use strcpy()
-	 * to force a runtime error.
-	 */
-	strcpy(target.a, src);
-
-	/* Use target.a to prevent the code from being eliminated */
-	pr_err("FAIL: fortify did not catch an sub-object overrun!\n"
-	       "\"%s\" was copied.\n", target.a);
-
-	kfree(src);
-}
diff --git a/drivers/misc/lkdtm/core.c b/drivers/misc/lkdtm/core.c
index 9dda87c6b54a..dbdb0af7f68a 100644
--- a/drivers/misc/lkdtm/core.c
+++ b/drivers/misc/lkdtm/core.c
@@ -119,8 +119,6 @@ static const struct crashtype crashtypes[] = {
 	CRASHTYPE(UNSET_SMEP),
 	CRASHTYPE(CORRUPT_PAC),
 	CRASHTYPE(UNALIGNED_LOAD_STORE_WRITE),
-	CRASHTYPE(FORTIFY_OBJECT),
-	CRASHTYPE(FORTIFY_SUBOBJECT),
 	CRASHTYPE(SLAB_LINEAR_OVERFLOW),
 	CRASHTYPE(VMALLOC_LINEAR_OVERFLOW),
 	CRASHTYPE(WRITE_AFTER_FREE),
@@ -180,6 +178,8 @@ static const struct crashtype crashtypes[] = {
 	CRASHTYPE(USERCOPY_KERNEL),
 	CRASHTYPE(STACKLEAK_ERASING),
 	CRASHTYPE(CFI_FORWARD_PROTO),
+	CRASHTYPE(FORTIFIED_OBJECT),
+	CRASHTYPE(FORTIFIED_SUBOBJECT),
 	CRASHTYPE(FORTIFIED_STRSCPY),
 	CRASHTYPE(DOUBLE_FAULT),
 #ifdef CONFIG_PPC_BOOK3S_64
diff --git a/drivers/misc/lkdtm/fortify.c b/drivers/misc/lkdtm/fortify.c
index 0f51d31b57ca..d06458a4858e 100644
--- a/drivers/misc/lkdtm/fortify.c
+++ b/drivers/misc/lkdtm/fortify.c
@@ -8,6 +8,59 @@
 #include <linux/string.h>
 #include <linux/slab.h>
 
+static volatile int fortify_scratch_space;
+
+void lkdtm_FORTIFIED_OBJECT(void)
+{
+	struct target {
+		char a[10];
+	} target[2] = {};
+	/*
+	 * Using volatile prevents the compiler from determining the value of
+	 * 'size' at compile time. Without that, we would get a compile error
+	 * rather than a runtime error.
+	 */
+	volatile int size = 11;
+
+	pr_info("trying to read past the end of a struct\n");
+
+	/* Store result to global to prevent the code from being eliminated */
+	fortify_scratch_space = memcmp(&target[0], &target[1], size);
+
+	pr_err("FAIL: fortify did not block an object overread!\n");
+	pr_expected_config(CONFIG_FORTIFY_SOURCE);
+}
+
+void lkdtm_FORTIFIED_SUBOBJECT(void)
+{
+	struct target {
+		char a[10];
+		char b[10];
+	} target;
+	volatile int size = 20;
+	char *src;
+
+	src = kmalloc(size, GFP_KERNEL);
+	strscpy(src, "over ten bytes", size);
+	size = strlen(src) + 1;
+
+	pr_info("trying to strcpy past the end of a member of a struct\n");
+
+	/*
+	 * memcpy(target.a, src, 20); will hit a compile error because the
+	 * compiler knows at build time that target.a < 20 bytes. Use a
+	 * volatile to force a runtime error.
+	 */
+	memcpy(target.a, src, size);
+
+	/* Store result to global to prevent the code from being eliminated */
+	fortify_scratch_space = target.a[3];
+
+	pr_err("FAIL: fortify did not block an sub-object overrun!\n");
+	pr_expected_config(CONFIG_FORTIFY_SOURCE);
+
+	kfree(src);
+}
 
 /*
  * Calls fortified strscpy to test that it returns the same result as vanilla
diff --git a/drivers/misc/lkdtm/lkdtm.h b/drivers/misc/lkdtm/lkdtm.h
index 6a30b60519f3..f2e61581c1ae 100644
--- a/drivers/misc/lkdtm/lkdtm.h
+++ b/drivers/misc/lkdtm/lkdtm.h
@@ -74,8 +74,6 @@ void lkdtm_STACK_GUARD_PAGE_TRAILING(void);
 void lkdtm_UNSET_SMEP(void);
 void lkdtm_DOUBLE_FAULT(void);
 void lkdtm_CORRUPT_PAC(void);
-void lkdtm_FORTIFY_OBJECT(void);
-void lkdtm_FORTIFY_SUBOBJECT(void);
 
 /* heap.c */
 void __init lkdtm_heap_init(void);
@@ -150,6 +148,8 @@ void lkdtm_STACKLEAK_ERASING(void);
 void lkdtm_CFI_FORWARD_PROTO(void);
 
 /* fortify.c */
+void lkdtm_FORTIFIED_OBJECT(void);
+void lkdtm_FORTIFIED_SUBOBJECT(void);
 void lkdtm_FORTIFIED_STRSCPY(void);
 
 /* powerpc.c */
diff --git a/tools/testing/selftests/lkdtm/tests.txt b/tools/testing/selftests/lkdtm/tests.txt
index 6a33dbea8491..09f7bfa383cc 100644
--- a/tools/testing/selftests/lkdtm/tests.txt
+++ b/tools/testing/selftests/lkdtm/tests.txt
@@ -73,4 +73,6 @@ USERCOPY_KERNEL
 STACKLEAK_ERASING OK: the rest of the thread stack is properly erased
 CFI_FORWARD_PROTO
 FORTIFIED_STRSCPY
+FORTIFIED_OBJECT
+FORTIFIED_SUBOBJECT
 PPC_SLB_MULTIHIT Recovered
-- 
2.30.2

