Return-Path: <keescook@chromium.org>
From: Kees Cook <keescook@chromium.org>
Subject: [PATCH 8/9] selftests/lkdtm: Enable various testable CONFIGs
Date: Wed, 23 Jun 2021 13:39:35 -0700
Message-Id: <20210623203936.3151093-9-keescook@chromium.org>
In-Reply-To: <20210623203936.3151093-1-keescook@chromium.org>
References: <20210623203936.3151093-1-keescook@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-ID: <kernelci.groups.io>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Kees Cook <keescook@chromium.org>, kernelci@groups.io, Guillaume Tucker <guillaume.tucker@collabora.com>, David Laight <David.Laight@ACULAB.COM>, Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, linux-hardening@vger.kernel.org

Add a handful of LKDTM-testable features that depend on certain CONFIGs
so that they are visible in logs for CI systems that run the selftests.
Others could be added, but may be seen as having too high a trade-off
for general testing.

Cc: kernelci@groups.io
Suggested-by: Guillaume Tucker <guillaume.tucker@collabora.com>
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 tools/testing/selftests/lkdtm/config | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/tools/testing/selftests/lkdtm/config b/tools/testing/selftests/lkdtm/config
index d874990e442b..849799bcfa95 100644
--- a/tools/testing/selftests/lkdtm/config
+++ b/tools/testing/selftests/lkdtm/config
@@ -1 +1,7 @@
 CONFIG_LKDTM=y
+CONFIG_DEBUG_LIST=y
+CONFIG_SLAB_FREELIST_HARDENED=y
+CONFIG_FORTIFY_SOURCE=y
+CONFIG_HARDENED_USERCOPY=y
+# CONFIG_HARDENED_USERCOPY_FALLBACK is not set
+CONFIG_RANDOMIZE_KSTACK_OFFSET_DEFAULT=y
-- 
2.30.2

