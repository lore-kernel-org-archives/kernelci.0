From: Nathan Chancellor <nathan@kernel.org>
Subject: [PATCH RFC 2/6] mm, slab: Remove compiler check in __kmalloc_index
Date: Mon, 29 Nov 2021 09:57:59 -0700
Message-Id: <20211129165803.470795-3-nathan@kernel.org>
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
 include/linux/slab.h | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/include/linux/slab.h b/include/linux/slab.h
index 181045148b06..d3fb5ac71c24 100644
--- a/include/linux/slab.h
+++ b/include/linux/slab.h
@@ -411,8 +411,7 @@ static __always_inline unsigned int __kmalloc_index(s=
ize_t size,
 	if (size <=3D  16 * 1024 * 1024) return 24;
 	if (size <=3D  32 * 1024 * 1024) return 25;
=20
-	if ((IS_ENABLED(CONFIG_CC_IS_GCC) || CONFIG_CLANG_VERSION >=3D 110000)
-	    && !IS_ENABLED(CONFIG_PROFILE_ALL_BRANCHES) && size_is_constant)
+	if (!IS_ENABLED(CONFIG_PROFILE_ALL_BRANCHES) && size_is_constant)
 		BUILD_BUG_ON_MSG(1, "unexpected size in kmalloc_index()");
 	else
 		BUG();
--=20
2.34.1

