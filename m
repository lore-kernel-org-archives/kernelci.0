From: "Guillaume Tucker" <guillaume.tucker@gmail.com>
Subject: kernelci.org update - 2019-12-13 #minutes
Message-ID: <dc1e39f7-b005-ec15-1928-cec52b51d0a0@collabora.com>
Date: Fri, 13 Dec 2019 21:30:36 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
List-ID: <kernelci.groups.io>
To: kernelci@groups.io

Summary of changes going into production today:

kernelci-core
-------------

* start implementing kci_rootfs to reproduce KernelCI rootfs images on the
  command line rather than requiring Jenkins

* fix QEMU on xi83 and x86_64 using the "ide" guest interface rather than
  "virtio"

* add new device type sun50i-a64-pine64-plus

* fix device type name of at91-sama5d2_xplained

* add android-5.4 branch


Best wishes,
Guillaume
