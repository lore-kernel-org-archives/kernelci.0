Return-Path: <keescook@chromium.org>
From: Kees Cook <keescook@chromium.org>
Subject: [PATCH 5/9] lkdtm/heap: Add vmalloc linear overflow test
Date: Wed, 23 Jun 2021 13:39:32 -0700
Message-Id: <20210623203936.3151093-6-keescook@chromium.org>
In-Reply-To: <20210623203936.3151093-1-keescook@chromium.org>
References: <20210623203936.3151093-1-keescook@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-ID: <kernelci.groups.io>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Kees Cook <keescook@chromium.org>, Guillaume Tucker <guillaume.tucker@collabora.com>, David Laight <David.Laight@ACULAB.COM>, Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org, kernelci@groups.io, linux-kselftest@vger.kernel.org, linux-hardening@vger.kernel.org

Similar to the existing slab overflow and stack exhaustion tests, add
VMALLOC_LINEAR_OVERFLOW (and rename the slab test SLAB_LINEAR_OVERFLOW).
Additionally unmarks the test as destructive. (It should be safe in the
face of misbehavior.)

Signed-off-by: Kees Cook <keescook@chromium.org>
---
 drivers/misc/lkdtm/core.c               |  3 ++-
 drivers/misc/lkdtm/heap.c               | 22 +++++++++++++++++++++-
 drivers/misc/lkdtm/lkdtm.h              |  3 ++-
 tools/testing/selftests/lkdtm/tests.txt |  3 ++-
 4 files changed, 27 insertions(+), 4 deletions(-)

diff --git a/drivers/misc/lkdtm/core.c b/drivers/misc/lkdtm/core.c
index 8024b6a5cc7f..645b31e98c77 100644
--- a/drivers/misc/lkdtm/core.c
+++ b/drivers/misc/lkdtm/core.c
@@ -120,7 +120,8 @@ static const struct crashtype crashtypes[] = {
 	CRASHTYPE(UNALIGNED_LOAD_STORE_WRITE),
 	CRASHTYPE(FORTIFY_OBJECT),
 	CRASHTYPE(FORTIFY_SUBOBJECT),
-	CRASHTYPE(OVERWRITE_ALLOCATION),
+	CRASHTYPE(SLAB_LINEAR_OVERFLOW),
+	CRASHTYPE(VMALLOC_LINEAR_OVERFLOW),
 	CRASHTYPE(WRITE_AFTER_FREE),
 	CRASHTYPE(READ_AFTER_FREE),
 	CRASHTYPE(WRITE_BUDDY_AFTER_FREE),
diff --git a/drivers/misc/lkdtm/heap.c b/drivers/misc/lkdtm/heap.c
index 1323bc16f113..36be5e353cd0 100644
--- a/drivers/misc/lkdtm/heap.c
+++ b/drivers/misc/lkdtm/heap.c
@@ -5,24 +5,44 @@
  */
 #include "lkdtm.h"
 #include <linux/slab.h>
+#include <linux/vmalloc.h>
 #include <linux/sched.h>
 
 static struct kmem_cache *double_free_cache;
 static struct kmem_cache *a_cache;
 static struct kmem_cache *b_cache;
 
+/*
+ * If there aren't guard pages, it's likely that a consecutive allocation will
+ * let us overflow into the second allocation without overwriting something real.
+ */
+void lkdtm_VMALLOC_LINEAR_OVERFLOW(void)
+{
+	char *one, *two;
+
+	one = vzalloc(PAGE_SIZE);
+	two = vzalloc(PAGE_SIZE);
+
+	pr_info("Attempting vmalloc linear overflow ...\n");
+	memset(one, 0xAA, PAGE_SIZE + 1);
+
+	vfree(two);
+	vfree(one);
+}
+
 /*
  * This tries to stay within the next largest power-of-2 kmalloc cache
  * to avoid actually overwriting anything important if it's not detected
  * correctly.
  */
-void lkdtm_OVERWRITE_ALLOCATION(void)
+void lkdtm_SLAB_LINEAR_OVERFLOW(void)
 {
 	size_t len = 1020;
 	u32 *data = kmalloc(len, GFP_KERNEL);
 	if (!data)
 		return;
 
+	pr_info("Attempting slab linear overflow ...\n");
 	data[1024 / sizeof(u32)] = 0x12345678;
 	kfree(data);
 }
diff --git a/drivers/misc/lkdtm/lkdtm.h b/drivers/misc/lkdtm/lkdtm.h
index 99f90d3e5e9c..c6baf4f1e1db 100644
--- a/drivers/misc/lkdtm/lkdtm.h
+++ b/drivers/misc/lkdtm/lkdtm.h
@@ -39,7 +39,8 @@ void lkdtm_FORTIFY_SUBOBJECT(void);
 /* heap.c */
 void __init lkdtm_heap_init(void);
 void __exit lkdtm_heap_exit(void);
-void lkdtm_OVERWRITE_ALLOCATION(void);
+void lkdtm_VMALLOC_LINEAR_OVERFLOW(void);
+void lkdtm_SLAB_LINEAR_OVERFLOW(void);
 void lkdtm_WRITE_AFTER_FREE(void);
 void lkdtm_READ_AFTER_FREE(void);
 void lkdtm_WRITE_BUDDY_AFTER_FREE(void);
diff --git a/tools/testing/selftests/lkdtm/tests.txt b/tools/testing/selftests/lkdtm/tests.txt
index a94d4d8eeb5c..30080cc15623 100644
--- a/tools/testing/selftests/lkdtm/tests.txt
+++ b/tools/testing/selftests/lkdtm/tests.txt
@@ -15,7 +15,8 @@ UNSET_SMEP pinned CR4 bits changed:
 DOUBLE_FAULT
 CORRUPT_PAC
 UNALIGNED_LOAD_STORE_WRITE
-#OVERWRITE_ALLOCATION Corrupts memory on failure
+SLAB_LINEAR_OVERFLOW
+VMALLOC_LINEAR_OVERFLOW
 #WRITE_AFTER_FREE Corrupts memory on failure
 READ_AFTER_FREE call trace:|Memory correctly poisoned
 #WRITE_BUDDY_AFTER_FREE Corrupts memory on failure
-- 
2.30.2

