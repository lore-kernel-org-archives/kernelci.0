From: "Guillaume Tucker" <guillaume.tucker@collabora.com>
Subject: [PATCH v2] selftests, x86: fix how check_cc.sh is being invoked
Date: Fri, 11 Mar 2022 10:05:30 +0000
Message-Id: <d0d460d7be0107a69e3c52477761a6fe694c1840.1646991629.git.guillaume.tucker@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-ID: <kernelci.groups.io>
To: Shuah Khan <shuah@kernel.org>, Andrew Morton <akpm@linux-foundation.org>
Cc: Borislav Petkov <bp@suse.de>, Dave Hansen <dave.hansen@linux.intel.com>, kernel@collabora.com, linux-mm@kvack.org, linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, kernelci@groups.io

The $(CC) variable used in Makefiles could contain several arguments
such as "ccache gcc".  These need to be passed as a single string to
check_cc.sh, otherwise only the first argument will be used as the
compiler command.  Without quotes, the $(CC) variable is passed as
distinct arguments which causes the script to fail to build trivial
programs.

Fix this by adding quotes around $(CC) when calling check_cc.sh to
pass the whole string as a single argument to the script even if it
has several words such as "ccache gcc".

Fixes: e9886ace222e ("selftests, x86: Rework x86 target architecture dete=
ction")
Tested-by: "kernelci.org bot" <bot@kernelci.org>
Signed-off-by: Guillaume Tucker <guillaume.tucker@collabora.com>
---

Notes:
    v2: rebase and drop changes in check_cc.sh

 tools/testing/selftests/vm/Makefile  | 6 +++---
 tools/testing/selftests/x86/Makefile | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/tools/testing/selftests/vm/Makefile b/tools/testing/selftest=
s/vm/Makefile
index fbccdda93629..213f6a57d7f6 100644
--- a/tools/testing/selftests/vm/Makefile
+++ b/tools/testing/selftests/vm/Makefile
@@ -54,9 +54,9 @@ TEST_GEN_FILES +=3D split_huge_page_test
 TEST_GEN_FILES +=3D ksm_tests
=20
 ifeq ($(MACHINE),x86_64)
-CAN_BUILD_I386 :=3D $(shell ./../x86/check_cc.sh $(CC) ../x86/trivial_32=
bit_program.c -m32)
-CAN_BUILD_X86_64 :=3D $(shell ./../x86/check_cc.sh $(CC) ../x86/trivial_=
64bit_program.c)
-CAN_BUILD_WITH_NOPIE :=3D $(shell ./../x86/check_cc.sh $(CC) ../x86/triv=
ial_program.c -no-pie)
+CAN_BUILD_I386 :=3D $(shell ./../x86/check_cc.sh "$(CC)" ../x86/trivial_=
32bit_program.c -m32)
+CAN_BUILD_X86_64 :=3D $(shell ./../x86/check_cc.sh "$(CC)" ../x86/trivia=
l_64bit_program.c)
+CAN_BUILD_WITH_NOPIE :=3D $(shell ./../x86/check_cc.sh "$(CC)" ../x86/tr=
ivial_program.c -no-pie)
=20
 override TARGETS :=3D protection_keys
 BINARIES_32 :=3D $(TARGETS:%=3D%_32)
diff --git a/tools/testing/selftests/x86/Makefile b/tools/testing/selftes=
ts/x86/Makefile
index 8a1f62ab3c8e..53df7d3893d3 100644
--- a/tools/testing/selftests/x86/Makefile
+++ b/tools/testing/selftests/x86/Makefile
@@ -6,9 +6,9 @@ include ../lib.mk
 .PHONY: all all_32 all_64 warn_32bit_failure clean
=20
 UNAME_M :=3D $(shell uname -m)
-CAN_BUILD_I386 :=3D $(shell ./check_cc.sh $(CC) trivial_32bit_program.c =
-m32)
-CAN_BUILD_X86_64 :=3D $(shell ./check_cc.sh $(CC) trivial_64bit_program.=
c)
-CAN_BUILD_WITH_NOPIE :=3D $(shell ./check_cc.sh $(CC) trivial_program.c =
-no-pie)
+CAN_BUILD_I386 :=3D $(shell ./check_cc.sh "$(CC)" trivial_32bit_program.=
c -m32)
+CAN_BUILD_X86_64 :=3D $(shell ./check_cc.sh "$(CC)" trivial_64bit_progra=
m.c)
+CAN_BUILD_WITH_NOPIE :=3D $(shell ./check_cc.sh "$(CC)" trivial_program.=
c -no-pie)
=20
 TARGETS_C_BOTHBITS :=3D single_step_syscall sysret_ss_attrs syscall_nt t=
est_mremap_vdso \
 			check_initial_reg_state sigreturn iopl ioperm \
--=20
2.30.2

