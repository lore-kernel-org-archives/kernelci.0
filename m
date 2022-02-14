From: "Usama" <usama.anjum@collabora.com>
Subject: [PATCH V2 1/2] selftests: x86: add validity check and allow field splitting
Date: Mon, 14 Feb 2022 23:41:08 +0500
Message-Id: <20220214184109.3739179-2-usama.anjum@collabora.com>
In-Reply-To: <20220214184109.3739179-1-usama.anjum@collabora.com>
References: <20220214184109.3739179-1-usama.anjum@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-ID: <kernelci.groups.io>
To: Jarkko Sakkinen <jarkko@kernel.org>, Dave Hansen <dave.hansen@linux.intel.com>, Shuah Khan <shuah@kernel.org>, Andy Lutomirski <luto@kernel.org>, Jethro Beekman <jethro@fortanix.com>, Borislav Petkov <bp@suse.de>, "open list:INTEL SGX" <linux-sgx@vger.kernel.org>, "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, David.Laight@ACULAB.COM
Cc: Muhammad Usama Anjum <usama.anjum@collabora.com>, kernel@collabora.com, kernelci@groups.io, "kernelci.org bot" <bot@kernelci.org>

Add check to test if CC has a string. CC can have multiple sub-strings
like "ccache gcc". Erorr pops up if it is treated as single string and
double quotes are used around it. This can be fixed by removing the
quotes and not treating CC as a single string.

Fixes: e9886ace222e ("selftests, x86: Rework x86 target architecture dete=
ction")
Reported-by: "kernelci.org bot" <bot@kernelci.org>
Signed-off-by: Muhammad Usama Anjum <usama.anjum@collabora.com>
---
Changes in V2:
Update if condition to check if CC has a string
---
 tools/testing/selftests/x86/check_cc.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/x86/check_cc.sh b/tools/testing/self=
tests/x86/check_cc.sh
index 3e2089c8cf549..8c669c0d662ee 100755
--- a/tools/testing/selftests/x86/check_cc.sh
+++ b/tools/testing/selftests/x86/check_cc.sh
@@ -7,7 +7,7 @@ CC=3D"$1"
 TESTPROG=3D"$2"
 shift 2
=20
-if "$CC" -o /dev/null "$TESTPROG" -O0 "$@" 2>/dev/null; then
+if [ -n "$CC" ] && $CC -o /dev/null "$TESTPROG" -O0 "$@" 2>/dev/null; th=
en
     echo 1
 else
     echo 0
--=20
2.30.2

