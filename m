From: "Usama" <usama.anjum@collabora.com>
Subject: [PATCH] selftests/exec: Rename file binfmt_script to binfmt_script.py
Date: Fri, 11 Feb 2022 00:28:45 +0500
Message-Id: <20220210192845.1533204-1-usama.anjum@collabora.com>
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
---
 tools/testing/selftests/exec/Makefile          |  2 +-
 .../exec/{binfmt_script =3D> binfmt_script.py}   | 18 +++++++++---------
 2 files changed, 10 insertions(+), 10 deletions(-)
 rename tools/testing/selftests/exec/{binfmt_script =3D> binfmt_script.py=
} (90%)

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
similarity index 90%
rename from tools/testing/selftests/exec/binfmt_script
rename to tools/testing/selftests/exec/binfmt_script.py
index 05f94a741c7aa..6f717fedc97bd 100755
--- a/tools/testing/selftests/exec/binfmt_script
+++ b/tools/testing/selftests/exec/binfmt_script.py
@@ -28,11 +28,11 @@ foreach my $a (@ARGV) {
 '''
=20
 ##
-# test - produce a binfmt_script hashbang line for testing
+# test - produce a binfmt_script.py hashbang line for testing
 #
 # @size:     bytes for bprm->buf line, including hashbang but not newlin=
e
 # @good:     whether this script is expected to execute correctly
-# @hashbang: the special 2 bytes for running binfmt_script
+# @hashbang: the special 2 bytes for running binfmt_script.py
 # @leading:  any leading whitespace before the executable path
 # @root:     start of executable pathname
 # @target:   end of executable pathname
@@ -45,7 +45,7 @@ def test(name, size, good=3DTrue, leading=3D"", root=3D=
"./", target=3D"/perl",
     global test_num, tests, NAME_MAX
     test_num +=3D 1
     if test_num > tests:
-        raise ValueError("more binfmt_script tests than expected! (want =
%d, expected %d)"
+        raise ValueError("more binfmt_script.py tests than expected! (wa=
nt %d, expected %d)"
                          % (test_num, tests))
=20
     middle =3D ""
@@ -68,7 +68,7 @@ def test(name, size, good=3DTrue, leading=3D"", root=3D=
"./", target=3D"/perl",
     if len(newline) > 0:
         buf +=3D 'echo this is not really perl\n'
=20
-    script =3D "binfmt_script-%s" % (name)
+    script =3D "binfmt_script.py-%s" % (name)
     open(script, "w").write(buf)
     os.chmod(script, 0o755)
=20
@@ -78,17 +78,17 @@ def test(name, size, good=3DTrue, leading=3D"", root=3D=
"./", target=3D"/perl",
=20
     if proc.returncode =3D=3D 0 and b'Executed interpreter' in stdout:
         if good:
-            print("ok %d - binfmt_script %s (successful good exec)"
+            print("ok %d - binfmt_script.py %s (successful good exec)"
                   % (test_num, name))
         else:
-            print("not ok %d - binfmt_script %s succeeded when it should=
 have failed"
+            print("not ok %d - binfmt_script.py %s succeeded when it sho=
uld have failed"
                   % (test_num, name))
     else:
         if good:
-            print("not ok %d - binfmt_script %s failed when it should ha=
ve succeeded (rc:%d)"
+            print("not ok %d - binfmt_script.py %s failed when it should=
 have succeeded (rc:%d)"
                   % (test_num, name, proc.returncode))
         else:
-            print("ok %d - binfmt_script %s (correctly failed bad exec)"
+            print("ok %d - binfmt_script.py %s (correctly failed bad exe=
c)"
                   % (test_num, name))
=20
     # Clean up crazy binaries
@@ -167,5 +167,5 @@ test(name=3D"two-under-leading",   size=3Dint(SIZE/2)=
, leading=3D" ")
 test(name=3D"two-under-lead-trunc-arg", size=3Dint(SIZE/2), leading=3D" =
", arg=3D" ")
=20
 if test_num !=3D tests:
-    raise ValueError("fewer binfmt_script tests than expected! (ran %d, =
expected %d"
+    raise ValueError("fewer binfmt_script.py tests than expected! (ran %=
d, expected %d"
                      % (test_num, tests))
--=20
2.30.2

