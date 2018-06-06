Return-Path: <khilman@baylibre.com>
From: "Kevin Hilman" <khilman@baylibre.com>
Subject: debian rootfs: failed networking (without initramfs)
Date: Wed, 06 Jun 2018 15:49:33 -0700
Message-ID: <7hzi07h6o2.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
List-ID: <kernelci.groups.io>
To: kernelci@groups.io

In testing the new debian rootfs images, the initrd + full.rootfs seem
to work just fine.

However, when trying the stripped down rootfs.cpio.gz as a ramdisk, it
fails to do any network init if the network drivers are built as
modules.

According to the logs[1], it looks like systemd tries to setup the
networking before all the modules are acutally loaded.  Even though the
logs indicate that both "Started" and "Starting" of kernel modules
happen earlier, I don't see kernel logs for the modules until well after
systemd has tried to init networking.

Even more fun, the rootfs doesn't have ifconfig or ip tools, so you
can't (re)configure networking manually.

Any ideas why systemd doesn't get the modules loaded in time to init
networking?

Also for reference, here's a full boot log with the initrd + pivot to
NFS[2] where you can see the modules and network init are done by the
initrd.

Kevin

[1] http://termbin.com/7ifl
[2] http://termbin.com/d960
