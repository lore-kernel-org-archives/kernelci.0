Subject: gtucker/kernelci-test boot bisection: kernelci-test-080-7-g27ce98d1fbec on r8a7796-m3ulcb #7105-staging
References: <5bc86345.1c69fb81.b7ce7.8d26@mx.google.com>
From: "Guillaume Tucker" <guillaume.tucker@gmail.com>
Message-ID: <4cd2591f-4c56-eecd-b599-051303d2b454@collabora.com>
Date: Thu, 18 Oct 2018 11:48:07 +0100
MIME-Version: 1.0
In-Reply-To: <5bc86345.1c69fb81.b7ce7.8d26@mx.google.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
List-ID: <kernelci.groups.io>
To: Mark Brown <broonie@sirena.org.uk>
Cc: kernelci@groups.io

A while back, Mark suggested that we add links to the good/bad
boot details on the front end like we do with boot reports.  I've
now tested this on staging, see below.

Related PR: https://github.com/kernelci/kernelci-backend/pull/82

Cheers,
Guillaume


-------- Forwarded Message --------
Subject: gtucker/kernelci-test boot bisection: kernelci-test-080-7-g27ce98d1fbec on r8a7796-m3ulcb #7105-staging
Date: Thu, 18 Oct 2018 03:41:09 -0700 (PDT)
From: kernelci.org bot <bot@kernelci.org>
To: guillaume.tucker@collabora.com

Bisection result for gtucker/kernelci-test (kernelci-test-080-7-g27ce98d1fbec) on r8a7796-m3ulcb

  Good:       8292eaa HACK disable all{yes,no,mod}config and tinyconfig
  Bad:        27ce98d NOISE Special cases aren't special enough...
  Found:      ab29996 BREAK panic in initramfs

Details:
  Good:       https://staging.kernelci.org/boot/all/job/gtucker/branch/kernelci-test/kernel/kernelci-test-080/
  Bad:        https://staging.kernelci.org/boot/all/job/gtucker/branch/kernelci-test/kernel/kernelci-test-080-7-g27ce98d1fbec/

Checks:
  revert:     PASS
  verify:     PASS

Parameters:
  Tree:       gtucker
  URL:        https://gitlab.collabora.com/gtucker/linux.git
  Branch:     kernelci-test
  Target:     r8a7796-m3ulcb
  Lab:        lab-collabora-dev
  Config:     defconfig
  Plan:       boot

Breaking commit found:

-------------------------------------------------------------------------------
commit ab299966e33c6724a9e89970a2eadfbafb97bf14
Author: Guillaume Tucker <guillaume.tucker@collabora.com>
Date:   Wed Aug 23 08:42:33 2017 +0100

    BREAK panic in initramfs

diff --git a/init/initramfs.c b/init/initramfs.c
index 1c021d5..3a89617 100644
--- a/init/initramfs.c
+++ b/init/initramfs.c
@@ -609,6 +609,9 @@ static int __init populate_rootfs(void)
 	printk(KERN_EMERG "Complex is better than complicated.\n");
 	printk(KERN_EMERG "Flat is better than nested.\n");
 #endif
+#if 1
+	panic("THIS MUST FAIL");
+#endif
 	/* If available load the bootloader supplied initrd */
 	if (initrd_start && !IS_ENABLED(CONFIG_INITRAMFS_FORCE)) {
 #ifdef CONFIG_BLK_DEV_RAM
-------------------------------------------------------------------------------


Git bisection log:

-------------------------------------------------------------------------------
git bisect start
# good: [8292eaabafb50a6ce6e83d087a9e49d92a00e721] HACK disable all{yes,no,mod}config and tinyconfig
git bisect good 8292eaabafb50a6ce6e83d087a9e49d92a00e721
# bad: [27ce98d1fbec32c3632eee462bf396814cef6633] NOISE Special cases aren't special enough...
git bisect bad 27ce98d1fbec32c3632eee462bf396814cef6633
# good: [39688a625b377903604f0ccc58546a7e1fdda888] NOISE Flat is better than nested
git bisect good 39688a625b377903604f0ccc58546a7e1fdda888
# bad: [957613fc06941008b04c7568dea47a2e6db5fa2e] NOISE Sparse is better than dense
git bisect bad 957613fc06941008b04c7568dea47a2e6db5fa2e
# bad: [ab299966e33c6724a9e89970a2eadfbafb97bf14] BREAK panic in initramfs
git bisect bad ab299966e33c6724a9e89970a2eadfbafb97bf14
# first bad commit: [ab299966e33c6724a9e89970a2eadfbafb97bf14] BREAK panic in initramfs
-------------------------------------------------------------------------------
