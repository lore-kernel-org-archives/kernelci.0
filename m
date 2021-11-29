From: Nathan Chancellor <nathan@kernel.org>
Subject: [PATCH RFC 4/6] Revert "ARM: 9070/1: Make UNWINDER_ARM depend on ld.bfd or ld.lld 11.0.0+"
Date: Mon, 29 Nov 2021 09:58:01 -0700
Message-Id: <20211129165803.470795-5-nathan@kernel.org>
In-Reply-To: <20211129165803.470795-1-nathan@kernel.org>
References: <20211129165803.470795-1-nathan@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-ID: <kernelci.groups.io>
To: Nick Desaulniers <ndesaulniers@google.com>, Kees Cook <keescook@chromium.org>, Andrew Morton <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, Tom Stellard <tstellar@redhat.com>, Michael Ellerman <mpe@ellerman.id.au>, Naresh Kamboju <naresh.kamboju@linaro.org>, Jakub Kicinski <kuba@kernel.org>, cki-project@redhat.com, kernelci@groups.io, llvm@lists.linux.dev, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>

This reverts commit 7411cfc3c91a08a884463bbc7623087ecc2efdd8.

The minimum supported version of LLVM has been raised to 11.0.0, meaning
this check is always true, so it can be dropped.

Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 arch/arm/Kconfig.debug | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm/Kconfig.debug b/arch/arm/Kconfig.debug
index 98436702e0c7..cd2d74b625c1 100644
--- a/arch/arm/Kconfig.debug
+++ b/arch/arm/Kconfig.debug
@@ -66,8 +66,6 @@ config UNWINDER_FRAME_POINTER
 config UNWINDER_ARM
 	bool "ARM EABI stack unwinder"
 	depends on AEABI && !FUNCTION_GRAPH_TRACER
-	# https://github.com/ClangBuiltLinux/linux/issues/732
-	depends on !LD_IS_LLD || LLD_VERSION >=3D 110000
 	select ARM_UNWIND
 	help
 	  This option enables stack unwinding support in the kernel
--=20
2.34.1

