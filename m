From: "Usama" <usama.anjum@collabora.com>
Subject: [PATCH] selftests/exec: Add non-regular to TEST_GEN_PROGS
Date: Thu, 10 Feb 2022 22:13:23 +0500
Message-Id: <20220210171323.1304501-1-usama.anjum@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-ID: <kernelci.groups.io>
To: Eric Biederman <ebiederm@xmission.com>, Kees Cook <keescook@chromium.org>, Shuah Khan <shuah@kernel.org>, Andrew Morton <akpm@linux-foundation.org>
Cc: Muhammad Usama Anjum <usama.anjum@collabora.com>, kernel@collabora.com, kernelci@groups.io, "kernelci.org bot" <bot@kernelci.org>, linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org

non-regular file needs to be compiled and then copied to the output
directory. Remove it from TEST_PROGS and add it to TEST_GEN_PROGS. This
removes error thrown by rsync when non-regular object isn't found:

rsync: [sender] link_stat "/linux/tools/testing/selftests/exec/non-regula=
r" failed: No such file or directory (2)
rsync error: some files/attrs were not transferred (see previous errors) =
(code 23) at main.c(1333) [sender=3D3.2.3]

Fixes: 0f71241a8e32 ("selftests/exec: add file type errno tests")
Reported-by: "kernelci.org bot" <bot@kernelci.org>
Signed-off-by: Muhammad Usama Anjum <usama.anjum@collabora.com>
---
 tools/testing/selftests/exec/Makefile | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/exec/Makefile b/tools/testing/selfte=
sts/exec/Makefile
index 551affb437fe1..a89ba6de79870 100644
--- a/tools/testing/selftests/exec/Makefile
+++ b/tools/testing/selftests/exec/Makefile
@@ -3,8 +3,8 @@ CFLAGS =3D -Wall
 CFLAGS +=3D -Wno-nonnull
 CFLAGS +=3D -D_GNU_SOURCE
=20
-TEST_PROGS :=3D binfmt_script non-regular
-TEST_GEN_PROGS :=3D execveat load_address_4096 load_address_2097152 load=
_address_16777216
+TEST_PROGS :=3D binfmt_script
+TEST_GEN_PROGS :=3D execveat load_address_4096 load_address_2097152 load=
_address_16777216 non-regular
 TEST_GEN_FILES :=3D execveat.symlink execveat.denatured script subdir
 # Makefile is a run-time dependency, since it's accessed by the execveat=
 test
 TEST_FILES :=3D Makefile
--=20
2.30.2

