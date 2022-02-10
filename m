From: "Usama" <usama.anjum@collabora.com>
Subject: [PATCH V2] selftests/exec: Rename file binfmt_script to binfmt_script.py
Date: Fri, 11 Feb 2022 03:23:19 +0500
Message-Id: <20220210222319.1864680-1-usama.anjum@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-ID: <kernelci.groups.io>
To: Eric Biederman <ebiederm@xmission.com>, Kees Cook <keescook@chromium.org>, Shuah Khan <shuah@kernel.org>
Cc: Muhammad Usama Anjum <usama.anjum@collabora.com>, kernel@collabora.com, kernelci@groups.io, linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org

Rename file for readability purpose. Update its usage and references.

Signed-off-by: Muhammad Usama Anjum <usama.anjum@collabora.com>
---
This path was suggested while review of the following patch. Please
apply it after applying that one first:
	selftests/exec: Add non-regular to TEST_GEN_PROGS
Changes in V2:
	Remove changes from binfmt_script.py, they were wrong
---
 tools/testing/selftests/exec/Makefile                           | 2 +-
 .../testing/selftests/exec/{binfmt_script =3D> binfmt_script.py}  | 0
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename tools/testing/selftests/exec/{binfmt_script =3D> binfmt_script.py=
} (100%)

diff --git a/tools/testing/selftests/exec/Makefile b/tools/testing/selfte=
sts/exec/Makefile
index a89ba6de79870..a0b8688b08369 100644
--- a/tools/testing/selftests/exec/Makefile
+++ b/tools/testing/selftests/exec/Makefile
@@ -3,7 +3,7 @@ CFLAGS =3D -Wall
 CFLAGS +=3D -Wno-nonnull
 CFLAGS +=3D -D_GNU_SOURCE
=20
-TEST_PROGS :=3D binfmt_script
+TEST_PROGS :=3D binfmt_script.py
 TEST_GEN_PROGS :=3D execveat load_address_4096 load_address_2097152 load=
_address_16777216 non-regular
 TEST_GEN_FILES :=3D execveat.symlink execveat.denatured script subdir
 # Makefile is a run-time dependency, since it's accessed by the execveat=
 test
diff --git a/tools/testing/selftests/exec/binfmt_script b/tools/testing/s=
elftests/exec/binfmt_script.py
similarity index 100%
rename from tools/testing/selftests/exec/binfmt_script
rename to tools/testing/selftests/exec/binfmt_script.py
--=20
2.30.2

