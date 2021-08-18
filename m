Return-Path: <keescook@chromium.org>
From: Kees Cook <keescook@chromium.org>
Subject: [PATCH 4/4] lkdtm/heap: Avoid __alloc_size hint warning for VMALLOC_LINEAR_OVERFLOW
Date: Wed, 18 Aug 2021 10:48:55 -0700
Message-Id: <20210818174855.2307828-5-keescook@chromium.org>
In-Reply-To: <20210818174855.2307828-1-keescook@chromium.org>
References: <20210818174855.2307828-1-keescook@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-ID: <kernelci.groups.io>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Kees Cook <keescook@chromium.org>, Arnd Bergmann <arnd@arndb.de>, Guillaume Tucker <guillaume.tucker@collabora.com>, linux-kernel@vger.kernel.org, kernelci@groups.io, linux-kselftest@vger.kernel.org, linux-hardening@vger.kernel.org

Once __alloc_size hints have been added, the compiler will (correctly!)
see this as an overflow. We are, however, trying to test for this
condition at run-time (not compile-time), so work around it with a
volatile int offset.

Cc: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 drivers/misc/lkdtm/heap.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/misc/lkdtm/heap.c b/drivers/misc/lkdtm/heap.c
index 3d9aae5821a0..8a92f5a800fa 100644
--- a/drivers/misc/lkdtm/heap.c
+++ b/drivers/misc/lkdtm/heap.c
@@ -12,6 +12,13 @@ static struct kmem_cache *double_free_cache;
 static struct kmem_cache *a_cache;
 static struct kmem_cache *b_cache;
 
+/*
+ * Using volatile here means the compiler cannot ever make assumptions
+ * about this value. This means compile-time length checks involving
+ * this variable cannot be performed; only run-time checks.
+ */
+static volatile int __offset = 1;
+
 /*
  * If there aren't guard pages, it's likely that a consecutive allocation will
  * let us overflow into the second allocation without overwriting something real.
@@ -24,7 +31,7 @@ void lkdtm_VMALLOC_LINEAR_OVERFLOW(void)
 	two = vzalloc(PAGE_SIZE);
 
 	pr_info("Attempting vmalloc linear overflow ...\n");
-	memset(one, 0xAA, PAGE_SIZE + 1);
+	memset(one, 0xAA, PAGE_SIZE + __offset);
 
 	vfree(two);
 	vfree(one);
-- 
2.30.2

