From: "Guillaume Tucker" <guillaume.tucker@gmail.com>
Subject: kernelci.org update - 2019-08-30
Message-ID: <3bad57ba-5f47-768e-ec76-ee021c313e1c@collabora.com>
Date: Fri, 30 Aug 2019 13:23:55 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
List-ID: <kernelci.groups.io>
To: kernelci@groups.io

Summary of changes going into production today:

kernelci-core
-------------

* general configuration:
  * stop running boot tests with clang-built kernels for now
  * remove Android kernel branches that have been retired and enable new ones

* v4l2:
  * add media device presence test to the v4l2 test plan
  * stop using "vivid.no_error_inj=1" as it's not required any more

* test devices:
  * add new Amlogic boards in lab-baylibre
  * split QEMU variants with different type names and enable more variants as a
    consolidation based on previous UEFI test plan definitions (qemu_x86_64,
    qemu_arm-virt-gicv2...)

Best wishes,
Guillaume
