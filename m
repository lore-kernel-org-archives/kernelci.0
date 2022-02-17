From: "Usama" <usama.anjum@collabora.com>
Subject: [PATCH 2/2] selftests/lkdtm: add config
Date: Fri, 18 Feb 2022 01:56:20 +0500
Message-Id: <20220217205620.2512094-2-usama.anjum@collabora.com>
In-Reply-To: <20220217205620.2512094-1-usama.anjum@collabora.com>
References: <20220217205620.2512094-1-usama.anjum@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-ID: <kernelci.groups.io>
To: Kees Cook <keescook@chromium.org>, Shuah Khan <shuah@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Muhammad Usama Anjum <usama.anjum@collabora.com>, kernel@collabora.com, kernelci@groups.io, linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org

Add config option which is needed for SLAB_LINEAR_OVERFLOW test. It
needs KASAN enabled.

Cc: Kees Cook <keescook@chromium.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Fixes: 9c4f6ebc3665 ("lkdtm/heap: Add vmalloc linear overflow test")
Signed-off-by: Muhammad Usama Anjum <usama.anjum@collabora.com>
---
 tools/testing/selftests/lkdtm/config | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/testing/selftests/lkdtm/config b/tools/testing/selftes=
ts/lkdtm/config
index adc9fa60057c5..4e8af0f712f74 100644
--- a/tools/testing/selftests/lkdtm/config
+++ b/tools/testing/selftests/lkdtm/config
@@ -7,6 +7,7 @@ CONFIG_HARDENED_USERCOPY=3Dy
 CONFIG_RANDOMIZE_KSTACK_OFFSET_DEFAULT=3Dy
 CONFIG_INIT_ON_FREE_DEFAULT_ON=3Dy
 CONFIG_INIT_ON_ALLOC_DEFAULT_ON=3Dy
+CONFIG_KASAN=3Dy
 CONFIG_UBSAN=3Dy
 CONFIG_UBSAN_BOUNDS=3Dy
 CONFIG_UBSAN_TRAP=3Dy
--=20
2.30.2

