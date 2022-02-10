From: "Usama" <usama.anjum@collabora.com>
Subject: [PATCH 0/2] selftests: sgx: Fix build of test_sgx
Date: Fri, 11 Feb 2022 00:06:39 +0500
Message-Id: <20220210190642.1477814-1-usama.anjum@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-ID: <kernelci.groups.io>
To: Jarkko Sakkinen <jarkko@kernel.org>, Dave Hansen <dave.hansen@linux.intel.com>, Shuah Khan <shuah@kernel.org>, Andy Lutomirski <luto@kernel.org>, Borislav Petkov <bp@suse.de>, Jethro Beekman <jethro@fortanix.com>, "open list:INTEL SGX" <linux-sgx@vger.kernel.org>, "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Cc: Muhammad Usama Anjum <usama.anjum@collabora.com>, kernel@collabora.com, kernelci@groups.io

CC can have multiple sub-strings like "ccache gcc". Build system of sgx
selftest is unable to support this use case and test_sgx isn't built.
Then rsync gives an erorr:

rsync: [sender] link_stat "//linux/build/kselftest/sgx/test_sgx" failed: =
No such file or directory (2)
rsync error: some files/attrs were not transferred (see previous errors) =
(code 23) at main.c(1333) [sender=3D3.2.3]

This can be fixed if CC is considered to have one string while passing to
check_cc.sh script and inside this script, CC is expanded before executio=
n.

Following build tests have been performed to confirm that these patches
don't break anything else. The verification has also been done through
KernelCI scripts locally as KernelCI has caught this bug:
1) cd tools/testing/selftests && make
2) make -C tools/testing/selftests
3) make -C tools/testing/selftests O=3Dbuild
4) make -C tools/testing/selftests O=3Dbuild CC=3D"ccache gcc"
5) ./kci_build make_kselftest

Muhammad Usama Anjum (2):
  selftests: x86: allow expansion of $(CC)
  selftests: sgx: Treat CC as one argument

 tools/testing/selftests/sgx/Makefile    | 2 +-
 tools/testing/selftests/x86/check_cc.sh | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

--=20
2.30.2

