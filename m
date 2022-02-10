From: "Usama" <usama.anjum@collabora.com>
Subject: [PATCH V2] selftests: kvm: Remove absent target file
Date: Thu, 10 Feb 2022 22:23:51 +0500
Message-Id: <20220210172352.1317554-1-usama.anjum@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-ID: <kernelci.groups.io>
To: Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>, Peter Gonda <pgonda@google.com>
Cc: Muhammad Usama Anjum <usama.anjum@collabora.com>, kernel@collabora.com, kernelci@groups.io, "kernelci.org bot" <bot@kernelci.org>, kvm@vger.kernel.org, linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org

There is no vmx_pi_mmio_test file. Remove it to get rid of error while
creation of selftest archive:

rsync: [sender] link_stat "/kselftest/kvm/x86_64/vmx_pi_mmio_test" failed=
: No such file or directory (2)
rsync error: some files/attrs were not transferred (see previous errors) =
(code 23) at main.c(1333) [sender=3D3.2.3]

Fixes: 6a58150859fd ("selftest: KVM: Add intra host migration tests")
Reported-by: "kernelci.org bot" <bot@kernelci.org>
Signed-off-by: Muhammad Usama Anjum <usama.anjum@collabora.com>
---
Changes in V2:
Edited the subject line
---
 tools/testing/selftests/kvm/Makefile | 1 -
 1 file changed, 1 deletion(-)

diff --git a/tools/testing/selftests/kvm/Makefile b/tools/testing/selftes=
ts/kvm/Makefile
index d61286208e242..b970397f725c7 100644
--- a/tools/testing/selftests/kvm/Makefile
+++ b/tools/testing/selftests/kvm/Makefile
@@ -82,7 +82,6 @@ TEST_GEN_PROGS_x86_64 +=3D x86_64/tsc_msrs_test
 TEST_GEN_PROGS_x86_64 +=3D x86_64/vmx_pmu_msrs_test
 TEST_GEN_PROGS_x86_64 +=3D x86_64/xen_shinfo_test
 TEST_GEN_PROGS_x86_64 +=3D x86_64/xen_vmcall_test
-TEST_GEN_PROGS_x86_64 +=3D x86_64/vmx_pi_mmio_test
 TEST_GEN_PROGS_x86_64 +=3D x86_64/sev_migrate_tests
 TEST_GEN_PROGS_x86_64 +=3D x86_64/amx_test
 TEST_GEN_PROGS_x86_64 +=3D access_tracking_perf_test
--=20
2.30.2

