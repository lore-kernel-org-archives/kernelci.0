From: "Usama" <usama.anjum@collabora.com>
Subject: [PATCH V3] selftests: vm: Add test for Soft-Dirty PTE bit
Date: Fri, 25 Feb 2022 02:23:35 +0500
Message-Id: <20220224212335.3045905-1-usama.anjum@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-ID: <kernelci.groups.io>
To: Andrew Morton <akpm@linux-foundation.org>, Shuah Khan <shuah@kernel.org>
Cc: Muhammad Usama Anjum <usama.anjum@collabora.com>, kernel@collabora.com, kernelci@groups.io, Will Deacon <will@kernel.org>, Gabriel Krisman Bertazi <krisman@collabora.com>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, linux-kselftest@vger.kernel.org

This introduces three tests:
1) Sanity check soft dirty basic semantics: allocate area, clean, dirty,
check if the SD bit flipped.
2) Check VMA reuse: validate the VM_SOFTDIRTY usage
3) Check soft-dirty on huge pages

This was motivated by Will Deacon's fix commit 912efa17e512 ("mm: proc:
Invalidate TLB after clearing soft-dirty page state"). I was tracking the
same issue that he fixed, and this test would have caught it.

Cc: Will Deacon <will@kernel.org>
Signed-off-by: Gabriel Krisman Bertazi <krisman@collabora.com>
Signed-off-by: Muhammad Usama Anjum <usama.anjum@collabora.com>
---
Changes in V3:
Move test to selftests/vm
Use kselftest macros
Minor updates to make code more maintainable
Add configurations in config file

Tests of soft dirty bit in this patch and in
selftest/vm/madv_populate.c are non-overlapping.

V2 of this patch:
https://lore.kernel.org/lkml/20210603151518.2437813-1-krisman@collabora.c=
om/
---
 tools/testing/selftests/vm/.gitignore   |   1 +
 tools/testing/selftests/vm/Makefile     |   1 +
 tools/testing/selftests/vm/config       |   2 +
 tools/testing/selftests/vm/soft-dirty.c | 238 ++++++++++++++++++++++++
 4 files changed, 242 insertions(+)
 create mode 100644 tools/testing/selftests/vm/soft-dirty.c

diff --git a/tools/testing/selftests/vm/.gitignore b/tools/testing/selfte=
sts/vm/.gitignore
index d7507f3c7c76..3cb4fa771ec2 100644
--- a/tools/testing/selftests/vm/.gitignore
+++ b/tools/testing/selftests/vm/.gitignore
@@ -29,5 +29,6 @@ write_to_hugetlbfs
 hmm-tests
 memfd_secret
 local_config.*
+soft-dirty
 split_huge_page_test
 ksm_tests
diff --git a/tools/testing/selftests/vm/Makefile b/tools/testing/selftest=
s/vm/Makefile
index 5e43f072f5b7..de9b13d018c3 100644
--- a/tools/testing/selftests/vm/Makefile
+++ b/tools/testing/selftests/vm/Makefile
@@ -47,6 +47,7 @@ TEST_GEN_FILES +=3D on-fault-limit
 TEST_GEN_FILES +=3D thuge-gen
 TEST_GEN_FILES +=3D transhuge-stress
 TEST_GEN_FILES +=3D userfaultfd
+TEST_GEN_FILES +=3D soft-dirty
 TEST_GEN_FILES +=3D split_huge_page_test
 TEST_GEN_FILES +=3D ksm_tests
=20
diff --git a/tools/testing/selftests/vm/config b/tools/testing/selftests/=
vm/config
index 60e82da0de85..be087c4bc396 100644
--- a/tools/testing/selftests/vm/config
+++ b/tools/testing/selftests/vm/config
@@ -4,3 +4,5 @@ CONFIG_TEST_VMALLOC=3Dm
 CONFIG_DEVICE_PRIVATE=3Dy
 CONFIG_TEST_HMM=3Dm
 CONFIG_GUP_TEST=3Dy
