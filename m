References: <201806061634.w56GYbIi010936@submarine.cbg.collabora.co.uk>
Subject: local/kernelci-bisect-063 boot bisection: kernelci-test-063-7-g0cd604c06ee7 on qemu #894-local
From: "Guillaume Tucker" <guillaume.tucker@gmail.com>
Message-ID: <17a2d8a8-32d7-77e8-83e2-2a66901be686@collabora.com>
Date: Wed, 6 Jun 2018 17:48:53 +0100
MIME-Version: 1.0
In-Reply-To: <201806061634.w56GYbIi010936@submarine.cbg.collabora.co.uk>
Content-Type: multipart/mixed;
 boundary="------------D39121D7A521C81267721F9C"
Content-Language: en-US
List-ID: <kernelci.groups.io>
To: kernelci@groups.io

--------------D39121D7A521C81267721F9C
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello,

Please find below and attached a sample bisection report email as
sent from the backend.  The attached one also includes an HTML
version.  I'm now starting to run this on staging, so let me know
if you want to be receiving these and I'll add your email address
to the temporary list.

Related Github pull request:

   https://github.com/kernelci/kernelci-backend/pull/60

Best wishes,
Guillaume

------------------------------------------8<-----------------------------------

Bisection result for local/kernelci-bisect-063 (kernelci-test-063-7-g0cd604c06ee7) on qemu

   Good:       56067aa2b1c6 NOISE Simple is better than complex
   Bad:        0cd604c06ee7 NOISE Special cases aren't special enough...
   Found:      d4eaca92ba23 BREAK panic in initramfs

Checks:
   revert:     PASS
   verify:     PASS

Parameters:
   Tree:       local
   URL:        /home/gtucker/src/linux
   Branch:     kernelci-bisect-063
   Target:     qemu
   Lab:        gtucker-lava-testing
   Config:     defconfig
   Plan:       boot

Breaking commit found:

-------------------------------------------------------------------------------
commit d4eaca92ba238bd4b7d7bcab06618cd974480e2c
Author: Guillaume Tucker <guillaume.tucker@collabora.com>
Date:   Wed Aug 23 08:42:33 2017 +0100

     BREAK panic in initramfs

diff --git a/init/initramfs.c b/init/initramfs.c
index 02c08e35ad1a..c813ac723add 100644
--- a/init/initramfs.c
+++ b/init/initramfs.c
@@ -619,6 +619,9 @@ static int __init populate_rootfs(void)
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
# good: [56067aa2b1c6b3806c9ba54c9db745619ac8b610] NOISE Simple is better than complex
git bisect good 56067aa2b1c6b3806c9ba54c9db745619ac8b610
# bad: [0cd604c06ee759ed3e28b1158d31d48021e07579] NOISE Special cases aren't special enough...
git bisect bad 0cd604c06ee759ed3e28b1158d31d48021e07579
# bad: [d4eaca92ba238bd4b7d7bcab06618cd974480e2c] BREAK panic in initramfs
git bisect bad d4eaca92ba238bd4b7d7bcab06618cd974480e2c
# good: [cfb9b35c526ed3a46becc1c661c7f35717034217] NOISE Flat is better than nested
git bisect good cfb9b35c526ed3a46becc1c661c7f35717034217
# first bad commit: [d4eaca92ba238bd4b7d7bcab06618cd974480e2c] BREAK panic in initramfs
-------------------------------------------------------------------------------

--------------D39121D7A521C81267721F9C
Content-Type: message/rfc822;
 name="local/kernelci-bisect-063 boot bisection:
 kernelci-test-063-7-g0cd604c06ee7 on qemu #894-local.eml"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename*0="local/kernelci-bisect-063 boot bisection: kernelci-test-063-";
 filename*1="7-g0cd604c06ee7 on qemu #894-local.eml"

Return-Path: <gtucker-kernelci@collabora.com>
Delivered-To: gtucker@bhuna.collabora.co.uk
Received: from bhuna.collabora.co.uk
	by bhuna.collabora.co.uk (Dovecot) with LMTP id ePyuEx4NGFvefgAAdi/TOA
	for <gtucker@bhuna.collabora.co.uk>; Wed, 06 Jun 2018 17:34:38 +0100
