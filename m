From: Nathan Chancellor <nathan@kernel.org>
Subject: [PATCH RFC 5/6] gcov: Remove compiler version check
Date: Mon, 29 Nov 2021 09:58:02 -0700
Message-Id: <20211129165803.470795-6-nathan@kernel.org>
In-Reply-To: <20211129165803.470795-1-nathan@kernel.org>
References: <20211129165803.470795-1-nathan@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-ID: <kernelci.groups.io>
To: Nick Desaulniers <ndesaulniers@google.com>, Kees Cook <keescook@chromium.org>, Andrew Morton <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, Tom Stellard <tstellar@redhat.com>, Michael Ellerman <mpe@ellerman.id.au>, Naresh Kamboju <naresh.kamboju@linaro.org>, Jakub Kicinski <kuba@kernel.org>, cki-project@redhat.com, kernelci@groups.io, llvm@lists.linux.dev, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>

The minimum supported version of LLVM has been raised to 11.0.0, meaning
this check is always true, so it can be dropped.

Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 kernel/gcov/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/kernel/gcov/Kconfig b/kernel/gcov/Kconfig
index 053447183ac5..04f4ebdc3cf5 100644
--- a/kernel/gcov/Kconfig
+++ b/kernel/gcov/Kconfig
@@ -4,7 +4,6 @@ menu "GCOV-based kernel profiling"
 config GCOV_KERNEL
 	bool "Enable gcov-based kernel profiling"
 	depends on DEBUG_FS
-	depends on !CC_IS_CLANG || CLANG_VERSION >=3D 110000
 	depends on !ARCH_WANTS_NO_INSTR || CC_HAS_NO_PROFILE_FN_ATTR
 	select CONSTRUCTORS
 	default n
--=20
2.34.1

