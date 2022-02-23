From: "Usama" <usama.anjum@collabora.com>
Subject: [PATCH] Makefile: Fix separate output directory build of kselftests
Date: Thu, 24 Feb 2022 00:10:15 +0500
Message-Id: <20220223191016.1658728-1-usama.anjum@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-ID: <kernelci.groups.io>
To: Masahiro Yamada <masahiroy@kernel.org>, Michal Marek <michal.lkml@markovi.net>, Nick Desaulniers <ndesaulniers@google.com>
Cc: Muhammad Usama Anjum <usama.anjum@collabora.com>, kernel@collabora.com, kernelci@groups.io, shuah@kernel.org, linux-kselftest@vger.kernel.org, keescook@chromium.org, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

Build of kselftests fail if kernel's top most Makefile is used for
running or building kselftests with separate output directory. The
absolute path is needed to reference other files during this kind of
build. Set KBUILD_ABS_SRCTREE to use absolute path during the build. It
fixes the following different types of errors:

make kselftest-all O=3D/linux_mainline/build
Makefile:1080: ../scripts/Makefile.extrawarn: No such file or directory

make kselftest-all O=3Dbuild
Makefile:1080: ../scripts/Makefile.extrawarn: No such file or directory

Signed-off-by: Muhammad Usama Anjum <usama.anjum@collabora.com>
---
I've tested this patch on top of next-20220217. The latest next-20220222
have missing patches.
---
 Makefile | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index 86f633c2809ea..62b3eb8a102ab 100644
--- a/Makefile
+++ b/Makefile
@@ -1411,10 +1411,10 @@ tools/%: FORCE
=20
 PHONY +=3D kselftest
 kselftest:
-	$(Q)$(MAKE) -C $(srctree)/tools/testing/selftests run_tests
+	$(Q)$(MAKE) -C $(srctree)/tools/testing/selftests KBUILD_ABS_SRCTREE=3D=
1 run_tests
=20
 kselftest-%: FORCE
-	$(Q)$(MAKE) -C $(srctree)/tools/testing/selftests $*
+	$(Q)$(MAKE) -C $(srctree)/tools/testing/selftests KBUILD_ABS_SRCTREE=3D=
1 $*
=20
 PHONY +=3D kselftest-merge
 kselftest-merge:
--=20
2.30.2

