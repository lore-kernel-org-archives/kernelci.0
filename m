From: "Usama" <usama.anjum@collabora.com>
Subject: [PATCH V2] selftests: Fix build when $(O) points to a relative path
Date: Thu, 17 Feb 2022 03:38:17 +0500
Message-Id: <20220216223817.1386745-1-usama.anjum@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-ID: <kernelci.groups.io>
To: Shuah Khan <shuah@kernel.org>, Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <kafai@fb.com>, Song Liu <songliubraving@fb.com>, Yonghong Song <yhs@fb.com>, John Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>
Cc: Muhammad Usama Anjum <usama.anjum@collabora.com>, kernel@collabora.com, kernelci@groups.io, linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org, bpf@vger.kernel.org

Build of bpf and tc-testing selftests fails when the relative path of
the build directory is specified.

make -C tools/testing/selftests O=3Dbuild0
make[1]: Entering directory '/linux_mainline/tools/testing/selftests/bpf'
../../../scripts/Makefile.include:4: *** O=3Dbuild0 does not exist.  Stop=
.
make[1]: Entering directory '/linux_mainline/tools/testing/selftests/tc-t=
esting'
../../../scripts/Makefile.include:4: *** O=3Dbuild0 does not exist.  Stop=
.

Makefiles of bpf and tc-testing include scripts/Makefile.include file.
This file has sanity checking inside it which checks the output path.
The output path is not relative to the bpf or tc-testing. The sanity
check fails. Expand the output path to get rid of this error. The fix is
the same as mentioned in commit 150a27328b68 ("bpf, preload: Fix build
when $(O) points to a relative path").

Signed-off-by: Muhammad Usama Anjum <usama.anjum@collabora.com>
---
Changes in V2:
Add more explaination to the commit message.
Support make install as well.
---
 tools/testing/selftests/Makefile | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/Makefile b/tools/testing/selftests/M=
akefile
index 4eda7c7c15694..6a5c25fcc9cfc 100644
--- a/tools/testing/selftests/Makefile
+++ b/tools/testing/selftests/Makefile
@@ -178,6 +178,7 @@ all: khdr
 		BUILD_TARGET=3D$$BUILD/$$TARGET;			\
 		mkdir $$BUILD_TARGET  -p;			\
 		$(MAKE) OUTPUT=3D$$BUILD_TARGET -C $$TARGET	\
+				O=3D$(abs_objtree)		\
 				$(if $(FORCE_TARGETS),|| exit);	\
 		ret=3D$$((ret * $$?));				\
 	done; exit $$ret;
@@ -185,7 +186,8 @@ all: khdr
 run_tests: all
 	@for TARGET in $(TARGETS); do \
 		BUILD_TARGET=3D$$BUILD/$$TARGET;	\
-		$(MAKE) OUTPUT=3D$$BUILD_TARGET -C $$TARGET run_tests;\
+		$(MAKE) OUTPUT=3D$$BUILD_TARGET -C $$TARGET run_tests \
+				O=3D$(abs_objtree);		    \
 	done;
=20
 hotplug:
@@ -236,6 +238,7 @@ ifdef INSTALL_PATH
 	for TARGET in $(TARGETS); do \
 		BUILD_TARGET=3D$$BUILD/$$TARGET;	\
 		$(MAKE) OUTPUT=3D$$BUILD_TARGET -C $$TARGET INSTALL_PATH=3D$(INSTALL_P=
ATH)/$$TARGET install \
+				O=3D$(abs_objtree)		\
 				$(if $(FORCE_TARGETS),|| exit);	\
 		ret=3D$$((ret * $$?));		\
 	done; exit $$ret;
--=20
2.30.2

