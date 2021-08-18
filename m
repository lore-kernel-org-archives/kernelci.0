Return-Path: <keescook@chromium.org>
From: Kees Cook <keescook@chromium.org>
Subject: [PATCH 3/4] lkdtm: Add kernel version to failure hints
Date: Wed, 18 Aug 2021 10:48:54 -0700
Message-Id: <20210818174855.2307828-4-keescook@chromium.org>
In-Reply-To: <20210818174855.2307828-1-keescook@chromium.org>
References: <20210818174855.2307828-1-keescook@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-ID: <kernelci.groups.io>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Kees Cook <keescook@chromium.org>, Arnd Bergmann <arnd@arndb.de>, kernelci@groups.io, Guillaume Tucker <guillaume.tucker@collabora.com>, linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, linux-hardening@vger.kernel.org

In an effort to keep as much information in once place as possible in
CI logs, report the kernel version and architecture in the failure hints.

Cc: Arnd Bergmann <arnd@arndb.de>
Cc: kernelci@groups.io
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 drivers/misc/lkdtm/lkdtm.h | 20 ++++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/drivers/misc/lkdtm/lkdtm.h b/drivers/misc/lkdtm/lkdtm.h
index f2e61581c1ae..d7d64d9765eb 100644
--- a/drivers/misc/lkdtm/lkdtm.h
+++ b/drivers/misc/lkdtm/lkdtm.h
@@ -5,13 +5,17 @@
 #define pr_fmt(fmt) "lkdtm: " fmt
 
 #include <linux/kernel.h>
+#include <generated/compile.h>
+#include <generated/utsrelease.h>
+
+#define LKDTM_KERNEL "kernel (" UTS_RELEASE " " UTS_MACHINE ")"
 
 #define pr_expected_config(kconfig)				\
 {								\
 	if (IS_ENABLED(kconfig)) 				\
-		pr_err("Unexpected! This kernel was built with " #kconfig "=y\n"); \
+		pr_err("Unexpected! This " LKDTM_KERNEL " was built with " #kconfig "=y\n"); \
 	else							\
-		pr_warn("This is probably expected, since this kernel was built *without* " #kconfig "=y\n"); \
+		pr_warn("This is probably expected, since this " LKDTM_KERNEL " was built *without* " #kconfig "=y\n"); \
 }
 
 #ifndef MODULE
@@ -21,24 +25,24 @@ int lkdtm_check_bool_cmdline(const char *param);
 	if (IS_ENABLED(kconfig)) {				\
 		switch (lkdtm_check_bool_cmdline(param)) {	\
 		case 0:						\
-			pr_warn("This is probably expected, since this kernel was built with " #kconfig "=y but booted with '" param "=N'\n"); \
+			pr_warn("This is probably expected, since this " LKDTM_KERNEL " was built with " #kconfig "=y but booted with '" param "=N'\n"); \
 			break;					\
 		case 1:						\
-			pr_err("Unexpected! This kernel was built with " #kconfig "=y and booted with '" param "=Y'\n"); \
+			pr_err("Unexpected! This " LKDTM_KERNEL " was built with " #kconfig "=y and booted with '" param "=Y'\n"); \
 			break;					\
 		default:					\
-			pr_err("Unexpected! This kernel was built with " #kconfig "=y (and booted without '" param "' specified)\n"); \
+			pr_err("Unexpected! This " LKDTM_KERNEL " was built with " #kconfig "=y (and booted without '" param "' specified)\n"); \
 		}						\
 	} else {						\
 		switch (lkdtm_check_bool_cmdline(param)) {	\
 		case 0:						\
-			pr_warn("This is probably expected, as kernel was built *without* " #kconfig "=y and booted with '" param "=N'\n"); \
+			pr_warn("This is probably expected, as this " LKDTM_KERNEL " was built *without* " #kconfig "=y and booted with '" param "=N'\n"); \
 			break;					\
 		case 1:						\
-			pr_err("Unexpected! This kernel was built *without* " #kconfig "=y but booted with '" param "=Y'\n"); \
+			pr_err("Unexpected! This " LKDTM_KERNEL " was built *without* " #kconfig "=y but booted with '" param "=Y'\n"); \
 			break;					\
 		default:					\
-			pr_err("This is probably expected, since this kernel was built *without* " #kconfig "=y (and booted without '" param "' specified)\n"); \
+			pr_err("This is probably expected, since this " LKDTM_KERNEL " was built *without* " #kconfig "=y (and booted without '" param "' specified)\n"); \
 			break;					\
 		}						\
 	}							\
-- 
2.30.2