+CONFIG_TRANSPARENT_HUGEPAGE=3Dy
+CONFIG_MEM_SOFT_DIRTY=3Dy
diff --git a/tools/testing/selftests/vm/soft-dirty.c b/tools/testing/self=
tests/vm/soft-dirty.c
new file mode 100644
index 000000000000..f56c215e0ece
--- /dev/null
+++ b/tools/testing/selftests/vm/soft-dirty.c
@@ -0,0 +1,238 @@
+// SPDX-License-Identifier: GPL-2.0
+#include <stdio.h>
+#include <string.h>
+#include <stdbool.h>
+#include <fcntl.h>
+#include <stdint.h>
+#include <malloc.h>
+#include <sys/mman.h>
+#include "../kselftest.h"
+
+#define PAGEMAP_PATH		"/proc/self/pagemap"
+#define CLEAR_REFS_PATH		"/proc/self/clear_refs"
+#define SMAP_PATH		"/proc/self/smaps"
+#define PMD_SIZE_PATH		"/sys/kernel/mm/transparent_hugepage/hpage_pmd_si=
ze"
+#define MAX_LINE_LENGTH		512
+#define TEST_ITERATIONS		10000
+#define PAGE_NUM_TO_TEST	2
+
+int clear_refs;
+int pagemap;
+
+int pagesize;
+int mmap_size;	/* Size of test region */
+
+static void clear_all_refs(void)
+{
+	const char *ctrl =3D "4";
+
+	if (write(clear_refs, ctrl, strlen(ctrl)) !=3D strlen(ctrl))
+		ksft_exit_fail_msg("%s: failed to clear references\n", __func__);
+}
+
+static void touch_page(char *map, int n)
+{
+	map[(pagesize * n) + 1]++;
+}
+
+static int check_page(char *start, int page_num, int clear)
+{
+	unsigned long pfn =3D (unsigned long)start / pagesize;
+	uint64_t entry;
+	int ret;
+
+	ret =3D pread(pagemap, &entry, sizeof(entry), (pfn + page_num) * sizeof=
(entry));
+	if (ret !=3D sizeof(entry))
+		ksft_exit_fail_msg("reading pagemap failed\n");
+	if (clear)
+		clear_all_refs();
+
+	return ((entry >> 55) & 1);
+}
+
+static void test_simple(void)
+{
+	int i;
+	char *map;
+
+	map =3D aligned_alloc(pagesize, mmap_size);
+	if (!map)
+		ksft_exit_fail_msg("mmap failed\n");
+
+	clear_all_refs();
+
+	for (i =3D 0 ; i < TEST_ITERATIONS; i++) {
+		if (check_page(map, PAGE_NUM_TO_TEST, 1) =3D=3D 1) {
+			ksft_print_msg("dirty bit was 1, but should be 0 (i=3D%d)\n", i);
+			break;
+		}
+
+		touch_page(map, 2);
+
+		if (check_page(map, PAGE_NUM_TO_TEST, 1) =3D=3D 0) {
+			ksft_print_msg("dirty bit was 0, but should be 1 (i=3D%d)\n", i);
+			break;
+		}
+
+	}
+	free(map);
+
+	ksft_test_result(i =3D=3D TEST_ITERATIONS, "Test %s\n", __func__);
+}
+
+static void test_vma_reuse(void)
+{
+	char *map, *map2;
+
+	map =3D (char *) 0x900000000000;
+	map =3D mmap(map, mmap_size, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANON=
, -1, 0);
+	if (map =3D=3D MAP_FAILED)
+		ksft_exit_fail_msg("mmap failed");
+
+	clear_all_refs();
+	touch_page(map, PAGE_NUM_TO_TEST);
+
+	munmap(map, mmap_size);
+	map2 =3D mmap(map, mmap_size, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANO=
N, -1, 0);
+	if (map2 =3D=3D MAP_FAILED)
+		ksft_exit_fail_msg("mmap failed");
+
+	ksft_test_result(map =3D=3D map2, "Test %s reused memory location\n", _=
_func__);
+
+	ksft_test_result(check_page(map, PAGE_NUM_TO_TEST, 1) !=3D 0,
+			 "Test %s dirty bit of previous page\n", __func__);
+
+	munmap(map2, mmap_size);
+}
+
+/*
+ * read_pmd_pagesize(), check_for_pattern() and check_huge() adapted
+ * from 'tools/testing/selftest/vm/split_huge_page_test.c'
+ */
+static uint64_t read_pmd_pagesize(void)
+{
+	int fd;
+	char buf[20];
+	ssize_t num_read;
+
+	fd =3D open(PMD_SIZE_PATH, O_RDONLY);
+	if (fd =3D=3D -1)
+		ksft_exit_fail_msg("Open hpage_pmd_size failed\n");
+
+	num_read =3D read(fd, buf, 19);
+	if (num_read < 1) {
+		close(fd);
+		ksft_exit_fail_msg("Read hpage_pmd_size failed\n");
+	}
+	buf[num_read] =3D '\0';
+	close(fd);
+
+	return strtoul(buf, NULL, 10);
+}
+
+static bool check_for_pattern(FILE *fp, const char *pattern, char *buf)
+{
+	while (fgets(buf, MAX_LINE_LENGTH, fp) !=3D NULL) {
+		if (!strncmp(buf, pattern, strlen(pattern)))
+			return true;
+	}
+	return false;
+}
+
+static uint64_t check_huge(void *addr)
+{
+	uint64_t thp =3D 0;
+	int ret;
+	FILE *fp;
+	char buffer[MAX_LINE_LENGTH];
+	char addr_pattern[MAX_LINE_LENGTH];
+
+	ret =3D snprintf(addr_pattern, MAX_LINE_LENGTH, "%08lx-",
+		       (unsigned long) addr);
+	if (ret >=3D MAX_LINE_LENGTH)
+		ksft_print_msg("%s: Pattern is too long\n", __func__);
+
+	fp =3D fopen(SMAP_PATH, "r");
+	if (!fp)
+		ksft_print_msg("%s: Failed to open file %s\n", __func__, SMAP_PATH);
+
+	if (!check_for_pattern(fp, addr_pattern, buffer))
+		goto err_out;
+
+	/*
+	 * Fetch the AnonHugePages: in the same block and check the number of
+	 * hugepages.
+	 */
+	if (!check_for_pattern(fp, "AnonHugePages:", buffer))
+		goto err_out;
+
+	if (sscanf(buffer, "AnonHugePages:%10ld kB", &thp) !=3D 1)
+		ksft_print_msg("Reading smap error\n");
+
+err_out:
+	fclose(fp);
+
+	return thp;
+}
+
+static void test_hugepage(void)
+{
+	char *map;
+	int i, ret;
+	size_t hpage_len =3D read_pmd_pagesize();
+
+	map =3D memalign(hpage_len, hpage_len);
+	if (!map)
+		ksft_exit_fail_msg("memalign failed\n");
+
+	ret =3D madvise(map, hpage_len, MADV_HUGEPAGE);
+	if (ret)
+		ksft_exit_fail_msg("madvise failed %d\n", ret);
+
+	for (i =3D 0; i < hpage_len; i++)
+		map[i] =3D (char)i;
+
+	ksft_test_result(check_huge(map), "Test %s huge page allocation\n", __f=
unc__);
+
+	clear_all_refs();
+	for (i =3D 0 ; i < TEST_ITERATIONS ; i++) {
+		if (check_page(map, PAGE_NUM_TO_TEST, 1) =3D=3D 1) {
+			ksft_print_msg("dirty bit was 1, but should be 0 (i=3D%d)\n", i);
+			break;
+		}
+
+		touch_page(map, PAGE_NUM_TO_TEST);
+
+		if (check_page(map, PAGE_NUM_TO_TEST, 1) =3D=3D 0) {
+			ksft_print_msg("dirty bit was 0, but should be 1 (i=3D%d)\n", i);
+			break;
+		}
+	}
+
+	ksft_test_result(i =3D=3D TEST_ITERATIONS, "Test %s dirty bit\n", __fun=
c__);
+
+	munmap(map, mmap_size);
+}
+
+int main(int argc, char **argv)
+{
+	ksft_print_header();
+	ksft_set_plan(5);
+
+	pagemap =3D open(PAGEMAP_PATH, O_RDONLY);
+	if (pagemap < 0)
+		ksft_exit_fail_msg("Failed to open %s\n", PAGEMAP_PATH);
+
+	clear_refs =3D open(CLEAR_REFS_PATH, O_WRONLY);
+	if (clear_refs < 0)
+		ksft_exit_fail_msg("Failed to open %s\n", CLEAR_REFS_PATH);
+
+	pagesize =3D getpagesize();
+	mmap_size =3D 10 * pagesize;
+
+	test_simple();
+	test_vma_reuse();
+	test_hugepage();
+
+	return ksft_exit_pass();
+}
--=20
2.30.2

