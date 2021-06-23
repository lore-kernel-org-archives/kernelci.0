Return-Path: <keescook@chromium.org>
From: Kees Cook <keescook@chromium.org>
Subject: [PATCH 4/9] lkdtm/bugs: XFAIL UNALIGNED_LOAD_STORE_WRITE
Date: Wed, 23 Jun 2021 13:39:31 -0700
Message-Id: <20210623203936.3151093-5-keescook@chromium.org>
In-Reply-To: <20210623203936.3151093-1-keescook@chromium.org>
References: <20210623203936.3151093-1-keescook@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-ID: <kernelci.groups.io>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Kees Cook <keescook@chromium.org>, stable@vger.kernel.org, Guillaume Tucker <guillaume.tucker@collabora.com>, David Laight <David.Laight@ACULAB.COM>, Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org, kernelci@groups.io, linux-kselftest@vger.kernel.org, linux-hardening@vger.kernel.org

When built under CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS, this test is
expected to fail (i.e. not trip an exception).

Fixes: 46d1a0f03d66 ("selftests/lkdtm: Add tests for LKDTM targets")
Cc: stable@vger.kernel.org
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 drivers/misc/lkdtm/bugs.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/misc/lkdtm/bugs.c b/drivers/misc/lkdtm/bugs.c
index 0e8254d0cf0b..9ff02bdf3153 100644
--- a/drivers/misc/lkdtm/bugs.c
+++ b/drivers/misc/lkdtm/bugs.c
@@ -161,6 +161,9 @@ void lkdtm_UNALIGNED_LOAD_STORE_WRITE(void)
 	if (*p == 0)
 		val = 0x87654321;
 	*p = val;
+
+	if (IS_ENABLED(CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS))
+		pr_err("XFAIL: arch has CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS\n");
 }
 
 void lkdtm_SOFTLOCKUP(void)
-- 
2.30.2

