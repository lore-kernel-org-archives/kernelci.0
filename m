Return-Path: <khilman@baylibre.com>
From: "Kevin Hilman" <khilman@baylibre.com>
Subject: debian rootfs for ramdisk and NFS
Date: Mon, 04 Jun 2018 13:33:58 -0700
Message-ID: <7hy3fumguh.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
List-ID: <kernelci.groups.io>
To: kernelci@groups.io
Cc: matthew.hart@linaro.org

Hi Ana,

In testing the debian rootfs images for NFS, Matt Hart and I both
noticed that the full.rootfs.tar.xz images don't work for NFS because
the systemd network init causes a (re)init of networking while actively
using an NFSroot.  This causes things to grind to a halt.

So the first question is whether anyone knows if systemd can be made
pursuaded to not try to reconfigure networking.

Ideally, we'd like a single rootfs image to be either a ramdisk, where
it might need to (re)configure networking and an NFSroot where it
definitely should not reconfigure networking.

It would be a shame to have to have different images for ramdisk vs. NFS
just for network init.

Ideas?

Kevin
