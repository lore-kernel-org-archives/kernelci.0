From: "Usama" <usama.anjum@collabora.com>
Subject: [PATCH 1/2] selftests/lkdtm: add config and turn off CFI_FORWARD_PROTO
Date: Fri, 18 Feb 2022 01:56:19 +0500
Message-Id: <20220217205620.2512094-1-usama.anjum@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-ID: <kernelci.groups.io>
To: Kees Cook <keescook@chromium.org>, Shuah Khan <shuah@kernel.org>
Cc: Muhammad Usama Anjum <usama.anjum@collabora.com>, kernel@collabora.com, kernelci@groups.io, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Shuah Khan <skhan@linuxfoundation.org>, linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org

Add config options which are needed for LKDTM sub-tests.
STACKLEAK_ERASING test needs GCC_PLUGIN_STACKLEAK config.
READ_AFTER_FREE and READ_BUDDY_AFTER_FREE tests need
INIT_ON_FREE_DEFAULT_ON config.

CFI_FORWARD_PROTO always fails as there is no active CFI system of some
kind. Turn it off for now by default until proper support.

Cc: Kees Cook <keescook@chromium.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Fixes: 46d1a0f03d66 ("selftests/lkdtm: Add tests for LKDTM targets")
Signed-off-by: Muhammad Usama Anjum <usama.anjum@collabora.com>
---
 tools/testing/selftests/lkdtm/config    | 2 ++
 tools/testing/selftests/lkdtm/tests.txt | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/lkdtm/config b/tools/testing/selftes=
ts/lkdtm/config
index 46f39ee762086..adc9fa60057c5 100644
--- a/tools/testing/selftests/lkdtm/config
+++ b/tools/testing/selftests/lkdtm/config
@@ -2,8 +2,10 @@ CONFIG_LKDTM=3Dy
 CONFIG_DEBUG_LIST=3Dy
 CONFIG_SLAB_FREELIST_HARDENED=3Dy
 CONFIG_FORTIFY_SOURCE=3Dy
+CONFIG_GCC_PLUGIN_STACKLEAK=3Dy
 CONFIG_HARDENED_USERCOPY=3Dy
 CONFIG_RANDOMIZE_KSTACK_OFFSET_DEFAULT=3Dy
+CONFIG_INIT_ON_FREE_DEFAULT_ON=3Dy
 CONFIG_INIT_ON_ALLOC_DEFAULT_ON=3Dy
 CONFIG_UBSAN=3Dy
 CONFIG_UBSAN_BOUNDS=3Dy
diff --git a/tools/testing/selftests/lkdtm/tests.txt b/tools/testing/self=
tests/lkdtm/tests.txt
index 6b36b7f5dcf96..aa947b0ce1eeb 100644
--- a/tools/testing/selftests/lkdtm/tests.txt
+++ b/tools/testing/selftests/lkdtm/tests.txt
@@ -72,7 +72,7 @@ USERCOPY_STACK_FRAME_FROM
 USERCOPY_STACK_BEYOND
 USERCOPY_KERNEL
 STACKLEAK_ERASING OK: the rest of the thread stack is properly erased
-CFI_FORWARD_PROTO
+#CFI_FORWARD_PROTO
 FORTIFIED_STRSCPY
 FORTIFIED_OBJECT
 FORTIFIED_SUBOBJECT
--=20
2.30.2

