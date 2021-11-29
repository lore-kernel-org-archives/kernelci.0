From: Nathan Chancellor <nathan@kernel.org>
Subject: [PATCH RFC 3/6] arch/Kconfig: Remove CLANG_VERSION check in HAS_LTO_CLANG
Date: Mon, 29 Nov 2021 09:58:00 -0700
Message-Id: <20211129165803.470795-4-nathan@kernel.org>
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
 arch/Kconfig | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/Kconfig b/arch/Kconfig
index d3c4ab249e9c..86e071f693ce 100644
--- a/arch/Kconfig
+++ b/arch/Kconfig
@@ -648,8 +648,7 @@ config ARCH_SUPPORTS_LTO_CLANG_THIN
=20
 config HAS_LTO_CLANG
 	def_bool y
-	# Clang >=3D 11: https://github.com/ClangBuiltLinux/linux/issues/510
-	depends on CC_IS_CLANG && CLANG_VERSION >=3D 110000 && LD_IS_LLD && AS_=
IS_LLVM
+	depends on CC_IS_CLANG && LD_IS_LLD && AS_IS_LLVM
 	depends on $(success,$(NM) --help | head -n 1 | grep -qi llvm)
 	depends on $(success,$(AR) --help | head -n 1 | grep -qi llvm)
 	depends on ARCH_SUPPORTS_LTO_CLANG
--=20
2.34.1