Received: from oak.collabora.co.uk (oak.collabora.co.uk [46.235.227.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by bhuna.collabora.co.uk (Postfix) with ESMTPS id 2CA0E27BE9F
	for <guillaume.tucker@collabora.com>; Wed,  6 Jun 2018 17:34:38 +0100 (BST)
Received: from submarine.cbg.collabora.co.uk (unknown [IPv6:2a00:5f00:102:0:6dae:eb08:2e0f:5281])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by oak.collabora.co.uk (Postfix) with ESMTPS id 08728249E5D
	for <guillaume.tucker@collabora.com>; Wed,  6 Jun 2018 17:34:37 +0100 (BST)
Received: from submarine.cbg.collabora.co.uk (localhost [127.0.0.1])
	by submarine.cbg.collabora.co.uk (8.15.2/8.15.2/Debian-8) with ESMTP id w56GYbIi010936
	for <guillaume.tucker@collabora.com>; Wed, 6 Jun 2018 17:34:37 +0100
Date: Wed, 6 Jun 2018 17:34:37 +0100
Message-Id: <201806061634.w56GYbIi010936@submarine.cbg.collabora.co.uk>
Content-Type: multipart/alternative;
 boundary="===============1469146567319085661=="
MIME-Version: 1.0
X-Kernelci-Lab-Name: gtucker-lava-testing
X-Kernelci-Tree: local
X-Kernelci-Kernel: kernelci-test-063-7-g0cd604c06ee7
X-Kernelci-Report-Type: bisect
X-Kernelci-Branch: kernelci-bisect-063
Subject: local/kernelci-bisect-063 boot bisection:
 kernelci-test-063-7-g0cd604c06ee7 on qemu #894-local
To: guillaume.tucker@collabora.com
From: KernelCI debug <gtucker-kernelci@collabora.com>
X-Virus-Scanned: clamav-milter 0.99.4 at oak
X-Virus-Status: Clean
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-27CA1CFB 
X-CRM114-CacheID: sfid-20180606_173438_092888_F6CEF4BA 
X-CRM114-Status: UNSURE (  -0.65  )
X-CRM114-Notice: Please train this message. 

--===============1469146567319085661==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Bisection result for local/kernelci-bisect-063 (kernelci-test-063-7-g0cd604=
c06ee7) on qemu

  Good:       56067aa2b1c6 NOISE Simple is better than complex
  Bad:        0cd604c06ee7 NOISE Special cases aren't special enough...
  Found:      d4eaca92ba23 BREAK panic in initramfs

Checks:
  revert:     PASS
  verify:     PASS

Parameters:
  Tree:       local
  URL:        /home/gtucker/src/linux
  Branch:     kernelci-bisect-063
  Target:     qemu
  Lab:        gtucker-lava-testing
  Config:     defconfig
  Plan:       boot

Breaking commit found:

---------------------------------------------------------------------------=
----
commit d4eaca92ba238bd4b7d7bcab06618cd974480e2c
Author: Guillaume Tucker <guillaume.tucker@collabora.com>
Date:   Wed Aug 23 08:42:33 2017 +0100

    BREAK panic in initramfs

diff --git a/init/initramfs.c b/init/initramfs.c
index 02c08e35ad1a..c813ac723add 100644
--- a/init/initramfs.c
+++ b/init/initramfs.c
@@ -619,6 +619,9 @@ static int __init populate_rootfs(void)
 	printk(KERN_EMERG "Complex is better than complicated.\n");
 	printk(KERN_EMERG "Flat is better than nested.\n");
 #endif
+#if 1
+	panic("THIS MUST FAIL");
+#endif
 	/* If available load the bootloader supplied initrd */
 	if (initrd_start && !IS_ENABLED(CONFIG_INITRAMFS_FORCE)) {
 #ifdef CONFIG_BLK_DEV_RAM
---------------------------------------------------------------------------=
----


Git bisection log:

---------------------------------------------------------------------------=
----
git bisect start
# good: [56067aa2b1c6b3806c9ba54c9db745619ac8b610] NOISE Simple is better t=
han complex
git bisect good 56067aa2b1c6b3806c9ba54c9db745619ac8b610
# bad: [0cd604c06ee759ed3e28b1158d31d48021e07579] NOISE Special cases aren'=
t special enough...
git bisect bad 0cd604c06ee759ed3e28b1158d31d48021e07579
# bad: [d4eaca92ba238bd4b7d7bcab06618cd974480e2c] BREAK panic in initramfs
git bisect bad d4eaca92ba238bd4b7d7bcab06618cd974480e2c
# good: [cfb9b35c526ed3a46becc1c661c7f35717034217] NOISE Flat is better tha=
n nested
git bisect good cfb9b35c526ed3a46becc1c661c7f35717034217
# first bad commit: [d4eaca92ba238bd4b7d7bcab06618cd974480e2c] BREAK panic =
in initramfs
---------------------------------------------------------------------------=
----
--===============1469146567319085661==
Content-Type: text/html; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

<!doctype html>
<html lang=3D"en">
    <head>
      <meta charset=3D"utf-8">
      <style>
h1 {
  font-size: 1.1em;
}
h2 {
  font-size: 1.0em;
}
table {
  border: none;
}
th {
  font-weight: bold;
  padding: 4px 10px 4px 10px;
  text-align: left;
  vertical-align: bottom;
}
td {
  vertical-align: bottom;
  padding: 4px;
}
pre {
  display: inline;
}
      </style>
      <title>Bisection result for local/kernelci-bisect-063 (kernelci-test-=
063-7-g0cd604c06ee7) on qemu</title>
    </head>
    <body>
      <p>
        <h1>Bisection result for local/kernelci-bisect-063 (kernelci-test-0=
63-7-g0cd604c06ee7) on qemu</h1>
        <table>
          <tr><th>Good</th><td><pre>56067aa2b1c6 NOISE Simple is better tha=
n complex</pre></td></tr>
          <tr><th>Bad</th><td><pre>0cd604c06ee7 NOISE Special cases aren't =
special enough...</pre></td></tr>
          <tr><th>Found</th><td><pre>d4eaca92ba23 BREAK panic in initramfs<=
/pre></td></tr>
        </table>
      </p>
      <p>
        <h2>Checks:</h2>
        <table>
          <tr><th>revert</th><td>PASS</td></tr>
          <tr><th>verify</th><td>PASS</td></tr>
        </table>
      </p>
      <p>
        <h2>Parameters:</h2>
        <table>
          <tr><th>Tree</th><td>local</td></tr>
          <tr><th>URL</th><td>/home/gtucker/src/linux</td></tr>
          <tr><th>Branch</th><td>kernelci-bisect-063</td></tr>
          <tr><th>Target</th><td>qemu</td></tr>
          <tr><th>Lab</th><td>gtucker-lava-testing</td></tr>
          <tr><th>Config</th><td>defconfig</td></tr>
          <tr><th>Plan</th><td>boot</td></tr>
        </table>
      </p>
      <p>
        <h2>Breaking commit found:</h2>
        <pre>commit d4eaca92ba238bd4b7d7bcab06618cd974480e2c
Author: Guillaume Tucker <guillaume.tucker@collabora.com>
Date:   Wed Aug 23 08:42:33 2017 +0100

    BREAK panic in initramfs

diff --git a/init/initramfs.c b/init/initramfs.c
index 02c08e35ad1a..c813ac723add 100644
--- a/init/initramfs.c
+++ b/init/initramfs.c
@@ -619,6 +619,9 @@ static int __init populate_rootfs(void)
 	printk(KERN_EMERG "Complex is better than complicated.\n");
 	printk(KERN_EMERG "Flat is better than nested.\n");
 #endif
+#if 1
+	panic("THIS MUST FAIL");
+#endif
 	/* If available load the bootloader supplied initrd */
 	if (initrd_start && !IS_ENABLED(CONFIG_INITRAMFS_FORCE)) {
 #ifdef CONFIG_BLK_DEV_RAM</pre>
      </p>
      <p>
        <h2>Git bisection log:</h2>
        <pre>
git bisect start
# good: [56067aa2b1c6b3806c9ba54c9db745619ac8b610] NOISE Simple is better t=
han complex
git bisect good 56067aa2b1c6b3806c9ba54c9db745619ac8b610
# bad: [0cd604c06ee759ed3e28b1158d31d48021e07579] NOISE Special cases aren'=
t special enough...
git bisect bad 0cd604c06ee759ed3e28b1158d31d48021e07579
# bad: [d4eaca92ba238bd4b7d7bcab06618cd974480e2c] BREAK panic in initramfs
git bisect bad d4eaca92ba238bd4b7d7bcab06618cd974480e2c
# good: [cfb9b35c526ed3a46becc1c661c7f35717034217] NOISE Flat is better tha=
n nested
git bisect good cfb9b35c526ed3a46becc1c661c7f35717034217
# first bad commit: [d4eaca92ba238bd4b7d7bcab06618cd974480e2c] BREAK panic =
in initramfs</pre>
      </p>
    </body>
</html>
--===============1469146567319085661==--

--------------D39121D7A521C81267721F9C--
