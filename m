Return-Path: <keescook@chromium.org>
From: Kees Cook <keescook@chromium.org>
Subject: [PATCH 6/9] lkdtm: Enable DOUBLE_FAULT on all architectures
Date: Wed, 23 Jun 2021 13:39:33 -0700
Message-Id: <20210623203936.3151093-7-keescook@chromium.org>
In-Reply-To: <20210623203936.3151093-1-keescook@chromium.org>
References: <20210623203936.3151093-1-keescook@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-ID: <kernelci.groups.io>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Kees Cook <keescook@chromium.org>, stable@vger.kernel.org, Guillaume Tucker <guillaume.tucker@collabora.com>, David Laight <David.Laight@ACULAB.COM>, Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org, kernelci@groups.io, linux-kselftest@vger.kernel.org, linux-hardening@vger.kernel.org

Where feasible, I prefer to have all tests visible on all architectures,
but to have them wired to XFAIL. DOUBLE_FAIL was set up to XFAIL, but
wasn't actually being added to the test list.

Fixes: cea23efb4de2 ("lkdtm/bugs: Make double-fault test always available")
Cc: stable@vger.kernel.org
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 drivers/misc/lkdtm/core.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/misc/lkdtm/core.c b/drivers/misc/lkdtm/core.c
index 645b31e98c77..2c89fc18669f 100644
--- a/drivers/misc/lkdtm/core.c
+++ b/drivers/misc/lkdtm/core.c
@@ -178,9 +178,7 @@ static const struct crashtype crashtypes[] = {
 	CRASHTYPE(STACKLEAK_ERASING),
 	CRASHTYPE(CFI_FORWARD_PROTO),
 	CRASHTYPE(FORTIFIED_STRSCPY),
-#ifdef CONFIG_X86_32
 	CRASHTYPE(DOUBLE_FAULT),
-#endif
 #ifdef CONFIG_PPC_BOOK3S_64
 	CRASHTYPE(PPC_SLB_MULTIHIT),
 #endif
-- 
2.30.2

